<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 *
 * @author		Chaegumi
 * @copyright	Copyright (c) 2015 jeawin.com
 * @email		chaegumi@jeawin.com
 * @filesource
 */
class Login extends MX_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library(array('ion_auth','form_validation','setting'));
        $this->load->helper(array('url','language','server'));
        $this->load->model(array('project/recycling_model','project/investing_model'));
        $this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));

        $this->lang->load('auth');
        $this->lang->load('default');
    }

    function index(){
        $tpl_data['title'] = $this->config->item('site_name');

        //validate form input
        $this->form_validation->set_rules('identity', str_replace(':', '', $this->lang->line('login_identity_label')), 'required');
        $this->form_validation->set_rules('password', str_replace(':', '', $this->lang->line('login_password_label')), 'required');

        if ($this->form_validation->run() == true)
        {
            // check to see if the user is logging in
            // check for "remember me"
            $remember = (bool) $this->input->post('remember');
            $identity = $this->input->post('identity');
            if ($this->ion_auth->login($identity, $this->input->post('password'), $remember))
            {
                $this->ion_auth->increase_login_attempts($identity);
                $this->recycling_model->reset_locker();
                $this->investing_model->reset_locker();
                json_response(array('code' => 1, 'msg' => $this->ion_auth->messages(),'redirect'=>base_url()));
            }
            else
            {
                json_response(array('code' => -1, 'msg' => $this->ion_auth->errors(),'redirect'=>base_url('login')));
            }
        }
        else
        {
            // the user is not logging in so display the login page
            // set the flash data error message if there is one
            $tpl_data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

            $tpl_data['identity'] = array(
                'name' 	=> 'identity',
                'id'    => 'identity',
                'type'  => 'text',
                'value' => $this->form_validation->set_value('username'),
            );
            $tpl_data['password'] = array(
                'name' => 'password',
                'id'   => 'password',
                'type' => 'password',
            );

            $this->load->view('login', $tpl_data);

        }
    }

    public function captcha(){
        $this->load->library('captcha');
        $code = $this->captcha->getCaptcha(100,50);
        $this->session->set_userdata('code', $code);
        $this->captcha->showImg();
    }
    public function price()
    {
        $this->load->model('tool/tool_model');
        if(date('w') ==0 || date('w') ==6){
            $data = $this->tool_model->range_price('month');
            $data['title'] = $this->lang->line('text_price_month','default');
            $data['subtitle'] = $this->lang->line('text_price_desc','default');
        }else{
            $data = $this->tool_model->range_price('day');
            $data['title'] = $this->lang->line('text_price_today','default');
            $data['subtitle'] = $this->lang->line('text_price_yestoday','default').$this->tool_model->lastprice().$this->lang->line('text_price_unit','default').$this->lang->line('text_price_desc','default');

            $setting = $this->setting->get_setting('golden_price');
            if(!empty($setting['apikey']) && !empty($setting['apiurl'])){
                $result = curl_get($setting['apiurl'],array('appkey'=>$setting['apikey']));
                $jsonarr = json_decode($result, true);
                if($jsonarr['status'] == 0){
                    $data['current'] = $this->tool_model->gold_price($jsonarr['result']);
                }
            }
        }
        if($data){
            json_success($data);
        }
        json_error();
    }
}