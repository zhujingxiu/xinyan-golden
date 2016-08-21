/**
 * Created by zhujingxiu on 2016/8/10 0010.
 */
define(function (require,exports,modules) {

    require('jstree');
    require('jqueryvalidate');
    require('customValidate');
    require('ajaxSubmit');
    // Highlight selected row
    $(function () {
        $.validator.setDefaults({
            errorElement : 'span',
            errorClass : 'help-block',
            highlight : function(element) {
                $(element).closest('.form-group').addClass('has-error');
            },

            success : function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement : function(error, element) {
                element.parent('div').append(error);
            }
        });

        $("#form-role").validate({
            rules : {
                code : {
                    required : true,
                    minlength : 2,
                    remote:{
                        url:"/auth/role/check_code",             //servlet
                        data:{
                            role_id: function () {
                                return $("input[name='role_id']").val();
                            },
                            code: function () {
                                return $("#form-rolename").val();
                            }
                        }
                    }
                },
                title : {
                    required : true,
                    minlength : 2
                },

            },
            messages : {
                code : {
                    required : '请输入角色标识',
                    minlength : '角色标识不得少于2个字符。',
                    remote  :"角色标识已经被注册"
                },
                title : {
                    required : '请输入角色名称',
                    minlength : '角色名称不得少于2个字符。'
                },
            },

            //提交
            submitHandler : function(form){
                var checked = $('#node-tree').jstree("get_checked",null,true);
                $(form).find('input[name="permission"]').val(checked.join());
                $(form).ajaxSubmit({
                        dataType:'json',
                        success: function (json) {
                            if(json.code==1){
                                location.reload()
                            }
                        }
                    }
                );
            }
        });
        // 6 create an instance when the DOM is ready
        $('#node-tree').jstree({
            'core' : {
                'data' : {
                    "url" : "/auth/role/index",
                    "data":'auth=1',
                    "dataType" : "json" // needed only if you do not supply JSON headers
                },
                'check_callback' : true,
                'themes' : { responsive : false}
            },
            'plugins' : ['wholerow' , 'checkbox' ]

        });
    });
    $('tr.role-row').bind('dblclick', function () {
        exports.row_detail($(this).data('entry'));
    });

    $('#new-role').bind('click', function () {
        exports.row_detail(false);
    })

    exports.row_detail = function (role_id) {
        $('#form-role .role-worker').remove();
        var jsTree = $.jstree.reference($('#node-tree'));
        jsTree.uncheck_all();
        if(role_id > 0) {
            $.get('/auth/role/get_info', {role_id: role_id}, function (json) {
                if (json.code == 1) {
                    var info = json.info;
                    $('#form-role .box-body').prepend('<div class="form-group role-worker clearfix"><label class="control-label col-sm-2">员工</label><div class="col-sm-10"><span>'+info.worker+'</span></div></div>')
                    $('#form-role input[name="role_id"]').val(info.id);
                    $('#form-role input[name="code"]').val(info.code);
                    $('#form-role input[name="title"]').val(info.title);
                    $('#form-role input[name="permission"]').val(info.permission);

                    $('#form-role input[name="status"][value="' + info.status + '"]').prop('checked', true);
                    $('#form-role .box-title').text('编辑角色 ' + info.title);
                    var nodes = info.permission.split(',');
                    for(var i = 0 ; i < nodes.length; i++)
                    {
                        var n = jsTree.get_node(nodes[i]);
                        jsTree.check_node(n);jsTree.open_node(n);
                    }
                }
            }, 'json');
        }else{
            $('#form-role input[type="text"],#form-role input[name="role_id"],#form-role input[name="permission"]').val('');
            $('#form-role input[name="status"][value="1"]').prop('checked', true);
            $('#form-role .box-title').text('添加角色');
        }
    }

    $('#node-toggle').click(function(){
        if($(this).attr('data-click')==0){
            $('#node-tree').jstree().open_all();
            $(this).attr('data-click',1)
        }else{
            $('#node-tree').jstree().close_all();
            $(this).attr('data-click',0)
        }
    });

});