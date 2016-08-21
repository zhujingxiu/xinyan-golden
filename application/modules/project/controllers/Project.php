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


    protected function _list()
    {
        $rows = array();
        $result = $this->investing_model->projects()->result_array();
        $total = count($result);
        if($total){
            foreach($result as $row){
                $rows[] = array(
                    '<label class="label label-primary">'.$row['status'].'</label>',
                    $row['project_sn'],
                    $row['realname'],
                    $row['phone'],
                    $row['price'],
                    $row['weight'],
                    $row['period'].'个月',
                    $row['amount'],
                    date('Y-m-d H:i',$row['addtime']),
                    $this->render_operation($row['status_id'])
                );
            }
        }
        return array(
            'draw' 				=> 1,
            'recordsTotal' 		=> $total,
            'recordsFiltered' 	=> $total,
            'data' => $rows
        );

    }

    protected function render_operation($status)
    {
        $buttons = array();
        switch((int)$status)
        {
            case $this->config->item('investing_initial'):
                if($this->inRole('manager')){
                    $buttons[] = '<a class="btn btn-primary btn-checking">核实</a>';
                }else{
                    $buttons[] = '<a class="btn btn-info disabled">待核实</a>';
                }
                break;
        }

        return implode(" ",$buttons);
    }

    public function refused(){

    }

    public function trash()
    {

    }
}