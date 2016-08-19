<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends XY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library(array('ion_auth','form_validation'));
        $this->load->helper(array('url','language'));

        $this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));

        $this->lang->load('auth');
    }

    // redirect if needed, otherwise display the user list
    public function index()
    {
        if (!$this->ion_auth->logged_in())
        {
            // redirect them to the login page
            redirect('login', 'refresh');
        }
        elseif (!$this->ion_auth->is_admin()) // remove this elseif if you want to enable this for non-admins
        {
            // redirect them to the home page because they must be an administrator to view this
            return show_error('You must be an administrator to view this page.');
        }
        else
        {
            // set the flash data error message if there is one
            $data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

            //list the users
            $data['users'] = $this->ion_auth->users()->result();
            foreach ($data['users'] as $k => $user)
            {
                $data['users'][$k]->groups = $this->ion_auth->get_users_groups($user->id)->result();
            }

            $this->layout->view('worker/profile', $data);
        }
    }

    public function check_oldpwd()
    {
        $oldpswd = $this->input->get('oldpswd');

        $result = $this->ion_auth->check_oldpwd($oldpswd);

        if($result){
            die('true');
        }else{
            die('false');
        }
    }

    // change password
    public function password()
    {
        $this->form_validation->set_rules('oldpswd', $this->lang->line('change_password_validation_old_password_label'), 'required');
        $this->form_validation->set_rules('newpswd', $this->lang->line('change_password_validation_new_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[new_confirm]');
        $this->form_validation->set_rules('confirm', $this->lang->line('change_password_validation_new_password_confirm_label'), 'required');

        if (!$this->ion_auth->logged_in())
        {
            redirect('login', 'refresh');
        }

        $user = $this->ion_auth->user()->row();

        if ($this->form_validation->run() == TRUE)
        {

            $identity = $this->session->userdata('identity');

            $change = $this->ion_auth->change_password($identity, $this->input->post('old'), $this->input->post('new'));

            if ($change)
            {
                //if the password was successfully changed
                $this->session->set_flashdata('success', $this->ion_auth->messages());
                $this->logout();
            }
            else
            {
                $this->session->set_flashdata('warning', $this->ion_auth->errors());
                redirect('auth/profile', 'refresh');
            }
        }
    }

    // edit a user
    public function save($id)
    {
        $this->data['title'] = $this->lang->line('edit_user_heading');

        if (!$this->ion_auth->logged_in() || ( !($this->ion_auth->user()->row()->id == $id)))
        {
            redirect('auth', 'refresh');
        }

        $user = $this->ion_auth->user($id)->row();
        $groups=$this->ion_auth->groups()->result_array();
        $currentGroups = $this->ion_auth->get_users_groups($id)->result();

        // validate form input
        $this->form_validation->set_rules('realname', $this->lang->line('edit_user_validation_fname_label'), 'required');
        $this->form_validation->set_rules('email', $this->lang->line('edit_user_validation_lname_label'), 'required');
        $this->form_validation->set_rules('phone', $this->lang->line('edit_user_validation_phone_label'), 'required');

        if (isset($_POST) && !empty($_POST))
        {
            // do we have a valid request?
            if ($this->_valid_csrf_nonce() === FALSE || $id != $this->input->post('id'))
            {
                show_error($this->lang->line('error_csrf'));
            }

            if ($this->form_validation->run() === TRUE)
            {
                $data = array(
                    'realname' => $this->input->post('realname'),
                    'email'  => $this->input->post('email'),
                    'phone'      => $this->input->post('phone'),
                );

                // update the password if it was posted
                if ($this->input->post('password'))
                {
                    $data['password'] = $this->input->post('password');
                }

                // check to see if we are updating the user
                if($this->ion_auth->update($user->id, $data))
                {
                    // redirect them back to the admin page if admin, or to the base url if non admin
                    $this->session->set_flashdata('message', $this->ion_auth->messages() );
                    if ($this->ion_auth->is_admin())
                    {
                        redirect('auth', 'refresh');
                    }
                        redirect('/', 'refresh');
                }
                else
                {
                    // redirect them back to the admin page if admin, or to the base url if non admin
                    $this->session->set_flashdata('message', $this->ion_auth->errors() );
                    if ($this->ion_auth->is_admin())
                    {
                        redirect('auth', 'refresh');
                    }
                        redirect('/', 'refresh');
                }
            }
        }

        // display the edit user form
        $this->data['csrf'] = $this->_get_csrf_nonce();

        // set the flash data error message if there is one
        $this->data['message'] = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata('message')));

        // pass the user to the view
        $this->data['user'] = $user;
        $this->data['groups'] = $groups;
        $this->data['currentGroups'] = $currentGroups;


        $this->_render_page('auth/edit_user', $this->data);
    }

    public function avatar()//I think this makes more sense
    {
        if($this->input->server('REQUEST_METHOD') == 'POST') {
            $this->form_validation->set_rules('avatar', '头像', 'required');

            if ($this->form_validation->run() === TRUE) {
                if($this->ion_auth->update_avatar( $this->input->post('avatar'))){
                    json_response(array('code' =>1, 'msg' => '成功'));
                }

            }
        }
        json_response(array('code' =>0, 'msg' => '参数异常'));
    }




}
