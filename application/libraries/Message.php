<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/9/4
 * Time: 12:44
 */
class Message
{
    public function __construct()
    {
        $this->ci =& get_instance();

        $this->ci->load->model('message_model');
    }

    public function add_activity($msg,$worker_id)
    {

        $this->ci->message_model->insert_worker_activity($msg,$worker_id);

    }

    public function worker_activities($limit=10){
        $result = $this->ci->message_model->get_activity_list($limit);
        if($result->num_rows()){
            return $result->result_array();
        }
        return FALSE;
    }
}