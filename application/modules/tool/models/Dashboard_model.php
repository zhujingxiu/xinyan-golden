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
    private $worker_table = "worker";
    private $investing_table = "project_investing";
    private $recycling_table = "project_recycling";

    public function sum_weight()
    {
        $total = 1500;
        return $total.' <small>'.lang('text_weight_unit').'</small>';
    }

    public function sum_profit()
    {
        $total = 380;
        return $total.' <small>'.lang('text_weight_unit').'</small>';
    }

    public function sum_customer()
    {
        $total = 220;
        return $total.' <small>'.lang('text_person_unit').'</small>';
    }

    public function sum_today()
    {
        $total = 28;
        return $total.' <small>'.lang('text_weight_unit').'</small>';
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