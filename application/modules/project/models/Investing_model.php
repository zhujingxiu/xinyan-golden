<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Investing_model extends CI_Model{

    private $table = 'project_investing';
    private $status_table = 'project_investing_status';
    private $worker_table = 'worker';

    public function project($sn)
    {
        if(!$sn){return false;}
        $this->db->select('p.*,pis.title status,pis.code,w.realname operator, w.username', false);
        $this->db->from($this->table.' AS p')->order_by('p.addtime')->where(array("p.project_sn" => $sn))->limit(1);
        $this->db->join($this->status_table.' AS pis','p.status_id = pis.status_id');
        $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id');
        return $this->db->get();
    }

    public function projects($data=array())
    {
        if(is_array($data)){
            $this->db->where($data);
        }
        $this->db->select('p.*,pis.title status,pis.code,w.realname operator, w.username', false);
        $this->db->from($this->table.' AS p')->order_by('p.addtime');
        $this->db->join($this->status_table.' AS pis','p.status_id = pis.status_id');
        $this->db->join($this->worker_table.' AS w', 'w.id = p.worker_id');
        return $this->db->get();
    }

    public function insert($data){

    }

    public function generate_sn(){

    }
    public function category($category_id)
    {

        $this->db->select('atc.*,w.realname, w.username', false);
        $this->db->from($this->category_table.' AS atc')->where("atc.category_id = ".$category_id);
        $this->db->join($this->worker_table.' AS w', 'w.id = atc.worker_id')->limit(1);
        
        return $this->db->get();
    }


    public function get_categories($data=array())
    {
        if(is_array($data)){
            $this->db->where($data);
        }
        $this->db->select('atc.*,w.realname, w.username', false);
        $this->db->from($this->category_table.' AS atc')->order_by('atc.addtime');
        $this->db->join($this->worker_table.' AS w', 'w.id = atc.worker_id');
        
        return $this->db->get();
    }

    public function update_category($id,$data = array()){
        if(!$id || empty($data['title']) || empty($data['code'])){
            return false;
        }

        $this->db->update($this->category_table,array(
            'title'=>$data['title'],
            'code'=>$data['code'],
            'is_admin'=>!empty($data['is_admin']),
            'worker_id'=> $this->ion_auth->get_user_id(),
            'addtime' => time()
            ),array('category_id'=>$id));
        return $this->db->affected_rows();
    }

    public function insert_category($data){
        if(empty($data['title']) || empty($data['code'])){
            return false;
        }

        $this->db->insert($this->category_table,array(
            'title'=>$data['title'],
            'code'=>$data['code'],
            'is_admin'=>!empty($data['is_admin']),
            'worker_id'=> $this->ion_auth->get_user_id(),
            'addtime' => time()
            ));
        return $this->db->insert_id();
    }
    public function delete_category($category_id)
    {
        $result = $this->category($category_id)->row_array();
        if(!empty($result['is_admin'])) return false;
        return $this->db->delete($this->category_table,array('category_id'=>$category_id));
    }


    function code_check($code = '',$ignore_id){
        if (empty($code))
        {
            return FALSE;
        }

        $where = array(
            'code' => $code,
        );
        if($ignore_id){
            $where['category_id != '] = $ignore_id;
        }
        return $this->db->where($where)
            ->order_by("category_id", "ASC")
            ->limit(1)
            ->count_all_results($this->category_table) >0;
    }


    public function update_article($id,$data = array()){
        if(!$id || empty($data['title']) || empty($data['category_id'])){
            return false;
        }

        $this->db->update($this->table,array(
            'title'=>$data['title'],
            'category_id'=>$data['category_id'],
            'text'=>$data['text'],
            'is_top'=>(int)$data['is_top'],
            'status'=>(int)$data['status'],
            'author_id'=> $this->ion_auth->get_user_id(),
            'addtime' => time()
        ),array('article_id'=>$id));
        return $this->db->affected_rows();
    }

    public function insert_article($data){
        if(empty($data['title']) || empty($data['category_id'])){
            return false;
        }

        $this->db->insert($this->table,array(
            'title'=>$data['title'],
            'category_id'=>$data['category_id'],
            'text'=>$data['text'],
            'is_top'=>(int)$data['is_top'],
            'status'=>(int)$data['status'],
            'author_id'=> $this->ion_auth->get_user_id(),
            'addtime' => time()
        ));
        return $this->db->insert_id();
    }


    public function set_hook($event, $name, $class, $method, $arguments)
    {
        $this->_ion_hooks->{$event}[$name] = new stdClass;
        $this->_ion_hooks->{$event}[$name]->class     = $class;
        $this->_ion_hooks->{$event}[$name]->method    = $method;
        $this->_ion_hooks->{$event}[$name]->arguments = $arguments;
    }

    public function remove_hook($event, $name)
    {
        if (isset($this->_ion_hooks->{$event}[$name]))
        {
            unset($this->_ion_hooks->{$event}[$name]);
        }
    }

    public function remove_hooks($event)
    {
        if (isset($this->_ion_hooks->$event))
        {
            unset($this->_ion_hooks->$event);
        }
    }

    protected function _call_hook($event, $name)
    {
        if (isset($this->_ion_hooks->{$event}[$name]) && method_exists($this->_ion_hooks->{$event}[$name]->class, $this->_ion_hooks->{$event}[$name]->method))
        {
            $hook = $this->_ion_hooks->{$event}[$name];

            return call_user_func_array(array($hook->class, $hook->method), $hook->arguments);
        }

        return FALSE;
    }

    public function trigger_events($events)
    {
        if (is_array($events) && !empty($events))
        {
            foreach ($events as $event)
            {
                $this->trigger_events($event);
            }
        }
        else
        {
            if (isset($this->_ion_hooks->$events) && !empty($this->_ion_hooks->$events))
            {
                foreach ($this->_ion_hooks->$events as $name => $hook)
                {
                    $this->_call_hook($events, $name);
                }
            }
        }
    }
}