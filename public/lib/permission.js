/**
 * Created by zhujingxiu on 2016/8/10 0010.
 */
define(function (require,exports,modules) {

    require('jstree');
    // Highlight selected row
    $(function () {
        // 6 create an instance when the DOM is ready
        $('#node-tree').jstree({
            'core' : {
                'data' : {
                    "url" : "/auth/permission/index",
                    "data":'auth=1',
                    "dataType" : "json" // needed only if you do not supply JSON headers
                }
            },
            'plugins' : ['state','dnd' , 'contextmenu' ],
            'contextmenu' : {
                'items' : {
                    'create' : {
                        "separator_before": false,
                        "separator_after": true,
                        "label": "新增",
                        "_disabled": function (node) {
                            var inst = $.jstree.reference(node.reference),
                                obj = inst.get_node(node.reference);

                            return obj.li_attr.level > 2;
                        },
                        "action"  : function(node){
                            var inst = $.jstree.reference(node.reference),
                                obj = inst.get_node(node.reference);
                                //console.log(obj.original);
                            exports.render_detail(obj.li_attr,'create');
                        }
                    },
                    'rename' :false,
                    'remove' : {
                        "separator_before": false,
                        "separator_after": true,
                        "label": "移除",
                        "action": function (node) {
                            var inst = $.jstree.reference(node.reference),
                                obj = inst.get_node(node.reference);
                            if(confirm("确定要删除此菜单？删除后不可恢复。")){
                                $.get("/auth/permission/delete",{node_id:obj.id},function(json){
                                    if(json.code == 1){
                                        $("#node-tree").jstree("refresh");
                                    }else{
                                        alert("删除菜单失败！");
                                    }
                                },'json');
                            }
                        }
                    }
                }
            }
        })
        .on('select_node.jstree', function (e, data) { exports.render_detail(data.node.li_attr,'edit'); })
        .on('move_node.jstree', function (e, data) { jstree_move_node(data);})


        function jstree_move_node(data){
            var type = 'inside';
            if(data.parent==data.old_parent){
                if(data.position > data.old_position){
                    type = 'after';
                }
                if(data.position < data.old_position){
                    type = 'before';
                }
            }
            var parent_text = '根节点';
            if($.isNumeric(data.parent)){
                var _p = data.instance.get_node(data.parent);
                parent_text = _p.text;
            }
            if(confirm('确认移动 ['+data.node.text +'] '+type+' ['+parent_text+'] ?')){
                $.post('/auth/permission/save',{ 'node_id' : data.node.id, 'parent' : data.parent, 'position':data.position,'drag':1},function (json) {
                        $('#tab-menu .do-result').html('<div class="alert alert-success">'+json.msg+'</div>');
                        data.instance.refresh();
                },'json');
            }
            return false;
        }

    });

    $('#node-root').click(function () {
        exports.render_detail(false,'create');
    })
    $('#node-toggle').click(function(){
        if($(this).attr('data-click')==0){
            $('#node-tree').jstree().open_all();
            $(this).attr('data-click',1)
        }else{
            $('#node-tree').jstree().close_all();
            $(this).attr('data-click',0)
        }
    });

    $('#node-save').on('click',function(){
        $.ajax({
            url:'/auth/permission/save',
            type:'post',
            data:$('#node-form').serialize(),
            dataType:'json',
            success:function(json){
                if(json.code==1){
                    $('#tab-menu .do-result').html('<div class="alert alert-success">'+json.msg+'</div>');
                    $('#node-tree').jstree().refresh();
                }else{
                    $('#tab-menu .do-result').html('<div class="alert alert-warning">'+json.msg+'</div>');
                    return false;
                }
            }
        });
    });

    exports.render_detail = function (node,action){
        //console.log(node);
        $('#node-form input:not(:radio)').val('');
        var title = '';
        if(node && action=='edit'){
            title = '编辑节点 '+node.title;
            $('#parent-name').html(node.p_path=='' ? '/' : node.p_path);
            $('#node-form input[name="node_id"]').val(node.node_id);
            $('#node-form input[name="parent_id"]').val(node.p_id);
            $('#node-form input[name="level"]').val(node.level);
            $('#node-form input[name="path"]').val(node.path);
            $('#node-form input[name="title"]').val(node.title);
            $('#node-form input[name="name"]').val(node.name);
            $('#node-form input[name="note"]').val(node.note);
            $('#node-form input[name="auth"][value="'+node.auth+'"]').prop('checked',true);
            $('#node-form input[name="status"][value="'+node.status+'"]').prop('checked',true);
            $('#node-form input[name="sort"]').val(node.sort);

        }else{
            title = '新增节点';
            $('#parent-name').html(node ? node.path+'/' :'/');
            $('#node-form input[name="node_id"]').val(0);
            $('#node-form input[name="parent_id"]').val(node ? node.id : 0);
            $('#node-form input[name="name"]').val('');
            $('#node-form input[name="path"]').val(node ? node.path : '');
            $('#node-form input[name="auth"][value="1"]').prop('checked',true);
            $('#node-form input[name="status"][value="1"]').prop('checked',true);
            $('#node-form input[name^="title"]').val('');
        }
        if(title.length>38){
            $('#node-title').attr('title',title);
            title = title.substr(0,title.length-36);
        }
        $('#node-title').text(title);
        return true;
    }

    document.onkeydown = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            $("#node-save").click();
        }
    }
});