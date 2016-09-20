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
				<li>
					<i class="fa fa-diamond bg-orange-active"></i>
					<div class="timeline-item">
						<h3 class="timeline-header">黄金信息</h3>
						<div class="timeline-body" style="clear: both">
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">黄金种类</span>
										<select class="form-control select2" name="type">
											<option value="ornaments">金饰</option>
											<option value="goldbar">金条</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">预存周期</span>
										<select class="form-control select2" name="period_id">
											<?php foreach($periods as $item):?>
											<option data-profit="<?php echo calculate_rate($item['profit'],$item['month']);?>" value="<?php echo $item['period_id']?>" <?php echo $item['default'] ? 'selected':''?>><?php echo $item['title']?></option>
											<?php endforeach?>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">交付方式</span>
										<select class="form-control select2" name="payment">
											<option value="gold">黄金</option>
											<option value="cash">现金</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">黄金称重</span>
										<input type="text" name="origin_weight" class="form-control">
										<span class="input-group-addon">克</span>
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
										<span class="input-group-addon"> 鉴 定 人 </span>
										<select id="appraiser" name="appraiser" class="form-control select2" >
											<?php foreach($appraisers as $item):?>
												<option value="<?php echo $item['id']?>" ><?php echo $item['realname']?></option>
											<?php endforeach?>
										</select>
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
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">预期收益</span>
										<span class="form-control" id="booking-totals"></span>
										<span class="input-group-addon">克</span>
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">损耗比例</span>
										<input type="text" name="loss" class="form-control" id="booking-loss" readonly>
										<span class="input-group-addon">%</span>
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
							<a class="btn btn-primary btn-xs" id="button-report">
								<i class="fa fa-upload"></i> 鉴定报告
							</a>
							<div class="upload-file" id="gold-uploads"></div>
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
										<input id="phone" type="text" name="phone" class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-sm-8">
								<div class="form-group clearfix">
									<div class="input-group col-sm-12">
										<span class="input-group-addon">身份证号</span>
										<input id="idnumber" type="text" name="idnumber" class="form-control" />
									</div>
								</div>
							</div>
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
										<span class="input-group-addon"><?php echo lang('text_referrer')?></span>
										<input type="text" id="referrer" class="form-control" />
										<input type="hidden" name="referrer"  />
									</div>
								</div>
							</div>

							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-12">
										<span class="input-group-addon">微信账号</span>
										<input id="wechat" type="text" name="wechat" class="form-control" />
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
						<div class="timeline-body">
							<div class="input-group col-sm-12">
								<span class="input-group-addon"><?php echo lang('text_transferrer')?></span>
								<select name="transferrer" class="form-control select2">
								<?php foreach($transferrers as $item):?>
									<option value="<?php echo $item['id']?>" ><?php echo $item['realname']?></option>
								<?php endforeach?>
								</select>
								<span class="input-group-addon">核实登记信息</span>
							</div>

							<textarea class="form-control" name="editorValue" placeholder="填写存金备注"></textarea>
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
							location.href = '<?php echo site_url('project/recycling')?>'
						}
					}
				});
			}
		});
		$('#form-booking input[name="weight"]').bind('keyup blur', function () {
			var _period = $('#form-booking select[name="period_id"]');
			var _profit = parseFloat(_period.find('option[value="'+_period.val()+'"]').data('profit'),4);
			var _weight = $(this).val();
			if(!$.isNumeric(_profit)){
				layer.tips('数据异常',$('#form-booking #booking-totals'),{tips: [1, '#CC6666']});
				return false;
			}
			if(!$.isNumeric(_weight)){
				//layer.tips('数据异常',$('#form-booking #booking-amount'),{tips: [1, '#CC6666']});
				return false;
			}else{
				$('#form-booking #booking-totals').text(parseFloat(math_mul(_weight,_profit),3));
				var _origin = $('#form-booking input[name="origin_weight"]').val();
				if($.isNumeric(_origin)){
					$('#form-booking #booking-loss').val(parseFloat(100.00-parseFloat(math_div(_weight,_origin),2)*100.00),2);
				}
			}
		});
		$('#form-booking select[name="period_id"]').bind('change', function () {
			var _profit = parseFloat($(this).find('option[value="'+$(this).val()+'"]').data('profit'),4);
			var _weight = $('#form-booking input[name="weight"]').val();
			if(_weight!='' && $.isNumeric(_profit)){
				$('#form-booking #booking-totals').text(parseFloat(math_mul(_weight,_profit),3));
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
				_html += '<img title="实物照片 '+json.upload['origin']+'" data-entry="photo" data-name="'+json.upload['origin']+'" data-path="'+json.upload['path']+'"  src="'+getImgURL(HTTP_SERVER+json.upload['path'])+'">';
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
				_html += '<img title="发票照片 '+json.upload['origin']+'" data-entry="invoice" data-name="'+json.upload['origin']+'" data-path="'+json.upload['path']+'"  src="'+getImgURL(HTTP_SERVER+json.upload['path'])+'">';
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
		onSubmit : function(file , ext){
			if (! (ext && /^(jpg|png|jpeg|gif|txt|doc|pdf|docx)$/.test(ext))){
				alert('错误：此处仅支持以下格式文件jpg、png、jpeg、gif、txt、pdf、doc、docx');
				return false;
			}
			if($('#gold-uploads img').length >3){
				alert('错误：此处文件最多可上传4张');
				return false;
			}
		},
		onComplete: function(file, json) {
			if(json.code=1) {
				var _html = '<div class="uploads-thumb">';
				_html += '<img title="鉴定报告 '+json.upload['origin']+'" data-entry="report" data-name="'+json.upload['origin']+'" data-path="'+json.upload['path']+'"  src="'+getImgURL(HTTP_SERVER+json.upload['path'])+'">';
				_html += '<a href="javascript:;" onclick="$(this).parent().remove();">删除</a>';
				_html += '</div>';
				$('#gold-uploads').append(_html);
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
				_html += '<img title="客户同意书 '+json.upload['origin']+'" data-entry="privacy" data-name="'+json.upload['origin']+'" data-path="'+json.upload['path']+'"  src="'+getImgURL(HTTP_SERVER+json.upload['path'])+'">';
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
	<?php endif?>
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
</script>

