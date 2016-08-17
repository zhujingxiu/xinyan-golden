<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Investing extends XY_Controller {

	private $mode = 'investing';

	public function __construct(){
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model(array('investing_model'));
		$this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
	}
	public function index()
	{
		$this->layout->add_includes(array(
			array('type'=>'css','src'=>_ASSET_.'lib/datatables/dataTables.bootstrap.css'),
			array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
			array('type'=>'css','src'=>_ASSET_.'lib/layer/skin/layer.css'),
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

	public function apply()
	{
		$id = $this->input->get('project');
		$title = '添加项目';
		$info = array(
			'project_id' => '',
			'project_sn' => 0,
			'title'	=> '',
			'text' => '',
			'is_top' => 0,
			'status' => 1
		);


		$result = $this->investing_model->project($id)->row_array();
		if($result){
			$info = $result;
			$title = '编辑项目 '.$info['realname'].':'.$info['project_sn'];
		}


		$form = $this->load->view('investing/apply',$info,TRUE);

		json_response(array('code'=>1,'title'=>$title,'html'=>$form));
	}
}
