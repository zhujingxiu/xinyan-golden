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

    exports.render_appling = function(){
        $('#btn-new').bind('click',function() {
            require('layer');
            require('ajaxSubmit');

            require('ueditor/ueditor.config');
            require('ueditor');
            require('jqueryvalidate');
            require('customValidate');

            $.get('/project/investing/applied', {project: false}, function (json) {
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
                            $('#form-appling').submit();
                            $(this).addClass('disabled').text('正在提交...');
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
            require('ueditor/ueditor.config');
            require('ueditor');
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
                            $(this).addClass('disabled').text('正在提交...');
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
            require('ueditor/ueditor.config');
            require('ueditor');
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
                        btn: ['通过', '驳回'],
                        content: json.msg ,
                        yes: function(index, layero){
                            $('#form-checking').submit();
                            $(this).addClass('disabled').text('正在提交...');
                        },
                        btn2 : function(index, layero){
                            exports.do_cancle(sn,'/project/investing/refused','请填写驳回原因 项目: '+sn);
                            console.log(layero);
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
            require('ueditor/ueditor.config');
            require('ueditor');
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
                            $(this).addClass('disabled').text('正在提交...');
                        }
                    });
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        })
    }

    exports.render_cancle = function(){
        $('#project-list').delegate('.btn-refused','click',function(){
            var sn = $(this).parent().parent().attr('id');
            exports.do_cancle(sn,'/project/investing/refused','请填写驳回原因 项目: '+sn);
        });
        $('#project-list').delegate('.btn-terminated','click',function(){
            var sn = $(this).parent().parent().attr('id');
            exports.do_cancle(sn,'/project/investing/terminated','请填写终止原因 项目: '+sn);
        });
    }

    exports.do_cancle = function (sn,url,title) {
        require('layer');
        layer.prompt({
            formType: 2,
            value: '',
            title: title,
            minlength:10,
        }, function(value, index, elem){
            $.ajax({
                type:'post',
                url:url,
                data:{project_sn:sn,value:value},
                dataType:'json',
                beforeSubmit:function(){
                    $(elem).addClass('disabled').text('正在提交...');
                },
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