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
                    {"data": "group", "name": "group_name"},
                    {"data": "customer", "name": "c.realname"},
                    {"data": "phone", "name": "c.phone"},
                    {"data": "idnumber", "name": "c.idnumber"},
                    {"data": "referrer", "name": "referrer"},
                    {"data": "status_text", "name": "c.status"},
                    {"data": "totals"},
                    {"data": "available", "name": "available"},
                    {"data": "frozen", "name": "frozen"},
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
                area:'880px',
                offset: '100px',
                zIndex:99,
                btn: ['保存', '取消'],
                content: json.msg ,//注意，如果str是object，那么需要字符拼接。
                yes: function(index, layero){
                    $('#form-customer').submit();
                }
            });
        },'json');
    }
    exports.render_appling = function () {

        $('#list').delegate('.btn-appling','click', function (e) {
            require('layer');
            require('ajaxSubmit');
            require('jqueryvalidate');
            require('customValidate');
            var id = $(this).parent().parent().attr('id');
            exports.appling_dialog(id);
            //load_index = layer.confirm('申请提金或消费?', {
            //    icon: 3,
            //    btn: ['提金','消费'] //按钮
            //}, function(){
            //    layer.close(load_index);
            //    exports.appling_dialog(id);
            //}, function(){
            //    layer.close(load_index);
            //    exports.order_dialog(id);
            //});
        });
    }
    exports.appling_dialog = function(id){
        $.ajax({
            url:'/project/customer/applied',
            data:{customer:id},
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
    }
    exports.order_dialog = function (id) {
        $.ajax({
            url:'/project/customer/order',
            data:{customer:id},
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
            }
        });
    }
    exports.render_taking = function () {
        $('#list').delegate('.btn-taking','click', function () {
            require('layer');
            require('ajaxSubmit');
            require('jqueryvalidate');
            require('customValidate');
            require('ajaxUpload');
            var id = $(this).parent().parent().attr('id');
            $.get('/project/customer/taken', {customer_id:id}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:['880px','600px'],
                        scrollbar:true,
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

});