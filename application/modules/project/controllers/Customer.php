<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customer extends XY_Controller {

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
            array('type'=>'css','src'=>_ASSET_.'lib/jquery-ui/jquery-ui.min.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/datatables/datatables.bootstrap.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
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
                $applied = $this->customer_model->applied($row['customer_id']);
                $status_text = $row['status'] ? lang('label_enabled') : lang('label_disabled');
                $operation = 'detail';
                if($row['total']*100>0){
                    $operation = 'appling';
                }
                if($applied){
                    $status_text = sprintf(lang("label_applied"),number_format($applied['weight']));
                    $operation = 'applied';
                }

                $cover = ($row['avatar'] && file_exists($row['avatar'])) ? $cover = '<img class="list-img" src="'.site_url($row['avatar']).'" alt="'.$row['realname'].'" />':false;
                $rows[] = array(
                    'DT_RowId'  => $row['customer_id'],
                    'customer' 	=> $cover ? $cover : $row['realname'],
                    'referrer' 	=> $row['referrer'],
                    'phone'	    => $row['phone'],
                    'idnumber'	=> $row['idnumber'] ,
                    'wechat'	=> $row['wechat'] ,
                    'qq'	=> $row['qq'] ,
                    'weight'	=> '<label class="label label-primary">'.number_format($row['total'],2).lang('text_weight_unit').'</label>',
                    'status_text'	=> $status_text,
                    'operator'	=> $row['operator'],
                    'lasttime'	=> $row['lasttime'] ? date('Y-m-d',$row['lasttime']).'<br>'.date('H:i:s',$row['lasttime']) :lang("text_unknown"),
                    'operation'	=> $this->_operation($operation)
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

    private function _operation($operation)
    {
        $buttons = array();
        if($this->inRole('manager')) {
            $buttons[] = lang('button_update');
        }else{
            $buttons[] = lang('button_detail');
        }
        if($operation == 'appling'){
            if($this->inRole('manager')) {
                $buttons[] = lang('button_appling');
                //$buttons[] = lang('button_order');
            }
        }
        if($operation == 'applied'){
            if($this->inRole('manager')) {
                $buttons[] = lang('button_cancle');
            }
            if($this->inRole('warehouser')){
                $buttons[] = lang('button_taking');
            }
        }
        return implode(" ",$buttons);
    }

    public function update()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            //json_response(['code'=>0]+$this->input->post());
            $this->form_validation->set_rules('title', '标题', 'trim|required|min_length[2]|max_length[32]');

            $this->form_validation->set_rules('category_id', '分类', 'trim|required');

            if ($this->form_validation->run() == TRUE)
            {

                $data = array(
                    'title' => $this->input->post('title'),
                    'category_id' => $this->input->post('category_id'),
                    'is_top' => $this->input->post('is_top'),
                    'status' => $this->input->post('status'),
                    'text' => htmlspecialchars($this->input->post('editorValue')),
                );
                $res = $this->input->post('article_id') ?
                			$this->article_model->update_article($this->input->post('article_id'),$data) : $this->article_model->insert_article($data);

                if($res){
                    $this->session->set_flashdata('success', '文章保存成功');
                    json_response(array('code' => 1, 'success' => '成功'));
                }else
                {
                	$this->session->set_flashdata('warning', '参数异常');
                    json_response(array('code' => 0, 'errors' => '参数异常'));
                }
            }else {

                $errors = array(
                    'title' => form_error('title'),
                    'category_id' => form_error('category_id'),
                );
                json_response(array('code' => 0, 'errors' => $errors));
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

            json_success(array('title'=>$title,'html'=>$this->load->view('customer/form',$info,TRUE)));
        }
    }

    public function stock()
    {

    }


    public function applied()
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

                    if($weight*100 > $customer['total']*100){
                        json_error(array('msg' => lang('error_total_max')));
                    }
                    $this->customer_model->appling_weight($customer_id,array(
                        'mode'=>'appling',
                        'phone'=>$phone,
                        'weight'=>$weight,
                        'note' 	=> $note,
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
            $result = $this->customer_model->customer($this->input->get('customer'));
            if($result->num_rows()){
                $info = $result->row_array();
                $info['csrf'] = $this->_get_csrf_nonce();

                $info['histories'] = $this->customer_model->stocks($info['customer_id'],5);
                $info['max'] = (float)$info['total'];

                json_success(array('title'=>'申请提金 '.$info['realname'].':'.$info['phone'],'msg'=>$this->load->view('customer/appling',$info,TRUE)));
            }else{
                json_error(array('msg' => lang('error_no_customer'),'title'=>lang('error_no_result')));
            }
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
                    $max = $this->config->item('order_percent') ? (float)($customer['total']*($this->config->item('order_percent')/100))*1.00 : (float)$customer['total']*1.00;;

                    if($weight*100 > $max*100){
                        json_error(array('msg' => lang('error_total_max')));
                    }

                    $this->customer_model->appling_weight($customer_id,array(
                        'customer_id'=>$customer_id,
                        'mode'=>'order',
                        'phone'=>$phone,
                        'weight'=>$weight,
                        'note' 	=> $note,
                    ));
                    $this->session->set_flashdata('success', sprintf("已申请门店消费！客户: %s",$customer['realname']));

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
            $result = $this->customer_model->customer($this->input->get('customer'));
            if($result->num_rows()){
                $info = $result->row_array();
                $info['csrf'] = $this->_get_csrf_nonce();
                $info['order_percent'] = $this->config->item('order_percent');
                $info['max'] = $this->config->item('order_percent') ? (float)($info['total']*($this->config->item('order_percent')/100))*1.00 : (float)$info['total']*1.00;
                $info['histories'] = $this->customer_model->stocks($info['customer_id'],5);
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
        if(!$customer_id || !$reason ){
            json_error();
        }
        if(strlen($reason) < 10){
            json_error(array('msg'=>lang('error_reason_length'),'title'=>lang('error_title')));
        }
        $result = $this->customer_model->customer($customer_id);
        if(!$result->num_rows()){
            json_error(array('msg' => lang('error_no_customer'),'title'=>lang('error_no_result')));
        }
        $info = $result->row_array();
        if($this->customer_model->cancle_applied($customer_id,array('note'=>$reason))){
            $this->session->set_flashdata('success', sprintf("已取消提金申请！客户: %s",$info['realname']));
            json_success();
        }
        json_error();
    }

    public function taken()
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
                $apply_id = $this->input->post('apply_id');
                $note = htmlspecialchars($this->input->post('editorValue'));
                $weight = $this->input->post('weight');
                $phone = $this->input->post('phone');
                $result = $this->customer_model->get_apply($apply_id);
                if(!$result->num_rows()){
                    json_error(array('msg' => lang('error_no_applied'),'title'=>lang('error_no_result')));
                }
                $applied = $result->row_array();

                if(($applied['weight']*100 == $weight*100) && $applied['phone'] == $phone){
                    $tmp =  array(
                        'customer_id'=>$applied['customer_id'],
                        'phone'=>$phone,
                        'weight'=>$weight,
                        'note' 	=> $note,
                        'file' =>$this->input->post('file')
                    );

                    $this->customer_model->taken_weight($applied['apply_id'],$tmp);
                    $this->session->set_flashdata('success', sprintf("申请提金已出库！客户 %s",$applied['realname'].':'.number_format($applied['weight'],2).lang('text_weight_unit')));
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
            $result = $this->customer_model->customer($this->input->get('customer_id'));
            if($result->num_rows()){
                $info = $result->row_array();
                $applied = $this->customer_model->applied($info['customer_id']);
                if(!$applied){
                    json_error(array('msg' => lang('error_no_applied') ));
                }
                $info['applied_weight'] = number_format($applied['weight'],2);
                $info['applied_phone'] = $applied['phone'];
                $info['apply_id'] = $applied['apply_id'];
                $info['csrf'] = $this->_get_csrf_nonce();
                $info['histories'] = $this->customer_model->stocks($info['customer_id'],5);
                json_success(array('title'=>'提金出库 '.$info['realname'].':'.$applied['weight'].lang('text_weight_unit'),'msg'=>$this->load->view('customer/taking',$info,TRUE)));
            }else{
                json_error(array('msg' => lang('error_no_customer'),'title'=>lang('error_no_result')));
            }
        }
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

}
