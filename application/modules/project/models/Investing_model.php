<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Investing_model extends XY_Model{

    private $table = 'project_investing';
    private $status_table = 'project_investing_status';
    private $history_table = 'project_investing_history';
    private $worker_table = 'worker';
    private $customer_table = 'customer';
    private $customer_stock_table = 'customer_stock';
    private $stock_table = 'project_stock';
    private $file_table = 'project_file';
    private $mode = 'investing';
    public function project($sn)
    {
        if(!$sn){return false;}
        $this->db->select('p.*,pis.title status,pis.code,w.realname operator, w.username,c.realname,c.phone,c.idnumber,c.wechat,c.email,c.qq,w2.realname referrer,w3.realname locker', false);
        $this->db->from($this->table.' AS p')->where(array("p.project_sn" => $sn))->limit(1);
        $this->db->join($this->status_table.' AS pis','p.status_id = pis.status_id');
        $this->db->join($this->customer_table.' AS c', 'c.customer_id = p.customer_id','left');
        $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id');
        $this->db->join($this->worker_table.' AS w2', 'w2.id = p.referrer_id','left');
        $this->db->join($this->worker_table.' AS w3', 'w3.id = p.locker_id','left');
        return $this->db->get();
    }

    public function projects($data=array())
    {

        $where = array();
        $where['p.is_del'] = 0;
        if(!$this->ion_auth->is_admin() && $this->ion_auth->get_company_id()){
            $where['p.company_id'] = $this->ion_auth->get_company_id();
        }
        if(isset($data['where']) && is_array($data['where'])){
            $where += $data['where'];
        }

        $this->db->select('p.*,pis.title status,pis.code,c.realname,c.phone,w2.realname referrer,w.realname operator, w.username', false);
        $this->db->from($this->table.' AS p');
        $this->db->join($this->status_table.' AS pis','p.status_id = pis.status_id','left');
        $this->db->join($this->customer_table.' AS c', 'c.customer_id = p.customer_id','left');
        $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id','left');
        $this->db->join($this->worker_table.' AS w2', 'w2.id = p.referrer_id','left');

        $this->db->where($where);
        $this->db->group_start();
        $this->db->where(array('p.worker_id '=>$this->ion_auth->get_user_id()));
        $this->db->or_where(sprintf("find_in_set('%d', p.transferrer) !=",$this->ion_auth->get_user_id()),0);
        $this->db->group_end();

        if(isset($data['or_where'])){
            $this->db->group_start();
            $this->db->or_like(array(
                'p.project_sn'=>$data['or_where'],
                'c.realname'=>$data['or_where'],
                'c.phone'=>$data['or_where'],
                'p.weight'=>$data['or_where'],
                'p.payment'=>$data['or_where'],
                'w2.realname'=>$data['or_where'],
                'w.realname'=>$data['or_where'],
            ));
            $this->db->group_end();
        }

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
        $this->trigger_events('pre_insert_investing');

        $this->db->trans_begin();
        $customer_id = $this->match_customer(array('phone'=>$data['phone']));
        if(!$customer_id){
            $this->db->insert($this->customer_table,array(
                'realname' => $data['realname'],
                'phone' => $data['phone'],
                'idnumber' => $data['idnumber'],
                'wechat' => $data['wechat'],
                'referrer_id' => $data['referrer'],
                'company_id' => $this->ion_auth->get_company_id(),
                'status' => 1,
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time(),
                'lasttime' => time()
            ));
            $customer_id = $this->db->insert_id();
        }
        $project_sn = $this->generate_sn($this->mode);
        $this->db->insert($this->table, array(
            'project_sn' => $project_sn,
            'customer_id' => $customer_id,
            'referrer_id' => $data['referrer'],
            'company_id' => $this->ion_auth->get_company_id(),
            'price' => $data['price'],
            'weight' => $data['weight'],
            'transferrer' => $data['transferrer'],
            'month' => (int)$data['month'],
            'profit' => (float)$data['profit'],
            'payment' => $data['payment'],
            'amount' => calculate_amount($data['price'],$data['weight']),
            'note' => $data['note'],
            'status_id' => $this->config->item('investing_initial'),
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time(),
            'lasttime' => time()
        ));
        $project_id = $this->db->insert_id();
        if(isset($data['privacy']) && is_array($data['privacy'])){
            $this->db->insert($this->file_table,array(
                'project_sn' => $project_sn,
                'dir' => 'privacy',
                'mode' => $this->mode,
                'file' => $this->format_file_value($data['privacy']),
                'status' => 1,
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time(),
            ));
        }
        $this->history($project_id,$this->config->item('investing_initial'),$data['note']);
        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            $this->trigger_events(array('post_insert_investing', 'post_insert_investing_unsuccessful'));
            $this->set_error('insert_unsuccessful');
            return FALSE;
        }

        $this->db->trans_commit();

        $this->trigger_events(array('post_insert_investing', 'post_insert_investing_successful'));
        $this->set_message('insert_successful');
        return TRUE;
    }

    public function files($project_sn,$type=FALSE){
        $info = $this->project($project_sn,TRUE);
        if($info->num_rows()) {
            //$project = $info->row_array();
            if($type){
                $this->db->where(array('dir'=>strtolower($type)));
            }
            $this->db->where(array('project_sn'=>$project_sn,'mode'=>$this->mode));
            return $this->db->get($this->file_table);
        }

        return FALSE;
    }
    public function update($project_sn,$data)
    {
        $this->trigger_events('pre_update_inversting');

        $this->db->trans_begin();
        $info = $this->project($project_sn);
        if($info->num_rows()){
            $project = $info->row_array();
            $fileds = array(
                'referrer_id' => $data['referrer'],
                'note' => $data['note'],
                'weight' => $data['weight'],
                'transferrer' => $data['transferrer'],
                'month' => (int)$data['month'],
                'profit' => (float)$data['profit'],
                'payment' => $data['payment'],
                'amount' => calculate_amount($project['price'],$data['weight']),
                'status_id' => $this->config->item('investing_initial'),
                'worker_id' => $this->ion_auth->get_user_id(),
                'lasttime' => time()
            );

            $this->db->update($this->table,$fileds,array('project_sn'=>$project_sn));

            $history_id = $this->history($project['project_id'],$this->config->item('investing_initial'),$fileds['note']);
            if ($this->db->trans_status() === FALSE)
            {
                $this->db->trans_rollback();
                $this->trigger_events(array('post_update_inversting', 'post_update_inversting_unsuccessful'));
                $this->set_error('update_unsuccessful');
                return FALSE;
            }
            $this->db->trans_commit();

            $this->trigger_events(array('post_update_inversting', 'post_update_inversting_successful'));
            $this->set_message('update_successful');
            return $history_id;
        }else{
            return FALSE;
        }
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
            if(isset($data['transferrer'])){
                $fileds['transferrer'] = $data['transferrer'];
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

            //后置回调
            if(isset($data['call_func']) ){
                if(is_array($data['call_func'])){
                    foreach($data['call_func'] as $method => $params){
                        if(method_exists($this,$method)){
                            $this->{$method}($params);
                        }
                    }
                }else if(is_string($data['call_func']) && method_exists($this,$data['call_func'])){
                    $this->{$data['call_func']}($data['call_param']);
                }
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
    public function return_transfer($data){
        if(empty($data['project_sn']) || empty($data['status_id'])) return FALSE;
        $project = $this->project($data['project_sn']);
        if($project->num_rows()) {
            $info = $project->row_array();
            $query = $this->db->select()->from($this->history_table)
                ->where(array('project_id'=>$info['project_id'],'status_id'=>$data['status_id']))
                ->order_by('addtime desc')
                ->limit(1)
                ->get();
            if($query->num_rows()){
                $log = $query->row_array();
                if($log['worker_id']){
                    $this->db->update($this->table,array('transferrer'=>$log['worker_id']),array('project_sn'=>$data['project_sn']));
                    return $this->db->affected_rows();
                }
            }
        }
        return FALSE;
    }

    protected function calculate_start($addtime)
    {
        $start = FALSE;
        switch(strtolower($this->config->item('growing_mode'))){
            case 't0':
                $start = date('Y-m-d',$addtime);
                break;
            case 't1':
                $start = date('Y-m-d',$addtime+24*60*60);
                break;
        }
        return $start;
    }
    public function project_checked($project_sn){
        if(empty($project_sn) ) return FALSE;
        $project = $this->project($project_sn);
        if($project->num_rows()) {
            $info = $project->row_array();
            $start = $this->calculate_start($info['addtime']);
            $tmp = array('start'=>$start,'lasttime'=>time(),'worker_id'=>$this->ion_auth->get_user_id());
            if($info['month']){
                $tmp['end'] = calculate_end(strtotime($start),$info['month']);
            }
            $this->db->update($this->table,$tmp,array('project_sn'=>$info['project_sn']));

            $tmp = array(
                'customer_id'=>$info['customer_id'],
                'project_sn'=>$info['project_sn'],
                'weight'=>$info['weight'],
                'addtime'=>time(),
                'mode'=>'frozen',
                'frozen'=>'checking',
                'fee'=>0.00,
                'notify'=>1,
                'status'=>1,
                'note'=>sprintf(lang('text_porject_frozen_weight'),$project_sn,number_format($info['weight'],2)),
                'worker_id'=>$this->ion_auth->get_user_id()
            );
            $this->db->insert($this->customer_stock_table,$tmp);
            return $this->db->affected_rows();
        }
        return FALSE;
    }
    public function project_instock($data=array())
    {
        if(empty($data['project_sn'])) return FALSE;
        $project_sn = $data['project_sn'];
        $info = $this->project($project_sn);
        if($info->num_rows()) {
            $project = $info->row_array();

            $referrer = $this->ion_auth->get_worker($project['referrer_id']);
            $tmp = array(
                'project_sn' => $project_sn,
                'customer_id' => $project['customer_id'],
                'referrer_id' => $project['referrer_id'],
                'company_id' => $project['company_id'],
                'title' => '项目'.$project_sn.'存金'.number_format($project['weight'],2).'克',
                'weight'=> (float)$project['weight'],
                'month'=> $project['month'],
                'start'=> $project['start'],
                'end'=> $project['end'],
                'profit'=> $project['profit'],
                'info' => maybe_serialize(array(
                    'project_id' => $project['project_id'],
                    'realname' => $project['realname'],
                    'phone' => $project['phone'],
                    'idnumber' => $project['idnumber'],
                    'wechat' => $project['wechat'],
                    'price' => $project['price'],
                    'amount' => $project['amount'],
                    'weight' => $project['weight'],
                    'referrer' => empty($referrer['realname']) ? '' :$referrer['realname'],
                    'payment'=> $project['payment'],
                )),
                'note' => empty($data['note'])?'':$data['note'],
                'mode' => $this->mode,
                'status' => 1,
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time(),
                'lasttime' => time(),
            );

            $this->db->insert($this->stock_table, $tmp);
            return $this->db->insert_id();
        }
        return FALSE;
    }


    public function project_growing($project_sn){
        if(empty($project_sn)) return FALSE;

        $info = $this->project($project_sn);
        if($info->num_rows()) {
            return $this->push_state($project_sn,array(
                'status'	=> $this->config->item('investing_growing'),
                'note' 		=> lang('text_auto_growing'),
            ));
        }

        return FALSE;
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
            $this->db->from($this->history_table.' AS h')->where(array("h.project_id" => $info['project_id']))->order_by('h.addtime desc,h.history_id desc');
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

    public function get_status_by_code($code)
    {
        $query = $this->db->where(array('code'=>strtolower($code)))->from($this->status_table)->get()->limit(1);
        return $query->num_rows() ? $query->row_array() : FALSE;
    }

    public function reset_locker($project_sn=false,$locker=false){
        $where= array();
        if($project_sn){
            $where['project_sn'] = $project_sn;
        }
        if($locker){
            $where['locker_id'] = (int)$locker;
        }else{
            $where['locker_id'] = (int)$this->ion_auth->get_user_id();
        }
        $this->db->update($this->table,array('locker_id' => 0),$where);
        return TRUE;
    }

    public function set_locker($project_sn,$user_id=false){
        $value = $user_id ? (int)$user_id : (int)$this->ion_auth->get_user_id();
        $this->db->update($this->table,array('locker_id' =>$value),array('project_sn' =>$project_sn));
        return $this->db->last_query();
    }
}