/**
 * Created by zhujingxiu on 2016/8/31 0031 9:38.
 */
define(function (require, exports, modules) {
    require('datatables')
    require('datatables.bs');
    require('jqueryui');
    exports.render_list = function() {
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
                    {"data": "available", "name": "available"},
                    {"data": "frozen", "name": "frozen"},
                    {"data": "customer", "name": "c.realname"},
                    {"data": "phone", "name": "c.phone"},
                    {"data": "idnumber", "name": "c.idnumber"},
                    {"data": "wechatqq", "name": "c.wechat"},
                    {"data": "referrer", "name": "referrer"},
                    {"data": "operator", "name": "operator"},
                    {"data": "lasttime", "name": "c.lasttime"},
                    {"data": "status_text", "name": "c.status"},
                    {"data": "operation"}
                ],
            })
        });
    }

    exports.render_detail = function () {
        $('#btn-new').bind('click',function(){
            exports.do_detail(false);
        })

        $('#list').delegate('.btn-update','click',function(){
            exports.do_detail($(this).parent().parent().attr('id'));
        })
    }

    exports.do_detail = function(cid){
        require('layer');
        require('ajaxSubmit');

        require('jqueryvalidate');
        require('customValidate');
        $.get('/project/customer/update', {customer_id:cid}, function(json){
            layer.open({
                type: 1,
                title:json.title,
                area:'800px',
                offset: '100px',
                zIndex:99,
                btn: ['保存', '取消'],
                content: json.html ,//注意，如果str是object，那么需要字符拼接。
                yes: function(index, layero){
                    $('#form-customer').submit();
                }
            });
        },'json');
    }
    exports.render_appling = function () {
        $('#list').delegate('.btn-appling','click', function () {
            require('layer');
            require('ajaxSubmit');
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');
            require('slimscroll');
            var id = $(this).parent().parent().attr('id');
            $.get('/project/customer/applied', {customer:id}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'880px',
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
            },'json');
        });
    }

    exports.render_order = function () {
        $('#list').delegate('.btn-order','click', function () {
            require('layer');
            require('ajaxSubmit');
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');
            require('slimscroll');
            var id = $(this).parent().parent().attr('id');
            $.get('/project/customer/order', {customer:id}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'880px',
                        offset: '100px',
                        zIndex:99,
                        btn: ['确认消费', '取消'],
                        content: json.msg ,
                        yes: function(index, layero){
                            $('#form-order').submit();
                        }
                    });
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        });
    }
    exports.render_taking = function () {
        $('#list').delegate('.btn-taking','click', function () {
            require('layer');
            require('ajaxSubmit');
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');
            require('slimscroll');
            require('ajaxUpload');
            var id = $(this).parent().parent().attr('id');
            $.get('/project/customer/taken', {customer_id:id}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'880px',
                        offset: '100px',
                        zIndex:99,
                        btn: ['出库', '取消'],
                        content: json.msg ,
                        yes: function(index, layero){
                            $('#form-taking').submit();
                        }
                    });
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        });
    }
    exports.render_cancle = function(){

        $('#list').delegate('.btn-cancle','click',function(){
            var id = $(this).parent().parent().attr('id');
            exports.do_cancle(id,'/project/customer/cancle','填写取消提金申请原因 ');
        });

    }

    exports.do_cancle = function (id,url,title) {
        require('layer');
        layer.prompt({
            formType: 2,
            title: title
        }, function(value, index, elem){
            if(value.length >= 10) {
                $.ajax({
                    type: 'post',
                    url: url,
                    data: {customer_id: id, value: value},
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
                layer.tips('内容长度不小于10个字符', elem,{tips: 1});
            }

        });
    }

    exports.render_project = function () {
        $('#list').delegate('.btn-frozen','click', function () {
            require('layer');
            require('slimscroll');
            var id = $(this).parent().parent().attr('id');
            $.get('/project/customer/project', {customer:id}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'880px',
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

    exports.render_taking_bk = function () {
        $('#project-list').delegate('.btn-taking','click', function () {
            require('layer');
            require('ajaxSubmit');
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');
            require('slimscroll');
            require('ajaxUpload');
            var sn = $(this).parent().parent().attr('id');
            $.get('/project/recycling/taken', {project:sn}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'880px',
                        offset: '100px',
                        zIndex:99,
                        btn: ['出库', '取消'],
                        content: json.msg ,
                        yes: function(index, layero){
                            $('#form-taking').submit();
                        }
                    });
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        });
    }
});