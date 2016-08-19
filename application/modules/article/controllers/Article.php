<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Article extends XY_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
        $this->load->model(array('article_model'));
        $this->form_validation->set_error_delimiters('<span class="help-block">', '</span>');
    }
    public function index()
    {

        $this->layout->add_includes(array(
            array('type'=>'css','src'=>_ASSET_.'lib/datatables/datatables.bootstrap.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/ueditor/themes/default/css/ueditor.min.css'),
            array('type'=>'css','src'=>_ASSET_.'lib/layer/skin/layer.css'),
        ));
        $data['articles']=$this->article_model->articles()->result_array();
        $data['success'] = $this->session->flashdata('success');
        $data['warning'] = $this->session->flashdata('warning');

        $this->layout->view('article',$data);
    }

    public function save()
    {
        if($this->input->server('REQUEST_METHOD') == 'POST'){
            //json_response(['code'=>0]+$this->input->post());
            $this->form_validation->set_rules('title', '标题', 'trim|required|min_length[2]|max_length[32]');

            $this->form_validation->set_rules('category_id', '分类', 'trim|required');

            if ($this->form_validation->run() == TRUE)
            {

                $data = array(
                    'title' => $this->input->post('title'),
                    'category_id' => $this->input->post('category_id'),
                    'is_top' => $this->input->post('is_top'),
                    'status' => $this->input->post('status'),
                    'text' => htmlspecialchars($this->input->post('editorValue')),
                );
                $res = $this->input->post('article_id') ?
                			$this->article_model->update_article($this->input->post('article_id'),$data) : $this->article_model->insert_article($data);

                if($res){
                    $this->session->set_flashdata('success', '文章保存成功');
                    json_response(array('code' => 1, 'success' => '成功'));
                }else
                {
                	$this->session->set_flashdata('warning', '参数异常');
                    json_response(array('code' => 0, 'errors' => '参数异常'));
                }
            }else {

                $errors = array(
                    'title' => form_error('title'),
                    'category_id' => form_error('category_id'),
                );
                json_response(array('code' => 0, 'errors' => $errors));
            }
        }
    }
    public function get_info()
    {
        $id  = $this->input->get('category_id');
        $info = $this->article_model->category($id)->row_array();


        json_response(array('code'=>1,'info'=>$info));
    }

    public function form()
    {
    	$id = $this->input->get('article_id');
        $title = '添加文章';
    	$info = array(
    		'article_id' => '',
    		'category_id' => 0,
    		'title'	=> '',
    		'text' => '',
    		'is_top' => 0,
            'status' => 1
    	);

            
		$result = $this->article_model->article($id)->row_array();
        if($result){
            $info = $result;
            $title = '编辑文章 '.$info['author'].':'.str_truncate($info['title'],20);
        }

    	$info['categories'] = $this->article_model->get_categories()->result_array();
        $form = $this->load->view('form',$info,TRUE);
//var_dump($form);
    	json_response(array('code'=>1,'title'=>$title,'html'=>$form));
    }

    public function umupload()
    {
        //var_dump($this->input->post());
        $this->load->library("UMuploader");
        //上传配置
        $config = array(
            "savePath" => "/public/uploads/" ,             //存储文件夹
            "maxSize" => 2048 ,                   //允许的文件最大尺寸，单位KB
            "allowFiles" => array( ".gif" , ".png" , ".jpg" , ".jpeg" , ".bmp" )  //允许的文件格式
        );
        //上传文件目录
        $Path = "/public/uploads/";

        //背景保存在临时目录中
        $config[ "savePath" ] = $Path;
        $up = new UMuploader( "upfile" , $config );
        $type = $_REQUEST['type'];
        $callback=$_GET['callback'];

        $info = $up->getFileInfo();
        /**
         * 返回数据
         */
        if($callback) {
            echo '<script>'.$callback.'('.json_encode($info).')</script>';
        } else {
            echo json_encode($info);
        }
    }
}
