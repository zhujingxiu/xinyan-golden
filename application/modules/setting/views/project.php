<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/16 0016
 * Time: 16:55
 */

?>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        业务参数设置
        <small></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url()?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>
        <li class="active">业务参数设置</li>
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
                            <li class="active"><a href="#investing" data-toggle="tab">钱生金</a></li>
                            <li><a href="#recycling" data-toggle="tab">金生金</a></li>

                            <li><a href="#tab_3" data-toggle="tab">其他</a></li>

                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="investing">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <filedset>
                                            <legend>项目状态</legend>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <table class="table table-border table-hover table-status">
                                                        <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>状态</th>
                                                            <th>标识</th>
                                                            <th>启用</th>
                                                            <th>说明</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="investing-list">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </filedset>

                                        <?php echo form_open('setting/project/save_status', array('id' =>'project-investing','class'=>'form-horizontal status-form' ))?>
                                        <?php echo form_hidden('status_id','')?>
                                        <?php echo form_hidden('mode','investing')?>
                                        <filedset>
                                            <legend>状态表单
                                                <div class="pull-right">
                                                    <button type="button" class="btn btn-primary btn-sm btn-new" data-mode="investing">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </legend>
                                            <div class="col-sm-12 do-result">
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">状态名称</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="title" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">标识</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="code" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">说明</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="note" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">是否启用</label>
                                                <div class="col-sm-10">
                                                    <label><input type="radio" name="status" value="1" checked>是</label>
                                                    <label><input type="radio" name="status" value="0">否</label>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <div class="col-sm-10 col-sm-offset-2">
                                                    <button type="button" form="project-investing" class="btn btn-primary btn-status">保存</button>
                                                </div>
                                            </div>
                                        </filedset>
                                        <?php echo form_close()?>

                                    </div>
                                    <div class="col-sm-7">
                                        <?php echo form_open('', array('class'=>'form-horizontal setting-project-form' ))?>
                                        <filedset>
                                            <legend>项目表单</legend>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">购金协议</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_privacy_in" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($privacies as $item): ?>
                                                            <option value="<?php echo $item['article_id']?>"
                                                                <?php echo (!empty($setting['investing_privacy_in']) && $setting['investing_privacy_in']== $item['article_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                                <label for="" class="control-label col-sm-2">提金协议</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_privacy_out" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($privacies as $item): ?>
                                                            <option value="<?php echo $item['article_id']?>"
                                                                <?php echo (!empty($setting['investing_privacy_out']) && $setting['investing_privacy_out']== $item['article_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="" class="control-label col-sm-2">初始状态</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_initial" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($investing_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['investing_initial']) && $setting['investing_initial']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                                <label for="" class="control-label col-sm-2">主管核实</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_checked" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($investing_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['investing_checked']) && $setting['investing_checked']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="" class="control-label col-sm-2">库管确认</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_confirmed" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($investing_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['investing_confirmed']) && $setting['investing_confirmed']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                                <label for="" class="control-label col-sm-2">项目到期</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_expired" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($investing_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['investing_expired']) && $setting['investing_expired']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="" class="control-label col-sm-2">申请提金</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_applied" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($investing_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['investing_applied']) && $setting['investing_applied']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                                <label for="" class="control-label col-sm-2">项目完结</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_finished" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($investing_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['investing_finished']) && $setting['investing_finished']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>

                                            </div>
                                            <div class="form-group ">
                                                <label for="" class="control-label col-sm-2">项目被拒绝</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_refused" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($investing_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['investing_refused']) && $setting['investing_refused']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                                <label for="" class="control-label col-sm-2">项目终止</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_terminated" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($investing_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['investing_terminated']) && $setting['investing_terminated']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                            </div>
                                        </filedset>
                                        <?php echo form_close()?>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="recycling">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <filedset>
                                            <legend>项目状态</legend>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <table class="table table-border table-hover table-status">
                                                        <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>状态</th>
                                                            <th>标识</th>
                                                            <th>启用</th>
                                                            <th>说明</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="recycling-list">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </filedset>

                                        <?php echo form_open('setting/project/save_status', array('id' =>'project-recycling','class'=>'form-horizontal status-form' ))?>
                                        <?php echo form_hidden('status_id','')?>
                                        <?php echo form_hidden('mode','recycling')?>
                                        <filedset>
                                            <legend>状态表单
                                                <div class="pull-right">
                                                    <button type="button" class="btn btn-primary btn-sm btn-new" data-mode="recycling">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </legend>
                                            <div class="col-sm-12 do-result">
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">状态名称</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="title" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">标识</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="code" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">说明</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="note" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">是否启用</label>
                                                <div class="col-sm-10">
                                                    <label><input type="radio" name="status" value="1" checked>是</label>
                                                    <label><input type="radio" name="status" value="0">否</label>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <div class="col-sm-10 col-sm-offset-2">
                                                    <button type="button" form="project-recycling" class="btn btn-primary btn-status">保存</button>
                                                </div>
                                            </div>
                                        </filedset>
                                        <?php echo form_close()?>

                                    </div>
                                    <div class="col-sm-7">
                                        <?php echo form_open('', array('class'=>'form-horizontal setting-project-form' ))?>
                                        <filedset>
                                            <legend>项目表单</legend>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">存金协议</label>
                                                <div class="col-sm-4">
                                                    <select name="recycling_privacy_in" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($privacies as $item): ?>
                                                            <option value="<?php echo $item['article_id']?>"
                                                                <?php echo (!empty($setting['recycling_privacy_in']) && $setting['recycling_privacy_in']== $item['article_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                                <label for="" class="control-label col-sm-2">提金协议</label>
                                                <div class="col-sm-4">
                                                    <select name="recycling_privacy_out" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($privacies as $item): ?>
                                                            <option value="<?php echo $item['article_id']?>"
                                                                <?php echo (!empty($setting['recycling_privacy_out']) && $setting['recycling_privacy_out']== $item['article_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                            </div>


                                            <div class="form-group ">
                                                <label for="" class="control-label col-sm-2">初始状态</label>
                                                <div class="col-sm-4">
                                                    <select name="recycling_initial" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($recycling_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['recycling_initial']) && $setting['recycling_initial']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                                <label for="" class="control-label col-sm-2">主管核实</label>
                                                <div class="col-sm-4">
                                                    <select name="recycling_checked" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($recycling_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['recycling_checked']) && $setting['recycling_checked']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="" class="control-label col-sm-2">库管确认</label>
                                                <div class="col-sm-4">
                                                    <select name="recycling_confirmed" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($recycling_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['recycling_confirmed']) && $setting['recycling_confirmed']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>

                                                <label for="" class="control-label col-sm-2">正在增值</label>
                                                <div class="col-sm-4">
                                                    <select name="recycling_growing" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($recycling_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['recycling_growing']) && $setting['recycling_growing']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <label for="" class="control-label col-sm-2">项目被拒绝</label>
                                                <div class="col-sm-4">
                                                    <select name="recycling_refused" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($recycling_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['recycling_refused']) && $setting['recycling_refused']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                                <label for="" class="control-label col-sm-2">项目终止</label>
                                                <div class="col-sm-4">
                                                    <select name="recycling_terminated" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($recycling_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['recycling_terminated']) && $setting['recycling_terminated']== $item['status_id']) ? 'selected' : ''?>>
                                                                <?php echo $item['status_id'].' - '.$item['title'];?>
                                                            </option>
                                                        <?php endforeach?>
                                                    </select>
                                                </div>
                                            </div>
                                        </filedset>
                                        <?php echo form_close()?>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_3">
                                <fieldset>
                                    <legend>通用参数</legend>
                                    <?php echo form_open('', array('class'=>'form-horizontal setting-project-form' ))?>
                                    <div class="col-sm-4">

                                        <div class="form-group clearfix">
                                            <label for="" class="control-label col-sm-4 text-right">生金克数 (g)
                                                <span class="help-block">按100克每年</span>
                                            </label>
                                            <div class="col-sm-8">
                                                <input type="text" name="profit_weight" class="form-control" id="inputProfit" value="<?php echo empty($setting['profit_weight'])? '' :$setting['profit_weight']  ?>"/>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="" class="control-label col-sm-4 text-right">生金周期
                                                <span class="help-block">支持生金的时间模式</span>
                                            </label>
                                            <div class="col-sm-8">
                                                <select name="gold_growing" class="form-control">
                                                    <option value="year">按年生金</option>
                                                    <option value="season">按季生金</option>
                                                    <option value="month">按月生金</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="inputOrderPercent" class="control-label col-sm-4 text-right">门店消费
                                                <span class="help-block">门店黄金消费比例</span>
                                            </label>
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <input type="text" name="order_percent" class="form-control" id="inputOrderPercent" value="<?php echo empty($setting['order_percent'])? '' :$setting['order_percent']  ?>"/>
                                                    <span class="input-group-addon">%</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <label for="" class="control-label col-sm-4 text-right">自动回收
                                                <span class="help-block">自动回收已完结的项目</span>
                                            </label>
                                            <div class="col-sm-8">
                                                <div class="input-group">
                                                    <label><input type="checkbox" name="finished_trash" value="1" <?php echo !empty($setting['finished_trash']) ? 'checked' : '' ?>/>是</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">

                                    </div>
                                    <?php echo form_close()?>
                                </fieldset>
                            </div>
                            <!-- /.tab-pane -->
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
    seajs.use('setproject', function (sp) {
        sp.render_statuses('investing');
        sp.render_statuses('recycling');
    });
</script>
