<?php
/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * Date: 2016/8/22 0022
 * Time: 17:22
 */

$lang['error_csrf'] = '该表单提交未通过我们的安全性检查.';
$lang['error_no_permission'] = "没有授权访问 ";
$lang['error_no_company'] = "没有找到该公司 ";
$lang['error_permission'] = '没权限';
$lang['error_title'] = '出错了';
$lang['error_no_result'] = '没找到结果';
$lang['error_params'] = '参数异常，请稍后重试';
$lang['error_current_price'] = '实时金价参数错误,请重试！';
$lang['error_confirm_amount'] = '输入的金额与项目的应收金额不相符！';
$lang['error_confirm_phone'] = '输入的手机号与项目的登记的手机号码不相符！';
$lang['error_reason_length'] = '驳回理由的内容长度不足10个字符';
$lang['error_no_project'] = '项目不存在';
$lang['error_no_customer'] = '客户不存在';
$lang['error_no_applied'] = '没有找到该客户提金申请数据，请刷新重试';
$lang['error_search_number'] = '没有相对应的客户';
$lang['error_search_phone'] = '卡号与手机号不匹配';
$lang['error_search_code'] = '短信验证码错误或过期，请重新获取';
$lang['error_search_captcha'] = '图形验证码错误';
$lang['error_search_smstime'] = '获取太频繁，请10分钟后重试或尝试最近收到的验证码';

$lang['error_total_max'] = '申请的重量不得大于当前最大值';
$lang['error_project_status'] = '项目状态已改变，请刷新重试';
$lang['error_project_operator'] = '无权限操作当前项目，请刷新重试';
$lang['error_period'] = '预存周期参数错误，请刷新重试';
$lang['error_notify_member'] = '没有选定通知成员';
$lang['error_notify_title'] = '请输入通知标题';
$lang['error_login_captcha'] = '登录失败次数过多，请输入正确的验证码';
$lang['error_card'] = '参数错误，请检查读卡器及磁卡';
$lang['error_card_customer'] = '该客户尚未绑定磁卡，请绑定后重试';
$lang['error_card_match'] = '提供的金卡和当前操作用户不匹配，请更换磁卡后重试';
$lang['error_card_binded'] = '提供的金卡已绑定给客户<br> %s <br>请更换磁卡后重试';
$lang['error_terminating_profit'] = '输入的金息不在合理的范围内，请重试';

$lang['text_agree'] = "我已阅读并同意《%s》";
$lang['text_goldbar'] = "金条";
$lang['text_ornament'] = "金饰";
$lang['text_renew_type'] = "续存金";
$lang['text_other_type'] = "其他";
$lang['text_cash'] = "现金";
$lang['text_gold'] = "黄金";
$lang['text_currency_unit'] = "元";
$lang['text_number_unit'] = "件";
$lang['text_weight_unit'] = "克";
$lang['text_person_unit'] = "人";
$lang['text_period_unit'] = "个月";
$lang['text_profit_unit'] = "%";
$lang['text_percent_unit'] = "%";
$lang['text_profit'] = "年化";
$lang['text_startdate'] = "起";
$lang['text_fee'] = "手续费";
$lang['text_mode_apply'] = "申请提金";
$lang['text_mode_renew'] = "申请续存";
$lang['text_mode_order'] = "申请消费抵扣";
$lang['text_lock']   = '<strong class="lock"><i class="fa fa-lock"></i> 操作人 [ %s ] 正在编辑该表单, 当前为只读模式</strong>';
$lang['text_appling'] = "申请提金 %s 克";
$lang['text_applied_date'] = "申请日期";
$lang['text_success_posted'] = "通知已发布";
$lang['text_success_company'] = "公司信息已更改";
$lang['text_stock_renew'] = "客户续存 %s 克 ，项目 %s";

$lang['text_transferrer'] = " 转 交 给 ";
$lang['text_referrer'] = " 推 荐 人 ";
$lang['text_appraiser'] = " 鉴 定 人 ";
$lang['text_period'] = "生息周期";
$lang['text_pending_widget'] = "待处理";
$lang['text_expiring_widget'] = "即将到期";
$lang['text_today_widget'] = "今日登记";
$lang['text_appling_widget'] = "客户申请";
$lang['text_unknown'] = "未知";
$lang['text_not_open'] = "尚未开启";
$lang['text_investing'] = '<label class="label label-info">钱生金</label>';
$lang['text_recycling'] = '<label class="label label-primary">金生金</label>';

$lang['text_porject_frozen_weight'] = "核实并冻结项目 %s 黄金克重 %s 克 到客户账户";
$lang['text_price_desc'] = " 若无特殊说明，本站的黄金价格均指上海黄金交易所的沪金99 （即Au99.99）";
$lang['text_login_price_title'] = "黄金价格近期走势 ：%s收盘价 %s 元/克";
$lang['text_price_today'] = " 今日黄金价格走势图";
$lang['text_price_yestoday'] = " 昨日收盘价";
$lang['text_price_unit'] = " 元/克";
$lang['text_auto_growing'] = "库存已确认标记，自动推进到正在增值";
$lang['text_renew_confirmed'] = "项目%s 自动进入到确认状态";
$lang['text_renew_growing'] = "项目%s 自动进入到增值状态";
$lang['text_finished_note'] = "项目到期完结";
$lang['text_finished_in_note'] = "项目到期完结解冻本金";
$lang['text_finished_profit_note'] = "项目到期完结所得金息";
$lang['text_unfinished_profit'] = "项目提前终止所得金息";
$lang['text_cancle_taking'] = "取消提金申请 %s 克，取消原因：%s ";
$lang['text_cancle_renew'] = "取消续存申请 %s 克，取消原因：%s ";
$lang['text_cancle_order'] = "取消消费抵扣申请 %s 克，取消原因：%s ";

$lang['label_booked'] = '<a class="btn btn-info disabled">待核实</a>';
$lang['label_checked'] = '<a class="btn btn-primary disabled">待确认</a>';
$lang['label_confirmed'] = '<a class="btn btn-primary disabled">已确认</a>';
$lang['label_growing'] = '<a class="btn btn-success disabled">增值中</a>';
$lang['label_refused'] = '<a class="btn btn-warning disabled">已驳回</a>';
$lang['label_terminated'] = '<a class="btn btn-danger disabled">已终止</a>';
$lang['label_taking'] = '<label class="label label-primary" >提金</label>';
$lang['label_renew'] = '<label class="label label-primary" >续存</label>';
$lang['label_order'] = '<label class="label label-primary" >消费</label>';

$lang['label_disabled'] = '<label class="label label-danger">已禁用</label>';
$lang['label_enabled'] = '<label class="label label-success">已启用</label>';
$lang['label_applied'] = '<label class="label label-warning" >申请提金 %s 克</label>';

$lang['button_detail'] = "<a class=\"btn btn-default btn-detail\">%s 查看</a>";
$lang['button_edit'] = "<a class=\"btn btn-default btn-edit\">%s 修改</a>";
$lang['button_update'] = "<a class=\"btn btn-default btn-update\">%s 编辑</a>";
$lang['button_checking'] = "<a class=\"btn btn-primary btn-checking\">%s 核实</a>";
$lang['button_refusing'] = "<a class=\"btn btn-warning btn-refused\">%s 驳回</a>";
$lang['button_appling'] = "<a class=\"btn btn-success btn-appling\">%s 提金</a>";
$lang['button_confirming'] = "<a class=\"btn btn-primary btn-confirming\">%s 确认</a>";
$lang['button_order'] = '<a class="btn btn-success btn-order">消费</a>';
$lang['button_taking'] = '<a class="btn btn-success btn-taking">出库</a>';
$lang['button_print'] = '<a href="%s" target="_blank" class="btn btn-default btn-print" data-toggle="tooltip" title="打印协议"><i class="fa fa-print"></a>';

$lang['button_trashing'] = '<a class="btn btn-link btn-trashed">删除</a>';

$lang['button_cancle'] = '<a class="btn btn-warning btn-cancle">取消申请</a>';
$lang['button_bind'] = '<a class="btn btn-primary btn-bind">绑卡</a>';
$lang['button_unbind'] = '<a class="btn btn-social btn-google btn-unbind" data-toggle="tooltip" title="解绑"> <i class="fa fa-unlock-alt"></i> %s </a>';
$lang['button_available'] = '<div class="btn-group">
                      <button type="button" class="btn btn-success">%s</button>
                      <button type="button" class="btn btn-success btn-appling" data-toggle="tooltip" title="申请提金">提金</button>
                        %s
                    </div>';

$lang['button_renew'] = '<button type="button" class="btn btn-success btn-renew" data-toggle="tooltip" title="续存生金">续存</button>';
$lang['button_frozen'] = '<a class="btn btn-sm btn-flat btn-default" disabled>%s</a>';
$lang['button_terminating'] = '<a class="btn btn-danger btn-terminated">终止</a>';

$lang['button_phone'] = '<a class="btn btn-social btn-twitter btn-xs" data-toggle="tooltip" title="手机号码"> <i class="fa fa-phone-square"></i> %s </a>';
$lang['button_idnumber'] = '<a class="btn btn-social btn-twitter btn-xs" data-toggle="tooltip" title="身份证号"> <i class="fa fa-street-view"></i> %s </a>';

$lang['button_appling_taking'] = '<a class="btn btn-success btn-appling" data-mode="taking" data-toggle="tooltip" title="申请提金"><i class="fa fa-download"></i></a>';
$lang['button_appling_renew'] = '<a class="btn btn-success btn-appling" data-mode="renew" data-toggle="tooltip" title="申请续存"><i class="fa fa-exchange"></i></a>';
$lang['button_appling_order'] = '<a class="btn btn-success btn-appling" data-mode="order" data-toggle="tooltip" title="申请消费抵扣"><i class="fa fa-cart-plus"></i></a>';

$lang['button_cancle_taking'] = '<a class="btn btn-warning btn-cancle" data-mode="taking" data-toggle="tooltip" title="取消提金申请"><i class="fa fa-download"></i></a>';
$lang['button_cancle_renew'] = '<a class="btn btn-warning btn-cancle" data-mode="renew" data-toggle="tooltip" title="取消续存申请"><i class="fa fa-exchange"></i></a>';
$lang['button_cancle_order'] = '<a class="btn btn-warning btn-cancle" data-mode="order" data-toggle="tooltip" title="取消消费抵扣申请"><i class="fa fa-cart-plus"></i></a>';

$lang['button_stock_taking'] = '<a class="btn btn-primary btn-taking">出库</a>';
$lang['button_stock_renew'] = '<a class="btn btn-primary btn-renew">入库</a>';
$lang['button_stock_order'] = '<a class="btn btn-primary btn-order">抵扣</a>';

$lang['button_customer_detail'] = '<a class="btn btn-info btn-detail" data-toggle="tooltip" title="查看详情">%s <i class="fa fa-save"></i> </a>';
