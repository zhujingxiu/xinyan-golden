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



function download_link($path,$title='',$data=array()){

    if(empty($title)){
        $title = basename($title);
    }
    return anchor(site_url('tool/filemanager/download?file='.$path),$title,$data);
}