<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Search extends MX_Controller {

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
		$data['today_instock'] = $this->dashboard_model->sum_today_instock();
		$data['today_outstock'] = $this->dashboard_model->sum_today_outstock();
		$data['seven_warning'] = $this->dashboard_model->expiring_warning();

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
					'company' => $item['short_title'],
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


		$this->load->view('common/dashboard',$data);
	}

}
