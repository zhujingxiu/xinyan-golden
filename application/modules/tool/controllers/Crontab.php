<?php

/**
 * Created by PhpStorm.
 * User: zhujingxiu
 * Date: 2016/9/1
 * Time: 22:06
 * crontab 定时任务
 */
class Crontab extends MX_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library(array('Ion_auth','Setting'));
        $this->load->model('tool_model');
    }
    public function index()
    {
        $this->load->library('cron_schedule');
        $this->cron_schedule->dispatch();
    }

    public function abort_run()
    {
        set_time_limit(0);
        ignore_user_abort(true);
        $interval = 5*60;
        do {
            $data = $this->setting->get_setting('golden_price');
            if(!empty($data['apikey']) && !empty($data['apiurl'])){
                $result = curl_get($data['apiurl'],array('appkey'=>$data['apikey']));
                $jsonarr = json_decode($result, true);
                if($jsonarr['status'] == 0){
                    $this->tool_model->today_price($jsonarr['result']);
                }
            }
            $this->tool_model->push_growing();
            $this->tool_model->growing();
            sleep ( $interval );
        }while(TRUE);
    }
}