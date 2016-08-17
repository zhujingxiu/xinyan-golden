<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Article_model extends CI_Model{

    private $table = 'article';
    private $category_table = 'article_category';
    private $worker_table = 'worker';

    public function article($article_id)
    {

        $this->db->select('a.*,atc.title category,atc.code,w.realname author, w.username', false);
        $this->db->from($this->table.' AS a')->order_by('a.addtime')->where("a.article_id = ".$article_id)->limit(1);
        $this->db->join($this->category_table.' AS atc','a.category_id = atc.category_id');
        $this->db->join($this->worker_table.' AS w', 'w.id = atc.worker_id');
        return $this->db->get();
    }

    public function articles($data=array())
    {
        if(is_array($data)){
            $this->db->where($data);
        }
        $this->db->select('a.*,atc.title category,atc.code,w.realname author, w.username', false);
        $this->db->from($this->table.' AS a')->order_by('a.addtime');
        $this->db->join($this->category_table.' AS atc','a.category_id = atc.category_id');
        $this->db->join($this->worker_table.' AS w', 'w.id = atc.worker_id');
        return $this->db->get();
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
    public function delete_article($article_id)
    {
        //$result = $this->article($article_id)->row_array();

        return $this->db->delete($this->table,array('article_id'=>$article_id));
    }

    public function get_articles_by_code($code='')
    {
        if(empty($code)) return array();
        $code = strtolower($code);

        return $this->articles(array('atc.code'=>$code));

    }
}