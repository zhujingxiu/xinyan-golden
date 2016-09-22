<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/29 0029
 * Time: 12:35
 */
?>
<div class="col-sm-12" style="padding-top:10px; ">
	<?php echo form_open('/project/customer/renew',array('id' => "form-appling", 'class'=>'form-horizontal'))?>
	<?php echo form_hidden($csrf)?>
	<?php echo form_hidden('customer_id',$customer_id)?>
	<?php echo form_hidden('card_serial',$card_serial)?>
	<div class="col-sm-12">
		<div class="form-group">
			<ul class="timeline timeline-inverse" id="timeline-box">
				<li>
					<i class="fa fa-diamond bg-orange-active"></i>
					<div class="timeline-item">
						<h3 class="timeline-header">黄金信息</h3>
						<div class="timeline-body" style="clear: both">

							<div class="col-sm-6">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">续存周期</span>
										<select class="form-control select2" name="period_id">
											<?php foreach($periods as $item):?>
											<option data-profit="<?php echo calculate_rate($item['profit'],$item['month']);?>" value="<?php echo $item['period_id']?>" <?php echo $item['default'] ? 'selected':''?>><?php echo $item['title']?></option>
											<?php endforeach?>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
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

							<div class="col-sm-6">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">续存实重</span>
										<input type="text" name="weight" class="form-control" value="<?php echo $available?>">
										<span class="input-group-addon">克</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">预期收益</span>
										<span class="form-control" id="renew-totals"></span>
										<span class="input-group-addon">克</span>
									</div>
								</div>
							</div>

						</div>
						<div class="timeline-footer">
							<a class="btn btn-success btn-flat btn-xs">可续存克重 <?php echo number_format($available,2).lang('text_weight_unit')?></a>
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
										<span class="form-control"><?php echo $phone;?></span>
									</div>
								</div>

							</div>
							<div class="col-sm-4">
								<div class="form-group clearfix">
									<div class="input-group col-sm-12">
										<span class="input-group-addon"><?php echo lang('text_referrer')?></span>
										<span class="form-control"><?php echo $referrer?></span>
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
								<span class="input-group-addon">确认入库标记</span>
							</div>

							<textarea class="form-control" name="editorValue" placeholder="填写入库备注"></textarea>
						</div>
					</div>
				</li>
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

		$("#form-appling").validate({
			rules : {
				weight: {
					required : true,
					isFloatGtZero : true,
					maxFloat:<?php echo $available?>
				},
			},
			messages : {

				weight : {
					required : '请输入鉴定实重',
					isFloatGtZero: "请输入有效的数字",
					maxFloat:'不可大于<?php echo $available?>'
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
							location.reload();
						}else {
							var l = require('layout');
							l.render_message(json.msg, json.title);
						}
					}
				});
			}
		});
		$('#form-appling input[name="weight"]').bind('keyup blur', function () {
			var _period = $('#form-appling select[name="period_id"]');
			var _profit = parseFloat(_period.find('option[value="'+_period.val()+'"]').data('profit'),4);
			var _weight = $(this).val();
			if(!$.isNumeric(_profit)){
				layer.tips('数据异常',$('#form-appling #renew-totals'),{tips: [1, '#CC6666']});
				return false;
			}
			if(!$.isNumeric(_weight)){
				//layer.tips('数据异常',$('#form-appling #renew-amount'),{tips: [1, '#CC6666']});
				return false;
			}else{
				$('#form-appling #renew-totals').text(parseFloat(math_mul(_weight,_profit)).toFixed(2));

			}
		});
		$('#form-appling select[name="period_id"]').bind('change', function () {
			var _profit = parseFloat($(this).find('option[value="'+$(this).val()+'"]').data('profit'),4);
			var _weight = $('#form-appling input[name="weight"]').val();
			if(_weight!='' && $.isNumeric(_profit)){
				$('#form-appling #renew-totals').text(parseFloat(math_mul(_weight,_profit)).toFixed(2));
			}
		});
		$('#form-appling select[name="period_id"]').trigger('change');
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

</script>

