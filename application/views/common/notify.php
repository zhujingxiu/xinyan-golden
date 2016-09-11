<div id="form-result" class="do-result"></div>
<div class="col-sm-12" style="padding-top:10px; ">
	<?php echo form_open('/home/notification',array('id' => "form-notify"))?>
		<div class="form-group clearfix">

			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">@</span>
					<select name="member[]" class="form-control select2 " multiple id="members" style="height: 320px;">
						<option value="0" selected>全体员工</option>
						<?php foreach ($groups as $item): ?>
							<?php if($item['code']=='admin') continue;?>
							<optgroup label="<?php echo $item['title'] ?>" >
							<?php if(is_array($item['member'])):?>
								<?php foreach ($item['member'] as $worker): ?>
									<?php if($worker['id'] == $worker_id) continue;?>
								<option value="<?php echo $worker['id']?>"><?php echo $worker['realname']?></option>
								<?php endforeach ?>
							<?php endif?>
							</optgroup>
						<?php endforeach ?>
					</select>
				</div>

			</div>
			<div class="col-sm-9">
				<div class="input-group">
					<span class="input-group-addon">标题</span>
					<input type="text" name="title" class="form-control" placeholder="标题">
				</div>
				<div class="input-group">
					<script type="text/plain" id="editor" style="margin-top:20px;height:200px;"></script>
				</div>
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

		$("#form-notify").validate({
			rules : {
				title : {
					required : true,
					minlength : 2,
					maxlength : 32,
				},
			},
			messages : {
				title : {
					required : '请输入通知标题',
					minlength : '通知标题不得少于2个字符。',
					maxlength : '通知标题不得大于32个字符。'
				}
			},
			//提交
			submitHandler : function(form){
				$(form).ajaxSubmit({
					dataType:'json',
					success: function (json) {
						if(json.code==1){
							layer.msg(json.msg, {
								icon: 1,
								time: 2000 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
								location.reload()
							});

						}
					}
				}
				);
			}
		});
	});
	var editor =  new UE.ui.Editor({

		toolbars: [
			[ 'undo', 'redo',
				'|','bold', 'italic', 'underline', 'fontborder',  'strikethrough','|', 'superscript', 'subscript',
				'|','insertorderedlist', 'insertunorderedlist', 'blockquote',
				'|', 'forecolor', 'backcolor',
				'|','justifyleft','justifycenter','justifyright','justifyjustify'
			]
		]

		});
	editor.render('editor');

	$('#members').bind('click', function () {

	})
</script>