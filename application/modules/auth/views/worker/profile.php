<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        个人资料
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url()?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>

        <li class="active">个人资料</li>
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
        <div class="col-md-3">

            <!-- Profile Image -->
            <div class="box box-primary">
                <div class="box-body box-profile">
                    <img class="profile-user-img img-responsive img-circle" src="<?php echo site_url($worker['avatar']);?>" alt="User profile picture">

                    <h3 class="profile-username text-center"><?php echo $worker['realname']?></h3>

                    <p class="text-muted text-center"><?php echo $worker['username']?></p>

                    <ul class="list-group list-group-unbordered">
                        <li class="list-group-item">
                            <b>角色组</b> <a class="pull-right"><?php echo str_truncate(implode(' ',$worker['roles']));?></a>
                        </li>
                        <li class="list-group-item">
                            <b>注册时间</b> <a class="pull-right"><?php echo date('Y-m-d H:i',$worker['addtime']);?></a>
                        </li>
                        <li class="list-group-item">
                            <b>上次登录</b> <a class="pull-right"><?php echo date('Y-m-d H:i',$worker['last_login']);?></a>
                        </li>
                        <li class="list-group-item">
                            <b>登录IP</b> <a class="pull-right"><?php echo $worker['last_ip'];?></a>
                        </li>

                    </ul>

                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->

            <!-- About Me Box -->

            <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#settings" data-toggle="tab">修改资料</a></li>
                    <li ><a href="#password" data-toggle="tab">重置密码</a></li>
                    <li ><a href="#avatar" data-toggle="tab">头像修改</a></li>
                </ul>
                <div class="tab-content">

                    <div class="tab-pane active" id="settings">
                        <?php echo form_open('auth/profile/save',array('id'=>'form-profile','class'=>'form-horizontal'));?>
                            <div class="form-group">
                                <label for="inputRealname" class="col-sm-2 control-label">真实姓名</label>

                                <div class="col-sm-10">
                                    <input type="text" name="realname" class="form-control" id="inputRealname" placeholder="真实姓名" value="<?php echo $worker['realname']?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPhone" class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-10">
                                    <input type="text" name="phone" class="form-control" id="inputPhone" placeholder="联系电话" value="<?php echo $worker['phone']?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                <div class="col-sm-10">
                                    <input type="text" name="email" class="form-control" id="inputEmail" placeholder="Email" value="<?php echo $worker['email']?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputWechat" class="col-sm-2 control-label">微信账号</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputWechat" name="wechat" placeholder="微信账号" value="<?php echo $worker['wechat']?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputQQ" class="col-sm-2 control-label">QQ号码</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputQQ" name="qq" placeholder="QQ号码" value="<?php echo $worker['qq']?>">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button id="save-profile" type="button" form="form-profile" class="btn btn-danger">保存</button>
                                </div>
                            </div>
                        <?php echo form_close()?>
                    </div>
                    <div class="tab-pane" id="password">
                        <?php echo form_open('auth/profile/password',array('id'=>'form-password','class'=>'form-horizontal'));?>
                            <div class="form-group">
                                <label for="inputOldpswd" class="col-sm-2 control-label">原密码</label>
                                <div class="col-sm-10">
                                    <input type="password" name="oldpswd" class="form-control" id="inputOldpswd" placeholder="新密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputNewpswd" class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-10">
                                    <input type="password" name="newpswd" class="form-control" id="inputNewpswd" placeholder="新密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputConfirm" class="col-sm-2 control-label">确认密码</label>

                                <div class="col-sm-10">
                                    <input type="password" name="confirm" class="form-control" id="inputConfirm" placeholder="确认密码">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-danger">保存</button>
                                </div>
                            </div>
                        <?php echo form_close()?>
                    </div>
                    <div class="tab-pane" id="avatar">
                        <?php echo form_open('auth/profile/avatar',array('id'=>'form-avatar'));?>
                        <div class="form-group clearfix">
                            <div class="col-sm-2">
                                <button type="button" id="button-upload" class="btn btn-info">
                                    上传  <i class="fa fa-upload"></i>
                                </button>
                            </div>
                            <div class="col-sm-8 ">

                                <div id="uploads" class="uploads">
                                    <img src="<?php echo site_url($worker['avatar'])?>" style="width: 240px;" class="profile-user-img img-responsive img-circle">
                                </div>
                                <input name="avatar" type="hidden" />
                            </div>
                            <div class="col-sm-2">

                                <button type="button" id="save-upload" class="btn btn-info hidden">
                                    保存 <i class="fa fa-save"></i>
                                </button>

                            </div>
                        </div>
                        <?php echo form_close()?>
                    </div>
                    <!-- /.tab-pane -->
                    <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
            </div>
            <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">最近活动</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <ul class="timeline timeline-inverse">
                    <?php if($activity):?>
                    <?php foreach ($activity as $item):?>
                    <li>
                        <i class="fa fa-user bg-aqua"></i>

                        <div class="timeline-item">
                            <span class="time"><i class="fa fa-clock-o"></i> <?php echo format_time($item['addtime'],true);?></span>

                            <h3 class="timeline-header no-border"><?php echo str_truncate($item['content']);?>
                            </h3>
                        </div>
                    </li>
                    <?php endforeach?>
                    <?php else: ?>
                    <li> 近期暂无活动记录 </li>
                    <?php endif?>
                    <!-- END timeline item -->
                    <li>
                        <i class="fa fa-clock-o bg-gray"></i>
                    </li>
                </ul>
            </div>
            <!-- /.box-body -->
        </div>
        </div>
    </div>
</section>
<!-- /.content -->
<script >
    seajs.use('profile', function (p) {
        p.submit_password();
        p.submit_profile();
    });
</script>