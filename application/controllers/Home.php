<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends XY_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('tool/dashboard_model');

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
		}else {

			$info['groups'] = $this->ion_auth_model->groups()->result_array();

			json_response(array('code' => 1, 'title' => '发布通知', 'msg' => $this->load->view('common/notify', $info, TRUE)));
		}
	}

}
