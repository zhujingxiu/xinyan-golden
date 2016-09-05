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
        if($this->input->get('list')){
            json_response($this->_list($this->input->get()));
        }
        $this->layout->add_includes(array(
            array('type'=>'css','src'=>_ASSET_.'lib/datatables/dataTables.bootstrap.css'),
            //array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/jquery-ui/jquery-ui.min.css'),
        ));
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');
        $this->recycling_model->reset_locker(false,$this->worker_id);
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
                $photo = $this->recycling_model->files($row['project_sn'],'photo');
                $cover = '';
                if($photo->num_rows()){
                    $_info = $photo->row_array();
                    $photos = json_decode($_info['file'],TRUE);
                    if(is_array($photos)){
                        $first = current($photos);
                        $cover = '<img class="list-img" src="'.site_url($first['path']).'" alt="'.$first['name'].'" />';
                    }
                }
                $rows[] = array(
                    'DT_RowId'  => $row['project_sn'],
                    'status' 	=> lang('label_'.strtolower($row['code'])),
                    'sn'		=> $row['project_sn'],
                    'customer' 	=> $row['realname'].'<br>'.$row['phone'],
                    'referrer' 	=> $row['referrer'],
                    'gold'      => $row['type']=='goldbar' ? lang('text_goldbar'):lang('text_ornaments') . '<br>'.$cover,
                    'number'	=> $row['number'].lang('text_number_unit') ,
                    'origin'	=> number_format($row['origin_weight'],2).lang('text_weight_unit') ,
                    'appraiser'	=> $row['appraiser'],
                    'weight'	=> number_format($row['weight'],2).lang('text_weight_unit'),
                    'operator'	=> $row['operator'],
                    'lasttime'	=> $row['lasttime'] ? date('Y-m-d',$row['lasttime']).'<br>'.date('H:i:s',$row['lasttime']) :lang("text_unknown"),
                    'operation'	=> $this->recycling_operation($row['status_id'])
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
                    //$errors['agree'] = form_error('agree');
                }
                json_error(array('errors' => $errors));
            }
        }else{
            $info['agree'] = '';
            if($this->config->item('recycling_privacy')){
                $this->load->model('article/article_model');
                $article = $this->article_model->article($this->config->item('recycling_privacy'))->row_array();
                if(!empty($article['title'])) {
                    $info['agree'] = sprintf(lang('text_agree'), anchor(site_url('article/article/detail/'.$article['article_id']), $article['title'], 'target="_blank"'));
                }
            }
            $info['transferrers'] = $this->group_users('manager');
            $info['csrf'] = $this->_get_csrf_nonce();
            //var_dump($this->session->flashdata('csrfkey'));
            json_success(array('title'=>'添加项目','msg'=>$this->load->view('recycling/booking',$info,TRUE)));
        }
    }


    public function update()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
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
            if ($this->form_validation->run() == TRUE)
            {
                $result = $this->recycling_model->project($this->input->post('project_sn'));

                if(!$result->num_rows()){
                    json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
                }

                if($this->recycling_model->update($this->input->post('project_sn'),$this->input->post())){
                    $this->session->set_flashdata('success', '项目编辑成功！');
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
                );
                if($this->config->item('recycling_privacy')){
                    //$errors['agree'] = form_error('agree');
                }
                json_error(array('errors' => $errors));
            }
        }else{
            $result = $this->recycling_model->project($this->input->get('project'));
            if($result->num_rows()){
                $info = $result->row_array();
                $info['csrf'] = $this->_get_csrf_nonce();
                $info['photos'] = $info['invoices'] =$info['reports']=$info['privacies'] = FALSE;
                $_photo = $this->recycling_model->files($info['project_sn'],'photo');
                if($_photo->num_rows()){
                    $_info = $_photo->result_array();
                    foreach($_info as $item){
                        $info['photos'] = json_decode($item['file'],TRUE);
                    }
                }
                $_invoice = $this->recycling_model->files($info['project_sn'],'invoice');
                if($_invoice->num_rows()){
                    $_info = $_invoice->result_array();
                    foreach($_info as $item){
                        $info['invoices'] = json_decode($item['file'],TRUE);
                    }
                }
                $_report = $this->recycling_model->files($info['project_sn'],'report');
                if($_report->num_rows()){
                    $_info = $_report->result_array();
                    foreach($_info as $item){
                        $info['reports'] = json_decode($item['file'],TRUE);
                    };
                }
                $_privacy = $this->recycling_model->files($info['project_sn'],'privacy');
                if($_privacy->num_rows()){
                    $_info = $_privacy->result_array();
                    foreach($_info as $item){
                        $info['privacies'] = json_decode($item['file'],TRUE);
                    }
                }
                $title = '编辑项目 '.$info['realname'].':'.$info['project_sn'];
                $info['transferrers'] = $this->group_users('manager');
                //lock
                $info['locked'] = $info['relax'] = false;
                $info['editable'] = true;

                //set the locker is the current user_id
                if(empty($info['locker']) || $info['locker_id'] == $this->worker_id){
                    $this->recycling_model->set_locker($info['project_sn']);
                }else{
                    $info['locked'] = true;
                    $info['editable'] = false;
                    $title = sprintf(lang('text_lock'), $info['locker']);
                    if($this->inRole('manager')) {
                        $info['relax'] = true;
                        $info['text_confirm_relax'] = sprintf(lang('text_relax'),$info['locker']);
                    }
                }
                json_success(array('title'=>$title,'msg'=>$this->load->view('recycling/update',$info,TRUE),'editable'=>$info['editable']));
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
            $this->form_validation->set_rules('weight', '鉴定克重', 'required');
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
                        'request'	=> var_export(array(
                            'weight' =>$weight,
                            '_weight' =>$this->input->post('_weight'),
                            'phone' =>$phone,
                            '_phone' =>$this->input->post('_phone')
                        ),TRUE),
                        'status'	=> $this->config->item('recycling_checked'),
                        'note' 		=> $note,
                        'call_func' => 'active_start',
                        'call_param'=> $project_sn
                    ));
                    $this->session->set_flashdata('success', sprintf("项目已核实！编号: %s",$project_sn));
                    json_success();
                }else{
                    json_error(array('errors' => array(
                        'weight' => lang("error_confirm_weight"),
                        'phone' => lang("error_confirm_phone"),
                    )));
                }
            }else {
                json_error(array('errors' => array(
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

                $info['photos'] = $info['invoices'] =$info['reports']=$info['privacies'] = FALSE;
                $_photo = $this->recycling_model->files($info['project_sn'],'photo');
                if($_photo->num_rows()){
                    $_info = $_photo->result_array();
                    foreach($_info as $item){
                        $info['photos'] = json_decode($item['file'],TRUE);
                    }
                }
                $_invoice = $this->recycling_model->files($info['project_sn'],'invoice');
                if($_invoice->num_rows()){
                    $_info = $_invoice->result_array();
                    foreach($_info as $item){
                        $info['invoices'] = json_decode($item['file'],TRUE);
                    }
                }
                $_report = $this->recycling_model->files($info['project_sn'],'report');
                if($_report->num_rows()){
                    $_info = $_report->result_array();
                    foreach($_info as $item){
                        $info['reports'] = json_decode($item['file'],TRUE);
                    };
                }
                $_privacy = $this->recycling_model->files($info['project_sn'],'privacy');
                if($_privacy->num_rows()){
                    $_info = $_privacy->result_array();
                    foreach($_info as $item){
                        $info['privacies'] = json_decode($item['file'],TRUE);
                    }
                }

                $info['transferrers'] = $this->group_users('warehouser');
                $title = '项目核实 '.$info['realname'].':'.$info['project_sn'];
                //lock
                $info['locked'] = $info['relax'] = false;
                $info['editable'] = true;

                //set the locker is the current user_id
                if(empty($info['locker']) || $info['locker_id'] == $this->worker_id){
                    $this->recycling_model->set_locker($info['project_sn']);
                }else{
                    $info['locked'] = true;
                    $info['editable'] = false;
                    $title = sprintf(lang('text_lock'), $info['locker']);
                    if($this->inRole('manager')) {
                        $info['relax'] = true;
                        $info['text_confirm_relax'] = sprintf(lang('text_relax'),$info['locker']);
                    }
                }

                json_success(array('title'=>$title,'msg'=>$this->load->view('recycling/checking',$info,TRUE),'editable'=>$info['editable']));
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
                    $callback = array(
                        'project_instock'=> array(
                            'project_sn' => $project_sn,
                            'note' => $note
                        ),
                    );
                    if($this->config->item('growing_mode') == 't0'){
                        //T+0
                        $callback['project_growing'] = $project_sn;
                    }
                    $this->recycling_model->push_state($project_sn,array(
                        'status'	=> $this->config->item('recycling_confirmed'),
                        'note' 		=> $note,
                        'request'	=> var_export(array(
                            'weight' =>$weight,
                            '_weight' =>$this->input->post('_weight'),
                            'phone' =>$phone,
                            '_phone' =>$this->input->post('_phone')
                        ),TRUE),
                        'call_func' => $callback
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
                $info['photos'] = $info['invoices'] =$info['reports']=$info['privacies'] = FALSE;
                $_photo = $this->recycling_model->files($info['project_sn'],'photo');
                if($_photo->num_rows()){
                    $_info = $_photo->result_array();
                    foreach($_info as $item){
                        $info['photos'] = json_decode($item['file'],TRUE);
                    }
                }
                $_invoice = $this->recycling_model->files($info['project_sn'],'invoice');
                if($_invoice->num_rows()){
                    $_info = $_invoice->result_array();
                    foreach($_info as $item){
                        $info['invoices'] = json_decode($item['file'],TRUE);
                    }
                }
                $_report = $this->recycling_model->files($info['project_sn'],'report');
                if($_report->num_rows()){
                    $_info = $_report->result_array();
                    foreach($_info as $item){
                        $info['reports'] = json_decode($item['file'],TRUE);
                    };
                }
                $_privacy = $this->recycling_model->files($info['project_sn'],'privacy');
                if($_privacy->num_rows()){
                    $_info = $_privacy->result_array();
                    foreach($_info as $item){
                        $info['privacies'] = json_decode($item['file'],TRUE);
                    }
                }
                $title = '项目入库 '.$info['realname'].':'.$info['project_sn'];
                //lock
                $info['locked'] = $info['relax'] = false;
                $info['editable'] = true;

                //set the locker is the current user_id
                if(empty($info['locker']) || $info['locker_id'] == $this->worker_id){
                    $this->recycling_model->set_locker($info['project_sn']);
                }else{
                    $info['locked'] = true;
                    $info['editable'] = false;
                    $title = sprintf(lang('text_lock'), $info['locker']);
                    if($this->inRole('manager')) {
                        $info['relax'] = true;
                        $info['text_confirm_relax'] = sprintf(lang('text_relax'),$info['locker']);
                    }
                }
                json_success(array('title'=>$title,'msg'=>$this->load->view('recycling/confirming',$info,TRUE),'editable'=>$info['editable']));
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
        $tmp =array(
            'status'=> $this->config->item('recycling_terminated'),
            'note' 	=> $reason,
        );
        if($this->config->item('terminated_trash')){
            $tmp['call_func'] = array(
                'trash_bin'=> array('project_sn' => $project_sn,'reason' => $reason),
                'erp_stock'=> array('project_sn' => $project_sn,'reason' => $reason)
            );
        }
        if($this->recycling_model->push_state($project_sn,$tmp)){
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

    public function reset_locker()
    {
        $project_sn = $this->input->get('project_sn');
        if(!$project_sn){
            json_error();
        }
        $this->recycling_model->reset_locker($project_sn);
    }
}
