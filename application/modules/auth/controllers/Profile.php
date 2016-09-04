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
            redirect('auth/login', 'refresh');
        }
        else
        {
            $data['success'] = $this->session->flashdata('message');
            $data['warning'] = validation_errors();

            //list the users
            $data['users'] = $this->ion_auth->users()->result();
            foreach ($data['users'] as $k => $user)
            {
                $data['users'][$k]->groups = $this->ion_auth->get_users_groups($user->id)->result();
            }
            $data['activity'] = $this->message->worker_activities(10);
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
            redirect('auth/login', 'refresh');
        }

        $user = $this->ion_auth->user()->row();

        if ($this->form_validation->run() == TRUE)
        {

            $identity = $this->session->userdata('identity');

            $change = $this->ion_auth->change_password($identity, $this->input->post('old'), $this->input->post('new'));

            if ($change)
            {
                $this->message->add_activity($user->realname.' 于 '.date('Y-m-d H:i:s').' 更新了密码',$this->ion_auth->get_user_id());
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
    public function save()
    {
        $id = $this->ion_auth->get_user_id();
        if (!$this->ion_auth->logged_in() || ( !($this->ion_auth->user()->row()->id == $id)))
        {
            redirect('auth/login', 'refresh');
        }

        $user = $this->ion_auth->user($id)->row();

        // validate form input
        $this->form_validation->set_rules('realname', $this->lang->line('edit_user_validation_fname_label'), 'required');
        $this->form_validation->set_rules('email', $this->lang->line('edit_user_validation_lname_label'), 'required');
        $this->form_validation->set_rules('phone', $this->lang->line('edit_user_validation_phone_label'), 'required');

        if($this->input->server('REQUEST_METHOD') == 'POST')
        {
            // do we have a valid request?
            if ($this->_valid_csrf_nonce() === FALSE )
            {
                //json_error(array('msg'=>$this->lang->line('error_csrf')));
            }
            //$this->ion_auth->set_hook('post_update_user', 'update_profile', 'Message', 'add_activity', array($user->realname.' 于 '.date('Y-m-d H:i:s').' 更新了个人资料'));

            if ($this->form_validation->run() === TRUE)
            {
                $data = array(
                    'realname' => $this->input->post('realname'),
                    'email'  => $this->input->post('email'),
                    'phone'      => $this->input->post('phone'),
                    'wechat'      => $this->input->post('wechat'),
                    'qq'      => $this->input->post('qq'),
                );

                // check to see if we are updating the user
                if($this->ion_auth->update($id, $data))
                {
                    $this->message->add_activity($user->realname.' 于 '.date('Y-m-d H:i:s').' 更新了个人资料',$this->ion_auth->get_user_id());

                    $this->session->set_flashdata('success', $this->ion_auth->messages() );
                    json_success();
                }
                else
                {
                    $this->session->set_flashdata('warning', $this->ion_auth->errors() );
                    json_error();
                }
            }
        }
    }

    public function avatar()//I think this makes more sense
    {
        if($this->input->server('REQUEST_METHOD') == 'POST') {


            $this->form_validation->set_rules('avatar', '头像', 'required');

            if ($this->form_validation->run() === TRUE) {
                $user = $this->ion_auth->user($this->ion_auth->get_user_id())->row();
                if(!$user){
                    json_error();
                }
                if($this->ion_auth->update_avatar( $this->input->post('avatar'))){
                    $this->message->add_activity($user->realname.' 于 '.date('Y-m-d H:i:s').' 更新了个人资料',$this->ion_auth->get_user_id());
                    $this->session->set_flashdata('success', '头像修改成功' );
                    json_success();
                }
            }
        }
        json_error();
    }
}
