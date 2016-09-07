<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customer extends XY_Controller {


    public function index()
    {
        $this->layout->view('report/customer');
    }
}
