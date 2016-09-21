<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/9/6 0006
 * Time: 15:53
 */
?>
<div class="col-sm-12" style="padding-top:10px; ">
    <?php echo form_open('/project/investing/detail',array('id' => "form-detail", 'class'=>'form-horizontal'))?>

    <div class="col-sm-12">
        <div class="form-group">
            <ul class="timeline timeline-inverse" id="timeline-box">
                <li class="time-label">
                    <span class="bg-light-blue-active"> 登记信息 </span>
                </li>
                <li>
                    <i class="fa fa-diamond bg-orange-active"></i>
                    <div class="timeline-item">
                        <h3 class="timeline-header">黄金信息</h3>
                        <div class="timeline-body">
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">买入价格</span>
                                        <span class="form-control _highlight"><?php echo $price;?>元/克</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">交付方式</span>
                                        <span class="form-control" name="payment"><?php echo $payment == 'cash' ? lang('text_cash') : lang('text_gold')?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-12">
                                        <span class="input-group-addon">存入周期</span>
                                        <span class="form-control"><?php echo $month.lang('text_period_unit').' '.lang('text_profit').calculate_profit($profit,$month).lang('text_profit_unit');?> </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">买入重量</span>
                                        <span class="form-control"><?php echo $weight;?> 克</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">应付金额</span>
                                        <span id="checking-amount " class="form-control _highlight" ><?php echo $amount;?>元</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-12">
                                        <span class="input-group-addon">到期收益</span>
                                        <span class="form-control _highlight" id="update-totals"><?php echo $profit_weight?>克</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-footer">&nbsp;</div>
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
                                        <span class="form-control"><?php echo $phone?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-12">
                                        <span class="input-group-addon">身份证号</span>
                                        <span class="form-control"><?php echo $idnumber;?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon">客户姓名</span>
                                        <span class="form-control"><?php echo $realname;?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-11">
                                        <span class="input-group-addon"><?php echo lang('text_referrer')?></span>
                                        <span class="form-control"><?php echo $referrer;?></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">

                                <div class="form-group clearfix">
                                    <div class="input-group col-sm-12">
                                        <span class="input-group-addon">微信账号</span>
                                        <span class="form-control"><?php echo $wechat ?></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="timeline-footer">

                            <a class="btn btn-primary btn-xs" id="button-report">
                                客户同意认购书
                            </a>
                            <div class="upload-file" id="gold-uploads">

                                <?php if($privacies): ?>
                                    <?php foreach($privacies as $item):?>
                                        <div class="uploads-thumb">
                                            <img title="<?php echo $item['name'];?>" src="<?php echo base_url(get_image_url($item['path']));?>">
                                            <?php echo download_link($item['path'],'下载')?>
                                        </div>
                                    <?php endforeach?>
                                <?php endif?>
                            </div>
                        </div>

                    </div>
                </li>

                <li class="time-label">
                    <span class="bg-purple"> 状态变更 </span>
                </li>
                <?php if(!empty($histories) && is_array($histories)): ?>
                    <?php foreach($histories as $item) :?>
                <li>
                    <i class="fa fa-user bg-aqua"></i>
                    <div class="timeline-item">
                        <span class="time">
                            <?php echo $item['status']?>
                            <i class="fa fa-clock-o"></i> <?php echo format_time($item['addtime'],true);?>
                        </span>
                        <h3 class="timeline-header no-border">
                            <a href="javascript:;" class="liveim">
                                <?php if(!empty($item['avatar']) && file_exists($item['avatar'])): ?>
                                    <img data-toggle="tooltip" src="<?php echo site_url($item['avatar'])?>" class="user-avatar" title="<?php echo $item['operator']?>" alt="<?php echo $item['operator']?>">
                                <?php else: ?>
                                    <?php echo $item['operator']?>
                                <?php endif?>
                            </a>
                            <small>&nbsp; <?php echo str_truncate(strip_tags(htmlspecialchars_decode($item['note'])));?></small>
                        </h3>
                    </div>
                </li>
                    <?php endforeach ?>
                <?php endif ?>
            </ul>
        </div>
    </div>
    <?php echo form_close();?>
</div>
