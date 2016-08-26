<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/8/25
 * Time: 21:56
 */
class Tool_model extends XY_Model
{
    public function gold_price($data){
        $this->trigger_events('pre_current_price');
        if(is_array($data) && count($data))
        {
            $this->db->trans_begin();
            $current_price = $last_day = $delete_day = FALSE;
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
                    if(strtolower($item['type']) == 'au99.99') {
                        $current_price = (float)$item['price'];
                    }
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
                    $current_price = (float)$item['price'];
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
            if ($this->db->trans_status() === FALSE)
            {
                $this->db->trans_rollback();
                $this->trigger_events(array('post_current_price', 'post_current_price_unsuccessful'));
                $this->set_error('current_price_unsuccessful');
                return FALSE;
            }
            $this->db->trans_commit();

            $this->trigger_events(array('post_current_price', 'post_current_price_successful'));
            $this->set_message('current_price_successful');

            return $current_price;
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
        }
        return FALSE;
    }

    public function range($mode)
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
}