<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/8/20
 * Time: 18:30
 */
class Project extends XY_Controller
{
    protected $mode;

    public function __construct(){
        parent::__construct();
        $this->load->library(array('form_validation'));

        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
        $this->load->model(array('setting/project_model'));
    }

    protected function investing_operation($status,$locker_id)
    {

        $buttons = array();
        $text_lock = $locker_id && $locker_id!=$this->worker_id ? '<i class="fa fa-lock"></i>' : '<i class="fa fa-edit"></i>';
        switch((int)$status)
        {
            case $this->config->item('investing_initial'):
                //$buttons[] = lang('label_booked');
                if($this->inRole('manager')) {
                    $buttons[] = sprintf(lang('button_checking'),$text_lock);
                }
                if($this->inRole('booker')){
                    $buttons[] = sprintf(lang('button_update'),$text_lock);
                }
                break;
            case $this->config->item('investing_checked'):
                //$buttons[] = lang('label_checked');
                if($this->inRole('warehouser')) {
                    $buttons[] = sprintf(lang('button_confirming'),$text_lock);
                }
                if($this->inRole('manager')){
                    $buttons[] = sprintf(lang('button_refusing'),$text_lock);
                }
                break;
            case $this->config->item('investing_confirmed'):
                //$buttons[] = lang('label_confirmed');
                if($this->inRole('warehouser')){
                    $buttons[] = sprintf(lang('button_edit'),$text_lock);
                }
                break;

            case $this->config->item('investing_growing'):
                //$buttons[] = lang('label_finished');
                if($this->inRole('manager')){
                    $text_lock = '<i class="fa fa-eye"></i>';
                    $buttons[] = sprintf(lang('button_detail'),$text_lock);
                }
                break;
            case $this->config->item('investing_refused'):
                //$buttons[] = lang('label_refused');
                if($this->inRole('booker')){
                    $buttons[] = lang('button_update');
                }
                if($this->inRole('manager')){
                    $buttons[] = lang('button_terminating');
                }
                break;
            case $this->config->item('investing_terminated'):
                //$buttons[] = lang('label_terminated');
                if($this->inRole('manager')){
                    $buttons[] = lang('button_trashing');
                }
                break;
        }

        return implode(" ",$buttons);
    }

    protected function recycling_operation($status,$locker_id=FALSE)
    {
        $buttons = array();
        $text_lock = $locker_id && $locker_id!=$this->worker_id ? '<i class="fa fa-lock"></i>' : '<i class="fa fa-edit"></i>';
        switch((int)$status)
        {
            case $this->config->item('recycling_initial'):
                //$buttons[] = lang('label_booked');
                if($this->inRole('manager')) {
                    $buttons[] = sprintf(lang('button_checking'),$text_lock);
                }
                if($this->inRole('booker')){
                    $buttons[] = sprintf(lang('button_update'),$text_lock);
                }
                break;
            case $this->config->item('recycling_checked'):
                //$buttons[] = lang('label_checked');
                if($this->inRole('warehouser')) {
                    $buttons[] = sprintf(lang('button_confirming'),$text_lock);
                }
                if($this->inRole('manager')){
                    $buttons[] = sprintf(lang('button_refusing'),$text_lock);
                }
                break;
            case $this->config->item('recycling_confirmed'):
                //$buttons[] = lang('label_confirmed');
                if($this->inRole('warehouser')){
                    $buttons[] = sprintf(lang('button_edit'),$text_lock);
                }
                break;

            case $this->config->item('recycling_growing'):
                if($this->inRole('manager')){
                    $text_lock = '<i class="fa fa-eye"></i>';
                    $buttons[] = sprintf(lang('button_detail'),$text_lock);
                }
                break;
            case $this->config->item('recycling_refused'):
                //$buttons[] = lang('label_refused');
                if($this->inRole('booker')){

                    $buttons[] = lang('button_update');
                }
                if($this->inRole('manager')){
                    $buttons[] = lang('button_terminating');
                }
                break;
            case $this->config->item('recycling_terminated'):
                //$buttons[] = lang('label_terminated');
                if($this->inRole('manager')){
                    $buttons[] = lang('button_trashing');
                }
                break;
        }

        return implode(" ",$buttons);
    }
    protected function profit_weight()
    {
        return (float)($this->config->item('profit_weight')/(12*100));
    }

    protected function calculate_amount($price,$weight)
    {
        return round((float)$price*$weight,2);
    }

    protected function calculate_rate($profit,$month)
    {
        return number_format((float)(($profit/(12*100))*$month),4);
    }

    protected function calculate_profit($rate,$month){
        return number_format(($month*$rate/12)*100,2);
    }

    protected function calculate_start($addtime)
    {
        $start = FALSE;
        switch(strtolower($this->config->item('growing_mode'))){
            case 't0':
                $start = date('Y-m-d',$addtime);
                break;
            case 't1':
                $start = date('Y-m-d',$addtime+24*60*60);
                break;
        }
        return $start;
    }


    protected function status($code)
    {
        if($this->mode=='investing')
        {
            $this->load->model('investing_model');
            return $this->investing_model->get_status_by_code($code);
        }else{
            $this->load->model('recycling_model');
            return $this->recycling_model->get_status_by_code($code);
        }
    }

    protected function status_text($code)
    {
        $status = $this->status($code);
        if(empty($status['title'])){
            return lang('text_unknown');
        }else{
            return $status['title'];
        }
    }
}