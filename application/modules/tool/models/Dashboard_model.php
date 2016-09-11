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
    private $notify_table = "worker_notify";
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

    public function top_referrers($limit=12){
        return $this->db->select("SUM(ps.weight) totals,w.realname referrer,w.avatar")->from($this->stock_table.' AS ps')
            ->join($this->worker_table.' as w','w.id = ps.referrer_id','left')
            ->group_by('ps.referrer_id')
            ->having('SUM(ps.weight) > 0')
            ->order_by('SUM(ps.weight) desc')
            ->limit($limit)
            ->get();
    }

    public function tasks()
    {

    }

    public function notifications($limit)
    {
        return $this->db->select("wn.*,w.realname sender,w.avatar ")->from($this->notify_table.' AS wn')
            ->where(array('wn.receiver_id'=>$this->ion_auth->get_user_id(),'mode'=>'announcement'))
            ->join($this->worker_table.' as w','w.id = wn.sender_id','left')
            ->order_by("wn.is_read = '0',wn.addtime desc")
            ->limit($limit)
            ->get();
    }

    public function notify($data=array()){
        if(empty($data['title']))
            return FALSE;
        $this->db->trans_begin();
        $tmp = array(
            'sender_id' => $this->ion_auth->get_user_id(),
            'title' => $data['title'],
            'content' => htmlspecialchars($data['editorValue']),
            'mode' => 'announcement',
            'is_read' => 0,
            'status' => 1,
            'addtime' => time()
        );
        $all = FALSE;$log=array();
        $insert_batch = array();
        if(isset($data['member']) && is_array($data['member'])){
            foreach(array_unique($data['member']) as $id){
                if(!$id){
                    $all = TRUE;
                    break;
                }else{
                    if($id == $this->ion_auth->get_user_id()) continue;
                    $insert_batch[] = array(
                        'receiver_id' => $id
                    )+$tmp;
                    $log[] = $id;
                }

            }
        }
        if($all){
            $workers = $this->ion_auth_model->users()->result_array();
            foreach($workers as $item){

                if($item['id'] == $this->ion_auth->get_user_id()) continue;
                $insert_batch[] = array(
                    'receiver_id' => $item['id']
                )+$tmp;
                $log[] = $item['id'];
            }
        }

        if($insert_batch){
            $this->db->insert_batch($this->notify_table,$insert_batch);
        }
        $log_id = $this->activity(var_export(array(
            'datetime' => date('Y-m-d H:i:s'),
            'receivers' => implode(',',$log),
        ),TRUE));
        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            return FALSE;
        }else{

            $this->db->trans_commit();
            return $log_id;
        }
        return FALSE;
    }
}