<div id="form-result" class="do-result"></div>
<div class="col-sm-12" style="padding-top:10px; ">
	<?php echo form_open_multipart('/article/article/save',array('id' => "form-article"))?>
	<?php echo form_hidden('article_id',$article_id)?>
		<div class="col-sm-12">
			<div class="row form-group clearfix col-sm-9">
				<div class="row col-sm-12">
					<input type="text" name="title" class="form-control" placeholder="标题" value="<?php echo $title?>" data-toggle="tooltip" title="输入文章标题" data-placement="bottom">
				</div>
			</div>
			<div class="form-group clearfix col-sm-3">
				<div class="col-sm-12 text-right">
					<label for=""><input type="checkbox" name="is_top" value="1" data-toggle="tooltip" data-placement="left" title="是否置顶"> 置顶</label>
				</div>
			</div>
		</div>
		<div class="col-sm-12">
			<div class="row form-group clearfix col-sm-6">

				<div class="row col-sm-12">
					<select name="category_id" class="form-control" data-toggle="tooltip" title="选择一个文章分类" data-placement="right" style="width: 220px;">
						<option value="0" class="text-center"> -- 请选择一个分类 -- </option>
						<?php foreach ($categories as $item): ?>
						<option value="<?php echo $item['category_id'] ?>" <?php echo $item['category_id'] == $category_id ? 'selected' :'' ?>>
							<?php echo $item['title']?>
						</option>
						<?php endforeach ?>
					</select>
				</div>
			</div>
			<div class="form-group clearfix col-sm-6">
				<div class="col-sm-12 text-right">
					<label for=""><input type="radio" name="status" value="1" <?php echo is_null($status) ||$status ? 'checked' : ''?>> 激活可用</label>
					&nbsp; &nbsp;
					<label for="" <?php echo $status ==0 ? 'style="color:#CC6600;"' : ''?>><input type="radio" name="status" value="0" <?php echo  $status ==0 ? 'checked="checked" ' : ''?>	> 暂不使用</label>
				</div>
			</div>

		</div>
		<div class="form-group clearfix">
			<div class="col-sm-12">
				<script type="text/plain" id="editor" style="height:460px;"></script>
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

		$("#form-article").validate({
			rules : {

				title : {
					required : true,
					minlength : 2,
					maxlength : 32,
				},
				category_id : {
					required : true,
					digits:true,
					min:1
				},
			},
			messages : {

				title : {
					required : '请输入文章名称',
					minlength : '文章名称不得少于2个字符。',
					maxlength : '文章名称不得大于32个字符。'
				},
				category_id : {
					required : '请选择文章分类',
					min:'请选择一个有效的文章分类'
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
				'|','insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc','|','formatmatch', 'autotypeset', 'blockquote', 'pasteplain',
				'|', 'forecolor', 'backcolor',
				'|','justifyleft','justifycenter','justifyright','justifyjustify'],
			[ 'link','unlink','emotion','|','horizontal','preview' ]
		]
		<?php if(!empty($text)):?>
		,initialContent:'<?php echo htmlspecialchars_decode($text)?>'
		<?php endif?>
		});
	editor.render('editor');


</script>