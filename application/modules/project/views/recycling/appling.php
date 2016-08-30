<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/8/28
 * Time: 18:52
 */
?>

<div class="col-sm-12" style="padding-top:10px; ">
    <?php echo form_open('/project/investing/applied',array('id' => "form-appling", 'class'=>'form-horizontal'))?>
    <?php echo form_hidden('project_sn',$project_sn);?>
    <input type="hidden" name="_phone" id="confirm_phone" value="<?php echo $phone;?>">
    <input type="hidden" name="_max" id="confirm_max" value="<?php echo $max;?>">
    <?php echo form_hidden($csrf)?>

    <div class="col-sm-12">

        <div class="form-group">
            <ul class="timeline" id="timeline-box">
                <li class="time-label">
                    <span class="bg-green"> 项目信息 </span>
                </li>
                <li>
                    <i class="fa fa-user bg-green"></i>
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


                        </div>

                    </div>
                </li>

                <li>
                    <i class="fa fa-user bg-green"></i>
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
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">手机号码</span>
                                        <span class="form-control"><?php echo $phone?></span>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">推荐人</span>
                                        <span class="form-control" ><?php echo $referrer?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">身份证号</span>
                                        <span class="form-control"><?php echo $idnumber?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">微信账号</span>
                                        <span class="form-control"><?php echo $wechat?></span>
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
                                        </div>
                                    <?php endforeach?>
                                <?php endif?>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="time-label">
                    <span class="bg-red"> 提金确认 </span>
                </li>
                <li>
                    <i class="fa fa-edit bg-blue"></i>
                    <div class="timeline-item">
                        <div class="input-group">
                            <span class="input-group-addon">客户手机</span>
                            <input type="text" name="phone" class="form-control" placeholder="确认客户手机">
                            <span class="input-group-addon">提金克重</span>
                            <?php if($partial_taking): ?>
                                <input class="form-control" name="weight" type="text" placeholder="最大值为<?php echo $max;?>">
                            <?php else : ?>
                                <input class="form-control" name="weight" type="text" placeholder="请输入克重<?php echo $max;?>">
                            <?php endif ?>
                            <span class="input-group-addon">克</span>
                        </div>
                        <?php if(false): ?><script type="text/plain" id="editor" style="height:80px;"></script><?php endif ?>
                        <textarea class="form-control" name="editorValue" placeholder="填写提金备注"></textarea>
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

        $("#form-appling").validate({
            rules : {
                weight : {
                    required : true,
                    <?php if($partial_taking): ?>
                    maxFloat: '<?php echo $max;?>'
                    <?php else: ?>
                    equalTo: '#confirm_max'
                    <?php endif ?>
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
                    <?php if($partial_taking): ?>
                    maxFloat: "申请重量不得大于最大重量:<?php echo $max;?>"
                    <?php else: ?>
                    equalTo: '请输入有效的黄金克重'
                    <?php endif ?>
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
    //    var editor =  new UE.ui.Editor({
    //        toolbars: [
    //            [ 'source', 'undo', 'redo',
    //                '|','bold', 'italic', 'underline', 'fontborder',  'strikethrough','|', 'superscript', 'subscript', 'removeformat',
    //                '|','insertorderedlist', 'insertunorderedlist',
    //                '|', 'forecolor', 'backcolor',
    //                '|','justifyleft','justifycenter','justifyright','justifyjustify']
    //        ]
    //    });
    //    editor.render('editor');
</script>