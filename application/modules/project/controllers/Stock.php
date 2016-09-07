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
                $rows[] = array(
                    'DT_RowId' => $row['stock_id'],
                    'sn' => $row['project_sn'].'<br>'.($row['mode'] == 'investing' ? lang('text_investing') : lang('text_recycling')),
                    'customer' => $row['realname'].'<br>'.$row['phone'],
                    'referrer' => $row['referrer'],
                    'weight' => number_format($row['weight'],2) .lang('text_weight_unit'),
                    'start' => $row['start'],
                    'operator' => $row['operator'],
                    'profit' => number_format($row['profit'],2) .lang('text_weight_unit'),
                    'addtime' => $row['addtime'] ? date('Y-m-d', $row['addtime']) . '<br>' . date('H:i:s', $row['addtime']) : lang("text_unknown"),
                    'operation' => ''
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
}