    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            控制面板
            <small>业务概览</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h3><?php echo $weight?></h3>

                        <p>累计管理黄金</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
<!--                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <h3><?php echo $profit?></h3>

                        <p>累计为客户增值</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
<!--                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-yellow">
                    <div class="inner">
                        <h3><?php echo $customer?></h3>

                        <p>累计服务客户</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
<!--                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3><?php echo $today?></h3>
                        <p>今日入库黄金</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-pie-graph"></i>
                    </div>
<!--                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>-->
                </div>
            </div>
            <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->
        <div class="row">
            <section class="col-lg-12 connectedSortable">
                <div class="box box-info">
                    <div class="box-header">
                        <i class="fa fa-line-chart"></i>

                        <h3 class="box-title">业务概览</h3>
                        <!-- tools box -->
                        <div class="pull-right box-tools">
                            <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fa fa-times"></i></button>
                        </div>
                        <!-- /. tools -->
                    </div>
                    <div class="box-body">
                        <div id="overview-charts" style="margin: 0;padding: 0;width:100%;height:360px;"></div>
                    </div>
                </div>
            </section>
            <!-- Left col -->
            <section class="col-lg-7 connectedSortable">

                <!-- TABLE: LATEST ORDERS -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">近期入库订单</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="table-responsive">
                            <table class="table no-margin">
                                <thead>
                                <tr>
                                    <th>项目编号</th>
                                    <th>客户</th>
                                    <th>存入黄金</th>
                                    <th>推荐人</th>
                                    <th>计息日</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php if($projects):?>
                                    <?php foreach($projects as $item):?>
                                <tr>
                                    <td><?php echo $item['project_sn']?><br><?php echo $item['mode']?></td>
                                    <td><?php echo $item['customer']?></td>
                                    <td><?php echo $item['weight']?></td>
                                    <td><?php echo $item['referrer']?></td>
                                    <td>
                                        <?php echo $item['start']?>
                                    </td>
                                </tr>
                                    <?php endforeach?>
                                <?php endif?>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer clearfix">
                        <a href="<?php echo site_url('/project/recycling')?>" class="btn btn-sm btn-primary btn-flat pull-left">金生金</a>
                        <a href="<?php echo site_url('/project/investing')?>" class="btn btn-sm btn-info btn-flat pull-left">钱生金</a>
                        <a href="<?php echo site_url('/project/stock')?>" class="btn btn-sm btn-default btn-flat pull-right">金库</a>
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->
                <div class="box box-info">
                    <div class="box-header">
                        <i class="fa fa-line-chart"></i>

                        <h3 class="box-title">黄金价格走势</h3>
                        <!-- tools box -->
                        <div class="pull-right box-tools">
                            <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="Remove">
                                <i class="fa fa-times"></i></button>
                        </div>
                        <!-- /. tools -->
                    </div>
                    <div class="box-body">
                        <div id="gold-price-charts" style="margin: 0;padding: 0;width:100%;height:360px;">
                        </div>
                        <ul class="tu clear" id="toggle-charts">
                            <li><input type="radio" name="price_charts" value="day" checked="checked"  />今天</li>
                            <li><input type="radio" name="price_charts" value="week"  />周</li>
                            <li><input type="radio" name="price_charts" value="month"  />月</li>
                        </ul>
                    </div>
                </div>

            </section>
            <!-- /.Left col -->
            <!-- right col (We are only adding the ID to make the widgets sortable)-->
            <section class="col-lg-5 connectedSortable">
                <!-- TO DO List -->
                <div class="box box-primary">
                    <div class="box-header">
                        <i class="ion ion-clipboard"></i>

                        <h3 class="box-title">任务列表</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <ul class="todo-list">
                            <li>
                                <!-- drag handle -->
                                <span class="handle">
                                    <i class="fa fa-ellipsis-v"></i>
                                    <i class="fa fa-ellipsis-v"></i>
                                </span>
                                <!-- checkbox -->
                                <input type="checkbox" value="">
                                <!-- todo text -->
                                <span class="text">Design a nice theme</span>
                                <!-- Emphasis label -->
                                <small class="label label-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
                                <!-- General tools such as edit or delete-->
                                <div class="tools">
                                    <i class="fa fa-edit"></i>
                                    <i class="fa fa-trash-o"></i>
                                </div>
                            </li>
                            <li>
                                <span class="handle">
                                    <i class="fa fa-ellipsis-v"></i>
                                    <i class="fa fa-ellipsis-v"></i>
                                </span>
                                <input type="checkbox" value="">
                                <span class="text">Make the theme responsive</span>
                                <small class="label label-info"><i class="fa fa-clock-o"></i> 4 hours</small>
                                <div class="tools">
                                    <i class="fa fa-edit"></i>
                                    <i class="fa fa-trash-o"></i>
                                </div>
                            </li>
                            <li>
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                                <input type="checkbox" value="">
                                <span class="text">Let theme shine like a star</span>
                                <small class="label label-warning"><i class="fa fa-clock-o"></i> 1 day</small>
                                <div class="tools">
                                    <i class="fa fa-edit"></i>
                                    <i class="fa fa-trash-o"></i>
                                </div>
                            </li>
                            <li>
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                                <input type="checkbox" value="">
                                <span class="text">Let theme shine like a star</span>
                                <small class="label label-success"><i class="fa fa-clock-o"></i> 3 days</small>
                                <div class="tools">
                                    <i class="fa fa-edit"></i>
                                    <i class="fa fa-trash-o"></i>
                                </div>
                            </li>
                            <li>
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                                <input type="checkbox" value="">
                                <span class="text">Check your messages and notifications</span>
                                <small class="label label-primary"><i class="fa fa-clock-o"></i> 1 week</small>
                                <div class="tools">
                                    <i class="fa fa-edit"></i>
                                    <i class="fa fa-trash-o"></i>
                                </div>
                            </li>
                            <li>
                      <span class="handle">
                        <i class="fa fa-ellipsis-v"></i>
                        <i class="fa fa-ellipsis-v"></i>
                      </span>
                                <input type="checkbox" value="">
                                <span class="text">Let theme shine like a star</span>
                                <small class="label label-default"><i class="fa fa-clock-o"></i> 1 month</small>
                                <div class="tools">
                                    <i class="fa fa-edit"></i>
                                    <i class="fa fa-trash-o"></i>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer clearfix no-border">
                        <button type="button" class="btn btn-default pull-right"><i class="fa fa-plus"></i> Add item</button>
                    </div>
                </div>
                <!-- /.box -->
                <!-- Chat box -->
                <div class="box box-success">
                    <div class="box-header">
                        <i class="fa fa-comments-o"></i>

                        <h3 class="box-title">Chat</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body chat" id="chat-box">
                        <!-- chat item -->
                        <div class="item">
                            <img src="<?php echo asset_url('images/avatar/user4-128x128.jpg')?>" alt="user image" class="online">

                            <p class="message">
                                <a href="#" class="name">
                                    <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 2:15</small>
                                    Mike Doe
                                </a>
                                I would like to meet you to discuss the latest news about
                                the arrival of the new theme. They say it is going to be one the
                                best themes on the market
                            </p>
                            <div class="attachment">
                                <h4>Attachments:</h4>

                                <p class="filename">
                                    Theme-thumbnail-image.jpg
                                </p>

                                <div class="pull-right">
                                    <button type="button" class="btn btn-primary btn-sm btn-flat">Open</button>
                                </div>
                            </div>
                            <!-- /.attachment -->
                        </div>
                        <!-- /.item -->
                        <!-- chat item -->
                        <div class="item">
                            <img src="<?php echo asset_url('images/avatar/user3-128x128.jpg')?>" alt="user image" class="offline">

                            <p class="message">
                                <a href="#" class="name">
                                    <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:15</small>
                                    Alexander Pierce
                                </a>
                                I would like to meet you to discuss the latest news about
                                the arrival of the new theme. They say it is going to be one the
                                best themes on the market
                            </p>
                        </div>
                        <!-- /.item -->
                        <!-- chat item -->
                        <div class="item">
                            <img src="<?php echo asset_url('images/avatar/user2-160x160.jpg')?>" alt="user image" class="offline">

                            <p class="message">
                                <a href="#" class="name">
                                    <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> 5:30</small>
                                    Susan Doe
                                </a>
                                I would like to meet you to discuss the latest news about
                                the arrival of the new theme. They say it is going to be one the
                                best themes on the market
                            </p>
                        </div>
                        <!-- /.item -->
                    </div>
                    <!-- /.chat -->
                    <div class="box-footer">
                        <div class="input-group">
                            <input class="form-control" placeholder="Type message...">

                            <div class="input-group-btn">
                                <button type="button" class="btn btn-success"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- right col -->
        </div>
        <!-- /.row (main row) -->

    </section>
    <!-- /.content  -->
    <script>
        seajs.use('dashboard',function(l){
            l.priceGoldView('day');
            l.render_overview();
        });
    </script>
    <style>
        .clear {
            zoom: 1;
        }
        .tu {
            margin-left: 50px;
            list-style: none;
        }
        .tu li {
            float: left;
            width: 80px;
        }
    </style>
