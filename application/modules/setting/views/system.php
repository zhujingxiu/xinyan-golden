<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016/9/2
 * Time: 21:20
 */
?>
<?php defined('BASEPATH') OR exit('No direct script access allowed');?>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        系统参数设置
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url()?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>
        <li class="active">系统参数设置</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">项目初始参数</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#site" data-toggle="tab">站点参数</a></li>
                            <li ><a href="#cron" data-toggle="tab">定时任务</a></li>
                        </ul>
                        <div class="tab-content">
                            <?php echo form_open('', array('class'=>'form-horizontal setting-system-form' ))?>
                            <div class="tab-pane active" id="site">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <div class="form-group clearfix">
                                            <label for="inputSite" class="control-label col-sm-4 text-right">站点名称</label>
                                            <div class="col-sm-8">
                                                <input type="text" name="site_name" class="form-control" id="inputSite" value="<?php echo empty($setting['site_name'])? '' :$setting['site_name']  ?>"/>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="inputTitle" class="control-label col-sm-4 text-right">站点标题</label>
                                            <div class="col-sm-8">
                                                <input type="text" name="site_title" class="form-control" id="inputTitle" value="<?php echo empty($setting['site_title'])? '' :$setting['site_title']  ?>"/>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="inputKeywords" class="control-label col-sm-4 text-right">SEO Keywords</label>
                                            <div class="col-sm-8">
                                                <input type="text" name="site_keywords" class="form-control" id="inputKeywords" value="<?php echo empty($setting['site_keywords'])? '' :$setting['site_keywords']  ?>"/>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="inputDescription" class="control-label col-sm-4 text-right">SEO Description</label>
                                            <div class="col-sm-8">
                                                <input type="text" name="site_description" class="form-control" id="inputDescription" value="<?php echo empty($setting['site_description'])? '' :$setting['site_description']  ?>"/>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="inputEmail" class="control-label col-sm-4 text-right">站点Email

                                            </label>
                                            <div class="col-sm-8">
                                                <input type="text" name="site_email" class="form-control" id="inputEmail" value="<?php echo empty($setting['site_email'])? '' :$setting['site_email']  ?>"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-7">
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="cron">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <div class="form-group clearfix">
                                            <label for="inputEmail" class="control-label col-sm-4 text-right">定时任务间隔时长</label>
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <input type="text" name="cron_interval" class="form-control" id="inputEmail" value="<?php echo empty($setting['cron_interval'])? '' :$setting['cron_interval']  ?>"/>
                                                    <span class="input-group-addon">秒</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="inputEmail" class="control-label col-sm-4 text-right">定时任务密钥</label>
                                            <div class="col-sm-8">
                                                <input type="text" name="cron_encrypt" class="form-control" id="inputEmail" value="<?php echo empty($setting['cron_encrypt'])? '' :$setting['cron_encrypt']  ?>"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-7">
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->

                            <?php echo form_close()?>
                        </div>
                        <!-- /.tab-content -->
                    </div>
                </div>
                <!-- /.box-body -->
            </div>

            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->

<script type="text/javascript">
    seajs.use('setsystem', function (sp) {
    });
</script>

