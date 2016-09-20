<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once('Project.php');
class Investing extends Project {
	protected $mode = 'investing';
	public function __construct(){
		parent::__construct();
		$this->load->model(array('investing_model'));
	}
	public function index()
	{
		if($this->input->get('list')){
			json_response($this->_list($this->input->get()));
		}
		$this->layout->add_includes(array(
			array('type'=>'css','src'=>_ASSET_.'lib/datatables/dataTables.bootstrap.css'),
			//array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
			//array('type'=>'css','src'=>_ASSET_.'lib/jquery-ui/jquery-ui.min.css'),
		));
		$data['success'] = $this->session->flashdata('success');
		$data['warning'] = $this->session->flashdata('warning');


		$this->investing_model->reset_locker(false,$this->worker_id);
		$this->layout->view('investing/index',$data);
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
			$temp['order_by'] = "p.lasttime desc";
		}
		//搜索
		if($filter['search']['value']){//获取前台传过来的过滤条件
			$temp['or_where'] = $filter['search']['value'];
		}

		//分页
		$temp['start'] = $filter['start'];//从多少开始
		$temp['limit'] = $filter['length'];//数据长度

		if(!$this->inRole('manager')) {
			//$temp['where'] = FALSE;//ToDo
		}
		$rows = array();
		$result = $this->investing_model->projects($temp);
		$total = $result->num_rows();
		if($total){
			foreach($result->result_array() as $row){

				$rows[] = array(
					'DT_RowId'  => $row['project_sn'],
					'status' 	=> lang('label_'.strtolower($row['code'])),
					'sn'		=> $row['project_sn'],
					'realname' 	=> $row['realname'].'<br>'.$row['phone'],
					'price'		=> $row['price'],
					'weight'	=> $row['weight'],
					'payment'	=> $row['payment'] =='cash' ? lang('text_cash') : lang('text_gold'),
					'period'	=> $row['month'].lang('text_period_unit') ."<br>".lang('text_profit').calculate_profit($row['profit'],$row['month']).lang('text_profit_unit') ,
					'amount'	=> $row['amount'],
					'referrer'	=> $row['referrer'],
					'operator'	=> $row['operator'],
					'lasttime'	=> $row['lasttime'] ? date('Y-m-d',$row['lasttime']).'<br>'.date('H:i:s',$row['lasttime']) :lang("text_unknown"),
					'operation'	=> $this->investing_operation($row['status_id'],$row['locker_id'])
				);
			}
		}
		return array(
			'draw' 				=> $this->input->get('draw'),
			'recordsTotal' 		=> $total,
			'recordsFiltered' 	=> $total,
			'data' => $rows
		);

	}

	public function booked()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('permission')));
		}
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			if($this->_valid_csrf_nonce() === FALSE){
				//json_error(array( 'msg' => lang('error_csrf'),'title'=>lang('error_title')));
			}

			if($price = $this->session->tempdata('current_price')){
				$price = floatval(XEncrypt($price,'D'));
				$this->session->set_tempdata('current_price', NULL, -300);
				if($price*100 <= 0){
					json_error(array('msg' =>lang('error_current_price')));
				}
			}else{
				json_error(array('msg' =>lang('error_current_price')));
			}
            $this->form_validation->set_rules('weight', '购买克重', 'required');
			$this->form_validation->set_rules('period_id', '预存周期', 'required');
			$this->form_validation->set_rules('payment', '交付方式', 'required');
            $this->form_validation->set_rules('realname', '真实姓名', 'required');
            $this->form_validation->set_rules('phone', '联系电话', 'required');
            $this->form_validation->set_rules('idnumber', '身份证号', 'required');
			if($this->config->item('investing_privacy')){
				//$this->form_validation->set_rules('agree', '同意协议', 'required',array('required'=>'必须同意该条款协议'));
			}
			$period = $this->project_model->period($this->input->post('period_id'));
			if($period->num_rows()){
				$_p = $period->row_array();
			}else{
				json_error(array('msg'=>lang('error_period')));
			}
            if ($this->form_validation->run() == TRUE)
            {
				$tmp = array(
					'realname' => $this->input->post('realname'),
					'phone' => $this->input->post('phone'),
					'idnumber' => $this->input->post('idnumber'),
					'wechat' => $this->input->post('wechat'),
					'referrer' => $this->input->post('referrer'),
					'transferrer' => $this->input->post('transferrer'),
					'payment'=>  $this->input->post('payment'),
					'note' => htmlspecialchars($this->input->post('editorValue')),
					'price' => $price,
					'month' => $_p['month'],
					'profit' => calculate_rate($_p['profit'],$_p['month']),
					'weight'=> $this->input->post('weight'),
					'privacy'=> empty($this->input->post('privacy')) ? FALSE : (array)$this->input->post('privacy'),
				);
                if($this->investing_model->insert($tmp)){
                    $this->session->set_flashdata('success', '项目添加成功！');
                    json_success();
                }
            }else {
                $errors = array(
                    'weight' => form_error('weight'),
					'payment' => form_error('payment'),
					'period_id' => form_error('period_id'),
                    'realname' => form_error('realname'),
                    'phone' => form_error('phone'),
                    'idnumber' => form_error('idnumber'),
                );
                json_response(array('code' => 0, 'errors' => $errors));
            }
        }else{

			$price = $this->current_price();
			if($price){
				$price = number_format($price,2);
			}else{
				json_error();
			}
			$this->session->set_tempdata('current_price',XEncrypt($price),1200);
			$info = array(
				'price' => $price,
				'project_id' => '',
				'project_sn' => 0,
				'status' => 1,
				'privacy'=> $this->config->item('investing_privacy_in'),
				'agree'	=> '',
				'csrf' => $this->_get_csrf_nonce()
			);
			if($info['privacy']){
				$this->load->model('article/article_model');
				$article = $this->article_model->article($info['privacy'])->row_array();
				if(!empty($article['title'])) {
					$info['agree'] = sprintf(lang('text_agree'), anchor(site_url('article/article/detail/'.$article['article_id']), $article['title'], 'target="_blank"'));
				}
			}
			$info['periods'] = $this->project_model->periods(array('status'=>1))->result_array();
			$info['transferrers'] = $this->group_users('manager');
			json_response(array('code'=>1,'title'=>'添加钱生金项目','msg'=>$this->load->view('investing/booking',$info,TRUE)));
		}
	}


	public function update()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
		}
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			if($this->_valid_csrf_nonce() === FALSE){
				//json_error(array('msg' => lang('error_csrf')));
			}

			$this->form_validation->set_rules('project_sn', '项目编号', 'required');
			$this->form_validation->set_rules('weight', '购买克重', 'required');
			$this->form_validation->set_rules('period_id', '预存周期', 'required');
			$this->form_validation->set_rules('payment', '交付方式', 'required');
			if ($this->form_validation->run() == TRUE)
			{
				$result = $this->investing_model->project($this->input->post('project_sn'));

				if(!$result->num_rows()){
					json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
				}
				$project = $result->row_array();
				$operators = array($project['worker_id']);

				//验证项目可编辑状态
				if(!in_array($project['status_id'],array($this->config->item('investing_initial'),$this->config->item('investing_refused'))) ){
					json_error(array('msg'=>lang('error_project_status')));
				}
				//验证项目操作人
				if(!in_array($this->worker_id,$operators)){
					json_error(array('msg'=>lang('error_project_operator')));
				}
				$period = $this->project_model->period($this->input->post('period_id'));
				if($period->num_rows()){
					$_p = $period->row_array();
				}else{
					json_error(array('msg'=>lang('error_period')));
				}
				$tmp = array(
					'referrer' => $this->input->post('referrer'),
					'note' => htmlspecialchars($this->input->post('editorValue')),
					'transferrer'=>  $this->input->post('transferrer'),
					'payment'=>  $this->input->post('payment'),
					'month' => $_p['month'],
					'profit' => calculate_rate($_p['profit'],$_p['month']),
					'weight'=>  $this->input->post('weight'),
					'privacy'=> empty($this->input->post('privacy')) ? FALSE : (array)$this->input->post('privacy'),
				);
				if($this->investing_model->update($this->input->post('project_sn'),$tmp)){
					$this->session->set_flashdata('success', sprintf("项目编辑成功！ 编号: %s",$project['project_sn']));
					json_success();
				}
			}else {
				$errors = array(
					'project_sn' => form_error('project_sn'),
					'weight' => form_error('weight'),
					'payment' => form_error('payment'),
					'period_id' => form_error('period_id'),
				);
				if($this->config->item('investing_privacy')){
					//$errors['agree'] = form_error('agree');
				}
				json_error(array('errors' => $errors));
			}
		}else{
			$result = $this->investing_model->project($this->input->get('project'));

			if($result->num_rows()){
				$info = $result->row_array();

				$info['csrf'] = $this->_get_csrf_nonce();
				$_privacy = $this->investing_model->files($info['project_sn'],'privacy');
				if($_privacy->num_rows()){
					$_info = $_privacy->result_array();
					foreach($_info as $item){
						$info['privacies'] = json_decode($item['file'],TRUE);
					}
				}
				$info['periods'] = $this->project_model->periods(array('status'=>1))->result_array();
				$info['transferrers'] = $this->group_users('manager');
				$title = '编辑项目 '.$info['realname'].':'.$info['project_sn'];
				//lock
				$info['unlock'] = false;
				$info['editable'] = $info['status_id'] == $this->config->item('investing_initial');
				//set the locker is the current user_id
				if(empty($info['locker']) || $info['locker_id'] == $this->worker_id){
					$this->investing_model->set_locker($info['project_sn']);
				}else{
					$info['editable'] = false;
					$title = sprintf(lang('text_lock'), $info['locker']);var_dump($title);
					if($this->inRole('manager')) {
						$info['unlock'] = true;
						$info['text_confirm_relax'] = sprintf(lang('text_relax'),$info['locker']);
					}
				}
				json_success(array(
					'title'=>$title,
					'msg'=>$this->load->view('investing/update',$info,TRUE),
					'editable'=>$info['editable'],
                    'unlock'=>$info['unlock']
				));
			}else{
				json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
			}
		}

	}
	public function detail(){
		$result = $this->investing_model->project($this->input->get('project'));
		if($result->num_rows()){
			$info = $result->row_array();
			$info['privacies'] = FALSE;

			$_privacy = $this->investing_model->files($info['project_sn'],'privacy');
			if($_privacy->num_rows()){
				$_info = $_privacy->result_array();
				foreach($_info as $item){
					$info['privacies'] = json_decode($item['file'],TRUE);
				}
			}
			$info['profit_weight'] = number_format($info['weight']*$info['profit'],2);
			$info['histories'] = $this->investing_model->histories($info['project_sn']);
			json_success(array(
				'title'=>'项目详情 '.$info['realname'].':'.$info['project_sn'],
				'msg'=>$this->load->view('investing/detail',$info,TRUE),
				'terminable'=>false//$this->inRole('manager')
			));
		}else{
			json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
		}
	}
	public function checked()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
		}
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			if($this->_valid_csrf_nonce() === FALSE){
				//json_error(array('msg' => lang('error_csrf'),'title'=>lang('error_title')));
			}
			$this->form_validation->set_rules('amount', '实收金额', 'required');
			$this->form_validation->set_rules('phone', '联系电话', 'required');

			if ($this->form_validation->run() == TRUE)
			{
				$project_sn = $this->input->post('project_sn');
				$note = htmlspecialchars($this->input->post('editorValue'));
				$amount = $this->input->post('amount');
				$phone = $this->input->post('phone');
				$result = $this->investing_model->project($project_sn);
				if(!$result->num_rows()){
					json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
				}
				$project = $result->row_array();
				$operators = expload_2_array($project['transferrer']);
				//验证项目可编辑状态
				if(!in_array($project['status_id'],array($this->config->item('investing_initial'))) ){
					json_error(array('msg'=>lang('error_project_status')));
				}
				//验证项目操作人
				if(!in_array($this->worker_id,$operators)){
					json_error(array('msg'=>lang('error_project_operator')));
				}
				if(($project['amount']*100 == $amount*100) && $project['phone'] == $phone){
					$this->investing_model->push_state($project_sn,array(
						'request'	=> var_export(array(
								'amount' =>$amount,
								'_amount' =>$this->input->post('_amount'),
								'phone' =>$phone,
								'_phone' =>$this->input->post('_phone')
							),TRUE),
						'status'	=> $this->config->item('investing_checked'),
						'start'		=> $this->calculate_start($project['addtime']),
						'transferrer' =>$this->input->post('transferrer'),
						'note' 		=> $note,
						'call_func' => 'active_period',
						'call_param'=> $project_sn
					));
					$this->session->set_flashdata('success', sprintf("项目已核实！编号: %s",$project_sn));
					json_success();
				}else{
					json_error(array('errors' => array(
						'amount' => lang("error_confirm_amount"),
						'phone' => lang("error_confirm_phone"),
					)));
				}
			}else {
				json_error(array('errors' => array(
					'amount' => form_error('amount'),
					'phone' => form_error('phone'),
				)));
			}
		}else{
			$result = $this->investing_model->project($this->input->get('project'));
			if($result->num_rows()){
				$info = $result->row_array();
				$info['csrf'] = $this->_get_csrf_nonce();
				$info['start'] = $this->calculate_start($info['addtime']);
				$info['histories'] = $this->investing_model->histories($info['project_sn']);
				$info['privacies'] = '';
				$_privacy = $this->investing_model->files($info['project_sn'],'privacy');
				if($_privacy->num_rows()){
					$_info = $_privacy->result_array();
					foreach($_info as $item){
						$info['privacies'] = json_decode($item['file'],TRUE);
					}
				}
				$info['start'] = $this->calculate_start($info['addtime']);
				$starttime  = strtotime($info['start']);
				$info['end'] = calculate_end($starttime,$info['month']);
				$info['profit_weight'] = number_format($info['weight']*$info['profit'],2);
				$info['transferrers'] = $this->group_users('warehouser');
				$title = '项目核实 '.$info['realname'].':'.$info['project_sn'];
				//lock
				$info['unlock'] = false;
				$info['editable'] = $info['status_id'] == $this->config->item('investing_initial');
				//set the locker is the current user_id
				if(empty($info['locker']) || $info['locker_id'] == $this->worker_id){
					$this->investing_model->set_locker($info['project_sn']);
				}else{
					$info['editable'] = false;
					$title = sprintf(lang('text_lock'), $info['locker']);
					if($this->inRole('manager')) {
						$info['unlock'] = true;
						$info['text_confirm_relax'] = sprintf(lang('text_relax'),$info['locker']);
					}
				}
				json_success(array(
					'title'=>$title,
					'msg'=>$this->load->view('investing/checking',$info,TRUE),
					'editable'=>$info['editable'],
					'unlock'=>$info['unlock']
				));
			}else{
				json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
			}
		}
	}

	public function confirmed()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_response(array('code'=>-1,'msg'=>$msg,'title'=>lang('error_permission')));
		}
		if($this->input->server('REQUEST_METHOD') == 'POST'){
			if($this->_valid_csrf_nonce() === FALSE){
				//json_error(array('msg' => lang('error_csrf'),'title'=>lang('error_title')));
			}
			$this->form_validation->set_rules('weight', '确认重量', 'required');
			$this->form_validation->set_rules('phone', '联系电话', 'required');

			if ($this->form_validation->run() == TRUE)
			{
				$project_sn = $this->input->post('project_sn');
				$note = htmlspecialchars($this->input->post('editorValue'));
				$weight = $this->input->post('weight');
				$phone = $this->input->post('phone');
				$result = $this->investing_model->project($project_sn);
				if(!$result->num_rows()){
					json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
				}
				$project = $result->row_array();
				$operators = expload_2_array($project['transferrer']);
				//验证项目可编辑状态
				if(!in_array($project['status_id'],array($this->config->item('investing_checked'))) ){
					json_error(array('msg'=>lang('error_project_status')));
				}
				//验证项目操作人
				if(!in_array($this->worker_id,$operators)){
					json_error(array('msg'=>lang('error_project_operator')));
				}
				if(($project['weight']*100 == $weight*100) && $project['phone'] == $phone){
					$callback = array(
						'return_transfer'=>array(
							'project_sn' => $project_sn,
							'status_id'  => $this->config->item('investing_checked')
						)
					);
					if($this->config->item('growing_mode') && strtolower($this->config->item('growing_mode')) == 't0'){
						//T+0
						$callback['project_growing'] = $project_sn;
						$callback['project_instock'] = array(
							'project_sn' => $project_sn,
							'note' => $note
						);
					}
					$this->investing_model->push_state($project_sn,array(
						'status'	=> $this->config->item('investing_confirmed'),
						'note' 		=> $note,
						'request'	=> var_export(array(
							'weight' =>$weight,
							'_weight' =>$this->input->post('_weight'),
							'phone' =>$phone,
							'_phone' =>$this->input->post('_phone')
						),TRUE),
						'call_func' => $callback
					));
					$this->session->set_flashdata('success', sprintf("项目已入库标记！编号: %s",$project_sn));

					json_success();
				}else{
					json_error(array('errors' => array(
						'weight' => lang("error_confirm_weight"),
						'phone' => lang("error_confirm_phone"),
					)));
				}

			}else {
				json_error(array('errors' =>  array(
					'weight' => form_error('weight'),
					'phone' => form_error('phone'),
				)));
			}
		}else{
			$result = $this->investing_model->project($this->input->get('project'));
			if($result->num_rows()){
				$info = $result->row_array();
				$info['csrf'] = $this->_get_csrf_nonce();
				$info['start'] = $this->calculate_start($info['addtime']);
				$info['histories'] = $this->investing_model->histories($info['project_sn']);
				$info['privacies'] = '';
				$_privacy = $this->investing_model->files($info['project_sn'],'privacy');
				if($_privacy->num_rows()){
					$_info = $_privacy->result_array();
					foreach($_info as $item){
						$info['privacies'] = json_decode($item['file'],TRUE);
					}
				}
				$info['profit_weight'] = number_format($info['weight']*$info['profit'],2);
				$title = '项目入库 '.$info['realname'].':'.$info['project_sn'];
				//lock
				$info['unlock'] = false;
				$info['editable'] = $info['status_id'] == $this->config->item('investing_checked');
				//set the locker is the current user_id
				if(empty($info['locker']) || $info['locker_id'] == $this->worker_id){
					$this->investing_model->set_locker($info['project_sn']);
				}else{
					$info['editable'] = false;
					$title = sprintf(lang('text_lock'), $info['locker']);
					if($this->inRole('manager')) {
						$info['unlock'] = true;
					}
				}
				json_success(array(
					'title'=>$title,
					'msg'=>$this->load->view('investing/confirming',$info,TRUE),
					'editable'=>$info['editable'],
					'unlock' => $info['unlock']
				));
			}else{
				json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
			}
		}
	}


	public function refused()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
		}
		$project_sn = $this->input->post('project_sn');
		$reason = $this->input->post('value');
		if(!$project_sn || !$reason ){
			json_error();
		}
		if(strlen($reason) < 10){
			json_error(array('msg'=>lang('error_reason_length'),'title'=>lang('error_title')));
		}
		$result = $this->investing_model->project($project_sn);
		if(!$result->num_rows()){
			json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
		}
		if($this->investing_model->push_state($project_sn,array(
			'status'=> $this->config->item('investing_refused'),
			'start' => '',
			'note' 	=> $reason
		))){
			$this->session->set_flashdata('success', sprintf("项目已驳回！编号: %s",$project_sn));
			json_success();
		}
		json_error();
	}

	public function terminated()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
		}
		$project_sn = $this->input->post('project_sn');
		$reason = $this->input->post('value');
		if(!$project_sn || !$reason ){
			json_error();
		}
		if(strlen($reason) < 10){
			json_error(array('msg'=>lang('error_reason_length'),'title'=>lang('error_title')));
		}
		$result = $this->investing_model->project($project_sn);
		if(!$result->num_rows()){
			json_error(array('msg' => lang('error_no_project'),'title'=>lang('error_no_result')));
		}
		$tmp =array(
			'status'=> $this->config->item('investing_terminated'),
			'note' 	=> $reason,
		);
		if($this->config->item('terminated_trash')){
			$tmp['call_func'] = array(
				'trash_bin'=> array('project_sn' => $project_sn,'reason' => $reason),
				'erp_stock'=> array('project_sn' => $project_sn,'reason' => $reason)
			);
		}
		if($this->investing_model->push_state($project_sn,$tmp)){
			$this->session->set_flashdata('success', sprintf("项目已终止！编号: %s",$project_sn));
			json_success();
		}
		json_error();
	}

	public function trashed()
	{
		if($msg = $this->session->flashdata('ajax_permission')){
			json_error(array('msg'=>$msg,'title'=>lang('error_permission')));
		}
		$project_sn = $this->input->post('project_sn');
		if(!$project_sn  ){
			json_error();
		}

		if($this->investing_model->hidden($project_sn)){
			$this->session->set_flashdata('success', sprintf("项目已回收！编号: %s",$project_sn));
			json_success();
		}
		json_error();
	}

	public function reset_locker()
	{
		$project_sn = $this->input->get('project_sn');
		$locker = $this->input->get('locker');
		if($locker){
			if( $this->investing_model->set_locker($project_sn,$this->worker_id)){
				json_success(array('reset'=>1));
			}
		}else if( $this->investing_model->reset_locker($project_sn)){
			//json_success(array('reset'=>1));
		}
	}

	public function privacy(){
		$sn = XEncrypt($this->input->get('xe'),'D');
		$result = $this->investing_model->project($sn);


		if($result && $result->num_rows()){

			$project = $result->row_array();
			if(in_array($project['status_id'],array($this->config->item('investing_refused'),$this->config->item('investing_terminated')))){

				die( '参数异常，您查找的项目不符合打印协议');
			}
			$this->layout->view('privacy',$project,FALSE);
		}else{
			die( '参数异常，您查找的项目不存在');
		}


	}
}
