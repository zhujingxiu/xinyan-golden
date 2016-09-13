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
                success: function (json) {
                    var code = json.code;
                    //当用户登录错误且次数超过3次,显示验证码
                    if (code != '1' && $(".loginListCode").css('display') == 'none' && json.errcount > 2) {
                        $(".loginListCode").css('display', 'block');
                    }
                    if (code == '1') {
                        window.location.href = json.redirect;
                    }
                    else {
                        if (code == '0') {//登录数据库验证,登录失败显示
                            $('.sysError').show().find('em').html(json.msg);

                        }
                        if(code == '-1'){//验证码错误显示
                            $(".loginListCode").css('display','block');
                            exports.error(json.msg,$("#captcha"));
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
        $.get('/auth/login/price',{r:Math.random()},function(json){

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
