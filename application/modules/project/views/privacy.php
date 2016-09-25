<html lang="ZH_CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>打印委托投资协议</title>

    <style>
        *{margin: 0px;padding: 0px;}
        .content-left {width: 46%;}
        .content-left b {display: inline-block;width: 125px;}
        .content-right {width: 54%;}
        .content-right b {display: inline-block;width: 120px;}
        .content-last {}

        table tr {height: 40px;line-height: 40px;}
        table{width: 690px;border: none;margin-left:100px;}
        .ptitle{height: 40px;line-height: 40px;padding-left: 100px; font-size: 21px;width: 690px;margin-top: 10px;}
        span.upcase{display: inline-block;/*width:273px;*/}
        span.lowercase{display: inline-block;}
    </style>

</head>

<body >
<table cellpadding=0 cellspacing=0 style='margin-top:160px;padding-right: 30px;'>
    <tr><td style="text-align: right;"><b>登记时间:</b> <?php echo date('Y.m.d',$addtime);?></td></tr>
</table>
<h3 class="ptitle">委托投资基本信息</h3>
<table cellpadding=0 cellspacing=0 >
    <tr >
        <td class="content-left"><b>委托单位或个人:</b> <?php echo $realname;?></td>
        <td class="content-right"><b>证件号码:</b> <?php echo $idnumber;?></td>
    </tr>
    <tr>
        <td class="content-left" ><b>标的编号:</b> <?php echo $project_sn;?></td>
        <td class="content-right" style="width:40%"><b>存金克重:</b> <?php echo number_format($weight,2);?>克</td>
    </tr>
    <tr>
        <td  class="content-left"><b>投资期限:</b> <?php echo $month;?>个月</td>

        <td class="content-right" style="width:40%"><b>预期年化收益:</b> <?php echo calculate_profit($profit,$month).lang('text_profit_unit');?></td>
    </tr>
    <tr>
        <td class="content-left" style="width:40%"><b>投资起息日:</b> <?php echo date('Y年m月d日',strtotime($start));?></td>
        <td  class="content-right"><b>投资到期日:</b> <?php echo date('Y年m月d日',strtotime($end));?></td>

    </tr>
    <tr>
        <td colspan="2" class="content-left"><b>还款方式:</b> <?php echo $payment=='cash' ? '现金' :'黄金' ;?></td>
    </tr>

    <tr>
        <td  class="content-left"><b>备注:</b> </td>
        <td  class="content-right"><b>经办人:</b> <?php echo $referrer?></td>
    </tr>
</table>
<h3 class="ptitle">委托人的有效联系方式为:</h3>
<table cellpadding=0 cellspacing=0 >
    <tr>
        <td class="content-left"><b>联系电话:</b> <?php echo $phone;?></td>
        <td colspan="2" class="content-right"><b>电子邮件:</b> <?php echo $email;?></td>
    </tr>
    <tr>
        <td class="content-left"><b>微信号码:</b> <?php echo $wechat;?> </td>
        <td colspan="2" class="content-right"><b>QQ号码:</b> <?php echo $qq;?></td>
    </tr>
</table>
<h3 class="ptitle"></h3>
<table cellpadding=0 cellspacing=0 >
    <tr>
        <td class="content-left"><b>委托人签字:</b> </td>
        <td colspan="2" class="content-right"><b>经办人签字:</b> </td>
    </tr>

</table>
</body>

</html>
