<?php if($customer_id){?>
<div class="nav-tabs-custom" style="margin:10px;">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#customer" data-toggle="tab">客户资料</a></li>
        <li><a href="#projects" data-toggle="tab">项目列表</a></li>
    </ul>
    <div class="tab-content" >
        <div class="tab-pane active" id="customer">
            <?php }?>
            <div class="col-sm-12" <?php echo (!$customer_id) ? 'style="margin-top:20px;"':''?>>
                <?php echo form_open('/project/customer/update',array('id' => "form-customer"))?>
                <?php echo form_hidden('customer_id',$customer_id)?>
                <div class="col-sm-6">
                    <div class="form-group clearfix">
                        <div class="input-group col-sm-11">
                            <span class="input-group-addon">客户姓名</span>
                            <input type="text" name="realname" class="form-control" placeholder="客户的真实姓名" value="<?php echo $realname;?>">
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <div class="input-group col-sm-11">
                            <span class="input-group-addon">身份证号</span>
                            <input type="text" name="idnumber" class="form-control" placeholder="二代身份证号码" value="<?php echo $idnumber;?>">
                        </div>
                    </div>

                </div>
                <div class="col-sm-6">
                    <div class="form-group clearfix">
                        <div class="input-group col-sm-12">
                            <span class="input-group-addon">手机号码</span>
                            <input type="text" name="phone" class="form-control" placeholder="客户的手机号码" value="<?php echo $phone;?>">
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <div class="input-group col-sm-12">
                            <span class="input-group-addon">微信账号</span>
                            <input type="text" name="wechat" class="form-control" value="<?php echo $wechat;?>">
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group clearfix">
                        <div class="input-group col-sm-11">
                            <span class="input-group-addon"><?php echo lang('text_referrer')?></span>
                            <input id="referrer" class="form-control" value="<?php echo $referrer;?>">
                            <input type="hidden" name="referrer" value="<?php echo $referrer_id;?>">
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <div class="input-group col-sm-11">
                            <span class="input-group-addon">QQ 号码</span>
                            <input type="text" name="qq" class="form-control" value="<?php echo $qq;?>">
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="form-group clearfix">
                        <div class="input-group col-sm-12">
                            <span class="input-group-addon">客户分组</span>
                            <select name="group_id" class="form-control" >
                                <option value="0" class="text-center"> -- 请选择一个客户组 -- </option>
                                <?php foreach ($groups as $item): ?>
                                    <option value="<?php echo $item['group_id'] ?>" <?php echo $item['group_id'] == $group_id ? 'selected' :'' ?>>
                                        <?php echo $item['title']?>
                                    </option>
                                <?php endforeach ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group clearfix">
                        <div class="input-group col-sm-12">
                            <span class="input-group-addon">可用状态</span>
                            <select name="status" class="form-control" >
                                <option value="1" <?php echo $status==1 ? 'selected' :'' ?>>启用</option>
                                <option value="0" <?php echo $status==0 ? 'selected' :'' ?>>禁用</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group clearfix">
                        <div class="input-group col-sm-11">
                            <span class="input-group-addon">Email</span>
                            <input name="email" class="form-control" value="<?php echo $email;?>">
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group clearfix">
                        <div class="input-group col-sm-12">
                            <span class="input-group-addon">联系地址</span>
                            <input name="address" class="form-control" value="<?php echo $address;?>">
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">

                    <div class="form-group clearfix">
                        <div class="input-group col-sm-12">
                            <textarea name="editorValue" class="form-control" placeholder="输入客户备注信息"><?php echo $note;?></textarea>
                        </div>
                    </div>
                </div>
                <?php echo form_close();?>
            </div>
            <?php if($customer_id){?>
        </div>
        <div class="tab-pane" id="projects">

        </div>
    </div>
</div>
<?php }?>
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

        $("#form-customer").validate({
            rules : {

                realname: {
                    required : true,
                    isChinese : true
                },
                phone: {
                    required : true,
                    isMobile :true
                },
                idnumber: {
                    required : true,
                    isIdCardNo : true
                },
                email: {
                    email: true,
                }
            },
            messages : {

                realname:{
                    required : '真实姓名必须',
                    isChinese :'请输入中文字符'
                },
                phone:{
                    required:'手机号码必须',
                    isMobile : '请输入有效的手机号码'
                },
                idnumber:{
                    required:'身份证号码必须',
                    isIdCardNo : '请输入正确的身份证号码'
                },
                email: {
                    email: '不合法',
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
                                var l = require('layout');
                                l.render_message(json.msg, json.title);
                            }
                        }
                    }
                );
            }
        });
    });

    $('#referrer').autocomplete({
        delay: 300,
        source: function(request, response) {
            $.ajax({
                url: '/auth/worker/autocomplete',
                data:{filter_role:'member',filter_name:request.term},
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item.name,
                            value: item.value
                        }
                    }));
                }
            });
        },
        select: function(e,ui) {
            $(this).val(ui.item.label);
            $(this).next('input[type="hidden"]').val(ui.item.value)
            return false;
        }
    });
    <?php if($customer_id):?>
    $('#projects').load('/project/customer/projects',{customer:<?php echo $customer_id?>});
    <?php endif?>
</script>