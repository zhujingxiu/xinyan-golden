<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/31 0031
 * Time: 9:16
 */
?>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        客户列表
        <small>advanced tables</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 控制面板</a></li>

        <li class="active">客户列表</li>
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
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <div class="buttons ">
                        <button class="btn btn-primary" id="btn-new"><i class="fa fa-plus"></i> </button>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="list" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>注册时间</th>
                            <th>推荐人</th>
                            <th>状态</th>
                            <th>客户</th>
                            <th>金卡</th>
                            <th>联系方式</th>
                            <th>金库</th>
                            <th>冻结</th>
                            <th>可用</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>注册时间</th>
                            <th>推荐人</th>
                            <th>状态</th>
                            <th>客户</th>
                            <th>金卡</th>
                            <th>联系方式</th>
                            <th>金库</th>
                            <th>冻结</th>
                            <th>可用</th>
                            <th></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->

<script type="text/javascript">

    seajs.use('customer',function(c){
        c.render_list();
        c.render_detail();
        c.render_appling();
        c.render_cancle();
        c.render_taking();
        c.render_project();
        c.render_bind();
        c.render_unbind();
        c.render_renew();
    });
</script>
