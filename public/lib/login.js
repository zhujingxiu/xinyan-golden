define(function(require, exports, module) {
    require('ajaxSubmit');
    var resetSMS,searchPhone,interval = 120;
    exports.render_search = function() {

        $(function () {
            require('layer')
            $("#searchBtn").click(function () {
                $('.sysError').css('display', 'none');
                $('.errorTips').css('display', 'none');
                $(this).val('查询中...').prop("disabled", true);
                var number = $("#search_number").val();
                var phone = $("#search_phone").val();
                var captcha = $("#search_captcha").val();
                var code = $("#search_code").val();
                number = $.trim(number);
                phone = $.trim(phone);
                captcha = $.trim(captcha);
                code = $.trim(code);

                if (number.length < 5) {
                    exports.error('请输入有效的卡号', $("#search_number"), $("#searchBtn"));
                    return false;
                }else if (phone.length < 6) {
                    exports.error('请输入有效的手机号码', $("#search_phone"), $("#searchBtn"));
                    return false;
                }else if ( captcha == '') {
                    exports.error('请输入有效的验证码', $("#captcha-search"), $("#searchBtn"));
                    return false;
                }else if ( code == '') {
                    exports.error('请输入有效的验证码', $("#captcha-code"), $("#searchBtn"));
                    return false;
                }

                $("#search_form").ajaxSubmit({
                    dataType: 'json',
                    success: function (json) {
                        var code = json.code;
                        if (code == '1') {
                            require('datatables')
                            require('datatables.bs');
                            layer.open({
                                type: 1,
                                title: json.title,
                                area:'900px',
                                offset: '100px',
                                zIndex: 99,
                                btn: [ '关闭'],
                                content: json.msg,
                                yes:function(index, layero){
                                    layer.close(index);
                                    $("#searchBtn").val('查询存金').prop("disabled", false);
                                }
                            });

                        }
                        else {
                            if (code == '0') {//登录数据库验证,登录失败显示
                                $('.sysError').show().find('em').html(json.msg);
                            }
                            if (code == '-1') {//验证码错误显示
                                $("#search-captcha").css('display', 'block');
                                exports.error(json.msg, $("#captcha-search"),$("#searchBtn"));
                            }

                            if ($("#search-captcha").css('display') == 'block') {
                                $("#captchasearch").click();
                            }

                            $("#searchBtn").val('查询中...').prop("disabled", false);
                            return false;
                        }
                    }
                })
            });

            $('#search_number').bind('blur', function () {
                var number = $('#search_number').val();
                if(number == ''){
                    exports.error('请输入有效的卡号', $(this), $("#searchBtn"));
                    return false;
                }
                $.get('/tool/common/validate_number',{number:$(this).val()},function(json){
                    if(json.code == 0){
                        exports.error(json.msg, $(this), $("#searchBtn"));
                        return false;
                    }else{
                        exports.success($('#search_number'));
                    }
                },'json');
            });

            $('#search_phone').bind('blur', function () {
                var number = $('#search_number').val();
                if(number == ''){
                    exports.error('请输入有效的卡号', $("#search_number"), $("#searchBtn"));
                    //return false;
                }
                var phone = $('#search_phone').val();
                if(phone == '' || !isMoblieCN(phone)){
                    exports.error('请输入有效的手机号', $('#search_phone'), $("#searchBtn"));
                    return false;
                }
                $.get('/tool/common/validate_phone',{number:number,phone:phone},function(json){
                    if(json.code == 0){
                        exports.error(json.msg, $('#search_phone'), $("#searchBtn"));
                        return false;
                    }else{
                        exports.success($('#search_phone'));
                    }
                },'json');
            });

            $('#search_captcha').bind('blur', function () {
                var captcha = $(this).val();
                if(captcha == ''){
                    exports.error('请输入图形验证码', $(this), $("#searchBtn"));
                    return false;
                }
                $.get('/tool/common/validate_captcha',{captcha:captcha},function(json){
                    if(json.code == 0){
                        exports.error(json.msg, $('#search_captcha'), $("#searchBtn"));
                        return false;
                    }else{
                        exports.success($('#search_captcha'));
                    }
                },'json');
            });

            $('#get_smscode').bind('click',function() {
                if ($(this).attr('disabled') == 'disabled') {
                    alert('短信验证码申请太过于频繁，请稍后再试！');
                    return false;
                }
                $('#search_captcha').trigger('blur');
                $('#search_number').trigger('blur');
                $('#search_phone').trigger('blur');
                var obj_number = $('#search_number').val();
                var obj_mobile = $('#search_phone').val();
                var obj_captcha = $('#search_captcha').val();
                var $that = $(this);
                $.ajax({
                    url:'/tool/common/get_smscode',
                    data:{number:obj_number,phone:obj_mobile,captcha:obj_captcha},
                    dataType:'json',
                    success:function(json){
                        if(json.code==1){
                            $that.attr('disabled','disabled');
                            searchPhone = obj_mobile;
                            exports.send_agin();
                        }else{
                            $('.sysError').show().find('em').html(json.msg);
                            return false;
                        }
                    }
                })
            });

            $('input[name="phone"]').bind("propertychange input",function(){
                if($(this).val() != searchPhone ){
                    clearTimeout(resetSMS);
                    $('#get_smscode').removeAttr('disabled').val('发送验证码');
                }
            });

        })
    }

    exports.send_agin = function (){
        interval--;
        if(interval>0){
            resetSMS = setTimeout(function(){exports.send_agin();},1000);
            $('#get_smscode').val(interval+'秒后重新获取');
        }else{
            $('#get_smscode').removeAttr('disabled').val('获取验证码');
            interval=120;
        }
    }
    exports.render_login = function() {
        $(document).ready(function () {
            var refer = $('base').attr('href');
            $("#loginBtn").click(function () {
                $('.sysError').css('display', 'none');
                $('.errorTips').css('display', 'none');
                $("#loginBtn").val('登录中...').prop("disabled", true);
                var identity = $("#identity").val();
                var userpass = $("#password").val();
                var captcha = $("#captcha").val();
                identity = $.trim(identity);
                userpass = $.trim(userpass);
                captcha = $.trim(captcha);

                if (identity.length < 5) {
                    exports.error('请输入有效的用户名!', $("#identity"), $("#loginBtn"));
                    return false;
                }
                else if (userpass.length < 6) {
                    exports.error('请输入有效的密码!', $("#password"), $("#loginBtn"));
                    return false;
                }
                else if ($("#login-captcha").css('display') == 'block' && captcha == '') {
                    exports.error('请输入有效的验证码', $("#captcha-login"), $("#loginBtn"));
                    return false;
                }

                $("#login_form").ajaxSubmit({
                    dataType: 'json',
                    success: function (json) {
                        var code = json.code;
                        //当用户登录错误且次数超过3次,显示验证码
                        if (code != '1' && $("#login-captcha").css('display') == 'none' && json.errcount > 2) {
                            $("#login-captcha").css('display', 'block');
                        }
                        if (code == '1') {
                            window.location.href = json.redirect;
                        }
                        else {
                            if (code == '0') {//登录数据库验证,登录失败显示
                                $('.sysError').show().find('em').html(json.msg);
                            }
                            if (code == '-1') {//验证码错误显示
                                $("#login-captcha").css('display', 'block');
                                exports.error(json.msg, $("#captcha-login"),$("#loginBtn"));
                            }

                            if ($("#login-captcha").css('display') == 'block') {
                                $("#captchalogin").click();
                            }

                            $("#loginBtn").val('登录').prop("disabled", false);
                            return false;
                        }
                    }
                })
            });

            document.onkeydown = function (e) {
                var ev = document.all ? window.event : e;
                if (ev.keyCode == 13) {
                    $.each($(".formLogin"), function () {
                        if ($(this).css('display') != 'none') {
                            $(this).find('.loginBtn').click();
                        }
                    })
                }
            }
        });
    }

    exports.error =  function(msg, selector,formBtn) {
        selector.parent().find('.errorTips').find('em').html(msg)
        selector.parent().find('.errorTips').fadeIn();
        formBtn.prop('disabled', false);
    }

    exports.success =  function(selector) {
        selector.parent().find('.errorTips').find('em').html('')
        selector.parent().find('.errorTips').fadeOut();

    }
    exports.price = function (el) {
        require('echarts');
        $.get('/tool/common/price',{r:Math.random()},function(json){

            if(json.code==1)
            exports.renderEchart('gold-price-charts',json.title,json.subtitle,json.time,json.price);
        },'json')

    }

    exports.renderEchart = function (el,title,subtext,dataType,valType){
        var myChart = echarts.init(document.getElementById(el))
        var option = {
            title : {
                text:title,// '黄金价格走势图',
                subtext:subtext,
                textStyle:{
                    fontSize: 20,
                    //color: '#79654e'
                },
                //itemGap:,
                subtextStyle:{
                    color: '#79654e'
                }
            },
            grid:{
                x:50,
                y:60,
                x2:30,
                y2:30
            },
            tooltip : {
                trigger: 'axis',
                formatter: "{c} 元/克 <br/>"+"{b}",
                enterable:true,
                borderColor:'FF8800',
                borderWidth:2,
                axisPointer:{
                    type: 'line',
                    lineStyle: {
                        color: '#48b',
                        width: 1,
                        type: 'dashed',
                        shadowBlur:0.1
                    }
                }
            },
            toolbox: {
                show : true
            },

            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : dataType,
//				            timeline:{
//						    	controlPosition:'left',
//						        splitLine:false,
//						        splitArea:true,
//						    },
                    splitLine:false,
                    splitArea:true,
                    axisLabel : {
                        show : true,

                    },
                    axisLine :{
                        lineStyle:{
                            width: 0,
                            type: 'solid'
                        }
                    }

                }
            ],
            yAxis : [
                {
                    type : 'value',
                    scale: true,
                    precision:2,
                    axisLine:{
                        show:true
                    }
                }
            ],
            lineStyle:{
                shadowBlur:0
            },
            series : [
                {
                    type:'line',
                    symbolSize:0,
                    data:valType,
                    showAllSymbol:false,
                    itemStyle:{
                        normal:{
                            lineStyle:{
                                //color:'#FF8800',
                                width:0.5
                            }
                        }
                    },
                },
            ]
        };
        // 为echarts对象加载数据
        myChart.setOption(option);
    }
});
