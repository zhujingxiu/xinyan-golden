<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/9/20 0020
 * Time: 15:50
 */
?>

<div class="col-sm-12" style="padding-top:20px; ">
    <?php echo form_open('/project/customer/bind',array('id' => "form-bind"))?>
    <?php echo form_hidden('customer_id',$customer_id)?>
    <?php echo form_hidden('card_serial',$card_serial)?>
        <div class="form-group clearfix">
            <div class="input-group col-sm-12">
                <span class="input-group-addon">卡面编号</span>
                <input type="text" name="card_number" class="form-control" placeholder="请输入编号" >
            </div>
        </div>
    <?php echo form_close();?>
</div>

<script type="text/javascript">
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
                if(error.text().length>0)
                    layer.tips(error.text(), element,{tips: 1});
            }
        });

        $("#form-bind").validate({
            rules : {
                card_number: {
                    required : true,
                    isDigits : true,
                    remote:{
                        url:"/project/customer/check_card",             //servlet
                        data:{
                            card_number: function () {
                                return $("input[name='card_number']").val();
                            },
                        }
                    }
                },
            },
            messages : {
                card_number:{
                    required:'卡号必须',
                    isDigits : '请输入正确的卡号',
                    remote:"该号码已绑定给其他客户"
                }
            },

            //提交
            submitHandler : function(form){
                $(form).ajaxSubmit({
                        dataType:'json',
                        beforeSubmit:function(){
                            layer.load()
                        },
                        success: function (json) {
                            if(json.code==1){
                                location.reload()
                            }else{
                                layer.alert(json.msg,{icon: 2,title:json.title}, function () {
                                    location.reload()
                                });
                            }
                        }
                    }
                );
            }
        });
    });
</script>
