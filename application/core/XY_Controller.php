<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class XY_Controller extends MX_Controller {
    protected $tpl_data = array();
    protected $worker;
    function __construct(){
        parent::__construct();
        $this->tpl_data['cdn_server'] = base_url();
        $this->load->driver('cache', array('adapter' => 'file'));
        $this->load->library(array('Ion_auth','Layout','Setting'));
        //$this->output->enable_profiler(TRUE);

        if($this->ion_auth->get_user_id()){
            // 登录用户信息
            $this->worker = $this->ion_auth->get_info();
            //渲染视图
            $this->layout->set_layout('main');
            $this->layout->add_includes($this->load_files());
            $this->layout->set_title('信研黄金-线下黄金交易平台');
            $this->layout->add_tpl('navbar','common/navbar',$this->navbar());
            $this->layout->add_tpl('sidebar','common/sidebar',$this->sidebar());
            $this->layout->add_tpl('controlbar','common/controlbar',$this->controlbar());
            
            $url = $this->uri->uri_string();
            if(!$this->isAllowed($url)){
                //redirect('auth/login','refresh');
                show_error('未被授权访问该页面 ['.$url.']',404,'无此权限');
            }

        }else{
            // 跳转到登录页面
            redirect('auth/login','refresh');
        }
    }

    function index(){
        $this->load->view('login', $this->tpl_data);
    }

    private function load_files()
    {
        return array(
            
            array('type'=>'css','src'=>_ASSET_.'lib/bootstrap/css/bootstrap.min.css'),
            array('type'=>'css','src'=>_ASSET_.'adminlte/css/AdminLTE.min.css'),
            array('type'=>'css','src'=>_ASSET_.'adminlte/css/skins/_all-skins.min.css'),
        );

    }

    private function navbar()
    {
        
        return ['worker'=>$this->worker];
    }

    private function sidebar()
    {
        return array('menu'=>main_menu());
    }

    private function controlbar()
    {
        return [];
    }

    public function isAllowed($path)
    {
        if($this->ion_auth->is_admin()) return TRUE;
        if(empty($path)) $path = 'home';
        $path = parse_route($path);
        $this->load->model('auth/permission_model');
        $node = $this->permission_model->get_node_by_path($path);

        if(empty($node['node_id'])) return False;

        if(!empty($node['auth']) && !empty($node['status']) && in_array($node['node_id'],$this->worker['permission'])){
            return TRUE;
        }else{
            $parents = $this->permission_model->getRecursionParentNodes($node['node_id']);

            if($parents){
                foreach($parents as $item)
                {
                    return empty($item['auth']) && !empty($item['status']);
                }
            }
            return False;
        }

    }
}