<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends XY_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->library('setting');
	}
	public function index()
	{
		$data = $this->setting->get_settings_by_group('api');
		$this->layout->view('api',$data);
	}

	public function save()
	{
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			//$this->setting->add_setting('api', $this->input->post());
			$setting_id = 0;
			if($this->input->post()){
				foreach ($this->input->post() as $key => $value) {
					$setting_id = $this->setting->add_setting($key , $value,'api',1);
				}
			}

			json_response(array('code' => 1, 'msg'=>'成功','affected'=>$setting_id));
		}
	}
}
