/**
 * Created by Administrator on 2016/8/8 0008.
 */
window.UEDITOR_HOME_URL = "/public/lib/ueditor/";
define(function(require,exports,modules){
    require('datatables')
    require('datatables.bs')
    $('#project-list').DataTable({
        "language": {
            "url": "/public/lib/datatables/Chinese.json"
        },
        "processing": true,
        "serverSide": true,
        "ajax": {
            url:'/project/investing/index',
            data:{list:1},
            type:'get'
        },
        "columns": [
            {
                "data-entry":          'details-control',
                "data":"status"
            },

            { "data": "sn" },
            { "data": "realname" },
            { "data": "price" },
            { "data": "weight" },
            { "data": "period" },
            { "data": "amount" },
            { "data": "addtime" },
            { "data": "operation" }
        ],
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": false
    });

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
                        btn: ['保存', '取消'],
                        content: json.msg ,
                        yes: function(index, layero){
                            $('#form-investing').submit();
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