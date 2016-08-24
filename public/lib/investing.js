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
                        "data-entry": 'details-control',
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

            $.get('/project/investing/checked', {project:$(this).parent().parent().attr('id')}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'880px',
                        offset: '100px',
                        zIndex:99,
                        btn: ['通过', '拒绝'],
                        content: json.msg ,
                        yes: function(index, layero){
                            $('#form-checking').submit();
                            $(this).addClass('disabled').text('正在提交...');
                        },
                        btn2 : function(index, layero){
                            alert(index);
                        }
                    });
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        })

    }
})