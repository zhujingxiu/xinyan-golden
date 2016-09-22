<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Project.php');
class Stock extends Project
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('stock_model'));
    }

    public function index()
    {
        if ($this->input->get('list')) {
            json_response($this->_list($this->input->get()));
        }
        $this->layout->add_includes(array(
            array('type' => 'css', 'src' => _ASSET_ . 'lib/datatables/dataTables.bootstrap.css'),
            //array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
            //array('type' => 'css', 'src' => _ASSET_ . 'lib/jquery-ui/jquery-ui.min.css'),
        ));
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');
        $data['applies'] = array();
        $result = $this->stock_model->customer_applies();
        foreach ($result->result_array() as $row) {
            $data['applies'][] = array(
                'date_added'=>date('y/m/d',$row['addtime']).'<br>'.date('H:i:s',$row['addtime']),
                'customer' => $row['customer'],
                'mode' => lang('label_'.$row['mode']),
                'weight' => $row['weight'],
                'operator' => $row['operator'],
                'apply_id' => $row['apply_id'],
                'operation' => lang('button_stock_'.$row['mode'])
            );
        }
        $this->layout->view('stock/index', $data);
    }

    protected function _list($filter)
    {
        //排序
        $columns = isset($filter['columns']) ? $filter['columns'] : array();
        $index = (isset($filter['order']['0']['column'])) ? intval($filter['order']['0']['column']) : FALSE;
        $temp = array();
        if ($index && isset($columns[$index]) && isset($columns[$index]['name'])) {
            $temp['order_by'] = $columns[$index]['name'] . ' ' . (isset($filter['order']['0']['dir']) ? $filter['order']['0']['dir'] : 'asc');
        } else {
            $temp['order_by'] = "p.addtime desc";
        }
        //搜索
        if ($filter['search']['value']) {//获取前台传过来的过滤条件

        }

        //分页
        $temp['start'] = $filter['start'];//从多少开始
        $temp['limit'] = $filter['length'];//数据长度

        if (!$this->inRole('manager')) {
            //$temp['where'] = FALSE;//ToDo
        }
        $rows = array();
        $result = $this->stock_model->projects($temp);
        $total = $result->num_rows();
        if ($total) {
            foreach ($result->result_array() as $row) {
                $info = array();
                $_info = maybe_unserialize($row['info']);
                if(is_array($_info)){
                    $info = $_info;
                }
                if(!empty($row['month'])){
                    $period = $row['month'].lang('text_period_unit') ;
                }else{
                    $period = $row['start'].lang('text_startdate');
                }
                $rows[] = array(
                    'DT_RowId' => $row['project_sn'],
                    'sn' => $row['project_sn'].'<br>'.($row['mode'] == 'investing' ? lang('text_investing') : lang('text_recycling')),
                    'company' => $row['short_title'],
                    'customer' => $row['realname'].'<br>'.$row['phone'],
                    'status' => ($row['status'] ? lang('label_growing') : lang('label_terminated')).sprintf(lang('button_detail'),''),
                    'referrer' => $row['referrer'],
                    'weight' => number_format($row['weight'],2) .lang('text_weight_unit'),
                    'period'	=> $period ."<br>".lang('text_profit').calculate_profit($row['profit'],$row['month']).lang('text_profit_unit') ,
                    'operator' => $row['operator'],
                    'profit' => number_format($row['stock_profit'],2) .lang('text_weight_unit'),
                    'addtime' => $row['addtime'] ? date('Y-m-d', $row['addtime']) . '<br>' . date('H:i:s', $row['addtime']) : lang("text_unknown"),
                );
            }
        }
        return array(
            'draw' => $this->input->get('draw'),
            'recordsTotal' => $total,
            'recordsFiltered' => $total,
            'data' => $rows
        );

    }
    public function detail(){
        $result = $this->stock_model->project($this->input->get('project'));
        if($result->num_rows()){
            $info = $result->row_array();
            if(!empty($info['info'])){
                $_info = maybe_unserialize($info['info']);//var_dump($_info);
                if(is_array($_info)){
                    $info += $_info;
                }
            }
            $info['photos'] = $info['invoices'] =$info['reports']=$info['privacies'] = FALSE;
            $_photo = $this->stock_model->files($info['project_sn'],'photo',$info['mode']);
            if($_photo->num_rows()){
                $_info = $_photo->result_array();
                foreach($_info as $item){
                    $info['photos'] = json_decode($item['file'],TRUE);
                }
            }
            $_invoice = $this->stock_model->files($info['project_sn'],'invoice',$info['mode']);
            if($_invoice->num_rows()){
                $_info = $_invoice->result_array();
                foreach($_info as $item){
                    $info['invoices'] = json_decode($item['file'],TRUE);
                }
            }
            $_report = $this->stock_model->files($info['project_sn'],'report',$info['mode']);
            if($_report->num_rows()){
                $_info = $_report->result_array();
                foreach($_info as $item){
                    $info['reports'] = json_decode($item['file'],TRUE);
                };
            }
            $_privacy = $this->stock_model->files($info['project_sn'],'privacy',$info['mode']);
            if($_privacy->num_rows()){
                $_info = $_privacy->result_array();
                foreach($_info as $item){
                    $info['privacies'] = json_decode($item['file'],TRUE);
                }
            }

            $info['profit_weight'] = number_format($info['weight']*$info['profit'],2);
            $info['histories'] = $this->stock_model->histories($info['project_sn'],10,$info['mode']);
            json_success(array(
                'title'=>'项目详情 '.$info['realname'].':'.$info['project_sn'],
                'msg'=>$this->load->view('stock/detail',$info,TRUE),
                'mode'=>strtolower($info['mode']),
                'terminating_form'=>$this->load->view('stock/terminating',$info,TRUE),
                'terminable'=>$info['status'] && $this->inRole('manager'),
                'print'=>false//$info['status'] && $this->inRole('manager')
            ));
        }else{
            json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
        }
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
                $result = $this->stock_model->get_apply($apply_id);
                if(!$result || !$result->num_rows()){
                    json_error(array('msg' => lang('error_no_applied'),'title'=>lang('error_no_result')));
                }
                $applied = $result->row_array();

                if(($applied['weight']*100 == $weight*100) && $applied['phone'] == $phone){
                    $tmp =  array(
                        'customer_id'=>$applied['customer_id'],
                        'phone'=>$phone,
                        'weight'=>$weight,
                        'note' 	=> $note,
                    );
                    if($this->stock_model->taken_weight($applied['apply_id'],$tmp)) {
                        $this->session->set_flashdata('success', sprintf("申请提金已出库！客户 %s", $applied['realname'] . ':' . number_format($applied['weight'], 2) . lang('text_weight_unit')));
                        json_success();
                    }else{
                        json_error();
                    }
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
            $result = $this->stock_model->get_apply($this->input->get('apply_id'));
            if($result->num_rows()){
                $info = $result->row_array();

                $info['applied_weight'] = number_format($info['weight'],2);
                $info['applied_phone'] = $info['phone'];
                $info['applied_fee'] = number_format($info['fee'],2).lang('text_currency_unit');
                $info['apply_id'] = $info['apply_id'];
                $info['privacies'] = json_decode($info['file'],TRUE);
                $info['csrf'] = $this->_get_csrf_nonce();
                $this->load->model('customer_model');
                $info['histories'] = $this->customer_model->stocks($info['customer_id'],5);
                if(is_array($info['histories'])){
                    foreach($info['histories'] as $key => $item){
                        if(!empty($item['file'])){
                            $_tmp = json_decode($item['file'],TRUE);
                            if(is_array($_tmp)){
                                $info['histories'][$key]['file'] = $item;
                            }
                        }
                    }
                }
                json_success(array(
                    'title'=>'提金出库 '.$info['realname'].':'.$info['weight'].lang('text_weight_unit'),
                    'msg'=>$this->load->view('stock/taken',$info,TRUE)
                ));
            }else{
                json_error(array('msg' => lang('error_no_applied'),'title'=>lang('error_no_result')));
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
            $this->form_validation->set_rules('weight', '消费重量', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                $apply_id = $this->input->post('apply_id');
                $note = htmlspecialchars($this->input->post('editorValue'));
                $weight = $this->input->post('weight');
                $phone = $this->input->post('phone');
                $result = $this->stock_model->get_apply($apply_id);
                if(!$result || !$result->num_rows()){
                    json_error(array('msg' => lang('error_no_applied'),'title'=>lang('error_no_result')));
                }
                $applied = $result->row_array();

                if(($applied['weight']*100 == $weight*100) && $applied['phone'] == $phone){
                    $tmp =  array(
                        'customer_id'=>$applied['customer_id'],
                        'phone'=>$phone,
                        'weight'=>$weight,
                        'note' 	=> $note,
                    );
                    if($this->stock_model->order_weight($applied['apply_id'],$tmp)) {
                        $this->session->set_flashdata('success', sprintf("消费抵扣已确认！客户 %s", $applied['realname'] . ':' . number_format($applied['weight'], 2) . lang('text_weight_unit')));
                        json_success();
                    }else{
                        json_error();
                    }
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
            $result = $this->stock_model->get_apply($this->input->get('apply_id'));
            if($result->num_rows()){
                $info = $result->row_array();

                $info['applied_weight'] = number_format($info['weight'],2);
                $info['applied_phone'] = $info['phone'];
                $info['applied_fee'] = number_format($info['fee'],2).lang('text_currency_unit');

                $info['privacies'] = json_decode($info['file'],TRUE);
                $info['csrf'] = $this->_get_csrf_nonce();
                $this->load->model('customer_model');
                $info['histories'] = $this->customer_model->stocks($info['customer_id'],5);
                if(is_array($info['histories'])){
                    foreach($info['histories'] as $key => $item){
                        if(!empty($item['file'])){
                            $_tmp = json_decode($item['file'],TRUE);
                            if(is_array($_tmp)){
                                $info['histories'][$key]['file'] = $item;
                            }
                        }
                    }
                }

                json_success(array(
                    'title'=>'消费抵扣 '.$info['realname'].':'.$info['weight'].lang('text_weight_unit'),
                    'msg'=>$this->load->view('stock/order',$info,TRUE)
                ));
            }else{
                json_error(array('msg' => lang('error_no_applied'),'title'=>lang('error_no_result')));
            }
        }
    }

    public function renew()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            if($this->_valid_csrf_nonce() === FALSE){
                //json_error(array('msg' => lang('error_csrf'),'title'=>lang('error_title')));
            }
            $this->form_validation->set_rules('weight', '续存重量', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                $apply_id = $this->input->post('apply_id');
                $note = htmlspecialchars($this->input->post('editorValue'));
                $weight = $this->input->post('weight');
                $phone = $this->input->post('phone');
                $result = $this->stock_model->get_apply($apply_id);
                if(!$result || !$result->num_rows()){
                    json_error(array('msg' => lang('error_no_applied'),'title'=>lang('error_no_result')));
                }
                $applied = $result->row_array();

                if(($applied['weight']*100 == $weight*100) && $applied['phone'] == $phone){
                    $tmp =  array(
                        'customer_id'=>$applied['customer_id'],
                        'phone'=>$phone,
                        'weight'=>$weight,
                        'note' 	=> $note,
                    );
                    if($this->stock_model->renew_weight($applied['apply_id'],$tmp)) {
                        $this->session->set_flashdata('success', sprintf("消费抵扣已确认！客户 %s", $applied['realname'] . ':' . number_format($applied['weight'], 2) . lang('text_weight_unit')));
                        json_success();
                    }else{
                        json_error();
                    }
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
            $result = $this->stock_model->get_apply($this->input->get('apply_id'));
            if($result->num_rows()){
                $info = $result->row_array();
                $_renew = json_decode($info['data'],TRUE);
                if(!is_array($_renew)){
                    json_error(array('msg'=>var_export($_renew,TRUE)));
                }
                $this->load->model('customer_model');
                $tmp = $this->customer_model->customer($_renew['customer_id'],TRUE);
                if(!$tmp->num_rows()){
                    json_error(array('msg'=>lang('error_no_customer')));
                }
                $customer = $tmp->row_array();

                $info['weight'] = number_format($_renew['weight'],2);
                $info['start'] = $_renew['start'];
                $info['end'] = $_renew['end'];
                $info['month'] = $_renew['month'];
                $info['profit'] = $_renew['profit'];
                $info['payment'] = empty($_renew['payment'])?lang('text_goldbar'):lang('text_'.strtolower($_renew['payment']));
                $info['realname'] = $customer['realname'];
                $info['phone'] = $customer['phone'];
                $info['idnumber'] = $customer['idnumber'];
                $referrer = $this->ion_auth->get_worker($_renew['referrer_id']);
                $info['referrer'] = empty($referrer['realname'])?'' :$referrer['realname'];

                $info['privacies'] = json_decode($info['file'],TRUE);
                $info['csrf'] = $this->_get_csrf_nonce();
                $this->load->model('customer_model');
                $info['histories'] = $this->customer_model->stocks($info['customer_id'],5);
                if(is_array($info['histories'])){
                    foreach($info['histories'] as $key => $item){
                        if(!empty($item['file'])){
                            $_tmp = json_decode($item['file'],TRUE);
                            if(is_array($_tmp)){
                                $info['histories'][$key]['file'] = $item;
                            }
                        }
                    }
                }
                json_success(array(
                    'title'=>'可用金续存 '.$info['realname'].':'.$info['weight'].lang('text_weight_unit'),
                    'msg'=>$this->load->view('stock/renew',$info,TRUE)
                ));
            }else{
                json_error(array('msg' => lang('error_no_applied'),'title'=>lang('error_no_result')));
            }
        }
    }
    public function terminated()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        $project_sn = $this->input->post('project_sn');
        $reason = $this->input->post('editorValue');
        $profit = $this->input->post('profit');
        $mode = $this->input->post('mode') ? $this->input->post('mode') : 'recycling';
        if(!$project_sn || !$reason){
            json_error();
        }
        if(strlen($reason) < 10){
            json_error(array('msg'=>lang('error_reason_length')));
        }
        $result = $this->stock_model->project($project_sn);
        if(!$result->num_rows()){
            json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
        }

        $info = $result->row_array();
        if($profit*100>=($info['profit']*$info['weight'])*100){
            json_error(array('msg'=>lang('error_terminating_profit')));
        }

        if($this->stock_model->terminated($project_sn,$reason,$mode,$profit)){
            $this->session->set_flashdata('success', sprintf("项目已终止！编号: %s",$project_sn));
            json_success();
        }
        json_error();
    }

    public function trashed()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        $project_sn = $this->input->post('project_sn');
        if(!$project_sn  ){
            json_error();
        }

        if($this->recycling_model->hidden($project_sn)){
            $this->session->set_flashdata('success', sprintf("项目已回收！编号: %s",$project_sn));
            json_success();
        }
        json_error();
    }

    public function privacy()
    {
        $params = XEncrypt($this->input->get('xe'),'D');
    }
}