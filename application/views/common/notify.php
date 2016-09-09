<div id="form-result" class="do-result"></div>
<div class="col-sm-12" style="padding-top:10px; ">
	<?php echo form_open('/home/notification',array('id' => "form-notify"))?>
		<div class="form-group clearfix">
			<label for="" class=" col-sm-2">标题</label>
			<div class="col-sm-10">
				<input type="text" name="title" class="form-control" placeholder="标题">
			</div>
		</div>

		<div class="form-group clearfix">
			<label for="" class=" col-sm-2">成员</label>
			<div class="col-sm-10">
				<select class="form-control select2" id="members">
					<option value="0">全体员工</option>
					<?php foreach ($groups as $item): ?>
						<?php if($item['code']=='admin') continue;?>
					<option value="<?php echo $item['id'] ?>" >
						<?php echo $item['title']?>
					</option>
					<?php endforeach ?>
				</select>
				<div class="members">

				</div>
			</div>
		</div>
		<div class="form-group clearfix">
			<label for="" class=" col-sm-2">内容</label>
			<div class="col-sm-10">
				<script type="text/plain" id="editor" style="height:180px;"></script>
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
			['fullscreen', 'source', 'undo', 'redo',
				'|','bold', 'italic', 'underline', 'fontborder',  'strikethrough','|', 'superscript', 'subscript', 'removeformat',
				'|','insertorderedlist', 'insertunorderedlist', 'selectall', '|','blockquote', 'pasteplain',
				'|', 'forecolor', 'backcolor',
				'|','justifyleft','justifycenter','justifyright','justifyjustify',
				'|','horizontal','preview'
			]
		]

		});
	editor.render('editor');

	$('#members').bind('click', function () {

	})
</script>