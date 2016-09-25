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
                            <li><a href="#other" data-toggle="tab">其他</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="investing">
                                <div class="row">
                                    <div class="col-sm-6">
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
                                    <div class="col-sm-6">
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
                                                <label for="" class="control-label col-sm-2">正在增值</label>
                                                <div class="col-sm-4">
                                                    <select name="investing_growing" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($investing_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['investing_growing']) && $setting['investing_growing']== $item['status_id']) ? 'selected' : ''?>>
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
                                    <div class="col-sm-6">
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
                                    <div class="col-sm-6">
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
                                            <div class="form-group ">
                                                <label for="" class="control-label col-sm-2">客户续存初始状态</label>
                                                <div class="col-sm-4">
                                                    <select name="recycling_renew" class="form-control">
                                                        <option value="0">--请选择--</option>
                                                        <?php foreach($recycling_statuses as $item): ?>
                                                            <option value="<?php echo $item['status_id']?>"
                                                                <?php echo (!empty($setting['recycling_renew']) && $setting['recycling_renew']== $item['status_id']) ? 'selected' : ''?>>
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
                            <div class="tab-pane" id="other">
                                <div class="row">
                                    <div class="col-sm-5">
                                        <fieldset>
                                            <legend>通用参数</legend>
                                            <?php echo form_open('', array('class'=>'form-horizontal setting-project-form' ))?>
                                            <div class="form-group clearfix ">
                                                <label for="" class="control-label col-sm-4 text-right">最小克重
                                                    <span class="help-block">允许登记的最小克重</span>
                                                </label>
                                                <div class="col-sm-8">
                                                    <div class="input-group">
                                                        <input type="text" name="min_weight" class="form-control" id="inputProfit" value="<?php echo empty($setting['min_weight'])? '' :$setting['min_weight']  ?>"/>
                                                        <span class="input-group-addon">克</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix" >
                                                <label for="" class="control-label col-sm-4 text-right">到期提醒天数
                                                    <span class="help-block">项目到期的预警天数</span>
                                                </label>
                                                <div class="col-sm-8">
                                                    <input type="text" name="warning_end" class="form-control" id="inputProfit" value="<?php echo empty($setting['warning_end'])? '' :$setting['warning_end']  ?>"/>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-4 text-right">生金模式
                                                    <span class="help-block">计息模式</span>
                                                </label>
                                                <div class="col-sm-8">
                                                    <select name="growing_mode" class="form-control">
                                                        <option value="t0" <?php echo $setting['growing_mode'] == 't0' ? 'selected' :''  ?>>T+0 登记当日即为计息日</option>
                                                        <option value="t1" <?php echo $setting['growing_mode'] == 't1' ? 'selected' :''  ?>>T+1 登记当日隔天即为计息日</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix" style="display: none;">
                                                <label for="" class="control-label col-sm-4 text-right">提前终止的金息模式
                                                    <span class="help-block">提前终止项目的金息模式</span>
                                                </label>
                                                <div class="col-sm-8">
                                                    <select name="gold_growing" class="form-control">
                                                        <option value="year" <?php echo $setting['gold_growing'] == 'year' ? 'selected' :''  ?>>按年金息</option>
                                                        <option value="season" <?php echo $setting['gold_growing'] == 'season' ? 'selected' :''  ?>>按季金息</option>
                                                        <option value="month" <?php echo $setting['gold_growing'] == 'month' ? 'selected' :''  ?>>按月金息</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-4 text-right">开启续存黄金
                                                    <span class="help-block">开启客户账户黄金续存入库功能</span>
                                                </label>
                                                <div class="col-sm-8">
                                                    <div class="input-group">
                                                        <label><input type="checkbox" name="apply_renew" value="1" <?php echo !empty($setting['apply_renew']) ? 'checked' : '' ?>/> 是</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-4 text-right">开启消费抵扣
                                                    <span class="help-block">开启客户门店消费抵扣账户金功能</span>
                                                </label>
                                                <div class="col-sm-8">
                                                    <div class="input-group">
                                                        <label><input type="checkbox" name="apply_order" value="1" <?php echo !empty($setting['apply_order']) ? 'checked' : '' ?>/> 是</label>
                                                    </div>
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
                                            <div class="form-group clearfix hidden">
                                                <label for="" class="control-label col-sm-4 text-right">自动回收
                                                    <span class="help-block">自动回收终止的项目</span>
                                                </label>
                                                <div class="col-sm-8">
                                                    <div class="input-group">
                                                        <label><input type="checkbox" name="terminated_trash" value="1" <?php echo !empty($setting['terminated_trash']) ? 'checked' : '' ?>/> 是</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <?php echo form_close()?>
                                        </fieldset>
                                    </div>
                                    <div class="col-sm-7">
                                        <filedset>
                                            <legend>金息列表</legend>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <table class="table table-border table-hover table-period">
                                                        <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>标题</th>
                                                            <th>月数</th>
                                                            <th>金息</th>
                                                            <th>启用</th>
                                                            <th>选中</th>
                                                            <th>说明</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody id="period-list">

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </filedset>

                                        <?php echo form_open('setting/project/save_period', array('id' =>'project-period','class'=>'form-horizontal period-form' ))?>
                                        <?php echo form_hidden('period_id','')?>
                                        <filedset>
                                            <legend>金息设定
                                                <div class="pull-right">
                                                    <button type="button" class="btn btn-primary btn-sm " id="new-period">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </legend>
                                            <div class="col-sm-12 do-result">
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">标题</label>
                                                <div class="col-sm-6">
                                                    <input type="text" name="title" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">月数</label>
                                                <div class="col-sm-6">
                                                    <div class="input-group">
                                                        <input type="text" name="month" class="form-control">
                                                        <span class="input-group-addon">个月</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <label for="" class="control-label col-sm-2">金息</label>
                                                <div class="col-sm-6">
                                                    <div class="input-group">
                                                    <input type="text" name="profit" class="form-control">
                                                    <span class="input-group-addon">%</span>
                                                    </div>
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
                                                <label for="" class="control-label col-sm-2">默认选中</label>
                                                <div class="col-sm-10">
                                                    <label><input type="radio" name="default" value="1" >是</label>
                                                    <label><input type="radio" name="default" value="0" checked>否</label>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix">
                                                <div class="col-sm-10 col-sm-offset-2">
                                                    <button type="button" form="project-period" class="btn btn-primary btn-period">保存</button>
                                                </div>
                                            </div>
                                        </filedset>
                                        <?php echo form_close()?>
                                    </div>
                                </div>
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
        sp.render_periods();
    });
</script>
