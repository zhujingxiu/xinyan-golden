<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stock_model extends XY_Model{

    private $table = 'project_stock';
    private $recycling_table = 'project_recycling';
    private $recycling_history_table = 'project_recycling_history';
    private $investing_table = 'project_investing';
    private $investing_history_table = 'project_investing_history';
    private $worker_table = 'worker';
    private $customer_table = 'customer';
    private $apply_table = 'customer_apply';
    private $file_table = 'project_file';
    public function project($sn,$simple=FALSE)
    {
        if(!$sn){return false;}
        if($simple){
            return $this->db->get_where($this->table,array('project_sn'=>$sn),1);
        }
        $this->db->select('p.*,w.realname operator, w.username', false);
        $this->db->from($this->table.' AS p')->where(array("p.project_sn" => $sn))->limit(1);
        $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id');
        return $this->db->get();
    }

    public function projects($data=array())
    {
        if(is_array($data) && isset($data['where'])){
            $this->db->where($data['where']);
        }
        $this->db->select('c.realname,c.phone,c.idnumber,p.stock_id,p.project_sn,p.mode,p.weight,p.start,p.info,p.addtime,w.realname operator, w.username,w2.realname referrer,', false);
        $this->db->from($this->table.' AS p');
        $this->db->join($this->customer_table.' AS c', 'c.customer_id = p.customer_id','left');
        $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id','left');
        $this->db->join($this->worker_table.' AS w2', 'w2.id = p.referrer_id','left');
        if(isset($data['order_by'])){
            $this->db->order_by($data['order_by']);
        }else{
            $this->db->order_by('p.lasttime desc');
        }

        $start = isset($data['start']) ? $data['start'] : 0 ;
        $limit = isset($data['limit']) ? $data['limit'] : 20 ;
        $this->db->limit($start,$limit);
        return $this->db->get();
    }

    public function delete($trash_id)
    {
        $info = $this->db->get_where(array('trash_id'=>$trash_id))->from($this->trash_table);
        if($info->num_rows()){
            $trash = $info->row_array();
            $this->db->delete($this->recycling_table,array('project_sn'=>$trash['project_sn']));
            $this->db->delete($this->investing_table,array('project_sn'=>$trash['project_sn']));
            $this->db->delete($this->trash_table,array('trash_id'=>$trash_id));
            $this->db->delete($this->file_table,array('project_sn'=>$trash['project_sn']));
            $this->db->delete($this->stock_table,array('project_sn'=>$trash['project_sn']));
            return $this->db->affected_rows();
        }
        return FALSE;
    }

}