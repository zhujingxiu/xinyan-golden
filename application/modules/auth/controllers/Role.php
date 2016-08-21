<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Role extends XY_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model(array('permission_model'));
        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
    }
    public function index()
    {
        $this->layout->add_includes(array(
            array('type'=>'css','src'=>_ASSET_.'lib/vakata-jstree/src/themes/default/style.css'),
        ));
        $data['groups']=$this->ion_auth->groups()->result_array();
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');
        if($this->input->get('auth')){
            json_response($this->render_tree($this->permission_model->getNodeTree(null)));
        }

        $this->layout->view('role',$data);
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

    public function check_code($id=false,$code=false,$rule=False)
    {

        $id || $id = $this->input->get('role_id');
        $code || $code = $this->input->get('check_code');

        $result = $this->ion_auth->check_code($code,$id);

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
                $id = $this->input->post('role_id');
                $name = $this->input->post('name');
                $addtional = array(
                    'is_system' => $this->input->post('is_system'),
                    'title' => $this->input->post('title'),
                    'permission' => $this->input->post('permission'),
                );
                $res = $this->ion_auth->save_group($id, $name,$addtional);
                if($res){
                    $this->session->set_flashdata('success', $this->ion_auth->messages());
                    json_response(array('code' => 1, 'success' => '成功'));
                }
            }else {

                $errors = array(
                    'title' => form_error('title'),
                    'code' => form_error('code'),
                    'permisson' => form_error('permisson'),
                );
                json_response(array('code' => 0, 'errors' => $errors));
            }
        }
    }
    public function get_info()
    {
        $id  = $this->input->get('role_id');
        $role = $this->ion_auth->group($id)->row_array();
        $worker =$this->ion_auth->get_group_users($id);
        $role['worker'] = '';
        if($worker){
            foreach($worker as $item){
                $role['worker'][] = $item['realname'];
            }
            $role['worker'] = str_truncate(implode(' , ',$role['worker'] ),30);
        }

        json_response(array('code'=>1,'info'=>$role));
    }
}
