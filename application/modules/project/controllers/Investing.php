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

		if($this->input->get('draw')){
			json_response($this->_list($this->input->get()));
		}
		$this->layout->view('investing/list',$data);
	}

	protected function _list($filter)
	{
		//排序

		$columns = isset($filter['columns']) ? $filter['columns'] : array();
		$index = (isset($filter['order']['0']['column'])) ? intval($filter['order']['0']['column']) : FALSE;
		$temp = array();
		if($index && isset($columns[$index]) && isset($columns[$index]['name'])){
			$temp['order_by'] = $columns[$index]['name'] .' '.(isset($filter['order']['0']['dir']) ? $filter['order']['0']['dir'] : 'asc');
		}else{
			$temp['order_by'] = "p.addtime asc";
		}
		//搜索
		if($filter['search']['value']){//获取前台传过来的过滤条件

		}

		//分页
		$temp['start'] = $filter['start'];//从多少开始
		$temp['limit'] = $filter['length'];//数据长度

		$rows = array();
		$result = $this->investing_model->projects($temp);
		$total = $result->num_rows();
		if($total){
			foreach($result->result_array() as $row){
				$rows[] = array(
					'DT_RowId'  => $row['project_sn'],
					'status' 	=> '<label class="label label-primary">'.$row['status'].'</label>',
					'sn'		=> $row['project_sn'],
					'realname' 	=> $row['realname'].'<br>'.$row['phone'],
					'price'		=> $row['price'],
					'weight'	=> $row['weight'],
					'period'	=> $row['period'].'个月',
					'amount'	=> $row['amount'],
					'operator'	=> $row['operator'],
					'addtime'	=> date('Y-m-d',$row['addtime']).'<br>'.date('H:i:s',$row['addtime']),
					'operation'	=> $this->render_operation($row['status_id'])
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
			json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('permission')));
		}
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			if($this->_valid_csrf_nonce() === FALSE){
				json_response(array('code' => 0, 'msg' => lang('error_csrf'),'title'=>lang('error_title')));
			}

			if($price = $this->session->tempdata('current_price')){
				$price = floatval(XEncrypt($price,'D'));
				$this->session->set_tempdata('current_price', NULL, -300);
				if($price*100 <= 0){
					json_response(array('code' => 0, 'msg' =>lang('error_current_price'),'title'=>lang('error_title')));
				}
			}else{
				json_response(array('code' => 0, 'msg' =>lang('error_current_price'),'title'=>lang('error_title')));
			}
            $this->form_validation->set_rules('weight', '购买克重', 'required');
            $this->form_validation->set_rules('realname', '真实姓名', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');
            $this->form_validation->set_rules('idnumber', '身份证号', 'required');
			if($this->config->item('investing_privacy')){
				$this->form_validation->set_rules('agree', '同意协议', 'required',array('required'=>'必须同意该条款协议'));
			}

            if ($this->form_validation->run() == TRUE)
            {
				$weight = $this->input->post('weight');
				$period = $this->input->post('period');
				$tmp = array(
					'realname' => $this->input->post('realname'),
					'phone' => $this->input->post('phone'),
					'idnumber' => $this->input->post('idnumber'),
					'wechat' => $this->input->post('wechat'),
					'referrer' => $this->input->post('referrer'),
					'note' => htmlspecialchars($this->input->post('editorValue')),
					'price' => $price,
					'weight'=> $weight,
					'period'=> $period,
					'amount'=> $this->calculate_amount($price,$weight),
					'total'=> $this->calculate_total($period,$weight,(float)($this->config->item('profit')/(12*100))),
				);
                if($this->investing_model->insert($tmp)){
                    $this->session->set_flashdata('success', '项目添加成功！');
                    json_response(array('code' => 1, 'success' => '成功'));
                }
            }else {

                $errors = array(
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

			$price = $this->current_price();
			$this->session->set_tempdata('current_price',XEncrypt($price),1200);
			$info = array(
				'price' => $price,
				'project_id' => '',
				'project_sn' => 0,
				'status' => 1,
				'profit' => (float)($this->config->item('profit')/(12*100)),
				'privacy'=> $this->config->item('investing_privacy'),
				'agree'	=> '',
				'csrf' => $this->_get_csrf_nonce()
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


	public function update()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
		}
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			if($this->_valid_csrf_nonce() === FALSE){
				json_response(array('code' => 0, 'msg' => lang('error_csrf'),'title'=>lang('error_title')));
			}

			$this->form_validation->set_rules('project_sn', '项目编号', 'required');
			$this->form_validation->set_rules('weight', '购买克重', 'required');
			$this->form_validation->set_rules('realname', '真实姓名', 'required');
			$this->form_validation->set_rules('phone', '联系电话', 'required');
			$this->form_validation->set_rules('idnumber', '身份证号', 'required');
			if ($this->form_validation->run() == TRUE)
			{
				$result = $this->investing_model->project($this->input->post('project_sn'));

				if(!$result->num_rows()){
					json_response(array('code' => 0, 'msg' => '项目不存在','title'=>lang('error_no_result')));
				}
				$info = $result->row_array();
				$weight = $this->input->post('weight');
				$period = $this->input->post('period');
				$tmp = array(
					'realname' => $this->input->post('realname'),
					'phone' => $this->input->post('phone'),
					'idnumber' => $this->input->post('idnumber'),
					'wechat' => $this->input->post('wechat'),
					'referrer' => $this->input->post('referrer'),
					'note' => htmlspecialchars($this->input->post('editorValue')),
					'weight'=> $weight,
					'period'=> $period,
					'amount'=> $this->calculate_amount($info['price'],$weight),
					'total'=> $this->calculate_total($period,$weight,(float)($this->config->item('profit')/(12*100))),
				);
				if($this->investing_model->update($this->input->post('project_sn'),$tmp)){
					$this->session->set_flashdata('success', '项目编辑成功！');
					json_response(array('code' => 1, 'success' => '成功'));
				}
			}else {

				$errors = array(
					'project_sn' => form_error('project_sn'),
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

				$info['csrf'] = $this->_get_csrf_nonce();
				$info['profit'] = (float)($this->config->item('profit')/(12*100));
				$title = '编辑项目 '.$info['realname'].':'.$info['project_sn'];

				json_response(array('code'=>1,'title'=>$title,'msg'=>$this->load->view('investing/update',$info,TRUE)));
			}else{
				json_response(array('code' => 0, 'msg' => '项目不存在','title'=>lang('error_no_result')));
			}
		}

	}

	public function checked()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
		}
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			if($this->_valid_csrf_nonce() === FALSE){
				json_response(array('code' => 0, 'msg' => lang('error_csrf'),'title'=>lang('error_title')));
			}
			$this->form_validation->set_rules('amount', '实收金额', 'required');
			$this->form_validation->set_rules('phone', '联系电话', 'required');

			if ($this->form_validation->run() == TRUE)
			{
				$result = $this->investing_model->project($this->input->post('project_sn'));
				if(!$result->num_rows()){
					json_response(array('code' => 0, 'msg' => '项目不存在','title'=>lang('error_no_result')));
				}
				if($this->investing_model->insert($this->input->post())){
					$this->session->set_flashdata('success', '项目添加成功！');
					json_response(array('code' => 1, 'success' => '成功'));
				}
			}else {

				$errors = array(
					'amount' => form_error('amount'),
					'phone' => form_error('phone'),
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
				$info['csrf'] = $this->_get_csrf_nonce();
				$title = '项目核实 '.$info['realname'].':'.$info['project_sn'];

				json_response(array('code'=>1,'title'=>$title,'msg'=>$this->load->view('investing/checking',$info,TRUE)));
			}else{
				json_response(array('code' => 0, 'msg' => '项目不存在','title'=>lang('error_no_result')));
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
