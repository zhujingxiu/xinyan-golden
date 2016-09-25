<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Common extends MX_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library(array('ion_auth','form_validation','setting'));
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
        if(!empty($sms_log['sms']) && time() < ($sms_log['time']+600) ){
            json_error(array('msg'=> lang('error_search_smstime','default')));
        }

        $sms = new Sms();
        $sms_number = mt_rand(100000,999999);
        $pattern = "尊敬的用户，".$sms_number."是您本次的验证码，该验证码10分钟内有效。【黄金码头】";
        $res = $sms->sendMsg($phone,$pattern);
        //var_dump($res);
        $this->model_account_customer->del_smscode($phone);
        $this->model_account_customer->add_smscode($phone,$sms_number);
        json_success();

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
            $data['title'] = sprintf($this->lang->line('text_login_price_title','default'),(date('w')) ? '昨天' : '周五',$this->tool_model->lastprice(TRUE));
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