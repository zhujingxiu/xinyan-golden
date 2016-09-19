<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Company_model extends CI_Model{

    private $table = 'worker_company';

    public function company($company_id)
    {

        $this->db->select('*', false);
        $this->db->from($this->table)->order_by('addtime')->where("company_id = ".$company_id)->limit(1);
        return $this->db->get();
    }

    public function companies($data=array())
    {
        if(is_array($data)){
            $this->db->where($data);
        }
        $this->db->select('c.*', false);
        $this->db->from($this->table.' AS c')->order_by('c.addtime');
        return $this->db->get();
    }

    public function update($id,$data = array()){
        if(!$id || empty($data['title']) ){
            return false;
        }

        $this->db->update($this->table,array(
            'title'=>$data['title'],
            'alias'=>$data['alias'],
            'status'=>(int)$data['status'],
            'addtime' => time()
        ),array('company_id'=>$id));
        return $this->db->affected_rows();
    }

    public function insert($data){
        if(empty($data['title'])){
            return false;
        }

        $this->db->insert($this->table,array(
            'title'=>$data['title'],
            'alias'=>$data['alias'],
            'status'=>(int)$data['status'],
            'addtime' => time()
        ));
        return $this->db->insert_id();
    }

    public function delete($company_id)
    {

        return $this->db->delete($this->table,array('company_id'=>$company_id));
    }

}