<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/29 0029
 * Time: 12:35
 */
?>
<div class="col-sm-12" style="padding-top:10px; ">
	<?php echo form_open('/project/stock/renew',array('id' => "form-renew", 'class'=>'form-horizontal'))?>
	<?php echo form_hidden($csrf)?>
	<input type="hidden" name="_weight" id="confirm_weight" value="<?php echo $weight;?>">
	<input type="hidden" name="_phone" id="confirm_phone" value="<?php echo $phone;?>">
	<?php echo form_hidden('apply_id',$apply_id)?>
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
										<span class="form-control"><?php echo $month.lang('text_period_unit').' '.lang('text_profit').calculate_profit($profit,$month).lang('text_profit_unit');?> </span>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">交付方式</span>
										<span class="form-control"><?php echo $payment?></span>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">续存实重</span>
										<span class="form-control"><?php echo $weight?></span>
										<span class="input-group-addon">克</span>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group clearfix">
									<div class="input-group col-sm-11">
										<span class="input-group-addon">预期收益</span>
										<span class="form-control" id="renew-totals"><?php echo number_format(($profit*$weight),2)?></span>
										<span class="input-group-addon">克</span>
									</div>
								</div>
							</div>

						</div>
						<div class="timeline-footer">
							&nbsp;
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
							<a class="btn btn-primary btn-xs" id="button-upload">
								客户续存同意书
							</a>
							<div class="upload-file" id="uploads">
								<?php if($privacies): ?>
									<?php foreach($privacies as $item):?>
										<div class="uploads-thumb">
											<img title="<?php echo $item['name'];?>" data-name="<?php echo $item['name'];?>" data-path="<?php echo $item['path'];?>"  src="<?php echo base_url(get_image_url($item['path']));?>">
											<?php echo download_link($item['path'],'下载')?>
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
							<div class="input-group">
								<span class="input-group-addon" ><b> 确认手机 </b></span>
								<input type="text" name="phone" class="form-control" placeholder="确认客户手机">
								<span class="input-group-addon" ><b> 确认重量 </b></span>
								<input class="form-control" name="weight" type="text" placeholder="确认申请续存重量" >
								<span class="input-group-addon">克</span>
							</div>
							<div class="input-group col-sm-12">
								<span class="input-group-addon"><?php echo lang('text_transferrer')?></span>
								<span class="form-control"><?php echo $operator?></span>
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

		$("#form-renew").validate({
			rules : {
				weight : {
					required : true,
					equalTo: '#confirm_weight'
				},
				phone: {
					required : true,
					isMobile :true,
					equalTo: '#confirm_phone'
				},
			},
			messages : {
				weight : {
					required : '请输入续存克重',
					equalTo: "与该项目续存克重不相符"
				},
				phone:{
					required:'手机号码必须',
					isMobile : '请输入有效的手机号码',
					equalTo: "与客户申请的手机号码不相符"
				},
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
							location.reload();
						}else {
							var l = require('layout');
							l.render_message(json.msg, json.title);
						}
					}
				});
			}
		});

	});

</script>

