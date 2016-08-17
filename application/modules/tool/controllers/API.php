<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends XY_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->library('setting');
	}
	public function golden_price()
	{
		$data = $this->setting->get_setting('golden_price');
		if(empty($data['apikey']) || empty($data['apiurl'])){
			json_response(array('code' => 0,'error'=> '参数异常'	));
		}
		$ch = curl_init();

	    // 添加apikey到header
	    curl_setopt($ch, CURLOPT_HTTPHEADER  , array(
	        'apikey:'.$data['apikey'],
	    ));
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	    // 执行HTTP请求
	    curl_setopt($ch , CURLOPT_URL , $data['apiurl']);
	    $result = curl_exec($ch);

		json_response(array(
			json_decode($result),
		));
	}

}
