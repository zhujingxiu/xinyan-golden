/**
 * Created by Administrator on 2016/8/8 0008.
 */
window.UEDITOR_HOME_URL = "/public/lib/ueditor/";
define(function(require,exports,modules){
    require('datatables')
    require('datatables.bs');
    exports.render_list = function() {

        $(function () {
            $('#list').DataTable({
                "language": {
                    "url": "/public/lib/datatables/Chinese.json"
                },
                "processing": true,
                "serverSide": true,
                "ajax": {
                    url: '/project/trash/index',
                    data: {list: 1},
                    dataSrc: function (json) {
                        return json.data
                    },
                    type: 'get'
                },
                "columns": [
                    {"data": "mode", "name": "p.mode"},
                    {"data": "sn", "name": "p.project_sn"},
                    {"data": "customer", "name": "p.realname"},
                    {"data": "gold", "name": "p.price"},
                    {"data": "operator", "name": "operator"},
                    {"data": "addtime", "name": "p.addtime"},
                    {"data": "operation"}
                ],
            })
        });
    }



    exports.render_cancle = function(){

        $('#project-list').delegate('.btn-terminated','click',function(){
            var sn = $(this).parent().parent().attr('id');
            exports.do_cancle(sn,'/project/investing/terminated','填写终止原因 '+sn);
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
    exports.render_remove = function(){
        $('#list').delegate('.btn-trashed','click',function(){
            var id = $(this).parent().parent().attr('id')
            require('layer');
            layer.confirm('确定删除项目', {icon: 3, title:'删除'}, function(index){
                $.ajax({
                    type:'post',
                    url:'/project/trash/remove',
                    data:{trash_id:id},
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