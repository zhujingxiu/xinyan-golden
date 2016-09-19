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
        $this->layout->add_includes(array(
            array('type' => 'css', 'src' => _ASSET_ . 'lib/datatables/dataTables.bootstrap.css'),
            //array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
            //array('type' => 'css', 'src' => _ASSET_ . 'lib/jquery-ui/jquery-ui.min.css'),
        ));
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');

        if ($this->input->get('list')) {
            json_response($this->_list($this->input->get()));
        }
        $this->layout->view('stock', $data);
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
                    'company' => $row['company'],
                    'customer' => $row['realname'].'<br>'.$row['phone'],
                    'status' => $row['status'] ? lang('label_growing') : lang('label_terminated'),
                    'referrer' => $row['referrer'],
                    'weight' => number_format($row['weight'],2) .lang('text_weight_unit'),
                    'period'	=> $period ."<br>".lang('text_profit').calculate_profit($row['profit'],$row['month']).lang('text_profit_unit') ,
                    'operator' => $row['operator'],
                    'profit' => number_format($row['stock_profit'],2) .lang('text_weight_unit'),
                    'addtime' => $row['addtime'] ? date('Y-m-d', $row['addtime']) . '<br>' . date('H:i:s', $row['addtime']) : lang("text_unknown"),
                    'operation' => sprintf(lang('button_detail'),'')
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
                'msg'=>$this->load->view('project',$info,TRUE),
                'mode'=>strtolower($info['mode']),
                'terminable'=>$info['status'] && $this->inRole('manager'),
                'print'=>$info['status'] && $this->inRole('manager')
            ));
        }else{
            json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
        }
    }
    public function storage()
    {
        if($msg = $this->session->flashdata('ajax_permission')){
            json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
        }
        $trash_id = $this->input->post('trash_id');
        if(!$trash_id ){
            json_error();
        }

        if($this->stock_model->delete($trash_id)){
            $this->session->set_flashdata('success', "项目已删除");
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
        $mode = $this->input->post('mode') ? $this->input->post('mode') : 'recycling';
        if(!$project_sn || !$reason){
            json_error();
        }
        if(strlen($reason) < 10){
            json_error(array('msg'=>lang('error_reason_length'),'title'=>lang('error_title')));
        }
        $result = $this->stock_model->project($project_sn);
        if(!$result->num_rows()){
            json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
        }

        if($this->stock_model->terminated($project_sn,$reason,$mode)){
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