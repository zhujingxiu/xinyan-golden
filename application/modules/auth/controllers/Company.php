<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/9/12 0012
 * Time: 11:41
 */
?>
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Company extends XY_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
        $this->load->model('company_model');
    }
    public function index()
    {

        $data['companies'] = $this->company_model->companies()->result_array();
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');


        $this->layout->view('company',$data);
    }


    public function save(){
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            $this->form_validation->set_rules('title', '公司名称', 'trim|required');
            if ($this->form_validation->run() == TRUE)
            {
                $this->input->post('company_id')
                ? $this->company_model->update($this->input->post('company_id'),$this->input->post())
                : $this->company_model->insert($this->input->post());

                $this->session->set_flashdata('success', lang('text_success_company'));
                json_success(array('code'=>1));
            }else{
                $errors = array(
                    'title' => form_error('title'),
                );
                json_error(array('errors' => $errors));
            }
        }else{
            $id  = $this->input->get('company_id');
            $info = $this->company_model->company($id);
            if($info->num_rows()){
                json_success(array('info'=>$info->row_array()));
            }else{
                json_error(array('msg'=>lang('error_no_company')));
            }
        }
    }

}

