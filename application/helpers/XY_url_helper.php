<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/7/20 0020
 * Time: 10:51
 */

function asset_url($uri)
{
    $uri = trim($uri,"/");
    return site_url(_ASSET_.$uri);
}

function theme_url(){

}

function parse_route($url)
{
    $url = trim($url,'/');
    $route = explode('/',$url);
    if(count($route)<3){
        $url .= '/index';
    }
    return $url;
}

function download_link($path,$title='',$data=array()){

    if(empty($title)){
        $title = basename($title);
    }
    return anchor(site_url('tool/filemanager/download?file='.$path),$title,$data);
}