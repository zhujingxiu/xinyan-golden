
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            金生金
            <small>项目列表</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url() ?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>
            <li class="active">金生金</li>
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
                        <div class="buttons">
                            <button type="button" class="btn btn-primary" id="btn-new"><i class="fa fa-plus"></i> </button>
                        </div>
<!--                        <h3 class="box-title">Hover Data Table</h3>-->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="project-list" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>状态</th>
                                    <th>编号</th>
                                    <th>客户</th>
                                    <th>类型</th>
                                    <th>交付</th>
                                    <th>存期</th>
                                    <th>存重</th>
                                    <th>实重</th>

                                    <th>推荐人</th>
                                    <th>操作人</th>
                                    <th>操作时间</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>状态</th>
                                <th>编号</th>
                                <th>客户</th>
                                <th>类型</th>
                                <th>交付</th>
                                <th>存期</th>
                                <th>存重</th>
                                <th>实重</th>
                                <th>推荐人</th>
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

        seajs.use('recycling',function(project){
            project.render_list();
            project.render_detail();
            project.render_update();
            project.render_checking();
            project.render_confirming();
            project.render_booking();
            project.render_cancle();
        })
    </script>