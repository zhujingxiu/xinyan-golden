<section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel" id="price-box">
        <div class="pull-left image">
            <img src="<?php echo asset_url('images/price.png');?>" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
            <p>实时金价 (元/克)</p>
            <a href="javascript:;" >
                <i class="fa fa-circle text-success"></i>
                <b id="sidebar-price">
                    <?php echo $price;?>
                </b>
            </a>
        </div>
    </div>

    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">
        <li class="header">主菜单</li>
        <?php foreach($menu as $item ): ?>
        <li <?php echo empty($item['style']) ? '' : 'class="'.$item['style'].'"'?>>
            <?php $item['path'] = is_array($item['path']) ? $item['path'] : array($item['path']);?>
            <?php $item['link'] = current($item['path']) ?>
            <a href="<?php echo empty($item['link']) ? '#' : site_url($item['link']);?>">
                <?php echo empty($item['icon']) ? '<i class="fa fa-circle-o"></i>' : $item['icon'];?>
                <span><?php echo $item['text'] ?></span>
                <?php if(isset($item['children']) && is_array($item['children'])) : ?>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
                <?php endif?>
            </a>
            <?php if(isset($item['children']) && is_array($item['children'])) : ?>
                <ul class="treeview-menu">
                <?php foreach($item['children'] as $child ): ?>
                    <?php $child['path'] = is_array($child['path']) ? $child['path'] : array($child['path']);?>
                    <?php $child['link'] = current($child['path']) ?>
                    <li>
                        <a href="<?php echo site_url($child['link'])?>">
                            <i class="fa fa-circle-o"></i> 
                            <?php echo $child['text'] ?>
                        </a>
                    </li>
                <?php endforeach ?>
                </ul>
            <?php endif ?>
        </li>
        <?php endforeach ?>
        <li class="treeview" style="display:none;">
            <a href="#">
                <i class="fa fa-files-o"></i>
                <span>项目列表</span>
                <span class="pull-right-container">
                    <span class="label label-primary pull-right">4</span>
                    <span class="label label-success pull-right">6</span>
                    <span class="label label-warning pull-right">6</span>
                </span>
            </a>
            <ul class="treeview-menu">
                <li><a href="<?php echo site_url('project/investing')?>"><i class="fa fa-circle-o"></i> 钱生金</a></li>
                <li><a href="<?php echo site_url('project/recycling')?>"><i class="fa fa-circle-o"></i> 金生金</a></li>
                <li><a href="<?php echo site_url('project/trash')?>"><i class="fa fa-circle-o"></i> 回收站</a></li>
            </ul>
        </li>
    </ul>
    <div class=" user-panel text-center">

    </div>
</section>