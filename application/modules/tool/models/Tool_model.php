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

    protected $customer_table = 'customer';
    protected $worker_table = 'worker';

    public function __construct(){
        parent::__construct();
        $this->lang->load('default');
    }
    public function gold_price(){
        $query = $this->db->where(array('type'=>'Au99.99'))->from("golden_today")->order_by("updatetime desc")->limit(1)->get();
        if($query->num_rows()){
            $result = $query->row_array();
            return (float)$result['price'];
        }
        return FALSE;
    }

    public function lastprice($lastday=FALSE)
    {
        if($lastday){
            $date = (!date('w')||date('w')==1) ? date('Y-m-d',strtotime((-2-(date('w'))).' day')) : date('Y-m-d',strtotime("-1 day"));

            $query = $this->db->where(array('date'=>$date,'type'=>'Au99.99'))->from("golden_price")->get();//,
            if($query->num_rows()){
                $result = $query->row_array();
                return number_format($result['price'],2);
            }
        }else{
            $query = $this->db->where(array('type'=>'Au99.99'))->from("golden_today")->order_by('updatetime desc')->get();
            if($query->num_rows()){
                $result = $query->row_array();
                return number_format($result['price'],2);
            }
        }
        return FALSE;
    }

    public function range_price($mode)
    {
        $table = "golden_price";$primary = "date";$date_format = "m.d";
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
                    $key = $primary == "updatetime" ? date($date_format,$item[$primary]) : date($date_format,strtotime($item[$primary]));
                    $tmp[$key] = $item['price'];
                }
            }
        }
        return $tmp ? array('time'=>array_keys($tmp),'price'=>array_values($tmp),'date'=>date('Y-m-d')) : FALSE;
    }

    function today_price(){
        if(date('w') ==0 || date('w') ==6){
            return FALSE;
        }
        $data = $this->config->item('golden_price');
        if(empty($data['apikey']) || empty($data['apiurl'])){
            $this->log(var_export(array(
                'datetime' => date('Y-m-d H:i:s'),
                'reason' => 'API参数异常',
            ),TRUE),__METHOD__);
            return FALSE;
        }
        $result = curl_get($data['apiurl'],array('appkey'=>$data['apikey']));
        $jsonarr = json_decode($result, true);
        if($jsonarr['status'] != 0 || !is_array($jsonarr['result'])){
            $this->log(var_export(array(
                'datetime' => date('Y-m-d H:i:s'),
                'reason' => 'API返回值异常',
            ),TRUE),__METHOD__);
            return FALSE;
        }
        $this->db->trans_begin();
        $last_day = $delete_day = FALSE;

        foreach($jsonarr['result'] as $item)
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

    protected function get_customer($id){
        $query = $this->db->get_where($this->customer_table,array('customer_id'=>$id),1);
        return $query->num_rows() ? $query->row_array() : FALSE;
    }


}