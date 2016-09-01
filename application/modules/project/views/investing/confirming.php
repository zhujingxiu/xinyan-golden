<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/26 0026
 * Time: 17:15
 */
?>

<div class="col-sm-12" style="padding-top:10px; ">
    <?php echo form_open('/project/investing/confirmed',array('id' => "form-confirming", 'class'=>'form-horizontal'))?>
    <?php echo form_hidden('project_sn',$project_sn);?>
    <input type="hidden" name="_weight" id="confirm_weight" value="<?php echo $weight;?>">
    <input type="hidden" name="_phone" id="confirm_phone" value="<?php echo $phone;?>">
    <?php echo form_hidden($csrf)?>
    <div class="col-sm-12">
        <div class="form-group">
            <ul class="timeline" id="timeline-box">
                <li class="time-label">
                    <span class="bg-light-blue-active"> 项目信息 </span>
                </li>
                <li>
                    <i class="fa fa-diamond bg-orange-active"></i>
                    <div class="timeline-item">
                        <div class="col-sm-4">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-11">
                                    <span class="input-group-addon">买入重量</span>
                                    <span class="form-control"><?php echo $weight;?> 克</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-11">
                                    <span class="input-group-addon">买入价格</span>
                                    <span class="form-control" style="color:#CC9900;font-weight: bold;"><?php echo $price;?>元/克</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-12">
                                    <span class="input-group-addon">应付金额</span>
                                    <span id="checking-amount" class="form-control" style="color:#CC9900;font-weight: bold;"><?php echo $amount;?>元</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-12">
                                    <span class="input-group-addon">计息日期</span>
                                    <span class="form-control"><?php echo $start ?></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <i class="fa fa-user bg-green"></i>
                    <div class="timeline-item">
                        <div class="col-sm-4">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-11">
                                    <span class="input-group-addon">手机号码</span>
                                    <span class="form-control"><?php echo $phone?></span>
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
                                    <span class="input-group-addon">&nbsp;推&nbsp;荐&nbsp;人</span>
                                    <span class="form-control"><?php echo $referrer;?></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">

                            <div class="form-group clearfix">
                                <div class="input-group col-sm-12">
                                    <span class="input-group-addon">微信账号</span>
                                    <span class="form-control"><?php echo $wechat ?></span>
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
                                                <?php echo download_link($item['path'],$item['name'],array('target'=>"_blank"));?> &nbsp; &nbsp;
                                            <?php endforeach?>
                                        <?php endif?>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="time-label">
                    <span class="bg-red"> 入库确认 </span>
                </li>
                <li>
                    <i class="fa fa-edit bg-blue"></i>
                    <div class="timeline-item">
                        <div class="input-group">
                            <span class="input-group-addon">客户手机</span>
                            <input type="text" name="phone" class="form-control" placeholder="确认客户手机">
                            <span class="input-group-addon">确认重量</span>
                            <input class="form-control" name="weight" type="text" placeholder="确认客户的预购重量">
                            <span class="input-group-addon">克</span>
                        </div>
                        <?php if(false): ?><script type="text/plain" id="editor" style="height:80px;"></script><?php endif ?>
                        <textarea class="form-control" name="editorValue" placeholder="填写入库备注"></textarea>
                    </div>
                </li>
                <li class="time-label">
                    <span class="bg-purple"> 状态变更 </span>
                </li>
                <?php if(!empty($histories) && is_array($histories)): ?>
                <?php foreach($histories as $item) :?>
                <li>
                    <i class="fa fa-user bg-aqua"></i>
                    <div class="timeline-item">
                        <span class="time">
                            <?php echo $item['status']?>
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

        $("#form-confirming").validate({
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
                    equalTo: "与该项目预购重量不相符"
                },
                phone:{
                    required:'手机号码必须',
                    isMobile : '请输入有效的手机号码',
                    equalTo: "与客户登记的手机号码不相符"
                },
            },
            //提交
            submitHandler : function(form){
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

</script>
