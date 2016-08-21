<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Project.php');
class Investing extends Project {

	private $mode = 'investing';

	public function __construct(){
		parent::__construct();
		$this->mode = 'investing';
		$this->load->model(array('investing_model'));
	}
	public function index()
	{
		$this->layout->add_includes(array(
			array('type'=>'css','src'=>_ASSET_.'lib/datatables/dataTables.bootstrap.css'),
			array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
		));
		$data['success'] = $this->session->flashdata('success');
		$data['warning'] = $this->session->flashdata('warning');
		if($this->input->get('list')){
			json_response($this->_list());
		}
		$this->layout->view('investing/list',$data);
	}

	protected function _list()
	{
		$rows = array();
		$result = $this->investing_model->projects()->result_array();
		$total = count($result);
		if($total){
			foreach($result as $row){
				$rows[] = array(
					'DT_RowId'  => $row['project_sn'],
					'status' 	=> '<label class="label label-primary">'.$row['status'].'</label>',
					'sn'		=> $row['project_sn'],
					'realname' 	=> $row['realname'],
					'phone'		=>$row['phone'],
					'price'		=>$row['price'],
					'weight'	=>$row['weight'],
					'period'	=>$row['period'].'个月',
					'amount'	=>$row['amount'],
					'addtime'	=>date('Y-m-d H:i',$row['addtime']),
					'operation'	=>$this->render_operation($row['status_id'])
				);
			}
		}
		return array(
			'draw' 				=> 1,
			'recordsTotal' 		=> $total,
			'recordsFiltered' 	=> $total,
			'data' => $rows
		);

	}

	public function applied()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_response(array('code'=>-1,'msg'=>$msg,'title'=>'没权限'));
		}
		if($this->input->server('REQUEST_METHOD') == 'POST'){
            $this->form_validation->set_rules('price', '实时金价', 'required');
            $this->form_validation->set_rules('weight', '购买克重', 'required');
            $this->form_validation->set_rules('realname', '真实姓名', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');
            $this->form_validation->set_rules('idnumber', '身份证号', 'required');
			if($this->config->item('investing_privacy')){
				$this->form_validation->set_rules('agree', '同意协议', 'required',array('required'=>'必须同意该条款协议'));
			}
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
				if($this->config->item('investing_privacy')){
					$errors['agree'] = form_error('agree');
				}
                json_response(array('code' => 0, 'errors' => $errors));
            }
        }else{
			$id = $this->input->get('project');
			$info = array(
				'project_id' => '',
				'project_sn' => 0,
				'status' => 1,
				'profit' => (float)($this->config->item('profit')/(12*100)),
				'privacy'=> $this->config->item('investing_privacy'),
				'agree'	=> ''
			);

			if($info['privacy']){
				$this->load->model('article/article_model');
				$article = $this->article_model->article($info['privacy'])->row_array();
				if(!empty($article['title'])) {
					$info['agree'] = sprintf('我已阅读并同意《%s》', anchor(site_url('article/article/detail/'.$article['article_id']), $article['title'], 'target="_blank"'));
				}
			}
			json_response(array('code'=>1,'title'=>'添加项目','msg'=>$this->load->view('investing/appling',$info,TRUE)));
		}
	}

	public function checked()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_response(array('code'=>-1,'msg'=>$msg,'title'=>'没权限'));
		}
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			$this->form_validation->set_rules('price', '实时金价', 'required');
			$this->form_validation->set_rules('weight', '购买克重', 'required');
			$this->form_validation->set_rules('realname', '真实姓名', 'required');
			$this->form_validation->set_rules('phone', '联系电话', 'required');
			$this->form_validation->set_rules('idnumber', '身份证号', 'required');
			if($this->config->item('investing_privacy')){
				$this->form_validation->set_rules('agree', '同意协议', 'required',array('required'=>'必须同意该条款协议'));
			}
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
				if($this->config->item('investing_privacy')){
					$errors['agree'] = form_error('agree');
				}
				json_response(array('code' => 0, 'errors' => $errors));
			}
		}else{

			$result = $this->investing_model->project($this->input->get('project'));

			if($result->num_rows()){
				$info = $result->row_array();
				$title = '项目核实 '.$info['realname'].':'.$info['project_sn'];

				json_response(array('code'=>1,'title'=>$title,'msg'=>$this->load->view('investing/checking',$info,TRUE)));
			}else{
				json_response(array('code'=>0,'msg'=>'参数异常，请稍后重试','title'=>'没结果'));
			}


		}
	}

	public function confirmed()
	{

	}


	public function certificated()
	{

	}

	public function taken()
	{

	}


}
