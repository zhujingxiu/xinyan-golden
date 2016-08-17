
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            权限节点
            <small>节点列表</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url() ?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>

            <li class="active">权限节点</li>
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
                        <div class="pull-right">
                            <a id="node-toggle" class="btn btn-info btn-sm" data-click="0">
                                展开 / 收起
                            </a>
                            <a id="node-root" class="btn btn-primary btn-sm">添加根节点</a>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div id="node-tree" class="tree well well-sm"></div>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
            <!-- /.col -->
            <div class="col-xs-3">
                <?php echo form_open('worker/user/save',['id'=>'node-form']); ?>
                <div class="box box-success">
                    <div class="box-header">
                        <div class="pull-right buttons">
                            <input type="hidden" name="node_id">
                            <input type="hidden" name="parent_id">
                            <input type="hidden" name="level">
                            <button id="node-save" type="submit" form="form-worker" class="btn btn-success"><i class="fa fa-save"></i> </button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group">
                            <label for="parent-name" class="control-label">层级</label>
                            <span id="parent-name" class="form-control">/</span>
                        </div>
                        <div class="form-group">
                            <label for="title" class="control-label">标题</label>
                            <input type="text" class="form-control" id="title" name="title">
                        </div>
                        <div class="form-group">
                            <label for="name" class="control-label">标识</label>
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                        <div class="form-group">
                            <label for="path" class="control-label">Path</label>
                            <input type="text" class="form-control" id="path" name="path">
                        </div>
                        <div class="form-group">
                            <label for="status" class="control-label">状态</label>
                            <div class="input-group">
                                <div class="radio-inline">
                                    <label>
                                        <input type="radio" name="status" value="1"/> 启用
                                    </label>
                                </div>
                                <div class="radio-inline">
                                    <label>
                                        <input type="radio" name="status" value="0"/> 禁用
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">验证</label>
                            <div class="input-group">
                                <div class="radio-inline">
                                    <label>
                                        <input type="radio" name="auth" value="1"/> 需要
                                    </label>
                                </div>
                                <div class="radio-inline">
                                    <label>
                                        <input type="radio" name="auth" value="0"/> 不需要
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sort" class="control-label">排序</label>
                            <input type="text" class="form-control" id="sort" name="sort">
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <?php form_close() ?>
            </div>
        </div>
    </section>
    <!-- /.content -->
    <script >
        seajs.use('permission', function (w) {

        });
    </script>