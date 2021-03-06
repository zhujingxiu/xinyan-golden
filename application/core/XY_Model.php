<?php

/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/18 0018
 * Time: 10:01
 */
class XY_Model extends CI_Model
{
    /**
     * Hooks
     *
     * @var object
     **/
    protected $_xy_hooks;

    /**
     * Response
     *
     * @var string
     **/
    protected $response = NULL;

    /**
     * message (uses lang file)
     *
     * @var string
     **/
    protected $messages;

    /**
     * error message (uses lang file)
     *
     * @var string
     **/
    protected $errors;

    /**
     * error start delimiter
     *
     * @var string
     **/
    protected $error_start_delimiter;

    /**
     * error end delimiter
     *
     * @var string
     **/
    protected $error_end_delimiter;

    public function __construct()
    {
        parent::__construct();
        $this->load->database();

        $this->load->helper('cookie');
        $this->load->helper('date');


        // initialize messages and error
        $this->messages    = array();
        $this->errors      = array();
        $delimiters_source = 'config';

        // load the error delimeters either from the config file or use what's been supplied to form validation
        if ($delimiters_source === 'form_validation')
        {
            // load in delimiters from form_validation
            // to keep this simple we'll load the value using reflection since these properties are protected
            $this->load->library('form_validation');
            $form_validation_class = new ReflectionClass("CI_Form_validation");

            $error_prefix = $form_validation_class->getProperty("_error_prefix");
            $error_prefix->setAccessible(TRUE);
            $this->error_start_delimiter = $error_prefix->getValue($this->form_validation);
            $this->message_start_delimiter = $this->error_start_delimiter;

            $error_suffix = $form_validation_class->getProperty("_error_suffix");
            $error_suffix->setAccessible(TRUE);
            $this->error_end_delimiter = $error_suffix->getValue($this->form_validation);
            $this->message_end_delimiter = $this->error_end_delimiter;
        }
        else
        {
            // use delimiters from config
            $this->message_start_delimiter = '<p>';
            $this->message_end_delimiter   = '</p>';
            $this->error_start_delimiter   = '<p>';
            $this->error_end_delimiter     = '</p>';
        }


        // initialize our hooks object
        $this->_xy_hooks = new stdClass;



        $this->trigger_events('model_constructor');
    }

    public function set_hook($event, $name, $class, $method, $arguments)
    {
        $this->_xy_hooks->{$event}[$name] = new stdClass;
        $this->_xy_hooks->{$event}[$name]->class     = $class;
        $this->_xy_hooks->{$event}[$name]->method    = $method;
        $this->_xy_hooks->{$event}[$name]->arguments = $arguments;
    }

    public function remove_hook($event, $name)
    {
        if (isset($this->_xy_hooks->{$event}[$name]))
        {
            unset($this->_xy_hooks->{$event}[$name]);
        }
    }

    public function remove_hooks($event)
    {
        if (isset($this->_xy_hooks->$event))
        {
            unset($this->_xy_hooks->$event);
        }
    }

    protected function _call_hook($event, $name)
    {
        if (isset($this->_xy_hooks->{$event}[$name]) && method_exists($this->_xy_hooks->{$event}[$name]->class, $this->_xy_hooks->{$event}[$name]->method))
        {
            $hook = $this->_xy_hooks->{$event}[$name];

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
            if (isset($this->_xy_hooks->$events) && !empty($this->_xy_hooks->$events))
            {
                foreach ($this->_xy_hooks->$events as $name => $hook)
                {
                    $this->_call_hook($events, $name);
                }
            }
        }
    }

    /**
     * set_message_delimiters
     *
     * Set the message delimiters
     *
     * @return void
     * @author Ben Edmunds
     **/
    public function set_message_delimiters($start_delimiter, $end_delimiter)
    {
        $this->message_start_delimiter = $start_delimiter;
        $this->message_end_delimiter   = $end_delimiter;

        return TRUE;
    }

    /**
     * set_error_delimiters
     *
     * Set the error delimiters
     *
     * @return void
     * @author Ben Edmunds
     **/
    public function set_error_delimiters($start_delimiter, $end_delimiter)
    {
        $this->error_start_delimiter = $start_delimiter;
        $this->error_end_delimiter   = $end_delimiter;

        return TRUE;
    }

    /**
     * set_message
     *
     * Set a message
     *
     * @return void
     * @author Ben Edmunds
     **/
    public function set_message($message)
    {
        $this->messages[] = $message;

        return $message;
    }



    /**
     * messages
     *
     * Get the messages
     *
     * @return void
     * @author Ben Edmunds
     **/
    public function messages()
    {
        $_output = '';
        foreach ($this->messages as $message)
        {
            $messageLang = $this->lang->line($message) ? $this->lang->line($message) : '##' . $message . '##';
            $_output .= $this->message_start_delimiter . $messageLang . $this->message_end_delimiter;
        }

        return $_output;
    }

    /**
     * messages as array
     *
     * Get the messages as an array
     *
     * @return array
     * @author Raul Baldner Junior
     **/
    public function messages_array($langify = TRUE)
    {
        if ($langify)
        {
            $_output = array();
            foreach ($this->messages as $message)
            {
                $messageLang = $this->lang->line($message) ? $this->lang->line($message) : '##' . $message . '##';
                $_output[] = $this->message_start_delimiter . $messageLang . $this->message_end_delimiter;
            }
            return $_output;
        }
        else
        {
            return $this->messages;
        }
    }


    /**
     * clear_messages
     *
     * Clear messages
     *
     * @return void
     * @author Ben Edmunds
     **/
    public function clear_messages()
    {
        $this->messages = array();

        return TRUE;
    }


    /**
     * set_error
     *
     * Set an error message
     *
     * @return void
     * @author Ben Edmunds
     **/
    public function set_error($error)
    {
        $this->errors[] = $error;

        return $error;
    }

    /**
     * errors
     *
     * Get the error message
     *
     * @return void
     * @author Ben Edmunds
     **/
    public function errors()
    {
        $_output = '';
        foreach ($this->errors as $error)
        {
            $errorLang = $this->lang->line($error) ? $this->lang->line($error) : '##' . $error . '##';
            $_output .= $this->error_start_delimiter . $errorLang . $this->error_end_delimiter;
        }

        return $_output;
    }

    /**
     * errors as array
     *
     * Get the error messages as an array
     *
     * @return array
     * @author Raul Baldner Junior
     **/
    public function errors_array($langify = TRUE)
    {
        if ($langify)
        {
            $_output = array();
            foreach ($this->errors as $error)
            {
                $errorLang = $this->lang->line($error) ? $this->lang->line($error) : '##' . $error . '##';
                $_output[] = $this->error_start_delimiter . $errorLang . $this->error_end_delimiter;
            }
            return $_output;
        }
        else
        {
            return $this->errors;
        }
    }


    /**
     * clear_errors
     *
     * Clear Errors
     *
     * @return void
     * @author Ben Edmunds
     **/
    public function clear_errors()
    {
        $this->errors = array();

        return TRUE;
    }



    protected function _filter_data($table, $data)
    {
        $filtered_data = array();
        $columns = $this->db->list_fields($table);

        if (is_array($data))
        {
            foreach ($columns as $column)
            {
                if (array_key_exists($column, $data))
                    $filtered_data[$column] = $data[$column];
            }
        }

        return $filtered_data;
    }

    protected function _prepare_ip($ip_address) {
        // just return the string IP address now for better compatibility
        return $ip_address;
    }

    protected function activity($content)
    {
        $this->db->insert('worker_activity',array(
            'content' => $content,
            'worker_id' => $this->ion_auth->get_user_id(),
            'addtime' => time(),
            'ip' => $this->_prepare_ip($this->input->ip_address()),
        ));
    }

    protected function format_file_value($data){

        if(is_array($data) && count($data)){
            $_file = array();
            foreach($data as  $item){
                $_tmp = explode("|",$item);
                if(count($_tmp) > 1){
                    $_file[] = array('name'=> $_tmp[0],'path'=>$_tmp[1]);
                }
            }
            return $_file ? json_encode($_file):'';
        }
    }

    protected function generate_sn($mode='recycling'){
        if($mode == 'investing'){
            $table = 'project_investing';
            $prefix = 'GM';
        }else{
            $table = 'project_recycling';
            $prefix = 'GR';
        }
        $_sn = $prefix.date('ymd').rand(100,999).date('H').rand(1,9).date('is');

        $this->db->where(array('project_sn'=>$_sn));
        if($this->db->count_all_results($table) >0){
            $_sn = $this->generate_sn();
        }
        return $_sn;
    }

    protected function calculate_start($addtime)
    {
        $start = FALSE;
        switch(strtolower($this->config->item('growing_mode'))){
            case 't0':
                $start = date('Y-m-d',$addtime);
                break;
            case 't1':
                $start = date('Y-m-d',$addtime+24*60*60);
                break;
        }
        return $start;
    }

    protected function type_text($type){

        $query = $this->db->get_where('golden_type',array('code'=>strtolower($type)));
        if($query->num_rows()){
            $info = $query->row_array();
            return $info['title'];
        }
        return False;

    }

    protected function gold_types()
    {
        $query = $this->db->get_where('golden_type',array('status'=>1));
        if($query->num_rows()){
            return $query->result_array();
        }
        return False;
    }

    protected function calculate_unfinished_profit($month,$profit,$number,$weight){
        if(!$month || !$number)return 0;
        switch(strtolower($this->config->item('gold_growing') )){
            case 'season':
                $value = $number/3;
                break;
            case 'year':
                $value = $number/12;
                break;
            default:
                $value = $number;
                break;
        }
        return (float)(($profit/$month)*$value*$weight);
    }
}