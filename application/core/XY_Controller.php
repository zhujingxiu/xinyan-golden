<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class XY_Controller extends MX_Controller {
    protected $tpl_data = array();
    protected $worker;
    protected $ajax_permission = FALSE;
    function __construct()
    {
        parent::__construct();

        $this->load->driver('cache', array('adapter' => 'file'));
        $this->load->library(array('Ion_auth','Layout','Setting'));
        $this->layout->set_vars(array('error_permission' => $this->session->flashdata('error_permission')));

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

                if($this->input->server('HTTP_X_REQUESTED_WITH') && strtolower($this->input->server('HTTP_X_REQUESTED_WITH')) == 'xmlhttprequest'){
                    $this->session->set_flashdata(array('ajax_permission'=>'未被授权访问该页面 <br> ['.$url.']'));
                }else{
                    $this->session->set_flashdata(array('error_permission'=>'未被授权访问该页面 <br> ['.$url.']'));
                    $back = $this->input->server('HTTP_REFERER') ? $this->input->server('HTTP_REFERER') : site_url();//var_dump($back);
                    redirect($back);
                }

            }
        }else{
            // 跳转到登录页面
            redirect('auth/login','refresh');
        }
    }

    function index()
    {
        $this->load->view('login', $this->tpl_data);
    }

    private function load_files()
    {
        return array(
            array('type'=>'css','src'=>_ASSET_.'lib/font-awesome/css/font-awesome.min.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/ionicons/css/ionicons.min.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/bootstrap/css/bootstrap.min.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/layer/skin/layer.css'),
            array('type'=>'css','src'=>_ASSET_.'adminlte/css/AdminLTE.min.css'),
            array('type'=>'css','src'=>_ASSET_.'adminlte/css/skins/_all-skins.min.css'),
        );

    }

    private function navbar()
    {
        return array('worker'=>$this->worker);
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

    public function inRole($role)
    {

        return array_key_exists(strtolower($role),$this->worker['roles']);
    }

    public function _get_csrf_nonce()
    {
        $this->load->helper('string');
        $key   = random_string('alnum', 8);
        $value = random_string('alnum', 20);
        $this->session->set_flashdata('csrfkey', $key);
        $this->session->set_flashdata('csrfvalue', $value);

        return array($key => $value);
    }

    public function _valid_csrf_nonce()
    {
        if ($this->input->post($this->session->flashdata('csrfkey')) !== FALSE &&
            $this->input->post($this->session->flashdata('csrfkey')) == $this->session->flashdata('csrfvalue'))
        {
            return TRUE;
        }
        return FALSE;
    }
}