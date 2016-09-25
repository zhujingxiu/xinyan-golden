<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 *
 * @author		Chaegumi
 * @copyright	Copyright (c) 2015 jeawin.com
 * @email		chaegumi@jeawin.com
 * @filesource
 */
class Landing extends MX_Controller {

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
		if($this->input->server('REQUEST_METHOD') == 'POST') {
			//validate form input
			$this->form_validation->set_rules('identity', str_replace(':', '', $this->lang->line('login_identity_label')), 'required');
			$this->form_validation->set_rules('password', str_replace(':', '', $this->lang->line('login_password_label')), 'required');

			if ($this->form_validation->run() == true) {

				$identity = $this->input->post('identity');
				$captcha = $this->input->post('captcha');
				if ($this->ion_auth->is_max_login_attempts_exceeded($identity)) {
					if (!$captcha ||$captcha != strtolower($this->session->userdata('captcha'))) {
						json_error(array('code' => -1, 'msg' => lang('error_login_captcha', 'default'), 'errcount' => $this->ion_auth->get_attempts_num($identity),'c'=>$captcha));
					}
				}
				$remember = (bool)$this->input->post('remember');

				if ($this->ion_auth->login($identity, $this->input->post('password'), $remember)) {
					$this->recycling_model->reset_locker();
					$this->investing_model->reset_locker();
					json_success(array('msg' => $this->ion_auth->messages(), 'redirect' => base_url()));
				} else {
					json_error(array('code' => 0, 'msg' => $this->ion_auth->errors(), 'errcount' => $this->ion_auth->get_attempts_num($identity)));
				}
			} else {
				json_error(array('errors'=>array('identity'=>form_error('identity'),'password'=>form_error('password'))))      ;

			}
		}else{
			$this->load->view('common/landing',$tpl_data);
		}
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

	public function search()
	{
		$number = $this->input->post('number');
		$phone = $this->input->post('phone');
		$captcha = strtolower($this->input->post('captcha'));
		$code = $this->input->post('code');
		$_captcha= strtolower($this->session->userdata('captcha'));
		if(!$captcha || !$_captcha || $_captcha != $captcha) {
			json_error(array('msg'=> $this->lang->line('error_search_captcha','default')));
		}
		if ( !isMobile($phone)) {
			json_error(array('msg'=> $this->lang->line('error_search_phone','default')));
		}
		$this->load->model('project/customer_model');
		$customer = $this->customer_model->get_customer(array('number'=>$number,'phone'=>$phone));
		if (!$customer){
			json_error(array('msg'=> $this->lang->line('error_search_phone','default')));
		}
		/*
		$sms_log = $this->customer_model->get_smscode($phone);
		if(!empty($sms_log['code']) && ($code == $sms_log['code']) && time() < ($sms_log['time']+600) ){
			json_error(array('msg'=> $this->lang->line('error_search_smstime','default')));
		}
		*/

		$project = $this->customer_model->search_projects($customer['customer_id']);

		json_success(array('msg'=>$this->load->view('common/project',$project),'title'=>'我的存金记录'));
	}
}