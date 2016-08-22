/**
 * Created by Administrator on 2016/8/8 0008.
 */

define(function (require,exports,modules) {
    require('jqueryvalidate');
    require('customValidate');
    require('ajaxSubmit');
    //require('datatables');
    //require('datatables.bs');
    $(document).ready(function () {
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

        $("#form-worker").validate({
            rules : {
                username : {
                    required : true,
                    maxlength : 30,
                    remote:{
                        url:"/auth/worker/check_username",             //servlet
                        data:{
                            user_id: function () {
                                return $("input[name='user_id']").val();
                            },
                            username: function () {
                                return $("#form-username").val();
                            }
                        }
                    }
                },
                realname : {
                    required : true,
                    maxlength : 60
                },
                email:{
                    email: true
                },
                phone:{
                    isMobile: true
                },
                password : {
                    required : true,
                    minlength : 6,
                    maxlength : 20
                },
                confirm : {
                    required : true,
                    equalTo: '#form-password'
                }
            },
            messages : {
                username : {
                    required : '请输入用户名',
                    maxlength : '用户名最大长度不能超过30个字符。',
                    remote  :"用户名已经被注册"
                },
                realname : {
                    required : '请输入昵称',
                    maxlength : '昵称最大长度不能超过60个字符。'
                },
                password : {
                    required : '请输入密码',
                    minlength : '密码长度不能小于6个字符。',
                    maxlength : '密码长度不能超过20个字符。'
                },
                confirm : {
                    required : '请输入确认密码',
                    equalTo: '两次输入密码不一致'
                }
            },

            //提交
            submitHandler : function(form){
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
    });

    $('tr.user-row').bind('dblclick', function () {

        exports.row_detail($(this).data('entry'));
    });
    $('#new-user').bind('click', function () {
        exports.row_detail(false);
    })

    exports.row_detail = function (user_id) {
        $.each($('#form-worker input[name^=groups]'), function () {
            $(this).prop('checked',false);
        })
        if(user_id > 0) {
            $.get('/auth/worker/get_info', {user_id: user_id}, function (json) {
                if (json.code == 1) {
                    var info = json.info;
                    $('#form-worker input[name="user_id"]').val(info.id);
                    $('#form-worker input[name="realname"]').val(info.realname);
                    $('#form-worker input[name="username"]').val(info.username);
                    $('#form-worker input[name="email"]').val(info.email);
                    $('#form-worker input[name="phone"]').val(info.phone);
                    $('#form-worker input[name="status"][value="' + info.status + '"]').prop('checked', true);
                    if(info.roles){
                        for(var i=0;i<info.roles.length;i++){
                            $('#form-worker input[name^="groups"][value="'+info.roles[i].id+'"]').prop('checked',true);
                        }
                    }
                    $('#form-worker .box-title').text('编辑用户 ' + info.username);

                    if (info.id > 0) {
                        $('#form-worker input[name="password"]').rules('remove', 'required');
                        $('#form-worker input[name="confirm"]').rules('remove', 'required');
                    }
                }

            }, 'json');
        }else{
            $('#form-worker input[type="text"],#form-worker input[name="user_id"]').val('');

            $('#form-worker input[name="status"][value="1"]').prop('checked', true);
            $('#form-worker .box-title').text('添加用户');
            $('#form-worker input[name="password"]').rules('add', 'required');
            $('#form-worker input[name="confirm"]').rules('add', 'required');
        }
    }
})