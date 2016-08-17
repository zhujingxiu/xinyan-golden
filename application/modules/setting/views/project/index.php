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
                            <li class="active"><a href="#tab_1" data-toggle="tab">钱生金</a></li>
                            <li><a href="#tab_2" data-toggle="tab">金生金</a></li>

                            <li><a href="#tab_3" data-toggle="tab">其他</a></li>

                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_1">
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
                                            <legend>状态表单</legend>
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
                                        <?php echo form_open('setting/project/save', array('id' =>'project-investing','class'=>'form-horizontal' ))?>
                                        <filedset>
                                            <legend>项目表单</legend>
                                            <div class="form-group">
                                                <label for="" class="control-label col-sm-3">条款协议</label>
                                                <div class="col-sm-9">
                                                    <select name="investing_checkout_id" class="form-control">

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="" class="control-label col-sm-3">初始状态</label>
                                                <div class="col-sm-9">
                                                    <select name="investing_initial_status" class="form-control">

                                                    </select>
                                                </div>
                                            </div>
                                        </filedset>
                                        <?php echo form_close()?>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_2">
                                The European languages are members of the same family. Their separate existence is a myth.
                                For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ
                                in their grammar, their pronunciation and their most common words. Everyone realizes why a
                                new common language would be desirable: one could refuse to pay expensive translators. To
                                achieve this, it would be necessary to have uniform grammar, pronunciation and more common
                                words. If several languages coalesce, the grammar of the resulting language is more simple
                                and regular than that of the individual languages.
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="tab_3">
                                <fieldset>
                                    <legend>通用参数</legend>
                                    <div class="form-group clearfix">
                                        <label for="" class="control-label col-sm-3 text-right">生金克数 (g)
                                            <span class="help-block">按1克每年</span>
                                        </label>
                                        <div class="col-sm-9">
                                            <input type="text" name="profit" class="form-control" id="inputProfit"/>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <label for="" class="control-label col-sm-3 text-right">季度取金
                                            <span class="help-block">是否支持按季度取金</span>
                                        </label>
                                        <div class="col-sm-9">

                                                <label><input type="radio" name="season" value="1"/>是</label>
                                                <label><input type="radio" name="season" value="0"/>否</label>

                                        </div>
                                    </div>
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
    });
</script>
