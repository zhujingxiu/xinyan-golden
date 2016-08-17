<div id="form-result" class="do-result"></div>
<div class="col-sm-12" style="padding-top:10px; ">
	<?php echo form_open_multipart('/project/investing/create',array('id' => "form-investing", 'class'=>'form-horizontal'))?>
		<div class="col-sm-6">
			<fieldset>
				<legend>黄金信息</legend>
				<div class="form-group clearfix">
					<label for="" class="control-label col-sm-3">实时金价</label>
					<div class="col-sm-6">
						<input type="text" name="price" readonly="readonly" class="form-control">
					</div>
				</div>
				<div class="form-group clearfix">
					<label for="" class="control-label col-sm-3">购买克重</label>
					<div class="col-sm-6">
						<input type="text" name="weight" class="form-control">
					</div>
				</div>
				
				<div class="form-group clearfix">
					<label for="" class="control-label col-sm-3">预购周期</label>
					<div class="col-sm-6">
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
					<label for="" class="control-label col-sm-3">应付金额</label>
					<div class="col-sm-6">
						<input type="text" name="amount" readonly="readonly" class="form-control">
					</div>
				</div>
				<div class="form-group clearfix">
					<label for="" class="control-label col-sm-3">到期总重</label>
					<div class="col-sm-6">
						<input type="text" name="total" readonly="readonly" class="form-control">
					</div>
				</div>
			</fieldset>
		</div>
		<div class="col-sm-6">
			<fieldset>
				<legend>客户信息</legend>
				<div class="form-group clearfix">
					<label for="" class="control-label col-sm-3">客户姓名</label>
					<div class="col-sm-9">
						<input type="text" name="realname" class="form-control" placeholder="请输入客户真实姓名">
					</div>
				</div>
				<div class="form-group clearfix">
					<label for="" class="control-label col-sm-3">手机号码</label>
					<div class="col-sm-9">
						<input type="text" name="phone" class="form-control">
					</div>
				</div>
				<div class="form-group clearfix">
					<label for="" class="control-label col-sm-3">身份证号</label>
					<div class="col-sm-9">
						<input type="text" name="idnumber" class="form-control">
					</div>
				</div>
				<div class="form-group clearfix">
					<label for="" class="control-label col-sm-3">微信账号</label>
					<div class="col-sm-9">
						<input type="text" name="wechat" class="form-control">
					</div>
				</div>
				<div class="form-group clearfix">
					<label for="" class="control-label col-sm-3">推荐人</label>
					<div class="col-sm-9">
						<input type="text" name="referrer" class="form-control">
					</div>
				</div>
			</fieldset>
		</div>
		<div class="form-group clearfix">
			<div class="col-sm-12" data-toggle="tooltip" title="项目备注" >
				<script type="text/plain" id="editor" style="height:120px;"></script>
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
				element.parent('div').find('.help-block').remove();
				element.parent('div').append(error);
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