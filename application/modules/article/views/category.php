
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            文章类别
            <small>类别列表</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url() ?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>

            <li class="active">文章类别</li>
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
            <div class="col-xs-6">
                <div class="box box-primary">
                    <div class="box-header">
                        <div class="buttons pull-right">
                            <button id="new-category" type="button" class="btn btn-primary"><i class="fa fa-plus"></i> </button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>类别</th>
                                <th>标识</th>
                                <th>状态</th>
                                <th>操作人</th>
                                <th>添加时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($categories as $item):?>
                                <tr data-entry="<?php echo $item['category_id'];?>" class="category-row">
                                    <td><?php echo $item['title'];?></td>
                                    <td><?php echo $item['code'];?></td>
                                    <td><?php echo $item['status'] ? '激活' : '禁用';?></td>
                                    <td><?php echo $item['realname'];?></td>
                                    <td><?php echo date('Y-m-d H:i',$item['addtime']);?></td>
                                </tr>
                            <?php endforeach;?>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
            <!-- /.col -->

            <div class="col-xs-6">
                <?php echo form_open('article/category/save',['id'=>'form-category']); ?>
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">添加类别</h3>
                        <div class="buttons pull-right">
                            <?php echo form_hidden('category_id', '');?>
                            <button id="btn-save" type="submit" form="form-category" class="btn btn-success"><i class="fa fa-save"></i> </button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="form-group clearfix">
                            <label for="" class="control-label col-sm-2">分类名称</label>
                            <div class="col-sm-8">
                                <input type="text" name="title" id="form-title" class="form-control">
                            </div>      
                        </div>
                        <div class="form-group clearfix">
                            <label for="" class="control-label col-sm-2">标识</label>
                            <div class="col-sm-8">
                                <input type="text" name="code" id="form-code" class="form-control">
                            </div>
                        </div>
                        
                        <div class="form-group clearfix">
                            <label for="" class="control-label col-sm-2">状态</label>
                            <div class="col-sm-8">
                                <div class="radio-inline">
                                    <label>
                                        <input type="radio" name="status" value="1" checked>
                                        启用
                                    </label>
                                </div>
                                <div class="radio-inline">
                                    <label>
                                        <input type="radio" name="status" value="0">
                                        禁用
                                    </label>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <?php form_close() ?>
            </div>
        </div>
    </section>
    <!-- /.content -->
    <script >
        seajs.use('category', function (w) {

        });
    </script>