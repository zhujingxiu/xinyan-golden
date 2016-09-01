<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/31 0031
 * Time: 16:40
 */
?>


<div class="col-sm-12" style="padding-top:10px; ">
    <?php echo form_open('/project/customer/taken',array('id' => "form-taking", 'class'=>'form-horizontal'))?>
    <?php echo form_hidden('apply_id',$apply_id);?>
    <input type="hidden" name="_phone" id="confirm_phone" value="<?php echo $applied_phone;?>">
    <input type="hidden" name="_weight" id="confirm_weight" value="<?php echo $applied_weight;?>">
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
                        <h3 class="timeline-header">客户资料</h3>
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
                            <a class="btn btn-primary btn-xs" id="button-upload">
                                <i class="fa fa-upload"></i> 客户同意书
                            </a>
                            <div class="upload-file" id="uploads"></div>
                        </div>
                    </div>

                </li>
                <li>
                    <i class="fa fa-edit bg-red"></i>
                    <div class="timeline-item">
                        <h3 class="timeline-header">提金确认</h3>
                        <div class="timeline-body" style="clear: both">
                            <div class="input-group ">
                                <span class="input-group-addon" style="color:#CC9900;font-weight: bold;"> 客 户 手 机 </span>
                                <input type="text" style="color:#CC9900;font-weight: bold;" class="form-control" value="<?php echo $applied_phone;?>" disabled>
                                <span class="input-group-addon" style="color:#CC9900;font-weight: bold;"> 申 请 重 量 </span>
                                <input type="text" style="color:#CC9900;font-weight: bold;" class="form-control" value="<?php echo $applied_weight;?>" disabled>
                                <span class="input-group-addon">克</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon" > 确 认 手 机 </span>
                                <input type="text" name="phone" class="form-control" placeholder="确认客户手机">
                                <span class="input-group-addon" > 确 认 重 量 </span>
                                <input class="form-control" name="weight" type="text" placeholder="确认申请提金重量" >
                                <span class="input-group-addon">克</span>
                            </div>
                            <textarea class="form-control" name="editorValue" placeholder="填写提金备注"></textarea>
                        </div>
                    </div>
                </li>
                <?php if(!empty($histories) && is_array($histories)): ?>
                    <li class="time-label">
                        <span class="bg-purple"> 近期库存明细 </span>
                    </li>
                    <?php foreach($histories as $item) :?>
                        <li>
                            <i class="fa fa-user bg-aqua"></i>
                            <div class="timeline-item">
                        <span class="time">
                            <?php echo ($item['mode'] =='out' ? $item['weight']*(-1.00) : '+'.$item['weight']).lang('text_weight_unit')?>
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
        $('#timeline-box').slimScroll({
            height: '560px'
        });
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

        $("#form-taking").validate({
            rules : {
                weight : {
                    required : true,
                    equalTo: '#confirm_weight'
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
                    equalTo: "与客户申请的重量不符"

                },
                phone:{
                    required:'手机号码必须',
                    isMobile : '请输入有效的手机号码',
                    equalTo: "与客户申请的手机号码不相符"
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
                        }
                    }
                });
            }
        });

    });
    new AjaxUpload('#button-upload', {
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