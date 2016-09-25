<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title><?php echo $title?></title>
    <link rel="stylesheet" href="<?php echo asset_url('login/css/reset.css')?>">
    <link rel="stylesheet" href="<?php echo asset_url('login/css/login.css')?>">
    <!--[if lt IE 9]>
    <script src="<?php echo asset_url('base/html5shiv.min.js')?>" type="text/javascript" charset="utf-8"></script>
    <script src="<?php echo asset_url('base/respond.min.js')?>" type="text/javascript" charset="utf-8"></script>
    <![endif]-->
    <!--[if IE 6]>
    <script src="<?php echo asset_url('base/DD_belatedPNG_0.0.8a.js')?>" type="text/javascript"></script>
    <script>DD_belatedPNG.fix('.centerIcon');</script>
    <![endif]-->
    <base href="<?php echo base_url(); ?>">
    <link rel="icon" href="favicon.ico">
</head>

<body style="overflow: hidden;">
<div class="loginWrapper clearfix">
    <div class="banWrapper" style="background: #faf4eb">
        <div id="left-container" class="banContent">
            <div id="gold-price-charts" style="margin: 0;padding: 0;width:700px;height:380px;">
            </div>
        </div>
    </div>
    <div class="loginMain">
        <div class="loginWidth">
            <div class="loginLogoDiv" >
                <a class="loginLogo" href="<?php echo base_url();?>"></a>
            </div>
            <?php echo form_open("landing/search", array('class' => 'formLogin', 'id' => "search_form")); ?>
            <div class="loginList loginListUser">
                <label></label>
                <input type="text" class="loginText" name="number" id="search_number" placeholder="身份证号或金卡卡号"/>
                <span class="errorTips"><i></i><em></em></span>
            </div>
            <div class="loginList loginListPwd">
                <label></label>
                <input type="text" class="loginText" name="phone" id="search_phone" placeholder="预留的手机号"/>
                <span class="errorTips"><i></i><em></em></span>
            </div>
            <div class="loginList loginListCode" id="search-code">
                <label></label>
                <input type="text" class="loginText" name="captcha" id="search_captcha" placeholder="图形验证码"/>
                <img src="<?php echo base_url('landing/captcha'); ?>" id="captcha_search" >
                <a href="javascript:;" class="getImg" id="captchaSearch" onclick="document.getElementById('captcha_search').src='<?php echo base_url('landing/captcha'); ?>?_t=' + Math.random();">&nbsp;</a>
                <span class="errorTips"><i></i><em></em></span>
            </div>
            <div class="loginList loginListCode" id="sms-code">
                <label></label>
                <input type="text" class="loginText" name="code" id="search_code" placeholder="短信验证码"/>
                <input class="smsSend" type="button" id="get_smscode" value="发送验证码"/>
                <span class="errorTips"><i></i><em></em></span>
            </div>
            <div class="sysError" style="display:none">
                <label></label>
                <span><i></i><em></em></span>
            </div>
            <input class="loginBtn" type="button" id="searchBtn" value="查询存金"/>
            <p class="have">我是管理人员，<a href="javascript:;" onclick="$('#search_form').fadeOut();$('#login_form').fadeIn();">登入后台<i></i></a></p>
            <?php echo form_close(); ?>
            <?php echo form_open("landing/index", array('class' => 'formLogin', 'id' => "login_form",'style'=>"display:none;")); ?>
            <div class="loginList loginListUser">
                <label></label>
                <input type="text" class="loginText" name="identity" id="identity" placeholder="工号"/>
                <span class="errorTips"><i></i><em></em></span>
            </div>
            <div class="loginList loginListPwd">
                <label></label>
                <input type="password" class="loginText" name="password" id="password" placeholder="密码"/>
                <span class="errorTips"><i></i><em></em></span>
            </div>
            <div class="loginList loginListCode" style="display:none;" id="login-captcha">
                <label></label>
                <input type="text" class="loginText" name="captcha" id="captcha-login" placeholder="验证码"/>
                <img src="<?php echo base_url('landing/captcha'); ?>" id="captcha_login" >
                <a href="javascript:;" class="getImg" id="captchalogin" onclick="document.getElementById('captcha_login').src='<?php echo base_url('landing/captcha'); ?>?_t=' + Math.random();">&nbsp;</a>
                <span class="errorTips"><i></i><em></em></span>
            </div>
            <div class="sysError" style="display:none">
                <label></label>
                <span><i></i><em></em></span>
            </div>
            <input class="loginBtn" type="button" id="loginBtn" value="登录"/>
            <p class="have">我是平台客户，<a href="javascript:;" onclick="$('#login_form').fadeOut();$('#search_form').fadeIn();">查询存金<i></i></a></p>
            <?php echo form_close(); ?>
        </div>
    </div>
</div>
<script src="<?php echo asset_url('base/jquery.min.js')?>" type="text/javascript"></script>
<script src="<?php echo asset_url('base/app.js')?>"></script>
<script src="<?php echo asset_url('base/config.js')?>"></script>
<script>
    seajs.use("login",function(l){

        l.render_login();
        l.render_search();
        l.price('#left-container');
    })
</script>
</body>
</html>