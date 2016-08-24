<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/8/20
 * Time: 18:30
 */
class Project extends XY_Controller
{

    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model(array('investing_model'));
        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
    }


    public function current_price()
    {
        $_tmp = array("287.84","286.80","287.35","287.98","288.15","288.39","288.99","289.67");
        return number_format($_tmp[array_rand($_tmp)],2);
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
                    $buttons[] = '<a class="btn btn-info disabled">待核实</a>';
                }
                if($this->inRole('booker')){
                    $buttons[] = '<a class="btn btn-warning btn-update">编辑</a>';
                }
                break;
            case $this->config->item('investing_checked'):
                if($this->inRole('warehouser')) {
                    $buttons[] = '<a class="btn btn-primary btn-confirming">确认</a>';
                }else{
                    $buttons[] = '<a class="btn btn-info disabled">待确认</a>';
                }
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-warning btn-refused">拒绝</a>';
                }
                break;
            case $this->config->item('investing_confirmed'):

                $buttons[] = '<a class="btn btn-success disabled">进行中</a>';

                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-warning btn-terminated">终止</a>';
                }
                break;
            case $this->config->item('investing_expired'):
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-success btn-certificated">申请提金</a>';
                }else{
                    $buttons[] = '<a class="btn btn-success dsabled">可提金</a>';
                }
                break;
            case $this->config->item('investing_certificated'):
                if($this->inRole('warehouser')){
                    $buttons[] = '<a class="btn btn-success btn-taking">确认提金</a>';
                }else{
                    $buttons[] = '<a class="btn btn-success dsabled">待提金</a>';
                }
                break;
            case $this->config->item('investing_finished'):

                $buttons[] = '<a class="btn btn-default dsabled">已完结</a>';
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-warning btn-trash">隐藏</a>';
                }
                break;
            case $this->config->item('investing_refused'):

                $buttons[] = '<a class="btn btn-error dsabled">已拒绝</a>';
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-warning btn-trash">隐藏</a>';
                }
                break;
            case $this->config->item('investing_terminated'):

                $buttons[] = '<a class="btn btn-error dsabled">已终止</a>';
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-warning btn-trash">隐藏</a>';
                }
                break;
        }

        return implode(" ",$buttons);
    }


    protected function calculate_amount($price,$weight)
    {
        return round((float)$price*$weight,2);
    }

    protected function calculate_total($period,$weight,$profit)
    {
        return round(($weight+(float)($period*$profit*$weight)),2);
    }

    protected function profit_weight()
    {
        return (float)($this->config->item('profit_weight')/(12*100));
    }


    public function refused(){

    }

    public function trash()
    {

    }
}