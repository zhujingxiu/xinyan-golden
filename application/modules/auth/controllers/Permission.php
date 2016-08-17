<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Permission extends XY_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model('permission_model');
        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
    }
    public function index()
    {
        $this->layout->add_includes(array(
            array('type'=>'css','src'=>'https://cdnjs.cloudflare.com/ajax/libs/jstree/3.0.9/themes/default/style.min.css','preurl'=>false),
//            array('type'=>'css','src'=>_ASSET_.'lib/treetable/jquery.treetable.css'),
//            array('type'=>'css','src'=>_ASSET_.'lib/treetable/style.css'),
        ));
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');
        if($this->input->get('auth')){
            json_response($this->render_tree($this->permission_model->getNodeTree(null)));
        }

        $this->layout->view('permission/index',$data);
    }
    private function render_tree($nodes){

        if(is_array($nodes)){
            $data = array();
            foreach ($nodes as $key => $item) {
                $tmp = array();
                $tmp['text'] = trim($item['title']);

                if(isset($item['children']) && is_array($item['children'])){
                    $tmp['icon'] = 'jstree-folder';
                    $tmp['children'] = $this->render_tree($item['children']);
                }else{
                    $tmp['icon'] = "jstree-file";
                }
                $tmp['li_attr'] = array(
                    'node_id' => $item['node_id'],
                    'name' => $item['name'],
                    'title' => $item['title'],
                    'level' => $item['level'],
                    'p_id' => $item['p_id'],
                    'p_path' => trim($item['p_path']),
                    'path' => trim($item['path']),
                    'status' => $item['status'],
                    'auth' => $item['auth'],
                    'sort' => $item['sort'],
                );
                $tmp['id'] = $item['node_id'];
                $data[] = $tmp;
            }
            return $data;
        }
        return false;
    }
    public function delete() {
        $id = $this->input->get('node_id');
        if ($id) {
            if($this->permission_model->deleteNode($id)){
                json_response(array('code'=>1,'msg'=>'Deleted!'));
            }
        }
    }

    public function save()
    {
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            $this->form_validation->set_rules('node_id', 'Node', 'required',['required'=>'参数异常']);
            $this->form_validation->set_rules('parent_id', 'Parent', 'required',['required'=>'参数异常']);
            $this->form_validation->set_rules('name', '标识', 'trim|required');
            $this->form_validation->set_rules('title', '标题', 'trim|required');

            if ($this->form_validation->run() == TRUE)
            {
                $res = $this->permission_model->saveNode($this->input->post());
                if($res){
                    $data = array('status'=>1,'msg'=>'成功');
                }else{
                    $data = array('status'=>0,'msg'=>'错误');
                }
                json_response($data);
            }else {

                $errors = array(
                    'node_id' => form_error('node_id'),
                    'parent_id' => form_error('parent_id'),
                    'name' => form_error('name'),
                    'title' => form_error('title')
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
}
