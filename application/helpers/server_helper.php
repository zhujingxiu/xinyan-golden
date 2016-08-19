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

function main_menu()
{
	return array(
		'dashbord' => array(
			'text' => '控制面板',
			'icon' => '<i class="fa fa-dashboard"></i>',
			'style'=> 'active',
			'path' => array('/','home','home/index')
		),
		'project'  => array(
			'text' => '项目列表',
			'icon' => '<i class="fa fa-cubes"></i>',
			'style'=> 'treeview',
			'widget'=>array(
				'callback_topsale',array('args1','args2')
			),
			'path' =>'',
			'children' => array(
				'investing' => array(
					'text' => '钱生金',
					'path' => array('project/investing','project/investing/index')
				),
				'recycling' => array(
					'text' => '金生金',
					'path' => array('project/recycling','project/recycling/index')
				),
				'trash' => array(
					'text' => '回收站',
					'path' => array('project/trash','project/trash/index')
				),
			)
		),
		'article'  => array(
			'text' => '文章管理',
			'icon' => '<i class="fa fa-files-o"></i>',
			'style'=> 'treeview',
			'path' =>'',
			'children' => array(
				'article' => array(
					'text' => '文章列表',
					'path' => array('article/article','article/article/index')
				),
//				'privacy' => array(
//					'text' => '条款协议',
//					'path' => array('article/privacy','article/privacy/index')
//				),
				'category' => array(
					'text' => '文章分类',
					'path' => array('article/category','article/category/index')
				),
			)
		),
		'setting'  => array(
			'text' => '选项设定',
			'icon' => '<i class="fa fa-cogs"></i>',
			'style'=> 'treeview',
			'path' =>'',
			'children' => array(
				'system' => array(
					'text' => '系统参数',
					'path' => array('setting/system','setting/system/index')
				),
				'project' => array(
					'text' => '业务参数',
					'path' => array('setting/project','setting/project/index')
				),
				'api' => array(
					'text' => 'API',
					'path' => array('setting/api','setting/api/index')
				),
			)
		),
		'auth'  => array(
			'text' => '员工管理',
			'icon' => '<i class="fa fa-user"></i>',
			'style'=> 'treeview',
			'path' =>'',
			'children' => array(
				'worker' => array(
					'text' => '员工列表',
					'path' => array('auth/worker','auth/worker/index')
				),
				'role' => array(
					'text' => '角色管理',
					'path' => array('auth/role','auth/role/index')
				),
				'permission' => array(
					'text' => '权限节点',
					'path' => array('auth/permission','auth/permission/index')
				),
			)
		),
		'document' => array(
			'text' => '帮助文档',
			'icon' => '<i class="fa fa-book"></i>',
			'style'=> 'treeview',
			'path' => '',
			'children' => array(
				'multiupload' => array(
					'text' => 'Multi-Upload',
					'path' => array('tool/document/multi_upload','help/index')
				)
			)
		),
	);
}