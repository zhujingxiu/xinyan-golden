<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Investing_model extends XY_Model{

    private $table = 'project_investing';
    private $status_table = 'project_investing_status';
    private $history_table = 'project_investing_history';
    private $worker_table = 'worker';
    private $customer_table = 'customer';

    public function project($sn)
    {
        if(!$sn){return false;}
        $this->db->select('p.*,pis.title status,pis.code,w.realname operator, w.username', false);
        $this->db->from($this->table.' AS p')->order_by('p.addtime')->where(array("p.project_sn" => $sn))->limit(1);
        $this->db->join($this->status_table.' AS pis','p.status_id = pis.status_id');
        $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id');
        return $this->db->get();
    }

    public function projects($data=array())
    {
        if(is_array($data)){
            $this->db->where($data);
        }
        $this->db->select('p.*,pis.title status,pis.code,w.realname operator, w.username', false);
        $this->db->from($this->table.' AS p')->order_by('p.addtime');
        $this->db->join($this->status_table.' AS pis','p.status_id = pis.status_id');
        $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id');
        return $this->db->get();
    }

    public function insert($data){
        $this->trigger_events('pre_insert_project');

        $this->db->trans_begin();

        $this->db->insert($this->table, array(
            'project_sn' => $this->generate_sn(),
            'customer_id' => $this->match_customer(array('phone'=>$data['phone'])),
            'realname' => $data['realname'],
            'phone' => $data['phone'],
            'idnumber' => $data['idnumber'],
            'wechat' => $data['wechat'],
            'referrer' => $data['referrer'],
            'price' => $data['price'],
            'weight' => $data['weight'],
            'period' => $data['period'],
            'amount' => $data['amount'],
            'total' => $data['total'],
            'note' => $data['note'],
            'status_id' => $this->config->item('investing_initial'),
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time()
        ));
        $project_id = $this->db->insert_id();
        $this->history($project_id,$this->config->item('investing_initial'),$data['note']);
        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            $this->trigger_events(array('post_insert_project', 'post_insert_project_unsuccessful'));
            $this->set_error('insert_unsuccessful');
            return FALSE;
        }

        $this->db->trans_commit();

        $this->trigger_events(array('post_insert_project', 'post_insert_project_successful'));
        $this->set_message('insert_successful');
        return TRUE;
    }

    public function update($project_sn,$data)
    {
        $info = $this->project($project_sn);
        if($info->num_rows()){
            $project = $info->row_array();
            $fileds = array();
            if(isset($data['realname'])){
                $fileds['realname'] = $data['realname'];
            }
            if(isset($data['phone'])){
                $fileds['phone'] = $data['phone'];
                $fileds['customer_id'] = $this->match_customer(array('phone'=>$data['phone']));
            }
            if(isset($data['referrer'])){
                $fileds['referrer'] = $data['referrer'];
            }

            if(isset($data['wechat'])){
                $fileds['wechat'] = $data['wechat'];
            }

            if(isset($data['weight'])){
                $fileds['weight'] = $data['weight'];
            }

            if(isset($data['amount'])){
                $fileds['amount'] = $data['amount'];
            }

            if(isset($data['total'])){
                $fileds['total'] = $data['total'];
            }

            if(isset($data['note'])){
                $fileds['note'] = $data['note'];
            }
            $fileds['worker_id'] = $this->ion_auth->get_user_id();
            $fileds['lasttime'] = time();
            $this->db->update($this->table,$fileds,array('project_sn'=>$project_sn));
            $this->db->delete($this->history_table,array('project_id'=>$project['project_id']));
            return $this->history($project['project_id'],$this->config->item('investing_initial'),$fileds['note']);

        }else{
            return FALSE;
        }
    }

    public function generate_sn(){
        $_sn = date('ymd').rand(100,999).date('H').rand(1,9).date('is');

        $this->db->where(array('project_sn'=>$_sn));
        if($this->db->count_all_results($this->table) >0){
            $this->generate_sn();
        }
        return $_sn;
    }

    public function match_customer($where){
        if(is_array($where) && count($where)){
            $result = $this->db->get_where($this->customer_table,$where,1)->row_array();
            if(!empty($result['customer_id']))
                return (int)$result['customer_id'];
        }
        return 0;
    }

    public function push_state($project_sn,$data)
    {
        $info = $this->project($project_sn);
        if($info->num_rows()) {
            $project = $info->row_array();
            $fileds = array();
            if (isset($data['status'])) {
                $fileds['status'] = $data['status'];
            }
            if(isset($data['note'])){
                $fileds['note'] = $data['note'];
            }
            if(isset($data['extra'])){
                $fileds['extra'] = htmlspecialchars($data['extra']);
            }
            $fileds['worker_id'] = $this->ion_auth->get_user_id();
            $fileds['lasttime'] = time();
            $this->db->update($this->table,$fileds,array('project_sn'=>$project_sn));
            return $this->history($project['project_id'],$this->config->item('investing_initial'),$fileds['note']);

        }
        return FALSE;
    }

    public function history($project_id,$status_id,$note=''){
        $this->db->insert($this->history_table,array(
            'project_id' => $project_id,
            'status_id' => $status_id,
            'note' => $note,
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time(),
            'ip' => $this->_prepare_ip($this->input->ip_address())
        ));
        return $this->db->insert_id();
    }



    public function update_article($id,$data = array()){
        if(!$id || empty($data['title']) || empty($data['category_id'])){
            return false;
        }

        $this->db->update($this->table,array(
            'title'=>$data['title'],
            'category_id'=>$data['category_id'],
            'text'=>$data['text'],
            'is_top'=>(int)$data['is_top'],
            'status'=>(int)$data['status'],
            'author_id'=> $this->ion_auth->get_user_id(),
            'addtime' => time()
        ),array('article_id'=>$id));
        return $this->db->affected_rows();
    }


}