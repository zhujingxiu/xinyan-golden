<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/29 0029
 * Time: 12:35
 */
?>
<div class="col-sm-12" style="padding-top:10px; ">
    <?php echo form_open('/project/recycling/update',array('id' => "form-update", 'class'=>'form-horizontal'))?>
    <?php echo form_hidden('project_sn',$project_sn);?>
    <?php echo form_hidden($csrf)?>
    <div class="col-sm-12">
        <div class="form-group">
            <ul class="timeline timeline-inverse" id="timeline-box">
                <li class="time-label">
                    <span class="bg-light-blue-active"> 编辑项目 </span>
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
                                        <select class="form-control" name="type">
                                            <option value="ornaments" <?php echo $type =='ornaments' ? 'selected' :'' ?>>金饰</option>
                                            <option value="goldbar" <?php echo $type =='goldbar' ? 'selected' :'' ?>>金条</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">黄金克重</span>
                                        <input type="text" name="origin_weight" class="form-control" value="<?php echo (float)$origin_weight;?>">
                                        <span class="input-group-addon">克</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">黄金件数</span>
                                        <input type="text" name="number" class="form-control" value="<?php echo $number?>">
                                        <span class="input-group-addon">件</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="timeline-footer">
                            <a class="btn btn-primary btn-xs" id="button-photo">
                                <i class="fa fa-upload"></i> 实物照片
                            </a>
                            <a class="btn btn-primary btn-xs" id="button-invoice">
                                <i class="fa fa-upload"></i> 发票照片
                            </a>
                            <div class="upload-file" id="gold-uploads">
                            <?php if($photos): ?>
                                <?php foreach($photos as $item):?>
                                <div class="uploads-thumb">
                                    <img title="<?php echo $item['name'];?>" data-entry="photo" data-name="<?php echo $item['name'];?>" data-path="<?php echo $item['path'];?>"  src="<?php echo base_url(get_image_url($item['path']));?>">
                                    <a href="javascript:;" onclick="$(this).parent().remove();">删除</a>
                                </div>
                                <?php endforeach?>
                            <?php endif?>
                            <?php if($invoices): ?>
                                <?php foreach($invoices as $item):?>
                                    <div class="uploads-thumb">
                                        <img title="<?php echo $item['name'];?>" data-entry="invoice" data-name="<?php echo $item['name'];?>" data-path="<?php echo $item['path'];?>"  src="<?php echo base_url(get_image_url($item['path']));?>">
                                        <a href="javascript:;" onclick="$(this).parent().remove();">删除</a>
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
                                        <select id="appraiser" name="appraiser" class="form-control select2" >
                                            <?php foreach($appraisers as $item):?>
                                            <option value="<?php echo $item['id']?>" <?php echo $item['id']==$appraiser_id ? 'selected' : ''?> ><?php echo $item['realname']?></option>
                                            <?php endforeach?>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">鉴定实重</span>
                                        <input type="text" name="weight" class="form-control" value="<?php echo $weight;?>">
                                        <span class="input-group-addon">克</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">损耗比例</span>
                                        <input type="text" name="loss" class="form-control" value="<?php echo $loss ?>">
                                        <span class="input-group-addon">%</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-footer">
                            <a class="btn btn-primary btn-xs" id="button-report">
                                <i class="fa fa-upload"></i> 鉴定报告
                            </a>
                            <div class="upload-file" id="report-uploads">
                                <?php if($reports): ?>
                                    <?php foreach($reports as $item):?>
                                        <div class="uploads-thumb">
                                            <img title="<?php echo $item['name'];?>" data-entry="report" data-name="<?php echo $item['name'];?>" data-path="<?php echo $item['path'];?>"  src="<?php echo base_url(get_image_url($item['path']));?>">
                                            <a href="javascript:;" onclick="$(this).parent().remove();">删除</a>
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
                                        <span class="input-group-addon">手机号码</span>
                                        <span class="form-control"><?php echo $phone?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-12">
                                        <span class="input-group-addon">身份证号</span>
                                        <span class="form-control"><?php echo $idnumber?></span>
                                    </div>
                                </div>
                            </div>
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
                                        <span class="input-group-addon">推荐人</span>
                                        <input type="text" id="referrer" class="form-control" <?php echo $referrer?>/>
                                        <input type="hidden" name="referrer" value="<?php echo $referrer_id?>"  />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-12">
                                        <span class="input-group-addon">微信账号</span>
                                        <span class="form-control"><?php echo $wechat?></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-footer" style="clear: both;">
                            <a class="btn btn-primary btn-xs" id="button-privacy">
                                <i class="fa fa-upload"></i> 客户同意书
                            </a>
                            <div class="upload-file" id="privacy-uploads">
                                <?php if($privacies): ?>
                                    <?php foreach($privacies as $item):?>
                                        <div class="uploads-thumb">
                                            <img title="<?php echo $item['name'];?>" data-entry="privacy" data-name="<?php echo $item['name'];?>" data-path="<?php echo $item['path'];?>"  src="<?php echo base_url(get_image_url($item['path']));?>">
                                            <a href="javascript:;" onclick="$(this).parent().remove();">删除</a>
                                        </div>
                                    <?php endforeach?>
                                <?php endif?>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <i class="fa fa-edit bg-blue"></i>
                    <div class="timeline-item">

                        <div class="timeline-body">
                            <div class="input-group col-sm-12">
                                <span class="input-group-addon">转交给</span>
                                <select name="transferrer" class="form-control select2">
                                    <?php foreach($transferrers as $item):?>
                                        <option value="<?php echo $item['id']?>" <?php echo $item['id']==$transferrer ? 'selected':''?>><?php echo $item['realname']?></option>
                                    <?php endforeach?>
                                </select>
                                <span class="input-group-addon">核实登记信息</span>
                            </div>
                            <textarea class="form-control" name="editorValue" placeholder="填写出库备注"><?php echo $note;?></textarea>
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
        $('#timeline-box').slimScroll({
            height: '560px'
        });
        <?php if($editable):?>
        $.validator.setDefaults({
            errorElement : 'span',
            errorClass : 'help-block',
            highlight : function(element) {
                $(element).closest('.input-group').addClass('has-error');
            },
            success : function(label) {
                label.closest('.input-group').removeClass('has-error');
                label.remove();
            },
            errorPlacement : function(error, element) {
                if(error.text().length>0)
                    layer.tips(error.text(), element,{tips: 1});
            }
        });

        $("#form-update").validate({
            rules : {
                origin_weight : {
                    required : true,
                    isFloatGtZero : true
                },
                number: {
                    required : true,
                    isIntGtZero : true
                },
                appraiser: {
                    required : true,
                    isIntGtZero : true
                },
                weight: {
                    required : true,
                    isFloatGtZero : true
                },
                loss: {
                    required : true,
                    isNumber : true
                },

            },
            messages : {
                origin_weight:{
                    required : '黄金克重必填',
                    isFloatGtZero : '请输入有效的数字'
                },
                number: {
                    required : '黄金件数必填',
                    isIntGtZero : '请输入有效的数字'
                },
                appraiser: {
                    required : '请选择一个鉴定人',
                    isIntGtZero : '请选择一个鉴定人'
                },
                weight : {
                    required : '请输入鉴定实重',
                    isFloatGtZero: "请输入有效的数字"
                },

            },
            //提交
            submitHandler : function(form){
                $.each($('.uploads-thumb img'),function(){
                    $(form).append('<input type="hidden" name="'+$(this).data('entry')+'[]" value="'+$(this).data('name')+'|'+$(this).data('path')+'">');
                });
                $(form).ajaxSubmit({
                    dataType:'json',
                    beforeSubmit:function(){
                        layer.load();
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
    <?php if($editable):?>
    new AjaxUpload('#button-photo', {
        action: '/tool/filemanager/upload',
        name: 'uploads',
        data: { date_path : true,'encrypt' : true },
        autoSubmit: false,
        responseType: 'json',
        onChange: function(file, extension) {this.submit();},
        onSubmit : function(file , ext){
            if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){
                alert('错误：此处仅上传图片格式文件jpg、png、jpeg、gif');
                return false;
            }
            if($('#gold-uploads img').length >3){
                alert('错误：此处图片文件最多可上传4张');
                return false;
            }
        },
        onComplete: function(file, json) {
            if(json.code=1) {
                var _html = '<div class="uploads-thumb">';
                _html += '<img title="'+json.upload['origin']+'" data-entry="photo" data-name="'+json.upload['origin']+'" data-path="'+json.upload['path']+'"  src="'+getImgURL(HTTP_SERVER+json.upload['path'])+'">';
                _html += '<a href="javascript:;" onclick="$(this).parent().remove();">删除</a>';
                _html += '</div>';
                $('#gold-uploads').append(_html);
            }else{
                alert(json.error);
            }
            $('.loading').remove();
        }
    });
    new AjaxUpload('#button-invoice', {
        action: '/tool/filemanager/upload',
        name: 'uploads',
        data: { date_path : true,'encrypt' : true },
        autoSubmit: false,
        responseType: 'json',
        onChange: function(file, extension) {this.submit();},
        onSubmit : function(file , ext){
            if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){
                alert('错误：此处仅上传图片格式文件jpg、png、jpeg、gif');
                return false;
            }
            if($('#gold-uploads img').length >3){
                alert('错误：此处图片文件最多可上传4张');
                return false;
            }
        },
        onComplete: function(file, json) {
            if(json.code=1) {
                var _html = '<div class="uploads-thumb">';
                _html += '<img title="'+json.upload['origin']+'" data-entry="invoice" data-name="'+json.upload['origin']+'" data-path="'+json.upload['path']+'"  src="'+getImgURL(HTTP_SERVER+json.upload['path'])+'">';
                _html += '<a href="javascript:;" onclick="$(this).parent().remove();">删除</a>';
                _html += '</div>';
                $('#gold-uploads').append(_html);

            }else{
                alert(json.error);
            }
            $('.loading').remove();
        }
    });
    new AjaxUpload('#button-report', {
        action: '/tool/filemanager/upload',
        name: 'uploads',
        data: { date_path : true,'encrypt' : true },
        autoSubmit: false,
        responseType: 'json',
        onChange: function(file, extension) {this.submit();},
        onComplete: function(file, json) {
            if(json.code=1) {
                var _html = '<div class="uploads-thumb">';
                _html += '<img title="'+json.upload['origin']+'" data-entry="report" data-name="'+json.upload['origin']+'" data-path="'+json.upload['path']+'"  src="'+getImgURL(HTTP_SERVER+json.upload['path'])+'">';
                _html += '<a href="javascript:;" onclick="$(this).parent().remove();">删除</a>';
                _html += '</div>';
                $('#report-uploads').append(_html);
            }else{
                alert(json.error);
            }
            $('.loading').remove();
        }
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
                _html += '<img title="'+json.upload['origin']+'" data-entry="privacy" data-name="'+json.upload['origin']+'" data-path="'+json.upload['path']+'"  src="'+getImgURL(HTTP_SERVER+json.upload['path'])+'">';
                _html += '<a href="javascript:;" onclick="$(this).parent().remove();">删除</a>';
                _html += '</div>';
                $('#privacy-uploads').append(_html);
            }else{
                alert(json.error);
            }
            $('.loading').remove();
        }
    });
    <?php if(false) :?>
    $('#appraiser').autocomplete({
        delay: 300,
        source: function(request, response) {
            $.ajax({
                url: '/auth/worker/autocomplete',
                data:{r:Math.random(),filter_role:'appraiser',filter_name:request.term},
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
            $('input[name="appraiser"]').val(ui.item.value);
            console.log(ui.item.value);
            return false;
        }
    });
    <?php endif?>
    $('#referrer').autocomplete({
        delay: 300,
        source: function(request, response) {
            $.ajax({
                url: '/auth/worker/autocomplete',
                data:{r:Math.random(),filter_role:'member',filter_name:request.term},
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
            $('input[name="referrer"]').val(ui.item.value)
            return false;
        }
    });
    $('#phone,#realname,#idnumber').autocomplete({
        delay: 300,
        source: function(request, response) {
            $.ajax({
                url: '/project/customer/autocomplete',
                data:{filter_name:request.term},
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item.name+' '+ item.phone +' '+item.idnumber,
                            value: item.value,
                            realname: item.name,
                            phone: item.phone,
                            idnumber: item.idnumber,
                            wechat: item.wechat,
                            referrer: item.referrer,
                            referrer_id: item.referrer_id,
                        }
                    }));
                }
            });
        },
        select: function(e,ui) {
            $('#phone').val(ui.item.phone);
            $('#realname').val(ui.item.realname);
            $('#idnumber').val(ui.item.idnumber);
            $('#wechat').val(ui.item.wechat);
            $('#referrer').val(ui.item.referrer);
            $('input[name="referrer"]').val(ui.item.referrer_id)
            return false;
        }
    });
    <?php endif ?>
</script>

