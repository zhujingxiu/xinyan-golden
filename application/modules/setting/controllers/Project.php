<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Project extends XY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library(array('setting','form_validation'));
        $this->load->model(array('article/article_model','project_model'));
    }
    public function index()
    {
        $this->layout->add_includes(array(
            array('type'=>'css','src'=>_ASSET_.'lib/layer/skin/layer.css')
        ));
        $data['setting'] = $this->setting->get_settings_by_group('project');
        $data['privacies'] = $this->article_model->get_articles_by_code('privacy')->result_array();
        $data['investing_statuses'] = $this->project_model->statuses(array('status'=>1),'investing')->result_array();
        $data['recycling_statuses'] = $this->project_model->statuses(array('status'=>1),'recycling')->result_array();
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');

        $this->layout->view('project/index',$data);
    }

    public function save()
    {
        $setting_id = $this->setting->add_setting($this->input->post('code') , $this->input->post('value'),'project',1);

        json_response(array('code' => 1, 'msg'=>'成功','affected'=>$setting_id));

    }

    public function status_list()
    {
        $mode = $this->input->get('mode');
        $result = $this->project_model->statuses(FALSE,$mode);
        if($result){
            json_response(array('code'=>1,'info'=>$result->result_array()));
        }
        json_response(array('code'=>0,'errors'=>1));
    }

    public function save_status()
    {
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            $this->form_validation->set_rules('title', '标题', 'trim|required|min_length[2]|max_length[64]');

            $this->form_validation->set_rules('code', '标识', 'trim|required|min_length[2]');

            if ($this->form_validation->run() == TRUE)
            {
                $data = array(
                    'title' => $this->input->post('title'),
                    'code' => $this->input->post('code'),
                    'status' => $this->input->post('status'),
                    'note' => $this->input->post('note'),
                    'mode' => $this->input->post('mode')
                );

                $res = ($this->input->post('status_id') ?
                    $this->project_model->update($this->input->post('status_id'),$data) : $this->project_model->insert($data));
                if($res){
                    $this->session->set_flashdata('success', '保存成功');
                    json_response(array('code' => 1, 'success' => '成功'));
                }else {
                    $this->session->set_flashdata('warning', '参数异常');
                    json_response(array('code' => 0, 'warning' => '异常'));
                }
            }else {
                $errors = array(
                    'title' => form_error('title'),
                    'code' => form_error('code'),
                );
                json_response(array('code' => 0, 'errors' => $errors));
            }
        }
    }

    public function check_status()
    {
        $id = $this->input->get('status_id');
        $code = $this->input->get('code');
        $mode = $this->input->get('mode');
        $result = $this->project_model->code_check($code,$id,$mode);

        if($result){
            die('false');
        }else{
            die('true');
        }
    }

    public function get_status()
    {
        $id  = $this->input->get('status_id');
        $mode  = $this->input->get('mode');
        $info = $this->project_model->status($id,$mode)->row_array();
        json_response(array('code'=>1,'info'=>$info));
    }
}
