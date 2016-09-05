<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/9/4
 * Time: 20:49
 */
class Dashboard_model extends XY_Model
{
    private $stock_table = "project_stock";
    private $customer_table = "customer";
    private $customer_stock_table = "customer_stock";
    private $worker_table = "worker";
    private $investing_table = "project_investing";
    private $recycling_table = "project_recycling";

    public function sum_weight()
    {
        $this->db->select_sum('weight','totals');
        $query = $this->db->get($this->stock_table);
        if($query->num_rows()){
            $_tmp = $query->row_array();
            $total = (float)$_tmp['totals'];// = '7305260.56';
        }else{
            $total = '0.00';
        }
        return format_weight($total);
    }

    public function sum_profit()
    {
        $this->db->select_sum('weight','totals');
        $query = $this->db->where(array('mode'=>'profit'))->get($this->customer_stock_table);
        if($query->num_rows()){
            $_tmp = $query->row_array();
            $total = (float)$_tmp['totals'];// = '7305260.56';
        }else{
            $total = '0.00';
        }
        return format_weight($total);
    }

    public function sum_customer()
    {

        $total =  $this->db->count_all($this->customer_table); ;
        return $total.' <small>'.lang('text_person_unit').'</small>';
    }

    public function sum_today()
    {
        $this->db->select_sum('weight','totals');
        $query = $this->db->where(array('addtime > '=> strtotime(date('Y-m-d'))))->get($this->stock_table);
        if($query->num_rows()){
            $_tmp = $query->row_array();
            $total = (float)$_tmp['totals'];// = '7305260.56';
        }else{
            $total = '0.00';
        }
        return format_weight($total);
    }

    public function latest($limit=10)
    {
        return $this->db->select("ps.*,c.realname , c.phone,w.realname referrer")->from($this->stock_table.' AS ps')
            ->where(array('ps.status'=>1))
            ->join($this->customer_table.' as c','c.customer_id = ps.customer_id','left')
            ->join($this->worker_table.' as w','w.id = ps.referrer_id','left')
            ->order_by('ps.addtime desc')
            ->limit($limit)
            ->get();
    }

    public function tasks()
    {

    }

    public function messages()
    {

    }
}