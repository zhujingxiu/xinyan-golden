<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/29 0029
 * Time: 12:35
 */
?>
<div class="col-sm-12" style="padding-top:10px; ">
    <?php echo form_open('/project/investing/taken',array('id' => "form-taking", 'class'=>'form-horizontal'))?>
    <?php echo form_hidden('project_sn',$project_sn);?>
    <input type="hidden" name="_weight" id="confirm_weight" value="<?php echo $applied_weight;?>">
    <input type="hidden" name="_phone" id="confirm_phone" value="<?php echo $applied_phone;?>">
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
                        <div class="col-sm-4">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-11">
                                    <span class="input-group-addon">买入价格</span>
                                    <span class="form-control" style="color:#CC9900;font-weight: bold;"><?php echo $price;?>元/克</span>
                                </div>
                            </div>
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
                                    <span class="input-group-addon">应付金额</span>
                                    <span id="checking-amount" class="form-control" style="color:#CC9900;font-weight: bold;"><?php echo $amount;?>元</span>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-11">
                                    <span class="input-group-addon">买入周期</span>
                                    <span class="form-control"><?php echo $period ?>个月</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-12">
                                    <span class="input-group-addon">到期收益</span>
                                    <span class="form-control" style="color:#CC9900;font-weight: bold;"><?php echo $total ?>克</span>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-12">
                                    <span class="form-control"><?php echo $start ?></span>
                                    <span class="input-group-addon">-</span>
                                    <span class="form-control"><?php echo $end ?></span>
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
                        <div class="col-sm-4">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-11">
                                    <span class="input-group-addon">手机号码</span>
                                    <span class="form-control"><?php echo $phone?></span>
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
                                <div class="input-group col-sm-12">
                                    <span class="input-group-addon">身份证号</span>
                                    <span class="form-control"><?php echo $idnumber;?></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="time-label">
                    <span class="bg-red"> 出库确认 </span>
                </li>
                <li>
                    <i class="fa fa-edit bg-blue"></i>
                    <div class="timeline-item">
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
                        <div class="input-group">
                            <span class="input-group-addon" >客户同意书</span>
                            <span id="uploads" class="form-control" placeholder="上传客户确认书或出库合同"></span>
                            <span class="input-group-addon" ><a href="javascript:;" id="button-upload"><i class="fa fa-upload"></i> </a> </span>

                        </div>
                        <?php if(false): ?><script type="text/plain" id="editor" style="height:80px;"></script><?php endif ?>
                        <textarea class="form-control" name="editorValue" placeholder="填写出库备注"></textarea>
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

    new AjaxUpload('#button-upload', {
        action: '/tool/filemanager/upload',
        name: 'uploads',
        data: { date_path : true,'encrypt' : true },
        autoSubmit: false,
        responseType: 'json',
        onChange: function(file, extension) {this.submit();},
        onComplete: function(file, json) {
            if(json.code=1) {
                var _html = json.upload['origin'] + '<input type="hidden" name="_file" value="'+json.upload['origin']+'"  /><input type="hidden" name="_path" value="'+json.upload['path']+'">';
                $("#uploads").html(_html);

            }else{
                alert(json.error);
            }
            $('.loading').remove();
        }
    });
</script>
