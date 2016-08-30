<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Project.php');
class Recycling extends Project {
    protected $mode = 'recycling';
    public function __construct(){
        parent::__construct();
        $this->mode = 'recycling';
        $this->load->model(array('recycling_model'));
    }
    public function index()
    {
        $this->layout->add_includes(array(
            array('type'=>'css','src'=>_ASSET_.'lib/datatables/dataTables.bootstrap.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/jquery-ui/jquery-ui.min.css'),
        ));
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');

        if($this->input->get('draw')){
            json_response($this->_list($this->input->get()));
        }
        $this->layout->view('recycling/index',$data);
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
            $temp['order_by'] = "p.lasttime desc";
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
        $result = $this->recycling_model->projects($temp);
        $total = $result->num_rows();
        if($total){
            foreach($result->result_array() as $row){
                $rows[] = array(
                    'DT_RowId'  => $row['project_sn'],
                    'status' 	=> lang('label_'.strtolower($row['code'])),
                    'sn'		=> $row['project_sn'],
                    'realname' 	=> $row['realname'].'<br>'.$row['phone'],
                    'price'		=> $row['price'],
                    'weight'	=> $row['weight'],
                    'period'	=> empty($row['start']) ?  $row['period'].'个月' : $row['start'].'<br> -- <br>'.$row['end'],
                    'amount'	=> $row['amount'],
                    'operator'	=> $row['operator'],
                    'lasttime'	=> $row['lasttime'] ? date('Y-m-d',$row['lasttime']).'<br>'.date('H:i:s',$row['lasttime']) :lang("text_unknown"),
                    'operation'	=> $this->render_operation($row['status_id'])
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

    public function booked()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            if($this->_valid_csrf_nonce() === FALSE){
                //json_error(array('msg' => lang('error_csrf'),'title'=>lang('error_title')));
            }
            $this->form_validation->set_rules('origin_weight', '黄金重量', 'required');
            $this->form_validation->set_rules('number', '黄金件数', 'required');
            $this->form_validation->set_rules('type', '黄金类型', 'required');
            $this->form_validation->set_rules('appraiser', '鉴定人', 'required');
            $this->form_validation->set_rules('loss', '损耗比例', 'required');
            $this->form_validation->set_rules('weight', '鉴定实重', 'required');
            $this->form_validation->set_rules('realname', '真实姓名', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');
            $this->form_validation->set_rules('idnumber', '身份证号', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                if($this->recycling_model->insert( $this->input->post()+array('price'=>$this->current_price()))){
                    $this->session->set_flashdata('success', '项目添加成功！');
                    json_success();
                }
            }else {
                $errors = array(
                    'origin_weight' => form_error('origin_weight'),
                    'number' => form_error('number'),
                    'type' => form_error('type'),
                    'appraiser' => form_error('appraiser'),
                    'weight' => form_error('weight'),
                    'loss' => form_error('loss'),
                    'realname' => form_error('realname'),
                    'phone' => form_error('phone'),
                    'idnumber' => form_error('idnumber'),
                );
                if($this->config->item('recycling_privacy')){
                    $errors['agree'] = form_error('agree');
                }
                json_error(array('errors' => $errors));
            }
        }else{
            $info['agree'] = '';
            $info['csrf'] = $this->_get_csrf_nonce();
            if($this->config->item('recycling_privacy')){
                $this->load->model('article/article_model');
                $article = $this->article_model->article($this->config->item('recycling_privacy'))->row_array();
                if(!empty($article['title'])) {
                    $info['agree'] = sprintf(lang('text_agree'), anchor(site_url('article/article/detail/'.$article['article_id']), $article['title'], 'target="_blank"'));
                }
            }
            json_response(array('code'=>1,'title'=>'添加项目','msg'=>$this->load->view('recycling/booking',$info,TRUE)));
        }
    }


    public function update()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            if($this->_valid_csrf_nonce() === FALSE){
                json_error(array('msg' => lang('error_csrf'),'title'=>lang('error_title')));
            }

            $this->form_validation->set_rules('project_sn', '项目编号', 'required');
            $this->form_validation->set_rules('weight', '购买克重', 'required');
            $this->form_validation->set_rules('realname', '真实姓名', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');
            $this->form_validation->set_rules('idnumber', '身份证号', 'required');
            if ($this->form_validation->run() == TRUE)
            {
                $result = $this->recycling_model->project($this->input->post('project_sn'));

                if(!$result->num_rows()){
                    json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
                }
                $info = $result->row_array();
                $weight = $this->input->post('weight');
                $period = $this->input->post('period');
                $tmp = array(
                    'realname' => $this->input->post('realname'),
                    'phone' => $this->input->post('phone'),
                    'idnumber' => $this->input->post('idnumber'),
                    'wechat' => $this->input->post('wechat'),
                    'referrer' => $this->input->post('referrer'),
                    'note' => htmlspecialchars($this->input->post('editorValue')),
                    'weight'=> $weight,
                    'period'=> $period,
                    'amount'=> $this->calculate_amount($info['price'],$weight),
                    'total'=> $this->calculate_total($period,$weight),
                );
                if($this->recycling_model->update($this->input->post('project_sn'),$tmp)){
                    $this->session->set_flashdata('success', '项目编辑成功！');
                    json_success();
                }
            }else {

                $errors = array(
                    'project_sn' => form_error('project_sn'),
                    'weight' => form_error('weight'),
                    'realname' => form_error('realname'),
                    'phone' => form_error('phone'),
                    'idnumber' => form_error('idnumber'),
                );
                if($this->config->item('recycling_privacy')){
                    $errors['agree'] = form_error('agree');
                }
                json_error(array('errors' => $errors));
            }
        }else{
            $result = $this->recycling_model->project($this->input->get('project'));

            if($result->num_rows()){
                $info = $result->row_array();

                $info['csrf'] = $this->_get_csrf_nonce();
                $info['profit'] = (float)($this->config->item('profit')/(12*100));
                $title = '编辑项目 '.$info['realname'].':'.$info['project_sn'];

                json_success(array('title'=>$title,'msg'=>$this->load->view('recycling/update',$info,TRUE)));
            }else{
                json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
            }
        }

    }

    public function checked()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            if($this->_valid_csrf_nonce() === FALSE){
                //json_error(array('msg' => lang('error_csrf'),'title'=>lang('error_title')));
            }
            $this->form_validation->set_rules('amount', '实收金额', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                $project_sn = $this->input->post('project_sn');
                $note = htmlspecialchars($this->input->post('editorValue'));
                $amount = $this->input->post('amount');
                $phone = $this->input->post('phone');
                $result = $this->recycling_model->project($project_sn);
                if(!$result->num_rows()){
                    json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
                }
                $project = $result->row_array();
                if(($project['amount']*100 == $amount*100) && $project['phone'] == $phone){
                    $this->recycling_model->push_state($project_sn,array(
                        'request'	=> var_export(array(
                            'amount' =>$amount,
                            '_amount' =>$this->input->post('_amount'),
                            'phone' =>$phone,
                            '_phone' =>$this->input->post('_phone')
                        ),TRUE),
                        'status'	=> $this->config->item('recycling_checked'),
                        'note' 		=> $note,
                        'call_func' => 'active_period',
                        'call_param' => $project_sn,
                    ));
                    $this->session->set_flashdata('success', sprintf("项目已核实！编号: %s",$project_sn));
                    json_success();
                }else{
                    json_error(array('errors' => array(
                        'amount' => lang("error_confirm_amount"),
                        'phone' => lang("error_confirm_phone"),
                    )));
                }
            }else {
                json_error(array('errors' => array(
                    'amount' => form_error('amount'),
                    'phone' => form_error('phone'),
                )));
            }
        }else{
            $result = $this->recycling_model->project($this->input->get('project'));
            if($result->num_rows()){
                $info = $result->row_array();
                $info['csrf'] = $this->_get_csrf_nonce();
                $info['start'] = date('Y-m-d',$info['addtime']);
                $info['end'] = $this->calculate_expired($info['addtime'],$info['period']);
                $info['histories'] = $this->recycling_model->histories($info['project_sn']);
                $title = '项目核实 '.$info['realname'].':'.$info['project_sn'];

                json_success(array('title'=>$title,'msg'=>$this->load->view('recycling/checking',$info,TRUE)));
            }else{
                json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
            }
        }
    }

    public function confirmed()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
        }
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            if($this->_valid_csrf_nonce() === FALSE){
                //json_error(array('msg' => lang('error_csrf'),'title'=>lang('error_title')));
            }
            $this->form_validation->set_rules('weight', '确认重量', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                $project_sn = $this->input->post('project_sn');
                $note = htmlspecialchars($this->input->post('editorValue'));
                $weight = $this->input->post('weight');
                $phone = $this->input->post('phone');
                $result = $this->recycling_model->project($project_sn);
                if(!$result->num_rows()){
                    json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
                }
                $project = $result->row_array();
                if(($project['weight']*100 == $weight*100) && $project['phone'] == $phone){
                    $this->recycling_model->push_state($project_sn,array(
                        'status'	=> $this->config->item('recycling_confirmed'),
                        'note' 		=> $note,
                        'request'	=> var_export(array(
                            'weight' =>$weight,
                            '_weight' =>$this->input->post('_weight'),
                            'phone' =>$phone,
                            '_phone' =>$this->input->post('_phone')
                        ),TRUE),
                        'call_func' => 'in_stock',
                        'call_param'=> array(
                            'project_sn' => $project_sn,
                            'title' => $project['realname'].':'.$project['phone'].':'.$project['weight'],
                            'weight'=> $weight,
                            'info' => maybe_serialize(array(
                                'project_sn' => $project['project_sn'],
                                'realname' => $project['realname'],
                                'phone' => $project['phone'],
                                'idnumber' => $project['idnumber'],
                                'price' => $project['price'],
                                'weight' => $project['weight'],
                                'amount' => $project['amount'],
                                'period' => $project['period'],
                                'total' => $project['total'],
                                'start' => $project['start'],
                                'end' => $project['end'],
                            )),
                            'note' => $note
                        )
                    ));
                    $this->session->set_flashdata('success', sprintf("项目已入库标记！编号: %s",$project_sn));

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
            $result = $this->recycling_model->project($this->input->get('project'));
            if($result->num_rows()){
                $info = $result->row_array();
                $info['csrf'] = $this->_get_csrf_nonce();
                $info['histories'] = $this->recycling_model->histories($info['project_sn']);

                $title = '项目入库 '.$info['realname'].':'.$info['project_sn'];
                json_success(array('title'=>$title,'msg'=>$this->load->view('recycling/confirming',$info,TRUE)));
            }else{
                json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
            }
        }
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
                $project_sn = $this->input->post('project_sn');
                $note = htmlspecialchars($this->input->post('editorValue'));
                $weight = $this->input->post('weight');
                $phone = $this->input->post('phone');
                $result = $this->recycling_model->project($project_sn);
                if(!$result->num_rows()){
                    json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
                }
                $project = $result->row_array();
                if( $project['phone'] == $phone){
                    $max = ($project['status_id'] == $this->config->item('recycling_expired')) ? $project['total']
                        : $this->calculate_current_total($project['start'],$project['weight']);
                    if($this->config->item('partial_taking')){
                        if($weight*100 > $max*100){
                            json_error(array('msg' => lang('error_total_max')));
                        }
                    }else if($weight*100 != $max*100){
                        json_error(array('msg' => lang('error_total_max')));
                    }
                    $this->recycling_model->push_state($project_sn,array(
                        'status'	=> $this->config->item('recycling_applied'),
                        'note' 		=> $note,
                        'request'	=> var_export(array(
                            'weight' =>$weight,
                            '_weight' =>$this->input->post('_weight'),
                            'phone' =>$phone,
                            '_phone' =>$this->input->post('_phone')
                        ),TRUE),
                        'call_func' => 'appling_weight',
                        'call_param' => array(
                            'project_sn'=>$project_sn,
                            'phone'=>$phone,
                            'weight'=>$weight,
                            'note' 	=> $note,
                        )

                    ));
                    $this->session->set_flashdata('success', sprintf("项目已申请提金！编号: %s",$project_sn));

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
            $result = $this->recycling_model->project($this->input->get('project'));
            if($result->num_rows()){
                $info = $result->row_array();
                $info['csrf'] = $this->_get_csrf_nonce();
                $info['max'] = ($info['status_id'] == $this->config->item('recycling_expired')) ? $info['total']
                    : $this->calculate_current_total($info['start'],$info['weight']);
                $info['histories'] = $this->recycling_model->histories($info['project_sn']);

                $title = '客户提金 '.$info['realname'].':'.$info['project_sn'];
                $info['partial_taking'] = $this->config->item('partial_taking');
                json_success(array('title'=>$title,'msg'=>$this->load->view('recycling/appling',$info,TRUE)));
            }else{
                json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
            }
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
                $project_sn = $this->input->post('project_sn');
                $note = htmlspecialchars($this->input->post('editorValue'));
                $weight = $this->input->post('weight');
                $phone = $this->input->post('phone');
                $result = $this->recycling_model->project($project_sn);
                if(!$result->num_rows()){
                    json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
                }
                $project = $result->row_array();
                $applied = $this->recycling_model->applied($project['project_id']);
                if(!$applied){
                    json_error(array('msg' => lang('error_no_applied') ));
                }
                if(($applied['weight']*100 == $weight*100) && $applied['phone'] == $phone){
                    $tmp = array(
                        'note' 		=> $note,
                        'request'	=> var_export(array(
                            'weight' =>$weight,
                            '_weight' =>$this->input->post('_weight'),
                            'phone' =>$phone,
                            '_phone' =>$this->input->post('_phone'),
                            '_file' =>$this->input->post('_file'),
                            '_path' =>$this->input->post('_path')
                        ),TRUE),
                        'call_func' => 'out_stock',
                        'call_param' => array(
                            'project_sn'=>$project_sn,
                            'phone'=>$phone,
                            'weight'=>$weight,
                            'note' 	=> $note,
                            '_file' =>$this->input->post('_file'),
                            '_path' =>$this->input->post('_path')
                        )
                    );
                    if(!$this->config->item('partial_taking') || $project['weight']*100 == $applied['weight']*100){
                        $tmp['status'] = $this->config->item('recycling_finished');
                    }

                    $this->recycling_model->push_state($project_sn,$tmp);
                    $this->session->set_flashdata('success', sprintf("项目申请提金已出库！编号: %s",$project_sn));

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
            $result = $this->recycling_model->project($this->input->get('project'));
            if($result->num_rows()){
                $info = $result->row_array();
                $applied = $this->recycling_model->applied($info['project_id']);
                if(!$applied){
                    json_error(array('msg' => lang('error_no_applied') ));
                }
                $info['applied_weight'] = number_format($applied['weight'],2);
                $info['applied_phone'] = $applied['phone'];
                $info['csrf'] = $this->_get_csrf_nonce();
                $info['histories'] = $this->recycling_model->histories($info['project_sn']);

                $title = '提金出库 '.$info['realname'].':'.$info['project_sn'];

                json_success(array('title'=>$title,'msg'=>$this->load->view('recycling/taking',$info,TRUE)));
            }else{
                json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
            }
        }
    }

    public function refused()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        $project_sn = $this->input->post('project_sn');
        $reason = $this->input->post('value');
        if(!$project_sn || !$reason ){
            json_error();
        }
        if(strlen($reason) < 10){
            json_error(array('msg'=>lang('error_reason_length'),'title'=>lang('error_title')));
        }
        $result = $this->recycling_model->project($project_sn);
        if(!$result->num_rows()){
            json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
        }
        if($this->recycling_model->push_state($project_sn,array(
            'status'=> $this->config->item('recycling_refused'),
            'note' 	=> $reason
        ))){
            $this->session->set_flashdata('success', sprintf("项目已驳回！编号: %s",$project_sn));
            json_success();
        }
        json_error();
    }

    public function terminated()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        $project_sn = $this->input->post('project_sn');
        $reason = $this->input->post('value');
        if(!$project_sn || !$reason ){
            json_error();
        }
        if(strlen($reason) < 10){
            json_error(array('msg'=>lang('error_reason_length'),'title'=>lang('error_title')));
        }
        $result = $this->recycling_model->project($project_sn);
        if(!$result->num_rows()){
            json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
        }
        if($this->recycling_model->push_state($project_sn,array(
            'status'=> $this->config->item('recycling_terminated'),
            'note' 	=> $reason,
            'call_func' => 'trash_bin',
            'call_param' => array($project_sn,$reason)
        ))){
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

    public function cancle()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        $project_sn = $this->input->post('project_sn');
        $reason = $this->input->post('value');
        if(!$project_sn || !$reason ){
            json_error();
        }
        if(strlen($reason) < 10){
            json_error(array('msg'=>lang('error_reason_length'),'title'=>lang('error_title')));
        }
        $result = $this->recycling_model->project($project_sn);
        if(!$result->num_rows()){
            json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
        }
        $info = $result->row_array();
        if($this->recycling_model->push_state($project_sn,array(
            'status' => strtotime(date('Y-m-d')) >= strtotime($info['end']) ? $this->config->item('recycling_expired') : $this->config->item('recycling_confirmed'),
            'note' 	=> $reason,
            'call_func' => 'cancle_applied',
            'call_param' => $info['project_id']
        ))){
            $this->session->set_flashdata('success', sprintf("项目已取消提金申请！编号: %s",$project_sn));
            json_success();
        }
        json_error();
    }
}
