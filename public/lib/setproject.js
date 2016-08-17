/**
 * Created by Jason Chu on 2016/8/16.
 */
define(function(require,exports,module){

    require('jqueryvalidate');
    require('ajaxSubmit');
    require('layer');
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
        $("#project-investing").validate({
            rules: {
                code: {
                    required: true,
                    minlength: 2,
                    remote: {
                        url: "/setting/project/check_status",             //servlet
                        data: {
                            status_id: function () {
                                return $("input[name='status_id']").val();
                            },
                            code: function () {
                                return $("#form-code").val();
                            },
                            mode: function () {
                                return 'investing';
                            }
                        }
                    }
                },
                title: {
                    required: true,
                    minlength: 2
                },

            },
            messages: {
                code: {
                    required: '请输入状态标识',
                    minlength: '状态标识不得少于2个字符。',
                    remote: "状态标识已经被注册"
                },
                title: {
                    required: '请输入状态名称',
                    minlength: '状态名称不得少于2个字符。'
                },
            },

            //提交
            submitHandler: function (form) {

                $(form).ajaxSubmit({
                    dataType: 'json',
                    success: function (json) {
                        if (json.code == 1) {
                            $(form).find('.do-result').html('<div class="alert alert-success">设置参数已保存！</div>').fadeOut(3000);
                            exports.render_statuses($(form).find('input[name="mode"]').val());
                        }
                    }
                });
            }
        });
        $("#project-recycling").validate({
            rules: {
                code: {
                    required: true,
                    minlength: 2,
                    remote: {
                        url: "/setting/project/check_status",             //servlet
                        data: {
                            status_id: function () {
                                return $("input[name='status_id']").val();
                            },
                            code: function () {
                                return $("#form-code").val();
                            },
                            mode: function () {
                                return 'recyling';
                            }
                        }
                    }
                },
                title: {
                    required: true,
                    minlength: 2
                },

            },
            messages: {
                code: {
                    required: '请输入状态标识',
                    minlength: '状态标识不得少于2个字符。',
                    remote: "状态标识已经被注册"
                },
                title: {
                    required: '请输入状态名称',
                    minlength: '状态名称不得少于2个字符。'
                },
            },

            //提交
            submitHandler: function (form) {

                $(form).ajaxSubmit({
                    dataType: 'json',
                    success: function (json) {
                        if (json.code == 1) {
                            $(form).find('.do-result').html('<div class="alert alert-success">设置参数已保存！</div>').fadeOut(3000);
                            exports.render_statuses($(form).find('input[name="mode"]').val());
                        }
                    }
                });
            }
        });
    });

    $('.btn-status').bind('click',function(){
        $('.do-result').empty();
        $('#'+$(this).attr('form')).submit();

    });

    $('.table-status tbody').delegate('.status-row','dblclick',function(){
        exports.render_detail($(this).data('entry'),$(this).data('mode'));
    });
    $('.btn-new').bind('click', function () {
        exports.render_detail(false,$(this).data('mode'));
    });
    exports.render_detail = function (id,mode) {
        if(id > 0) {
            $.get('/setting/project/get_status', {status_id: id,mode:mode}, function (json) {
                if (json.code == 1) {
                    var info = json.info;

                    $('#project-'+mode+' input[name="status_id"]').val(info.status_id);
                    $('#project-'+mode+' input[name="code"]').val(info.code);
                    $('#project-'+mode+' input[name="title"]').val(info.title);
                    $('#project-'+mode+' input[name="note"]').val(info.note);

                    $('#project-'+mode+' input[name="status"][value="' + info.status + '"]').prop('checked', true);
                    //$('#project-'+mode+' .box-title').text('编辑角色 ' + info.title);

                }
            }, 'json');
        }else{
            $('#project-'+mode+' input[type="text"],#project-'+mode+' input[name="status_id"]').val('');
            $('#project-'+mode+' input[name="status"][value="1"]').prop('checked', true);
            //$('#project-'+mode+' .box-title').text('添加角色');
        }
    }
    exports.render_statuses = function (mode) {
        $.get('/setting/project/status_list',{mode:mode},function(json){
            var list = json.info,_html = '';
            for(var i=0;i<list.length;i++){
                _html += '<tr class="status-row" data-mode="'+mode+'" data-entry="'+list[i].status_id+'">';
                _html += '<td>'+list[i].status_id+'</td>';
                _html += '<td>'+list[i].title+'</td>';
                _html += '<td>'+list[i].code+'</td>';
                _html += '<td>'+(list[i].status >0 ? '是' :'否')+'</td>';
                _html += '<td>'+list[i].note+'</td>';
                _html += '</tr>';
            }
            $('tbody#'+mode+'-list').html(_html)
        },'json')
    }
    $('.setting-project-form .form-control').bind('change', function () {
        exports.setting_save($(this).attr('name'),$(this).val(),$(this));
    });
    $('.setting-project-form .input-group input[type="checkbox"],.setting-project-form .input-group input[type="radio"]').bind('click', function () {
        console.log($(this).val());
        console.log($(this));
        //exports.setting_save($(this).attr('name'),$(this).val(),$(this));
    })
    exports.setting_save = function (code,value,el) {

        $.post('/setting/project/save',{code:code,value:value}, function (json) {
            if(json.code==1){
                layer.tips('参数已保存', el,{tips: [1, '#00CC99']});
            }
        },'json')
    }
});