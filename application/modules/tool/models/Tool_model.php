<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/8/25
 * Time: 21:56
 */
class Tool_model extends XY_Model
{
    protected $stock_table = "project_stock";
    protected $recycling_table = "project_recycling";
    protected $recycling_history_table = "project_recycling_history";
    protected $investing_table = "project_investing";
    protected $investing_history_table = "project_investing_history";
    protected $customer_stock_table = "customer_stock";

    public function gold_price(){
        $query = $this->db->where(array('type'=>'Au99.99'))->from("golden_today")->order_by("updatetime desc")->limit(1)->get();
        if($query->num_rows()){
            $result = $query->row_array();
            return (float)$result['price'];
        }
        return FALSE;
    }

    public function lastprice()
    {
        $date = ( date('w') == 0 || date('w') == 6 ) ? date('Y-m-d',strtotime('last Friday')) : date('Y-m-d',strtotime("-1 day"));
        $query = $this->db->where(array('date'=>$date,'type'=>'Au99.99'))->from("golden_price")->get();
        if($query->num_rows()){
            $result = $query->row_array();
            return (float)$result['price'];
        }else{
            $query = $this->db->where(array('date'=>$date,'type'=>'Au99.99'))->from("golden_today")->order_by('updatetime desc')->get();
            if($query->num_rows()){
                $result = $query->row_array();
                return (float)$result['price'];
            }
        }
        return FALSE;
    }

    public function range_price($mode)
    {
        $table = "golden_price";$primary = "date";$date_format = FALSE;
        switch(strtolower($mode)){
            case 'day':
                $table = "golden_today";
                $where = array('date'=>date('Y-m-d'));
                $primary = "updatetime";
                $date_format = "H:i";
                break;
            case 'week':
                $where = array('date >= '=>date('Y-m-d',strtotime("-1 week")));
                break;
            case 'month':
                $where = array('date >= '=>date('Y-m-d',strtotime("last month")));
                break;
        }
        $tmp = array();
        $query = $this->db->where(array('type'=>'Au99.99')+$where)->from($table)->order_by($primary)->get();
        if($query->num_rows()){
            $result = $query->result_array();
            foreach($result as $item){
                if(isset($item[$primary]) && isset($item['price'])){
                    $key = $date_format ? date($date_format,$item[$primary]) : $item[$primary];
                    $tmp[$key] = $item['price'];
                }
            }
        }
        return $tmp ? array('time'=>array_keys($tmp),'price'=>array_values($tmp),'date'=>date('Y-m-d')) : FALSE;
    }

    function today_price($data){
        if(!is_array($data) || !count($data))
            return FALSE;
        $this->db->trans_begin();
        $last_day = $delete_day = FALSE;
        foreach($data as $item)
        {
            if(empty($item['type']) || empty($item['price']) || empty($item['updatetime']))
            {
                continue;
            }
            //delete > 2 day
            if($delete_day == FALSE)
            {
                $this->db->delete("golden_today",array("updatetime < " => time()-60*60*24*2));
                $delete_day = TRUE;
            }

            // is added
            $updatetime = strtotime($item['updatetime']);
            $query = $this->db->where(array("updatetime"=>$updatetime,"type"=>$item['type']))->from("golden_today")->get();
            if($query->num_rows()){
                continue;
            }
            // insert
            $this->db->insert("golden_today",array(
                'date' => date('Y-m-d',$updatetime),
                'type' => $item['type'],
                'typename' => $item['typename'],
                'price' => (float)$item['price'],
                'opening' => (float)$item['openingprice'],
                'maxprice' => (float)$item['maxprice'],
                'minprice' => (float)$item['minprice'],
                'change' => $item['changepercent'],
                'lastclosing' => (float)$item['lastclosingprice'],
                'tradeamount' => (float)$item['tradeamount'],
                'updatetime' => $updatetime,
                'addtime' => time()
            ));

            if(strtolower($item['type']) == 'au99.99'){
                // lastday price
                $yestoday = date("Y-m-d",strtotime("-1 day"));
                if($last_day == FALSE ){
                    $this->db->where(array("date"=>$yestoday,"type"=>$item['type']))->from("golden_price");
                    if($this->db->count_all_results()) {
                        $last_day = TRUE;
                    }else{
                        $this->db->insert("golden_price", array(
                            'date' =>  $yestoday,
                            'type' => $item['type'],
                            'typename' => $item['typename'],
                            'price' => (float)$item['lastclosingprice'],
                            'addtime' => time()
                        ));
                        if ($this->db->insert_id())
                            $last_day = TRUE;
                    }
                }
            }
        }
        $log_id = $this->log(var_export(array(
            'datetime' => date('Y-m-d H:i:s'),
            'insert' => $data,
        ),TRUE),__METHOD__);
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

    function growing()
    {
        $this->db->trans_begin();
        switch(strtolower($this->config->item('gold_growing') )){
            case 'season':
                $interval = "INTERVAL 3 MONTH ";
                $time = strtotime("3 month ago");
                $month = 3;
                break;
            case 'year':
                $interval = "INTERVAL 12 MONTH ";
                $time = strtotime("12 month ago");
                $month = 12;
                break;
            default:
                $interval = "INTERVAL 1 MONTH ";
                $time = strtotime("1 month ago");
                $month = 1;
                break;
        }
        $query = $this->db->where(array('status'=>1,'start <='=>date('Y-m-d',mktime(0,0,0,date('m',$time),date('d',$time)-1,date('Y',$time)))))
            ->group_start()
            ->where('last_profit',NULL)
            ->or_where('DATE_SUB(CURDATE(),'.$interval.') >= `last_profit`',NULL, FALSE)
            ->group_end()
            ->get($this->stock_table);
        $insert_batch = $update_batch = array();
        if($query->num_rows()){
            foreach($query->result_array() as $item){
                $insert = FALSE;

                $_q = $this->db->where(array('mode' => 'profit', 'project_sn' => $item['project_sn']))->order_by('addtime desc')->limit(1)->get($this->customer_stock_table);
                if ($_q->num_rows()) {
                    $info = $_q->row_array();
                    $addtime = strtotime(date('Y-m-d', $info['addtime']));
                    if (time() >= mktime(0, 0, 0, date('m', $addtime) + $month, date('d', $addtime), date('Y', $addtime))) {
                        $insert = TRUE;
                    }
                }else{
                    $starttime = strtotime($item['start']);
                    if (time() >= mktime(0, 0, 0, date('m', $starttime) + $month, date('d', $starttime), date('Y', $starttime))) {
                        $insert = TRUE;
                    }
                }
                if($insert){
                    $weight = (float)($this->config->item('profit_weight')/(12*100))*$month*($item['weight']);
                    $insert_batch[] = array(
                        'mode' => 'profit',
                        'customer_id' => $item['customer_id'],
                        'project_sn' => $item['project_sn'],
                        'weight' => $weight,
                        'notify' => 1,
                        'worker_id' => 0,
                        'addtime' => time()
                    );
                    $update_batch[] = array(
                        'project_sn' => $item['project_sn'],
                        'last_profit' => date('Y-m-d'),
                        'lasttime' => time()
                    );
                }
            }
            if($insert_batch){
                $this->db->update_batch($this->stock_table, $update_batch, 'project_sn');
                $this->db->insert_batch($this->customer_stock_table, $insert_batch);
            }
        }
        $log_id = $this->log(var_export(array(
            'datetime' => date('Y-m-d H:i:s'),
            'insert' => $insert_batch,
            'update' => $update_batch,
        ),TRUE),__METHOD__);
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

    function push_growing()
    {
        $this->db->trans_begin();
        $growing_note = '库存已确认标记，自动推进到正在增值';
        //confirmed in project_recycling
        $query = $this->db->where(array('status_id'=>$this->config->item('recycling_confirmed')))->get($this->recycling_table);
        $update_batch = $insert_batch = $stock_batch = $sn_batch = array();
        if($query->num_rows()){
            foreach($query->result_array() as $item){
                if(!empty($item['start']) && strtotime($item['start'])<=strtotime(date('Y-m-d'))){
                    $update_batch['recycling'][] = array(
                        'project_id' => $item['project_id'],
                        'status_id' => $this->config->item('recycling_growing'),
                        'note' 		=> $growing_note,
                        'lasttime' => time()
                    );
                    $insert_batch['recycling'][] = array(
                        'project_id' => $item['project_id'],
                        'status_id' => $this->config->item('recycling_growing'),
                        'note' => $growing_note,
                        'request' => '',
                        'worker_id' => $this->ion_auth->get_user_id(),
                        'addtime' => time(),
                        'ip' => $this->_prepare_ip($this->input->ip_address())
                    );
                    $stock_batch[] = array(
                        'project_sn' => $item['project_sn'],
                        'customer_id' => $item['customer_id'],
                        'referrer_id' => $item['referrer_id'],
                        'title' => '项目'.$item['project_sn'].'存金'.number_format($item['weight'],2).'克',
                        'weight'=> (float)$item['weight'],
                        'start'=> $item['start'],
                        'info' => maybe_serialize(array(
                            'project_id' => $item['project_id'],
                            'realname' => $item['realname'],
                            'phone' => $item['phone'],
                            'idnumber' => $item['idnumber'],
                            'price' => $item['price'],
                            'type' => $item['type']=='goldbar' ?'金条':'金饰',
                            'number' => $item['number'],
                            'origin_weight' => $item['origin_weight'],
                            'weight' => $item['weight'],
                            'appraiser_id' => $item['appraiser_id'],
                        )),
                        'note' => $growing_note,
                        'mode' => 'recycling',
                        'status' => 1,
                        'worker_id' => $this->ion_auth->get_user_id(),
                        'addtime' => time(),
                        'lasttime' => time(),
                    );
                    $sn_batch[] = $item['project_sn'];
                }
            }
        }
        //confirmed in project_investing
        $query = $this->db->where(array('status_id'=>$this->config->item('investing_confirmed')))->get($this->investing_table);
        if($query->num_rows()){
            foreach($query->result_array() as $item){
                if(!empty($item['start']) && strtotime($item['start'])==strtotime(date('Y-m-d'))){
                    $update_batch['investing'][] = array(
                        'project_id' => $item['project_id'],
                        'status_id' => $this->config->item('investing_growing'),
                        'note' 		=> $growing_note,
                        'lasttime' => time()
                    );
                    $insert_batch['investing'][] = array(
                        'project_id' => $item['project_id'],
                        'status_id' => $this->config->item('investing_growing'),
                        'note' => $growing_note,
                        'request' => '',
                        'worker_id' => $this->ion_auth->get_user_id(),
                        'addtime' => time(),
                        'ip' => $this->_prepare_ip($this->input->ip_address())
                    );
                    $stock_batch[] = array(
                        'project_sn' => $item['project_sn'],
                        'customer_id' => $item['customer_id'],
                        'referrer_id' => $item['referrer_id'],
                        'title' => '项目'.$item['project_sn'].'存金'.number_format($item['weight'],2).'克',
                        'weight'=> (float)$item['weight'],
                        'start'=> $item['start'],
                        'info' => maybe_serialize(array(
                            'project_id' => $item['project_id'],
                            'realname' => $item['realname'],
                            'phone' => $item['phone'],
                            'idnumber' => $item['idnumber'],
                            'price' => $item['price'],
                            'amount' => $item['amount'],
                            'weight' => $item['weight'],
                        )),
                        'note' => $growing_note,
                        'mode' => 'investing',
                        'status' => 1,
                        'worker_id' => $this->ion_auth->get_user_id(),
                        'addtime' => time(),
                        'lasttime' => time(),
                    );
                    $sn_batch[] = $item['project_sn'];
                }

            }

        }

        if(isset($update_batch['recycling'])){
            $this->db->update_batch($this->recycling_table, $update_batch['recycling'], 'project_id');
            $this->db->insert_batch($this->recycling_history_table, $insert_batch['recycling']);
        }
        if(isset($update_batch['investing'])){
            $this->db->update_batch($this->investing_table, $update_batch['investing'], 'project_id');
            $this->db->insert_batch($this->investing_history_table, $insert_batch['investing']);
        }
        if($sn_batch){
            $this->db->where_in('project_sn',$sn_batch)->delete($this->stock_table);
            $this->db->insert_batch($this->stock_table, $stock_batch);
        }
        $log_id = $this->log(var_export(array(
            'datetime' => date('Y-m-d H:i:s'),
            'insert' => $insert_batch,
            'update' => $update_batch,
            'sn' => $sn_batch,
        ),TRUE),__METHOD__);
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

    protected function log($text='',$action=FALSE)
    {
        $this->db->delete('cron_log',array('date <'=>date('Y-m-d',strtotime("7 day ago"))));
        $this->db->insert('cron_log',array(
            'log_time' => time(),
            'date' => date('Y-m-d'),
            'time' => date('H:i:s'),
            'action' => $action ? $action :'' ,
            'text' => $text,
        ));
        return $this->db->insert_id();
    }
}