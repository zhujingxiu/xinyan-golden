<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        个人资料
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 控制面板</a></li>

        <li class="active">个人资料</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">

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
                                    <input type="text" name="realname" class="form-control" id="inputRealname" placeholder="真实姓名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPhone" class="col-sm-2 control-label">联系电话</label>
                                <div class="col-sm-10">
                                    <input type="text" name="phone" class="form-control" id="inputPhone" placeholder="联系电话">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                <div class="col-sm-10">
                                    <input type="text" name="email" class="form-control" id="inputEmail" placeholder="Email">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="inputWechat" class="col-sm-2 control-label">微信账号</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputWechat" name="wechat" placeholder="微信账号">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputQQ" class="col-sm-2 control-label">QQ号码</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputQQ" name="qq" placeholder="QQ号码">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" form="form-profile" class="btn btn-danger">保存</button>
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
                    <!-- timeline time label -->
                    <li class="time-label">
                        <span class="bg-red"> 10 Feb. 2014 </span>
                    </li>
                    <!-- /.timeline-label -->
                    <!-- timeline item -->
                    <li>
                        <i class="fa fa-envelope bg-blue"></i>

                        <div class="timeline-item">
                            <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                            <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                            <div class="timeline-body">
                                Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                                weebly ning heekya handango imeem plugg dopplr jibjab, movity
                                jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                                quora plaxo ideeli hulu weebly balihoo...
                            </div>
                            <div class="timeline-footer">
                                <a class="btn btn-primary btn-xs">Read more</a>
                                <a class="btn btn-danger btn-xs">Delete</a>
                            </div>
                        </div>
                    </li>
                    <!-- END timeline item -->
                    <!-- timeline item -->
                    <li>
                        <i class="fa fa-user bg-aqua"></i>

                        <div class="timeline-item">
                            <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                            <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request
                            </h3>
                        </div>
                    </li>
                    <!-- END timeline item -->
                    <!-- timeline item -->
                    <li>
                        <i class="fa fa-comments bg-yellow"></i>

                        <div class="timeline-item">
                            <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

                            <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                            <div class="timeline-body">
                                Take me to your leader!
                                Switzerland is small and neutral!
                                We are more like Germany, ambitious and misunderstood!
                            </div>
                            <div class="timeline-footer">
                                <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                            </div>
                        </div>
                    </li>
                    <!-- END timeline item -->
                    <!-- timeline time label -->
                    <li class="time-label">
                        <span class="bg-green"> 3 Jan. 2014 </span>
                    </li>
                    <!-- /.timeline-label -->
                    <!-- timeline item -->
                    <li>
                        <i class="fa fa-camera bg-purple"></i>

                        <div class="timeline-item">
                            <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

                            <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                            <div class="timeline-body">
                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                                <img src="http://placehold.it/150x100" alt="..." class="margin">
                            </div>
                        </div>
                    </li>
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
    });
</script>