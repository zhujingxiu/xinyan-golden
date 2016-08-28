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

    protected function render_operation($status)
    {
        $buttons = array();
        switch((int)$status)
        {
            case $this->config->item('investing_initial'):
                if($this->inRole('manager')) {
                    $buttons[] = '<a class="btn btn-primary btn-checking">核实</a>';
                }else{
                    $buttons[] = '<a class="btn btn-default disabled">待核实</a>';
                }
                if($this->inRole('booker')){
                    $buttons[] = '<a class="btn btn-default btn-update">编辑</a>';
                }
                break;
            case $this->config->item('investing_checked'):
                if($this->inRole('warehouser')) {
                    $buttons[] = '<a class="btn btn-primary btn-confirming">确认</a>';
                }else{
                    $buttons[] = '<a class="btn btn-info disabled">待确认</a>';
                }
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-warning btn-refused">驳回</a>';
                }
                break;
            case $this->config->item('investing_confirmed'):

                $buttons[] = '<a class="btn btn-success disabled">进行中</a>';

                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-success btn-appling">提金</a>';
                }
                break;
            case $this->config->item('investing_expired'):
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-success btn-appling">提金</a>';
                }else{
                    $buttons[] = '<a class="btn btn-success disabled">可提金</a>';
                }
                break;
            case $this->config->item('investing_applied'):
                if($this->inRole('warehouser')){
                    $buttons[] = '<a class="btn btn-success btn-taking">确认提金</a>';
                }else{
                    $buttons[] = '<a class="btn btn-success disabled">待提金</a>';
                }
                break;
            case $this->config->item('investing_finished'):

                $buttons[] = '<a class="btn btn-default disabled">已完结</a>';
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-link btn-trashed">删除</a>';
                }
                break;
            case $this->config->item('investing_refused'):

                $buttons[] = '<a class="btn btn-warning disabled">已驳回</a>';
                if($this->inRole('booker')){
                    $buttons[] = '<a class="btn btn-default btn-update">编辑</a>';
                }
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-danger btn-terminated">终止</a>';
                }
                break;
            case $this->config->item('investing_terminated'):

                $buttons[] = '<a class="btn btn-danger disabled">已终止</a>';
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-link btn-trashed">删除</a>';
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