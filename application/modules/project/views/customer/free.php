<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/9/20
 * Time: 21:29
 */

?>
<div class="col-sm-12" style="margin-top:20px;">
    <?php echo form_open('/project/customer/free',array('id' => "form-free"))?>
    <?php echo form_hidden('customer_id',$customer_id)?>

    <div class="col-sm-12">
        <div class="form-group clearfix">
            <div class="input-group">
                <span class="input-group-addon">赠送克重</span>
                <input type="text" name="weight" class="form-control" placeholder="输入克重，添加到客户的金库">
                <span class="input-group-addon">克</span>
            </div>
        </div>
    </div>

    <div class="col-sm-12">

        <div class="form-group clearfix">
            <div class="input-group col-sm-12">
                <textarea name="editorValue" class="form-control" placeholder="输入赠送原因"></textarea>
            </div>
        </div>
    </div>
    <?php echo form_close();?>
</div>
<script type="text/javascript">
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
                if (element.parent('div').is('.input-group')) {
                    element.parent('div').parent('div').find('.help-block').remove();
                    element.parent('div').parent('div').append(error);
                } else {
                    element.parent('div').find('.help-block').remove();
                    element.parent('div').append(error);
                }
            }
        });

        $("#form-free").validate({
            rules: {
                editorValue: {
                    required: true,
                    minlength: 10
                },
                profit: {
                    isFloatGteZero: true,
                },
            },
            messages: {

                editorValue: {
                    required: '赠送原因必须填写',
                    minlength: '须大于10个字符'
                },
                profit: {
                    isFloatGteZero: '请输入有效克重',
                }
            },
            //提交
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                        dataType: 'json',
                        beforeSubmit: function () {
                            layer.load();
                        },
                        success: function (json) {
                            if (json.code == 1) {
                                location.reload();
                            }else{
                                var l = require('layout');
                                l.render_message(json.msg,json.title);
                            }
                        }
                    }
                );
            }
        });
    });
    </script>