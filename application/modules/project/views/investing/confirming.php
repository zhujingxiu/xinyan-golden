<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/26 0026
 * Time: 17:15
 */
?>
<div id="form-result" class="do-result"></div>
<div class="col-sm-12" style="padding-top:10px; ">
    <?php echo form_open('/project/investing/checked',array('id' => "form-confirming", 'class'=>'form-horizontal'))?>
    <?php echo form_hidden('project_sn',$project_sn);?>
    <?php echo form_hidden($csrf)?>

    <div class="col-sm-12">

        <div class="form-group">
            <ul class="timeline">
                <li class="time-label">
                    <span class="bg-red"> 项目入库 </span>
                </li>
                <li>
                    <i class="fa fa-user bg-aqua"></i>
                    <div class="timeline-item">
                        <div class="timeline-body">
                            <div class="col-sm-4">
                                <div class="form-group clearfix">

                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">预购周期</span>
                                        <span class="form-control"><?php echo $period ?>个月</span>

                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">预购重量</span>
                                        <span class="form-control"><?php echo $weight;?> 克</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">实时金价</span>
                                        <span class="form-control" style="color:#CC9900;font-weight: bold;"><?php echo $price;?>元/克</span>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">预期收益</span>
                                        <span class="form-control" style="color:#CC9900;font-weight: bold;"><?php echo $total ?>克</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">

                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">应付金额</span>
                                        <span id="checking-amount" class="form-control" style="color:#CC9900;font-weight: bold;"><?php echo $amount;?></span>
                                        <span class="input-group-addon">元</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <i class="fa fa-user bg-aqua"></i>
                    <div class="timeline-item">
                        <div class="timeline-body">
                            <div class="col-sm-3">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">客户姓名</span>
                                        <span class="form-control"><?php echo $realname;?></span>
                                    </div>
                                </div>

                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">&nbsp;推&nbsp;荐&nbsp;人</span>
                                        <span class="form-control"><?php echo $referrer;?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">身份证号</span>
                                        <span class="form-control"><?php echo $idnumber;?></span>
                                    </div>

                                </div>

                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">微信账号</span>
                                        <span class="form-control"><?php echo $wechat ?></span>
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
                        </div>
                    </div>
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
                                    <a href="javascript:;" class="liveim"><?php echo $item['operator']?></a>
                                    <?php echo str_truncate(strip_tags(htmlspecialchars_decode($item['note'])));?>
                                </h3>
                            </div>
                        </li>
                    <?php endforeach ?>
                <?php endif ?>
                <li>
                    <i class="fa fa-edit bg-blue"></i>
                    <div class="timeline-item">
                        <div class="timeline-body">
                            <script type="text/plain" id="editor" style="height:80px;"></script>
                        </div>

                    </div>
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

        $("#form-checking").validate({
            rules : {
                amount : {
                    required : true,
                    equalTo: '#confirm_amount'
                },

                phone: {
                    required : true,
                    isMobile :true,
                    equalTo: '#confirm_phone'
                },
            },
            messages : {

                amount : {
                    required : '请输入实收金额',
                    equalTo: "与该项目实收金额不相符"
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
                        success: function (json) {
                            if(json.code==1){
                                location.reload()
                            }
                        }
                    }
                );
            }
        });

    });
    var editor =  new UE.ui.Editor({
        toolbars: [
            [ 'source', 'undo', 'redo',
                '|','bold', 'italic', 'underline', 'fontborder',  'strikethrough','|', 'superscript', 'subscript', 'removeformat',
                '|','insertorderedlist', 'insertunorderedlist',
                '|', 'forecolor', 'backcolor',
                '|','justifyleft','justifycenter','justifyright','justifyjustify']
        ]
    });
    editor.render('editor');



</script>
