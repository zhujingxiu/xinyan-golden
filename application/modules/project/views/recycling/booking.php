<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/29 0029
 * Time: 12:35
 */
?>
<div class="col-sm-12" style="padding-top:10px; ">
	<?php echo form_open('/project/recycling/booked',array('id' => "form-booking", 'class'=>'form-horizontal'))?>

	<?php echo form_hidden($csrf)?>
	<div class="col-sm-12">
		<div class="form-group">
			<ul class="timeline timeline-inverse" id="timeline-box">
				<li class="time-label">
					<span class="bg-green"> 登记项目 </span>
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
										<select class="form-control" name="type">
											<option value="0">金条</option>
											<option value="1">金饰</option>
										</select>
									</div>
								</div>

							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">黄金克重</span>
										<input type="text" name="origin_weight" class="form-control">
										<span class="input-group-addon">克</span>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">黄金件数</span>
										<input type="text" name="number" class="form-control">
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
							<div class="upload-file" id="gold-uploads"></div>
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
										<input type="text" id="appraiser" class="form-control">
										<input type="hidden" name="appraiser" >
									</div>
								</div>

							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">鉴定实重</span>
										<input type="text" name="weight" class="form-control">
										<span class="input-group-addon">克</span>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">损耗比例</span>
										<input type="text" name="loss" class="form-control">
										<span class="input-group-addon">%</span>
									</div>
								</div>
							</div>
						</div>
						<div class="timeline-footer">
							<a class="btn btn-primary btn-xs" id="button-report">
								<i class="fa fa-upload"></i> 鉴定报告
							</a>
							<div class="upload-file" id="report-uploads"></div>
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
										<input id="realname" type="text" name="realname" class="form-control" />
									</div>
								</div>

							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">手机号码</span>
										<input id="phone" type="text" name="phone" class="form-control" />
									</div>
								</div>

							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">推荐人</span>
										<input type="text" id="referrer" class="form-control" />
										<input type="hidden" name="referrer"  />
									</div>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">身份证号</span>
										<input id="idnumber" type="text" name="idnumber" class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">微信账号</span>
										<input type="text" name="wechat" class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="timeline-footer" style="clear: both;">
							<a class="btn btn-primary btn-xs" id="button-privacy">
								<i class="fa fa-upload"></i> 客户同意书
							</a>
							<div class="upload-file" id="privacy-uploads"></div>
						</div>
					</div>

				</li>
				<li>
					<i class="fa fa-edit bg-blue"></i>
					<div class="timeline-item">
						<h3 class="timeline-header">项目备注</h3>
						<div class="timeline-body">
							<?php if(false): ?><script type="text/plain" id="editor" style="height:80px;"></script><?php endif ?>
							<textarea class="form-control" name="editorValue" placeholder="填写出库备注"></textarea>
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

		$("#form-booking").validate({
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
				realname: {
					required : true,
					isChinese : true
				},
				phone: {
					required : true,
					isMobile :true
				},
				idnumber: {
					required : true,
					isIdCardNo : true
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
				realname:{
					required : '真实姓名必须',
					isChinese :'请输入中文字符'
				},
				phone:{
					required:'手机号码必须',
					isMobile : '请输入有效的手机号码'
				},
				idnumber:{
					required:'身份证号码必须',
					isIdCardNo : '请输入正确的身份证号码'
				}
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
							//location.reload()
						}
					}
				});
			}
		});
	});

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
				_html += '</div>';
				$('#privacy-uploads').append(_html);
			}else{
				alert(json.error);
			}
			$('.loading').remove();
		}
	});

	$('#appraiser').autocomplete({
		delay: 300,
		source: function(request, response) {
			$.ajax({
				url: '/auth/worker/autocomplete',
				data:{filter_role:'appraiser',filter_name:request.term},
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
</script>

