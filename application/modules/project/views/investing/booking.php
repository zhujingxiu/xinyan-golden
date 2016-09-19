<div id="form-result" class="do-result"></div>
<div class="col-sm-12" style="padding-top:10px; ">
	<?php echo form_open('/project/investing/booked',array('id' => "form-booking", 'class'=>'form-horizontal'))?>
		<?php echo form_hidden($csrf)?>
		<div class="col-sm-12">
			<fieldset>
				<legend>黄金信息</legend>
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
					<div class="form-group clearfix">
						<div class="input-group col-sm-11">
							<span class="input-group-addon">预购重量</span>
							<input type="text" name="weight" class="form-control" placeholder="最小为1克">
							<span class="input-group-addon">克</span>
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

					<div class="form-group clearfix">
						<div class="input-group col-sm-11">
							<span class="input-group-addon">应付金额</span>
							<span id="booking-amount" class="form-control" style="color:#CC9900;font-weight: bold;"></span>
							<span class="input-group-addon">元</span>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group clearfix">
						<div class="input-group col-sm-12">
							<span class="input-group-addon">实时金价</span>
							<span class="form-control _highlight" style=""><?php echo $price ?> 元/克</span>
						</div>
					</div>
					<div class="form-group clearfix">
						<div class="input-group col-sm-12">
							<span class="input-group-addon">预期收益</span>
							<span class="form-control _highlight" id="booking-totals"></span>
							<span class="input-group-addon">克</span>
						</div>
					</div>
				</div>
			</fieldset>
		</div>
		<div class="col-sm-12">
			<fieldset>
				<legend>客户信息</legend>
				<div class="col-sm-4">

					<div class="form-group clearfix">
						<div class="input-group col-sm-11">
							<span class="input-group-addon">手机号码</span>
							<input id="phone" type="text" name="phone" class="form-control" placeholder="客户的手机号码">
						</div>
					</div>

				</div>
				<div class="col-sm-8">
					<div class="form-group clearfix">
						<div class="input-group col-sm-12">
							<span class="input-group-addon">身份证号</span>
							<input id="idnumber" type="text" name="idnumber" class="form-control" placeholder="二代身份证号码">
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group clearfix">
						<div class="input-group col-sm-11">
							<span class="input-group-addon">客户姓名</span>
							<input id="realname" type="text" name="realname" class="form-control" placeholder="客户的真实姓名">
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
							<input id="wechat" type="text" name="wechat" class="form-control">
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div class="form-group clearfix">
						<div class="input-group col-sm-12">
							<span class="input-group-addon">客户同意认购书</span>
							<span id="uploads" class="form-control" placeholder="上传客户确认书或认购合同"></span>
							<span class="input-group-addon" ><a href="javascript:;" id="button-upload"><i class="fa fa-upload"></i> </a> </span>
						</div>
					</div>
				</div>
			</fieldset>
		</div>

		<div class="col-sm-12">
			<fieldset>
				<legend>项目备注</legend>
				<div class="col-sm-12">
					<div class="form-group clearfix">
						<div class="input-group col-sm-12">
							<span class="input-group-addon"><?php echo lang('text_transferrer')?></span>
							<select name="transferrer" class="form-control select2">
								<?php foreach($transferrers as $item):?>
									<option value="<?php echo $item['id']?>" ><?php echo $item['realname']?></option>
								<?php endforeach?>
							</select>
							<span class="input-group-addon">核实登记信息</span>
						</div>
						<textarea class="form-control" name="editorValue" placeholder="填写项目备注"></textarea>
					</div>
				</div>
			</fieldset>
		</div>

	<?php echo form_close();?>
</div>

<script type="text/javascript">
	var price='<?php echo $price;?>';
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

		$("#form-booking").validate({
			rules : {

				weight: {
					required : true,
					min:1
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

				weight : {
					required : '请输入购入克重',
					min:'最小购入克重不能小于1克'
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
				$(form).ajaxSubmit({
						dataType:'json',
						beforeSubmit:function(){
							layer.load();
						},
						success: function (json) {
							if(json.code==1){
								location.href = '<?php echo site_url('project/investing')?>'
							}
						}
					}
				);
			}
		});

		$('#form-booking input[name="weight"]').bind('keyup blur', function () {
			var _period = $('#form-booking select[name="period_id"]');
			var _profit = parseFloat(_period.find('option[value="'+_period.val()+'"]').data('profit'),4);
			var _weight = $(this).val();
			if(!$.isNumeric(price)){
				layer.tips('数据异常',$('#form-booking #booking-amount'),{tips: [1, '#CC6666']});
				return false;
			}
			if(!$.isNumeric(_profit)){
				layer.tips('数据异常',$('#form-update #update-totals'),{tips: [1, '#CC6666']});
				return false;
			}
			if(!$.isNumeric(_weight)){
				//layer.tips('数据异常',$('#form-booking #booking-amount'),{tips: [1, '#CC6666']});
				return false;
			}else{
				$('#form-booking #booking-amount').text(parseFloat(math_mul(_weight,price),2));
				$('#form-booking #booking-totals').text(parseFloat(math_mul(_weight,_profit),3));
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

	new AjaxUpload('#button-upload', {
		action: '/tool/filemanager/upload',
		name: 'uploads',
		data: { date_path : true,'encrypt' : true },
		autoSubmit: false,
		responseType: 'json',
		onChange: function(file, extension) {this.submit();},
		onComplete: function(file, json) {
			if(json.code=1) {
				$("#uploads").html(json.upload['origin'] + '<input type="hidden" name="privacy[]" value="'+json.upload['origin']+'|'+json.upload['path']+'">');
			}else{
				alert(json.error);
			}
			$('.loading').remove();
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