<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class System extends XY_Controller {


	public function index()
	{
		$this->layout->add_includes(array(
			array('type'=>'css','src'=>_ASSET_.'lib/layer/skin/layer.css'),
			array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
		));
		$data['setting'] = $this->setting->get_settings_by_group('site');
		$data['success'] = $this->session->flashdata('success');
		$data['warning'] = $this->session->flashdata('warning');

		$this->layout->view('system',$data);

	}

	public function save()
	{
		$setting_id = $this->setting->add_setting($this->input->post('code') , $this->input->post('value'),'site',1);

		json_success();

	}
}
