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
            <ul class="timeline" id="timeline-box">
                <li class="time-label">
                    <span class="bg-light-blue-active"> 登记信息 </span>
                </li>
                <li>
                    <i class="fa fa-diamond bg-orange-active"></i>
                    <div class="timeline-item">
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
                                    <span class="input-group-addon">买入价格</span>
                                    <span class="form-control" style="color:#CC9900;font-weight: bold;"><?php echo $price;?>元/克</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-12">
                                    <span class="input-group-addon">应付金额</span>
                                    <span id="checking-amount" class="form-control" style="color:#CC9900;font-weight: bold;"><?php echo $amount;?>元</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-12">
                                    <span class="input-group-addon">计息日期</span>
                                    <span class="form-control"><?php echo $start ?></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <i class="fa fa-user bg-green"></i>
                    <div class="timeline-item">
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
                                    <span class="input-group-addon">&nbsp;推&nbsp;荐&nbsp;人</span>
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
                        <div class="col-sm-12">
                            <div class="form-group clearfix">
                                <div class="input-group col-sm-12">
                                    <span class="input-group-addon">客户同意认购书</span>
                                    <span id="uploads" class="form-control" placeholder="上传客户确认书或认购合同">
                                        <?php if($privacies): ?>
                                            <?php foreach($privacies as $item):?>
                                                <?php echo download_link($item['path'],$item['name'],array('target'=>"_blank"));?> &nbsp; &nbsp;
                                            <?php endforeach?>
                                        <?php endif?>
                                    </span>
                                </div>
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

<script type="text/javascript">
    $(function () {
        $('#timeline-box').slimScroll({
            height: '560px'
        });
    });
</script>
