<?php

/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/12 0012
 * Time: 11:34
 */
class Filemanager extends XY_Controller
{

    public function __construct(){
        parent::__construct();
        $this->load->library('upload');
        //$this->load->library('Mupload');

    }
    public function download()
    {
        if($this->input->get('file') && file_exists($this->input->get('file'))){

            $this->load->helper('download');
            force_download($this->input->get('file'),NULL);
        }
    }

    public function upload()
    {
        $config = array(
            'encrypt_name' => /*$this->input->post('encrypt') ? $this->input->post('encrypt') :*/ TRUE,
            'upload_path' => $this->input->post('upload_path') ? $this->input->post('upload_path') : _UPLOADS_,
            'date_path' => $this->input->post('date_path') ? $this->input->post('date_path') : FALSE,
            'allowed_types' => $this->input->post('allowed_types') ? $this->input->post('allowed_types') : "*",
        );
        if($config['date_path']){
            $config['upload_path'] .= date('Y').'/'.date('m');
        }
        $this->build_path($config['upload_path']);
        $this->upload->initialize($config);
        if($this->upload->do_upload("uploads")) {
            json_response(array('code'=>1,'upload'=>array(
                'file' => $this->upload->data('file_name'),
                'width' => $this->upload->data('image_width'),
                'height' => $this->upload->data('image_height'),
                'origin' => $this->upload->data('orig_name'),
                //'full_path' => $this->upload->data('full_path'),
                'path' => str_ireplace(str_replace(DIRECTORY_SEPARATOR,'/',FCPATH),'',$this->upload->data('full_path')),
            )));
        }else{
            json_response(array('code'=>0,'error'=>$this->upload->display_errors()));
        }

    }

    private function build_path($upload_path)
    {
        $path = '';

        $directories = explode('/', str_replace('../', '', $upload_path));

        foreach ($directories as $directory) {
            $path = $path . '/' . $directory;

            if (!is_dir(FCPATH . $path)) {
                @mkdir(FCPATH . $path, 0777);
            }
        }
    }

}