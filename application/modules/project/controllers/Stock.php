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
                $customer = $gold = array();
                $_customer = maybe_unserialize($row['customer']);
                $_gold = maybe_unserialize($row['gold']);
                if(is_array($_customer)){
                    if(isset($_customer['realname'])){
                        $customer[] = '客户姓名：'. $_customer['realname'];
                    }
                    if(isset($_customer['phone'])){
                        $customer[] = '手机号码：'. $_customer['phone'];
                    }
                    if(isset($_customer['idnumber'])){
                        $customer[] = '身份证号：'. $_customer['idnumber'];
                    }
                    if(isset($_customer['referrer'])){
                        $customer[] = '推荐人：'. $_customer['referrer'];
                    }
                }
                if(is_array($_gold)){
                    if(isset($_gold['price'])){
                        $gold[] = '实时金价：'. $_gold['price'];
                    }
                    if(isset($_gold['type'])){
                        $gold[] = '黄金种类：'. $_gold['type'];
                    }
                    if(isset($_gold['number'])){
                        $gold[] = '黄金件数：'. $_gold['number'];
                    }
                    if(isset($_gold['origin_weight'])){
                        $gold[] = '黄金克重：'. $_gold['origin_weight'];
                    }
                    if(isset($_gold['appraiser'])){
                        $gold[] = '鉴定人：'. $_gold['appraiser'];
                    }
                    if(isset($_gold['weight'])){
                        $gold[] = '实际克重：'. $_gold['weight'];
                    }
                    if(isset($_gold['amount'])){
                        $gold[] = '实收金额：'. $_gold['amount'];
                    }
                    if(isset($_gold['start'])){
                        $gold[] = '计息日期：'. $_gold['start'];
                    }
                }
                $rows[] = array(
                    'DT_RowId' => $row['trash_id'],
                    'sn' => $row['project_sn'],
                    'customer' => count($customer) ? implode("<br>",$customer) : lang('text_unknown'),
                    'gold' => count($gold) ? implode("<br>",$gold) : lang('text_unknown'),
                    'mode' => $row['mode'] == 'investing' ? '钱生金' : '金生金',
                    'operator' => $row['operator'],
                    'addtime' => $row['addtime'] ? date('Y-m-d', $row['addtime']) . '<br>' . date('H:i:s', $row['addtime']) : lang("text_unknown"),
                    'operation' => lang('button_trashing')
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