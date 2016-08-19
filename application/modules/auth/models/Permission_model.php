<?php

/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/10 0010
 * Time: 15:29
 */
class Permission_model extends CI_Model
{

    protected $_nodes = array();


    private function getChildren($node_id=null,$mode = 'auth'){
        $where = array( 'mode' => strtolower($mode) );
        if( $node_id != null ) {
            $where['parent_id'] = $node_id;
        }
        return $this->db->where($where)->order_by( 'parent_id ASC,sort ASC' )->get('node')->result_array();
    }

    public function getNodeTree($node_id=null ){
        $children = $this->getChildren( $node_id );
        foreach($children as $child ){
            $this->_nodes[$child['parent_id']][] = $child;
        }
        return $this->nodesFormat(0);
    }

    private function hasChildren($node_id){
        return isset($this->_nodes[$node_id]);
    }

    private function getNodes($node_id){
        return $this->_nodes[$node_id];
    }

    private function nodesFormat($parent_id=0){
        $nodes = array();
        if($this->hasChildren($parent_id)){
            $results = $this->getNodes($parent_id);
            foreach( $results as $result ){
                $tmp = array(
                    'node_id'   => $result['node_id'],
                    'level'     => $result['level'],
                    'p_id'      => $result['parent_id'],
                    'p_path'    => $this->getParentNodes($result['node_id']),
                    'path'      => !empty($result['path']) ? trim($result['path']) : '',
                    'name'      => $result['name'],
                    'title'     => $result['title'],
                    'status'    => $result['status'],
                    'auth'      => $result['auth'],
                    'sort'      => isset($result['sort']) ? (int)$result['sort'] : 0,
                );
                if($this->hasChildren($result['node_id'])){
                    $tmp['is_parent'] = 1;
                    $tmp['children'] = $this->nodesFormat( $result['node_id'] );
                }
                $nodes[] = ($tmp);
            }
            return $nodes;
        }
        return ;
    }

    public function getParentNodes($node_id){
        $result=array();
        $parent_nodes = $this->getRecursionParentNodes($node_id);
        unset($parent_nodes[count($parent_nodes)-1]);
        if(count($parent_nodes)){
            foreach ($parent_nodes as $item) {
                $result[] = $item['title'];
            }
        }
        return implode('/',$result);
    }

    function getRecursionParentNodes($node_id){
        $parent_nodes = array();
        $node =$this->db->get_where('node',array('node_id'=>$node_id))->row_array();
        if(isset($node['parent_id'])){
            $tmp = $this->getRecursionParentNodes($node['parent_id']);
            $parent_nodes[] = $node;
            $parent_nodes= array_merge($tmp,$parent_nodes);
        }
        return $parent_nodes;
    }

    public function saveNode($data) {

        if(!empty($data['node_id'])){
            $where['node_id'] = (int)$data['node_id'];
            if(isset($data['drag']) && $data['drag'] ==1){
                $fields = array();
                $fields['parent_id'] = (int)$data['parent'];
                $fields['sort'] = (int)$data['position'];
                $fields['level'] = 1;
                if($data['parent']){
                    $_p = $this->db->get_where('node',array('node_id'=>$data['parent']))->row_array();
                    if(!isset($_p['level'])){
                        $_p['level'] = 0;
                    }
                    $fields['level'] = ($_p['level']+1);
                }
                return $this->db->update("node",$fields,$where);
            }else{
                $node = $this->db->get_where('node',array('node_id'=>(int)$data['node_id']))->row_array();

                if(isset($node['node_id'])){
                    $fields = array(
                        'parent_id' => (int)$data['parent_id'],
                        'name'       => $data['name'],
                        'title'     => $data['title'],
                        'path'      => trim($data['path'],"/"),
                        'auth'      => (int)$data['auth'],
                        'status'    => (int)$data['status'],
                        'sort'      => (int)$data['sort']
                    );
                    return $this->db->update("node",$fields,$where);
                }
            }
        }else{
            $fields = array(
                'parent_id' => (int)$data['parent_id'],
                'name'      => $data['name'],
                'title'     => $data['title'],
                'path'      => trim($data['path'],"/"),
                'auth'      => (int)$data['auth'],
                'status'    => (int)$data['status'],
                'note'      => isset($data['note'])? $data['note'] :'',
                'sort'      => (int)$data['sort']
            );
            $this->db->insert("node",$fields);
            return $this->db->insert_id();
        }

        return false;
    }

    public function deleteNode($node_id) {
        $all_nodes = $this->getRecursionChildrenNodes($node_id);
        $all_nodes[] = $node_id;
        $this->db->where_in('node_id',$all_nodes);
        $this->db->delete("node");
        return count($all_nodes);
    }

    function getRecursionChildrenNodes($parent_id){
        $children_node= array();
        $nodes = $this->getNodesByParentId($parent_id);
        if($nodes){
            foreach ($nodes as $item) {
                if($item['node_id']){
                    $tmp = $this->getRecursionChildrenNodes($item['node_id']);
                    $tmp[] = $item['node_id'];
                    $children_node = array_merge($tmp,$children_node);
                }
            }
        }
        return $children_node;
    }

    function getNodesByParentId($parent_id){
        return $this->db->where('parent_id',$parent_id)->order_by('sort ASC,node_id ASC')->get('node')->result_array();
    }

    function get_node_by_path($path,$mode = 'auth')
    {
        $where = array(
            'mode'=>strtolower($mode),
            'path'=>strtolower($path)
        );
        return $this->db->where($where)->limit(1)->get('node')->row_array();

    }
}