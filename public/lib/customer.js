/**
 * Created by zhujingxiu on 2016/8/31 0031 9:38.
 */
define(function (require, exports, modules) {
    require('datatables')
    require('datatables.bs');
    require('jqueryui');
    var load_index = '';
    exports.render_list = function() {
        require('sparkline');
        $(function () {
            $('#list').DataTable({
                "language": {
                    "url": "/public/lib/datatables/Chinese.json"
                },
                "processing": true,
                "serverSide": true,
                "ajax": {
                    url: '/project/customer/index',
                    data: {list: 1},
                    dataSrc: function (json) {
                        return json.data
                    },
                    type: 'get'
                },
                "columns": [
                    {"data": "addtime", "name": "c.addtime"},
                    {"data": "referrer", "name": "referrer"},
                    {"data": "status_text", "name": "c.status"},
                    {"data": "customer", "name": "c.realname"},
                    {"data": "card_number", "name": "c.card_number"},
                    {"data": "phone", "name": "c.phone"},
                    {"data": "totals","name":"totals"},
                    {"data": "frozen", "name": "frozen"},
                    {"data": "available", "name": "available"},
                    {"data": "operation"}
                ],
            });
        });
    }

    exports.render_detail = function () {
        $('#btn-new').bind('click',function(){
            exports.do_detail(false);
        })

        $('#list').delegate('.btn-detail','click',function(){
            exports.do_detail($(this).parent().parent().parent().attr('id'));
        })
    }

    exports.detected_card = function(){
        var card_serial = '';
        if (ICCardReader.Open()) {
            card_serial = ICCardReader.Request();
            if (card_serial.length != 8) {
                ICCardReader.Beep();
                alert('没有检测到磁卡，请重试！');
                return false;
            }
        } else {
            alert("请确认当前浏览器为IE8+系列，并且安装了YW60x读写器控件。若未安装，请点击确定下载");
            window.navigate("http://www.youwokeji.com.cn/yw60xocxSetup.exe");
            return false;
        }
        return card_serial;
    }

    exports.do_detail = function(cid){
        require('layer');
        require('ajaxSubmit');
        require('jqueryvalidate');
        require('customValidate');
        $.get('/project/customer/update', {customer_id:cid}, function(json){
            var options = {
                type: 1,
                title:json.title,
                area:'880px',
                offset: '100px',
                zIndex:99,
                btn: ['关闭'],
                content: json.msg ,//注意，如果str是object，那么需要字符拼接。

            };
            if(json.modify){
                options.btn = ['保存', '关闭'];
                if(json.free){
                    options.btn = ['保存', '关闭','赠金'];
                }
                options.yes = function(index, layero){
                    $('#form-customer').submit();
                }
                if(json.free){
                    options.btn3 = function(index, layero){
                        layer.open({
                            type: 1,
                            title: '赠送客户黄金克重',
                            area:'520px',
                            offset: '100px',
                            zIndex:199,
                            content:json.free_form,
                            btn : ['确定赠送', '取消'],
                            yes:function( index, layero){
                                $('#form-free').submit();
                            }
                        });
                    }
                }
            }
            layer.open(options);
        },'json');
    }

    //taking and order
    exports.render_appling = function () {

        $('#list').delegate('.btn-appling','click', function (e) {
            var card_serial = exports.detected_card();
            if(card_serial==false){
                return false;
            }
            require('layer');
            require('ajaxSubmit');
            require('jqueryvalidate');
            require('customValidate');
            require('ajaxUpload');
            var id = $(this).parent().parent().parent().attr('id');
            var mode = $(this).data('mode');
            $.ajax({
                url:'/project/customer/'+mode,
                data:{customer:id,card_serial:card_serial},
                dataType:'json',
                beforeSend:function () {
                    load_index = layer.load();
                },
                success:function(json){
                    layer.close(load_index);
                    if(json.code==1){
                        layer.open({
                            type: 1,
                            title:json.title,
                            area:['880px','600px'],
                            scrollbar:true,
                            offset: '100px',
                            zIndex:99,
                            btn: ['确认申请', '取消'],
                            content: json.msg ,
                            yes: function(index, layero){
                                $('#form-appling').submit();
                            }
                        });
                    }else{
                        var l = require('layout');
                        l.render_message(json.msg,json.title);
                    }
                }
            });
        });
    }

    exports.render_renew = function () {

        $('#list').delegate('.btn-appling-renew','click', function (e) {

            //exports.detected_card();
            //var card_serial = ICCardReader.Request();//'sadsadsa';//
            var card_serial = exports.detected_card();
            if(card_serial==false){
                return false;
            }
            require('layer');
            require('ajaxSubmit');
            require('jqueryvalidate');
            require('customValidate');
            require('ajaxUpload');
            var id = $(this).parent().parent().parent().attr('id');

            $.ajax({
                url: '/project/customer/renew',
                data: {customer: id, card_serial: card_serial},
                dataType: 'json',
                beforeSend: function () {
                    load_index = layer.load();
                },
                success: function (json) {
                    layer.close(load_index);
                    if (json.code == 1) {
                        layer.open({
                            type: 1,
                            title: json.title,
                            area: ['880px', '620px'],
                            scrollbar: true,
                            offset: '100px',
                            zIndex: 99,
                            btn: ['确认续存', '取消'],
                            content: json.msg,
                            yes: function (index, layero) {
                                $('#form-renew').submit();
                            }
                        });
                    } else {
                        var l = require('layout');
                        l.render_message(json.msg, json.title);
                    }
                }
            });
        });
    }

    exports.render_cancle = function(){
        $('#list').delegate('.btn-cancle','click',function(){
            var id = $(this).parent().parent().parent().attr('id');
            var mode = $(this).data('mode');
            require('layer');
            layer.prompt({
                formType: 2,
                title: '填写取消申请原因'
            }, function(value, index, elem){
                if(value.length >= 8) {
                    $.ajax({
                        type: 'post',
                        url: '/project/customer/cancle',
                        data: {customer_id: id, value: value,mode:mode},
                        dataType: 'json',
                        beforeSubmit: function () {
                            layer.load();
                        },
                        success: function (json) {
                            if (json.code == 1) {
                                location.reload();
                            } else {
                                var l = require('layout');
                                l.render_message(json.msg, json.title);
                            }
                        }
                    })
                }else{
                    layer.tips('内容长度不小于8个字符', elem,{tips: 1});
                }
            });

        });
    }

    exports.render_project = function () {
        $('#list').delegate('.btn-project','click', function () {
            require('layer');
            var id = $(this).parent().parent().attr('id');
            $.get('/project/customer/projects', {customer:id}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:['880px','600px'],
                        scrollbar:true,
                        offset: '100px',
                        zIndex:99,
                        btn: ['关闭', '取消'],
                        content: json.msg ,

                    });
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        });
    }
    exports.render_bind = function(){
        $('#list').delegate('.btn-bind','click', function () {

            var card_serial = exports.detected_card();
            if(card_serial==false){
                return false;
            }
            require('layer');
            require('ajaxSubmit');
            require('jqueryvalidate');
            require('customValidate');
            var id = $(this).parent().parent().attr('id');
            $.get('/project/customer/bind', {customer:id,card_serial:card_serial}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'600px',
                        scrollbar:true,
                        offset: '100px',
                        zIndex:99,
                        btn: ['确认绑定', '取消'],
                        content: json.msg ,
                        yes: function(index, layero){
                            $('#form-bind').submit();
                        }
                    });
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        });
    }
    exports.render_unbind = function() {
        $('#list').delegate('.btn-unbind', 'click', function () {
            require('layer');
            var id = $(this).parent().parent().attr('id');
            layer.confirm('确认解绑吗', {icon: 3, title:'提示'}, function(index){
                $.ajax({
                    type: 'post',
                    url: '/project/customer/unbind',
                    data: {customer_id: id},
                    dataType: 'json',
                    beforeSubmit: function () {
                        layer.load();
                    },
                    success: function (json) {
                        if (json.code == 1) {
                            location.reload();
                        } else {
                            var l = require('layout');
                            l.render_message(json.msg, json.title);
                        }
                    }
                })
            });
        });
    }
});