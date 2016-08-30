/**
 * Created by zhujingxiu on 2016/8/12 0012 11:22.
 */
define(function (require, exports, modules) {
    require('ajaxUpload');
    require('ajaxSubmit');
    new AjaxUpload('#button-upload', {
        action: '/tool/filemanager/upload',
        name: 'uploads',
        data: { upload_path : 'public/images/avatar','encrypt' : true },
        autoSubmit: false,
        responseType: 'json',
        onChange: function(file, extension) {this.submit();},
        onComplete: function(file, json) {
            if(json.code=1) {

                $("#uploads").html('<img title="'+json.upload['origin']+'"  src="'+getImgURL(HTTP_SERVER+json.upload['path'])+'" style="width:'+json.upload['width']+'px" class="profile-user-img img-responsive img-circle">');
                $("input[name='avatar']").val(json.upload['path']);
                $('#save-upload').removeClass('hidden');

            }else{
                alert(json.error);
            }
            $('.loading').remove();
        }
    });

    $('#save-upload').bind('click', function () {
        $('#form-avatar').ajaxSubmit({
            dataType:'json',
            success: function (json) {
                if(json.code==1){
                    //location.reload()
                }
                console.log(json)
            }
        })
    })


    exports.submit_password = function () {

        require('jqueryvalidate');
        require('customValidate');
        $(function () {
            $.validator.setDefaults({
                errorElement: 'span',
                errorClass: 'help-block',
                highlight: function (element) {
                    $(element).closest('.form-group').addClass('has-error');
                },

                success: function (label) {
                    label.closest('.form-group').removeClass('has-error');
                    label.remove();
                },

                errorPlacement: function (error, element) {
                    element.parent('div').append(error);
                }
            });

            $("#form-password").validate({
                rules: {
                    oldpswd: {
                        required: true,
                        remote: {
                            url: "/auth/profile/check_oldpwd",             //servlet
                            data: {
                                oldpswd: function () {
                                    return $("#inputOldpswd").val();
                                }
                            }
                        }
                    },
                    newpswd: {
                        required: true,
                        minlength: 6,
                        maxlength: 20
                    },
                    confirm: {
                        required: true,
                        equalTo: '#inputNewpswd'
                    }
                },
                messages: {
                    oldpswd: {
                        required: '必须输入原密码',
                        remote: "与原密码不相符"
                    },
                    newpswd: {
                        required: '请输入新密码',
                        minlength: '角色名称不得少于6个字符。',
                        maxlength: '密码长度不能超过20个字符。'
                    },
                    confirm: {
                        required: '请输入确认密码',
                        equalTo: '两次输入密码不一致'
                    }
                },

                //提交
                submitHandler: function (form) {
                    var checked = $('#node-tree').jstree("get_checked", null, true);
                    $(form).find('input[name="permission"]').val(checked.join());
                    $(form).ajaxSubmit({
                            dataType: 'json',
                            success: function (json) {
                                if (json.code == 1) {
                                    location.reload()
                                }
                            }
                        }
                    );
                }
            });
        });
    }
});