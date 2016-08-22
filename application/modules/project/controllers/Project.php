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
        }

        return implode(" ",$buttons);
    }
    /*
    public function history(){

        $contribute_id = (int)$this->request->get['contribute_id'];


        $limit = 20;
        $data['histories'] = array();
        $total = $this->model_fbaccount_publish_nophoto->getTotalHistory($contribute_id);
        $results = $this->model_fbaccount_publish_nophoto->getHistories($contribute_id,($page - 1) * $limit, $limit);
        foreach ($results as $result) {


            if($result['user_id']==0){
                $operator = lang('text_author');
            }elseif ($result['user_id']==-1){
                $operator = lang('text_system');
            }else{
                $operator = $result['nickname'];
            }
            $data['histories'][] = array(
                'history_id'  	=> $result['history_id'] ,
                'type'			=> strtolower($result['type']) == 'edit' ? 'Edit Status' : 'Post Status',
                'status_text'   => $result,
                'operator'		=> $operator,
                'date_added' 	=> date('Y-m-d H:i:s', strtotime($result['date_added']))
            );
        }

        return $this->load->view('investing/history.tpl', $data,TRUE);
    }*/

    protected function calculate_amount($price,$weight)
    {
        return round((float)$price*$weight,2);
    }

    protected function calculate_total($period,$weight,$profit)
    {
        return round(($weight+(float)($period*$profit*$weight)),2);
    }

    public function refused(){

    }

    public function trash()
    {

    }
}