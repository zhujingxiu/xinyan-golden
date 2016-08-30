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

    }

    protected function investing_operation($status)
    {
        $buttons = array();
        switch((int)$status)
        {
            case $this->config->item('investing_initial'):
                //$buttons[] = lang('label_booked');
                if($this->inRole('manager')) {
                    $buttons[] = lang('button_checking');
                }
                if($this->inRole('booker')){
                    $buttons[] = lang('button_update');
                }
                break;
            case $this->config->item('investing_checked'):
                //$buttons[] = lang('label_checked');
                if($this->inRole('warehouser')) {
                    $buttons[] = lang('button_confirming');
                }
                if($this->inRole('manager')){
                    $buttons[] = lang('button_refusing');
                }
                break;
            case $this->config->item('investing_confirmed'):
                //$buttons[] = lang('label_confirmed');
                if($this->inRole('manager')){
                    $buttons[] = lang('button_appling');
                }
                break;
            case $this->config->item('investing_expired'):
                //$buttons[] = lang('label_expired');
                if($this->inRole('manager')){
                    $buttons[] = lang('button_appling');
                }
                break;
            case $this->config->item('investing_applied'):
                //$buttons[] = lang('label_applied');
                if($this->inRole('manager')){
                    $buttons[] = lang('button_cancle');
                }
                if($this->inRole('warehouser')){
                    $buttons[] = lang('button_taking');
                }
                break;
            case $this->config->item('investing_finished'):
                //$buttons[] = lang('label_finished');
                if($this->inRole('manager')){
                    $buttons[] = lang('button_trashing');
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

    protected function recycling_operation($status)
    {
        $buttons = array();
        switch((int)$status)
        {
            case $this->config->item('recycling_initial'):
                //$buttons[] = lang('label_booked');
                if($this->inRole('manager')) {
                    $buttons[] = lang('button_checking');
                }
                if($this->inRole('booker')){
                    $buttons[] = lang('button_update');
                }
                break;
            case $this->config->item('recycling_checked'):
                //$buttons[] = lang('label_checked');
                if($this->inRole('warehouser')) {
                    $buttons[] = lang('button_confirming');
                }
                if($this->inRole('manager')){
                    $buttons[] = lang('button_refusing');
                }
                break;
            case $this->config->item('recycling_confirmed'):
                //$buttons[] = lang('label_confirmed');
                if($this->inRole('manager')){
                    $buttons[] = lang('button_appling');
                }
                break;

            case $this->config->item('recycling_applied'):
                //$buttons[] = lang('label_applied');
                if($this->inRole('manager')){
                    $buttons[] = lang('button_cancle');
                }
                if($this->inRole('warehouser')){
                    $buttons[] = lang('button_taking');
                }
                break;
            case $this->config->item('recycling_finished'):
                //$buttons[] = lang('label_finished');
                if($this->inRole('manager')){
                    $buttons[] = lang('button_trashing');
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

    protected function calculate_total($period,$weight)
    {
        return round(($weight+(float)($period*$weight*$this->profit_weight())),2);
    }

    protected function calculate_expired($starttime,$period)
    {
        return date('Y-m-d',mktime(0,0,0,date('m',$starttime)+(int)$period,date('d',$starttime)-1,date('Y',$starttime)));
    }

    protected function calculate_current_total($start,$weight)
    {
        $days = days_sub($start);
        $month = floor($days/30);
        if($month){
            if($this->config->item('month_taking')){
                return $this->calculate_total($month,$weight);
            }else if($this->config->item('season_taking')){
                return $this->calculate_total(($month - ($month%3)),$weight);
            }
        }

        return $weight;
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