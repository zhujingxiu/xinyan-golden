
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            文章列表
            <small>advanced tables</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 控制面板</a></li>
            
            <li class="active">文章列表</li>
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
                                <th></th>
                                <th>文章分类</th>
                                <th>文章标题</th>
                                <th>作者</th>
                                <th>置顶</th>
                                <th>状态</th>
                                <th>编辑时间</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                                <?php if($articles) :?>
                                <?php foreach($articles as $item):?>
                                <tr data-entry="<?php echo $item['article_id']?>">
                                    <td><input type="checkbox" name="selected"></td>
                                    <td><?php echo $item['category']?></td>
                                    <td><?php echo $item['title']?></td>
                                    <td><?php echo $item['author']?></td>
                                    <td><?php echo $item['is_top'] ? '是' : '否' ?></td>
                                    <td><?php echo $item['status'] ? '已发布' : '隐藏' ?></td>
                                    <td><?php echo $item['addtime'] ? date('Y-m-d H:i',$item['addtime']) : '' ?></td>
                                    <td><a class="btn btn-link btn-detail" >查看详情</a></td>
                                </tr>
                                <?php endforeach ?>
                                <?php endif?>

                            </tbody>
                            <tfoot>
                            <tr>
                                <th></th>
                                <th>文章分类</th>
                                <th>文章标题</th>
                                <th>作者</th>
                                <th>置顶</th>
                                <th>状态</th>
                                <th>编辑时间</th>
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
    window.UEDITOR_HOME_URL = "/public/lib/ueditor/";
    seajs.use('article');
</script>