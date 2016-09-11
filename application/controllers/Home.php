<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends XY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('tool/dashboard_model');
		$this->load->library('form_validation');
		$this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
	}
	public function index()
	{

		$this->layout->add_includes(array(
			//iCheck
			array('type'=>'css','src'=>_ASSET_.'lib/iCheck/flat/blue.css'),

		));
		$data['weight'] = $this->dashboard_model->sum_weight();
		$data['profit'] = $this->dashboard_model->sum_profit();
		$data['customer'] = $this->dashboard_model->sum_customer();
		$data['today'] = $this->dashboard_model->sum_today();

		$data['notifications'] = array();
		$notifications = $this->dashboard_model->notifications(10);
		if($notifications->num_rows()){
			foreach($notifications->result_array() as $item){

				$data['notifications'][] = array(
					'avatar' => $item['avatar'] && file_exists($item['avatar'])? site_url($item['avatar']) : site_url($this->config->item('default_avatar')),
					'title' => $item['title'],
					'content' => str_truncate($item['content'],30),
					'is_read' => $item['is_read'],
					'sender' => $item['sender'],
					'addtime' => $item['addtime'],
				);
			}
		}

		$data['projects'] = array();
		$projects = $this->dashboard_model->latest(10);
		if($projects->num_rows()){
			foreach($projects->result_array() as $item){

				$data['projects'][] = array(
					'mode' => $item['mode'] == 'investing' ? lang('text_investing') : lang('text_recycling'),
					'project_sn' => $item['project_sn'],
					'customer' => $item['realname'].'<br>'.$item['phone'],
					'referrer' => $item['referrer'],
					'weight' => $item['weight'],
					'start' => $item['start'],
				);
			}
		}

		$data['referrers']= array();
		$referrers = $this->dashboard_model->top_referrers(8);
		if($referrers->num_rows()){
			foreach($referrers->result_array() as $item) {
				$data['referrers'][] = array(
					'avatar' => ($item['avatar'] && file_exists($item['avatar'])) ? site_url($item['avatar']) : site_url($this->config->item('default_avatar')),
					'referrer' => $item['referrer'],
					'totals' => number_format($item['totals'], 2).lang('text_weight_unit'),
				);
			}
		}


		$this->layout->view('common/dashboard',$data);
	}

	public function notification(){

		if($msg = $this->session->flashdata('ajax_permission')){
			json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
		}
		if($this->input->server('REQUEST_METHOD') == 'POST') {
			if ($this->_valid_csrf_nonce() === FALSE) {
				//json_error(array( 'msg' => lang('error_csrf'),'title'=>lang('error_title')));
			}
			$this->form_validation->set_rules('title', '标题', 'required');
			$this->form_validation->set_rules('member[]', '成员', 'required');

			if ($this->form_validation->run() == TRUE) {
				$this->dashboard_model->notify($this->input->post());

				json_success(array('msg'=>lang('text_success_posted')));
			}else{
				$errors = array(
					'title' => form_error('title'),
					'member' => form_error('member[]'),
				);
				json_error(array('errors' =>$errors));
			}
		}else {
			$info['worker_id'] = $this->worker_id;
			$info['groups'] = array();
			$groups = $this->ion_auth_model->groups()->result_array();
			foreach($groups as $item){
				if($item['code'] == 'member') continue;
				$info['groups'][] = array(
					'group_id' => $item['id'],
					'title' => $item['title'],
					'code' => $item['code'],
					'member' => $this->ion_auth->get_group_users($item['id'])
				);
			}
			json_success(array('title' => '发布通知', 'msg' => $this->load->view('common/notify', $info, TRUE)));
		}
	}

}
