<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customer_model extends XY_Model{

    private $table = 'customer';
    private $stock_table = 'customer_stock';
    private $project_stock_table = 'project_stock';
    private $project_table = 'project_stock';
    private $group_table = 'customer_group';
    private $apply_table = 'customer_apply';
    private $history_table = 'customer_history';
    private $worker_table = 'worker';

    public function customer($customer_id,$simple=FALSE)
    {
        if($simple){
            return $this->get_where($this->table,array('customer_id'=>$customer_id));
        }
        $available_weight = "SELECT SUM(`weight`) AS `weight` FROM `gd_customer_stock` WHERE `customer_id` = `c`.`customer_id` ";
        $frozen_weight = "SELECT SUM(`weight`) AS `weight` FROM `gd_project_stock` WHERE `customer_id` = `c`.`customer_id` AND `status` = '1'";
        $this->db->select('c.*,g.title group_name,g.code,w.realname operator, w.username,w2.realname referrer,('.$available_weight.') available,('.$frozen_weight.') frozen', false);
        $this->db->from($this->table.' AS c')->order_by('c.addtime')->where("c.customer_id = ".$customer_id)->limit(1);
        $this->db->join($this->group_table.' AS g','g.group_id = c.group_id','left');
        $this->db->join($this->worker_table.' AS w', 'w.id = c.worker_id','left');
        $this->db->join($this->worker_table.' AS w2', 'w2.id = c.referrer_id','left');
        return $this->db->get();
    }

    public function customers($data=array())
    {
        if(is_array($data) && isset($data['where'])){
            $this->db->where($data['where']);
        }
        $available_weight = "SELECT SUM(`weight`) AS `weight` FROM `gd_customer_stock` WHERE `customer_id` = `c`.`customer_id` ";
        $frozen_weight = "SELECT SUM(`weight`) AS `weight` FROM `gd_project_stock` WHERE `customer_id` = `c`.`customer_id` AND `status` = '1'";

        $this->db->select('c.*,g.title group_name,g.code,w2.realname referrer,w.realname operator, w.username,('.$available_weight.') available,('.$frozen_weight.') frozen', false);
        $this->db->from($this->table.' AS c');
        $this->db->join($this->group_table.' AS g', 'g.group_id = c.group_id','left');
        $this->db->join($this->worker_table.' AS w', 'w.id = c.worker_id','left');
        $this->db->join($this->worker_table.' AS w2', 'w2.id = c.referrer_id','left');
        if(isset($data['order_by'])){
            $this->db->order_by($data['order_by']);
        }else{
            $this->db->order_by('c.lasttime desc');
        }
        $start = isset($data['start']) ? $data['start'] : 0 ;
        $limit = isset($data['limit']) ? $data['limit'] : 20 ;
        $this->db->limit($start,$limit);
        return $this->db->get();
    }

    public function group($group_id)
    {

        $this->db->select('atc.*,w.realname, w.username', false);
        $this->db->from($this->group_table.' AS atc')->where("atc.group_id = ".$group_id);
        $this->db->join($this->worker_table.' AS w', 'w.id = atc.worker_id')->limit(1);
        
        return $this->db->get();
    }


    public function get_groups($data=array())
    {
        if(is_array($data)){
            $this->db->where($data);
        }
        $this->db->select('g.*,w.realname, w.username', false);
        $this->db->from($this->group_table.' AS g')->order_by('g.addtime');
        $this->db->join($this->worker_table.' AS w', 'w.id = g.worker_id');
        
        return $this->db->get();
    }

    public function update_group($id,$data = array()){
        if(!$id || empty($data['title']) || empty($data['code'])){
            return false;
        }
        $tmp = array(
            'title'=>$data['title'],
            'code'=>$data['code'],
            'worker_id'=> $this->ion_auth->get_user_id(),
            'addtime' => time()
        );
        if(!empty($data['icon'])){
            $tmp['icon'] =$data['icon'];
        }
        $this->db->update($this->group_table,$tmp,array('group_id'=>$id));
        return $this->db->affected_rows();
    }

    public function insert_group($data){
        if(empty($data['title']) || empty($data['code'])){
            return false;
        }

        $this->db->insert($this->group_table,array(
            'title'=>$data['title'],
            'code'=>$data['code'],
            'icon'=>empty($data['icon']) ? '' : $data['icon'],
            'worker_id'=> $this->ion_auth->get_user_id(),
            'addtime' => time()
            ));
        return $this->db->insert_id();
    }

    public function stocks($customer_id,$limit=FALSE){
        $customer = $this->customer($customer_id);
        if($customer->num_rows()){
            $info = $customer->row_array();
            $this->db->select('s.*,w.realname operator, w.username,w.avatar', false);
            $this->db->from($this->stock_table.' AS s')->where(array("s.customer_id" => $info['customer_id']))->order_by('s.addtime desc');

            $this->db->join($this->worker_table.' AS w', 'w.id = s.worker_id');
            if(is_numeric($limit)){
                $this->db->limit($limit);
            }
            $result = $this->db->get();
            return $result->num_rows() ? $result->result_array() : FALSE;
        }
        return FALSE;
    }


    function code_check($code = '',$ignore_id){
        if (empty($code))
        {
            return FALSE;
        }

        $where = array(
            'code' => $code,
        );
        if($ignore_id){
            $where['group_id != '] = $ignore_id;
        }
        return $this->db->where($where)
            ->order_by("group_id", "ASC")
            ->limit(1)
            ->count_all_results($this->group_table) >0;
    }


    public function update_customer($id,$data = array()){
        if(!$id || empty($data['realname']) || empty($data['phone'])){
            return false;
        }

        $this->db->update($this->table,array(
            'realname'=>$data['realname'],
            'group_id'=>$data['group_id'],
            'phone'=>$data['phone'],
            'idnumber'=>(int)$data['idnumber'],
            'wechat'=>$data['wechat'],
            'qq'=>$data['qq'],
            'referrer_id'=>(int)$data['referrer_id'],
            'note'=>empty($data['note']) ? '' : $data['note'],
            'status'=>(int)$data['status'],
            'worker_id'=> $this->ion_auth->get_user_id(),
            'lasttime' => time()
        ),array('customer_id'=>$id));
        return $this->db->affected_rows();
    }

    public function insert_customer($data){
        if(empty($data['realname']) || empty($data['phone'])){
            return false;
        }
        $this->db->insert($this->table,array(
            'realname'=>$data['realname'],
            'phone'=>$data['phone'],
            'group_id'=>$data['group_id'],
            'idnumber'=>$data['idnumber'],
            'wechat'=>$data['wechat'],
            'qq'=>$data['qq'],
            'referrer_id'=>(int)$data['referrer_id'],
            'note'=>empty($data['note']) ? '' : $data['note'],
            'status'=>(int)$data['status'],
            'worker_id'=> $this->ion_auth->get_user_id(),
            'addtime' => time(),
            'lasttime' => time(),
        ));
        return $this->db->insert_id();
    }

    public function filter_customers($where,$start=0,$limit=20){
        $this->db->where(array('c.status' =>1));
        if(isset($where['filter_group'])){
            $this->db->where('c.group_id' , $where['filter_group']);
        }
        if(isset($where['filter_name'])){
            $this->db->group_start();
            $this->db->or_like('c.realname', $where['filter_name']);
            $this->db->or_like('c.phone' , $where['filter_name']);
            $this->db->or_like('c.idnumber' , $where['filter_name']);
            $this->db->group_end();
        }
        $query = $this->db->select("c.*,w.realname referrer")->from($this->table.' AS c')
            ->join($this->worker_table." AS w", 'w.id= c.referrer_id','left')
            ->limit($start,$limit)->get();

        if($query->num_rows()){
            return $query->result_array();
        }
        return FALSE;
    }

    public function appling_weight($customer_id,$data=array())
    {
        if(empty($customer_id)) return FALSE;
        $this->trigger_events('pre_appling_customer');

        $this->db->trans_begin();

        $customer = $this->customer($customer_id);
        if($customer->num_rows()){
            $info = $customer->row_array();
            $this->db->insert($this->apply_table,array(
                'customer_id' => $info['customer_id'],
                'phone' => $data['phone'],
                'weight' => (float)$data['weight'],
                'mode' => empty($data['mode']) ? 'appling': strtolower($data['mode']),
                'note' => $data['note'],
                'status' => 1,
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time()
            ));
            //后置回调
            if(isset($data['call_func']) && method_exists($this,$data['call_func'])){
                $this->{$data['call_func']}($data['call_param']);
            }
            $affected = $this->history($customer_id,array('note'=>'申请提金：'.number_format($data['weight'],2).'克'));
            if ($this->db->trans_status() === FALSE)
            {
                $this->db->trans_rollback();
                $this->trigger_events(array('post_appling_customer', 'post_appling_customer_unsuccessful'));
                $this->set_error('appling_unsuccessful');
                return FALSE;
            }
            $this->db->trans_commit();

            $this->trigger_events(array('post_appling_customer', 'post_appling_customer_successful'));
            $this->set_message('appling_successful');
            return $affected;
        }
        return FALSE;
    }

    public function applied($customer_id,$mode='appling'){
        if(!$mode || !$mode == 'all'){
            $this->db->where(array('mode'=>$mode));
        }
        $query = $this->db->where(array('customer_id'=>$customer_id,'status'=>1))->get($this->apply_table);
        if($query->num_rows()){
            return $query->row_array();
        }
        return FALSE;
    }

    public function cancle_applied($customer_id,$data=array()){
        $this->trigger_events('pre_cancle_appling');

        $this->db->trans_begin();
        $customer = $this->customer($customer_id);
        if($customer->num_rows()) {
            //$info = $customer->row_array();
            $applied = $this->applied($customer_id);
            if($applied){

                $this->db->delete($this->apply_table, array('customer_id' => $customer_id,'mode'=>'appling'));
                //后置回调
                if (isset($data['call_func']) && method_exists($this, $data['call_func'])) {
                    $this->{$data['call_func']}($data['call_param']);
                }
                $affected = $this->history($customer_id, array('note' => '取消提金：' . number_format($applied['weight'], 2) . '克'.(empty($data['note']) ? '' : '<br>'.$data['note'])));
                if ($this->db->trans_status() === FALSE) {
                    $this->db->trans_rollback();
                    $this->trigger_events(array('post_cancle_appling', 'post_cancle_appling_unsuccessful'));
                    $this->set_error('cancle_unsuccessful');
                    return FALSE;
                }
                $this->db->trans_commit();

                $this->trigger_events(array('post_cancle_appling', 'post_cancle_appling_successful'));
                $this->set_message('cancle_successful');
                return $affected;
            }
        }
        return FALSE;
    }

    public function projects($customer_id,$data=array())
    {
        $customer = $this->customer($customer_id);
        if($customer->num_rows()){
            if(is_array($data) && count($data)){
                $this->db->where($data);
            }
            $this->db->where(array('ps.customer_id'=>$customer_id));
            $profit_weight = "SELECT SUM(`weight`) AS `weight` FROM `gd_customer_stock` WHERE `mode` = 'profit' AND `customer_id` = `ps`.`customer_id` AND `project_sn` = `p`.`project_sn`  ";
            $query = $this->db->select("ps.status,p.addtime,ps.mode,ps.project_sn,ps.weight,ps.start,ps.info,w2.realname referrer,( ".$profit_weight." ) profit ",FALSE)
                ->from($this->project_stock_table." AS ps")->where(array('ps.status'=>1))
                ->join($this->worker_table.' AS w2', 'w2.id = ps.referrer_id','left')
                ->join($this->project_table." AS p","p.project_sn = ps.project_sn")->order_by('ps.addtime DESC')->get();
            return $query->num_rows() ? $query->result_array() : FALSE;
        }
        return FALSE;

    }

    public function history($customer_id,$data=array()){
        $this->db->insert($this->history_table,array(
            'customer_id' => $customer_id,
            'note' => empty($data['note']) ? '':$data['note'],
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time()
        ));

        return $this->db->insert_id();
    }

    public function get_apply($apply_id){
        return $this->db->select("a.*,c.realname")->from($this->apply_table." AS a")
            ->join($this->table." AS c","c.customer_id = a.customer_id",'left')
            ->where(array('a.apply_id'=>$apply_id))
            ->limit(1)->get();
    }

    public function taken_weight($apply_id,$data)
    {
        if(empty($apply_id)) return FALSE;
        $this->trigger_events('pre_cancle_appling');

        $this->db->trans_begin();
        $applied = $this->get_apply($apply_id);
        if($applied->num_rows()){
            $info = $applied->row_array();
            $this->db->delete($this->apply_table,array('apply_id'=>$apply_id));//删除申请
            //生成出库单 project_stock
            $tmp = array(
                'project_sn' => '',
                'note' => empty($data['note']) ? '' :$data['note'],
                'customer_id' => $info['customer_id'],
                'mode' => 'out',
                'notify' => 1,
                'weight' => (float)$info['weight']*(-1.00),
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time()
            );
            if(isset($data['file'])){
                $tmp['file'] = $this->format_file_value($data['file']);
            }
            $this->db->insert($this->stock_table,$tmp);
            $affected = $this->db->insert_id();
            //后置回调
            if(isset($data['call_func']) ){
                if(is_array($data['call_func'])){
                    foreach($data['call_func'] as $method => $params){
                        if(method_exists($this,$method)){
                            $this->{$method}($params);
                        }
                    }
                }else if(is_string($this,$data['call_func']) && method_exists($this,$data['call_func'])){
                    $this->{$data['call_func']}($data['call_param']);
                }
            }
            if ($this->db->trans_status() === FALSE) {
                $this->db->trans_rollback();
                $this->trigger_events(array('post_cancle_appling', 'post_cancle_appling_unsuccessful'));
                $this->set_error('cancle_unsuccessful');
                return FALSE;
            }
            $this->db->trans_commit();

            $this->trigger_events(array('post_cancle_appling', 'post_cancle_appling_successful'));
            $this->set_message('cancle_successful');
            return $affected;
        }
        return FALSE;
    }

    private function format_file_value($data){

        if(is_array($data) && count($data)){
            $_file = array();
            foreach($data as  $item){
                $_tmp = explode("|",$item);
                if(count($_tmp) > 1){
                    $_file[] = array('name'=> $_tmp[0],'path'=>$_tmp[1]);
                }
            }
            return $_file ? json_encode($_file):'';
        }
    }
}