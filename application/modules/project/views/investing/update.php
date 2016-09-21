<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/22 0022
 * Time: 15:07
 */
?>

<div class="col-sm-12" style="padding-top:10px; ">
    <?php echo form_open('/project/investing/update',array('id' => "form-update", 'class'=>'form-horizontal'))?>
    <?php echo form_hidden('project_sn',$project_sn);?>
    <?php echo form_hidden($csrf)?>
    <div class="col-sm-12">
        <fieldset>
            <legend>黄金信息</legend>
            <div class="col-sm-4">
                <div class="form-group clearfix">
                    <div class="input-group col-sm-11">
                        <span class="input-group-addon">实时金价</span>
                        <span class="form-control _highlight" ><?php echo $price ?> 元/克</span>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group col-sm-11">
                        <span class="input-group-addon">预购重量</span>
                        <input type="text" name="weight" class="form-control" placeholder="最小值<?php echo number_format($this->config->item('min_weight'),2)?>" value="<?php echo $weight;?>">
                        <span class="input-group-addon">克</span>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group clearfix">
                    <div class="input-group col-sm-11">
                        <span class="input-group-addon">交付方式</span>
                        <select class="form-control select2" name="payment">
                            <option value="gold" <?php echo $payment =='gold' ? 'selected' :'' ?>>黄金</option>
                            <option value="cash" <?php echo $payment =='cash' ? 'selected' :'' ?>>现金</option>
                        </select>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group col-sm-11">
                        <span class="input-group-addon">应付金额</span>
                        <span id="update-amount" class="form-control _highlight" ><?php echo number_format($amount,2);?></span>
                        <span class="input-group-addon">元</span>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group clearfix">
                    <div class="input-group col-sm-12">
                        <span class="input-group-addon">预存周期</span>
                        <select class="form-control select2" name="period_id">
                            <?php foreach($periods as $item):?>
                                <option data-profit="<?php echo calculate_rate($item['profit'],$item['month']);?>" value="<?php echo $item['period_id']?>" <?php echo $item['month'] == $month ? 'selected':''?>><?php echo $item['title']?></option>
                            <?php endforeach?>
                        </select>
                    </div>
                </div>
                <div class="form-group clearfix">
                    <div class="input-group col-sm-12">
                        <span class="input-group-addon">预期收益</span>
                        <span class="form-control _highlight" id="update-totals"></span>
                        <span class="input-group-addon">克</span>
                    </div>
                </div>
            </div>
        </fieldset>
    </div>
    <div class="col-sm-12">
        <fieldset>
            <legend>客户信息</legend>
            <div class="col-sm-4">
                <div class="form-group clearfix">
                    <div class="input-group col-sm-11">
                        <span class="input-group-addon">手机号码</span>
                        <span class="form-control"><?php echo $phone;?></span>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="form-group clearfix">
                    <div class="input-group col-sm-12">
                        <span class="input-group-addon">身份证号</span>
                        <span class="form-control"><?php echo $idnumber;?></span>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group clearfix">
                    <div class="input-group col-sm-11">
                        <span class="input-group-addon">客户姓名</span>
                        <span class="form-control"><?php echo $realname;?></span>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group clearfix">
                    <div class="input-group col-sm-11">
                        <span class="input-group-addon"><?php echo lang('text_referrer')?></span>
                        <input type="text" id="referrer" class="form-control" value="<?php echo $referrer?>"/>
                        <input type="hidden" name="referrer" value="<?php echo $referrer_id?>" />
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group clearfix">
                    <div class="input-group col-sm-12">
                        <span class="input-group-addon">微信账号</span>
                        <span class="form-control"><?php echo $wechat;?></span>
                    </div>

                </div>
            </div>
            <div class="col-sm-12">
                <div class="form-group clearfix">
                    <div class="input-group col-sm-12">
                        <span class="input-group-addon">客户同意认购书</span>
                        <span id="uploads" class="form-control" placeholder="上传客户确认书或认购合同">
                            <?php if($privacies): ?>
                                <?php foreach($privacies as $item):?>
                                    <?php echo $item['name'];?> <?php echo form_hidden('privacy',$item['name'].'|'.$item['path']);?>
                                <?php endforeach?>
                            <?php endif?>
                        </span>
                        <span class="input-group-addon" ><a href="javascript:;" id="button-upload"><i class="fa fa-upload"></i> </a> </span>
                    </div>
                </div>
            </div>
        </fieldset>
    </div>
    <div class="col-sm-12">
        <fieldset>
            <legend>项目备注</legend>
            <div class="col-sm-12">
                <div class="form-group clearfix">
                    <div class="input-group col-sm-12">
                        <span class="input-group-addon"><?php echo lang('text_transferrer')?></span>
                        <select name="transferrer" class="form-control select2">
                            <?php foreach($transferrers as $item):?>
                                <option value="<?php echo $item['id']?>" <?php echo $item['id']==$transferrer ? 'selected':''?>><?php echo $item['realname']?></option>
                            <?php endforeach?>
                        </select>
                        <span class="input-group-addon">核实登记信息</span>
                    </div>
                    <textarea class="form-control" name="editorValue" placeholder="填写项目备注"><?php echo trim(strip_tags(htmlspecialchars_decode($note)));?></textarea>
                </div>
            </div>
        </fieldset>
    </div>
    <?php echo form_close();?>
</div>

<script type="text/javascript">
    var price='<?php echo $price;?>';
    $(function () {

        <?php if($editable):?>
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
                if(element.parent('div').is('.input-group')){
                    element.parent('div').parent('div').find('.help-block').remove();
                    element.parent('div').parent('div').append(error);
                }else{
                    element.parent('div').find('.help-block').remove();
                    element.parent('div').append(error);
                }
            }
        });

        $("#form-update").validate({
            rules : {
                weight: {
                    required : true,
                    minFloat:'<?php echo $this->config->item('min_weight')?>'
                },
            },
            messages : {

                weight : {
                    required : '请输入购入克重',
                    minFloat:'最小购入克重不能小于<?php echo number_format($this->config->item('min_weight'),2)?>克'
                },
            },
            //提交
            submitHandler : function(form){
                $(form).ajaxSubmit({
                        dataType:'json',
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
        <?php endif?>
        $('#form-update input[name="weight"]').bind('keyup blur', function () {
            var _period = $('#form-update select[name="period_id"]');
            var _profit = parseFloat(_period.find('option[value="'+_period.val()+'"]').data('profit'),4);
            var _weight = $(this).val();
            if(!$.isNumeric(price)){
                layer.tips('数据异常',$('#form-update #update-amount'),{tips: [1, '#CC6666']});
                return false;
            }
            if(!$.isNumeric(_profit)){
                layer.tips('数据异常',$('#form-update #update-totals'),{tips: [1, '#CC6666']});
                return false;
            }
            if(!$.isNumeric(_weight)){
                //layer.tips('数据异常',$('#form-update #update-amount'),{tips: [1, '#CC6666']});
                return false;
            }else{
                $('#form-update #update-amount').text(parseFloat(math_mul(_weight,price)).toFixed(2));
                $('#form-update #update-totals').text(parseFloat(math_mul(_weight,_profit)).toFixed(2));
            }
        });
        $('#form-update select[name="period_id"]').bind('change', function () {
            var _profit = parseFloat($(this).find('option[value="'+$(this).val()+'"]').data('profit'),4);
            var _weight = $('#form-update input[name="weight"]').val();
            if(_weight!='' && $.isNumeric(_profit)){
                $('#form-update #update-totals').text(parseFloat(math_mul(_weight,_profit)).toFixed(2));
            }
        });
        $('#form-update select[name="period_id"]').trigger('change');
    });
    <?php if($editable):?>

    new AjaxUpload('#button-upload', {
        action: '/tool/filemanager/upload',
        name: 'uploads',
        data: { date_path : true,'encrypt' : true },
        autoSubmit: false,
        responseType: 'json',
        onChange: function(file, extension) {this.submit();},
        onComplete: function(file, json) {
            if(json.code=1) {
                $("#uploads").html(json.upload['origin'] + '<input type="hidden" name="privacy[]" value="'+json.upload['origin']+'|'+json.upload['path']+'">');
            }else{
                alert(json.error);
            }
            $('.loading').remove();
        }
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
    <?php endif?>
</script>
