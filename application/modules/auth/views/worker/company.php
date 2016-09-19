<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/9/12 0012
 * Time: 11:39
 */
?>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        公司列表
        <small>所有公司</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url() ?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>

        <li class="active">公司列表</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <?php if($success) : ?>
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h4><i class="icon fa fa-check"></i> 成功</h4>
            <?php echo $success?>
        </div>
    <?php endif ?>
    <?php if($warning) : ?>
        <div class="alert alert-warning alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h4><i class="icon fa fa-attention"></i> 警告</h4>
            <?php echo $warning?>
        </div>
    <?php endif ?>
    <div class="row">

        <div class="col-xs-9">
            <div class="box box-primary">
                <div class="box-header">
                    <div class="buttons pull-right">
                        <button id="new-company" type="button" class="btn btn-primary"><i class="fa fa-plus"></i> </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="company-list" class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>公司名称</th>
                            <th>简称</th>
                            <th>添加时间</th>
                            <th>状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($companies as $item):?>
                            <tr data-entry="<?php echo $item['company_id'];?>" class="company-row">
                                <td><?php echo $item['title'];?></td>
                                <td><?php echo $item['alias'];?></td>
                                <td><?php echo date('Y-m-d H:i:s',$item['addtime']);?></td>

                                <td><?php echo $item['status'] ? lang('label_enabled') : lang('label_disabled');?></td>
                            </tr>
                        <?php endforeach;?>
                        </tbody>
                    </table>
                </div>
                    <!-- /.box-body -->
            </div>
        </div>
        <div class="col-xs-3">
            <form class="form-horizontal" id="form-company" method="post" action="<?php echo site_url('/auth/company/save')?>">
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">添加公司</h3>
                        <div class="buttons pull-right">
                            <?php echo form_hidden('company_id', '');?>
                            <button id="btn-save" type="submit" form="form-company" class="btn btn-success"><i class="fa fa-save"></i> </button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="" class="control-label col-sm-3">公司名称</label>
                            <div class="col-sm-9">
                                <input type="text" name="title" id="form-title" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label col-sm-3">简称</label>
                            <div class="col-sm-9">
                                <input type="text" name="alias" id="form-title" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label col-sm-3">状态</label>
                            <div class="col-sm-9">
                                <div class="radio ">
                                    <label>
                                        <input type="radio" name="status" value="1">
                                        激活
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="status" value="0">
                                        禁用
                                    </label>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- /.content -->
<script >
    seajs.use('company', function (w) {
        w.render_list();
    });
</script>
