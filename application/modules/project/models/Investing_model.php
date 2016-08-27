<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Investing_model extends XY_Model{

    private $table = 'project_investing';
    private $status_table = 'project_investing_status';
    private $history_table = 'project_investing_history';
    private $worker_table = 'worker';
    private $customer_table = 'customer';
    private $stock_table = 'project_stock';

    public function project($sn)
    {
        if(!$sn){return false;}
        $this->db->select('p.*,pis.title status,pis.code,w.realname operator, w.username', false);
        $this->db->from($this->table.' AS p')->where(array("p.project_sn" => $sn))->limit(1);
        $this->db->join($this->status_table.' AS pis','p.status_id = pis.status_id');
        $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id');
        return $this->db->get();
    }

    public function projects($data=array())
    {
        if(is_array($data) && isset($data['where'])){

            $this->db->where($data['where']);
        }
        $this->db->where(array('is_del'=>0));
        $this->db->select('p.*,pis.title status,pis.code,w.realname operator, w.username', false);
        $this->db->from($this->table.' AS p');
        $this->db->join($this->status_table.' AS pis','p.status_id = pis.status_id');
        $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id');
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
            'addtime' => time(),
            'lasttime' => time()
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
        $this->trigger_events('pre_update_project');

        $this->db->trans_begin();
        $info = $this->project($project_sn);
        if($info->num_rows()){
            $project = $info->row_array();
            $fileds = array();
            if(isset($data['realname'])){
                $fileds['realname'] = $data['realname'];
            }
            if(isset($data['idnumber'])){
                $fileds['idnumber'] = $data['idnumber'];
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
            $fileds['status_id'] = $this->config->item('investing_initial');
            $fileds['worker_id'] = $this->ion_auth->get_user_id();
            $fileds['lasttime'] = time();
            $this->db->update($this->table,$fileds,array('project_sn'=>$project_sn));
            //$this->db->delete($this->history_table,array('project_id'=>$project['project_id']));
            $history_id = $this->history($project['project_id'],$this->config->item('investing_initial'),$fileds['note']);
            if ($this->db->trans_status() === FALSE)
            {
                $this->db->trans_rollback();
                $this->trigger_events(array('post_update_project', 'post_update_project_unsuccessful'));
                $this->set_error('update_unsuccessful');
                return FALSE;
            }
            $this->db->trans_commit();

            $this->trigger_events(array('post_update_project', 'post_update_project_successful'));
            $this->set_message('update_successful');
            return $history_id;
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
        $this->trigger_events('pre_pushstate_project');

        $this->db->trans_begin();
        $info = $this->project($project_sn);
        if($info->num_rows()) {
            $project = $info->row_array();
            $fileds = array();
            if (isset($data['status'])) {
                $fileds['status_id'] = (int)$data['status'];
            }
            if(isset($data['note'])){
                $fileds['note'] = $data['note'];
            }
            $fileds['worker_id'] = $this->ion_auth->get_user_id();
            $fileds['lasttime'] = time();
            $this->db->update($this->table,$fileds,array('project_sn'=>$project_sn));

            $request = isset($data['request']) ? htmlspecialchars($data['request']) :'';
            if (isset($fileds['status_id'])) {
                $affected = $this->history($project['project_id'], $fileds['status_id'], $fileds['note'],$request);
            }else{
                $affected = $this->db->affected_rows();
            }

            if(isset($data['call_func']) && method_exists($this,$data['call_func'])){
                $this->{$data['call_func']}($data['call_param']);
                $this->activity($data['call_func'].'|'.$data['call_param']);
            }
            if ($this->db->trans_status() === FALSE)
            {
                $this->db->trans_rollback();
                $this->trigger_events(array('post_pushstate_project', 'post_pushstate_project_unsuccessful'));
                $this->set_error('pushstate_unsuccessful');
                return FALSE;
            }
            $this->db->trans_commit();

            $this->trigger_events(array('post_pushstate_project', 'post_pushstate_project_successful'));
            $this->set_message('pushstate_successful');
            return $affected;
        }
        return FALSE;
    }

    public function active_period($project_sn)
    {
        $info = $this->project($project_sn);$this->activity($project_sn.'|'.$info->num_rows());
        if($info->num_rows()) {
            $project = $info->row_array();
            $fileds['start'] = date('Y-m-d',$project['addtime']);
            $start = strtotime($fileds['start']);
            $fileds['end'] = date('Y-m-d',mktime(0,0,0,date('m',$start)+(int)$project['period'],date('d',$start)-1,date('Y',$start)));
            $fileds['worker_id'] = $this->ion_auth->get_user_id();
            $fileds['lasttime'] = time();
            $this->db->update($this->table,$fileds,array('project_sn'=>$project_sn));
            $this->activity($project['project_sn'].'|'.$this->db->last_query());
            return $this->db->affected_rows();
        }
        return FALSE;
    }

    public function in_stock($data=array())
    {
        $this->db->insert($this->stock_table,array(
            'project_sn' => empty($data['project_sn']) ? '' : $data['project_sn'],
            'title' => empty($data['title']) ? '' : $data['title'],
            'info' => empty($data['info']) ? '' : $data['info'],
            'note' => empty($data['note']) ? '' : $data['note'],
            'weight' => $data['weight']*(-1.00),
            'status' => 1,
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time(),
            'lasttime' => time(),
        ));

        return $this->db->insert_id();
    }

    public function history($project_id,$status_id,$note='',$request=''){
        $this->db->insert($this->history_table,array(
            'project_id' => $project_id,
            'status_id' => $status_id,
            'note' => $note,
            'request' => $request,
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time(),
            'ip' => $this->_prepare_ip($this->input->ip_address())
        ));
        return $this->db->insert_id();
    }

    public function histories($project_sn,$limit=FALSE){
        $project = $this->project($project_sn);
        if($project->num_rows()){
            $info = $project->row_array();
            $this->db->select('h.*,pis.title status,pis.code,w.realname operator, w.username,w.avatar', false);
            $this->db->from($this->history_table.' AS h')->where(array("h.project_id" => $info['project_id']))->order_by('h.addtime desc');
            $this->db->join($this->status_table.' AS pis','h.status_id = pis.status_id');
            $this->db->join($this->worker_table.' AS w', 'w.id = h.worker_id');
            if(is_numeric($limit)){
                $this->db->limit($limit);
            }
            $result = $this->db->get();
            return $result->num_rows() ? $result->result_array() : FALSE;
        }
        return FALSE;
    }

    public function hidden($project_sn){
        $this->db->update($this->table,array('is_del'=>1,'lasttime'=>time(),'worker_id'=>$this->ion_auth->get_user_id()),array('project_sn'=>$project_sn));
        return $this->db->affected_rows();
    }
}