-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-08-17 12:07:01
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `golden`
--

-- --------------------------------------------------------

--
-- 表的结构 `gd_article`
--

CREATE TABLE `gd_article` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `is_top` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_article`
--

INSERT INTO `gd_article` (`article_id`, `category_id`, `title`, `text`, `is_top`, `status`, `author_id`, `addtime`) VALUES
(1, 1, '这是一篇测试文章', '&lt;p&gt;这是测试内容&lt;/p&gt;&lt;ol class=&quot; list-paddingleft-2&quot; style=&quot;list-style-type: decimal;&quot;&gt;&lt;li&gt;&lt;p&gt;测试1&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;测试2&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;测试3&lt;br/&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ol&gt;', 0, 1, 1, 1471337030),
(2, 2, '钱生金相关协议', '&lt;p&gt;钱生金相关协议&lt;/p&gt;&lt;ul class=&quot; list-paddingleft-2&quot; style=&quot;list-style-type: disc;&quot;&gt;&lt;li&gt;&lt;p&gt;第一条&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;第二条&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;第三条&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;第四条&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;第五条&lt;br/&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ul&gt;', 0, 1, 1, 1471337324),
(3, 2, '金生金协议', '&lt;p&gt;金生金协议&lt;/p&gt;&lt;ol class=&quot; list-paddingleft-2&quot; style=&quot;list-style-type: decimal;&quot;&gt;&lt;li&gt;&lt;p&gt;协议内容1&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;协议内容2&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;。。。&lt;br/&gt;&lt;/p&gt;&lt;/li&gt;&lt;/ol&gt;', 0, 1, 1, 1471422878);

-- --------------------------------------------------------

--
-- 表的结构 `gd_article_category`
--

CREATE TABLE `gd_article_category` (
  `category_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_article_category`
--

INSERT INTO `gd_article_category` (`category_id`, `code`, `title`, `is_admin`, `status`, `worker_id`, `addtime`) VALUES
(1, 'daily', '每日金评', 0, 1, 1, 1470088332),
(2, 'privacy', '条款协议', 0, 1, 1, 1470088332),
(3, 'news', '新闻', 0, 1, 1, 1471174877);

-- --------------------------------------------------------

--
-- 表的结构 `gd_golden_price`
--

CREATE TABLE `gd_golden_price` (
  `price_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `gd_golden_today`
--

CREATE TABLE `gd_golden_today` (
  `id` int(11) NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `typename` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opening` decimal(8,2) NOT NULL DEFAULT '0.00',
  `maxprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `minprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change` decimal(6,2) NOT NULL DEFAULT '0.00',
  `lastclosing` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tradeamount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `updatetime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `gd_node`
--

CREATE TABLE `gd_node` (
  `node_id` int(11) NOT NULL,
  `mode` enum('auth','menu') NOT NULL DEFAULT 'auth',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(4) NOT NULL DEFAULT '1',
  `name` varchar(32) DEFAULT NULL,
  `title` text,
  `path` varchar(96) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `auth` tinyint(1) NOT NULL DEFAULT '0',
  `sort` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gd_node`
--

INSERT INTO `gd_node` (`node_id`, `mode`, `parent_id`, `level`, `name`, `title`, `path`, `status`, `auth`, `sort`) VALUES
(1, 'menu', 0, 1, NULL, '{"cn":"\\u7cfb\\u7edf","en":"System"}', '', 1, 0, 7),
(2, 'menu', 0, 1, NULL, '{"cn":"\\u5de5\\u5177","en":"Tool"}', '', 1, 0, 7),
(3, 'menu', 417, 3, NULL, '{"cn":"\\u7528\\u6237\\u7ec4\\u6743\\u9650","en":"Group Permission"}', 'user/user_permission', 1, 1, 2),
(2468, 'menu', 2441, 4, NULL, '{"cn":"\\u8d26\\u53f7\\u7a3f\\u4ef6","en":"Facebook Account"}', 'fbaccount/entry', 1, 1, 0),
(2436, 'menu', 2116, 3, NULL, '{"cn":"NFL\\u914d\\u7f6e","en":"NFL Config"}', '', 1, 1, 3),
(2440, 'menu', 2115, 2, NULL, '{"cn":"\\u7a3f\\u4ef6","en":"Contribute"}', '', 1, 1, 2),
(2101, 'menu', 143, 2, NULL, '{"cn":"\\u56de\\u590d","en":"Reply"}', 'office/reply', 1, 1, 3),
(2100, 'menu', 143, 2, NULL, '{"cn":"\\u76d1\\u63a7","en":"Monitor"}', 'office/monitor', 1, 1, 2),
(2099, 'menu', 143, 2, NULL, '{"cn":"\\u529e\\u516c\\u7528\\u6237","en":"Office User"}', 'office/user', 1, 1, 4),
(2098, 'menu', 143, 2, NULL, '{"cn":"\\u7533\\u8bf7","en":"Apply"}', 'office/apply', 1, 1, 1),
(3379, 'auth', 3371, 2, NULL, 'setting', 'setting/setting', 1, 1, 3),
(3378, 'auth', 3374, 3, NULL, 'sync', 'setting/permission_node/sync', 1, 1, 4),
(3377, 'auth', 3374, 3, NULL, 'delete', 'setting/permission_node/delete', 1, 1, 3),
(3376, 'auth', 3374, 3, NULL, 'save', 'setting/permission_node/save', 1, 1, 2),
(3375, 'auth', 3374, 3, NULL, 'index', 'setting/permission_node/index', 1, 1, 1),
(3374, 'auth', 3371, 2, NULL, 'permission_node', 'setting/permission_node', 1, 1, 2),
(3373, 'auth', 3372, 3, NULL, 'index', 'setting/advertise/index', 1, 1, 1),
(3372, 'auth', 3371, 2, NULL, 'advertise', 'setting/advertise', 1, 1, 1),
(3371, 'auth', 0, 1, NULL, 'Setting', '', 1, 1, 14),
(3369, 'auth', 3364, 3, NULL, 'history', 'service/website/history', 1, 1, 5),
(3370, 'auth', 3364, 3, NULL, 'tracking', 'service/website/tracking', 1, 1, 6),
(3368, 'auth', 3364, 3, NULL, 'delete', 'service/website/delete', 1, 1, 4),
(3367, 'auth', 3364, 3, NULL, 'edit', 'service/website/edit', 1, 1, 3),
(3366, 'auth', 3364, 3, NULL, 'add', 'service/website/add', 1, 1, 2),
(3365, 'auth', 3364, 3, NULL, 'index', 'service/website/index', 1, 1, 1),
(3364, 'auth', 3317, 2, NULL, 'website', 'service/website', 1, 1, 7),
(3363, 'auth', 3360, 3, NULL, 'ajax_data', 'service/queue/ajax_data', 1, 1, 3),
(3362, 'auth', 3360, 3, NULL, 'demotion', 'service/queue/demotion', 1, 1, 2),
(3361, 'auth', 3360, 3, NULL, 'index', 'service/queue/index', 1, 1, 1),
(3360, 'auth', 3317, 2, NULL, 'queue', 'service/queue', 1, 1, 6),
(3359, 'auth', 3352, 3, NULL, 'edit_ad_account', 'service/publish/edit_ad_account', 1, 1, 7),
(3358, 'auth', 3352, 3, NULL, 'tracking', 'service/publish/tracking', 1, 1, 6),
(3357, 'auth', 3352, 3, NULL, 'component', 'service/publish/component', 1, 1, 5),
(3356, 'auth', 3352, 3, NULL, 'history', 'service/publish/history', 1, 1, 4),
(3355, 'auth', 3352, 3, NULL, 'getForm', 'service/publish/getForm', 1, 1, 3),
(3351, 'auth', 3345, 3, NULL, 'history', 'service/advertise_targeting/history', 1, 1, 6),
(3352, 'auth', 3317, 2, NULL, 'publish', 'service/publish', 1, 1, 5),
(3353, 'auth', 3352, 3, NULL, 'index', 'service/publish/index', 1, 1, 1),
(3354, 'auth', 3352, 3, NULL, 'edit', 'service/publish/edit', 1, 1, 2),
(3350, 'auth', 3345, 3, NULL, 'detail', 'service/advertise_targeting/detail', 1, 1, 5),
(3344, 'auth', 3338, 3, NULL, 'history', 'service/advertise_post/history', 1, 1, 6),
(3345, 'auth', 3317, 2, NULL, 'advertise_targeting', 'service/advertise_targeting', 1, 1, 4),
(3349, 'auth', 3345, 3, NULL, 'delete', 'service/advertise_targeting/delete', 1, 1, 4),
(3348, 'auth', 3345, 3, NULL, 'approve', 'service/advertise_targeting/approve', 1, 1, 3),
(3347, 'auth', 3345, 3, NULL, 'edit', 'service/advertise_targeting/edit', 1, 1, 2),
(3346, 'auth', 3345, 3, NULL, 'index', 'service/advertise_targeting/index', 1, 1, 1),
(123, 'menu', 418, 3, NULL, '{"cn":"\\u6743\\u9650\\u8282\\u70b9","en":"Permission Nodes"}', 'setting/permission_node', 1, 1, 3),
(124, 'menu', 2, 2, NULL, '{"cn":"\\u7528\\u6237\\u65e5\\u8bb0","en":"User Logs "}', 'user/user_log', 1, 0, 5),
(125, 'menu', 417, 3, NULL, '{"cn":"\\u7528\\u6237","en":"Users"}', 'user/user', 1, 1, 0),
(126, 'menu', 418, 3, NULL, '{"cn":"\\u7cfb\\u7edf\\u914d\\u7f6e","en":"System Settings"}', 'setting/setting', 1, 1, 1),
(127, 'menu', 0, 1, NULL, '{"cn":"\\u63a7\\u5236\\u53f0","en":"Dashboard"}', 'common/dashboard', 1, 0, 1),
(128, 'menu', 0, 1, NULL, '{"cn":"\\u76ee\\u5f55","en":"Catalog"}', '', 1, 1, 2),
(129, 'menu', 128, 2, NULL, '{"cn":"\\u4fe1\\u606f","en":"Information"}', 'catalog/information', 1, 1, 3),
(435, 'menu', 145, 3, NULL, '{"cn":"\\u5b9a\\u4f4d","en":"Targetings"}', 'localisation/targeting', 1, 1, 7),
(132, 'menu', 0, 1, NULL, '{"cn":"\\u5e7f\\u544a","en":"Advertise"}', '', 1, 1, 4),
(133, 'menu', 0, 1, NULL, '{"cn":"\\u5ba2\\u6237","en":"Customer"}', '', 1, 1, 3),
(134, 'menu', 133, 3, NULL, '{"cn":"\\u5e7f\\u544a\\u5ba2\\u6237","en":"Customers"}', 'customer/customer', 1, 1, 1),
(135, 'menu', 133, 3, NULL, '{"cn":"\\u5ba2\\u6237\\u7ec4","en":"Customer Group"}', 'customer/customer_group', 1, 1, 1),
(137, 'menu', 2, 2, NULL, '{"cn":"\\u5907\\u4efd","en":"Backup"}', 'tool/backup', 1, 1, 2),
(138, 'menu', 2, 2, NULL, '{"cn":"\\u9519\\u8bef\\u65e5\\u8bb0","en":"Error Logs"}', 'tool/error_log', 1, 1, 3),
(139, 'menu', 0, 1, NULL, '{"cn":"\\u62a5\\u544a","en":"Report"}', '', 1, 1, 8),
(140, 'menu', 139, 2, NULL, '{"cn":"\\u5e7f\\u544a\\u62a5\\u8868","en":"Ad Report"}', 'report/report', 1, 1, 1),
(141, 'menu', 139, 2, NULL, '{"cn":"\\u9879\\u76ee","en":"project"}', 'report/project', 0, 1, 2),
(432, 'menu', 145, 3, NULL, '{"cn":"\\u5e7f\\u544a\\u53d1\\u5e03\\u72b6\\u6001","en":"Ad Publish"}', 'localisation/advertise_publish', 1, 1, 1),
(143, 'menu', 0, 1, NULL, '{"cn":"\\u529e\\u516c","en":"Office"}', '', 1, 1, 9),
(144, 'menu', 143, 2, NULL, '{"cn":"\\u5de5\\u4f5c\\u65f6\\u95f4","en":"Office Time"}', 'office/time', 1, 1, 5),
(145, 'menu', 1, 2, NULL, '{"cn":"\\u672c\\u5730\\u5316","en":"Localisation"}', '', 1, 1, 5),
(146, 'menu', 145, 3, NULL, '{"cn":"\\u8bed\\u8a00","en":"Language"}', 'localisation/language', 1, 1, 8),
(148, 'menu', 145, 3, NULL, '{"cn":"\\u56fd\\u5bb6","en":"Country"}', 'localisation/country', 1, 1, 10),
(149, 'menu', 145, 3, NULL, '{"cn":"\\u5e7f\\u544a\\u72b6\\u6001","en":"Ad Status"}', 'localisation/advertise_status', 0, 1, 9),
(3343, 'auth', 3338, 3, NULL, 'detail', 'service/advertise_post/detail', 1, 1, 5),
(3342, 'auth', 3338, 3, NULL, 'delete', 'service/advertise_post/delete', 1, 1, 4),
(3341, 'auth', 3338, 3, NULL, 'approve', 'service/advertise_post/approve', 1, 1, 3),
(3340, 'auth', 3338, 3, NULL, 'edit', 'service/advertise_post/edit', 1, 1, 2),
(3339, 'auth', 3338, 3, NULL, 'index', 'service/advertise_post/index', 1, 1, 1),
(3338, 'auth', 3317, 2, NULL, 'advertise_post', 'service/advertise_post', 1, 1, 3),
(3337, 'auth', 3330, 3, NULL, 'history', 'service/advertise_photo/history', 1, 1, 7),
(3336, 'auth', 3330, 3, NULL, 'detail', 'service/advertise_photo/detail', 1, 1, 6),
(3335, 'auth', 3330, 3, NULL, 'apply', 'service/advertise_photo/apply', 1, 1, 5),
(3334, 'auth', 3330, 3, NULL, 'delete', 'service/advertise_photo/delete', 1, 1, 4),
(3332, 'auth', 3330, 3, NULL, 'approve', 'service/advertise_photo/approve', 1, 1, 2),
(3333, 'auth', 3330, 3, NULL, 'edit', 'service/advertise_photo/edit', 1, 1, 3),
(3331, 'auth', 3330, 3, NULL, 'index', 'service/advertise_photo/index', 1, 1, 1),
(3330, 'auth', 3317, 2, NULL, 'advertise_photo', 'service/advertise_photo', 1, 1, 2),
(3329, 'auth', 3318, 3, NULL, 'get_preview', 'service/advertise/get_preview', 1, 1, 11),
(3328, 'auth', 3318, 3, NULL, 'balance', 'service/advertise/balance', 1, 1, 10),
(3327, 'auth', 3318, 3, NULL, 'tracking', 'service/advertise/tracking', 1, 1, 9),
(3326, 'auth', 3318, 3, NULL, 'component', 'service/advertise/component', 1, 1, 8),
(3325, 'auth', 3318, 3, NULL, 'ajax_data', 'service/advertise/ajax_data', 1, 1, 7),
(3323, 'auth', 3318, 3, NULL, 'getForm', 'service/advertise/getForm', 1, 1, 5),
(3324, 'auth', 3318, 3, NULL, 'history', 'service/advertise/history', 1, 1, 6),
(3322, 'auth', 3318, 3, NULL, 'delete', 'service/advertise/delete', 1, 1, 4),
(3321, 'auth', 3318, 3, NULL, 'edit', 'service/advertise/edit', 1, 1, 3),
(3320, 'auth', 3318, 3, NULL, 'add', 'service/advertise/add', 1, 1, 2),
(3319, 'auth', 3318, 3, NULL, 'index', 'service/advertise/index', 1, 1, 1),
(3318, 'auth', 3317, 2, NULL, 'advertise', 'service/advertise', 1, 1, 1),
(3317, 'auth', 0, 1, NULL, 'Service', '', 1, 1, 13),
(3316, 'auth', 3313, 3, NULL, 'ajax_data', 'report/report/ajax_data', 1, 1, 3),
(3315, 'auth', 3313, 3, NULL, 'detail', 'report/report/detail', 1, 1, 2),
(3314, 'auth', 3313, 3, NULL, 'index', 'report/report/index', 1, 1, 1),
(3312, 'auth', 0, 1, NULL, 'Report', '', 1, 1, 12),
(3313, 'auth', 3312, 2, NULL, 'report', 'report/report', 1, 1, 1),
(436, 'menu', 132, 2, NULL, '{"cn":"\\u5e7f\\u544a\\u6587\\u672c","en":"Ad Posts"}', 'service/advertise_post', 1, 1, 3),
(417, 'menu', 1, 2, NULL, '{"cn":"\\u7528\\u6237","en":"Users"}', '', 1, 1, 2),
(418, 'menu', 1, 2, NULL, '{"cn":"\\u914d\\u7f6e","en":"Config"}', '', 1, 1, 1),
(433, 'menu', 145, 3, NULL, '{"cn":"\\u7a3f\\u4ef6\\u72b6\\u6001","en":"Post Status"}', 'localisation/advertise_post', 1, 1, 6),
(434, 'menu', 145, 3, NULL, '{"cn":"\\u56fe\\u7247\\u72b6\\u6001","en":"Photo Status"}', 'localisation/advertise_photo', 1, 1, 6),
(423, 'menu', 132, 2, NULL, '{"cn":"\\u5e7f\\u544a\\u5217\\u8868","en":"Ads List"}', 'service/advertise', 1, 1, 2),
(437, 'menu', 132, 2, NULL, '{"cn":"\\u5e7f\\u544a\\u56fe\\u7247","en":"Ad Photos"}', 'service/advertise_photo', 1, 1, 3),
(438, 'menu', 128, 2, NULL, '{"cn":"\\u5e38\\u89c1\\u95ee\\u9898","en":"F.A.Q"}', 'catalog/faq', 1, 1, 2),
(439, 'menu', 128, 2, NULL, '{"cn":"\\u65b0\\u95fb","en":"News"}', 'catalog/news', 1, 1, 2),
(442, 'menu', 418, 3, NULL, '{"cn":"\\u5e7f\\u544a\\u914d\\u7f6e","en":"AD Settings"}', 'setting/advertise', 1, 1, 2),
(590, 'menu', 128, 2, NULL, '{"cn":"\\u4ea7\\u54c1","en":"Product"}', 'catalog/product', 1, 1, 1),
(746, 'menu', 132, 2, NULL, '{"cn":"\\u5e7f\\u544a\\u5b9a\\u4f4d","en":"Ad Targeting"}', 'service/advertise_targeting', 1, 1, 2),
(747, 'menu', 145, 3, NULL, '{"cn":"\\u5b9a\\u4f4d\\u72b6\\u6001","en":"Targeting Status"}', 'localisation/advertise_targeting', 1, 1, 2),
(777, 'menu', 132, 2, NULL, '{"en":"Publish AD","cn":"\\u5e7f\\u544a\\u53d1\\u5e03"}', 'service/publish', 1, 1, 5),
(953, 'menu', 2, 2, NULL, '{"cn":"\\u5b9a\\u65f6\\u8bb0\\u5f55","en":"Cron Log"}', 'tool/cron_log', 1, 1, 0),
(954, 'menu', 132, 2, NULL, '{"cn":"\\u7f51\\u7ad9","en":"Website"}', 'service/website', 1, 1, 0),
(1011, 'menu', 2, 2, NULL, '{"cn":"\\u5b9a\\u65f6","en":"Cron"}', 'tool/cron', 1, 1, 0),
(1012, 'menu', 145, 3, NULL, '{"cn":"\\u4f18\\u5148\\u7ea7","en":"Priority"}', 'localisation/priority', 1, 1, 9),
(1013, 'menu', 145, 3, NULL, '{"cn":"\\u8d27\\u5e01","en":"Currency"}', 'localisation/currency', 1, 1, 10),
(1015, 'menu', 2962, 2, NULL, '{"cn":"\\u4f59\\u989d","en":"My Balance"}', 'finance/customer_balance', 1, 1, 1),
(1016, 'menu', 132, 2, NULL, '{"cn":"\\u6392\\u961f\\u5217\\u8868","en":"Queuing List"}', 'service/queue', 1, 1, 1),
(3176, 'auth', 3174, 3, NULL, 'edit', 'finance/customer_balance/edit', 1, 1, 2),
(3175, 'auth', 3174, 3, NULL, 'index', 'finance/customer_balance/index', 1, 1, 1),
(3174, 'auth', 3173, 2, NULL, 'customer_balance', 'finance/customer_balance', 1, 1, 1),
(3173, 'auth', 0, 1, NULL, 'Finance', '', 1, 1, 8),
(2106, 'menu', 2438, 4, NULL, '{"cn":"NFL\\u7a3f\\u4ef6","en":"NFL Posts"}', 'nfl/post_player', 1, 1, 0),
(2107, 'menu', 2438, 4, NULL, '{"cn":"\\u6bd4\\u8d5b\\u7a3f\\u4ef6","en":"Schedule Posts"}', 'nfl/post_schedule', 0, 1, 0),
(2108, 'menu', 2437, 4, NULL, '{"cn":"\\u7403\\u961f\\u7a3f\\u4ef6","en":"NFL Teams"}', 'nfl/team', 1, 1, 0),
(2109, 'menu', 2437, 4, NULL, '{"cn":"\\u7403\\u5458\\u7a3f\\u4ef6","en":"NFL Players"}', 'nfl/player', 1, 1, 0),
(2110, 'menu', 2436, 4, NULL, '{"cn":"NFL\\u8d5b\\u7a0b","en":"NFL Schedules"}', 'nfl/schedule', 1, 1, 0),
(2111, 'menu', 2436, 4, NULL, '{"cn":"NFL \\u6bd4\\u8d5b","en":"NFL Matches"}', 'nfl/match', 1, 1, 0),
(2112, 'menu', 2436, 4, NULL, '{"cn":"NFL \\u914d\\u7f6e","en":"NFL Configuration"}', 'nfl/config', 1, 1, 0),
(2113, 'menu', 2436, 4, NULL, '{"cn":"NFL \\u7a3f\\u4ef6\\u53d1\\u5e03\\u72b6\\u6001","en":"NFL Post Publishes"}', 'nfl/publish', 1, 1, 0),
(2114, 'menu', 2436, 4, NULL, '{"cn":"NFL \\u7a3f\\u4ef6\\u72b6\\u6001","en":"NFL Post Statuses"}', 'nfl/status', 1, 1, 0),
(2115, 'menu', 0, 1, NULL, '{"cn":"\\u793e\\u5a92","en":"SNS"}', '', 1, 1, 5),
(2116, 'menu', 2115, 2, NULL, '{"cn":"\\u6a44\\u6984\\u7403\\u8d5b","en":"NFL"}', '', 1, 1, 1),
(2138, 'menu', 2116, 3, NULL, '{"cn":"\\u7a3f\\u4ef6\\u62a5\\u8868","en":"Posts Report"}', 'nfl/report', 1, 1, 4),
(2437, 'menu', 2116, 3, NULL, '{"cn":"\\u63d0\\u4ea4\\u7a3f\\u4ef6","en":"Submit Post"}', '', 1, 1, 0),
(2438, 'menu', 2116, 3, NULL, '{"cn":"\\u5904\\u7406\\u7a3f\\u4ef6","en":"Handling Post"}', '', 1, 1, 0),
(2441, 'menu', 2440, 3, NULL, '{"cn":"\\u63d0\\u4ea4\\u7a3f\\u4ef6","en":"Submit Contribute"}', '', 1, 1, 0),
(2442, 'menu', 2440, 3, NULL, '{"cn":"\\u5904\\u7406\\u7a3f\\u4ef6","en":"Handling Contribute"}', '', 1, 1, 0),
(2443, 'menu', 2440, 3, NULL, '{"cn":"\\u7a3f\\u4ef6\\u914d\\u7f6e","en":"Contribute Config"}', '', 1, 1, 0),
(2474, 'menu', 2443, 4, NULL, '{"cn":"\\u6d88\\u606f\\u914d\\u7f6e","en":"Message Config"}', 'fbmessage/config', 1, 1, 5),
(2473, 'menu', 2443, 4, NULL, '{"cn":"\\u4e13\\u9875\\u914d\\u7f6e","en":"Page Config"}', 'fbpage/config', 1, 1, 4),
(2469, 'menu', 2441, 4, NULL, '{"cn":"\\u4e13\\u9875\\u7a3f\\u4ef6","en":"Facebook Page"}', 'fbpage/entry', 1, 1, 0),
(2449, 'menu', 2442, 4, NULL, '{"cn":"\\u8d26\\u53f7\\u6709\\u56fe\\u7247\\u7a3f\\u4ef6","en":"Account With Photo"}', 'fbaccount/photo', 1, 1, 1),
(2450, 'menu', 2442, 4, NULL, '{"cn":"\\u8d26\\u53f7\\u65e0\\u56fe\\u7247\\u7a3f\\u4ef6","en":"Account Without Photo"}', 'fbaccount/nophoto', 1, 1, 2),
(2452, 'menu', 2442, 4, NULL, '{"cn":"\\u4e13\\u9875\\u65e0\\u56fe\\u7247\\u7a3f\\u4ef6","en":"Page Without Photo"}', 'fbpage/nophoto', 1, 1, 3),
(2453, 'menu', 2442, 4, NULL, '{"cn":"\\u6d88\\u606f\\u7a3f\\u4ef6","en":"Messages"}', 'fbmessage/nophoto', 1, 1, 4),
(2454, 'menu', 2443, 4, NULL, '{"cn":"\\u8d26\\u53f7\\u65e0\\u56fe\\u7247\\u72b6\\u6001","en":"Account Status"}', 'fbaccount/nophoto_status', 1, 1, 15),
(2455, 'menu', 2443, 4, NULL, '{"cn":"\\u8d26\\u53f7\\u65e0\\u56fe\\u7247\\u53d1\\u5e03\\u72b6\\u6001","en":"Account Publish"}', 'fbaccount/nophoto_publish', 1, 1, 16),
(2456, 'menu', 2443, 4, NULL, '{"cn":"\\u8d26\\u53f7\\u6709\\u56fe\\u7247\\u72b6\\u6001","en":"Account Photo Status"}', 'fbaccount/photo_status', 1, 1, 13),
(2457, 'menu', 2443, 4, NULL, '{"cn":"\\u8d26\\u53f7\\u6709\\u56fe\\u7247\\u53d1\\u5e03\\u72b6\\u6001","en":"Account Photo Publish"}', 'fbaccount/photo_publish', 1, 1, 14),
(2458, 'menu', 2443, 4, NULL, '{"cn":"\\u4e13\\u9875\\u72b6\\u6001","en":"Page Status"}', 'fbpage/nophoto_status', 1, 1, 17),
(2459, 'menu', 2443, 4, NULL, '{"cn":"\\u6d88\\u606f\\u72b6\\u6001","en":"Message Status"}', 'fbmessage/nophoto_status', 1, 1, 19),
(2460, 'menu', 2443, 4, NULL, '{"cn":"\\u6d88\\u606f\\u53d1\\u5e03\\u72b6\\u6001","en":"Message Publish"}', 'fbmessage/nophoto_publish', 1, 1, 20),
(2461, 'menu', 2440, 3, NULL, '{"cn":"\\u7a3f\\u4ef6\\u62a5\\u544a","en":"Contribute Report"}', '', 1, 1, 0),
(2462, 'menu', 2461, 4, NULL, '{"cn":"\\u5bfc\\u51fa\\u7a3f\\u4ef6","en":"Export Posts"}', '', 1, 1, 0),
(2463, 'menu', 2461, 4, NULL, '{"cn":"\\u76f8\\u4f3c\\u5ea6","en":"Similar Post Text"}', '', 1, 1, 0),
(2464, 'menu', 2461, 4, NULL, '{"cn":"\\u94fe\\u63a5\\u62a5\\u8868","en":"Report Links"}', '', 1, 1, 0),
(2466, 'menu', 2461, 4, NULL, '{"cn":"\\u7a3f\\u4ef6\\u7edf\\u8ba1","en":"Post Statistics"}', '', 1, 1, 0),
(2467, 'menu', 2443, 4, NULL, '{"cn":"\\u4e13\\u9875\\u53d1\\u5e03\\u72b6\\u6001","en":"Page Publish"}', 'fbpage/nophoto_publish', 1, 1, 18),
(2470, 'menu', 2443, 4, NULL, '{"cn":"\\u9009\\u9879","en":"Options"}', 'sns/option', 1, 1, 3),
(2472, 'menu', 2443, 4, NULL, '{"cn":"\\u8d26\\u53f7\\u914d\\u7f6e","en":"Account Config"}', 'fbaccount/config', 1, 1, 3),
(2471, 'menu', 2115, 2, NULL, '{"cn":"\\u5ba1\\u6838\\u7ec4","en":"Audit Group"}', 'sns/group', 1, 1, 4),
(3380, 'auth', 3379, 3, NULL, 'index', 'setting/setting/index', 1, 1, 1),
(3029, 'auth', 3028, 3, NULL, 'index', 'dashboard/sale/index', 1, 1, 1),
(3028, 'auth', 3018, 2, NULL, 'sale', 'dashboard/sale', 1, 1, 5),
(3027, 'auth', 3026, 3, NULL, 'index', 'dashboard/recent/index', 1, 1, 1),
(3026, 'auth', 3018, 2, NULL, 'recent', 'dashboard/recent', 1, 1, 4),
(3025, 'auth', 3024, 3, NULL, 'index', 'dashboard/order/index', 1, 1, 1),
(3024, 'auth', 3018, 2, NULL, 'order', 'dashboard/order', 1, 1, 3),
(3023, 'auth', 3022, 3, NULL, 'index', 'dashboard/customer/index', 1, 1, 1),
(3022, 'auth', 3018, 2, NULL, 'customer', 'dashboard/customer', 1, 1, 2),
(3021, 'auth', 3019, 3, NULL, 'chart', 'dashboard/chart/chart', 1, 1, 2),
(3020, 'auth', 3019, 3, NULL, 'index', 'dashboard/chart/index', 1, 1, 1),
(3019, 'auth', 3018, 2, NULL, 'chart', 'dashboard/chart', 1, 1, 1),
(3018, 'auth', 0, 1, NULL, 'Dashboard', '', 1, 1, 4),
(3017, 'auth', 3013, 3, NULL, 'delete', 'customer/customer_group/delete', 1, 1, 4),
(3016, 'auth', 3013, 3, NULL, 'edit', 'customer/customer_group/edit', 1, 1, 3),
(3015, 'auth', 3013, 3, NULL, 'add', 'customer/customer_group/add', 1, 1, 2),
(3014, 'auth', 3013, 3, NULL, 'index', 'customer/customer_group/index', 1, 1, 1),
(3013, 'auth', 3004, 2, NULL, 'customer_group', 'customer/customer_group', 1, 1, 2),
(3012, 'auth', 3005, 3, NULL, 'login', 'customer/customer/login', 1, 1, 7),
(3011, 'auth', 3005, 3, NULL, 'autocomplete', 'customer/customer/autocomplete', 1, 1, 6),
(3010, 'auth', 3005, 3, NULL, 'history', 'customer/customer/history', 1, 1, 5),
(3009, 'auth', 3005, 3, NULL, 'delete', 'customer/customer/delete', 1, 1, 4),
(3008, 'auth', 3005, 3, NULL, 'edit', 'customer/customer/edit', 1, 1, 3),
(3007, 'auth', 3005, 3, NULL, 'add', 'customer/customer/add', 1, 1, 2),
(3006, 'auth', 3005, 3, NULL, 'index', 'customer/customer/index', 1, 1, 1),
(3005, 'auth', 3004, 2, NULL, 'customer', 'customer/customer', 1, 1, 1),
(3004, 'auth', 0, 1, NULL, 'Customer', '', 1, 1, 3),
(3003, 'auth', 3002, 3, NULL, 'index', 'common/stats/index', 1, 1, 1),
(3002, 'auth', 2997, 2, NULL, 'stats', 'common/stats', 1, 1, 3),
(3001, 'auth', 3000, 3, NULL, 'index', 'common/profile/index', 1, 1, 1),
(3000, 'auth', 2997, 2, NULL, 'profile', 'common/profile', 1, 1, 2),
(2999, 'auth', 2998, 3, NULL, 'index', 'common/download/index', 1, 1, 1),
(2998, 'auth', 2997, 2, NULL, 'download', 'common/download', 1, 1, 1),
(2997, 'auth', 0, 1, 'Common', '通用模块', '', 1, 0, 2),
(2991, 'auth', 2987, 3, NULL, 'delete', 'catalog/news/delete', 1, 1, 4),
(2990, 'auth', 2987, 3, NULL, 'edit', 'catalog/news/edit', 1, 1, 3),
(2989, 'auth', 2987, 3, NULL, 'add', 'catalog/news/add', 1, 1, 2),
(2988, 'auth', 2987, 3, NULL, 'index', 'catalog/news/index', 1, 1, 1),
(2987, 'auth', 2976, 2, NULL, 'news', 'catalog/news', 1, 1, 3),
(2986, 'auth', 2982, 3, NULL, 'delete', 'catalog/information/delete', 1, 1, 4),
(2985, 'auth', 2982, 3, NULL, 'edit', 'catalog/information/edit', 1, 1, 3),
(2984, 'auth', 2982, 3, NULL, 'add', 'catalog/information/add', 1, 1, 2),
(2983, 'auth', 2982, 3, 'index', '信息页', 'catalog/information/index', 1, 1, 1),
(2982, 'auth', 2976, 2, NULL, 'information', 'catalog/information', 1, 1, 2),
(2980, 'auth', 2977, 3, NULL, 'edit', 'catalog/faq/edit', 1, 1, 3),
(2979, 'auth', 2977, 3, NULL, 'add', 'catalog/faq/add', 1, 1, 2),
(2978, 'auth', 2977, 3, NULL, 'index', 'catalog/faq/index', 1, 1, 1),
(2976, 'auth', 0, 1, NULL, 'Catalog', '', 1, 1, 1),
(2977, 'auth', 2976, 2, NULL, 'faq', 'catalog/faq', 1, 1, 1),
(2962, 'menu', 0, 1, NULL, '{"cn":"\\u7528\\u6237\\u4e2d\\u5fc3","en":"Profile Center"}', '', 1, 1, 0),
(2963, 'menu', 2962, 2, NULL, '{"cn":"\\u8bbe\\u7f6e","en":"Setting"}', 'common/private', 1, 1, 0),
(2964, 'menu', 2962, 2, NULL, '{"cn":"\\u6211\\u7684\\u7a3f\\u4ef6","en":"My Posts"}', '', 1, 1, 3),
(2965, 'menu', 2964, 3, NULL, '{"cn":"\\u5e7f\\u544a\\u7a3f\\u4ef6","en":"Ads Posts"}', 'profile/ads_post', 1, 1, 1),
(2966, 'menu', 2964, 3, NULL, '{"cn":"NFL\\u7a3f\\u4ef6","en":"NFL Posts"}', 'nfl/profile_player', 1, 1, 2),
(2967, 'menu', 2964, 3, NULL, '{"cn":"\\u8d26\\u53f7\\u6709\\u56fe\\u7247\\u7a3f\\u4ef6","en":"Account With Photo"}', 'fbaccount/profile_photo', 1, 1, 3),
(2968, 'menu', 2964, 3, NULL, '{"cn":"\\u8d26\\u53f7\\u65e0\\u56fe\\u7247\\u7a3f\\u4ef6","en":"Account Without Photo"}', 'fbaccount/profile_nophoto', 1, 1, 4),
(2969, 'menu', 2964, 3, NULL, '{"cn":"\\u4e13\\u9875\\u65e0\\u56fe\\u7247\\u7a3f\\u4ef6","en":"Page Without Photo"}', 'fbpage/profile_nophoto', 1, 1, 5),
(2970, 'menu', 2964, 3, NULL, '{"cn":"\\u6d88\\u606f\\u7a3f\\u4ef6","en":"Message"}', 'fbmessage/profile_nophoto', 1, 1, 6),
(2971, 'menu', 2115, 2, NULL, '{"cn":"\\u5df2\\u53d1\\u5e03\\u7a3f\\u4ef6","en":"Publish Posts"}', '', 1, 1, 3),
(2972, 'menu', 2971, 3, NULL, '{"cn":"\\u8d26\\u53f7\\u6709\\u56fe\\u7247\\u7a3f\\u4ef6","en":"Account With Photo"}', 'fbaccount/publish_photo', 1, 1, 1),
(2973, 'menu', 2971, 3, NULL, '{"cn":"\\u8d26\\u53f7\\u65e0\\u56fe\\u7247\\u7a3f\\u4ef6","en":"Account Without Photo"}', 'fbaccount/publish_nophoto', 1, 1, 2),
(2974, 'menu', 2971, 3, NULL, '{"cn":"\\u4e13\\u9875\\u7a3f\\u4ef6","en":"Facebook Page"}', 'fbpage/publish_nophoto', 1, 1, 3),
(2975, 'menu', 2971, 3, NULL, '{"cn":"\\u6d88\\u606f\\u7a3f\\u4ef6","en":"Facebook Message"}', 'fbmessage/publish_nophoto', 1, 1, 4),
(3381, 'auth', 3379, 3, NULL, 'template', 'setting/setting/template', 1, 1, 2),
(3382, 'auth', 3379, 3, NULL, 'country', 'setting/setting/country', 1, 1, 3),
(3403, 'auth', 0, 1, NULL, 'Tool', '', 1, 1, 16),
(3404, 'auth', 3403, 2, NULL, 'backup', 'tool/backup', 1, 1, 1),
(3405, 'auth', 3404, 3, NULL, 'index', 'tool/backup/index', 1, 1, 1),
(3406, 'auth', 3404, 3, NULL, 'backup', 'tool/backup/backup', 1, 1, 2),
(3407, 'auth', 3403, 2, NULL, 'cron_log', 'tool/cron_log', 1, 1, 2),
(3408, 'auth', 3407, 3, NULL, 'index', 'tool/cron_log/index', 1, 1, 1),
(3409, 'auth', 3407, 3, NULL, 'delete', 'tool/cron_log/delete', 1, 1, 2),
(3410, 'auth', 3407, 3, NULL, 'truncate', 'tool/cron_log/truncate', 1, 1, 3),
(3411, 'auth', 3403, 2, NULL, 'error_log', 'tool/error_log', 1, 1, 3),
(3412, 'auth', 3411, 3, NULL, 'index', 'tool/error_log/index', 1, 1, 1),
(3413, 'auth', 3411, 3, NULL, 'clear', 'tool/error_log/clear', 1, 1, 2),
(3414, 'auth', 3403, 2, NULL, 'upload', 'tool/upload', 1, 1, 4),
(3415, 'auth', 3414, 3, NULL, 'index', 'tool/upload/index', 1, 1, 1),
(3416, 'auth', 3414, 3, NULL, 'delete', 'tool/upload/delete', 1, 1, 2),
(3417, 'auth', 3414, 3, NULL, 'download', 'tool/upload/download', 1, 1, 3),
(3418, 'auth', 3414, 3, NULL, 'upload', 'tool/upload/upload', 1, 1, 4),
(3419, 'auth', 0, 1, NULL, 'User', '', 1, 1, 17),
(3420, 'auth', 3419, 2, NULL, 'user', 'user/user', 1, 1, 1),
(3421, 'auth', 3420, 3, NULL, 'index', 'user/user/index', 1, 1, 1),
(3422, 'auth', 3420, 3, NULL, 'add', 'user/user/add', 1, 1, 2),
(3423, 'auth', 3420, 3, NULL, 'edit', 'user/user/edit', 1, 1, 3),
(3424, 'auth', 3420, 3, NULL, 'delete', 'user/user/delete', 1, 1, 4),
(3425, 'auth', 3419, 2, NULL, 'user_log', 'user/user_log', 1, 1, 2),
(3426, 'auth', 3425, 3, NULL, 'index', 'user/user_log/index', 1, 1, 1),
(3427, 'auth', 3425, 3, NULL, 'view', 'user/user_log/view', 1, 1, 2),
(3428, 'auth', 3425, 3, NULL, 'delete', 'user/user_log/delete', 1, 1, 3),
(3429, 'auth', 3425, 3, NULL, 'truncate', 'user/user_log/truncate', 1, 1, 4),
(3430, 'auth', 3425, 3, NULL, 'export_logs', 'user/user_log/export_logs', 1, 1, 5),
(3431, 'auth', 3419, 2, NULL, 'user_permission', 'user/user_permission', 1, 1, 3),
(3432, 'auth', 3431, 3, NULL, 'index', 'user/user_permission/index', 1, 1, 1),
(3433, 'auth', 3431, 3, NULL, 'add', 'user/user_permission/add', 1, 1, 2),
(3434, 'auth', 3431, 3, NULL, 'edit', 'user/user_permission/edit', 1, 1, 3),
(3435, 'auth', 3431, 3, NULL, 'delete', 'user/user_permission/delete', 1, 1, 4),
(3436, 'menu', 2971, 3, NULL, '{"cn":"NFL\\u7403\\u5458\\u7a3f\\u4ef6","en":"NFL Player Post"}', 'nfl/publish_player', 1, 1, 1),
(3439, 'menu', 132, 1, NULL, '{"en":"AD Report","cn":"\\u5e7f\\u544a\\u62a5\\u8868"}', '', 1, 1, 6),
(3440, 'menu', 3439, 1, NULL, '{"en":"Targeting Running Report","cn":"\\u8fd0\\u884c\\u72b6\\u6001\\u62a5\\u8868"}', 'report/targeting', 1, 1, 1),
(3441, 'menu', 3439, 1, NULL, '{"en":"Artist Report","cn":"\\u7f8e\\u5de5\\u62a5\\u8868"}', '', 1, 1, 2),
(3442, 'menu', 132, 1, NULL, '{"en":"AD Template","cn":"\\u5e7f\\u544a\\u6a21\\u677f"}', '', 1, 1, 7),
(3443, 'menu', 3442, 1, NULL, '{"en":"Targeting Template","cn":"\\u5b9a\\u4f4d\\u6a21\\u677f"}', 'service/template', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project`
--

CREATE TABLE `gd_project` (
  `project_id` int(11) NOT NULL,
  `project_sn` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('investing','recycling') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'investing',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(11,2) NOT NULL DEFAULT '0.00',
  `value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(4) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `lasttime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project`
--

INSERT INTO `gd_project` (`project_id`, `project_sn`, `title`, `mode`, `customer_id`, `realname`, `phone`, `price`, `weight`, `value`, `status`, `worker_id`, `addtime`, `lasttime`) VALUES
(1, 'SD201564545645', '测试titleA', 'investing', 0, 'OKOK', '18800011000', '288.88', '100.00', '28888.00', 1, 0, 1470000000, 0),
(2, 'SD201554545645', '测试titleB', 'investing', 0, 'OKOK', '18800011001', '288.88', '100.00', '28888.00', 1, 1, 1470000000, 0);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_investing_status`
--

CREATE TABLE `gd_project_investing_status` (
  `status_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_investing_status`
--

INSERT INTO `gd_project_investing_status` (`status_id`, `title`, `code`, `note`, `status`) VALUES
(1, '已申请', 'applied', '登记客户买金信息', 1),
(2, '已核实', 'checked', '上级主管核对客户及库存信息，并确认', 1),
(3, '已确认', 'confirmed', '库管确认并标记', 1),
(4, '已到期', 'expired', '项目到期，生金', 1),
(5, '已完结', 'finished', '到期取金，项目完结 （可转到金生金）', 1),
(6, '库存不足', 'lacking', '库存金，数量不足', 1),
(7, '已拒绝', 'refused', '客户信息等问题造成', 1),
(8, '已终止', 'terminated', '客户提前终止项目', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_recycling_status`
--

CREATE TABLE `gd_project_recycling_status` (
  `status_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_recycling_status`
--

INSERT INTO `gd_project_recycling_status` (`status_id`, `title`, `code`, `note`, `status`) VALUES
(1, '已申请', 'applied', '登记客户存金信息', 1),
(2, '鉴定中', 'appraising', '旧金鉴定过程', 1),
(3, '待确认', 'waiting', '等待客户确认鉴定结果', 1),
(4, '已同意', 'agreed', '客户同意鉴定结果，确认其间损耗及最终实重', 1),
(5, '已核实', 'checked', '上级主管同意该存金信息，将转到库管处', 1),
(6, '已确认', 'confirmed', '库管确认并标记', 1),
(7, '已到期', 'expired', '项目到期，生金', 1),
(8, '已完结', 'finished', '到期取金，项目完结 （可转到金生金）', 1),
(9, '已拒绝', 'refused', '客户信息等问题造成', 1),
(10, '已终止', 'terminated', '客户提前终止项目', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_sessions`
--

CREATE TABLE `gd_sessions` (
  `sess_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_sessions`
--

INSERT INTO `gd_sessions` (`sess_id`, `ip_address`, `timestamp`, `data`) VALUES
('e604f0125f731465680ccdb0b8a249d9c47e4bed', '127.0.0.1', 1471414329, '__ci_last_regenerate|i:1471414047;code|s:4:"3G8K";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471396526";'),
('efaf13a8352ed24273d8677ab3649d4fbad9bd68', '127.0.0.1', 1471414940, '__ci_last_regenerate|i:1471414450;code|s:4:"pStH";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471406022";'),
('d48ea061d9f19e4646f2f78c7b92eb8472baaff7', '127.0.0.1', 1471416781, '__ci_last_regenerate|i:1471414973;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('59998434f15ef3f57845b287b4bdca55c1d649f4', '127.0.0.1', 1471416873, '__ci_last_regenerate|i:1471416781;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";success|s:12:"保存成功";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('23c04b8458bda21a5bb22320c37291e14b6bb03a', '127.0.0.1', 1471417516, '__ci_last_regenerate|i:1471417094;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";success|s:12:"保存成功";__ci_vars|a:1:{s:7:"success";s:3:"old";}'),
('ab1f9b8448b4533e8b0dde9febfeff7fdd082a30', '127.0.0.1', 1471417943, '__ci_last_regenerate|i:1471417641;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('cd4bbcabc204a5e55ba2e8d330046971fba76032', '127.0.0.1', 1471418460, '__ci_last_regenerate|i:1471418161;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('0fd4fa9e371db3006cbee06c03cd053a9636b5a4', '127.0.0.1', 1471419169, '__ci_last_regenerate|i:1471418482;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('14364603b0004b786eed63bff5eac12919aaf5a5', '127.0.0.1', 1471419537, '__ci_last_regenerate|i:1471419170;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";success|s:12:"保存成功";__ci_vars|a:1:{s:7:"success";s:3:"old";}'),
('e8ba1b73cf4c99d2cdfb89a04c1f9d44d0b5c9de', '127.0.0.1', 1471420272, '__ci_last_regenerate|i:1471420007;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('4fd07e5f132aee4e885799d00a4c82ab553a4660', '127.0.0.1', 1471420369, '__ci_last_regenerate|i:1471420369;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('4d46a31852d3ffe06b2a39e916eb0658bec7ee2e', '127.0.0.1', 1471421988, '__ci_last_regenerate|i:1471421877;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('45c838b1705c0f398e9ad13c06d80aaba80fdfdd', '127.0.0.1', 1471422705, '__ci_last_regenerate|i:1471422427;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('2a552050ae9e99221ec76945afb2c840769684d8', '127.0.0.1', 1471423069, '__ci_last_regenerate|i:1471422822;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('ec29e2758eae564597cdae7d96113f73dde053c4', '127.0.0.1', 1471423425, '__ci_last_regenerate|i:1471423156;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('c75df227e6257166e59ebf09aa73ad18736b4b47', '127.0.0.1', 1471423478, '__ci_last_regenerate|i:1471423478;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('c252910311fb63b3df9b35f604496458a5a98e16', '127.0.0.1', 1471424143, '__ci_last_regenerate|i:1471423868;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('ad44d88f1f01e05a0021b91e3a84adfbd3be2d27', '127.0.0.1', 1471424208, '__ci_last_regenerate|i:1471424208;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('ab493b58c04221b6e2d614cab863871513099d72', '127.0.0.1', 1471424874, '__ci_last_regenerate|i:1471424586;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('5b9940f8109ac9904ed84aefff7a049801434d63', '127.0.0.1', 1471425182, '__ci_last_regenerate|i:1471424893;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('8c56f796fa176974a4b8491b9d0b7e0d64ea9cd9', '127.0.0.1', 1471427961, '__ci_last_regenerate|i:1471425209;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('8ac4017986ced2559840c28a287e3b634f42b977', '127.0.0.1', 1471428005, '__ci_last_regenerate|i:1471427974;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";'),
('84ebc43aec161e80e9a9ffb698f8db4b1396b7a9', '127.0.0.1', 1471428394, '__ci_last_regenerate|i:1471428307;code|s:4:"5KrF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471414940";');

-- --------------------------------------------------------

--
-- 表的结构 `gd_setting`
--

CREATE TABLE `gd_setting` (
  `setting_id` int(11) UNSIGNED NOT NULL,
  `code` varchar(64) NOT NULL DEFAULT '',
  `value` text,
  `serialized` tinyint(1) NOT NULL DEFAULT '0',
  `group` varchar(64) NOT NULL DEFAULT 'config',
  `initial` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gd_setting`
--

INSERT INTO `gd_setting` (`setting_id`, `code`, `value`, `serialized`, `group`, `initial`) VALUES
(1, 'script_version', '', 0, 'script', 0),
(2, 'script_build', '', 0, 'script', 0),
(3, 'script_db_version', '', 0, 'script', 0),
(4, 'site_name', 'Demo Site', 0, 'site', 1),
(5, 'site_keywords', 'keywords, go, here', 0, 'site', 1),
(6, 'site_description', 'Demo Site description', 0, 'site', 1),
(7, 'site_email', 'noreply@example.com', 0, 'site', 1),
(8, 'golden_price', 'a:2:{s:6:"apikey";s:32:"4471799b928e767bbf8278c4fd8eccd8";s:6:"apiurl";s:41:"http://apis.baidu.com/netpopo/gold/shgold";}', 1, 'api', 1),
(9, 'investing_privacy', '2', 0, 'project', 1),
(10, 'investing_initial', '1', 0, 'project', 1),
(11, 'recycling_privacy', '3', 0, 'project', 1),
(12, 'recycling_initial', '1', 0, 'project', 1),
(13, 'profit', '6', 0, 'project', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker`
--

CREATE TABLE `gd_worker` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `realname` varchar(32) NOT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `last_login` int(11) DEFAULT '0',
  `last_ip` char(15) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gd_worker`
--

INSERT INTO `gd_worker` (`id`, `username`, `realname`, `avatar`, `password`, `salt`, `email`, `remember_code`, `addtime`, `last_login`, `last_ip`, `status`, `phone`) VALUES
(1, 'admin-root', '管理员', 'public/images/avatar/121034209220f1.jpg', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', NULL, 1469999823, 1471416781, '127.0.0.1', 1, '0'),
(2, 'zhujingxiu', '朱景修', NULL, '$2y$08$QQOBCnHUhFTH/CjeWztJGOOfAz2xuqSki7P2qn5/WojZQvXc10NAK', NULL, 'zhujingxiu@hotmail.com', NULL, 1470736567, 1470736771, '127.0.0.1', 1, '18850911766');

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_activity`
--

CREATE TABLE `gd_worker_activity` (
  `activity_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_attempt`
--

CREATE TABLE `gd_worker_attempt` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_group`
--

CREATE TABLE `gd_worker_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `permission` text,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gd_worker_group`
--

INSERT INTO `gd_worker_group` (`id`, `name`, `title`, `permission`, `status`) VALUES
(1, 'admin', '管理组', '', 1),
(2, 'members', '未分组', '2997,2999,3001,3003,2998,3000,3002', 1),
(3, 'caiwu', '财务', '2976,2978,2979,2980,2983,2984,2985,2986,2988,2989,2990,2991,2977,2982,2987', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_notify`
--

CREATE TABLE `gd_worker_notify` (
  `notify_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL DEFAULT '0',
  `receiver_id` int(11) NOT NULL,
  `mode` enum('announcement',' summary') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'announcement',
  `title` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_rel`
--

CREATE TABLE `gd_worker_rel` (
  `id` int(11) UNSIGNED NOT NULL,
  `worker_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gd_worker_rel`
--

INSERT INTO `gd_worker_rel` (`id`, `worker_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gd_article`
--
ALTER TABLE `gd_article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `gd_article_category`
--
ALTER TABLE `gd_article_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `gd_golden_price`
--
ALTER TABLE `gd_golden_price`
  ADD PRIMARY KEY (`price_id`);

--
-- Indexes for table `gd_golden_today`
--
ALTER TABLE `gd_golden_today`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gd_node`
--
ALTER TABLE `gd_node`
  ADD PRIMARY KEY (`node_id`);

--
-- Indexes for table `gd_project`
--
ALTER TABLE `gd_project`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `gd_project_investing_status`
--
ALTER TABLE `gd_project_investing_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `gd_project_recycling_status`
--
ALTER TABLE `gd_project_recycling_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `gd_sessions`
--
ALTER TABLE `gd_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `gd_setting`
--
ALTER TABLE `gd_setting`
  ADD PRIMARY KEY (`setting_id`,`code`),
  ADD KEY `option_name` (`code`),
  ADD KEY `auto_load` (`initial`);

--
-- Indexes for table `gd_worker`
--
ALTER TABLE `gd_worker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gd_worker_activity`
--
ALTER TABLE `gd_worker_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `gd_worker_attempt`
--
ALTER TABLE `gd_worker_attempt`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gd_worker_group`
--
ALTER TABLE `gd_worker_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gd_worker_notify`
--
ALTER TABLE `gd_worker_notify`
  ADD PRIMARY KEY (`notify_id`);

--
-- Indexes for table `gd_worker_rel`
--
ALTER TABLE `gd_worker_rel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`worker_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`worker_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `gd_article`
--
ALTER TABLE `gd_article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `gd_article_category`
--
ALTER TABLE `gd_article_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `gd_golden_price`
--
ALTER TABLE `gd_golden_price`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_golden_today`
--
ALTER TABLE `gd_golden_today`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_node`
--
ALTER TABLE `gd_node`
  MODIFY `node_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3444;
--
-- 使用表AUTO_INCREMENT `gd_project`
--
ALTER TABLE `gd_project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `gd_project_investing_status`
--
ALTER TABLE `gd_project_investing_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `gd_project_recycling_status`
--
ALTER TABLE `gd_project_recycling_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `gd_setting`
--
ALTER TABLE `gd_setting`
  MODIFY `setting_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `gd_worker`
--
ALTER TABLE `gd_worker`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `gd_worker_activity`
--
ALTER TABLE `gd_worker_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_worker_attempt`
--
ALTER TABLE `gd_worker_attempt`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_worker_group`
--
ALTER TABLE `gd_worker_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `gd_worker_notify`
--
ALTER TABLE `gd_worker_notify`
  MODIFY `notify_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_worker_rel`
--
ALTER TABLE `gd_worker_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 限制导出的表
--

--
-- 限制表 `gd_worker_rel`
--
ALTER TABLE `gd_worker_rel`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `gd_worker_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`worker_id`) REFERENCES `gd_worker` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
