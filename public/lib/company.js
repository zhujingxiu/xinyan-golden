/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * DateTime: 2016/9/12 0012 11:38
 *
 */
/**
 * Created by Administrator on 2016/8/8 0008.
 */

define(function (require,exports,modules) {
    require('jqueryvalidate');
    require('customValidate');
    require('ajaxSubmit');
    require('datatables');
    require('datatables.bs');
    exports.render_list = function() {
        $(function () {

            $('#company-list').DataTable({
                "language": {
                    "url": "/public/lib/datatables/Chinese.json"
                }
            })
        });
    }
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


        $("#form-company").validate({
            rules : {
                title : {
                    required : true,
                    minlength : 2,
                },
            },
            messages : {
                title : {
                    required : '请输入公司名',
                    minlength : '字数不得少于2个字符。',
                },
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


    $('tr.company-row').bind('dblclick', function () {
        exports.row_company($(this).data('entry'));
    });
    $('#new-company').bind('click', function () {
        exports.row_company(false);
    });
    exports.row_company = function (company_id) {

        if(company_id > 0) {
            $.get('/auth/company/save', {company_id: company_id}, function (json) {
                if (json.code == 1) {
                    var info = json.info;
                    $('#form-company input[name="company_id"]').val(info.company_id);
                    $('#form-company input[name="title"]').val(info.title);
                    $('#form-company input[name="status"][value="' + info.status + '"]').prop('checked', true);
                    $('#form-company .box-title').text('编辑公司 ' + info.title);
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            }, 'json');
        }else{
            $('#form-company input[type="text"],#form-company input[name="company_id"]').val('');
            $('#form-company input[name="status"][value="1"]').prop('checked', true);
            $('#form-company .box-title').text('添加公司');
        }
    }


})