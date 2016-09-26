<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Common extends MX_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library(array('ion_auth','form_validation','setting','sms'));
        $this->load->helper(array('url','language','server'));
        $this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));

        $this->lang->load('default');
    }

    public function validate_number(){
        $number = $this->input->get('number');
        $this->load->model('project/customer_model');
        if($number && $this->customer_model->get_customer(array('number'=>$number))){
            json_success();
        }
        json_error(array('msg'=>lang('error_search_number','default')));
    }

    public function validate_phone(){
        $number = $this->input->get('number');
        $phone = $this->input->get('phone');
        $this->load->model('project/customer_model');
        if($phone && $number && $this->customer_model->get_customer(array('number'=>$number,'phone'=>$phone))){
            json_success();
        }
        json_error(array('msg'=>lang('error_search_phone','default')));
    }

    public function validate_captcha(){

        $captcha = $this->session->userdata('captcha') ? strtolower($this->session->userdata('captcha')) : false;
        $_captcha =  strtolower($this->input->get('captcha'));
        if($captcha && $_captcha && $captcha==$_captcha ){
            json_success();
        }
        json_error(array('msg'=>lang('error_search_captcha')));
    }

    public function validate_code(){
        $status = 0;
        $code = $this->input->get('code') ? $this->input->get('code') : false;
        $phone = $this->input->get('phone') ? $this->input->get('phone') : false;
        $this->load->model('project/customer_model');
        $sms_log = $this->customer_model->get_smscode($phone);
        if(!empty($sms_log['code']) && ($sms_log['code'] == $code) && (time() < ($sms_log['time']+600))) {
            json_success();
        }
        json_error(array('error'=>$this->lang->line('error_search_code','default')));
    }

    public function get_smscode(){
        $number = $this->input->get('number');
        $phone = $this->input->get('phone');
        $captcha = strtolower($this->input->get('captcha'));
        $_captcha = strtolower($this->session->userdata('captcha'));
        if(!$captcha || empty($_captcha) || ($_captcha != $captcha)) {
            json_error(array('msg'=> lang('error_search_captcha','default')));
        }
        if ( !isMobile($phone)) {
            json_error(array('msg'=> lang('error_search_phone','default')));
        }
        $this->load->model('project/customer_model');

        if ($this->customer_model->get_customer(array('number'=>$number,'phone'=>$phone)) == False){
            json_error(array('msg'=> lang('error_search_phone','default')));
        }

        $sms_log = $this->customer_model->get_smscode($phone);
        if(!empty($sms_log['code']) && time() < ($sms_log['time']+600) ){
            json_error(array('msg'=> lang('error_search_smstime','default')));
        }

        $sms = new Sms();
        $code = mt_rand(100000,999999);
        $res = $sms->search_code($phone,$code);
        if(is_array($res)){
            $this->customer_model->del_smscode($phone);
            $this->customer_model->add_smscode($phone,$code);
            json_success();
        }
        json_error();
    }

    public function captcha(){
        $this->load->library('captcha');
        $code = $this->captcha->getCaptcha(100,50);
        $this->session->set_userdata('captcha', $code);
        $this->captcha->showImg();
    }
    public function price()
    {
        $this->load->model('tool/tool_model');
        if(true/*date('w') ==0 || date('w') ==6*/){
            $data = $this->tool_model->range_price('month');
            $data['title'] = sprintf($this->lang->line('text_login_price_title','default'),(!date('w')||date('w')==1) ? '周五' : '昨天',$this->tool_model->lastprice((!date('w')||date('w')==1)));
            $data['subtitle'] = $this->lang->line('text_price_desc','default');
        }else{
            $data = $this->tool_model->range_price('day');
            $data['title'] = $this->lang->line('text_price_today','default');
            $data['subtitle'] = $this->lang->line('text_price_yestoday','default').$this->tool_model->lastprice(true).$this->lang->line('text_price_unit','default').$this->lang->line('text_price_desc','default');
            $data['current'] = $this->tool_model->gold_price();
        }
        if($data){
            json_success($data);
        }
        json_error();
    }
}