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

	public function create()
	{
		if($this->input->server('REQUEST_METHOD') == 'POST'){
            $this->form_validation->set_rules('price', '实时金价', 'required');
            $this->form_validation->set_rules('weight', '购买克重', 'required');
            $this->form_validation->set_rules('realname', '真实姓名', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');
            $this->form_validation->set_rules('idnumber', '身份证号', 'required');

            if ($this->form_validation->run() == TRUE)
            {
                
                if($this->investing_model->insert($this->input->post())){
                    $this->session->set_flashdata('success', '项目添加成功！');
                    json_response(array('code' => 1, 'success' => '成功'));
                }
            }else {

                $errors = array(
                    'price' => form_error('price'),
                    'weight' => form_error('weight'),
                    'realname' => form_error('realname'),
                    'phone' => form_error('phone'),
                    'idnumber' => form_error('idnumber'),
                );
                json_response(array('code' => 0, 'errors' => $errors));
            }
        }
	}
}
