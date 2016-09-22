

<div class="col-sm-12" style="padding-top:10px; ">
    <?php echo form_open('/project/stock/order',array('id' => "form-order", 'class'=>'form-horizontal'))?>
    <?php echo form_hidden('apply_id',$apply_id);?>
    <input type="hidden" name="_phone" id="confirm_phone" value="<?php echo $applied_phone;?>">
    <input type="hidden" name="_weight" id="confirm_weight" value="<?php echo $applied_weight;?>">
    <?php echo form_hidden($csrf)?>

    <div class="col-sm-12">

        <div class="form-group">
            <ul class="timeline timeline-inverse " id="timeline-box">
                <li class="time-label">
                    <span class="bg-green"> 消费抵扣 </span>
                </li>
                <li>
                    <i class="fa fa-book bg-green"></i>
                    <div class="timeline-item">
                        <h3 class="timeline-header">申请信息</h3>
                        <div class="timeline-body" style="clear: both">
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">客户姓名</span>
                                        <span class="form-control"><?php echo $realname?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">申请克重</span>
                                        <span class="form-control"><?php echo $applied_weight.lang('text_weight_unit')?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-12">
                                        <span class="input-group-addon"><?php echo '申请主管'?></span>
                                        <span class="form-control"><?php echo $operator?></span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">相关费用</span>
                                        <span class="form-control"><?php echo number_format($fee,2).lang('text_currency_unit')?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-12">
                                        <span class="input-group-addon">申请时间</span>
                                        <span class="form-control"><?php echo date('Y-m-d H:i:s',$addtime)?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-12">
                                        <span class="form-control"><?php echo htmlspecialchars_decode($note)?></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-footer" style="clear: both;">
                            <a class="btn btn-primary btn-xs" id="button-upload">
                                客户提金协议或相关费用清单
                            </a>
                            <div class="upload-file" id="uploads">
                                <?php if($privacies): ?>
                                    <?php foreach($privacies as $item):?>
                                        <div class="uploads-thumb">
                                            <img title="<?php echo $item['name'];?>" data-name="<?php echo $item['name'];?>" data-path="<?php echo $item['path'];?>"  src="<?php echo base_url(get_image_url($item['path']));?>">
                                            <?php echo download_link($item['path'],'下载')?>
                                        </div>
                                    <?php endforeach?>
                                <?php endif?>
                            </div>
                        </div>
                    </div>

                </li>
                <li>
                    <i class="fa fa-edit bg-red"></i>
                    <div class="timeline-item">
                        <h3 class="timeline-header">
                            提金确认
                        </h3>
                        <div class="timeline-body" style="clear: both">

                            <div class="input-group">
                                <span class="input-group-addon" ><b> 确 认 手 机 </b></span>
                                <input type="text" name="phone" class="form-control" placeholder="确认客户手机">
                                <span class="input-group-addon" ><b> 确 认 重 量 </b></span>
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
                                                <div class="uploads-thumb">
                                                    <img title="<?php echo $_file['name']?>" src="<?php echo base_url(get_image_url($_file['path']));?>"/>
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

        $("#form-order").validate({
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

</script>

