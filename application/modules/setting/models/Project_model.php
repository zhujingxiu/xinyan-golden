<?php 
class Project_model extends CI_model {
	private $investing_table = 'project_investing_status';
	private $recycling_table = 'project_recycling_status';
	private $period_table = 'project_period';
	public function statuses($data=array(),$mode='investing') {
		$table = strtolower($mode) == 'recycling' ? $this->recycling_table : $this->investing_table;
		if(is_array($data)){
			$this->db->where($data);
		}
		$this->db->order_by('status_id asc');
		return $this->db->get($table);
	}

	public function status($id,$mode='investing')
	{
		$table = strtolower($mode) == 'recycling' ? $this->recycling_table : $this->investing_table;
		$this->db->from($table)->order_by('status_id asc')->where("status_id",$id)->limit(1);
		return $this->db->get();
	}

	function code_check($code = '',$ignore_id,$mode='investing'){
		$table = strtolower($mode) == 'recycling' ? $this->recycling_table : $this->investing_table;
		if (empty($code))
		{
			return FALSE;
		}

		$where = array(
			'code' => $code,
		);
		if($ignore_id){
			$where['status_id != '] = $ignore_id;
		}
		return $this->db->where($where)
			->order_by("status_id", "ASC")
			->limit(1)
			->count_all_results($table) >0;
	}

	public function update($id,$data = array()){
		if(!$id || empty($data['title']) || empty($data['code'])){
			return false;
		}
		$table = isset($data['mode']) && strtolower($data['mode']) == 'recycling' ? $this->recycling_table : $this->investing_table;
		$this->db->update($table,array(
			'title'=>$data['title'],
			'code'=>$data['code'],
			'status'=>(int)$data['status'],
			'note'=> $data['note']
		),array('status_id'=>$id));
		return $this->db->affected_rows();
	}

	public function insert($data=array()){
		if( empty($data['title']) || empty($data['code'])){
			return false;
		}
		$table = isset($data['mode']) && strtolower($data['mode']) == 'recycling' ? $this->recycling_table : $this->investing_table;
		$this->db->insert($table,array(
			'title'=>$data['title'],
			'code'=>$data['code'],
			'status'=>(int)$data['status'],
			'note'=> $data['note']
		));
		return $this->db->insert_id();
	}
	public function delete($status_id,$mode='investing')
	{
		$table = strtolower($mode) == 'recycling' ? $this->recycling_table : $this->investing_table;
		return $this->db->delete($table,array('status_id'=>$status_id));
	}

	public function periods($data=array()) {
		if(is_array($data)){
			$this->db->where($data);
		}
		$this->db->order_by('period_id asc');
		return $this->db->get($this->period_table);
	}

	public function period($id)
	{
		$this->db->from($this->period_table)->order_by('period_id asc')->where("period_id",$id)->limit(1);
		return $this->db->get();
	}

	public function update_period($id,$data = array()){
		if(!$id || empty($data['title']) || empty($data['profit'])){
			return false;
		}
		$this->db->update($this->period_table,array(
			'title'=>$data['title'],
			'month'=>$data['month'],
			'profit'=>$data['profit'],
			'status'=>(int)$data['status'],
			'default'=>(int)$data['default'],
			'note'=> $data['note']
		),array('period_id'=>$id));
		return $this->db->affected_rows();
	}

	public function insert_period($data=array()){
		if( empty($data['title']) || empty($data['profit'])){
			return false;
		}
		$this->db->insert($this->period_table,array(
			'title'=>$data['title'],
			'month'=>$data['month'],
			'profit'=>$data['profit'],
			'status'=>(int)$data['status'],
			'default'=>(int)$data['default'],
			'note'=> $data['note']
		));
		return $this->db->insert_id();
	}
	public function delete_period($period_id)
	{
		return $this->db->delete($this->period_table,array('period_id'=>$period_id));
	}
}