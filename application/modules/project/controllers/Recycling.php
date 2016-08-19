<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Recycling extends XY_Controller {
    private $mode = 'recycling';
    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model(array('investing_model'));
        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
    }
    public function index()
    {
        $this->layout->add_includes(array(
            array('type'=>'css','src'=>_ASSET_.'lib/datatables/dataTables.bootstrap.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/layer/skin/layer.css'),
        ));
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');
        if($this->input->get('list')){
            json_response($this->_list());
        }
        $this->layout->view('recycling/list',$data);
    }

    private function _list()
    {
        $rows = array();
        $result = $this->investing_model->projects()->result_array();
        $total = count($result);
        if($total){
            foreach($result as $row){
                $rows[] = array(
                    '<label class="label label-primary">'.$row['status'].'</label>',
                    $row['project_sn'],
                    $row['realname'],
                    $row['phone'],
                    $row['price'],
                    $row['weight'],
                    $row['period'].'个月',
                    $row['amount'],
                    date('Y-m-d H:i',$row['addtime']),
                );
            }
        }
        return array(
            'draw' 				=> 1,
            'recordsTotal' 		=> $total,
            'recordsFiltered' 	=> $total,
            'data' => $rows
        );

    }

    public function applying_form()
    {
        $id = $this->input->get('project');
        $title = '添加项目';

        $info = array(
            'project_id' => '',
            'project_sn' => 0,
            'text' => '',
            'is_top' => 0,
            'status' => 1
        );

        $result = $this->investing_model->project($id)->row_array();

        if($result){
            $info = $result;
            $title = '编辑项目 '.$info['realname'].':'.$info['project_sn'];
        }
        $info['profit'] = (float)($this->config->item('profit')/(12*100));
        $info['privacy'] = $this->config->item('investing_privacy');
        if($info['privacy']){
            $this->load->model('article/article_model');
            $article = $this->article_model->article($info['privacy'])->row_array();
            if(!empty($article['title'])) {
                $info['agree'] = sprintf('我已阅读并同意《%s》', anchor('#', $article['title'], 'target="_blank"'));
            }else{
                $info['agree'] = '';
            }
        }
        $form = $this->load->view('investing/apply',$info,TRUE);

        json_response(array('code'=>1,'title'=>$title,'html'=>$form));
    }

    public function applied()
    {
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            $this->form_validation->set_rules('price', '实时金价', 'required');
            $this->form_validation->set_rules('weight', '购买克重', 'required');
            $this->form_validation->set_rules('realname', '真实姓名', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');
            $this->form_validation->set_rules('idnumber', '身份证号', 'required');
            if($this->config->item('investing_privacy')){
                $this->form_validation->set_rules('agree', '同意协议', 'required',array('required'=>'必须同意该条款协议'));
            }
            if ($this->form_validation->run() == TRUE)
            {

                if($this->investing_model->insert($this->input->post())){
                    $this->session->set_flashdata('success', '项目添加成功！');
                    json_response(array('code' => 1, 'success' => '成功'));
                }
            }else {

                $errors = array(
                    'price' => form_error('price'),
                    'weight' => form_error('weight'),
                    'realname' => form_error('realname'),
                    'phone' => form_error('phone'),
                    'idnumber' => form_error('idnumber'),
                );
                if($this->config->item('investing_privacy')){
                    $errors['agree'] = form_error('agree');
                }
                json_response(array('code' => 0, 'errors' => $errors));
            }
        }
    }

    public function appraising_form()
    {

    }
    public function appraised()
    {

    }
    public function agreeing_form()
    {

    }
    public function agreed()
    {

    }
    public function checking_form()
    {

    }
    public function checked()
    {

    }
    public function confirming_form()
    {

    }
    public function confirmed()
    {

    }

    public function certificating_form()
    {

    }
    public function certificated()
    {

    }

    public function taking_form()
    {

    }
    public function taken()
    {

    }
}
