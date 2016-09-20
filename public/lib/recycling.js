/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * DateTime: 2016/8/30 0030 9:06
 *
 */

define(function(require,exports,modules){
    require('datatables')
    require('datatables.bs');
    require('jqueryui');
    exports.render_list = function() {

        $(function () {
            $('#project-list').DataTable({
                "language": {
                    "url": "/public/lib/datatables/Chinese.json"
                },
                "processing": true,
                "serverSide": true,
                "ajax": {
                    url: '/project/recycling/index',
                    data: {list: 1},
                    dataSrc: function (json) {
                        return json.data
                    },
                    type: 'get'
                },
                "columns": [
                    {
                        "data": "status",
                        "name": "status"
                    },
                    {"data": "sn", "name": "p.project_sn"},
                    {"data": "customer", "name": "c.realname"},
                    {"data": "gold", "name": "p.type"},
                    {"data": "payment", "name": "p.payment"},
                    {"data": "period", "name": "p.month"},
                    {"data": "origin", "name": "p.origin_weight"},
                    {"data": "weight", "name": "p.weight"},
                    {"data": "referrer", "name": "referrer"},
                    {"data": "operator", "name": "operator"},
                    {"data": "lasttime", "name": "p.lasttime"},
                    {"data": "operation"}
                ],
            })
        });
    }

    exports.render_booking = function(){
        $('#btn-new').bind('click',function() {
            require('layer');
            require('ajaxSubmit');
            require('jqueryvalidate');
            require('customValidate');
            require('ajaxUpload');
            $.get('/project/recycling/booked', {r:Math.random()}, function (json) {
                if (json.code == 1) {
                    layer.open({
                        type: 1,
                        title: json.title,
                        area:['880px','590px'],
                        offset: '100px',
                        zIndex: 99,
                        btn: ['保存', '取消'],
                        content: json.msg,
                        yes: function (index, layero) {
                            $('#form-booking').submit();
                        }
                    });
                } else {
                    var l = require('layout');
                    l.render_message(json.msg, json.title);
                }

            }, 'json');
        });
    }

    exports.render_update = function(){
        $('#project-list').delegate('.btn-update','click', function () {
            require('layer');
            require('ajaxSubmit');
            require('jqueryvalidate');
            require('customValidate');
            require('ajaxUpload');
            var sn = $(this).parent().parent().attr('id');
            $.get('/project/recycling/update', {project: sn}, function (json) {
                if (json.code == 1) {
                    var options = {
                        type: 1,
                        title: json.title,
                        area:['880px','590px'],
                        offset: '100px',
                        zIndex: 99,
                        content: json.msg,
                        end: function () {
                            $.get('/project/recycling/reset_locker',{project_sn:sn})
                        }
                    };
                    if(json.editable) {
                        options.btn = ['保存', '取消'];
                        options.yes = function (index, layero) {
                            $('#form-update').submit();
                        };
                    }else if(json.unlock){
                        options.btn = ['解锁', '取消'];
                        options.yes = function (index, layero) {
                            $.get('/project/recycling/reset_locker',{project_sn:sn,locker:1},function(json){
                                if(json.reset==1){
                                    location.reload();
                                }
                            },'json')
                        };
                    }else{
                        options.btn = ['关闭'];
                    }
                    layer.open(options);
                } else {
                    var l = require('layout');
                    l.render_message(json.msg, json.title);
                }

            }, 'json');
        });
    }

    exports.render_checking = function()
    {
        $('#project-list').delegate('.btn-checking','click', function () {
            require('layer');
            require('ajaxSubmit');
            require('jqueryvalidate');
            require('customValidate');
            var sn = $(this).parent().parent().attr('id');
            $.get('/project/recycling/checked', {project:sn}, function(json){
                if(json.code==1){
                    var options = {
                        type: 1,
                        title:json.title,
                        area:['880px','590px'],
                        offset: '100px',
                        zIndex:99,
                        content: json.msg ,
                        end: function () {
                            $.get('/project/recycling/reset_locker',{project_sn:sn})
                        }
                    }
                    if(json.editable){
                        options.btn = ['核实', '驳回'];
                        options.yes = function(index, layero){
                            $('#form-checking').submit();
                        };
                        options.btn2 = function(index, layero){
                            exports.do_cancle(sn,'/project/recycling/refused','请填写驳回原因 项目: '+sn);
                            return false
                        }
                    }else if(json.unlock){
                        options.btn = ['解锁', '关闭'];
                        options.yes = function (index, layero) {
                            $.get('/project/recycling/reset_locker',{project_sn:sn,locker:1},function(json){
                                if(json.reset==1){
                                    location.reload();
                                }
                            },'json')
                        };
                    }else{
                        options.btn = [ '关闭'];
                    }
                    layer.open(options);
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        })
    }

    exports.render_confirming = function (){
        $('#project-list').delegate('.btn-confirming','click', function () {
            require('layer');
            require('ajaxSubmit');
            require('jqueryvalidate');
            require('customValidate');
            var sn = $(this).parent().parent().attr('id');
            $.get('/project/recycling/confirmed', {project:sn}, function(json){
                if(json.code==1){
                    var options = {
                        type: 1,
                        title:json.title,
                        area:['880px','590px'],
                        offset: '100px',
                        zIndex:99,
                        content: json.msg ,
                        end: function () {
                            $.get('/project/recycling/reset_locker',{project_sn:sn})
                        }
                    }
                    if(json.editable){
                        options.btn = ['确认标记', '关闭'];
                        options.yes = function(index, layero){
                            $('#form-confirming').submit();
                        };
                    }else if(json.unlock){
                        options.btn = ['解锁', '关闭'];
                        options.yes = function (index, layero) {
                            $.get('/project/recycling/reset_locker',{project_sn:sn,locker:1},function(json){
                                if(json.reset==1){
                                    location.reload();
                                }
                            },'json')
                        };
                    }else{
                        options.btn = [ '关闭'];
                    }
                    layer.open(options);
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        });
    };

    exports.render_detail = function (){
        $('#project-list').delegate('.btn-detail','click', function () {
            require('layer');
            require('ajaxSubmit');
            require('jqueryvalidate');
            require('customValidate');
            var sn = $(this).parent().parent().attr('id');
            $.get('/project/recycling/detail', {project:sn}, function(json){
                if(json.code==1){
                    var options = {
                        type: 1,
                        title:json.title,
                        area:['880px','590px'],
                        offset: '100px',
                        zIndex:99,
                        content: json.msg ,
                        end: function () {
                            $.get('/project/recycling/reset_locker',{project_sn:sn})
                        }
                    }
                    options.btn = [ '关闭'];

                    if(json.terminable){
                        options.btn = ['终止项目', '关闭'];
                        options.yes = function (index, layero) {
                            exports.do_cancle(sn,'/project/recycling/terminated','填写终止原因 '+sn);
                        };
                    }
                    if(json.print!=false){
                        options.btn = ['打印协议', '关闭'];
                        options.yes = function (index, layero) {
                            location.href=json.print;
                        };
                    }
                    layer.open(options);
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        });
    };
    exports.render_cancle = function(){
        $('#project-list').delegate('.btn-refused','click',function(){
            var sn = $(this).parent().parent().attr('id');
            exports.do_cancle(sn,'/project/recycling/refused','填写驳回原因 '+sn);
        });

    }

    exports.do_cancle = function (sn,url,title) {
        require('layer');
        layer.prompt({
            formType: 2,
            title: title
        }, function(value, index, elem){
            if(value.length >= 10) {
                $.ajax({
                    type: 'post',
                    url: url,
                    data: {project_sn: sn, value: value},
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
})