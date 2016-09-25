<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/9/1 0001
 * Time: 15:17
 */
?>

<div class="col-sm-12" style="padding-top:20px; ">
    <table id="project" class="table table-bordered table-striped">
        <thead>
        <tr>

            <th>项目</th>
            <th>存重</th>
            <th>周期</th>
            <th>收益</th>
            <th>推荐人</th>
            <th>状态</th>
        </tr>
        </thead>
        <?php if(is_array($projects)):?>
        <tbody>
            <?php foreach($projects as $item):?>
            <?php $period = !empty($item['month']) ? $item['start'].'<br>'.$item['end'] : $item['start'].lang('text_startdate');?>
            <tr>

                <td><?php echo $item['project_sn']?><br><?php echo $item['mode']=='investing' ? lang('text_investing') : lang('text_recycling')?></td>
                <td><?php echo number_format($item['weight'],2)?>克</td>
                <td><?php echo $period ."<br>".lang('text_profit').calculate_profit($item['profit'],$item['month']).lang('text_profit_unit')?></td>
                <td><?php echo number_format($item['stock_profit'],2)?>克</td>
                <td><?php echo $item['referrer']?></td>
                <td><?php echo $item['status'] ? lang('label_growing') : lang('label_terminated') ?></td>
            </tr>
            <?php endforeach?>
        </tbody>
        <?php endif?>
        <tfoot>
        <tr>

            <th>项目</th>
            <th>存重</th>
            <th>周期</th>
            <th>收益</th>
            <th>推荐人</th>
            <th>状态</th>
        </tr>
        </tfoot>
    </table>
</div>

<script>
    $(function () {
        $('#project').DataTable({
            "language": {
                "url": "/public/lib/datatables/Chinese.json"
            }
        });
    });
</script>