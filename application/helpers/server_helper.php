<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 *
 * @author		Chaegumi
 * @copyright	Copyright (c) 2015 jeawin.com
 * @email		chaegumi@jeawin.com
 * @filesource
 */
/**
 * Unserialize value only if it was serialized.
 *
 * @since 2.0.0
 *
 * @param string $original Maybe unserialized original, if is needed.
 * @return mixed Unserialized data can be any type.
 */
function maybe_unserialize( $original ) {
	if ( is_serialized( $original ) ) // don't attempt to unserialize data that wasn't serialized going in
		return @unserialize( preg_replace('!s:(\d+):"(.*?)";!se', "'s:'.strlen('$2').':\"$2\";'", $original ) );
	return $original;
}

/**
 * Check value to find if it was serialized.
 *
 * If $data is not an string, then returned value will always be false.
 * Serialized data is always a string.
 *
 * @since 2.0.5
 *
 * @param mixed $data Value to check to see if was serialized.
 * @param bool $strict Optional. Whether to be strict about the end of the string. Defaults true.
 * @return bool False if not serialized and true if it was.
 */
function is_serialized( $data, $strict = true ) {
	// if it isn't a string, it isn't serialized
	if ( ! is_string( $data ) )
		return false;
	$data = trim( $data );
 	if ( 'N;' == $data )
		return true;
	$length = strlen( $data );
	if ( $length < 4 )
		return false;
	if ( ':' !== $data[1] )
		return false;
	if ( $strict ) {
		$lastc = $data[ $length - 1 ];
		if ( ';' !== $lastc && '}' !== $lastc )
			return false;
	} else {
		$semicolon = strpos( $data, ';' );
		$brace     = strpos( $data, '}' );
		// Either ; or } must exist.
		if ( false === $semicolon && false === $brace )
			return false;
		// But neither must be in the first X characters.
		if ( false !== $semicolon && $semicolon < 3 )
			return false;
		if ( false !== $brace && $brace < 4 )
			return false;
	}
	$token = $data[0];
	switch ( $token ) {
		case 's' :
			if ( $strict ) {
				if ( '"' !== $data[ $length - 2 ] )
					return false;
			} elseif ( false === strpos( $data, '"' ) ) {
				return false;
			}
			// or else fall through
		case 'a' :
		case 'O' :
			return (bool) preg_match( "/^{$token}:[0-9]+:/s", $data );
		case 'b' :
		case 'i' :
		case 'd' :
			$end = $strict ? '$' : '';
			return (bool) preg_match( "/^{$token}:[0-9.E-]+;$end/", $data );
	}
	return false;
}

/**
 * Check whether serialized data is of string type.
 *
 * @since 2.0.5
 *
 * @param mixed $data Serialized data
 * @return bool False if not a serialized string, true if it is.
 */
function is_serialized_string( $data ) {
	// if it isn't a string, it isn't a serialized string
	if ( !is_string( $data ) )
		return false;
	$data = trim( $data );
	$length = strlen( $data );
	if ( $length < 4 )
		return false;
	elseif ( ':' !== $data[1] )
		return false;
	elseif ( ';' !== $data[$length-1] )
		return false;
	elseif ( $data[0] !== 's' )
		return false;
	elseif ( '"' !== $data[$length-2] )
		return false;
	else
		return true;
}

/**
 * Serialize data, if needed.
 *
 * @since 2.0.5
 *
 * @param mixed $data Data that might be serialized.
 * @return mixed A scalar data
 */
function maybe_serialize( $data ) {
	if ( is_array( $data ) || is_object( $data ) )
		return serialize( $data );

	// Double serialization is required for backward compatibility.
	// See http://core.trac.wordpress.org/ticket/12930
	if ( is_serialized( $data, false ) )
		return serialize( $data );

	return $data;
}


// 输出json数据
if(!function_exists('json_response')){
	function json_response($obj, $callback = ''){
		$CI = &get_instance();
		if($callback == ''){
			$CI->output->set_output(json_encode($obj));
		}else{
			$CI->output->set_output($CI->input->get($callback) . '(' . json_encode($obj) . ')');
		}
		$CI->output->_display();
		exit();
	}
}

if(!function_exists('json_success')) {
	function json_success($data=array())
	{
		$tmp['msg'] = (isset($data['msg'])) ? $data['msg'] : lang("text_success");
		$tmp['title'] = (isset($data['title'])) ? $data['title'] : lang("title_success");
		unset($data['msg']);
		unset($data['title']);
		json_response(array('code' => 1, 'msg' => $tmp['msg'], 'title' => $tmp['title']) + $data);
	}
}

if(!function_exists('json_error')) {
	function json_error($data=array())
	{
		$tmp['msg'] = (isset($data['msg'])) ? $data['msg'] : lang("error_params");
		$tmp['title'] = (isset($data['title'])) ? $data['title'] : lang("error_title");
		unset($data['msg']);
		unset($data['title']);
		json_response(array('code' => 0, 'msg' => $tmp['msg'], 'title' => $tmp['title']) + $data);
	}
}

function zeroFull($value,$length = 3){
    $zeroFull = array();
    for($i=strlen((int)$value);$i<$length;$i++){
        $zeroFull[]='0';
    }
    $zeroFull[] = (int)$value;
    return implode('', $zeroFull);
}

function _is_curl_installed() {
    if(in_array('curl', get_loaded_extensions())) {
        return true;
    }
    else {
        return false;
    }
}

function deldir($dir) {
  //先删除目录下的文件：
    $dh=opendir($dir);

    while ($file=readdir($dh)) {
        if($file!="." && $file!="..") {
            $fullpath=$dir."/".$file;
            if(!is_dir($fullpath)) {
                unlink($fullpath);
            } else {
                deldir($fullpath);
            }
        }
    }
    closedir($dh);
    //删除当前文件夹：

    if(rmdir($dir)) {
        return true;
    } else {
        return false;
    }
}

function XEncrypt($string,$operation='E'){
	$key = md5(get_instance()->config->item('encryption_key'));
	$key_length = strlen($key);
	$string = $operation == 'D' ? base64_decode($string) : substr(md5($string.$key),0,8).$string;
	$string_length = strlen($string);
	$rndkey = $box = array();
	$result = '';
	for($i = 0;$i <= 255;$i++){
		$rndkey[$i] = ord($key[$i%$key_length]);
		$box[$i] = $i;
	}
	for($j = $i = 0;$i < 256;$i++){
		$j = ($j+$box[$i]+$rndkey[$i])%256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}
	for($a = $j = $i = 0;$i<$string_length;$i++){
		$a = ($a+1)%256;
		$j = ($j+$box[$a])%256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		$result .= chr(ord($string[$i])^($box[($box[$a]+$box[$j])%256]));
	}
	if($operation == 'D'){
		if(substr($result,0,8) == substr(md5(substr($result,8).$key),0,8)){
			return substr($result,8);
		}else{
			return'';
		}
	}else{
		return str_replace('=','',base64_encode($result));
	}
}

function str_truncate($string, $length = 60, $etc = '...', $count_words = true) {
	mb_internal_encoding ( "UTF-8" );
	$string = strip_tags(trim(html_entity_decode($string)));
	if ($length == 0) return '';
	preg_match_all ( "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|\xe0[\xa0-\xbf][\x80-\xbf]|[\xe1-\xef][\x80-\xbf][\x80-\xbf]|\xf0[\x90-\xbf][\x80-\xbf][\x80-\xbf]|[\xf1-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]/", $string, $info );
	if ($count_words) {
		$k = 0;
		$wordscut = '';
		for($i = 0; $i < count ( $info [0] ); $i ++) {
			$wordscut .= $info [0] [$i];
			$k ++;
			if ($k >= $length) {
				return $wordscut . $etc;
			}
		}
		return join ( '', $info [0] );
	}
	return join ( "", array_slice ( $info [0], 0, $length ) ) . $etc;
}
function get_image_url($fileName){

	$ext = substr($fileName,strrpos($fileName,'.') + 1);
	if(in_array($ext,array('jpg','jpeg','gif','png'))){
		$imgurl = $fileName;
	}else{

		$imgurl = "public/images/icons/$ext.png";
	}
	return $imgurl;
}
function days_sub($start,$end=FALSE){
	$starttime = strtotime($start);
	if($end){
		$endtime = strtotime($end);

	}else{
		$endtime = time();
	}

	return round(($endtime - $starttime)/(60*60*24));
}
function calculate_amount($price,$weight)
{
	return round((float)$price*$weight,2);
}
function format_time($time,$simple=false){
	if(!is_numeric($time)){
		$time = strtotime($time);
	}
	$now = time();
	$value = $now - $time;
	if($value < 60){
		$result = $value."秒前";
	}else if($value>=60 && $value <60*60){
		$result = floor($value/60)."分钟前";
	}else if($value >= 60*60 && $value<24*60*60){
		$result = floor($value/(60*60))."小时前";
	}else{
		$result = $simple ? date('y/m/d H:i',$time) : date('Y-m-d H:i',$time);
	}
	return $result;
}
function format_weight($weight){
	$_weight = number_format($weight,2);
	$_tmp = explode(",",$_weight);
	$result = $_weight.'<small>克</small>';
	if(is_array($_tmp)){

		$length = count($_tmp);
		switch($length){
			case 3:
				$result = $_tmp[0].'<small>吨</small>'.(int)$_tmp[1].'<small>公斤</small>'.$_tmp[2].'<small>克</small>';
				break;
			case 2:
				$result = (int)$_tmp[0].'<small>公斤</small>'.$_tmp[1].'<small>克</small>';
				break;
			case 1:
				$result = $_tmp[0].'<small>克</small>';
				break;
		}

	}
	return $result;
}
function curl_post($url,$data)
{
	$ch = curl_init();

	// 添加apikey到header
	curl_setopt($ch, CURLOPT_HTTPHEADER  , $data);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	// 执行HTTP请求
	$output = curl_setopt($ch , CURLOPT_URL , $url);
	curl_exec($ch);
	return $output;
}

function curl_get($url,$data=array()){
	//设置选项，包括URL
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url.($data?'?'.http_build_query($data):''));
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_HEADER, 0);

	//执行并获取HTML文档内容
	$output = curl_exec($ch);

	//释放curl句柄
	curl_close($ch);
	return $output;
}

function expload_2_array($string,$flag=","){
	$result = array();
	$_tmp = explode($flag,$string);
	if(is_array($_tmp)){
		foreach($_tmp as $item){
			if($item){
				$result[] = $item;
			}
		}
	}
	return $result;
}

function is_date( $str )
{
	$stamp = strtotime( $str );

	if (!is_numeric($stamp))
	{
		return FALSE;
	}
	$month = date( 'm', $stamp );
	$day   = date( 'd', $stamp );
	$year  = date( 'Y', $stamp );

	if (checkdate($month, $day, $year))
	{
		return TRUE;
	}

	return FALSE;
}

function calculate_rate($profit,$month)
{
	return number_format((float)(($profit/(12*100))*$month),4);
}

function calculate_profit($rate,$month){
	return number_format(($rate*(12/$month)*100.00),2);
}

function calculate_end($starttime,$month)
{
	return date('Y-m-d',mktime(0,0,0,date('m',$starttime)+(int)$month,date('d',$starttime)-1,date('Y',$starttime)));;
}

/**

 * *

 * @param string $value

 * @param string $match

 * @return boolean

 */
function isURL($url,$match='/^(http:\/\/)?(https:\/\/)?([\w\d-]+\.)+[\w-]+(\/[\d\w-.\+\/?%&=#]*)?$/i'){
	if(empty($url)){
		return false;
	}
	$url = strtolower(trim($url));
	return preg_match($match, $url);
	return false;

}

/**

 * @param string $value

 * @param int $length

 * @return boolean

 */
function isEmail($value,$match='/^[\w\d]+[\w\d-.]*@[\w\d-.]+\.[\w\d]{2,10}$/i'){
	$v = trim($value);
	if(empty($v))
		return false;

	return preg_match($match,$v);
}

/**

 * @param string $value

 * @return boolean

 */
function isTelephone($value,$match='/^0[0-9]{2,3}[-]?\d{7,8}$/'){
	$v = trim($value);
	if(empty($v))
		return false;
	return preg_match($match,$v);
}

/**

 * @param string $value

 * @param string $match

 * @return boolean

 */
function isMobile($value,$match='/^[(86)|0]?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/'){
	$v = trim($value);
	if(empty($v))
		return false;
	return preg_match($match,$v);
}
/**

 * @param string $value

 * @param string $match

 * @return boolean

 */
function isPostcode($value,$match='/\d{6}/'){
	$v = trim($value);
	if(empty($v))
		return false;
	return preg_match($match,$v);
}
/**

 * @param string $value

 * @param string $match

 * @return boolean

 */
function isIP($value,$match='/^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/'){
	$v = trim($value);
	if(empty($v))
		return false;
	return preg_match($match,$v);
}