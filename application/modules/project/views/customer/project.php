<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/9/1 0001
 * Time: 15:17
 */
?>

<div class="col-sm-12" style="padding-top:10px; ">
    <div class="box">
        <div class="box-header">
            <div class="pull-right">
            <label class="label label-success">可提黄金克重 <?php echo number_format($available,2).lang('text_weight_unit')?></label>
            <label class="label label-warning">冻结黄金克重 <?php echo number_format($frozen,2).lang('text_weight_unit')?></label>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered table-striped project-tables">
                <thead>
                <tr>
                    <th>登记时间</th>
                    <th>项目</th>
                    <th>编号</th>
                    <th>实际克重</th>
                    <th>计息日期</th>
                    <th>已收益</th>
                    <th>推荐人</th>
                    <th>状态</th>
                </tr>
                </thead>
                <?php if(is_array($projects)):?>
                <tbody>
                <?php foreach($projects as $item):?>
                <tr>
                    <td><?php echo date('Y-m-d',$item['addtime']).'<br>'.date('H:i',$item['addtime'])?></td>
                    <td><?php echo $item['mode']=='investing' ? '钱生金' : '金生金'?></td>
                    <td><?php echo $item['project_sn']?></td>
                    <td><?php echo number_format($item['weight'],2)?>克</td>
                    <td><?php echo $item['start']?></td>
                    <td><?php echo number_format($item['profit'],2)?>克</td>
                    <td><?php echo $item['referrer']?></td>
                    <td><?php echo $item['status'] ? lang('label_growing') : lang('label_terminated') ?></td>
                </tr>
                <?php endforeach?>
                </tbody>
                <?php endif?>
                <tfoot>
                <tr>
                    <th>登记时间</th>
                    <th>项目</th>
                    <th>编号</th>
                    <th>实际克重</th>
                    <th>计息日期</th>
                    <th>已收益</th>
                    <th>推荐人</th>
                    <th>状态</th>
                </tr>
                </tfoot>
            </table>
        </div>
        <!-- /.box-body -->
    </div>
</div>

