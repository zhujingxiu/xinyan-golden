<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends XY_Controller {


	public function index()
	{

		$this->layout->add_includes(array(
			//iCheck
			array('type'=>'css','src'=>_ASSET_.'lib/iCheck/flat/blue.css'),

		));

		$this->layout->view('common/dashboard');
	}


}
