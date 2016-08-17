<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Category extends XY_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model(array('article_model'));
        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
    }
    public function index()
    {

        $data['categories']=$this->article_model->get_categories()->result_array();
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');

        $this->layout->view('category',$data);
    }

    public function check_code($id=false,$code=false,$rule=False)
    {

        $id || $id = $this->input->get('category_id');
        $code || $code = $this->input->get('code');

        $result = $this->article_model->code_check($code,$id);

        if($rule) {
            return $result ? false : true;
        }
        if($result){
            die('false');
        }else{
            die('true');
        }
    }

    public function save()
    {
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            $this->form_validation->set_rules('title', '标题', 'trim|required|min_length[2]|max_length[16]');

            $this->form_validation->set_rules('code', '标识', 'trim|required|min_length[2]');

            if ($this->form_validation->run() == TRUE)
            {

                $data = array(
                    'title' => $this->input->post('title'),
                    'code' => $this->input->post('code'),
                );
                $res = $this->input->post('category_id') ? 
                			$this->article_model->update_category($this->input->post('category_id'),$data) : $this->article_model->insert_category($data);
                if($res){
                    $this->session->set_flashdata('success', '保存成功');
                    json_response(array('code' => 1, 'success' => '成功'));
                }else
                {
                	$this->session->set_flashdata('warning', '参数异常');
                    json_response(array('code' => 1, 'success' => '成功'));
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
    public function get_info()
    {
        $id  = $this->input->get('category_id');
        $info = $this->article_model->category($id)->row_array();


        json_response(array('code'=>1,'info'=>$info));
    }
}
