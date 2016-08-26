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
        $this->lang->load('default');
        $this->load->model('tool/tool_model');
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
                    $this->session->set_flashdata(array('ajax_permission'=>lang('error_no_permission').' <br> ['.$url.']'));
                }else{
                    $this->session->set_flashdata(array('error_permission'=>lang('error_no_permission').' <br> ['.$url.']'));
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

    public function current_price()
    {
        $data = $this->setting->get_setting('golden_price');
        if(empty($data['apikey']) || empty($data['apiurl'])){
            return FALSE;
        }

        $result = true ?
            '{"status":"0","msg":"ok","result":[{"type":"Au(T+D)","typename":"黄金延期","price":"284.61","openingprice":"283.88","maxprice":"284.65","minprice":"282.81","changepercent":"-0.03%","lastclosingprice":"284.69","tradeamount":"47184.0000","updatetime":"2016-08-26 15:29:56"},{"type":"Au99.99","typename":"沪金99","price":"284.85","openingprice":"284.20","maxprice":"284.90","minprice":"283.22","changepercent":"-0.01%","lastclosingprice":"284.89","tradeamount":"22441.9200","updatetime":"2016-08-26 15:29:58"},{"type":"Au(T+N2)","typename":"延期双金","price":"284.95","openingprice":"284.00","maxprice":"285.25","minprice":"283.80","changepercent":"-0.11%","lastclosingprice":"285.25","tradeamount":"8534.6000","updatetime":"2016-08-26 15:27:34"},{"type":"Au(T+N1)","typename":"延期单金","price":"287.00","openingprice":"286.10","maxprice":"287.10","minprice":"285.15","changepercent":"0.07%","lastclosingprice":"286.80","tradeamount":"8056.2000","updatetime":"2016-08-26 15:28:22"},{"type":"mAu(T+D)","typename":"迷你黄金延期","price":"284.75","openingprice":"284.25","maxprice":"284.80","minprice":"283.05","changepercent":"-0.01%","lastclosingprice":"284.79","tradeamount":"6733.8000","updatetime":"2016-08-26 15:29:57"},{"type":"Au99.95","typename":"沪金95","price":"284.65","openingprice":"248.99","maxprice":"284.65","minprice":"248.99","changepercent":"0.09%","lastclosingprice":"284.40","tradeamount":"518.0000","updatetime":"2016-08-26 15:29:58"},{"type":"Pt99.95","typename":"沪铂95","price":"245.75","openingprice":"245.00","maxprice":"245.75","minprice":"245.00","changepercent":"-0.08%","lastclosingprice":"245.95","tradeamount":"184.0000","updatetime":"2016-08-26 15:29:58"},{"type":"Au100g","typename":"沪金100G","price":"285.00","openingprice":"284.50","maxprice":"285.00","minprice":"283.20","changepercent":"0.18%","lastclosingprice":"284.50","tradeamount":"26.0000","updatetime":"2016-08-26 15:29:58"},{"type":"iAu100g","typename":"IAU100G","price":"283.80","openingprice":"280.00","maxprice":"283.80","minprice":"280.00","changepercent":"10.43%","lastclosingprice":"257.00","tradeamount":"0.6000","updatetime":"2016-08-26 15:29:58"},{"type":"iAu99.99","typename":"IAU99.99","price":"283.96","openingprice":"284.01","maxprice":"284.01","minprice":"283.96","changepercent":"-0.12%","lastclosingprice":"284.30","tradeamount":"0.0400","updatetime":"2016-08-26 15:29:58"},{"type":"iAu99.5","typename":"IAU99.5","price":"0.00","openingprice":"0.00","maxprice":"0.00","minprice":"0.00","changepercent":"0.00%","lastclosingprice":"237.80","tradeamount":"0.0000","updatetime":"2016-08-26 15:29:58"}]}'
            :curl_get($data['apiurl'],array('appkey'=>$data['apikey']));

        $jsonarr = json_decode($result, true);

        if($jsonarr['status'] != 0)
        {
            return FALSE;
        }

        $current = $this->tool_model->gold_price($jsonarr['result']);
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
        return array('menu'=>main_menu(),'price'=>$this->current_price());
    }

    private function controlbar()
    {
        return array();
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
        if ($this->input->post($this->session->flashdata('csrfkey')) !== FALSE &&
            $this->input->post($this->session->flashdata('csrfkey')) == $this->session->flashdata('csrfvalue'))
        {
            return TRUE;
        }
        return FALSE;
    }
}