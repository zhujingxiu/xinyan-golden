<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends XY_Controller {


	public function index()
	{

		$this->layout->add_includes(array(
			//iCheck
			array('type'=>'css','src'=>_ASSET_.'lib/iCheck/flat/blue.css'),
			//Morris chart
			array('type'=>'css','src'=>_ASSET_.'lib/morris/morris.css'),
			// Date Picker
			array('type'=>'css','src'=>_ASSET_.'lib/datepicker/datepicker3.css'),
			// Daterange picker
			array('type'=>'css','src'=>_ASSET_.'lib/daterangepicker/daterangepicker.css'),
			// bootstrap wysihtml5
			//array('type'=>'css','src'=>_ASSET_.'lib/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css'),

		));

		$this->layout->view('common/dashboard');
	}


}
