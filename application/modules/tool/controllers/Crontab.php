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

    public function abort_run($token)
    {
        //$ php index.php tool crontab abort_run q3f5UbyrvkACAZBHW7iOlyLuqSTA4L8KCkM
        if(XEncrypt($token,'D')==$this->config->item('cron_encrypt')) {
            set_time_limit(0);
            ignore_user_abort(true);

            do {

                $this->tool_model->run_crontab();

                if(date('w') ==0 || date('w') ==6){
                    $interval = 3600*4;
                }else if(date('H')>23 || date('H')<7){
                    $interval = 3600;
                }else{
                    $interval = $this->setting->get_setting('cron_interval') ? (int)$this->setting->get_setting('cron_interval') : 5 * 60;
                }
                sleep($interval);
            } while (TRUE);
        }else{
            die('Deny');
        }

        //http://data.gold.hexun.com/outData/AuSH.ashx
    }

    public function live_price($token)
    {
        //$ php index.php tool crontab live_price q3f5UbyrvkACAZBHW7iOlyLuqSTA4L8KCkM
        if(XEncrypt($token,'D')==$this->config->item('cron_encrypt')) {
            set_time_limit(0);
            ignore_user_abort(true);

            $url = $this->setting->get_setting('hexun_url');
            if($url) {
                do {
                    $this->tool_model->hexun_price($url);
                    if(date('w') ==0 || date('w') ==6){
                        $interval = 3600*4;
                    }else if(date('H')>=23 || date('H')<=7){
                        $interval = 3600;//$this->setting->get_setting('hexun_interval') ? (int)$this->config->item('hexun_interval') : 5 * 60;
                    }else{
                        $interval = $this->setting->get_setting('hexun_interval') ? (int)$this->setting->get_setting('hexun_interval') : 5 * 60;
                    }
                    sleep($interval);
                } while (TRUE);
            }
        }else{
            die('Deny');
        }

        //http://data.gold.hexun.com/outData/AuSH.ashx
    }
}