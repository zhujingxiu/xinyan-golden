<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>

    <title><?php echo $title?>-登录</title>

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

<body>
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
            <?php echo form_open("auth/login", ['class' => 'formLogin', 'id' => "login_form"]); ?>

            <div class="loginList loginListUser">
                <label></label>
                <input type="text" class="loginText" name="identity" id="identity" value="" placeholder="用户名/手机号/邮箱"/>
                <span class="errorTips"><i></i><em></em></span>
            </div>
            <div class="loginList loginListPwd">
                <label></label>
                <input type="password" class="loginText" name="password" id="password" value="" placeholder="密码"/>
                <span class="errorTips"><i></i><em></em></span>
            </div>
            <div class="loginList loginListCode" style="display:none;">
                <label></label>
                <input type="text" class="loginText" name="captcha" id="captcha" value="" placeholder="验证码"/>
                <img src="<?php echo base_url('auth/login/captcha'); ?>" id="captcha_img" >
                <a href="javascript:;" class="getImg" id="captchaimg" onclick="document.getElementById('captcha_img').src='<?php echo base_url('auth/login/captcha'); ?>?_t=' + Math.random();">&nbsp;</a>
                <span class="errorTips"><i></i><em></em></span>
            </div>
            <div class="sysError" style="display:none">
                <label></label>
                <span><i></i><em></em></span>
            </div>
            <input class="loginBtn" type="button" id="loginBtn" value="登录"/>
            <?php echo form_close(); ?>
        </div>
    </div>
</div>
<script src="<?php echo asset_url('base/jquery.min.js')?>" type="text/javascript"></script>
<script src="<?php echo asset_url('base/app.js')?>"></script>
<script src="<?php echo asset_url('base/config.js')?>"></script>
<script>
    seajs.use("login",function(l){
        l.price('#left-container');
    })
</script>
</body>
</html>