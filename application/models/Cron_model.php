<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/9/1
 * Time: 22:37
 */
class Cron_model extends CI_Model
{
    public function gold_price($data){
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

                $affected = $this->db->insert_id();

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
                            $affected = $this->db->insert_id();
                            if ($affected)
                                $last_day = TRUE;
                        }
                    }
                }

            }
            if ($this->db->trans_status() === FALSE)
            {
                $this->db->trans_rollback();
                return FALSE;
            }
            $this->db->trans_commit();


            return $affected;
        }
        return FALSE;
    }

    function push_growing()
    {

    }

    function growing()
    {

    }
}