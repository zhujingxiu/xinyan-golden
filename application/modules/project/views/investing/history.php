<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/22 0022
 * Time: 17:58
 */
?>

<table class="table table-bordered">
    <thead>
    <tr>
        <td class="text-left"><b>Date Added</b></td>
        <td class="text-left"><b>Operator</b></td>
        <td class="text-left"><b>Type</b></td>
        <td class="text-left"><b>Value</b></td>
    </tr>
    </thead>
    <tbody>
    <?php if ($histories) { ?>
        <?php foreach ($histories as $history) { ?>
            <tr>
                <td class="text-left"><?php echo $history['date_added']; ?></td>
                <td class="text-left"><?php echo $history['operator']; ?></td>
                <td class="text-left"><?php echo $history['type']; ?></td>
                <td class="text-left"><?php echo $history['status_text']; ?></td>
            </tr>
        <?php } ?>
    <?php } else { ?>
        <tr>
            <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
        </tr>
    <?php } ?>
    </tbody>
</table>

