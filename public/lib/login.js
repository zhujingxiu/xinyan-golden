define(function(require, exports, module) {
    require('ajaxSubmit');
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
                exports.error('请输入正确格式的用户名!', $("#identity"));
                return false;
            }
            else if (userpass.length < 6) {
                exports.error('请输入正确格式的密码!', $("#password"));
                return false;
            }
            else if ($(".loginListCode").css('display') == 'block' && captcha == '') {
                exports.error('请输入正确的验证码', $("#captcha"));
                return false;
            }

            $("#login_form").ajaxSubmit({
                dataType:'json',
                success: function (obj) {
                    var code = obj.code;
                    //当用户登录错误且次数超过3次,显示验证码
                    if (code != '1' && $(".loginListCode").css('display') == 'none' && obj.errcount > 2) {
                        $(".loginListCode").css('display', 'block');
                    }
                    if (code == '1') {
                        window.location.href = obj.redirect;
                    }
                    else {
                        if (code == '-1') {//登录数据库验证,登录失败显示
                            $('.sysError').show().find('em').html(obj.msg);
                        } else if (code == '-4') {//未激活状态显示
                            if (!isEmail(obj.email)) {
                                var info = '账户未激活且未绑定邮箱,' + '<a href="http://crm2.qq.com/page/portalpage/wpa.php?uin=800076065&f=1&ty=1&aty=0&a=&from=6" target="_blank">联系客服</a>';
                            }
                            else {
                                var info = obj.info + '或&nbsp;<a id="resendEmail" href="javascript:;" identity="' + obj.identity + '" email="' + obj.email + '">重新发送邮件</a>';
                            }
                            $('.sysError').show().find('em').html(info);
                        } else if (code == '-6') {//验证码错误显示
                            $(".loginListCode").css('display', 'block');
                            exports.error(obj.info, $("#captcha"));
                        } else if (code == '-3') {//验证码错误显示
                            exports.error(obj.info, $("#identity"));
                        } else {
                            var errcount = obj.errcount;
                            if (errcount > 2) {
                                $(".loginListCode").css('display', 'block');
                            }
                            $('.sysError').show().find('em').html(obj.info);
                        }

                        if ($(".loginListCode").css('display') == 'block') {
                            $("#captchaimg").click();
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
                $("#loginBtn").click();
            }
        }
    });

    exports.error =  function(msg, selector) {
        selector.parent().find('.errorTips').find('em').html(msg)
        selector.parent().find('.errorTips').fadeIn();
        $("#loginBtn").val('登录').prop('disabled', false);
    }
    exports.price = function (el) {
        require('echarts');
        $.get('/auth/login/tmp',{r:Math.random()},function(json){

        //    //console.log(json);
        //    console.log($(el));
        //    $(el).append('ok');
        //    if(json.code==1){
        //        $(el).html(json.code);
        //
        //    }
            exports.renderEchart('gold-price-charts','今日黄金价格走势图',eval("["+json.data+"]"),eval("["+json.val+"]"));
        },'json')

    }

    exports.renderEchart = function (el,title,dataType,valType){
        var myChart = echarts.init(document.getElementById(el))
        var option = {
            title : {
                text:title,// '黄金价格走势图',
                textStyle:{
                    fontSize: 20,
                    //color: '#79654e'
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
