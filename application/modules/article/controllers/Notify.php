<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notify extends XY_Controller {


    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model(array('notify_model'));
        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
    }
    public function index()
    {

        $this->layout->add_includes(array(
            array('type'=>'css','src'=>_ASSET_.'lib/datatables/datatables.bootstrap.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
        ));
        $data['notifys']=$this->notify_model->notifys()->result_array();
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');

        $this->layout->view('notify',$data);
    }
}
