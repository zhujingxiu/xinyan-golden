<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends XY_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function price()
	{

		$mode = $this->input->get('mode');
		if(!$mode)
			$mode = 'current';
		if(strtolower($mode)=='current'){
			$price = $this->current_price();
			$price ? json_success(array('current'=>$price)) : json_error();
		}
		$data = $this->tool_model->range($mode);
		$data ? json_success($data) : json_error();

	}

}
