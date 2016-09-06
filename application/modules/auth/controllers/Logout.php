<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logout extends MX_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library(array('ion_auth'));
        $this->load->helper(array('url','language'));
        $this->load->model(array('project/recycling_model','project/investing_model'));

    }

    public function index()
    {
        $this->recycling_model->reset_locker();
        $this->investing_model->reset_locker();
        $logout = $this->ion_auth->logout();

        // redirect them to the login page
        $this->session->set_flashdata('message', $this->ion_auth->messages());
        redirect('auth/login', 'refresh');
    }
}
