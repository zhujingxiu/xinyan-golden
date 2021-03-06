<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/8/28
 * Time: 18:52
 */
?>

<div class="col-sm-12" style="padding-top:10px; ">
    <?php echo form_open('/project/customer/taking',array('id' => "form-appling", 'class'=>'form-horizontal'))?>
    <?php echo form_hidden('customer_id',$customer_id);?>
    <?php echo form_hidden('card_serial',$card_serial);?>
    <input type="hidden" name="_phone" id="confirm_phone" value="<?php echo $phone;?>">
    <input type="hidden" name="_max" id="confirm_max" value="<?php echo $max;?>">
    <?php echo form_hidden($csrf)?>

    <div class="col-sm-12">

        <div class="form-group">
            <ul class="timeline timeline-inverse " id="timeline-box">
                <li class="time-label">
                    <span class="bg-green"> 客户提金 </span>

                </li>

                <li>
                    <i class="fa fa-user bg-green"></i>
                    <div class="timeline-item">
                        <h3 class="timeline-header">客户资料
                            <div class="pull-right">
                                <a class="btn btn-success btn-flat btn-xs">可提克重 <?php echo number_format($available,2).lang('text_weight_unit')?></a>
                                <a class="btn btn-warning btn-flat btn-xs">冻结克重 <?php echo number_format($frozen,2).lang('text_weight_unit')?></a>
                            </div>
                        </h3>
                        <div class="timeline-body" style="clear: both">
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">客户姓名</span>
                                        <span class="form-control"><?php echo $realname?></span>
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
                                        <span class="input-group-addon">手机号码</span>
                                        <span class="form-control"><?php echo $phone;?></span>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">推荐人</span>
                                        <span class="form-control"><?php echo $referrer?></span>
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
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">黄金重量</span>
                                        <span class="form-control"><?php echo number_format($total,2).lang('text_weight_unit')?></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">客户分组</span>
                                        <span class="form-control"><?php echo $group_name;?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-12">
                                        <span class="input-group-addon">QQ号码</span>
                                        <span class="form-control"><?php echo $qq;?></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-footer" style="clear: both;">
                            <div class="timeline-footer" style="clear: both;">
                                <a class="btn btn-primary btn-xs" id="button-privacy">
                                    <i class="fa fa-upload"></i> 客户提金协议及费用清单
                                </a>
                                <div class="upload-file" id="uploads"></div>
                            </div>
                        </div>
                    </div>

                </li>
                <li>
                    <i class="fa fa-edit bg-red"></i>
                    <div class="timeline-item">
                        <h3 class="timeline-header">提金确认</h3>
                        <div class="timeline-body" style="clear: both">
                            <div class="input-group">
                                <span class="input-group-addon">客户手机</span>
                                <input type="text" name="phone" class="form-control" placeholder="确认客户手机">
                                <span class="input-group-addon">提金克重</span>
                                <input class="form-control" name="weight" type="text" placeholder="最大值为<?php echo $max;?>">
                                <span class="input-group-addon">克</span>

                                <input type="text" name="fee" class="form-control" placeholder="如有手续费，请输入">
                                <span class="input-group-addon">元</span>
                            </div>
                        </div>
                        <div class="timeline-footer">
                            <textarea class="form-control" name="editorValue" placeholder="填写提金申请备注"></textarea>
                        </div>
                    </div>
                </li>
                <?php if(!empty($histories) && is_array($histories)): ?>
                <li class="time-label">
                    <span class="bg-purple"> 近期金库明细 </span>
                </li>
                    <?php foreach($histories as $item) :?>
                <li>
                    <i class="fa fa-user bg-aqua"></i>
                    <div class="timeline-item">
                        <span class="time">
                            <?php echo ($item['mode'] =='out' ? $item['weight'] : '+'.$item['weight']).lang('text_weight_unit')?>
                            <i class="fa fa-clock-o"></i> <?php echo format_time($item['addtime'],true);?>
                        </span>
                        <h3 class="timeline-header no-border">
                            <a href="javascript:;" class="liveim">
                                <?php if(!empty($item['avatar']) && file_exists($item['avatar'])): ?>
                                    <img data-toggle="tooltip" src="<?php echo site_url($item['avatar'])?>" class="user-avatar" title="<?php echo $item['operator']?>" alt="<?php echo $item['operator']?>">
                                <?php else: ?>
                                    <?php echo $item['operator']?>
                                <?php endif?>
                            </a>
                            <small>&nbsp; <?php echo str_truncate(strip_tags(htmlspecialchars_decode($item['note'])));?></small>
                        </h3>
                        <?php if(is_array($item['file'])):?>
                            <div class="timeline-footer">
                                <div class="upload-file" id="uploads">
                                    <?php foreach($item['file'] as $_file) :?>
                                        <div class="uploads-thumb-sm">
                                            <img title="<?php echo $_file['name']?>" src="<?php echo base_url(get_image_url($_file['path']));?>"><br>
                                            <?php echo download_link($_file['path'],'下载',array('class'=>'btn btn-link'))?>
                                        </div>
                                    <?php endforeach ?>
                                </div>
                            </div>
                        <?php endif?>
                    </div>
                </li>
                    <?php endforeach ?>
                <?php endif ?>
                <li>
                    <i class="fa fa-clock-o bg-gray"></i>
                </li>
            </ul>
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
                $(element).prev('.input-group-addon').addClass('has-error');
            },
            success : function(label) {
                label.prev('.input-group-addon').removeClass('has-error');
                label.remove();
            },
            errorPlacement : function(error, element) {
                if(error.text().length>0)
                    layer.tips(error.text(), element,{tips: 1});
            }
        });

        $("#form-appling").validate({
            rules : {
                weight : {
                    required : true,
                    maxFloat: '<?php echo $max;?>'
                },
                phone: {
                    required : true,
                    isMobile :true,
                    equalTo: '#confirm_phone'
                },
            },
            messages : {
                weight : {
                    required : '请输入购入重量',

                    maxFloat: "申请重量不得大于最大重量:<?php echo $max;?>"

                },
                phone:{
                    required:'手机号码必须',
                    isMobile : '请输入有效的手机号码',
                    equalTo: "与客户登记的手机号码不相符"
                },
            },
            //提交
            submitHandler : function(form){
                $.each($('.uploads-thumb img'),function(){
                    $(form).append('<input type="hidden" name="file[]" value="'+$(this).data('name')+'|'+$(this).data('path')+'">');
                });
                $(form).ajaxSubmit({
                    dataType:'json',
                    beforeSubmit:function(){
                        layer.load();
                    },
                    success: function (json) {
                        if(json.code==1){
                            location.reload()
                        }else {
                            var l = require('layout');
                            l.render_message(json.msg, json.title);
                        }
                    }
                });
            }
        });

    });
    new AjaxUpload('#button-privacy', {
        action: '/tool/filemanager/upload',
        name: 'uploads',
        data: { date_path : true,'encrypt' : true },
        autoSubmit: false,
        responseType: 'json',
        onChange: function(file, extension) {this.submit();},
        onComplete: function(file, json) {
            if(json.code=1) {
                var _html = '<div class="uploads-thumb">';
                _html += '<img title="'+json.upload['origin']+'" data-name="'+json.upload['origin']+'" data-path="'+json.upload['path']+'"  src="'+getImgURL(HTTP_SERVER+json.upload['path'])+'">';
                _html += '<a href="javascript:;" onclick="$(this).parent().remove();">删除</a>';
                _html += '</div>';
                $('#uploads').append(_html);
            }else{
                alert(json.error);
            }
            $('.loading').remove();
        }
    });
</script>