
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            钱生金
            <small>项目列表</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url() ?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>

            <li class="active">钱生金</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <div class="buttons">
                            <button type="button" class="btn btn-primary"><i class="fa fa-plus"></i> </button>
                        </div>
<!--                        <h3 class="box-title">Hover Data Table</h3>-->
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>项目编号</th>
                                <th>名称</th>
                                <th>客户</th>
                                <th>联系电话</th>
                                <th>金价</th>
                                <th>市值</th>
                            </tr>
                            </thead>

                            <tfoot>
                            <tr>
                                <th>项目编号</th>
                                <th>名称</th>
                                <th>客户</th>
                                <th>联系电话</th>
                                <th>金价</th>
                                <th>市值</th>
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
    <script src="<?php echo site_url('public/asset/require.js')?>" data-main="investing"></script>