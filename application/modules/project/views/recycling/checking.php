<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/29 0029
 * Time: 12:35
 */
?>
<div class="col-sm-12" style="padding-top:10px; ">
	<?php echo form_open('/project/recycling/checked',array('id' => "form-checking", 'class'=>'form-horizontal'))?>
    <?php echo form_hidden('project_sn',$project_sn);?>
    <input type="hidden" name="_weight" id="confirm_weight" value="<?php echo $weight;?>">
    <input type="hidden" name="_phone" id="confirm_phone" value="<?php echo $phone;?>">
    <?php echo form_hidden($csrf)?>
    <div class="col-sm-12">
        <div class="form-group">
            <ul class="timeline timeline-inverse" id="timeline-box">
                <li class="time-label">
                    <span class="bg-light-blue-active"> 登记信息 </span>
                </li>
                <li>
                    <i class="fa fa-diamond bg-orange-active"></i>
                    <div class="timeline-item">
                        <h3 class="timeline-header">黄金信息</h3>
                        <div class="timeline-body">
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">黄金种类</span>
                                        <span class="form-control">
                                            <?php echo $type =='goldbar' ? lang('text_goldbar') :lang('text_ornaments') ?>
                                        </span>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">黄金克重</span>
                                        <span class="form-control"><?php echo (float)$origin_weight;?>克</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">黄金件数</span>
                                        <span class="form-control"><?php echo $number?>件</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="timeline-footer">
                            <a class="btn btn-primary btn-xs" id="button-photo">
                                实物照片
                            </a>
                            <a class="btn btn-primary btn-xs" id="button-invoice">
                                发票照片
                            </a>
                            <div class="upload-file" id="gold-uploads">
                                <?php if($photos): ?>
                                    <?php foreach($photos as $item):?>
                                        <div class="uploads-thumb">
                                            <img title="<?php echo $item['name'];?>" src="<?php echo base_url(get_image_url($item['path']));?>">
                                            <?php echo download_link($item['path'],'下载')?>
                                        </div>
                                    <?php endforeach?>
                                <?php endif?>
                                <?php if($invoices): ?>
                                    <?php foreach($invoices as $item):?>
                                        <div class="uploads-thumb">
                                            <img title="<?php echo $item['name'];?>" src="<?php echo base_url(get_image_url($item['path']));?>">
                                            <?php echo download_link($item['path'],'下载')?>
                                        </div>
                                    <?php endforeach?>
                                <?php endif?>
                            </div>
                        </div>
                    </div>
                </li>

                <li>
                    <i class="fa fa-gavel bg-navy-active"></i>
                    <div class="timeline-item">
                        <h3 class="timeline-header">鉴定结果</h3>
                        <div class="timeline-body">
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">鉴定人</span>
                                        <span class="form-control" ><?php echo $appraiser?></span>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">鉴定实重</span>
                                        <span class="form-control"><?php echo $weight;?>克</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">损耗比例</span>
                                        <span class="form-control"><?php echo $loss ?>%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-footer">
                            <a class="btn btn-primary btn-xs" id="button-report">
                                鉴定报告
                            </a>
                            <div class="upload-file" id="report-uploads">
                                <?php if($reports): ?>
                                    <?php foreach($reports as $item):?>
                                        <div class="uploads-thumb">
                                            <img title="<?php echo $item['name'];?>" src="<?php echo base_url(get_image_url($item['path']));?>">
                                            <?php echo download_link($item['path'],'下载')?>
                                        </div>
                                    <?php endforeach?>
                                <?php endif?>
                            </div>
                        </div>
                    </div>
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
                        </div>
                        <div class="timeline-footer" style="clear: both;">
                            <a class="btn btn-primary btn-xs" id="button-privacy">
                                客户同意书
                            </a>
                            <div class="upload-file" id="privacy-uploads">
                                <?php if($privacies): ?>
                                    <?php foreach($privacies as $item):?>
                                        <div class="uploads-thumb">
                                            <img title="<?php echo $item['name'];?>" src="<?php echo base_url(get_image_url($item['path']));?>">
                                            <?php echo download_link($item['path'],'下载')?>
                                        </div>
                                    <?php endforeach?>
                                <?php endif?>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="time-label">
                    <span class="bg-red"> 核实项目 </span>
                </li>
                <li>
                    <i class="fa fa-edit bg-blue"></i>

                    <div class="timeline-item">

                        <div class="input-group">
                            <span class="input-group-addon">客户手机</span>
                            <input type="text" class="form-control" name="phone" placeholder="确认客户手机">
                            <span class="input-group-addon">实际克重</span>
                            <input type="text" name="weight" class="form-control" placeholder="确认鉴定克重">
                            <span class="input-group-addon">克</span>
                        </div>
                        <div class="input-group col-sm-12">
                            <span class="input-group-addon">转交给</span>
                            <select name="transferrer" class="form-control select2">
                                <?php foreach($transferrers as $item):?>
                                    <option value="<?php echo $item['id']?>" ><?php echo $item['realname']?></option>
                                <?php endforeach?>
                            </select>
                            <span class="input-group-addon">确认入库标记</span>
                        </div>
                        <textarea class="form-control" name="editorValue" placeholder="填写核实备注"></textarea>
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
        <?php if($editable):?>
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
        $("#form-checking").validate({
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
                    required : '请输入鉴定克重',
                    equalTo: "与该项目鉴定克重不相符"
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
                    beforeSubmit: function () {
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
                });
            }
        });
        <?php endif ?>
    });
</script>