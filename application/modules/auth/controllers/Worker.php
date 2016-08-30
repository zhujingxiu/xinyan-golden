<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Worker extends XY_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
    }
    public function index()
    {
        $data['users'] = $this->ion_auth->users()->result();
        foreach ($data['users'] as $k => $user)
        {
            $data['users'][$k]->groups = $this->ion_auth->get_users_groups($user->id)->result();
        }
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');
        $data['groups']=$this->ion_auth->groups()->result_array();

        $this->isAllowed('setting/advertise/index');
        $this->layout->view('worker/list',$data);
    }

    public function check_username()
    {
        $user_id = $this->input->get('user_id');
        $username = $this->input->get('username');

        $result = $this->ion_auth->check_username($username,$user_id);

        if($result){
            die('false');
        }else{
            die('true');
        }
    }

    public function save()
    {
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            $this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[5]|max_length[16]');
            $this->form_validation->set_rules('realname', 'Realname', 'trim|required|min_length[2]|max_length[16]');
            $this->form_validation->set_rules('email', 'Email', 'trim|required|valid_email');
            if(empty($this->input->post('user_id'))){
                $this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[8]');
                $this->form_validation->set_rules('confirm', 'Password Confirmation', 'trim|required|matches[password]');
            }else if($this->input->post('password')){
                $this->form_validation->set_rules('password', $this->lang->line('edit_user_validation_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[confirm]');
                $this->form_validation->set_rules('confirm', $this->lang->line('edit_user_validation_password_confirm_label'), 'required');
            }


            if ($this->form_validation->run() == TRUE)
            {
                $id = $this->input->post('user_id');
                $email    = strtolower($this->input->post('email'));
                $identity = $this->input->post('username');
                $password = $this->input->post('password');

                $additional_data = array(
                    'realname' => $this->input->post('realname'),
                    'phone'      => $this->input->post('phone'),
                );
                if (!$this->ion_auth->logged_in()){
                    redirect("auth/login", 'refresh');
                }else if($id){
                    $user = $this->ion_auth->user($id)->row();
                    //Update the groups user belongs to
                    $groupData = $this->input->post('groups');

                    if (isset($groupData) && !empty($groupData)) {

                        $this->ion_auth->remove_from_group('', $id);

                        foreach ($groupData as $grp) {
                            $this->ion_auth->add_to_group($grp, $id);
                        }

                    }
                    $tmp['email'] = $email;
                    $tmp['username'] = $identity;
                    if($this->input->post('password')){
                        $tmp['password'] = $this->input->post('password');
                    }

                    if($this->ion_auth->update($user->id, $tmp+$additional_data))
                    {
                        $this->session->set_flashdata('success',$this->ion_auth->messages());
                        json_response(array('code'=>1)  );

                    }else{
                        $this->session->set_flashdata('warning', $this->ion_auth->errors() );
                        redirect('auth/worker', 'refresh');
                    }

                }else if($id = $this->ion_auth->register($identity, $password, $email, $additional_data)){

                    $groupData = $this->input->post('groups');

                    if ($id && isset($groupData) && !empty($groupData)) {

                        $this->ion_auth->remove_from_group('', $id);

                        foreach ($groupData as $grp) {
                            $this->ion_auth->add_to_group($grp, $id);
                        }

                    }
                    $this->session->set_flashdata('success', $this->ion_auth->messages());
                    json_response(array('code'=>1));
                }
            }else {

                $errors = array(
                    'username' => form_error('username'),
                    'realname' => form_error('realname'),
                    'password' => form_error('password'),
                    'confirm' => form_error('confirm'),
                    'email' => form_error('email'),
                );
                json_response(array('code' => 0, 'errors' => $errors));
            }
        }
    }


    public function get_info()
    {
        $id  = $this->input->get('user_id');
        $user = $this->ion_auth->user($id)->row_array();

        $user['roles'] = $this->ion_auth->get_users_groups($id)->result_array();

        json_response(array('code'=>1,'info'=>$user));
    }

    // activate the user
    public function activate($id, $code=false)
    {
        if ($code !== false)
        {
            $activation = $this->ion_auth->activate($id, $code);
        }
        else if ($this->ion_auth->is_admin())
        {
            $activation = $this->ion_auth->activate($id);
        }

        if ($activation)
        {
            // redirect them to the auth page
            $this->session->set_flashdata('message', $this->ion_auth->messages());
            redirect("auth", 'refresh');
        }
        else
        {
            // redirect them to the forgot password page
            $this->session->set_flashdata('message', $this->ion_auth->errors());
            redirect("auth/forgot_password", 'refresh');
        }
    }

    // deactivate the user
    public function deactivate($id = NULL)
    {
        if (!$this->ion_auth->logged_in() || !$this->ion_auth->is_admin())
        {
            // redirect them to the home page because they must be an administrator to view this
            return show_error('You must be an administrator to view this page.');
        }

        $id = (int) $id;

        $this->load->library('form_validation');
        $this->form_validation->set_rules('confirm', $this->lang->line('deactivate_validation_confirm_label'), 'required');
        $this->form_validation->set_rules('id', $this->lang->line('deactivate_validation_user_id_label'), 'required|alpha_numeric');

        if ($this->form_validation->run() == FALSE)
        {
            // insert csrf check
            $this->data['csrf'] = $this->_get_csrf_nonce();
            $this->data['user'] = $this->ion_auth->user($id)->row();

            $this->_render_page('auth/deactivate_user', $this->data);
        }
        else
        {
            // do we really want to deactivate?
            if ($this->input->post('confirm') == 'yes')
            {
                // do we have a valid request?
                if ($this->_valid_csrf_nonce() === FALSE || $id != $this->input->post('id'))
                {
                    show_error($this->lang->line('error_csrf'));
                }

                // do we have the right userlevel?
                if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin())
                {
                    $this->ion_auth->deactivate($id);
                }
            }

            // redirect them back to the auth page
            redirect('auth', 'refresh');
        }
    }

    public function autocomplete() {
        $json = array();
        if ($this->input->get('filter_name')) {
            $data = array(
                'filter_name' => $this->input->get('filter_name'),
                'filter_role' => $this->input->get('filter_role'),
                'start'       		=> 0,
                'limit'       		=> 20
            );
            $results = $this->ion_auth->filter_users($data);
            if($results) {
                foreach ($results as $result) {
                    $json[] = array(
                        'entry_id' => $result['id'],
                        'name' => strip_tags(html_entity_decode($result['realname'], ENT_QUOTES, 'UTF-8')),
                        'value' => $result['id']
                    );
                }
            }
        }
        $sort_order = array();
        if($json){
            foreach ($json as $key => $value) {
                $sort_order[$key] = $value['name'];
            }
            array_multisort($sort_order, SORT_ASC, $json);
            json_response($json);
        }

    }
}
