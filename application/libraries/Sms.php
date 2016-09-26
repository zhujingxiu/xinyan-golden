<?php

/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/9/26 0026
 * Time: 12:37
 */
/*
 * require_once 'curl.func.php';

$appkey = 'your_appkey_here';//你的appkey
$mobile = '13556811111,13556811112';//手机号 超过1024请用POST
$content = '用户您好。【极速数据】';//utf8
$url = "http://api.jisuapi.com/sms/send?appkey=$appkey&mobile=$mobile&content=$content";
$result = curlOpen($url);
$jsonarr = json_decode($result, true);
//exit(var_dump($jsonarr));
if($jsonarr['status'] != 0)
{
    echo $jsonarr['msg'];
    exit();
}
$result = $jsonarr['result'];
echo $result['count'].' '.$result['accountid'].'<br>';
 *
 *
 * {
    "status": "0",
    "msg": "ok",
    "result": {
        "count": "1",
        "accountid": "1"
    }
}
 */

class Sms {
    private $target_url = "http://api.jisuapi.com/sms/send";
    private $appkey = '101ae9aa1007ce6d';

    private $search_code = "您正在查询您的存金信息，验证码 %s ，工作人员不会向您索取，请勿泄露。【黄金码头】";

    public function search_code($telephone,$code){
        return $this->send_msg($telephone,sprintf($this->search_code,$code));
    }

    private function send_msg($telephone,$msg) {
        $phones = array();
        if(is_array($telephone)){
            foreach($telephone as $_phone){
                if(isMobile($_phone)){
                    $phones[] = $_phone;
                }
            }
        }else if(is_string($telephone) && isMobile($telephone)){
            $phones[] = $telephone;
        }
        $data = array(
            'appkey'	=> $this->appkey,
            'mobile'	=> implode(",",$phones),
            'content'	=> $msg
        );

        $result = curl_get($this->target_url,$data);
        $jsonarr = json_decode($result, true);

        if($jsonarr['status'] != 0)
        {
            return $jsonarr['msg'];
        }
        return $jsonarr['result'];
        // $result['count'].' '.$result['accountid'].'<br>';
    }

}