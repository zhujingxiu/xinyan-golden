<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class XY_Controller extends MX_Controller {
    protected $tpl_data = array();
    protected $worker;
    protected $ajax_permission = FALSE;
    protected $current_url = FALSE;
    protected $module = FALSE;
    function __construct()
    {
        parent::__construct();
        $this->load->driver('cache', array('adapter' => 'file'));
        $this->load->library(array('Ion_auth','Layout','Setting'));
        $this->lang->load('default');
        $this->load->model('tool/tool_model');
        $this->layout->set_vars(array(
            'error_permission' => $this->session->flashdata('error_permission')
        ));
        if($this->ion_auth->get_user_id()){
            // 登录用户信息
            $this->worker = $this->ion_auth->get_info();

            $this->module = $this->uri->segment(1);
            $url = strtolower($this->uri->uri_string());
            if($this->uri->rsegment(3)){
                $url = strtolower(substr($url,0,stripos($url,'/'.$this->uri->rsegment(3))));
            }
            $this->current_url = $url;
            if(!$this->isAllowed($url)){

                if($this->input->server('HTTP_X_REQUESTED_WITH') && strtolower($this->input->server('HTTP_X_REQUESTED_WITH')) == 'xmlhttprequest'){
                    $this->session->set_flashdata(array('ajax_permission'=>lang('error_no_permission').' <br> ['.$url.']'));
                }else{
                    //$this->layout->view('errors/html/error_general');return FALSE;
                    $this->session->set_flashdata(array('error_permission'=>lang('error_no_permission').' <br> ['.$url.']'));
                    $back = $this->input->server('HTTP_REFERER') ? $this->input->server('HTTP_REFERER') : site_url();//var_dump($back);
                    redirect($back);
                }
            }
            //渲染视图
            $this->layout->set_layout('main');
            $this->layout->add_includes($this->load_files());
            $this->layout->set_title('信研黄金-线下黄金交易平台');
            $this->layout->add_tpl('navbar','common/navbar',$this->navbar());
            $this->layout->add_tpl('sidebar','common/sidebar',$this->sidebar());
            $this->layout->add_tpl('controlbar','common/controlbar',$this->controlbar());
        }else{
            // 跳转到登录页面
            redirect('auth/login','refresh');
        }
    }

    function index()
    {
        $this->load->view('login', $this->tpl_data);
    }

    public function current_price()
    {
        if(date('w') ==0 || date('w') ==6){
            $current = $this->tool_model->lastprice();
        }else{
            $tmp = FALSE;
            $data = $this->setting->get_setting('golden_price');
            if(!empty($data['apikey']) && !empty($data['apiurl'])){
                $result = curl_get($data['apiurl'],array('appkey'=>$data['apikey']));
                $jsonarr = json_decode($result, true);
                if($jsonarr['status'] == 0)
                {
                    $tmp =$jsonarr['result'];
                }
            }
            $current = $this->tool_model->gold_price($tmp);
        }
        if($current)
            return number_format($current,2);
        return FALSE;
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
        return array('menu'=>main_menu($this->module,$this->current_url),'price'=>$this->current_price());
    }

    private function controlbar()
    {
        return array();
    }

    public function isAllowed($path)
    {
        if($this->ion_auth->is_admin()) return TRUE;
        if(empty($path)) $path = 'home';
        $this->load->model('auth/permission_model');
        $node = $this->permission_model->get_node_by_path($path);
        if(empty($node['node_id']) || empty($node['status']))
            return False;

        if(empty($node['auth'])){
            return TRUE;
        }else if(in_array($node['node_id'],$this->worker['permission'])){
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

    public function group_users($code){
        return $this->Ion_auth->group_users($code);
    }

    public function inRole($role=array())
    {
        if(is_array($role)){
            foreach($role as $item){
                if(in_array(strtolower($item),array_keys($this->worker['roles']))){
                    return True;
                }
            }
            return False;
        }else{
            return array_key_exists(strtolower($role),$this->worker['roles']);
        }
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
        $key = $this->session->flashdata('csrfkey');
        $value = $this->session->flashdata('csrfvalue');

        if ($this->input->post($key) !== FALSE && $this->input->post($key) == $value)
        {
            return TRUE;
        }
        return FALSE;
    }
}