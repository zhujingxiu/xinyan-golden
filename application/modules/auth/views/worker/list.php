
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            员工列表
            <small>员工列表</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url() ?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>

            <li class="active">员工列表</li>
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
                            <button id="new-user" type="button" class="btn btn-primary"><i class="fa fa-plus"></i> </button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>用户名</th>
                                <th>姓名</th>
                                <th>角色</th>
                                <th>邮箱</th>
                                <th>电话</th>
                                <th>上次登录</th>
                                <th>登录IP</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($users as $user):?>
                                <tr data-entry="<?php echo $user->id;?>" class="user-row">
                                    <td><?php echo $user->username;?></td>
                                    <td><?php echo $user->realname;?></td>

                                    <td>
                                        <?php foreach ($user->groups as $group):?>
                                            <?php echo htmlspecialchars($group->title,ENT_QUOTES,'UTF-8') ;?><br />
                                        <?php endforeach?>
                                    </td>
                                    <td><?php echo htmlspecialchars($user->email,ENT_QUOTES,'UTF-8');?></td>
                                    <td><?php echo htmlspecialchars($user->phone,ENT_QUOTES,'UTF-8');?></td>
                                    <td><?php echo $user->last_login ? date('Y-m-d H:i',$user->last_login) : '';?></td>
                                    <td><?php echo htmlspecialchars($user->last_ip,ENT_QUOTES,'UTF-8');?></td>
                                </tr>
                            <?php endforeach;?>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>
            <!-- /.col -->

            <div class="col-xs-3">
                <?php echo form_open('auth/worker/save',array('id'=>'form-worker','class'=>'form-horizontal')); ?>
                <div class="box box-success">
                    <div class="box-header">
                        <h3 class="box-title">添加员工</h3>
                        <div class="buttons pull-right">
                            <?php echo form_hidden('user_id', '');?>
                            <button id="btn-save" type="submit" form="form-worker" class="btn btn-success"><i class="fa fa-save"></i> </button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="form-group">
                            <label for="" class="control-label col-sm-3">用户名</label>
                            <div class="col-sm-9">
                                <input type="text" name="username" id="form-username" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label col-sm-3">真实姓名</label>
                            <div class="col-sm-9">
                                <input type="text" name="realname" id="form-realname" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label col-sm-3">Email</label>
                            <div class="col-sm-9">
                                <input type="text" name="email" id="form-email" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label col-sm-3">电话</label>
                            <div class="col-sm-9">
                                <input type="text" name="phone" id="form-phone" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label col-sm-3">角色设置</label>
                            <div class="col-sm-9">
                                <?php foreach($groups as $item) : ?>
                                <div class="checkbox">
                                    <label><input type="checkbox" name="groups[]" value="<?php echo $item['id']?>"><?php echo $item['title']?></label>
                                </div>
                                <?php endforeach ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label col-sm-3">密码</label>
                            <div class="col-sm-9">
                                <input type="password" name="password" id="form-password" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="control-label col-sm-3">确认密码</label>
                            <div class="col-sm-9">
                                <input type="password" name="confirm" id="form-confirm" class="form-control">
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
                <?php form_close() ?>
            </div>
        </div>
    </section>
    <!-- /.content -->
    <script >
        seajs.use('worker', function (w) {
        });
    </script>