
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            回收站
            <small>项目列表</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url() ?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>
            <li class="active">回收站</li>
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
                        已废弃项目
<!--                        <h3 class="box-title">Hover Data Table</h3>-->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="list" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>项目</th>
                                    <th>编号</th>
                                    <th>客户</th>
                                    <th>黄金</th>
                                    <th>操作人</th>
                                    <th>操作时间</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>项目</th>
                                <th>编号</th>
                                <th>客户</th>
                                <th>黄金</th>
                                <th>操作人</th>
                                <th>操作时间</th>
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

        seajs.use('trash',function(project){
            project.render_list();
            project.render_cancle();
            project.render_remove();
        })
    </script>