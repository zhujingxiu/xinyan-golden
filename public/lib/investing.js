/**
 * Created by Administrator on 2016/8/8 0008.
 */
window.UEDITOR_HOME_URL = "/public/lib/ueditor/";
define(function(require,exports,modules){

    exports.render_list = function() {
        require('datatables')
        require('datatables.bs');
        $(function () {
            $('#project-list').DataTable({
                "language": {
                    "url": "/public/lib/datatables/Chinese.json"
                },
                "processing": true,
                "serverSide": true,
                "ajax": {
                    url: '/project/investing/index',
                    data: {draw: 1},
                    type: 'get'
                },
                "columns": [
                    {
                        "data-class": 'details-control',
                        "data": "status",
                        "name": "status"
                    },
                    {"data": "sn", "name": "p.project_sn"},
                    {"data": "realname", "name": "p.realname"},
                    {"data": "price", "name": "p.price"},
                    {"data": "weight", "name": "p.weight"},
                    {"data": "period", "name": "p.period"},
                    {"data": "amount", "name": "p.amount"},
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
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');

            $.get('/project/investing/booked', {project: false}, function (json) {
                if (json.code == 1) {
                    layer.open({
                        type: 1,
                        title: json.title,
                        area: '880px',
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
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');
            $.get('/project/investing/update', {project: $(this).parent().parent().attr('id')}, function (json) {
                if (json.code == 1) {
                    layer.open({
                        type: 1,
                        title: json.title,
                        area: '880px',
                        offset: '100px',
                        zIndex: 99,
                        btn: ['保存', '取消'],
                        content: json.msg,
                        yes: function (index, layero) {
                            $('#form-update').submit();
                        }
                    });
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
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');
            require('slimscroll');
            var sn = $(this).parent().parent().attr('id');
            $.get('/project/investing/checked', {project:sn}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'880px',
                        offset: '100px',
                        zIndex:99,
                        btn: ['核实', '驳回'],
                        content: json.msg ,
                        yes: function(index, layero){
                            $('#form-checking').submit();
                        },
                        btn2 : function(index, layero){
                            exports.do_cancle(sn,'/project/investing/refused','请填写驳回原因 项目: '+sn);

                            return false
                        }
                    });
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
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');
            require('slimscroll');
            var sn = $(this).parent().parent().attr('id');
            $.get('/project/investing/confirmed', {project:sn}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'880px',
                        offset: '100px',
                        zIndex:99,
                        btn: ['确认标记', '取消'],
                        content: json.msg ,
                        yes: function(index, layero){
                            $('#form-confirming').submit();
                        }
                    });
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        });
    };

    exports.render_appling = function () {
        $('#project-list').delegate('.btn-appling','click', function () {
            require('layer');
            require('ajaxSubmit');
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');
            require('slimscroll');
            var sn = $(this).parent().parent().attr('id');
            $.get('/project/investing/applied', {project:sn}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'880px',
                        offset: '100px',
                        zIndex:99,
                        btn: ['确认标记', '取消'],
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

    exports.render_cancle = function(){
        $('#project-list').delegate('.btn-refused','click',function(){
            var sn = $(this).parent().parent().attr('id');
            exports.do_cancle(sn,'/project/investing/refused','请填写驳回原因 '+sn);
        });
        $('#project-list').delegate('.btn-terminated','click',function(){
            var sn = $(this).parent().parent().attr('id');
            exports.do_cancle(sn,'/project/investing/terminated','请填写终止原因 '+sn);
        });
    }

    exports.do_cancle = function (sn,url,title) {
        require('layer');
        layer.prompt({
            formType: 2,
            placeholder: '内容必须包含该项目的编号',
            title: title
        }, function(value, index, elem){
            if(value.length >= 10) {
                $.ajax({
                    type: 'post',
                    url: url,
                    data: {project_sn: sn, value: value},
                    dataType: 'json',
                    beforeSubmit: function () {
                        layer.load(1);
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
    exports.render_hidden = function(){
        $('#project-list').delegate('.btn-trashed','click',function(){
            var sn = $(this).parent().parent().attr('id')
            require('layer');
            layer.confirm('确定删除项目'+sn, {icon: 3, title:'删除'}, function(index){
                $.ajax({
                    type:'post',
                    url:'/project/investing/trashed',
                    data:{project_sn:sn},
                    dataType:'json',
                    success:function(json){
                        if(json.code==1){
                            location.reload();
                        }else{
                            var l = require('layout');
                            l.render_message(json.msg,json.title);
                        }
                    }
                })
            });
        });
    }


})