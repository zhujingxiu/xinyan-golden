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
            $interval = $this->config->item('cron_interval') ? (int)$this->config->item('cron_interval') : 5 * 60;
            do {

                $this->tool_model->run_crontab();

                sleep($interval);
            } while (TRUE);
        }else{
            die('Deny');
        }
    }
}