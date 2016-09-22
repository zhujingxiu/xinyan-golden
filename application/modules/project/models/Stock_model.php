<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stock_model extends XY_Model{

    private $table = 'project_stock';
    private $recycling_table = 'project_recycling';
    private $recycling_history_table = 'project_recycling_history';
    private $recycling_status_table = 'project_recycling_status';
    private $investing_table = 'project_investing';
    private $investing_history_table = 'project_investing_history';
    private $investing_status_table = 'project_investing_status';
    private $worker_table = 'worker';
    private $company_table = 'worker_company';
    private $customer_table = 'customer';
    private $customer_stock_table = 'customer_stock';
    private $file_table = 'project_file';
    private $trash_table = 'project_trash';
    private $apply_table = 'customer_apply';
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
        $profit_weight = "SELECT SUM(`weight`) AS `weight` FROM `gd_customer_stock` WHERE `project_sn` = `p`.`project_sn` AND `mode`='profit'";
        $this->db->select('cp.title AS company ,cp.alias short_title,c.realname,c.phone,c.idnumber,p.*,w.realname operator, w.username,w2.realname referrer,('.$profit_weight.') stock_profit', false);
        $this->db->from($this->table.' AS p');
        $this->db->join($this->customer_table.' AS c', 'c.customer_id = p.customer_id','left');
        $this->db->join($this->company_table.' AS cp', 'cp.company_id = p.company_id','left');
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
    public function files($project_sn,$type=FALSE,$mode='recycling'){
        $info = $this->project($project_sn,TRUE);
        if($info->num_rows()) {
            //$project = $info->row_array();
            if($type){
                $this->db->where(array('dir'=>strtolower($type)));
            }
            $this->db->where(array('project_sn'=>$project_sn,'mode'=>$mode));
            return $this->db->get($this->file_table);
        }

        return FALSE;
    }

    private function _project_table($mode){
        if($mode=='investing'){
            $table = $this->investing_table;
        }else{
            $table = $this->recycling_table;
        }
        return $table;
    }

    private function _project_history_table($mode){
        if($mode=='investing'){
            $table = $this->investing_history_table;
        }else{
            $table = $this->recycling_history_table;
        }
        return $table;
    }

    private function _project($project_sn,$mode,$simple =FALSE){
        if($simple){
            $project = $this->db ->where(array('project_sn'=>$project_sn))->get($this->_project_table($mode));
        }else {
            if ($mode == 'recycling') {
                $fileds = 'p.*,c.realname,c.phone,c.idnumber,c.wechat,w.realname referrer,w1.realname appraiser';
            } else {
                $fileds = 'p.*,c.realname,c.phone,c.idnumber,c.wechat,w.realname referrer';
            }
            $this->db->select($fileds, false)->from($this->_project_table($mode) . " AS p");
            $this->db->join($this->customer_table . " AS c", "c.customer_id = p.customer_id", 'left');
            $this->db->join($this->worker_table . " AS w", "w.id = p.referrer_id", 'left');
            if ($mode == 'recycling') {
                $this->db->join($this->worker_table . " AS w1", "w1.id = p.appraiser_id", 'left');
            }
            $this->db->where(array('p.project_sn' => $project_sn));
            $project = $this->db->get();
        }
        if($project->num_rows()){
            return $project->row_array();
        }
        return FALSE;
    }

    public function histories($project_sn,$limit=FALSE,$mode){
        if($mode=='investing'){
            $history_table = $this->investing_history_table;
            $status_table = $this->investing_status_table;
        }else{
            $history_table = $this->recycling_history_table;
            $status_table = $this->recycling_status_table;
        }
        $project = $this->_project($project_sn,$mode,TRUE);
        if($project){
            $this->db->select('h.*,pis.title status,pis.code,w.realname operator, w.avatar', false);
            $this->db->from($history_table.' AS h')->where(array("h.project_id" => $project['project_id']))->order_by('h.addtime desc,h.history_id desc');
            $this->db->join($status_table.' AS pis','h.status_id = pis.status_id','left');
            $this->db->join($this->worker_table.' AS w', 'w.id = h.worker_id','left');
            if(is_numeric($limit)){
                $this->db->limit($limit);
            }
            $result = $this->db->get();
            return $result->num_rows() ? $result->result_array() : FALSE;
        }
        return FALSE;
    }

    public function terminated($project_sn,$reason='',$mode='recycling',$profit=''){
        $this->trigger_events('pre_terminated_project');
        $this->db->trans_begin();
        $project = $this->_project($project_sn,$mode);
        if($project){
            //  update terminated status for project table and history table
            $fileds = array(
                'status_id' => $mode=='investing' ? (int)$this->config->item('investing_terminated') : (int)$this->config->item('recycling_terminated'),
                'note' => $reason,
                'worker_id' => $this->ion_auth->get_user_id(),
                'lasttime' => time()
            );
            $this->db->update($this->_project_table($mode),$fileds,array('project_sn'=>$project_sn));
            $this->db->insert($this->_project_history_table($mode),array(
                'project_id' => $project['project_id'],
                'status_id' => $fileds['status_id'],
                'note' => $reason,
                'request' => '',
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time(),
                'ip' => $this->_prepare_ip($this->input->ip_address())
            ));
            $affected = $this->db->insert_id();
            // update status =0 for stock table
            $this->db->update($this->table,array('status'=>0), array('project_sn'=>$project_sn));
            // insert mode = in for customer stock table

            $this->db->update($this->customer_stock_table,array('status'=>0), array('customer_id' => $project['customer_id'],'project_sn'=>$project_sn,'mode'=>'frozen','frozen'=>'checking'));
            $this->db->insert($this->customer_stock_table,array(
                'customer_id' => $project['customer_id'],
                'mode' => 'in',
                'project_sn' => $project_sn,
                'weight' => $project['weight'],
                'notify' => 1,
                'note' => $reason,
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time()
            ));
            //close stock table ,relax mode = in  project weight and calculate project unfinished profit insert into customer stock table

            if($profit === FALSE) {
                if (is_date($project['start']) && is_date($project['end'])) {
                    if (time() < strtotime($project['end'])) {
                        $number = floor((time() - strtotime($project['start'])) / (24 * 60 * 60 * 30));
                        $this->db->insert($this->customer_stock_table, array(
                            'customer_id' => $project['customer_id'],
                            'mode' => 'profit',
                            'project_sn' => $project_sn,
                            'weight' => $this->calculate_unfinished_profit($project['month'], $project['profit'], $number, $project['weight']),
                            'notify' => 1,
                            'note' => lang('text_unfinished_profit'),
                            'worker_id' => $this->ion_auth->get_user_id(),
                            'addtime' => time()
                        ));
                    }
                }
            }else{
                $this->db->insert($this->customer_stock_table, array(
                    'customer_id' => $project['customer_id'],
                    'mode' => 'profit',
                    'project_sn' => $project_sn,
                    'weight' => $profit,
                    'notify' => 1,
                    'note' => lang('text_unfinished_profit'),
                    'worker_id' => $this->ion_auth->get_user_id(),
                    'addtime' => time()
                ));
            }

            if ($this->db->trans_status() === FALSE)
            {
                $this->db->trans_rollback();
                $this->trigger_events(array('post_terminated_project', 'post_terminated_project_unsuccessful'));
                $this->set_error('terminated_unsuccessful');
                return FALSE;
            }
            $this->db->trans_commit();

            $this->trigger_events(array('post_terminated_project', 'post_terminated_project_successful'));
            $this->set_message('terminated_successful');
            return $affected;
        }
    }

    public function trash_bin($project_sn,$mode,$note=''){
        // insert trash table
        $project = $this->_project($project_sn,$mode);
        if($project) {
            $fileds = array(
                'is_del' => 1,
                'note' => $note,
                'worker_id' => $this->ion_auth->get_user_id(),
                'lasttime' => time()
            );
            $this->db->update($this->_project_table($mode),$fileds,array('project_sn'=>$project_sn));
            $this->db->delete($this->table,array('project_sn'=>$project_sn));
            if (!empty($project['type']) && !empty($project['origin_weight'])) {
                $gold = maybe_serialize(array(
                    'price' => $project['price'],
                    'type' => $project['type'] == 'goldbar' ? lang('text_goldbar') : lang('text_ornaments'),
                    'number' => $project['number'],
                    'origin_weight' => $project['origin_weight'],
                    'weight' => $project['weight'],
                    'appraiser' => $project['appraiser'],
                    'start' => $project['start'],
                    'end' => $project['end'],
                    'month' => $project['month'],
                    'profit' => $project['profit'],
                    'payment' => $project['payment'],
                ));
            } else {
                $gold = maybe_serialize(array(
                    'price' => $project['price'],
                    'weight' => $project['weight'],
                    'amount' => $project['amount'],
                    'start' => $project['start'],
                    'end' => $project['end'],
                    'month' => $project['month'],
                    'profit' => $project['profit'],
                    'payment' => $project['payment'],
                ));
            }
            $this->db->insert($this->trash_table, array(
                'project_id' => $project['project_id'],
                'project_sn' => $project['project_sn'],
                'mode' => $mode,
                'customer' => maybe_serialize(array(
                    'realname' => $project['realname'],
                    'phone' => $project['phone'],
                    'idnumber' => $project['idnumber'],
                    'wechat' => $project['wechat'],
                    'referrer' => $project['referrer'],
                )),
                'gold' => $gold,
                'note' => $note,
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time(),
                'ip' => $this->_prepare_ip($this->input->ip_address())
            ));

            return $this->db->insert_id();
        }
    }

    protected function calculate_unfinished_profit($month,$profit,$number,$weight){
        if(!$month || !$number)return 0;
        switch(strtolower($this->config->item('gold_growing') )){
            case 'season':
                $value = $number/3;
                break;
            case 'year':
                $value = $number/12;
                break;
            default:
                $value = $number;
                break;
        }
        return (float)(($profit/$month)*$value*$weight);
    }

    public function recylied($trash_id)
    {
        $info = $this->db->get_where(array('trash_id'=>$trash_id))->from($this->trash_table);
        if($info->num_rows()){
            $trash = $info->row_array();
            $this->db->update($this->table,array('is_del'=>0,'worker_id'=>$this->ion_auth->get_user_id(),'addtime' => time()),array('project_sn'=>$trash['project_sn']));
            $this->db->delete($this->trash_table,array('trash_id'=>$trash_id));
            return $this->db->affected_rows();
        }
        return FALSE;
    }
    public function renew($data=array()){
        if(empty($data['customer_id']) || empty($data['weight'])) {
            return False;
        }
        $this->trigger_events('pre_renew_recycling');

        $this->db->trans_begin();
        $customer_id = $data['customer_id'];

        $result = $this->customer($customer_id,TRUE);
        if(!$result || !$result->num_rows()){
            return FALSE;
        }
        $customer = $result->row_array();
        $project_sn = $this->generate_sn();
        $start = $this->calculate_start(time());
        $end = calculate_end(strtotime($start),$data['month']);
        $tmp = array(
            'project_sn' => $project_sn ,
            'customer_id' => $customer_id,
            'referrer_id' => $customer['referrer_id'],
            'company_id' => empty($customer['company_id'])? $this->ion_auth->get_company_id() : $customer['company_id'],
            'type' => 'renew',
            'price' => (float)$data['price'],
            'origin_weight' => (float)$data['weight'],
            'number' => 1,
            'appraiser_id' => 0,
            'transferrer' => $data['transferrer'],
            'weight' => (float)$data['weight'],
            'month' => (int)$data['month'],
            'profit' => (float)$data['profit'],
            'payment' => $data['payment'],
            'loss' => 0.00,
            'start' => $start,
            'end' => $end,
            'note' =>  htmlspecialchars($data['editorValue']),
            'status_id' => $this->config->item('recycling_renew'),
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time(),
            'lasttime' => time()
        );
        $this->db->insert($this->recycling_table, $tmp);
        $project_id = $this->db->insert_id();

        if(isset($data['privacy'])){
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
        $this->db->insert($this->recycling_history_table,array(
            'project_id' => $project_id,
            'status_id' => $this->config->item('recycling_renew'),
            'note' => htmlspecialchars($data['editorValue']),
            'request' => empty($data['card_serial'])? $data['card_serial']:'',
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time(),
            'ip' => $this->_prepare_ip($this->input->ip_address())
        ));
        //入库
        if($this->config->item('recycling_renew') == $this->config->item('recycling_confirmed')) {
            $referrer = $this->ion_auth->get_worker($tmp['referrer_id']);
            $project_stock = array(
                'project_sn' => $tmp['project_sn'],
                'customer_id' => $tmp['customer_id'],
                'referrer_id' => $tmp['referrer_id'],
                'company_id' => $tmp['company_id'],
                'title' => '项目 '.$tmp['project_sn'].' 存金'.number_format($tmp['weight'],2).'克',
                'weight'=> (float)$tmp['weight'],
                'month'=> $tmp['month'],
                'start'=> $tmp['start'],
                'end'=> $tmp['end'],
                'profit'=> $tmp['profit'],
                'info' => maybe_serialize(array(
                    'project_id' => $project_id,
                    'realname' => $customer['realname'],
                    'phone' => $customer['phone'],
                    'idnumber' => $customer['idnumber'],
                    'wechat' => $customer['wechat'],
                    'price' => $tmp['price'],
                    'type' => $this->type_text($tmp['type']),
                    'number' => $tmp['number'],
                    'origin_weight' => $tmp['origin_weight'],
                    'weight' => $tmp['weight'],
                    'loss' => $tmp['loss'].lang('text_percent_unit'),
                    'appraiser' => '',
                    'referrer' => empty($referrer['realname']) ? '' :$referrer['realname'],
                    'payment'=> $tmp['payment'],
                )),
                'note' => htmlspecialchars($data['editorValue']),
                'mode' => 'recycling',
                'status' => 1,
                'worker_id' => $this->ion_auth->get_user_id(),
                'addtime' => time(),
                'lasttime' => time(),
            );
            $this->db->insert($this->project_stock_table, $project_stock);
        }
        $customer_stock = array(
            'project_sn' => $project_sn,
            'note' => sprintf(lang('text_stock_renew'),number_format($data['weight'],2),$project_sn),
            'customer_id' => $customer_id,
            'fee' => 0.00,
            'mode' => 'out',
            'notify' => 1,
            'weight' => (float)$data['weight']*(-1.00),
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time()
        );
        if(isset($data['privacy'])){
            $customer_stock['file'] = $this->format_file_value($data['privacy']);
        }
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

    public function customer_applies(){

        $this->db->select('ca.*,w.realname operator,c.realname customer', false);
        $this->db->from($this->apply_table.' AS ca');
        $this->db->join($this->customer_table.' AS c', 'c.customer_id = ca.customer_id','left');

        $this->db->join($this->worker_table.' AS w', 'w.id = ca.worker_id','left');

        $this->db->order_by('ca.addtime desc');
         return $this->db->get();

    }

    public function get_apply($apply_id){
        return $this->db->select("a.*,c.realname,c.phone,c.idnumber,w.realname operator")->from($this->apply_table." AS a")
            ->join($this->customer_table." AS c","c.customer_id = a.customer_id",'left')
            ->join($this->worker_table." AS w","w.id = a.worker_id",'left')
            ->where(array('a.apply_id'=>$apply_id))
            ->limit(1)->get();
    }
}