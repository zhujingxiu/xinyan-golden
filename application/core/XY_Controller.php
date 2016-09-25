<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class XY_Controller extends MX_Controller {
    protected $tpl_data = array();
    protected $worker;
    protected $worker_id = FALSE;
    protected $company_id = FALSE;
    protected $ajax_permission = FALSE;
    protected $current_url = FALSE;
    protected $module = FALSE;
    protected $login_page = 'landing';
    function __construct()
    {
        parent::__construct();
        $this->load->driver('cache', array('adapter' => 'file'));
        $this->load->library(array('Ion_auth','Layout','Setting','Message'));
        $this->lang->load('default');
        $this->load->model('tool/tool_model');
        $this->layout->set_vars(array(
            'error_permission' => $this->session->flashdata('error_permission')
        ));
        if($this->ion_auth->get_user_id()){
            // 登录用户信息
            $this->worker = $this->ion_auth->get_info();
            $this->worker_id = $this->worker['id'];
            $this->company_id = $this->worker['company_id'];
            $this->module = $this->uri->segment(1);

            $url = strtolower($this->uri->uri_string());
            if($this->uri->rsegment(3)){
                $url = strtolower(substr($url,0,stripos($url,'/'.$this->uri->rsegment(3))));
            }else if($this->uri->rsegment(2)){
                $_segment = $this->uri->segment_array();
                $_rsegment = $this->uri->rsegment_array();
                if(array_diff($_rsegment,$_segment)){
                    $url = $this->module.'/'.implode('/',$_rsegment);
                }else{
                    $url = implode('/',array_unique(array_merge($_segment,$_rsegment) ));
                }
            }else{
                $url = strtolower($this->uri->ruri_string());
            }
            $this->current_url = $url;
            if(!$this->isAllowed($url)){

                if($this->input->server('HTTP_X_REQUESTED_WITH') && strtolower($this->input->server('HTTP_X_REQUESTED_WITH')) == 'xmlhttprequest'){
                    $this->session->set_flashdata(array('ajax_permission'=>lang('error_no_permission').' <br> ['.$url.']'));
                }else{
                    //$this->layout->view('errors/html/error_general');return FALSE;
                    $this->session->set_flashdata(array('error_permission'=>lang('error_no_permission').' <br> ['.$url.']'));
                    $back = $this->input->server('HTTP_REFERER') ? $this->input->server('HTTP_REFERER') : site_url();//var_dump(FALSE);
                    redirect($back);
                }
            }
            //渲染视图
            $this->layout->set_layout('main');
            $this->layout->add_includes($this->load_files());
            $this->layout->set_title($this->config->item('site_title'));
            $this->layout->add_tpl('navbar','common/navbar',$this->navbar());
            $this->layout->add_tpl('sidebar','common/sidebar',$this->sidebar());
            $this->layout->add_tpl('controlbar','common/controlbar',$this->controlbar());
        }else{
            // 跳转到登录页面
            $this->worker_id = FALSE;
            redirect($this->login_page,'refresh');
        }
    }

    function index()
    {
        $this->load->view('login', $this->tpl_data);
    }

    public function current_price()
    {
        $current = $this->tool_model->gold_price();
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
            array('type'=>'css','src'=>_ASSET_.'lib/bootstrap/css/bootstrap.min.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/layer/skin/layer.css'),
            array('type'=>'css','src'=>_ASSET_.'adminlte/css/AdminLTE.min.css'),
            array('type'=>'css','src'=>_ASSET_.'adminlte/css/skins/_all-skins.min.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/jquery-ui/jquery-ui.min.css'),
        );
    }

    private function navbar()
    {
        return array('worker'=>$this->worker);
    }

    private function sidebar()
    {
        return array('menu'=>$this->main_menu(),'price'=>$this->current_price(),'fast_project'=>$this->inRole('booker'));
    }

    private function controlbar()
    {
        return array();
    }

    public function isAllowed($path)
    {
        if($this->ion_auth->is_admin()) return TRUE;
        if(empty($path)) $path = 'home/index';
        $this->load->model('auth/permission_model');
        $node = $this->permission_model->get_node_by_path(trim($path,'/'));

        if(empty($node['node_id']) || empty($node['status'])){
            return False;
        }
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

    public function group_users($code,$company=FALSE){
        return $this->ion_auth->group_users($code,$company);
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

    private function main_menu()
    {
        $this->load->model('tool/dashboard_model');
        $module = strtolower($this->module);
        $current = strtolower($this->current_url);
        return array(
            'dashbord' => array(
                'text' => '控制面板',
                'icon' => '<i class="fa fa-dashboard"></i>',
                'style'=> $module=='home'?' active':'',
                'link' => '/',
            ),
            'project'  => array(
                'text' => '项目列表',
                'icon' => '<i class="fa fa-cubes"></i>',
                'style'=> 'treeview'.($module=='project'?' active':''),
                'widget'=>array(
                    call_user_func_array(array($this->dashboard_model,'widget_expiring'),array('all')),
                    call_user_func_array(array($this->dashboard_model,'widget_today'),array('all')),
                    call_user_func_array(array($this->dashboard_model,'widget_pending'),array('all')),
                ),
                'path' =>'',
                'children' => array(

                    'recycling' => array(
                        'text' => '金生金',
                        'link' => 'project/recycling',
                        'auth' => $this->isAllowed('project/recycling/index'),
                        'style' => in_array($current,array('project/recycling','project/recycling/index')) ? ' active':'',
                        'widget'=>array(

                            call_user_func_array(array($this->dashboard_model,'widget_pending'),array('recycling')),
                        ),
                    ),
                    'investing' => array(
                        'text' => '钱生金',
                        'link' => 'project/investing',
                        'auth' => $this->isAllowed('project/investing/index'),
                        'style' => in_array($current,array('project/investing','project/investing/index')) ? ' active':'',
                        'widget'=>array(

                            call_user_func_array(array($this->dashboard_model,'widget_pending'),array('investing')),
                        ),
                    ),
                    'customer' => array(
                        'text' => '客户管理',
                        'link' => 'project/customer',
                        'auth' => $this->isAllowed('project/customer/index'),
                        'style' => in_array($current,array('project/customer','project/customer/index')) ? ' active':'',
                        'widget'=>array(
                            call_user_func_array(array($this->dashboard_model,'widget_appling'),array('all')),
                        ),
                    ),
                    'stock' => array(
                        'text' => '金库',
                        'link' => 'project/stock',
                        'auth' => $this->isAllowed('project/stock/index'),
                        'style' => in_array($current,array('project/stock','project/stock/index')) ? ' active':'',
                        'widget'=>array(

                            call_user_func_array(array($this->dashboard_model,'widget_expiring'),array('all')),
                        ),
                    ),
                    'trash' => array(
                        'text' => '回收站',
                        'link' => 'project/trash',
                        'auth' => $this->isAllowed('project/trash/index'),
                        'style' => in_array($current,array('project/trash','project/trash/index')) ? ' active':''
                    ),

                )
            ),
            'article'  => array(
                'text' => '文章管理',
                'icon' => '<i class="fa fa-files-o"></i>',
                'style'=> 'treeview'.($module=='article'?' active':''),
                'path' =>'',
                'children' => array(
                    'article' => array(
                        'text' => '文章列表',
                        'link' => 'article/article',
                        'auth' => $this->isAllowed('article/article/index'),
                        'style' => in_array($current,array('article/article','article/article/index')) ? ' active':''
                    ),

                    'category' => array(
                        'text' => '文章分类',
                        'link' => 'article/category',
                        'auth' => $this->isAllowed('article/category/index'),
                        'style' => in_array($current,array('article/category','article/category/index')) ? ' active':''
                    ),
                )
            ),
            'setting'  => array(
                'text' => '选项设定',
                'icon' => '<i class="fa fa-cogs"></i>',
                'style'=> 'treeview'.($module=='setting'?' active':''),
                'path' =>'',
                'children' => array(
                    'system' => array(
                        'text' => '系统参数',
                        'link' => 'setting/system',
                        'auth' => $this->isAllowed('setting/system/index'),
                        'style' => in_array($current,array('setting/system','setting/system/index')) ? ' active':''
                    ),
                    'project' => array(
                        'text' => '业务参数',
                        'link' => 'setting/project',
                        'auth' => $this->isAllowed('setting/project/index'),
                        'style' => in_array($current,array('setting/project','setting/project/index')) ? ' active':''
                    ),
                    'api' => array(
                        'text' => 'API',
                        'link' => 'setting/api',
                        'auth' => $this->isAllowed('setting/api/index'),
                        'style' => in_array($current,array('setting/api','setting/api/index')) ? ' active':''
                    ),
                )
            ),
            'auth'  => array(
                'text' => '员工管理',
                'icon' => '<i class="fa fa-user"></i>',
                'style'=> 'treeview'.($module=='auth'?' active':''),
                'path' =>'',
                'children' => array(
                    'worker' => array(
                        'text' => '员工列表',
                        'link' => 'auth/worker',
                        'auth' => $this->isAllowed('auth/worker/index'),
                        'style' => in_array($current,array('auth/worker','auth/worker/index')) ? ' active':''
                    ),
                    'role' => array(
                        'text' => '角色管理',
                        'link' => 'auth/role',
                        'auth' => $this->isAllowed('auth/role/index'),
                        'style' => in_array($current,array('auth/role','auth/role/index')) ? ' active':''
                    ),
                    'permission' => array(
                        'text' => '权限节点',
                        'link' => 'auth/permission',
                        'auth' => $this->isAllowed('auth/permission/index'),
                        'style' => in_array($current,array('auth/permission','auth/permission/index')) ? ' active':''
                    ),
                )
            ),
            'document' => array(
                'text' => '帮助文档',
                'icon' => '<i class="fa fa-book"></i>',
                'style'=> 'treeview'.($module=='document'?' active':''),
                'path' => '',
                'children' => array(
                    'multiupload' => array(
                        'text' => 'Multi-Upload',
                        'link' => 'tool/document/multi_upload',
                        'auth' => $this->isAllowed('tool/document/multi_upload'),
                        'style' => in_array($current,array('tool/document/multi_upload','help/index')) ? ' active':''
                    )
                )
            ),
        );
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