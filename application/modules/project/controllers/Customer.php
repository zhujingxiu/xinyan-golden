<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once('Project.php');
class Customer extends Project {

    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model(array('customer_model'));
        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
    }
    public function index()
    {
        if($this->input->get('list')){
            json_response($this->_list($this->input->get()));
        }
        $this->layout->add_includes(array(
            array('type'=>'css','src'=>_ASSET_.'lib/datatables/datatables.bootstrap.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
            array('type'=>'js','src'=>_ASSET_.'base/iccardreader.js'),

        ));
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');


        $this->layout->view('customer/index',$data);
    }

    protected function _list($filter)
    {
        //排序
        $columns = isset($filter['columns']) ? $filter['columns'] : array();
        $index = (isset($filter['order']['0']['column'])) ? intval($filter['order']['0']['column']) : FALSE;
        $temp = array();
        if($index && isset($columns[$index]) && isset($columns[$index]['name'])){
            $temp['order_by'] = $columns[$index]['name'] .' '.(isset($filter['order']['0']['dir']) ? $filter['order']['0']['dir'] : 'asc');
        }else{
            $temp['order_by'] = "c.lasttime desc";
        }
        //搜索
        if($filter['search']['value']){//获取前台传过来的过滤条件
            $temp['or_where'] = $filter['search']['value'];
        }

        //分页
        $temp['start'] = $filter['start'];//从多少开始
        $temp['limit'] = $filter['length'];//数据长度

        if(!$this->inRole('manager')) {
            //$temp['where'] = FALSE;//ToDo
        }
        $rows = array();
        $result = $this->customer_model->customers($temp);
        $total = $result->num_rows();
        if($total){
            foreach($result->result_array() as $row){
                $status_text = $row['status'] ? lang('label_enabled') : lang('label_disabled');

                $cover = ($row['avatar'] && file_exists($row['avatar'])) ? $cover = '<img class="list-img" src="'.site_url($row['avatar']).'" alt="'.$row['realname'].'" />':false;
                $available = sprintf(lang('button_frozen'),number_format($row['available'],2).lang('text_weight_unit'));
                if($row['available']*100>0 && $this->inRole('manager')){
                    $available = '<a class="btn btn-sm btn-xs btn-success ">'.number_format($row['available'],2).lang('text_weight_unit').'</a>';
                }
                $rows[] = array(
                    'DT_RowId'  => $row['customer_id'],
                    'customer' 	=> ($cover ? $cover : $row['realname']).'<br>'.$row['group_name'],
                    'referrer' 	=> $row['referrer'],
                    'phone'	    => sprintf(lang('button_phone'),$row['phone']).'<br>'.sprintf(lang('button_idnumber'),$row['idnumber']),
                    'card_number'	=> $row['card_number'] ? sprintf(lang('button_unbind'),$row['card_number']) : lang('button_bind') ,
                    'wechatqq'	=> '<label class="label label-default">'.$row['wechat'] .'</label><br/><label class="label label-default">'.$row['qq'].'</label>',
                    'available'	=> $available,
                    'frozen'	=> sprintf(lang('button_frozen'),number_format($row['frozen'],2).lang('text_weight_unit')),
                    'totals'	=> '<a class="btn btn-sm btn-xs btn-primary">'.number_format($row['totals'],2).lang('text_weight_unit').'</a>',
                    'status_text'	=> $status_text,
                    'operator'	=> $row['operator'],
                    'addtime'	=> $row['addtime'] ? date('Y-m-d',$row['addtime']).'<br>'.date('H:i:s',$row['addtime']) :lang("text_unknown"),
                    'operation'	=> $this->_operation($row['available'],$this->customer_model->applied($row['customer_id']))
                );
            }
        }
        return array(
            'draw' 				=> $this->input->get('draw'),
            'recordsTotal' 		=> $total,
            'recordsFiltered' 	=> $total,
            'data' => $rows
        );

    }

    private function _operation($available,$applied)
    {
        $buttons = array();
        $text_lock = '';
        if($this->inRole('manager')) {
            $buttons[] = sprintf(lang('button_customer_detail'),$text_lock) ;
        }else{
            //$buttons['first'] = lang('button_detail');
        }

        if(isset($applied['taking'])){
            if($this->inRole('manager')) {
                $buttons[] = lang('button_cancle_taking');
            }
            if($this->inRole('warehouser')){
                //$buttons[] = lang('button_apling_taken');
            }
        }else{
            if($available*100 >0 && $this->inRole('manager')){
                $buttons[] = lang('button_appling_taking');
            }
        }

        if(isset($applied['renew'])){
            if($this->inRole('manager')) {
                $buttons[] = lang('button_cancle_renew');
            }
            if($this->inRole('warehouser')){
                //$buttons[] = lang('button_appling_renewed');
            }
        }else{
            if($available*100 >= ($this->config->item('min_weight')*100) && $this->inRole('manager')){
                $buttons[] = lang('button_appling_renew');
            }
        }

        if(isset($applied['order'])){
            if($this->inRole('manager')) {
                $buttons[] = lang('button_cancle_order');
            }
            if($this->inRole('warehouser')){
                //$buttons[] = lang('button_appling_ordered');
            }
        }else{
            if($available*100 >0 && $this->inRole('manager')){
                $buttons[] = lang('button_appling_order');
            }
        }

        return '<div class="btn-group">'.implode(" ",$buttons).'</div>';
    }

    public function update()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            //json_response(['code'=>0]+$this->input->post());
            $this->form_validation->set_rules('realname', '真实姓名', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');
            $this->form_validation->set_rules('idnumber', '身份证号', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                $data = array(
                    'realname' => $this->input->post('realname'),
                    'group_id' => $this->input->post('group_id'),
                    'phone' => $this->input->post('phone'),
                    'idnumber' => $this->input->post('idnumber'),
                    'wechat' => $this->input->post('wechat'),
                    'qq' => $this->input->post('qq'),
                    'email' => $this->input->post('email'),
                    'address' => $this->input->post('address'),
                    'referrer_id' => $this->input->post('referrer'),
                    'status' => $this->input->post('status'),
                    'note' => htmlspecialchars($this->input->post('editorValue')),
                );
                $this->input->post('customer_id')
                    ? $this->customer_model->update_customer($this->input->post('customer_id'),$data)
                    : $this->customer_model->insert_customer($data);
                $this->session->set_flashdata('success', '客户资料保存成功 : '.$data['realname']);
                json_success();

            }else {
                $errors = array(
                    'realname' => form_error('realname'),
                    'idnumber' => form_error('idnumber'),
                    'phone' => form_error('phone'),
                );
                json_error(array('errors' => $errors));
            }
        }else{
            $id = $this->input->get('customer_id');
            $title = '添加客户';
            $info = array(
                'customer_id' => '',
                'group_id' => 0,
                'realname'	=> '',
                'phone' => '',
                'wechat' => '',
                'qq' => '',
                'email' => '',
                'address' => '',
                'note' => '',
                'referrer' => '',
                'idnumber' => '',
                'referrer_id' => 0,
                'status' => 1
            );
            $result = $this->customer_model->customer($id);
            if($result->num_rows()){
                $info = $result->row_array();
                $title = '编辑资料 '.$info['realname'];
            }

            $info['groups'] = $this->customer_model->get_groups()->result_array();

            json_success(array(
                'title'=>$title,
                'msg'=>$this->load->view('customer/form',$info,TRUE),
                'modify'=>$this->inRole('manager'),
                'free'=>$info['customer_id']&&$this->inRole('manager'),
                'free_form'=>$this->load->view('customer/free',$info,TRUE),
            ));
        }
    }

    public function projects()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        $result = $this->customer_model->customer($this->input->post('customer'));
        if($result){
            $info = $result->row_array();

            $info['projects'] = $this->customer_model->projects($info['customer_id']);

            $info['csrf'] = $this->_get_csrf_nonce();
            $this->load->view('customer/project',$info);
        }else{
            json_error(array('msg' => lang('error_no_customer'),'title'=>lang('error_no_result')));
        }
    }

    public function check_card(){

        $number = $this->input->get('card_number');

        $result = $this->customer_model->get_customer_by_card_number($number);

        if($result){
            die('false');
        }else{
            die('true');
        }
    }

    public function unbind()
    {
        $this->customer_model->unbind($this->input->post('customer_id'));
        $this->session->set_flashdata('success', '已解绑客户金卡 ！ ');
        json_success();
    }

    public function bind()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            //json_response(['code'=>0]+$this->input->post());
            $this->form_validation->set_rules('card_number', '卡面编号', 'required');
            $this->form_validation->set_rules('card_serial', '卡序列号', 'required');
            $this->form_validation->set_rules('customer_id', '客户ID', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                $id = $this->input->post('customer_id');
                $result = $this->customer_model->customer($id,TRUE);
                if($result->num_rows()){
                    $info = $result->row_array();
                }else{
                    json_error(array('msg'=>lang('error_no_customer')));
                }
                $this->customer_model->bind_card($this->input->post('customer_id'),$this->input->post('card_number'),$this->input->post('card_serial'));

                $this->session->set_flashdata('success', '客户已绑定金卡 ！ '.$info['realname'].' : '.$this->input->post('card_number'));
                json_success();

            }else {
                $errors = array(
                    'card_number' => form_error('card_number'),
                    'card_serial' => form_error('card_serial'),
                    'customer_id' => form_error('customer_id'),
                );
                json_error(array('errors' => $errors));
            }
        }else{
            $id = $this->input->get('customer');
            $card_serial = $this->input->get('card_serial');
            if(strlen($card_serial)!=8){
                json_error(array('msg'=>lang('error_card')));
            }
            $result = $this->customer_model->get_bind($card_serial);

            if($result->num_rows()){
                $_customer = $result->row_array();
                json_error(array('msg'=>sprintf(lang('error_card_binded'),$_customer['realname'].':'.$_customer['card_number'])));
            }
            $result = $this->customer_model->customer($id,TRUE);

            if($result->num_rows()){
                $info = $result->row_array();
            }else{
                json_error(array('msg'=>lang('error_no_customer')));
            }
            $info['card_serial'] = $card_serial;
            json_success(array('title'=>'绑定金卡','msg'=>$this->load->view('customer/bind',$info,TRUE)));
        }
    }
    public function taking()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            if($this->_valid_csrf_nonce() === FALSE){
                //json_error(array('msg' => lang('error_csrf'),'title'=>lang('error_title')));
            }
            $this->form_validation->set_rules('weight', '申请重量', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                $card_serial = $this->input->post('card_serial');
                $customer_id = $this->input->post('customer_id');
                $note = htmlspecialchars($this->input->post('editorValue'));
                $weight = $this->input->post('weight');
                $phone = $this->input->post('phone');
                $fee = $this->input->post('fee');
                $result = $this->customer_model->customer($customer_id);
                if(!$result->num_rows()){
                    json_error(array('msg' => lang('error_no_customer'),'title'=>lang('error_no_result')));
                }
                $customer = $result->row_array();
                if( $customer['phone'] == $phone){

                    if($weight*100 > $customer['available']*100){
                        json_error(array('msg' => lang('error_total_max')));
                    }
                    $this->customer_model->appling_weight($customer_id,array(
                        'mode'=>'taking',
                        'phone'=>$phone,
                        'weight'=>$weight,
                        'fee'=>$fee,
                        'note' 	=> $note,
                        'file' =>$this->input->post('file')
                    ));
                    $this->session->set_flashdata('success', sprintf("已申请提金！客户: %s",$customer['realname']));

                    json_success();
                }else{
                    json_error(array('errors' => array(
                        'weight' => lang("error_confirm_weight"),
                        'phone' => lang("error_confirm_phone"),
                    )));
                }
            }else {
                json_error(array('errors' =>  array(
                    'weight' => form_error('weight'),
                    'phone' => form_error('phone'),
                )));
            }
        }else{
            $card_serial = $this->input->get('card_serial');
            $customer_id = $this->input->get('customer');
            if(strlen($card_serial)!=8){
                json_error(array('msg'=>lang('error_card')));
            }
            $result = $this->customer_model->get_bind($card_serial);

            if($result->num_rows()){
                $_customer = $result->row_array();
                if($_customer['customer_id']!=$this->input->get('customer')){
                    json_error(array('msg'=>lang('error_card_match')));
                }
            }else{
                json_error(array('msg'=>lang('error_card_customer')));
            }
            $result = $this->customer_model->customer($customer_id);
            if($result->num_rows()){
                $info = $result->row_array();
                $info['csrf'] = $this->_get_csrf_nonce();
                $info['max'] = (float)$info['available'];
                $info['total'] = (float)($info['available']+$info['frozen']);
                $info['histories'] = array();
                $stocks = $this->customer_model->stocks($info['customer_id'],5);
                if(is_array($stocks)){
                    foreach($stocks as $key => $item){
                        if(!empty($item['file'])){
                            $_tmp = json_decode($item['file'],TRUE);
                            if(is_array($_tmp)){
                                $item['file'] = $_tmp;
                            }
                        }
                        $info['histories'][] = $item;
                    }
                }

                json_success(array('title'=>'申请提金 '.$info['realname'].':'.$info['phone'],'msg'=>$this->load->view('customer/taking',$info,TRUE)));
            }else{
                json_error(array('msg' => lang('error_no_customer'),'title'=>lang('error_no_result')));
            }
        }
    }
    public function renew()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            if($this->_valid_csrf_nonce() === FALSE){
                //json_error(array('msg' => lang('error_csrf'),'title'=>lang('error_title')));
            }
            $this->form_validation->set_rules('customer_id', '客户编号', 'required');
            $this->form_validation->set_rules('period_id', '续存周期', 'required');
            $this->form_validation->set_rules('payment', '交付方式', 'required');
            $this->form_validation->set_rules('weight', '续存克重', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                $card_serial = $this->input->post('card_serial');
                $customer_id = $this->input->post('customer_id');
                $note = htmlspecialchars($this->input->post('editorValue'));
                $result = $this->customer_model->customer($customer_id);
                if(!$result->num_rows()) {
                    json_error(array('msg'=>lang('error_no_customer')));
                }
                $customer = $result->row_array();
                $weight = (float)$this->input->post('weight');
                $this->load->model('setting/project_model');
                $tmp=array(
                    'mode' => 'renew',
                    'weight' => $weight,
                    'phone' => $customer['phone'],
                    'fee' => $this->input->post('fee'),
                    'note' => $note,
                );
                $period = $this->project_model->period($this->input->post('period_id'));
                if(!$period->num_rows()){
                    json_error(array('msg'=>lang('error_period')));
                }
                $_p = $period->row_array();
                $start = $this->calculate_start(time());
                $tmp['renew']=array(
                    'customer_id' => $customer_id,
                    'referrer_id' => $customer['referrer_id'],
                    'company_id' => empty($customer['company_id'])? $this->ion_auth->get_company_id() : $customer['company_id'],
                    'price'=>$this->current_price(),
                    'weight' => $weight,
                    'month' => (int)$_p['month'],
                    'profit'=> $this->calculate_rate((float)$_p['profit'],$_p['month']),
                    'payment' => $this->input->post('payment'),
                    'transferrer' => $this->input->post('transferrer'),
                    'start'=>$start,
                    'end'=>calculate_end(strtotime($start),$_p['month']),
                    'note' => $note,
                    'status_id' => $this->config->item('recycling_renew'),
                    'worker_id' => $this->ion_auth->get_user_id(),
                );
                if($this->customer_model->appling_weight($customer_id, $tmp)){
                    $this->session->set_flashdata('success', sprintf('申请续存 %s 克 成功！客户 %s ',$weight,$customer['realname']));
                    json_success();
                }else{
                    //json_error();
                }
            }else {
                $errors = array(
                    'customer_id' => form_error('customer_id'),
                    'payment' => form_error('payment'),
                    'period_id' => form_error('period_id'),
                    'weight' => form_error('weight'),
                );
                if($this->config->item('recycling_privacy')){
                    //$errors['agree'] = form_error('agree');
                }
                json_error(array('errors' => $errors));
            }
        }else{
            $card_serial = $this->input->get('card_serial');
            $customer_id = $this->input->get('customer');
            if(strlen($card_serial)!=8){
                json_error(array('msg'=>lang('error_card')));
            }
            $result = $this->customer_model->get_bind($card_serial);

            if($result->num_rows()){
                $_customer = $result->row_array();
                if($_customer['customer_id']!=$this->input->get('customer')){
                    json_error(array('msg'=>lang('error_card_match')));
                }
            }else{
                json_error(array('msg'=>lang('error_card_customer')));
            }
            $result = $this->customer_model->customer($customer_id);
            if($result->num_rows()) {
                $info = $result->row_array();
            }
            $info['card_serial'] = $card_serial;
            $info['agree'] = '';
            if($this->config->item('recycling_privacy')){
                $this->load->model('article/article_model');
                $article = $this->article_model->article($this->config->item('recycling_privacy'))->row_array();
                if(!empty($article['title'])) {
                    $info['agree'] = sprintf(lang('text_agree'), anchor(site_url('article/article/detail/'.$article['article_id']), $article['title'], 'target="_blank"'));
                }
            }
            $info['transferrers'] = $this->group_users('warehouser',$this->company_id);
            $this->load->model('setting/project_model');
            $info['periods'] = $this->project_model->periods(array('status'=>1))->result_array();
            $info['csrf'] = $this->_get_csrf_nonce();
            //var_dump($this->session->flashdata('csrfkey'));
            json_success(array('title'=>'客户续存入库','msg'=>$this->load->view('customer/renew',$info,TRUE)));
        }
    }

    public function order()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            if($this->_valid_csrf_nonce() === FALSE){
                //json_error(array('msg' => lang('error_csrf'),'title'=>lang('error_title')));
            }
            $this->form_validation->set_rules('weight', '申请重量', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                $customer_id = $this->input->post('customer_id');
                $note = htmlspecialchars($this->input->post('editorValue'));
                $weight = $this->input->post('weight');
                $phone = $this->input->post('phone');
                $result = $this->customer_model->customer($customer_id);
                if(!$result->num_rows()){
                    json_error(array('msg' => lang('error_no_customer'),'title'=>lang('error_no_result')));
                }
                $customer = $result->row_array();
                if( $customer['phone'] == $phone){
                    $max = $this->config->item('order_percent')
                        ? (float)($customer['available']*($this->config->item('order_percent')/100))*1.00
                        : (float)$customer['available']*1.00;;

                    if($weight*100 > $max*100){
                        json_error(array('msg' => lang('error_total_max')));
                    }

                    $this->customer_model->appling_weight($customer_id,array(
                        'customer_id'=>$customer_id,
                        'mode'=>'order',
                        'phone'=>$phone,
                        'weight'=>$weight,
                        'note' 	=> $note,
                        'fee' => $this->input->post('fee')
                    ));
                    $this->session->set_flashdata('success', sprintf("已申请门店消费 ".number_format($weight,2)."克！客户: %s",$customer['realname']));

                    json_success();
                }else{
                    json_error(array('errors' => array(
                        'weight' => lang("error_confirm_weight"),
                        'phone' => lang("error_confirm_phone"),
                    )));
                }
            }else {
                json_error(array('errors' =>  array(
                    'weight' => form_error('weight'),
                    'phone' => form_error('phone'),
                )));
            }
        }else{
            $card_serial = $this->input->get('card_serial');
            $customer_id = $this->input->get('customer');
            if(strlen($card_serial)!=8){
                json_error(array('msg'=>lang('error_card')));
            }
            $result = $this->customer_model->get_bind($card_serial);

            if($result->num_rows()){
                $_customer = $result->row_array();
                if($_customer['customer_id']!=$this->input->get('customer')){
                    json_error(array('msg'=>lang('error_card_match')));
                }
            }else{
                json_error(array('msg'=>lang('error_card_customer')));
            }
            $result = $this->customer_model->customer($customer_id);
            if($result->num_rows()) {

                $info = $result->row_array();
                $info['card_serial'] = $card_serial;
                $info['csrf'] = $this->_get_csrf_nonce();
                $info['order_percent'] = $this->config->item('order_percent');
                $info['max'] = $this->config->item('order_percent')
                    ? (float)($info['available']*($this->config->item('order_percent')/100))*1.00
                    : (float)$info['available']*1.00;
                $info['total'] = (float)($info['available']+$info['frozen']);
                $info['histories'] = array();
                $stocks = $this->customer_model->stocks($info['customer_id'],5);
                if(is_array($stocks)){
                    foreach($stocks as $key => $item){
                        if(!empty($item['file'])){
                            $_tmp = json_decode($item['file'],TRUE);
                            if(is_array($_tmp)){
                                $item['file'] = $_tmp;
                            }
                        }
                        $info['histories'][] = $item;
                    }
                }
                json_success(array('title'=>'门店消费申请 '.$info['realname'].':'.$info['phone'],'msg'=>$this->load->view('customer/order',$info,TRUE)));
            }else{
                json_error(array('msg' => lang('error_no_customer'),'title'=>lang('error_no_result')));
            }
        }
    }
    public function cancle()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        $customer_id = $this->input->post('customer_id');
        $reason = $this->input->post('value');
        $mode = $this->input->post('mode');
        if(!$customer_id || !$reason ){
            json_error();
        }
        if(strlen($reason) < 10){
            json_error(array('msg'=>lang('error_reason_length'),'title'=>lang('error_title')));
        }
        $result = $this->customer_model->applied($customer_id,$mode);
        if(!$result){
            json_error(array('msg' => lang('error_no_applied'),'title'=>lang('error_no_result')));
        }

        $info =current($result);

        if($this->customer_model->cancle_applied($customer_id,$mode,array('note'=>$reason))){
            $this->session->set_flashdata('success', sprintf("已取消提金申请！客户: %s",$info['realname']));
            json_success();
        }
        json_error();
    }



    public function autocomplete()
    {
        $json = array();
        if ($this->input->get('filter_name')) {
            $data = array(
                'filter_name' => $this->input->get('filter_name'),
                'filter_group' => $this->input->get('filter_role'),
                'start'       		=> 0,
                'limit'       		=> 20
            );
            $results = $this->customer_model->filter_customers($data);
            if($results) {
                foreach ($results as $result) {
                    $json[] = array(
                        'entry_id' => $result['customer_id'],
                        'name' => strip_tags(html_entity_decode($result['realname'], ENT_QUOTES, 'UTF-8')),
                        'value' => $result['customer_id'],
                        'phone' => $result['phone'],
                        'idnumber' => $result['idnumber'],
                        'wechat' => $result['wechat'],
                        'referrer' => $result['referrer'],
                        'referrer_id' => $result['referrer_id'],
                    );
                }
            }
        }
        $sort_order = array();
        if($json){
            foreach ($json as $key => $value) {
                $sort_order[$key] = $value['name'];
            }
            array_multisort($sort_order, SORT_ASC, $json);
            json_response($json);
        }

    }



    public function free(){
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        $customer_id = $this->input->post('customer_id');
        $reason = $this->input->post('editorValue');
        $weight = $this->input->post('weight');
        if(!$customer_id || !$reason){
            json_error();
        }
        if(strlen($reason) < 10){
            json_error(array('msg'=>lang('error_reason_length')));
        }
        $result = $this->customer_model->customer($customer_id);
        if(!$result->num_rows()){
            json_error(array('msg' => lang('error_no_customer'),'title'=>lang('error_no_result')));
        }

        $info = $result->row_array();
        if($this->customer_model->free_stock($customer_id,$weight,$reason)){
            $this->session->set_flashdata('success', sprintf("已赠送 %s 克 给客户: %s",number_format($weight,2),$info['realname']));
            json_success();
        }
        json_error();
    }
}
