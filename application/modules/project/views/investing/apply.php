<div id="form-result" class="do-result"></div>
<div class="col-sm-12" style="padding-top:10px; ">
	<?php echo form_open_multipart('/project/investing/create',array('id' => "form-investing", 'class'=>'form-horizontal'))?>
		<div class="col-sm-12">
			<fieldset>
				<legend>黄金信息</legend>
				<div class="col-sm-4">
					<div class="form-group clearfix">
						<div class="input-group col-sm-11">
							<span class="input-group-addon">预购周期</span>
							<select name="period" class="form-control">
								<option value="3">3个月</option>
								<option value="6">6个月</option>
								<option value="9">9个月</option>
								<option value="12">12个月</option>
								<option value="18">18个月</option>
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
				<div class="col-sm-5">
					<div class="form-group clearfix">
						<div class="input-group col-sm-11">
							<span class="input-group-addon">应付金额</span>
							<input type="text" name="amount" readonly="readonly" class="form-control" style="color:#CC9900;font-weight: bold;">
							<span class="input-group-addon">元</span>
						</div>
					</div>
					<div class="form-group clearfix">
						<div class="input-group col-sm-11">
							<span class="input-group-addon">预期收益</span>
							<input type="text" name="total" readonly="readonly" class="form-control" style="color:#CC9900;font-weight: bold;">
							<span class="input-group-addon">克</span>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group clearfix">
						<div class="input-group col-sm-12">
							<span class="input-group-addon">金价</span>
							<input type="text" name="price" readonly="readonly" class="form-control" style="color:#CC9900;font-weight: bold;">
							<span class="input-group-addon">元/克</span>
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
							<span class="input-group-addon">客户姓名</span>
							<input type="text" name="realname" class="form-control" placeholder="客户的真实姓名">
						</div>
					</div>

					<div class="form-group clearfix">
						<div class="input-group col-sm-11">
							<span class="input-group-addon">&nbsp;推&nbsp;荐&nbsp;人</span>
							<input type="text" name="referrer" class="form-control">
						</div>
					</div>
				</div>
				<div class="col-sm-5">
					<div class="form-group clearfix">
						<div class="input-group col-sm-11">
							<span class="input-group-addon">身份证号</span>
							<input type="text" name="idnumber" class="form-control" placeholder="二代身份证号码">
						</div>
					</div>
					<div class="form-group clearfix">
						<div class="input-group col-sm-11">
							<span class="input-group-addon">微信账号</span>
							<input type="text" name="wechat" class="form-control">
						</div>

					</div>
				</div>
				<div class="col-sm-3">
					<div class="form-group clearfix">

						<div class="input-group col-sm-12">
							<span class="input-group-addon">手机</span>
							<input type="text" name="phone" class="form-control" placeholder="客户的手机号码">
						</div>
					</div>
				</div>
			</fieldset>
		</div>

		<div class="col-sm-12">
			<fieldset>
				<legend>项目备注</legend>
				<div class="form-group clearfix">
					<script type="text/plain" id="editor" style="height:120px;margin:0px 20px;"></script>
				</div>
			</fieldset>
		</div>
		<?php if($privacy) : ?>
		<div class="col-sm-12">
			<fieldset>
				<legend></legend>
				<div class="pull-right">
					<input type="checkbox" name="agree" value="1" checked>
					<?php echo $agree;?>
				</div>
			</fieldset>
		</div>
		<?php endif ?>
	<?php echo form_close();?>
</div>

<script type="text/javascript">
	var profit = '<?php echo $profit;?>';
	$(function () {

		$.get('/tool/api/golden_price',{gType:'current'}, function (json) {
			if(json.code==1)
				$('#form-investing input[name="price"]').val(json.current);
		},'json')
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

		$("#form-investing").validate({
			rules : {
				price : {
					required : true
				},
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
				price : {
					required : '数据有误，请刷新重试',
				},
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
						success: function (json) {
							if(json.code==1){
								location.reload()
							}
						}
					}
				);
			}
		});

		$('#form-investing input[name="weight"]').bind('keyup', function () {
			var _w = $(this).val(),_p = $('#form-investing input[name="price"]').val(),_t = $('#form-investing select[name="period"]').val();
			if(parseFloat(_p,2)*100 <100){
				layer.tips('数据异常',$('#form-investing input[name="price"]'),{tips: [1, '#CC6666']});
				return false;
			}
			if(parseFloat(_w,2)*100 < 100){
				//layer.tips('数据异常',$('#form-investing input[name="amount"]'),{tips: [1, '#CC6666']});
				return false;
			}else{
				do_amount(_w,_p);
				do_total(_w,_t);
			}
		});
		$('#form-investing select[name="period"]').bind('change', function () {
			var _w = $('#form-investing input[name="weight"]').val(),_t = $(this).val();
			if(parseFloat(_w,2)*100 < 100) {
				return false;
			}
			do_total(_w, _t);
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

	function do_amount(weight,price)
	{
		$('#form-investing input[name="amount"]').val(parseFloat(math_mul(weight,price),2));
	}

	function do_total(weight,period)
	{
		var _income = math_mul(math_mul(profit,period),weight);
		$('#form-investing input[name="total"]').val(parseFloat(math_add(weight,_income),4));
	}

</script>