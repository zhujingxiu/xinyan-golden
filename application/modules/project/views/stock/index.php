
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            金库
            <small>项目列表</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url() ?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>
            <li class="active">金库</li>
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
            <div class="col-xs-8">
                <div class="box">
                    <div class="box-header">
                        <div class="buttons">
                            <button type="button" class="btn btn-primary" id="btn-new" data-toggle="tooltip" title="补仓"><i class="fa fa-puzzle-piece"></i> </button>
                        </div>
<!--                        <h3 class="box-title">Hover Data Table</h3>-->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="list" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th></th>

                                    <th>区域</th>
                                    <th>编号</th>
                                    <th>客户</th>
                                    <th>存金</th>
                                    <th>存期</th>
                                    <th>收益</th>
                                    <th>推荐人</th>
                                    <th>操作人</th>
                                    <th>操作时间</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th></th>
                                    <th>区域</th>
                                    <th>编号</th>
                                    <th>客户</th>
                                    <th>存金</th>
                                    <th>存期</th>
                                    <th>收益</th>
                                    <th>推荐人</th>
                                    <th>操作人</th>
                                    <th>操作时间</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
            <!-- /.col -->
            <div class="col-xs-4">
                <div class="box">
                    <div class="box-header">

                        <h3 class="box-title">客户申请</h3>
                    </div>
                    <div class="box-body">
                        <table id="applies" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th></th>
                                <th>客户</th>
                                <th>申请</th>
                                <th>重量</th>
                                <th>申请人</th>
                                <th></th>
                            </tr>
                            </thead>
                            <?php if($applies):?>
                            <tbady>
                                <?php foreach($applies as $item):?>
                                <tr data-entry="<?php echo $item['apply_id']?>">
                                    <td><?php echo $item['date_added']?></td>
                                    <td><?php echo $item['customer']?></td>
                                    <td><?php echo $item['mode']?></td>
                                    <td><?php echo $item['weight']?></td>
                                    <td><?php echo $item['operator']?></td>
                                    <td><?php echo $item['operation']?></td>
                                </tr>
                                <?php endforeach ?>
                            </tbady>
                            <?php endif?>
                            <tfoot>
                            <tr>
                                <th></th>
                                <th>客户</th>
                                <th>申请</th>
                                <th>重量</th>
                                <th>申请人</th>
                                <th></th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
    <script type="text/javascript">

        seajs.use('stock',function(project){
            project.render_list();
            project.render_storage();
            project.render_taking();
            project.render_order();
            project.render_renew();
            project.render_detail();
        })
    </script>