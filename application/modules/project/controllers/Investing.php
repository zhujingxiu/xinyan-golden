<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Investing extends XY_Controller {

	private $mode = 'investing';
	public function index()
	{
		$this->layout->add_includes(array(
				array('type'=>'css','src'=>_ASSET_.'adminlte/plugins/datatables/dataTables.bootstrap.css'),
			));
		$this->layout->view('investing/list');
	}

	public function all()
	{
		$rows = array();
		$query = $this->db->get_where('project', array('mode' => $this->mode));
		if(count($query->result_array())){
			foreach($query->result_array() as $row){
				$rows[] = array(
					$row['project_sn'],
					$row['title'],
					$row['realname'],
					$row['phone'],
					$row['price'],
					$row['value'],
				);
			}
		}
		$data = array(
			'draw' 				=> 1,
			'recordsTotal' 		=> count($query->result_array()),
			'recordsFiltered' 	=> count($query->result_array()),
			'data' => $rows
		);
		die(json_encode($data));
	}
}
