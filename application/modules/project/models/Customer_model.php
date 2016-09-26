<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customer_model extends XY_Model{

    private $table = 'customer';
    private $stock_table = 'customer_stock';
    private $project_stock_table = 'project_stock';
    private $investing_table = 'project_investing';
    private $recycling_table = 'project_recycling';
    private $recycling_history_table = 'project_recycling_history';
    private $project_table = 'project_stock';
    private $group_table = 'customer_group';
    private $apply_table = 'customer_apply';
    private $history_table = 'customer_history';
    private $worker_table = 'worker';
    private $card_table = 'customer_card';
    private $file_table = 'project_file';

    public function customer($customer_id,$simple=FALSE)
    {
        if($simple){
            return $this->db->get_where($this->table,array('customer_id'=>$customer_id));
        }

        $frozen_weight = "SELECT SUM(`cs`.`weight`) AS `weight` FROM `".$this->db->dbprefix('customer_stock')."` AS cs WHERE `cs`.`customer_id` = `c`.`customer_id` AND `cs`.`mode`='frozen' AND `cs`.`status`='1'";
        $total_weight = "SELECT SUM(`cs`.`weight`) AS `weight` FROM `".$this->db->dbprefix('customer_stock')."` AS cs WHERE `cs`.`customer_id` = `c`.`customer_id` AND `cs`.`status`='1' AND `cs`.`frozen` NOT IN ('taking','renew','order') ";
        $available_weight = "( (".$total_weight.") - IF ( (".$frozen_weight.") >0 ,(".$frozen_weight."),0) )";

        $this->db->select('c.*,g.title group_name,g.code,w.realname operator, w.username,w2.realname referrer,('.$frozen_weight.') AS frozen,('.$total_weight.') AS totals,('.$available_weight.') AS available', false);
        $this->db->from($this->table.' AS c')->order_by('c.addtime')->where("c.customer_id = ".$customer_id)->limit(1);
        $this->db->join($this->group_table.' AS g','g.group_id = c.group_id','left');
        $this->db->join($this->worker_table.' AS w', 'w.id = c.worker_id','left');
        $this->db->join($this->worker_table.' AS w2', 'w2.id = c.referrer_id','left');
        return $this->db->get();
    }

    public function customers($data=array())
    {
        if(!$this->ion_auth->is_admin() && $this->ion_auth->get_company_id()){
            $where['c.company_id'] = $this->ion_auth->get_company_id();
        }
        if(is_array($data) && isset($data['where'])){
            $this->db->where($data['where']);
        }
        $frozen_weight = "SELECT SUM(`cs`.`weight`) AS `weight` FROM `".$this->db->dbprefix('customer_stock')."` AS cs WHERE `cs`.`customer_id` = `c`.`customer_id` AND `cs`.`mode`='frozen' AND `cs`.`status`='1'";
        $total_weight = "SELECT SUM(`cs`.`weight`) AS `weight` FROM `".$this->db->dbprefix('customer_stock')."` AS cs WHERE `cs`.`customer_id` = `c`.`customer_id` AND `cs`.`status`='1' AND `cs`.`frozen` NOT IN ('taking','renew','order') ";
        $available_weight = "( (".$total_weight.") - IF ( (".$frozen_weight.") >0 ,(".$frozen_weight."),0) )";

        $this->db->select('c.*,g.title group_name,g.code,w2.realname referrer,w.realname operator, w.username,('.$frozen_weight.') AS frozen,('.$total_weight.') AS totals ,'.$available_weight.' AS available', false);
        $this->db->from($this->table.' AS c');
        $this->db->join($this->group_table.' AS g', 'g.group_id = c.group_id','left');
        $this->db->join($this->worker_table.' AS w', 'w.id = c.worker_id','left');
        $this->db->join($this->worker_table.' AS w2', 'w2.id = c.referrer_id','left');

        if(isset($data['or_where'])){
            $this->db->group_start();
            $this->db->or_like(array(
                'g.title'=>$data['or_where'],
                'c.realname'=>$data['or_where'],
                'c.phone'=>$data['or_where'],
                'c.idnumber'=>$data['or_where'],
                'c.card_number'=>$data['or_where'],
                'w2.realname'=>$data['or_where'],
                'w.realname'=>$data['or_where'],
            ));
            $this->db->group_end();
        }

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

        $this->db->select('g.*,w.realname, w.username', false);
        $this->db->from($this->group_table.' AS g')->where("g.group_id = ".$group_id);
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
            $this->db->from($this->stock_table.' AS s')->where(array("s.customer_id" => $info['customer_id'],'s.notify'=>1,'s.status'=>1))->order_by('s.addtime desc,s.stock_id desc');

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
    public function bind_card($customer_id,$card_number,$card_serial)
    {
        $this->db->trans_begin();

        $this->db->update($this->table,array('card_number'=>$card_number),array('customer_id'=>$customer_id));
        $this->db->delete($this->card_table,array('card_serial'=>$card_serial));
        $this->db->insert($this->card_table,array('card_serial'=>$card_serial,'card_number'=>$card_number,'status'=>1));
        if ($this->db->trans_status() === FALSE) {
            $this->db->trans_rollback();
            return FALSE;
        }
        $this->db->trans_commit();
    }

    public function unbind($customer_id){
        $this->db->trans_begin();
        $customer = $this->customer($customer_id,TRUE);
        if($customer->num_rows()){
            $info = $customer->row_array();
            $this->db->update($this->table,array('card_number'=>''),array('customer_id'=>$customer_id));
            $this->db->delete($this->card_table,array('card_number'=>$info['card_number']));
            if ($this->db->trans_status() === FALSE) {
                $this->db->trans_rollback();
                return FALSE;
            }
            $this->db->trans_commit();
            return TRUE;
        }
        return FALSE;
    }

    public function get_bind($serial){
        return $this->db->select("c.*",false)
            ->from($this->card_table.' AS cc')
            ->join($this->table." AS c","c.card_number = cc.card_number","left")
            ->where(array("cc.card_serial"=>$serial))->limit(1)
            ->get();
    }

    public function get_customer_by_card_number($card_number){
        return $this->db->from($this->table)->where(array("card_number"=>$card_number))
            ->count_all_results() >0;
    }

    public function update_customer($id,$data = array()){
        if(!$id || empty($data['realname']) || empty($data['phone'])){
            return FALSE;
        }

        $this->db->update($this->table,array(
            'realname'=>$data['realname'],
            'group_id'=>$data['group_id'],
            'phone'=>$data['phone'],
            'idnumber'=>$data['idnumber'],
            'wechat'=>$data['wechat'],
            'qq'=>$data['qq'],
            'address'=>$data['address'],
            'email'=>$data['email'],
            'referrer_id'=>(int)$data['referrer_id'],
            'note'=>empty($data['note']) ? '' : $data['note'],
            'status'=>(int)$data['status'],
            'worker_id'=> $this->ion_auth->get_user_id(),
            'company_id' => $this->ion_auth->get_company_id(),
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
            'address'=>$data['address'],
            'email'=>$data['email'],
            'referrer_id'=>(int)$data['referrer_id'],
            'company_id' => $this->ion_auth->get_company_id(),
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

    public function projects($customer_id,$data=array())
    {
        $customer = $this->customer($customer_id);
        if($customer->num_rows()){
            if(is_array($data) && count($data)){
                $this->db->where($data);
            }
            $this->db->where(array('ps.customer_id'=>$customer_id));
            $profit_weight = "SELECT SUM(`weight`) AS `weight` FROM `".$this->db->dbprefix('customer_stock')."` WHERE `mode` = 'profit' AND `customer_id` = `ps`.`customer_id` AND `project_sn` = `p`.`project_sn`  ";
            $query = $this->db->select("p.addtime,ps.*,w2.realname referrer,( ".$profit_weight." ) stock_profit ",FALSE)
                ->from($this->project_stock_table." AS ps")
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


    public function appling_weight($customer_id,$data=array())
    {
        if(empty($customer_id)) return FALSE;
        $this->trigger_events('pre_appling_customer');

        $this->db->trans_begin();

        $customer = $this->customer($customer_id,TRUE);
        if($customer->num_rows()){
            $info = $customer->row_array();
            $mode = empty($data['mode']) ? 'taking': strtolower($data['mode']);
            $this->db->update($this->apply_table, array('status' => 0),array('customer_id' => $customer_id,'mode'=>$mode));//设置同类型申请失效
            //删除临时申请的冻结记录
            $this->db->delete($this->stock_table, array('mode'=>'frozen','frozen'=>$mode,'customer_id'=>$customer_id));
            //添加到申请列表

            $tmp = '';
            if($mode=='renew' && isset($data['renew']) && is_array($data['renew'])){
                $tmp = json_encode($data['renew']);
            }

            $apply_data = array(
                'customer_id' => $info['customer_id'],
                'phone' => $data['phone'],
                'weight' => (float)$data['weight'],
                'fee' => (float)$data['fee'],
                'mode' => $mode,
                'data' => $tmp,
                'note' => $data['note'],
                'status' => 1,
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time(),
                'ip' => $this->_prepare_ip($this->input->ip_address()),
            );
            if(isset($data['file'])){
                $apply_data['file'] = $this->format_file_value($data['file']);
            }
            $this->db->insert($this->apply_table,$apply_data);
            //冻结客户申请的部分克重
            $this->db->insert($this->stock_table,array(
                'customer_id' => $info['customer_id'],
                'weight' => (float)$data['weight'],
                'fee' => (float)$data['fee'],
                'mode' => 'frozen',
                'frozen'=>$mode,
                'note' => sprintf(lang('text_frozen_apply_'.$mode),$data['weight']),
                'notify' => 1,
                'status' => 1,
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time(),
            ));
            //后置回调
            if(isset($data['call_func']) && method_exists($this,$data['call_func'])){
                $this->{$data['call_func']}($data['call_param']);
            }
            $affected = $this->history($customer_id,array('note'=>lang('text_mode_').$mode.' '.number_format($data['weight'],2).lang('text_weight_unit')));
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
    public function applied($customer_id,$mode='taking'){
        $where =array(
            'a.customer_id'=>$customer_id,
            'a.status'=>1
        );
        if(!$mode || !$mode == 'all'){
            $where['mode']=$mode;
        }
        $query = $this->db->select("a.*,c.realname")->from($this->apply_table." AS a")
            ->join($this->table." AS c","c.customer_id = a.customer_id",'left')
            ->where($where)->get();
        if($query->num_rows()){
            $result = array();
            foreach($query->result_array() as $item){
                $result[$item['mode']] = $item;
            }
            return $result;
        }
        return FALSE;
    }

    public function cancle_applied($customer_id,$mode='taking',$data=array()){
        $this->trigger_events('pre_cancle_appling');

        $this->db->trans_begin();
        $mode = strtolower($mode);
        $appling = $this->applied($customer_id,$mode);
        if($appling) {
            $info = current($appling);
            //设置同类型申请失效
            $this->db->update($this->apply_table, array('status' => 0),array('apply_id' => $info['apply_id']));
            //删除申请临时冻结数据
            $this->db->delete($this->stock_table, array('mode'=>'frozen','frozen'=>$mode,'customer_id'=>$customer_id));

            $affected = $this->history($customer_id, array('note' => sprintf(lang('text_cancle_'.$mode), number_format($info['weight'], 2) ,(empty($data['note']) ? '' : $data['note']))));
            //后置回调
            if (isset($data['call_func']) && method_exists($this, $data['call_func'])) {
                $this->{$data['call_func']}($data['call_param']);
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
    public function get_apply($apply_id){
        return $this->db->select("a.*,c.realname")->from($this->apply_table." AS a")
            ->join($this->table." AS c","c.customer_id = a.customer_id",'left')
            ->where(array('a.apply_id'=>$apply_id))
            ->limit(1)->get();
    }

    public function free_stock($customer_id,$weight,$reason){
        if(empty($customer_id) || empty($weight)) {
            return False;
        }
        $this->trigger_events('pre_renew_recycling');

        $this->db->trans_begin();
        $result = $this->customer($customer_id,TRUE);
        if(!$result || !$result->num_rows()){
            return FALSE;
        }
        $customer = $result->row_array();
        $customer_stock = array(
            'project_sn' => '',
            'note' => $reason?$reason:sprintf(lang('text_stock_free'),number_format($weight,2),$customer['realname']),
            'customer_id' => $customer_id,
            'fee' => 0.00,
            'mode' => 'free',
            'notify' => 1,
            'weight' => (float)$weight*(1.00),
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time()
        );

        $this->db->insert($this->stock_table,$customer_stock);
        if ($this->db->trans_status() === FALSE)
        {
            $this->db->trans_rollback();
            $this->trigger_events(array('post_renew_recycling', 'post_renew_recycling_unsuccessful'));
            $this->set_error('renew_unsuccessful');
            return FALSE;
        }

        $this->db->trans_commit();

        $this->trigger_events(array('post_renew_recycling', 'post_renew_recycling_successful'));
        $this->set_message('renew_successful');
        return TRUE;
    }

    public function get_smscode($phone){

        $query = $this->db->get_where('customer_sms',array('phone'=>$phone));
        return $query->num_rows()?$query->row_array():false;
    }
    public function add_smscode($phone,$sms){
        $fields = array(
            'phone' => $phone,
            'code' => $sms,
            'time' => time()
        );
        return $this->db->insert('customer_sms',$fields);
    }

    public function del_smscode($phone){
        return $this->db->delete('customer_sms',array('phone'=>$phone));
    }

    public function get_customer($data){
        $this->db->from($this->table);

        if(isset($data['phone'])){
            $this->db->where(array('phone'=>$data['phone']));
        }
        if(isset($data['number'])){
            $this->db->group_start();
            $this->db->where(array('idnumber' => $data['number']));
            $this->db->or_where(array('card_number' => $data['number']));
            $this->db->group_end();
        }
        $query = $this->db->get();
        return $query->num_rows()
            ? $query->row_array()
            : False;

    }

    public function search_projects($customer_id)
    {
        $projects = array();
        $customer = $this->customer($customer_id);
        if($customer->num_rows()){

            $this->db->select('c.realname,c.phone,p.*,w.realname operator, w.username,w2.realname referrer,(p.weight * p.profit) stock_profit', false);
            $this->db->from($this->recycling_table.' AS p')->where(array('p.customer_id'=>$customer_id,'p.is_del'=>0));
            $this->db->join($this->table.' AS c', 'c.customer_id = p.customer_id','left');
            $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id','left');
            $this->db->join($this->worker_table.' AS w2', 'w2.id = p.referrer_id','left');
            $this->db->order_by('p.addtime asc');
            $query = $this->db->get();

            if($query->num_rows()){
                foreach($query->result_array() as $item){
                    if(empty($item['start'])){
                        $item['start'] = $this->calculate_start($item['addtime']);
                        $starttime  = strtotime($item['start']);
                        $item['end'] = calculate_end($starttime,$item['month']);
                    }
                    $item['mode'] = 'recycling';
                    $item['status'] = ($item['status_id'] != $this->config->item('recycling_terminated')) ? lang('label_growing') : lang('label_terminated');
                    $projects[$item['addtime']] = $item;
                }
            }

            //$query = $this->db->get_where($this->investing_table,array('customer_id'=>$customer_id,'is_del'=>0));
            $this->db->select('c.realname,c.phone,p.*,w.realname operator, w.username,w2.realname referrer,(p.weight * p.profit) stock_profit', false);
            $this->db->from($this->investing_table.' AS p')->where(array('p.customer_id'=>$customer_id,'p.is_del'=>0));
            $this->db->join($this->table.' AS c', 'c.customer_id = p.customer_id','left');
            $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id','left');
            $this->db->join($this->worker_table.' AS w2', 'w2.id = p.referrer_id','left');
            $this->db->order_by('p.addtime asc');
            $query = $this->db->get();
            if($query->num_rows()){
                foreach($query->result_array() as $item){
                    if(empty($item['start'])){
                        $item['start'] = $this->calculate_start($item['addtime']);
                        $starttime  = strtotime($item['start']);
                        $item['end'] = calculate_end($starttime,$item['month']);
                    }
                    $item['mode'] = 'investing';
                    $item['status'] = ($item['status_id'] != $this->config->item('investing_terminated')) ? lang('label_growing') : lang('label_terminated');
                    $projects[$item['addtime']] = $item;
                }
            }
            ksort($projects);
        }

        return $projects;
    }
}