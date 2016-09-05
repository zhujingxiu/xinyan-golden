-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 �?09 �?05 �?23:08
-- 服务器版本: 5.5.47
-- PHP 版本: 5.5.30

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `golden`
--

-- --------------------------------------------------------

--
-- 表的结构 `gd_article`
--

CREATE TABLE IF NOT EXISTS `gd_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `is_top` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

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

CREATE TABLE IF NOT EXISTS `gd_article_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `gd_article_category`
--

INSERT INTO `gd_article_category` (`category_id`, `code`, `title`, `is_admin`, `status`, `worker_id`, `addtime`) VALUES
(1, 'daily', '每日金评', 0, 1, 1, 1470088332),
(2, 'privacy', '条款协议', 0, 1, 1, 1470088332),
(3, 'news', '新闻', 0, 1, 1, 1471174877);

-- --------------------------------------------------------

--
-- 表的结构 `gd_cron_schedule`
--

CREATE TABLE IF NOT EXISTS `gd_cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_code` varchar(255) NOT NULL DEFAULT '0',
  `status` enum('pending','running','success','missed','error') NOT NULL DEFAULT 'pending',
  `messages` text,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `executed_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `finished_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`schedule_id`),
  KEY `task_name` (`job_code`),
  KEY `scheduled_at` (`scheduled_at`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer`
--

CREATE TABLE IF NOT EXISTS `gd_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `idnumber` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `wechat` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `qq` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `referrer_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `gd_customer`
--

INSERT INTO `gd_customer` (`customer_id`, `realname`, `avatar`, `phone`, `idnumber`, `wechat`, `qq`, `group_id`, `status`, `referrer_id`, `note`, `worker_id`, `addtime`, `lasttime`) VALUES
(2, '李百度', NULL, '18850911766', '321245198905080904', '', NULL, 1, 1, '2', NULL, 5, 1472552472, 1472552472),
(3, '刘京东', NULL, '18959506595', '321324199008080808', '', NULL, 1, 1, '2', NULL, 5, 1472559583, 1472559583),
(4, '马晓云', NULL, '18850219878', '321324195406050508', '', NULL, 1, 1, '2', NULL, 5, 1472604934, 1472604934),
(5, '马腾讯', NULL, '18959596565', '321254198808050604', '', NULL, 1, 1, '12', NULL, 5, 1472605860, 1472605860),
(6, '余华为', NULL, '18959596767', '321254198908050604', '', NULL, 1, 1, '12', NULL, 5, 1472605860, 1472605860),
(7, '雷小米', NULL, '13113213313', '321254197708053454', 'leixiaomi', '324456532', 1, 1, '', '', 3, 1472645815, 1472645866),
(8, '乔苹果', NULL, '18808800990', '325225197008078888', 'qiaopingguo', '32323454435', 2, 1, '12', '乔帮主', 3, 1472646256, 1472646256),
(9, '沈万三', NULL, '13813800138', '138139199810039997', 'shenwansan', '', 2, 1, '12', 'asdsadasds', 3, 1472707274, 1472707274),
(10, '赵公明', NULL, '13606660888', '123321196606066666', 'zhaogongming', '', 3, 1, '12', 'asdsad', 1, 1473059868, 1473059868);

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer_apply`
--

CREATE TABLE IF NOT EXISTS `gd_customer_apply` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` decimal(11,2) NOT NULL DEFAULT '0.00',
  `mode` enum('appling','order') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'appling',
  `note` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer_group`
--

CREATE TABLE IF NOT EXISTS `gd_customer_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule` text COLLATE utf8_unicode_ci,
  `note` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `gd_customer_group`
--

INSERT INTO `gd_customer_group` (`group_id`, `title`, `code`, `icon`, `rule`, `note`, `status`, `worker_id`, `addtime`, `lasttime`) VALUES
(1, '铜牌', 'bronze', NULL, NULL, '铜牌客户', 1, 1, 1472583692, 1472583692),
(2, '银牌', 'silver', NULL, NULL, '银牌客户', 1, 1, 1472589632, 1472589632),
(3, '金牌', ' gold', NULL, NULL, '金牌客户', 1, 1, 1472589963, 1472589963),
(4, '钻石', 'diamond', NULL, NULL, '钻石客户', 1, 1, 1472589995, 1472589995);

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer_history`
--

CREATE TABLE IF NOT EXISTS `gd_customer_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `gd_customer_history`
--

INSERT INTO `gd_customer_history` (`history_id`, `customer_id`, `note`, `worker_id`, `addtime`) VALUES
(1, 7, '申请提金：15.00克', 3, 1472655342),
(2, 7, '取消提金：15.00克<br>sadsadasdsad', 3, 1472655831),
(3, 8, '申请提金：12.00克', 3, 1472655913),
(4, 7, '申请提金：11.00克', 3, 1472658219),
(5, 8, '申请提金：10.00克', 3, 1472658396),
(6, 8, '申请提金：5.00克', 3, 1472799106);

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer_stock`
--

CREATE TABLE IF NOT EXISTS `gd_customer_stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `mode` enum('in','out','profit','free') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'profit',
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `weight` decimal(13,2) NOT NULL DEFAULT '0.00',
  `file` text COLLATE utf8_unicode_ci,
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `gd_customer_stock`
--

INSERT INTO `gd_customer_stock` (`stock_id`, `customer_id`, `mode`, `project_sn`, `weight`, `file`, `notify`, `note`, `worker_id`, `addtime`) VALUES
(4, 7, 'in', 'GR1608319242154447', '31.00', NULL, 1, '', 3, 1472653349),
(5, 8, 'in', 'GR1608315162053241', '20.00', NULL, 1, '', 3, 1472653784),
(7, 8, 'out', '', '-10.00', NULL, 1, '阿萨德撒的撒', 7, 1472658506),
(8, 3, 'in', 'GM1609011461040439', '15.00', NULL, 1, '下自成蹊政策性支持下自成蹊', 3, 1472706778),
(9, 6, 'in', 'GM1609016370915225', '10.00', NULL, 1, '删除项目', 3, 1472707008),
(10, 8, 'out', '', '-5.00', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/0215531356de7a.txt"},{"name":"29155000ed424f.txt","path":"public\\/uploads\\/2016\\/09\\/02155332f92559.txt"}]', 1, 'asdsadsadsadsa', 7, 1472802999),
(11, 6, 'profit', 'GM1609016370915225', '1.15', NULL, 1, '删除项目', 3, 1472707008);

-- --------------------------------------------------------

--
-- 表的结构 `gd_golden_price`
--

CREATE TABLE IF NOT EXISTS `gd_golden_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typename` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `gd_golden_price`
--

INSERT INTO `gd_golden_price` (`id`, `date`, `type`, `typename`, `price`, `addtime`) VALUES
(1, '2016-08-25', 'Au99.99', '沪金99', '284.89', 1472186901),
(2, '2016-08-22', 'Au99.99', ' 沪金99', '286.36', 1471234567),
(3, '2016-08-23', 'Au99.99', ' 沪金99', '286.82', 1471234567),
(4, '2016-08-24', 'Au99.99', ' 沪金99', '286.70', 1471234567),
(6, '2016-08-19', 'Au99.99', ' 沪金99', '288.20', 1471234567),
(7, '2016-08-18', 'Au99.99', ' 沪金99', '288.87', 1471234567),
(8, '2016-08-17', 'Au99.99', ' 沪金99', '286.79', 1471234567),
(9, '2016-08-16', 'Au99.99', ' 沪金99', '287.98', 1471234567),
(10, '2016-08-15', 'Au99.99', ' 沪金99', '287.35', 1471234567),
(11, '2016-08-12', 'Au99.99', ' 沪金99', '286.80', 1471234567),
(12, '2016-08-11', 'Au99.99', ' 沪金99', '287.84', 1471234567),
(13, '2016-08-10', 'Au99.99', ' 沪金99', '289.80', 1471234567),
(14, '2016-08-09', 'Au99.99', ' 沪金99', '289.00', 1471234567),
(15, '2016-08-08', 'Au99.99', ' 沪金99', '286.42', 1471234567),
(16, '2016-08-05', 'Au99.99', ' 沪金99', '292.12', 1471234567),
(17, '2016-08-04', 'Au99.99', ' 沪金99', '289.05', 1471234567),
(18, '2016-08-03', 'Au99.99', ' 沪金99', '291.90', 1471234567),
(19, '2016-08-02', 'Au99.99', ' 沪金99', '290.10', 1471234567),
(20, '2016-08-01', 'Au99.99', ' 沪金99', '288.17', 1471234567),
(21, '2016-07-29', 'Au99.99', ' 沪金99', '285.83', 1471234567),
(22, '2016-07-28', 'Au99.99', ' 沪金99', '287.71', 1471234567),
(23, '2016-07-27', 'Au99.99', ' 沪金99', '283.63', 1471234567),
(24, '2016-08-26', 'Au99.99', '沪金99', '284.89', 1472260847),
(25, '2016-08-27', 'Au99.99', '沪金99', '284.89', 1472399839),
(26, '2016-08-28', 'Au99.99', '沪金99', '284.89', 1472400119),
(27, '2016-08-29', 'Au99.99', '沪金99', '283.50', 1472518017),
(28, '2016-08-30', 'Au99.99', '沪金99', '283.99', 1472573192),
(29, '2016-08-31', 'Au99.99', '沪金99', '283.19', 1472690403),
(30, '2016-09-01', 'Au99.99', '沪金99', '281.49', 1472747309),
(31, '2016-09-04', 'Au99.99', '沪金99', '282.46', 1473047202);

-- --------------------------------------------------------

--
-- 表的结构 `gd_golden_today`
--

CREATE TABLE IF NOT EXISTS `gd_golden_today` (
  `date` date DEFAULT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `typename` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opening` decimal(8,2) NOT NULL DEFAULT '0.00',
  `maxprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `minprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change` decimal(6,2) NOT NULL DEFAULT '0.00',
  `lastclosing` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tradeamount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  KEY `date` (`date`),
  KEY `updatetime` (`updatetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_golden_today`
--

INSERT INTO `gd_golden_today` (`date`, `type`, `typename`, `price`, `opening`, `maxprice`, `minprice`, `change`, `lastclosing`, `tradeamount`, `updatetime`, `addtime`) VALUES
('2016-09-05', 'Au(T+D)', '黄金延期', '285.05', '282.63', '286.00', '281.20', '0.96', '282.35', '96974.0000', 1473044550, 1473047202),
('2016-09-05', 'Au(T+N1)', '延期单金', '287.80', '286.95', '288.95', '284.60', '0.93', '285.15', '12173.8000', 1473044518, 1473047202),
('2016-09-05', 'Au(T+N2)', '延期双金', '286.25', '285.60', '286.50', '285.60', '1.02', '283.35', '8048.2000', 1473044497, 1473047202),
('2016-09-05', 'mAu(T+D)', '迷你黄金延期', '285.10', '282.65', '286.00', '281.35', '0.93', '282.46', '6530.6000', 1473044550, 1473047202),
('2016-09-05', 'Au99.99', '沪金99', '285.10', '284.54', '285.50', '282.65', '0.93', '282.46', '3915.1800', 1473044545, 1473047202),
('2016-09-05', 'Au99.95', '沪金95', '284.90', '282.30', '285.00', '282.30', '0.98', '282.13', '426.0000', 1473044502, 1473047202),
('2016-09-05', 'Pt99.95', '沪铂95', '244.25', '241.50', '244.25', '241.50', '1.86', '239.79', '80.0000', 1473044535, 1473047202),
('2016-09-05', 'Au100g', '沪金100G', '285.00', '283.50', '285.30', '283.50', '0.73', '282.94', '19.6000', 1473044485, 1473047202),
('2016-09-05', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473037523, 1473047202),
('2016-09-04', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1472989211, 1473047202),
('2016-09-05', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '283.50', '0.0000', 1473044543, 1473047202),
('2016-09-05', 'Au(T+D)', '黄金延期', '285.00', '282.63', '286.00', '281.20', '0.94', '282.35', '96374.0000', 1473043979, 1473047341),
('2016-09-05', 'Au(T+N1)', '延期单金', '287.80', '286.95', '288.95', '284.60', '0.93', '285.15', '12173.8000', 1473043966, 1473047341),
('2016-09-05', 'Au(T+N2)', '延期双金', '286.25', '285.60', '286.50', '285.60', '1.02', '283.35', '8048.2000', 1473043956, 1473047341),
('2016-09-05', 'mAu(T+D)', '迷你黄金延期', '285.10', '282.65', '286.00', '281.35', '0.93', '282.46', '6493.0000', 1473043978, 1473047341),
('2016-09-05', 'Au99.99', '沪金99', '285.10', '284.54', '285.50', '282.65', '0.93', '282.46', '2649.9400', 1473043977, 1473047341),
('2016-09-05', 'Au99.95', '沪金95', '284.90', '282.30', '285.00', '282.30', '0.98', '282.13', '426.0000', 1473043926, 1473047341),
('2016-09-05', 'Pt99.95', '沪铂95', '244.25', '241.50', '244.25', '241.50', '1.86', '239.79', '80.0000', 1473042014, 1473047341),
('2016-09-05', 'Au100g', '沪金100G', '285.00', '283.50', '285.30', '283.50', '0.73', '282.94', '17.2000', 1473043833, 1473047341),
('2016-09-05', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '283.50', '0.0000', 1473043894, 1473047341),
('2016-09-05', 'Au(T+D)', '黄金延期', '284.97', '282.63', '286.00', '281.20', '0.93', '282.35', '97698.0000', 1473046165, 1473050159),
('2016-09-05', 'Au(T+N1)', '延期单金', '287.90', '286.95', '288.95', '284.60', '0.96', '285.15', '12189.8000', 1473046171, 1473050159),
('2016-09-05', 'Au(T+N2)', '延期双金', '286.30', '285.60', '286.50', '285.60', '1.04', '283.35', '8064.6000', 1473046170, 1473050159),
('2016-09-05', 'mAu(T+D)', '迷你黄金延期', '285.12', '282.65', '286.00', '281.35', '0.94', '282.46', '6601.6000', 1473046168, 1473050159),
('2016-09-05', 'Au99.99', '沪金99', '285.00', '284.54', '285.50', '282.65', '0.90', '282.46', '5022.7800', 1473046170, 1473050159),
('2016-09-05', 'Au99.95', '沪金95', '285.00', '282.30', '285.00', '282.30', '1.02', '282.13', '474.0000', 1473046130, 1473050159),
('2016-09-05', 'Pt99.95', '沪铂95', '244.25', '241.50', '244.25', '241.50', '1.86', '239.79', '110.0000', 1473046156, 1473050159),
('2016-09-05', 'Au100g', '沪金100G', '285.50', '283.50', '285.50', '283.50', '0.90', '282.94', '24.6000', 1473046152, 1473050159),
('2016-09-05', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '283.50', '0.0000', 1473046122, 1473050159),
('2016-09-05', 'Au(T+D)', '黄金延期', '285.20', '282.63', '286.00', '281.20', '1.01', '282.35', '100346.0000', 1473054838, 1473057745),
('2016-09-05', 'Au(T+N1)', '延期单金', '288.00', '286.95', '288.95', '284.60', '1.00', '285.15', '12231.6000', 1473054839, 1473057745),
('2016-09-05', 'Au(T+N2)', '延期双金', '286.60', '285.60', '286.60', '285.60', '1.15', '283.35', '8107.2000', 1473054749, 1473057745),
('2016-09-05', 'mAu(T+D)', '迷你黄金延期', '285.30', '282.65', '286.00', '281.35', '1.01', '282.46', '6717.6000', 1473054839, 1473057745),
('2016-09-05', 'Au99.99', '沪金99', '285.30', '284.54', '285.50', '282.65', '1.01', '282.46', '5914.5400', 1473054829, 1473057745),
('2016-09-05', 'Au99.95', '沪金95', '285.15', '282.30', '285.15', '282.30', '1.07', '282.13', '518.0000', 1473054655, 1473057745),
('2016-09-05', 'Pt99.95', '沪铂95', '244.00', '241.50', '244.25', '241.50', '1.76', '239.79', '116.0000', 1473054753, 1473057745),
('2016-09-05', 'Au100g', '沪金100G', '285.00', '283.50', '285.50', '283.50', '0.73', '282.94', '25.2000', 1473054670, 1473057745),
('2016-09-05', 'iAu99.99', 'IAU99.99', '285.10', '285.10', '285.10', '285.10', '0.56', '283.50', '10.0000', 1473054743, 1473057745),
('2016-09-05', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473053371, 1473057745),
('2016-09-05', 'Au(T+D)', '黄金延期', '285.22', '282.63', '286.00', '281.20', '1.02', '282.35', '101116.0000', 1473055408, 1473059163),
('2016-09-05', 'Au(T+N1)', '延期单金', '288.20', '286.95', '288.95', '284.60', '1.07', '285.15', '12253.8000', 1473055398, 1473059163),
('2016-09-05', 'Au(T+N2)', '延期双金', '286.70', '285.60', '286.70', '285.60', '1.18', '283.35', '8129.2000', 1473055394, 1473059163),
('2016-09-05', 'mAu(T+D)', '迷你黄金延期', '285.30', '282.65', '286.00', '281.35', '1.01', '282.46', '6751.6000', 1473055409, 1473059163),
('2016-09-05', 'Au99.99', '沪金99', '285.35', '284.54', '285.50', '282.65', '1.02', '282.46', '6128.4800', 1473055409, 1473059163),
('2016-09-05', 'Au99.95', '沪金95', '285.15', '282.30', '285.20', '282.30', '1.07', '282.13', '656.0000', 1473055357, 1473059163),
('2016-09-05', 'Au100g', '沪金100G', '285.00', '283.50', '285.50', '283.50', '0.73', '282.94', '25.2000', 1473055359, 1473059163),
('2016-09-05', 'iAu99.99', 'IAU99.99', '285.10', '285.10', '285.10', '285.10', '0.56', '283.50', '10.0000', 1473055384, 1473059163),
('2016-09-05', 'Au(T+D)', '黄金延期', '285.43', '282.63', '286.00', '281.20', '1.09', '282.35', '109094.0000', 1473059042, 1473062120),
('2016-09-05', 'Au99.99', '沪金99', '285.58', '284.54', '285.75', '282.65', '1.10', '282.46', '14426.4400', 1473059038, 1473062120),
('2016-09-05', 'Au(T+N1)', '延期单金', '288.30', '286.95', '288.95', '284.60', '1.10', '285.15', '12258.4000', 1473059021, 1473062120),
('2016-09-05', 'Au(T+N2)', '延期双金', '286.75', '285.60', '286.75', '285.60', '1.20', '283.35', '8130.6000', 1473058772, 1473062120),
('2016-09-05', 'mAu(T+D)', '迷你黄金延期', '285.47', '282.65', '286.00', '281.35', '1.07', '282.46', '7168.8000', 1473059039, 1473062120),
('2016-09-05', 'Au99.95', '沪金95', '285.45', '282.30', '285.70', '282.30', '1.18', '282.13', '868.0000', 1473058941, 1473062120),
('2016-09-05', 'Pt99.95', '沪铂95', '243.50', '241.50', '244.25', '241.50', '1.55', '239.79', '118.0000', 1473058982, 1473062120),
('2016-09-05', 'Au100g', '沪金100G', '285.50', '283.50', '285.50', '283.50', '0.90', '282.94', '35.8000', 1473058984, 1473062120),
('2016-09-05', 'iAu99.99', 'IAU99.99', '285.20', '285.10', '285.20', '285.10', '0.60', '283.50', '10.0200', 1473058918, 1473062120),
('2016-09-05', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473056617, 1473062120),
('2016-09-05', 'Au(T+D)', '黄金延期', '285.16', '282.63', '286.00', '281.20', '1.00', '282.35', '111340.0000', 1473060570, 1473063609),
('2016-09-05', 'Au(T+N1)', '延期单金', '287.15', '286.95', '288.95', '284.60', '0.70', '285.15', '16263.2000', 1473060548, 1473063609),
('2016-09-05', 'Au99.99', '沪金99', '285.39', '284.54', '285.75', '282.65', '1.04', '282.46', '15594.4200', 1473060570, 1473063609),
('2016-09-05', 'Au(T+N2)', '延期双金', '285.20', '285.60', '286.75', '285.20', '0.65', '283.35', '12168.4000', 1473060562, 1473063609),
('2016-09-05', 'mAu(T+D)', '迷你黄金延期', '285.26', '282.65', '286.00', '281.35', '0.99', '282.46', '7347.2000', 1473060570, 1473063609),
('2016-09-05', 'Au99.95', '沪金95', '285.20', '282.30', '285.70', '282.30', '1.09', '282.13', '896.0000', 1473060570, 1473063609),
('2016-09-05', 'Pt99.95', '沪铂95', '243.50', '241.50', '244.25', '241.50', '1.55', '239.79', '124.0000', 1473060570, 1473063609),
('2016-09-05', 'Au100g', '沪金100G', '285.30', '283.50', '285.70', '283.50', '0.83', '282.94', '37.8000', 1473060570, 1473063609),
('2016-09-05', 'iAu99.99', 'IAU99.99', '285.20', '285.10', '285.20', '285.10', '0.60', '283.50', '10.0200', 1473060570, 1473063609),
('2016-09-05', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473060570, 1473063609),
('2016-09-05', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1473060570, 1473063609),
('2016-09-05', 'Au(T+D)', '黄金延期', '285.41', '285.47', '285.88', '285.23', '0.09', '285.16', '6346.0000', 1473083761, 1473084348),
('2016-09-05', 'mAu(T+D)', '迷你黄金延期', '285.43', '285.40', '285.84', '285.25', '0.06', '285.25', '510.6000', 1473083759, 1473084348),
('2016-09-05', 'Au99.95', '沪金95', '285.70', '286.00', '286.00', '285.70', '0.12', '285.36', '52.0000', 1473083689, 1473084348),
('2016-09-05', 'Au99.99', '沪金99', '285.40', '286.25', '286.25', '285.40', '0.02', '285.33', '28.1400', 1473083745, 1473084348),
('2016-09-05', 'Pt99.95', '沪铂95', '244.75', '244.75', '244.75', '244.75', '0.28', '244.07', '8.0000', 1473077485, 1473084348),
('2016-09-05', 'Au100g', '沪金100G', '285.99', '285.31', '286.00', '285.31', '0.14', '285.58', '2.2000', 1473083715, 1473084348),
('2016-09-05', 'Au(T+N1)', '延期单金', '288.20', '288.20', '288.20', '287.25', '0.00', '288.20', '1.8000', 1473083738, 1473084348),
('2016-09-05', 'Au(T+N2)', '延期双金', '0.00', '0.00', '0.00', '0.00', '0.00', '285.30', '0.0000', 1473083285, 1473084348),
('2016-09-05', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473080508, 1473084348),
('2016-09-05', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1473075547, 1473084348),
('2016-09-05', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '285.10', '0.0000', 1473083688, 1473084348),
('2016-09-05', 'Au(T+D)', '黄金延期', '285.49', '285.47', '285.88', '285.23', '0.12', '285.16', '6590.0000', 1473084357, 1473086118),
('2016-09-05', 'mAu(T+D)', '迷你黄金延期', '285.49', '285.40', '285.84', '285.25', '0.08', '285.25', '539.0000', 1473084359, 1473086118),
('2016-09-05', 'Au99.99', '沪金99', '285.40', '286.25', '286.25', '285.40', '0.02', '285.33', '28.3200', 1473084352, 1473086118),
('2016-09-05', 'Au100g', '沪金100G', '285.99', '285.31', '286.00', '285.31', '0.14', '285.58', '2.2000', 1473084344, 1473086118),
('2016-09-05', 'Au(T+N1)', '延期单金', '288.20', '288.20', '288.20', '287.25', '0.00', '288.20', '2.0000', 1473084311, 1473086118),
('2016-09-05', 'Au(T+N2)', '延期双金', '0.00', '0.00', '0.00', '0.00', '0.00', '285.30', '0.0000', 1473084281, 1473086118),
('2016-09-05', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '285.10', '0.0000', 1473084324, 1473086118),
('2016-09-05', 'Au(T+D)', '黄金延期', '285.36', '285.47', '285.88', '285.23', '0.07', '285.16', '7310.0000', 1473087391, 1473087919),
('2016-09-05', 'mAu(T+D)', '迷你黄金延期', '285.50', '285.40', '285.84', '285.25', '0.09', '285.25', '611.0000', 1473087388, 1473087919),
('2016-09-05', 'Au99.95', '沪金95', '285.59', '286.00', '286.00', '285.59', '0.08', '285.36', '54.0000', 1473087024, 1473087919),
('2016-09-05', 'Au99.99', '沪金99', '285.55', '286.25', '286.25', '285.40', '0.08', '285.33', '29.1600', 1473087375, 1473087919),
('2016-09-05', 'Au100g', '沪金100G', '285.99', '285.31', '286.00', '285.31', '0.14', '285.58', '3.0000', 1473087327, 1473087919),
('2016-09-05', 'Au(T+N1)', '延期单金', '288.90', '288.20', '288.90', '287.25', '0.24', '288.20', '3.0000', 1473087033, 1473087919),
('2016-09-05', 'iAu99.99', 'IAU99.99', '286.36', '286.36', '286.36', '286.36', '0.44', '285.10', '0.0200', 1473087387, 1473087919),
('2016-09-05', 'Au(T+N2)', '延期双金', '0.00', '0.00', '0.00', '0.00', '0.00', '285.30', '0.0000', 1473087312, 1473087919),
('2016-09-05', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473087178, 1473087919);

-- --------------------------------------------------------

--
-- 表的结构 `gd_node`
--

CREATE TABLE IF NOT EXISTS `gd_node` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` enum('auth','menu') NOT NULL DEFAULT 'auth',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(4) NOT NULL DEFAULT '1',
  `name` varchar(32) DEFAULT NULL,
  `title` text,
  `path` varchar(96) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `auth` tinyint(1) NOT NULL DEFAULT '0',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `note` text,
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120 ;

--
-- 转存表中的数据 `gd_node`
--

INSERT INTO `gd_node` (`node_id`, `mode`, `parent_id`, `level`, `name`, `title`, `path`, `status`, `auth`, `sort`, `note`) VALUES
(1, 'auth', 0, 1, 'tool', '小工具', 'tool', 1, 1, 0, NULL),
(2, 'auth', 1, 1, 'API', '通用接口', 'tool/api', 1, 0, 0, ''),
(3, 'auth', 2, 1, 'golden_price', '获取黄金价格', 'tool/api/price', 1, 0, 0, ''),
(4, 'auth', 0, 1, 'auth', '用户模块', '', 1, 1, 0, ''),
(5, 'auth', 4, 1, 'worker', '员工管理', 'auth/worker', 1, 1, 0, ''),
(6, 'auth', 5, 1, 'list', '员工列表页', 'auth/worker/list', 1, 1, 0, ''),
(7, 'auth', 5, 1, 'check_username', '验证用户名有效', 'auth/worker/check_username', 1, 1, 0, ''),
(8, 'auth', 5, 1, 'save', '添加编辑员工', 'auth/worker/save', 1, 1, 0, ''),
(9, 'auth', 5, 1, 'get_info', '获取员工信息', 'auth/worker/get_info', 1, 1, 0, ''),
(10, 'auth', 5, 1, 'activate', '启用员工', 'auth/worker/activate', 1, 1, 0, ''),
(11, 'auth', 5, 1, 'deactivate', '禁用员工', 'auth/worker/deactivate', 1, 1, 0, ''),
(12, 'auth', 4, 1, 'role', '角色模块', 'auth/role', 1, 1, 0, ''),
(13, 'auth', 12, 1, 'index', '角色列表', 'auth/role/index', 1, 1, 0, ''),
(14, 'auth', 12, 1, 'check_code', '验证角色标识', 'auth/role/check_code', 1, 1, 0, ''),
(15, 'auth', 12, 1, 'save', '添加编辑角色', 'auth/role/save', 1, 1, 0, ''),
(16, 'auth', 12, 1, 'get_info', '获取角色信息', 'auth/role/get_info', 1, 1, 0, ''),
(17, 'auth', 4, 1, 'permission', '权限模块', 'auth/permission', 1, 1, 0, ''),
(18, 'auth', 17, 1, 'index', '权限节点树', 'auth/permission/index', 1, 1, 0, ''),
(19, 'auth', 17, 1, 'save', '添加编辑权限节点', 'auth/permission/save', 1, 1, 0, ''),
(20, 'auth', 17, 1, 'delete', '删除节点', 'auth/permission/delete', 1, 1, 0, ''),
(21, 'auth', 17, 1, 'get_info', '获取节点信息', 'auth/permission/get_info', 1, 1, 0, ''),
(22, 'auth', 4, 1, 'profile', '个人资料', 'auth/profile', 1, 0, 0, ''),
(23, 'auth', 22, 1, 'index', '个人资料页面', 'auth/profile/index', 1, 0, 0, ''),
(24, 'auth', 22, 1, 'check_oldpwd', '验证旧密码', 'auth/profile/check_oldpwd', 1, 0, 0, ''),
(25, 'auth', 22, 1, 'password', '重置密码', 'auth/profile/password', 1, 0, 0, ''),
(26, 'auth', 22, 1, 'save', '编辑个人资料', 'auth/profile/save', 1, 0, 0, ''),
(27, 'auth', 22, 1, 'avatar', '上传头像', 'auth/profile/avatar', 1, 0, 0, ''),
(28, 'auth', 0, 1, 'setting', '参数设置', 'setting', 1, 1, 0, ''),
(29, 'auth', 28, 1, 'system', '平台参数', 'setting/system', 1, 1, 0, ''),
(30, 'auth', 29, 1, 'index', '读取平台参数', 'setting/system/index', 1, 1, 0, ''),
(31, 'auth', 29, 1, 'save', '编辑参数', 'setting/system/save', 1, 1, 0, ''),
(32, 'auth', 28, 1, 'project', '业务参数', 'setting/project', 1, 1, 0, ''),
(33, 'auth', 32, 1, 'index', '读取业务参数', 'setting/project/index', 1, 1, 0, ''),
(34, 'auth', 32, 1, 'save', '编辑参数', 'setting/project/save', 1, 1, 0, ''),
(35, 'auth', 32, 1, 'status_list', '读取项目状态列表', 'setting/project/status_list', 1, 1, 0, ''),
(36, 'auth', 32, 1, 'save_status', '编辑项目状态', 'setting/project/save_status', 1, 1, 0, ''),
(37, 'auth', 32, 1, 'check_status', '验证项目状态标识', 'setting/project/check_status', 1, 1, 0, ''),
(38, 'auth', 32, 1, 'get_status', '获取项目状态信息', 'setting/project/get_status', 1, 1, 0, ''),
(39, 'auth', 28, 1, 'api', '接口参数', 'setting/api', 1, 1, 0, ''),
(40, 'auth', 39, 1, 'inde', '读取接口参数', 'setting/api/index', 1, 1, 0, ''),
(41, 'auth', 39, 1, 'save', '编辑参数', 'setting/api/save', 1, 1, 0, ''),
(42, 'auth', 0, 1, 'article', '文章管理', 'article', 1, 1, 0, ''),
(43, 'auth', 42, 1, 'category', '文章分类', 'article/category', 1, 1, 0, ''),
(44, 'auth', 43, 1, 'index', '读取文章分类列表', 'article/category/index', 1, 1, 0, ''),
(45, 'auth', 43, 1, 'save', '添加编辑文章分类', 'article/category/save', 1, 1, 0, ''),
(46, 'auth', 43, 1, 'get_info', '获取文章分类信息', 'article/category/get_info', 1, 1, 0, ''),
(47, 'auth', 43, 1, 'check_code', '验证文章分类标识', 'article/category/check_code', 1, 1, 0, ''),
(48, 'auth', 42, 1, 'article', '文章管理', 'article/article', 1, 1, 0, ''),
(49, 'auth', 48, 1, 'index', '读取所有文章', 'article/article/index', 1, 1, 0, ''),
(50, 'auth', 48, 1, 'form', '加载文章编辑表单', 'article/article/form', 1, 1, 0, ''),
(51, 'auth', 48, 1, 'save', '添加编辑文章', 'article/article/save', 1, 1, 0, ''),
(52, 'auth', 48, 1, 'detail', '查看文章内容', 'article/article/detail', 1, 0, 0, ''),
(53, 'auth', 0, 1, 'project', '项目管理', 'project', 1, 1, 0, ''),
(54, 'auth', 53, 1, 'investing', '钱生金', 'project/investing', 1, 1, 0, ''),
(55, 'auth', 54, 1, 'index', '读取钱生金项目列表', 'project/investing/index', 1, 1, 0, ''),
(57, 'auth', 54, 1, 'applied', '添加项目', 'project/investing/booked', 1, 1, 0, ''),
(59, 'auth', 54, 1, 'checked', '核实项目信息', 'project/investing/checked', 1, 1, 0, ''),
(61, 'auth', 54, 1, 'confirmed', '库管确认', 'project/investing/confirmed', 1, 1, 0, ''),
(63, 'auth', 54, 1, 'applied', '申请取金', 'project/investing/applied', 1, 1, 0, ''),
(64, 'auth', 54, 1, 'reset_locker', '释放表单锁', 'project/investing/reset_locker', 1, 0, 0, ''),
(65, 'auth', 54, 1, 'taken', '确认提金', 'project/investing/taken', 1, 1, 0, ''),
(67, 'auth', 54, 1, 'refused', '驳回项目', 'project/investing/refused', 1, 1, 0, ''),
(68, 'auth', 54, 1, 'trashed', '废弃项目', 'project/investing/trashed', 1, 1, 0, ''),
(69, 'auth', 53, 1, 'recycling', '金生金', 'project/recycling', 1, 1, 0, ''),
(70, 'auth', 69, 1, 'index', '读取项目列表', 'project/recycling/index', 1, 1, 0, ''),
(72, 'auth', 69, 1, 'booked', '登记项目', 'project/recycling/booked', 1, 1, 0, ''),
(78, 'auth', 69, 1, 'checked', '核实项目信息', 'project/recycling/checked', 1, 1, 0, ''),
(80, 'auth', 69, 3, 'terminated', '终止项目', 'project/recycling/terminated', 1, 1, 0, ''),
(81, 'auth', 69, 3, 'reset_locker', '释放表单锁', 'project/recycling/reset_locker', 1, 0, 0, ''),
(82, 'auth', 69, 1, 'taken', '确认提金', 'project/recycling/taken', 1, 1, 0, ''),
(84, 'auth', 69, 1, 'refused', '拒绝申请', 'project/recycling/refused', 1, 1, 0, ''),
(85, 'auth', 69, 1, 'trashed', '废弃项目', 'project/recycling/trashed', 1, 1, 0, ''),
(87, 'auth', 69, 1, 'confirmed', '库管确认', 'project/recycling/confirmed', 1, 1, 0, ''),
(88, 'auth', 0, 1, 'dashboard', '首页', '', 1, 0, 0, NULL),
(89, 'auth', 88, 1, 'home', '控制面板', 'home/index', 1, 0, 0, NULL),
(90, 'auth', 0, 1, 'error', '错误提示', '', 1, 0, 0, NULL),
(91, 'auth', 90, 1, 'permission', '无此授权', 'error/permission', 1, 0, 0, NULL),
(92, 'auth', 90, 1, 'permission', '无此授权', 'error/permission/index', 1, 0, 0, NULL),
(93, 'auth', 54, 1, 'update', '编辑项目', 'project/investing/update', 1, 1, 0, ''),
(94, 'auth', 54, 1, 'terminated', '终止项目', 'project/investing/terminated', 1, 1, 0, ''),
(96, 'auth', 54, 1, 'cancle', '取消申请提金', 'project/investing/cancle', 1, 1, 0, ''),
(98, 'auth', 1, 1, 'filemanager', '文件管理', 'tool/filemanager', 1, 0, 0, ''),
(100, 'auth', 98, 1, 'upload', '上传文件', 'tool/filemanager/upload', 1, 0, 0, ''),
(101, 'auth', 98, 1, 'upload', '上传文件', 'tool/filemanager/upload', 1, 0, 0, ''),
(102, 'auth', 5, 1, 'autocomplete', '自动匹配', 'auth/worker/autocomplete', 1, 0, 0, ''),
(103, 'auth', 69, 1, 'update', '编辑项目', 'project/recycling/update', 1, 1, 0, ''),
(104, 'auth', 53, 1, 'customer', '客户管理', 'project/customer', 1, 1, 0, ''),
(105, 'auth', 104, 1, 'index', '查看客户列表', 'project/customer/index', 1, 1, 0, ''),
(106, 'auth', 104, 1, 'update', '更新客户资料', 'project/customer/update', 1, 1, 0, ''),
(107, 'auth', 104, 1, 'projects', '查看客户项目明细', 'project/customer/projects', 1, 1, 0, ''),
(108, 'auth', 104, 1, 'autocomplete', '自动匹配客户资料', 'project/customer/autocomplete', 1, 0, 0, ''),
(109, 'auth', 104, 1, 'applied', '客户提金', 'project/customer/applied', 1, 1, 0, ''),
(110, 'auth', 104, 1, 'order', '门店消费申请', 'project/customer/order', 1, 1, 0, ''),
(111, 'auth', 104, 1, 'taken', '确认申请提金或消费', 'project/customer/taken', 1, 1, 0, ''),
(112, 'auth', 104, 1, 'cancle', '取消客户提金申请', 'project/customer/cancle', 1, 1, 0, ''),
(113, 'auth', 53, 1, 'trash', '回收站', 'project/trash', 1, 1, 0, ''),
(114, 'auth', 113, 1, 'index', '读取回收站列表', 'project/trash/index', 1, 1, 0, ''),
(115, 'auth', 113, 1, 'restore', '还原', 'project/trash/restore', 1, 1, 0, ''),
(116, 'auth', 113, 1, 'remove', '删除', 'project/trash/remove', 1, 1, 0, ''),
(117, 'auth', 53, 1, 'stock', '库存管理', 'project/stock', 1, 1, 0, ''),
(118, 'auth', 117, 1, 'inde', '读取库存列表', 'project/stock/index', 1, 1, 0, ''),
(119, 'auth', 117, 1, 'storage', '添加黄金入库记录', 'project/stock/storage', 1, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_file`
--

CREATE TABLE IF NOT EXISTS `gd_project_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `mode` enum('investing','recycling') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'recycling',
  `dir` enum('photo','invoice','report','privacy') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'photo',
  `file` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `gd_project_file`
--

INSERT INTO `gd_project_file` (`file_id`, `project_sn`, `mode`, `dir`, `file`, `status`, `worker_id`, `addtime`) VALUES
(1, '1', 'recycling', 'photo', '[{"name":"avatar4.png","path":"public\\/uploads\\/2016\\/08\\/31203115d185f7.png"}]', 1, 5, 1472646761),
(2, '1', 'recycling', 'invoice', '[{"name":"user6-128x128.jpg","path":"public\\/uploads\\/2016\\/08\\/31203118c7fc97.jpg"}]', 1, 5, 1472646761),
(3, '1', 'recycling', 'report', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/08\\/31203123ae62a7.txt"}]', 1, 5, 1472646761),
(4, '1', 'recycling', 'privacy', '[{"name":"29155000ed424f.txt","path":"public\\/uploads\\/2016\\/08\\/312031262cc9db.txt"}]', 1, 5, 1472646761),
(5, '2', 'recycling', 'photo', '[{"name":"avatar3.png","path":"public\\/uploads\\/2016\\/08\\/31214317c8c0dc.png"}]', 1, 5, 1472651087),
(6, '2', 'recycling', 'invoice', '[{"name":"avatar.png","path":"public\\/uploads\\/2016\\/08\\/312143200a466f.png"}]', 1, 5, 1472651087),
(7, '2', 'recycling', 'report', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/08\\/31214323195807.txt"}]', 1, 5, 1472651087),
(8, '2', 'recycling', 'privacy', '[{"name":"29155000ed424f.txt","path":"public\\/uploads\\/2016\\/08\\/312143279a52de.txt"}]', 1, 5, 1472651087),
(9, '3', 'recycling', 'photo', '[{"name":"user4-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/01001016417a7f.jpg"}]', 1, 5, 1472659852),
(10, '3', 'recycling', 'invoice', '[{"name":"user6-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/01001020a27ded.jpg"}]', 1, 5, 1472659852),
(11, '3', 'recycling', 'privacy', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/01001045283236.txt"}]', 1, 5, 1472659852),
(12, 'GM1609011461040439', 'investing', 'privacy', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/01100435f5640a.txt"}]', 1, 5, 1472695479),
(13, 'GM1609013171352349', 'investing', 'privacy', '[{"name":"29155000ed424f.txt","path":"public\\/uploads\\/2016\\/09\\/0113232940fc8a.txt"}]', 1, 5, 1472707429),
(14, 'GR1609011121322704', 'recycling', 'photo', '[{"name":"avatar.png","path":"public\\/uploads\\/2016\\/09\\/01132612e8d8d3.png"}]', 1, 5, 1472707624),
(15, 'GR1609011121322704', 'recycling', 'invoice', '[{"name":"user6-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/01132614c2eeca.jpg"}]', 1, 5, 1472707624),
(16, 'GR1609011121322704', 'recycling', 'report', '[{"name":"29155000ed424f.txt","path":"public\\/uploads\\/2016\\/09\\/011326467224f4.txt"}]', 1, 5, 1472707624),
(17, 'GR1609011121322704', 'recycling', 'privacy', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/0113264493c326.txt"}]', 1, 5, 1472707624),
(18, 'GR1609049592224441', 'recycling', 'privacy', '[{"name":"user2-160x160.jpg","path":"public\\/uploads\\/2016\\/09\\/04224429f8a769.jpg"}]', 1, 5, 1473000281),
(19, 'GM1609055931733042', 'investing', 'privacy', '[{"name":"avatar.png","path":"public\\/uploads\\/2016\\/09\\/0517303749c9ee.png"}]', 1, 5, 1473067842),
(20, 'GM1609056201833953', 'investing', 'privacy', '[{"name":"user6-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/0518394375db4a.jpg"}]', 1, 5, 1473071993);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_investing`
--

CREATE TABLE IF NOT EXISTS `gd_project_investing` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` tinyint(4) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `referrer_id` int(11) DEFAULT '0',
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(11,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `start` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  `transferrer` int(11) NOT NULL DEFAULT '0',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `locker_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `gd_project_investing`
--

INSERT INTO `gd_project_investing` (`project_id`, `project_sn`, `status_id`, `customer_id`, `referrer_id`, `price`, `weight`, `amount`, `start`, `note`, `is_del`, `transferrer`, `worker_id`, `addtime`, `lasttime`, `locker_id`) VALUES
(1, 'GM1609016370915225', 6, 6, 12, '266.16', '10.00', '2661.60', '2016-09-01', '第三打算的撒的撒啊实打实', 1, 0, 3, 1472694745, 1472707008, 0),
(3, 'GM1609011461040439', 6, 3, 0, '282.49', '15.00', '4237.35', '2016-09-01', '下自成蹊政策性支持下自成蹊', 1, 0, 3, 1472695479, 1472706778, 0),
(4, 'GM1609013171352349', 4, 9, 12, '282.25', '1000.00', '282250.00', '2016-09-01', '库存已确认标记，自动推进到正在增值', 0, 0, 7, 1472707429, 1472707533, 0),
(5, 'GM1609055931733042', 4, 10, 0, '285.39', '20.00', '5707.80', '2016-09-05', '库存已确认标记，自动推进到正在增值', 0, 11, 7, 1473067842, 1473068754, 0),
(6, 'GM1609056201833953', 1, 7, 12, '285.39', '50.00', '14269.50', NULL, '13212312', 0, 3, 5, 1473071993, 1473071993, 0);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_investing_history`
--

CREATE TABLE IF NOT EXISTS `gd_project_investing_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `request` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `gd_project_investing_history`
--

INSERT INTO `gd_project_investing_history` (`history_id`, `project_id`, `status_id`, `note`, `request`, `worker_id`, `addtime`, `ip`) VALUES
(1, 1, 1, '撒的撒打算', '', 5, 1472694745, '127.0.0.1'),
(2, 3, 1, '阿斯顿撒旦撒大', '', 5, 1472695479, '127.0.0.1'),
(3, 3, 1, '阿斯顿撒旦撒大sadasdas', '', 5, 1472697695, '127.0.0.1'),
(4, 3, 2, '啥的撒打算的撒', 'array (\n  ''amount'' =&gt; ''4237.35'',\n  ''_amount'' =&gt; ''4237.35'',\n  ''phone'' =&gt; ''18959506595'',\n  ''_phone'' =&gt; ''18959506595'',\n)', 3, 1472701465, '127.0.0.1'),
(5, 1, 2, '撒旦撒旦撒的撒', 'array (\n  ''amount'' =&gt; ''2661.60'',\n  ''_amount'' =&gt; ''2661.60'',\n  ''phone'' =&gt; ''18959596767'',\n  ''_phone'' =&gt; ''18959596767'',\n)', 3, 1472701716, '127.0.0.1'),
(6, 1, 6, '第三打算的撒的撒啊实打实', '', 3, 1472701800, '127.0.0.1'),
(7, 3, 5, '啥的撒打算的撒大叔撒的撒的', '', 3, 1472701945, '127.0.0.1'),
(8, 3, 1, '啥的撒打算的撒大叔撒的撒的', '', 5, 1472702003, '127.0.0.1'),
(9, 3, 2, '胜多负少多福多寿427', 'array (\n  ''amount'' =&gt; ''4237.35'',\n  ''_amount'' =&gt; ''4237.35'',\n  ''phone'' =&gt; ''18959506595'',\n  ''_phone'' =&gt; ''18959506595'',\n)', 3, 1472702111, '127.0.0.1'),
(10, 3, 3, 'sadsadsadsadsa ', 'array (\n  ''weight'' =&gt; ''15.00'',\n  ''_weight'' =&gt; ''15.00'',\n  ''phone'' =&gt; ''18959506595'',\n  ''_phone'' =&gt; ''18959506595'',\n)', 7, 1472704915, '127.0.0.1'),
(11, 3, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1472704915, '127.0.0.1'),
(13, 3, 6, '下自成蹊政策性支持下自成蹊', '', 3, 1472706778, '127.0.0.1'),
(14, 4, 1, '大土豪', '', 5, 1472707429, '127.0.0.1'),
(15, 4, 2, '就好的', 'array (\n  ''amount'' =&gt; ''282250.00'',\n  ''_amount'' =&gt; ''282250.00'',\n  ''phone'' =&gt; ''13813800138'',\n  ''_phone'' =&gt; ''13813800138'',\n)', 3, 1472707480, '127.0.0.1'),
(16, 4, 3, '我也OK啊', 'array (\n  ''weight'' =&gt; ''1000.00'',\n  ''_weight'' =&gt; ''1000.00'',\n  ''phone'' =&gt; ''13813800138'',\n  ''_phone'' =&gt; ''13813800138'',\n)', 7, 1472707533, '127.0.0.1'),
(17, 4, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1472707533, '127.0.0.1'),
(18, 5, 1, 'asdsadsadsa', '', 5, 1473067842, '127.0.0.1'),
(19, 5, 1, 'asdsadsadsa', '', 5, 1473068270, '127.0.0.1'),
(20, 5, 1, 'asdsadsadsa', '', 5, 1473068312, '127.0.0.1'),
(21, 5, 1, 'asdsadsadsa', '', 5, 1473068344, '127.0.0.1'),
(22, 5, 2, 'sdsadsadsa', 'array (\n  ''amount'' =&gt; ''5707.80'',\n  ''_amount'' =&gt; ''5707.80'',\n  ''phone'' =&gt; ''13606660888'',\n  ''_phone'' =&gt; ''13606660888'',\n)', 3, 1473068692, '127.0.0.1'),
(23, 5, 3, 'tertretret', 'array (\n  ''weight'' =&gt; ''20.00'',\n  ''_weight'' =&gt; ''20.00'',\n  ''phone'' =&gt; ''13606660888'',\n  ''_phone'' =&gt; ''13606660888'',\n)', 7, 1473068754, '127.0.0.1'),
(24, 5, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473068754, '127.0.0.1'),
(25, 6, 1, '13212312', '', 5, 1473071993, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_investing_status`
--

CREATE TABLE IF NOT EXISTS `gd_project_investing_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `list_label` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `gd_project_investing_status`
--

INSERT INTO `gd_project_investing_status` (`status_id`, `title`, `code`, `list_label`, `note`, `status`) VALUES
(1, '已登记', 'booked', NULL, '登记客户买金信息', 1),
(2, '已核实', 'checked', NULL, '上级主管核对客户信息、黄金买入信息', 1),
(3, '已确认', 'confirmed', NULL, '库管确认并标记', 1),
(4, '增长中', 'growing', NULL, '生金增值', 1),
(5, '已驳回', 'refused', NULL, '客户信息等问题造成', 1),
(6, '已终止', 'terminated', NULL, '提前终止项目', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_recycling`
--

CREATE TABLE IF NOT EXISTS `gd_project_recycling` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` tinyint(4) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `referrer_id` int(11) NOT NULL DEFAULT '0',
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `origin_weight` decimal(9,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(9,2) NOT NULL DEFAULT '0.00',
  `number` tinyint(4) NOT NULL DEFAULT '0',
  `type` enum('ornaments','goldbar','other') COLLATE utf8_unicode_ci DEFAULT 'ornaments',
  `appraiser_id` int(11) NOT NULL DEFAULT '0',
  `loss` decimal(5,2) NOT NULL DEFAULT '0.00',
  `start` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `transferrer` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `locker_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `gd_project_recycling`
--

INSERT INTO `gd_project_recycling` (`project_id`, `project_sn`, `status_id`, `customer_id`, `referrer_id`, `price`, `origin_weight`, `weight`, `number`, `type`, `appraiser_id`, `loss`, `start`, `note`, `is_del`, `worker_id`, `transferrer`, `addtime`, `lasttime`, `locker_id`) VALUES
(1, 'GR1608315162053241', 6, 8, 12, '283.16', '22.00', '20.00', 2, 'ornaments', 9, '6.00', NULL, '231243242432', 1, 3, NULL, 1472646761, 1472653784, 0),
(2, 'GR1608319242154447', 6, 7, 0, '283.16', '33.00', '31.00', 3, 'ornaments', 9, '7.00', NULL, 'sawewqrewtretetre', 1, 3, NULL, 1472651087, 1472653349, 0),
(3, 'GR1609018170081051', 4, 8, 12, '282.30', '12.00', '11.00', 1, 'ornaments', 9, '8.00', NULL, '库存已确认标记，自动推进到正在增值', 0, 7, NULL, 1472659851, 1472660062, 0),
(4, 'GR1609011121322704', 4, 9, 12, '282.25', '55.00', '52.00', 1, 'goldbar', 10, '6.00', '2016-09-01', '库存已确认标记，自动推进到正在增值', 0, 7, NULL, 1472707624, 1472707775, 0),
(5, 'GR1609049592224441', 4, 6, 12, '284.31', '12.00', '11.00', 1, 'ornaments', 9, '9.00', '2016-09-04', '库存已确认标记，自动推进到正在增值', 0, 7, '11', 1473000281, 1473064798, 0),
(6, 'GR1609053831781829', 1, 10, 12, '285.39', '50.00', '49.99', 1, 'ornaments', 9, '2.00', NULL, '324324423432', 0, 5, '3', 1473067109, 1473083447, 0);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_recycling_history`
--

CREATE TABLE IF NOT EXISTS `gd_project_recycling_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `request` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `gd_project_recycling_history`
--

INSERT INTO `gd_project_recycling_history` (`history_id`, `project_id`, `status_id`, `note`, `request`, `worker_id`, `addtime`, `ip`) VALUES
(1, 1, 1, 'asdsadasdasdadsa', '', 5, 1472646761, '127.0.0.1'),
(2, 1, 2, '', 'array (\n  ''weight'' =&gt; ''20.00'',\n  ''_weight'' =&gt; ''20.00'',\n  ''phone'' =&gt; ''18808800990'',\n  ''_phone'' =&gt; ''18808800990'',\n)', 3, 1472646926, '127.0.0.1'),
(3, 1, 3, '进库存了妥妥的', 'array (\n  ''weight'' =&gt; ''20.00'',\n  ''_weight'' =&gt; ''20.00'',\n  ''phone'' =&gt; ''18808800990'',\n  ''_phone'' =&gt; ''18808800990'',\n)', 7, 1472648191, '127.0.0.1'),
(4, 1, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1472648192, '127.0.0.1'),
(5, 2, 1, '我去额为企鹅我去', '', 5, 1472651087, '127.0.0.1'),
(6, 2, 2, '', 'array (\n  ''weight'' =&gt; ''31.00'',\n  ''_weight'' =&gt; ''31.00'',\n  ''phone'' =&gt; ''13113213313'',\n  ''_phone'' =&gt; ''13113213313'',\n)', 3, 1472651230, '127.0.0.1'),
(7, 2, 3, '按时打算', 'array (\n  ''weight'' =&gt; ''31.00'',\n  ''_weight'' =&gt; ''31.00'',\n  ''phone'' =&gt; ''13113213313'',\n  ''_phone'' =&gt; ''13113213313'',\n)', 7, 1472651289, '127.0.0.1'),
(8, 2, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1472651289, '127.0.0.1'),
(9, 2, 6, 'sawewqrewtretetre', '', 3, 1472653349, '127.0.0.1'),
(10, 1, 6, '231243242432', '', 3, 1472653784, '127.0.0.1'),
(11, 3, 1, '的撒的撒的撒', '', 5, 1472659852, '127.0.0.1'),
(12, 3, 2, '', 'array (\n  ''weight'' =&gt; ''11.00'',\n  ''_weight'' =&gt; ''11.00'',\n  ''phone'' =&gt; ''18808800990'',\n  ''_phone'' =&gt; ''18808800990'',\n)', 3, 1472659928, '127.0.0.1'),
(14, 3, 3, '撒的撒', 'array (\n  ''weight'' =&gt; ''11.00'',\n  ''_weight'' =&gt; ''11.00'',\n  ''phone'' =&gt; ''18808800990'',\n  ''_phone'' =&gt; ''18808800990'',\n)', 7, 1472660062, '127.0.0.1'),
(15, 3, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1472660062, '127.0.0.1'),
(16, 4, 1, '有钱的大佬', '', 5, 1472707624, '127.0.0.1'),
(17, 4, 2, '有聚宝盆哎', 'array (\n  ''weight'' =&gt; ''52.00'',\n  ''_weight'' =&gt; ''52.00'',\n  ''phone'' =&gt; ''13813800138'',\n  ''_phone'' =&gt; ''13813800138'',\n)', 3, 1472707662, '127.0.0.1'),
(18, 4, 3, '偷了他的聚宝盆', 'array (\n  ''weight'' =&gt; ''52.00'',\n  ''_weight'' =&gt; ''52.00'',\n  ''phone'' =&gt; ''13813800138'',\n  ''_phone'' =&gt; ''13813800138'',\n)', 7, 1472707775, '127.0.0.1'),
(19, 4, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1472707775, '127.0.0.1'),
(20, 5, 1, 'qweqweqwewq', '', 5, 1473000281, '127.0.0.1'),
(21, 5, 2, 'sadsads', 'array (\n  ''weight'' =&gt; ''11.00'',\n  ''_weight'' =&gt; ''11.00'',\n  ''phone'' =&gt; ''18959596767'',\n  ''_phone'' =&gt; ''18959596767'',\n)', 3, 1473064734, '127.0.0.1'),
(22, 5, 3, 'asdsadsad', 'array (\n  ''weight'' =&gt; ''11.00'',\n  ''_weight'' =&gt; ''11.00'',\n  ''phone'' =&gt; ''18959596767'',\n  ''_phone'' =&gt; ''18959596767'',\n)', 7, 1473064798, '127.0.0.1'),
(23, 5, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473064798, '127.0.0.1'),
(24, 6, 1, '324324423432', '', 5, 1473067109, '127.0.0.1'),
(25, 6, 1, '324324423432', '', 5, 1473083447, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_recycling_status`
--

CREATE TABLE IF NOT EXISTS `gd_project_recycling_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `list_label` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `gd_project_recycling_status`
--

INSERT INTO `gd_project_recycling_status` (`status_id`, `title`, `code`, `list_label`, `note`, `status`) VALUES
(1, '已登记', 'booked', NULL, '登记客户存金信息，含鉴定结果及客户同意书', 1),
(2, '已核实', 'checked', NULL, '上级主管核对客户、物品及鉴定结果', 1),
(3, '已确认', 'confirmed', NULL, '库管确认并标记', 1),
(4, '增值中', 'growing', NULL, '衍生收益黄金', 1),
(5, '已驳回', 'refused', NULL, '客户信息或黄金物品等问题造成', 1),
(6, '已终止', 'terminated', NULL, '提前终止项目', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_stock`
--

CREATE TABLE IF NOT EXISTS `gd_project_stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_sn` char(18) COLLATE utf8_unicode_ci DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `referrer_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('investing','recycling','stock') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'investing',
  `info` text COLLATE utf8_unicode_ci,
  `weight` decimal(13,2) NOT NULL DEFAULT '0.00',
  `start` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `lasttime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `gd_project_stock`
--

INSERT INTO `gd_project_stock` (`stock_id`, `project_sn`, `customer_id`, `referrer_id`, `title`, `mode`, `info`, `weight`, `start`, `note`, `status`, `worker_id`, `addtime`, `lasttime`) VALUES
(5, 'GM1609013171352349', 9, 12, '项目GM1609013171352349存金1,000.00克', 'investing', 'a:7:{s:10:"project_id";s:1:"4";s:8:"realname";s:9:"沈万三";s:5:"phone";s:11:"13813800138";s:8:"idnumber";s:18:"138139199810039997";s:5:"price";s:6:"282.25";s:6:"amount";s:9:"282250.00";s:6:"weight";s:7:"1000.00";}', '1000.00', '2016-09-01', '我也OK啊', 1, 7, 1472707533, 1472707533),
(6, 'GR1609011121322704', 9, 12, '项目GR1609011121322704存金52.00克', 'recycling', 'a:10:{s:10:"project_id";s:1:"4";s:8:"realname";s:9:"沈万三";s:5:"phone";s:11:"13813800138";s:8:"idnumber";s:18:"138139199810039997";s:5:"price";s:6:"282.25";s:4:"type";s:6:"金条";s:6:"number";s:1:"1";s:13:"origin_weight";s:5:"55.00";s:6:"weight";s:5:"52.00";s:12:"appraiser_id";s:2:"10";}', '52.00', '2016-09-01', '偷了他的聚宝盆', 1, 7, 1472707775, 1472707775),
(7, 'GR1609049592224441', 6, 12, '项目GR1609049592224441存金11.00克', 'recycling', 'a:10:{s:10:"project_id";s:1:"5";s:8:"realname";s:9:"余华为";s:5:"phone";s:11:"18959596767";s:8:"idnumber";s:18:"321254198908050604";s:5:"price";s:6:"284.31";s:4:"type";s:6:"金饰";s:6:"number";s:1:"1";s:13:"origin_weight";s:5:"12.00";s:6:"weight";s:5:"11.00";s:12:"appraiser_id";s:1:"9";}', '11.00', '2016-09-04', 'asdsadsad', 1, 7, 1473064798, 1473064798),
(8, 'GM1609055931733042', 10, 0, '项目GM1609055931733042存金20.00克', 'investing', 'a:7:{s:10:"project_id";s:1:"5";s:8:"realname";s:9:"赵公明";s:5:"phone";s:11:"13606660888";s:8:"idnumber";s:18:"123321196606066666";s:5:"price";s:6:"285.39";s:6:"amount";s:7:"5707.80";s:6:"weight";s:5:"20.00";}', '20.00', '2016-09-05', 'tertretret', 1, 7, 1473068754, 1473068754);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_trash`
--

CREATE TABLE IF NOT EXISTS `gd_project_trash` (
  `trash_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('investing','recycling') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'recycling',
  `customer` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gold` text COLLATE utf8_unicode_ci,
  `note` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`trash_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `gd_project_trash`
--

INSERT INTO `gd_project_trash` (`trash_id`, `project_id`, `project_sn`, `mode`, `customer`, `gold`, `note`, `worker_id`, `addtime`, `ip`) VALUES
(1, 2, 'GR1608319242154447', 'recycling', 'a:3:{s:8:"realname";s:9:"雷小米";s:5:"phone";s:11:"13113213313";s:8:"referrer";N;}', 'a:7:{s:5:"price";s:6:"283.16";s:6:"weight";s:5:"31.00";s:6:"amount";N;s:6:"period";N;s:5:"start";N;s:3:"end";N;s:7:"addtime";s:10:"1472651087";}', '', 3, 1472653349, NULL),
(2, 1, 'GR1608315162053241', 'recycling', 'a:4:{s:8:"realname";s:9:"乔苹果";s:5:"phone";s:11:"18808800990";s:8:"idnumber";s:18:"325225197008078888";s:8:"referrer";s:10:"朱景修2";}', 'a:7:{s:5:"price";s:6:"283.16";s:4:"type";s:6:"金饰";s:6:"number";s:1:"2";s:13:"origin_weight";s:5:"22.00";s:6:"weight";s:5:"20.00";s:9:"appraiser";s:10:"鉴定人A";s:5:"start";N;}', '', 3, 1472653784, NULL),
(4, 3, 'GM1609011461040439', 'investing', 'a:4:{s:8:"realname";s:9:"刘京东";s:5:"phone";s:11:"18959506595";s:8:"idnumber";s:18:"321324199008080808";s:8:"referrer";N;}', 'a:4:{s:5:"price";s:6:"282.49";s:6:"weight";s:5:"15.00";s:6:"amount";s:7:"4237.35";s:5:"start";s:10:"2016-09-01";}', '下自成蹊政策性支持下自成蹊', 3, 1472706778, NULL),
(5, 1, 'GM1609016370915225', 'investing', 'a:4:{s:8:"realname";s:9:"余华为";s:5:"phone";s:11:"18959596767";s:8:"idnumber";s:18:"321254198908050604";s:8:"referrer";s:10:"朱景修2";}', 'a:4:{s:5:"price";s:6:"266.16";s:6:"weight";s:5:"10.00";s:6:"amount";s:7:"2661.60";s:5:"start";s:10:"2016-09-01";}', '删除项目', 3, 1472707008, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `gd_sessions`
--

CREATE TABLE IF NOT EXISTS `gd_sessions` (
  `sess_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_sessions`
--

INSERT INTO `gd_sessions` (`sess_id`, `ip_address`, `timestamp`, `data`) VALUES
('f8f3ac800d1608b1038063caf6faac1d1253c2db', '127.0.0.1', 1472784474, '__ci_last_regenerate|i:1472784178;code|s:4:"7t5U";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472777302";ajax_permission|s:64:"没有授权访问  <br> [../modules/tool/controllers/api/price]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('4cbb907f3a68d71ea70dab398e6add00cac48c60', '127.0.0.1', 1472784785, '__ci_last_regenerate|i:1472784492;code|s:4:"7t5U";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472777302";__ci_vars|a:2:{s:16:"error_permission";s:3:"old";s:15:"ajax_permission";s:3:"new";}error_permission|s:73:"没有授权访问  <br> [../modules/project/controllers/investing/index]";ajax_permission|s:73:"没有授权访问  <br> [../modules/project/controllers/investing/index]";'),
('de2775c6a0e7655b9216c49b8208a05838b144b9', '127.0.0.1', 1472785098, '__ci_last_regenerate|i:1472784801;code|s:4:"7t5U";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472777302";ajax_permission|s:64:"没有授权访问  <br> [../modules/tool/controllers/api/price]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('bb1dc95c299a096238e5f3ece049a305074da27e', '127.0.0.1', 1472785557, '__ci_last_regenerate|i:1472785382;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('8c71ccb2f44575d913c63496b33112d37f9bf259', '127.0.0.1', 1472787007, '__ci_last_regenerate|i:1472785719;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('81b28e293199d60c20b428fd8a77f73661bcb897', '127.0.0.1', 1472787327, '__ci_last_regenerate|i:1472787309;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('d9e99bf5efdb0a283091eed83fd615a1e506a306', '127.0.0.1', 1472790342, '__ci_last_regenerate|i:1472787797;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('cafc5145165f8037066bc2e05dca34aadb9abb60', '127.0.0.1', 1472791060, '__ci_last_regenerate|i:1472790770;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('39a0c76ad7253ac9e19262aac9913b3efedddcfb', '127.0.0.1', 1472791708, '__ci_last_regenerate|i:1472791410;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('39b9112aac30a419afbf3a8b5130b208c6bdeb8f', '127.0.0.1', 1472791726, '__ci_last_regenerate|i:1472791725;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('d448c049a76188587e1fb044a91f8503bf487e32', '127.0.0.1', 1472792617, '__ci_last_regenerate|i:1472792347;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('880b467abf3327c48f5375d2f938efed67fb064c', '127.0.0.1', 1472792653, '__ci_last_regenerate|i:1472792652;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('b899f0ebd7804f6c196be439f6c674d6effa17e1', '127.0.0.1', 1472798496, '__ci_last_regenerate|i:1472793495;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('d06fb66e136ac278d947b7aae8774482e869d362', '127.0.0.1', 1472798805, '__ci_last_regenerate|i:1472798510;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('508682dc740a46938e663b08caef9e7e107fb4f3', '127.0.0.1', 1472799107, '__ci_last_regenerate|i:1472798812;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('76c05b58c5d0c298ad09d2e7e5e246572e1c3b03', '127.0.0.1', 1472799157, '__ci_last_regenerate|i:1472799141;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";csrfkey|s:8:"izXwdcRj";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"usgA01qOeBn93YlpZ6Kr";'),
('ccf450d8d9bd1e2fba42561215ee58797410429f', '127.0.0.1', 1472799727, '__ci_last_regenerate|i:1472799677;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";ajax_permission|s:43:"没有授权访问  <br> [project/customer]";__ci_vars|a:3:{s:15:"ajax_permission";s:3:"new";s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"1UDv9qfy";csrfvalue|s:20:"uUfLDGh91Qz4VBnNcEik";'),
('384cf5d1427e4c57798d8af6a9fb199d641ead41', '127.0.0.1', 1472800477, '__ci_last_regenerate|i:1472800022;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";csrfkey|s:8:"Wr9MIQ32";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"ACXxwLcnOsGZJFtlrEQV";'),
('1b6fe622bf746444c5fdf8f654c9bf6abe45864b', '127.0.0.1', 1472801169, '__ci_last_regenerate|i:1472801120;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('9a7b18896d45eb2c5fd4eaeafb04bc431169b236', '127.0.0.1', 1472802109, '__ci_last_regenerate|i:1472801796;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('e67fd42c8f1327c2e44c8075ebe72ec247cba4d7', '127.0.0.1', 1472802522, '__ci_last_regenerate|i:1472802128;code|s:4:"UidA";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472702156";csrfkey|s:8:"N8hBIQu1";__ci_vars|a:3:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";s:15:"ajax_permission";s:3:"new";}csrfvalue|s:20:"lURD9K6rVvQAJ0i8tdmP";ajax_permission|s:43:"没有授权访问  <br> [project/customer]";'),
('99a0821b14a0032f9b07275faababd0c872a2f96', '127.0.0.1', 1472802999, '__ci_last_regenerate|i:1472802598;code|s:4:"UidA";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472702156";success|s:48:"申请提金已出库！客户 乔苹果:5.00克";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('571fdf05bdef3a1a727f18c2141e70e7baf4e322', '127.0.0.1', 1472804717, '__ci_last_regenerate|i:1472802752;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";csrfkey|s:8:"6HqYnXP1";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"dRYvpAztSLaoDqsTHG51";'),
('68ae86ad08d90e9029e75f705c66283c581a9b19', '127.0.0.1', 1472806600, '__ci_last_regenerate|i:1472802999;code|s:4:"UidA";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472702156";'),
('fb2d4d831658a3904e5997468e5315a51ec2fa0f', '127.0.0.1', 1472806453, '__ci_last_regenerate|i:1472804725;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";csrfkey|s:8:"YRmrSioc";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"Twi2HA9PNcjzgV0Y6pld";'),
('484661ab13e47862e67c4a712800ffbc19c0a4e2', '127.0.0.1', 1472806716, '__ci_last_regenerate|i:1472806456;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";csrfkey|s:8:"7E1W0tpo";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"urhSAokvmaclHtzi56Rw";'),
('fef04f53ee04a9ad5fabff2dd8695cfff2dcbc35', '127.0.0.1', 1472807149, '__ci_last_regenerate|i:1472806778;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";csrfkey|s:8:"Wa30wjsA";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"4PfJnWMxsrZgIoD6KSE8";'),
('7b3c4e607375b046f087d8aa882780e4bbb607f2', '127.0.0.1', 1472808369, '__ci_last_regenerate|i:1472807173;code|s:4:"QjKa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785388";csrfkey|s:8:"FbEa4ykD";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"Dv9SVTjfr0ycLw1zmodA";'),
('34a730d43f79d3fa13ebf13b7c0d935c83d89f1f', '127.0.0.1', 1472807173, '__ci_last_regenerate|i:1472807173;'),
('a79d09b6b950f83d17c403a0fc4bf629005e4ea9', '127.0.0.1', 1472807589, '__ci_last_regenerate|i:1472807270;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";csrfkey|s:8:"b9mYky2O";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"DRZ7wPUWom5IAveSYQBg";'),
('ab3e02e8967ff051a7d598c263672f084d017398', '127.0.0.1', 1472809604, '__ci_last_regenerate|i:1472807750;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('444369c1373853e91dbcddceb5280f6b8316d06a', '127.0.0.1', 1472808837, '__ci_last_regenerate|i:1472808479;code|s:4:"QjKa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785388";ajax_permission|s:43:"没有授权访问  <br> [project/customer]";__ci_vars|a:3:{s:15:"ajax_permission";s:3:"old";s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfkey|s:8:"bq03Sc8V";csrfvalue|s:20:"xJPFwTW5NDild21pf0EC";'),
('94ffb2d51ee9650c6201f4cb677f745249900bac', '127.0.0.1', 1472809172, '__ci_last_regenerate|i:1472808842;code|s:4:"QjKa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785388";ajax_permission|s:43:"没有授权访问  <br> [project/customer]";__ci_vars|a:3:{s:15:"ajax_permission";s:3:"new";s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"DpvtmlCH";csrfvalue|s:20:"4H0Ko6RN8VpTIqJMLz2X";'),
('9fbcd993ece0be320e1788fbb9b2d26aba1713ed', '127.0.0.1', 1472810822, '__ci_last_regenerate|i:1472809334;code|s:4:"QjKa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785388";csrfkey|s:8:"FH6pmqzO";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"b5z49LkZsBP3IgwUcD07";'),
('510da3752d8efc60beaea2e4392c0e0bef8d7e36', '127.0.0.1', 1472809760, '__ci_last_regenerate|i:1472809607;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('2455d399b18d5cc1e6ecd01c4091a03b5166d2c7', '127.0.0.1', 1472809995, '__ci_last_regenerate|i:1472809994;code|s:4:"RH9K";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472785341";'),
('46006b4608dcbfdf607d05ac5b1d38bd593a3a67', '127.0.0.1', 1472810611, '__ci_last_regenerate|i:1472810526;code|s:4:"3cnJ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472777201";'),
('6ff4143e7479b7ce6c8f3fa6d5b953a1c6f04971', '127.0.0.1', 1472810945, '__ci_last_regenerate|i:1472810945;code|s:4:"3cnJ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472777201";'),
('4b592e06cc7b84cea0df4aa416f8e9a3f80b7bac', '127.0.0.1', 1472822160, '__ci_last_regenerate|i:1472820948;code|s:4:"7Dfa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472807188";'),
('c2718bfc1f94beafdca94d462248bf4e15647adc', '127.0.0.1', 1472824391, '__ci_last_regenerate|i:1472823189;code|s:4:"7Dfa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472807188";'),
('40ceb95e412084b66d59db2307d575deddd188d4', '127.0.0.1', 1472825111, '__ci_last_regenerate|i:1472824828;code|s:4:"7Dfa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472807188";ajax_permission|s:46:"没有授权访问  <br> [setting/system/save]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"old";}'),
('636b5015bf909141824bee772de73d1f6290a49e', '127.0.0.1', 1472826238, '__ci_last_regenerate|i:1472825986;code|s:4:"7Dfa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472807188";ajax_permission|s:46:"没有授权访问  <br> [setting/system/save]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"old";}'),
('0366100244651488938f0fef166d08e01fcf18ba', '127.0.0.1', 1472827154, '__ci_last_regenerate|i:1472826269;code|s:4:"x6mr";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1472692221";'),
('3d533b73e9baaa77daf1d13b5b422f985ff2b151', '127.0.0.1', 1472826513, '__ci_last_regenerate|i:1472826503;code|s:4:"7Dfa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472807188";'),
('2f8a32adbb2b23d78b0156383b86b1895d99229c', '127.0.0.1', 1472827411, '__ci_last_regenerate|i:1472827117;code|s:4:"7Dfa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472807188";'),
('598f6f7b52bb4429f6f5a208244f6fcb5423a515', '127.0.0.1', 1472829778, '__ci_last_regenerate|i:1472827154;code|s:4:"x6mr";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1472692221";'),
('697304b0c335631d5e77289d3a08d2ccd986dd63', '127.0.0.1', 1472828156, '__ci_last_regenerate|i:1472827670;code|s:4:"7Dfa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472807188";'),
('cc89fec6ac8694a03dcd75278218500f59c10ff7', '127.0.0.1', 1472829818, '__ci_last_regenerate|i:1472828446;code|s:4:"7Dfa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472807188";'),
('dabd57e9501c81d959f782facd7843f047ef4732', '127.0.0.1', 1472881903, '__ci_last_regenerate|i:1472879259;code|s:4:"h6VH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472820954";'),
('73808fa5b5c58ed40f442dd2cfcd70ffb0924085', '127.0.0.1', 1472961769, '__ci_last_regenerate|i:1472961537;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('e086017c6ee9f051145125282669e50053faacd9', '127.0.0.1', 1472962090, '__ci_last_regenerate|i:1472961975;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('271a247b2450e5c2f01d6a934856f9667ccd1f00', '127.0.0.1', 1472965942, '__ci_last_regenerate|i:1472962341;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('f1909893fb6f22f2c9c27a9bc126fda0f0050534', '127.0.0.1', 1472990198, '__ci_last_regenerate|i:1472966167;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('c9387e6dd03c184e2ea0ebd5a64bb51359992b8d', '127.0.0.1', 1472990640, '__ci_last_regenerate|i:1472990409;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";success|s:28:"<p>账号资料已更新</p>";__ci_vars|a:1:{s:7:"success";s:3:"old";}'),
('6f450ade93a199983c384441e017e3a6c847b73d', '127.0.0.1', 1472991673, '__ci_last_regenerate|i:1472990739;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('f489ab20762b8f3e69fb9b5c1a8e677cfac92c4a', '127.0.0.1', 1472992216, '__ci_last_regenerate|i:1472991695;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";success|s:28:"<p>账号资料已更新</p>";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('01fde4bab3cc39f903737d1c98021d36df4ce739', '127.0.0.1', 1472992344, '__ci_last_regenerate|i:1472992344;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";success|s:28:"<p>账号资料已更新</p>";__ci_vars|a:1:{s:7:"success";s:3:"old";}'),
('475a10d06b8ba4671fa9aa7d8dcd13656eccfd1a', '127.0.0.1', 1472992798, '__ci_last_regenerate|i:1472992798;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('edc7e833771e8e2a4aa2233fc5f490d7a5133116', '127.0.0.1', 1472993204, '__ci_last_regenerate|i:1472993179;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('52ff7e11342886a79d07c4b958bbf450a19641bf', '127.0.0.1', 1472994268, '__ci_last_regenerate|i:1472993971;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('1f5c47c2ede0f6278c2c23c26959baed70be977a', '127.0.0.1', 1472996096, '__ci_last_regenerate|i:1472994832;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('f2d6e7ccc054b6d8ddaa496c12510a07b0b78f66', '127.0.0.1', 1472996736, '__ci_last_regenerate|i:1472996642;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('c62d1fac43701cb7448720caea98e62b6efc10af', '127.0.0.1', 1472997159, '__ci_last_regenerate|i:1472996943;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('8da4b136dfe553e2bffae4d25650aee88a020dd4', '127.0.0.1', 1472998668, '__ci_last_regenerate|i:1472997307;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('a160910b4513e21c39531b26fd7fed78fced7d7a', '127.0.0.1', 1472999928, '__ci_last_regenerate|i:1472998361;code|s:4:"H9Kn";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1472827154";csrfkey|s:8:"OvzFC7GT";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"oKhpwQqZnWaR9Afgdyxb";'),
('46513371fc8cea06d3b6ace83e5b6a54fcdd096f', '127.0.0.1', 1472999768, '__ci_last_regenerate|i:1472999757;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('afb64cb6c085986c096883acee00dc36288a6f59', '127.0.0.1', 1473000510, '__ci_last_regenerate|i:1473000235;code|s:4:"H9Kn";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1472827154";csrfkey|s:8:"wJPhMISp";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"HPIbiCXNylv4cWfYj7Mg";'),
('d61f3ee77a211c58198f1c3eea4b13989a370b70', '127.0.0.1', 1473000366, '__ci_last_regenerate|i:1473000353;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";'),
('7d5d8e79373d80e55482e8d85485dafef938eae6', '127.0.0.1', 1473000720, '__ci_last_regenerate|i:1473000662;code|s:4:"xyGR";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472879286";csrfkey|s:8:"lkPJUuQo";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"v5SeWoYnEfz0d4NuZp7A";'),
('207e85c4bbf2bcacdbe76a822f2901755e791224', '127.0.0.1', 1473047388, '__ci_last_regenerate|i:1473047201;code|s:4:"sU9C";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1472998373";csrfkey|s:8:"UJP07iZ6";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"EBsISvnR2CrWda8kzY0o";'),
('ae2a1a0803b8ca3778c315f60be039386f00f1e3', '127.0.0.1', 1473053760, '__ci_last_regenerate|i:1473047748;code|s:4:"gCwj";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472810532";'),
('c336d651ad1ef04fcadf9bd55b203fe2a02ca9b1', '127.0.0.1', 1473054066, '__ci_last_regenerate|i:1473053770;code|s:4:"gCwj";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472810532";'),
('a61b4507207ee28441943032f5b33e557a1965bd', '127.0.0.1', 1473054246, '__ci_last_regenerate|i:1473054074;code|s:4:"gCwj";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472810532";'),
('6cdb23c589d5a06ddf1b2fa5b5df01cb118859e6', '127.0.0.1', 1473059163, '__ci_last_regenerate|i:1473057744;code|s:4:"gCwj";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472810532";'),
('3363bc4f223bcaad156bb2e01fd78b611105aa1d', '127.0.0.1', 1473059576, '__ci_last_regenerate|i:1473059313;code|s:4:"gCwj";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472810532";'),
('242de8c8037428552976241857199598c2be27d7', '127.0.0.1', 1473059869, '__ci_last_regenerate|i:1473059739;code|s:4:"gCwj";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472810532";'),
('6a45a08fde3b4bee0112bff48c2f58e9c48f5896', '127.0.0.1', 1473062120, '__ci_last_regenerate|i:1473060870;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";'),
('5f7f7bac8364c633c1b0fa6168f1e4b872bd5491', '127.0.0.1', 1473062589, '__ci_last_regenerate|i:1473062292;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";'),
('6ba5060866cd4ff6d6290fee2990c5d4d8eee49a', '127.0.0.1', 1473063167, '__ci_last_regenerate|i:1473062924;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";'),
('893ce989c81c194e78eedda8fdfd69de928d6597', '127.0.0.1', 1473063241, '__ci_last_regenerate|i:1473063240;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";'),
('3a62aeada9f3bdb057ac9288943b4f2f68c269dd', '127.0.0.1', 1473063692, '__ci_last_regenerate|i:1473063609;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";'),
('fd99f032cf6fc7f9a1c1a19c728be73cabcfb852', '127.0.0.1', 1473064137, '__ci_last_regenerate|i:1473064006;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";'),
('d553488f80572bec9b950c8776c5ab97a820977a', '127.0.0.1', 1473064544, '__ci_last_regenerate|i:1473064319;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";'),
('f1e4c5b00abc18371c7cadb5b22b72eb3159fb27', '127.0.0.1', 1473064807, '__ci_last_regenerate|i:1473064651;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";'),
('8d8508fd3804031c85ee0f425803d88ecccbeb78', '127.0.0.1', 1473068336, '__ci_last_regenerate|i:1473064687;code|s:4:"7BVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472961542";'),
('e13473b559fd09f35f8ad8fd3c32f07b1ca83b6f', '127.0.0.1', 1473064799, '__ci_last_regenerate|i:1473064757;code|s:4:"qIgV";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472802151";'),
('69b13a29323e38e70786c5cdbf03f303b56c537e', '127.0.0.1', 1473065408, '__ci_last_regenerate|i:1473065121;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";'),
('79d4ca583d9de60cae04af62d3cd103e3905129c', '127.0.0.1', 1473066983, '__ci_last_regenerate|i:1473065467;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";'),
('f841e8ebbac2f41246b7eaf73058ad9646e37094', '127.0.0.1', 1473067889, '__ci_last_regenerate|i:1473065488;code|s:4:"qIgV";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472802151";'),
('2fe044753c214a8f3b949b4808542e62fca73bef', '127.0.0.1', 1473065616, '__ci_last_regenerate|i:1473065523;code|s:4:"DckD";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473047750";'),
('d489335f38316e2164bd2840fc7d028de6bbdfcc', '127.0.0.1', 1473067412, '__ci_last_regenerate|i:1473066998;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";current_price|s:19:"oHGvUuyu70VIQIgTAPQ";__ci_vars|a:1:{s:13:"current_price";i:1473068599;}'),
('3181fa59c1218f6fa700cbd3cdc5164f6f1450c3', '127.0.0.1', 1473067736, '__ci_last_regenerate|i:1473067417;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";current_price|s:19:"oHGvUuyu70VIQIgTAPQ";__ci_vars|a:3:{s:13:"current_price";i:1473068930;s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfkey|s:8:"cOi8xmVF";csrfvalue|s:20:"mMohcPezSUDJrpI2jF80";'),
('558e5ee31a9db11ff7ad7f49dfcd80c1e0d7508b', '127.0.0.1', 1473068270, '__ci_last_regenerate|i:1473067748;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";current_price|N;__ci_vars|a:4:{s:13:"current_price";i:1473069022;s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:7:"success";s:3:"new";}csrfkey|s:8:"qRdeInHb";csrfvalue|s:20:"i6NT4UEf75ybrYnapteJ";success|s:48:"项目编辑成功！ 编号: GM1609055931733042";'),
('445de368f12cf1af271e5dd3936aa8bd484ba14c', '127.0.0.1', 1473068350, '__ci_last_regenerate|i:1473068270;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";current_price|N;__ci_vars|a:3:{s:13:"current_price";i:1473069022;s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"kamKse7g";csrfvalue|s:20:"eXIuQ8E7vkgmRsbPzjKn";'),
('a4e892c1acef5ff75880ced0079ee71735f7b31c', '127.0.0.1', 1473076053, '__ci_last_regenerate|i:1473068411;code|s:4:"7BVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472961542";'),
('6938dd443aee393e36edafaab7363dfc3775c343', '127.0.0.1', 1473075991, '__ci_last_regenerate|i:1473068702;code|s:4:"qIgV";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472802151";'),
('53d0831f2647e76621e4da8c6f44ca5d13ffc21c', '127.0.0.1', 1473071976, '__ci_last_regenerate|i:1473069468;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";current_price|s:19:"oHGvUuyu70VIQIgTAPQ";__ci_vars|a:1:{s:13:"current_price";i:1473073151;}'),
('c3fc79635a969575e24831a1d3eb19f6ffcd3236', '127.0.0.1', 1473072002, '__ci_last_regenerate|i:1473071983;code|s:4:"8UEp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473047360";current_price|N;__ci_vars|a:3:{s:13:"current_price";i:1473073151;s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"4w3cej7A";csrfvalue|s:20:"AumeOEcqQ4xBaGHvRhSI";'),
('5d91562e2ac31ca2e1ec4a7786aa273b263ad826', '127.0.0.1', 1473072469, '__ci_last_regenerate|i:1473072388;code|s:4:"dVUi";'),
('c7d85553f7cd1092856c255273bb397ebadac6cf', '127.0.0.1', 1473072464, '__ci_last_regenerate|i:1473072452;code|s:4:"7BVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472961542";ajax_permission|s:46:"没有授权访问  <br> [setting/system/save]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('39fb3053972f93f8ee02f3b6ee4a5928c528e17f', '127.0.0.1', 1473084348, '__ci_last_regenerate|i:1473081763;code|s:4:"xCCg";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473064700";'),
('53990d6a8fcd61f1182a1c9b17d2ac5e342a0dd4', '127.0.0.1', 1473083393, '__ci_last_regenerate|i:1473082840;code|s:4:"4Gqw";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473060913";csrfkey|s:8:"ZfUrynRI";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"WTdP9v16OE3LDjFnXeqM";'),
('ddc89e4d6de3d46793cd851a7cbf9249ffe02248', '127.0.0.1', 1473084656, '__ci_last_regenerate|i:1473083447;code|s:4:"4Gqw";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473060913";csrfkey|s:8:"Gk7sF4T5";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"rsgCIeAONz6W9VLtqMhE";'),
('3e718fcc40d955385c741dc7ad77bab60b06056d', '127.0.0.1', 1473085026, '__ci_last_regenerate|i:1473084801;code|s:4:"4Gqw";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473060913";csrfkey|s:8:"9seJgunH";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"qhr1n0gSRAyLNW6wvlBF";'),
('11315478acddd7f96250c44cbba523060da5d8c0', '127.0.0.1', 1473084904, '__ci_last_regenerate|i:1473084869;code|s:4:"xCCg";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473064700";csrfkey|s:8:"upnDX9Z6";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"y1OEPFc7YXlVLjNWi0x8";'),
('8c30d6c3d0bfa5cb78f7185aedbf5a3ac32b5118', '127.0.0.1', 1473085576, '__ci_last_regenerate|i:1473085311;code|s:4:"4Gqw";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473060913";csrfkey|s:8:"7nXYAOVR";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"aHmg2FBRjZ91GYq83NCn";'),
('36b92d8d65a0846992fc5d9ddcfaa060101a6c1a', '127.0.0.1', 1473085424, '__ci_last_regenerate|i:1473085413;code|s:4:"xCCg";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473064700";csrfkey|s:8:"EsawNf9g";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"26mbKBjT0tcx8RMGalLi";'),
('0756d4c313c4be245921d09c87801ae142678957', '127.0.0.1', 1473086030, '__ci_last_regenerate|i:1473085816;code|s:4:"xCCg";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473064700";csrfkey|s:8:"K2TmeIOz";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"DoMIEjhlaTL0368OYCWF";'),
('c13cbcd8780a0b18db19e6bb3ca966735ce8cf66', '127.0.0.1', 1473086124, '__ci_last_regenerate|i:1473085874;code|s:4:"4Gqw";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473060913";csrfkey|s:8:"s9BUKm3X";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"CB0IOApyrfJUFtdLkTEG";'),
('e44aa411d91319d11f379d62af3283c72ff02c3f', '127.0.0.1', 1473086961, '__ci_last_regenerate|i:1473086131;code|s:4:"6wAk";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473082851";csrfkey|s:8:"Gqbrt9mn";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"xc1ETp36HjwzPbQsi78Z";'),
('54b75366dd62255efdbeb8064539abe44da7effb', '127.0.0.1', 1473086281, '__ci_last_regenerate|i:1473086238;code|s:4:"4Gqw";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473060913";csrfkey|s:8:"A396gals";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"R8fM0Q1bB5vTxrtZiDkw";'),
('5dca9fcd4863dc5bba5c7d11ef846d8a2115f48c', '127.0.0.1', 1473087828, '__ci_last_regenerate|i:1473086702;code|s:4:"4Gqw";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473060913";csrfkey|s:8:"V9UoJIkE";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"QV62XIjhSfcsLpEN7RCq";'),
('46b62388421dc85b7261debe02c663cb37784934', '127.0.0.1', 1473088046, '__ci_last_regenerate|i:1473086976;code|s:4:"6wAk";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473082851";csrfkey|s:8:"uer3tfwV";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"2rshOzR1JUmqPDQNEvcb";'),
('8e4ea819766465a0e3fb1af63c7db4a056b7882b', '127.0.0.1', 1473088055, '__ci_last_regenerate|i:1473087883;code|s:4:"nq96";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:10:"1472269180";csrfkey|s:8:"UyK92rCO";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"ZnO3gATK5XPkvoqQj81p";');

-- --------------------------------------------------------

--
-- 表的结构 `gd_setting`
--

CREATE TABLE IF NOT EXISTS `gd_setting` (
  `setting_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL DEFAULT '',
  `value` text,
  `serialized` tinyint(1) NOT NULL DEFAULT '0',
  `group` varchar(64) NOT NULL DEFAULT 'config',
  `initial` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`setting_id`,`code`),
  KEY `option_name` (`code`),
  KEY `auto_load` (`initial`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `gd_setting`
--

INSERT INTO `gd_setting` (`setting_id`, `code`, `value`, `serialized`, `group`, `initial`) VALUES
(4, 'site_name', '黄金码头', 0, 'site', 1),
(5, 'site_keywords', '黄金交易 金生金 ', 0, 'site', 1),
(6, 'site_description', '值得信赖的私人的金库', 0, 'site', 1),
(7, 'site_email', 'gold@xinyan.com', 0, 'site', 1),
(8, 'golden_price', 'a:2:{s:6:"apikey";s:16:"101ae9aa1007ce6d";s:6:"apiurl";s:34:"http://api.jisuapi.com/gold/shgold";}', 1, 'api', 1),
(9, 'investing_privacy', '2', 0, 'project', 1),
(10, 'investing_initial', '1', 0, 'project', 1),
(11, 'recycling_privacy', '3', 0, 'project', 1),
(12, 'recycling_initial', '1', 0, 'project', 1),
(13, 'profit_weight', '6', 0, 'project', 1),
(14, 'investing_checked', '2', 0, 'project', 1),
(15, 'investing_confirmed', '3', 0, 'project', 1),
(18, 'investing_refused', '5', 0, 'project', 1),
(19, 'investing_terminated', '6', 0, 'project', 1),
(25, 'recycling_checked', '2', 0, 'project', 1),
(26, 'recycling_confirmed', '3', 0, 'project', 1),
(30, 'recycling_refused', '5', 0, 'project', 1),
(31, 'recycling_terminated', '6', 0, 'project', 1),
(32, 'order_percent', '30', 0, 'project', 1),
(33, 'recycling_growing', '4', 0, 'project', 1),
(34, 'gold_growing', 'season', 0, 'project', 1),
(35, 'growing_mode', 't0', 0, 'project', 1),
(36, 'investing_growing', '4', 0, 'project', 1),
(37, 'terminated_trash', '1', 0, 'project', 1),
(38, 'site_title', '黄金码头 黄金线下交易平台', 0, 'site', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker`
--

CREATE TABLE IF NOT EXISTS `gd_worker` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
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
  `phone` varchar(20) DEFAULT NULL,
  `wechat` varchar(64) DEFAULT NULL,
  `qq` char(12) DEFAULT NULL,
  `company_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `gd_worker`
--

INSERT INTO `gd_worker` (`id`, `username`, `realname`, `avatar`, `password`, `salt`, `email`, `remember_code`, `addtime`, `last_login`, `last_ip`, `status`, `phone`, `wechat`, `qq`, `company_id`) VALUES
(1, 'admin-root', '管理员', 'public/images/avatar/121034209220f1.jpg', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', NULL, 1469999823, 1473065533, '127.0.0.1', 1, '', NULL, NULL, 0),
(2, 'zhujingxiu', '朱景修', NULL, '$2y$08$QQOBCnHUhFTH/CjeWztJGOOfAz2xuqSki7P2qn5/WojZQvXc10NAK', NULL, 'zhujingxiu@hotmail.com', NULL, 1470736567, 1470736771, '127.0.0.1', 1, '18850911766', NULL, NULL, 0),
(3, 'jingli-demo1', '经理测试', 'public/images/avatar/avatar2.png', '$2y$08$k1dyXUI7CRYqc/CpH9UT0ONk93y3sP7EQ5Jdcr/lvOoUE4Tob05Oe', NULL, 'a@a.c', NULL, 1471598448, 1473081769, '127.0.0.1', 1, '13913901390', 'qweweqweq', '', 0),
(4, 'jingli-demo2', '经理测试B', 'public/images/avatar/user1-128x128.jpg', '$2y$08$1gGt5kfd2/S0WGDZNt6PMu8bj1WBhiww4AgNx4TJSRrJaiQ7jV4gu', NULL, 'a@a.cc', NULL, 1471598720, 1472277405, '127.0.0.1', 1, '', NULL, NULL, 0),
(5, 'dengji-demo1', '登记测试A', 'public/images/avatar/avatar1.png', '$2y$08$YHzCZKpn3DYoZWYfE4UD4.7KSke2QaVc5Ou04ljhRNZn5sDqc7QF2', NULL, 'b@a.cc', NULL, 1471598889, 1473086147, '127.0.0.1', 1, '', NULL, NULL, 0),
(6, 'dengji-demo2', '录单测试B', 'public/images/avatar/user3-128x128.jpg', '$2y$08$7JByOlb/P/L.c8P.mqeMX.N7qSiLGBWyx3YWA44wUDkAMY0rGKtQS', NULL, 'ludan@b.cc', NULL, 1471598958, 1473087895, '127.0.0.1', 1, '', NULL, NULL, 0),
(7, 'kuguan-demo1', '库管测试A', 'public/images/avatar/user4-128x128.jpg', '$2y$08$SuuFWJ0sZL2z.SZDLaTX3Od/bkVZ04Ax1fc1SmDtoVf8X0XjuRuJO', NULL, 'kuguan@bb.c', NULL, 1471599005, 1473064770, '127.0.0.1', 1, '', NULL, NULL, 0),
(8, 'kuguan-demo2', '库管测试B', 'public/images/avatar/user5-128x128.jpg', '$2y$08$18MwNqHD5QKE/M2xcF4NXuLScN67KrGQfBCfXPEEEM/W5PNC/5/5G', NULL, 'kuguan@a.cc', NULL, 1471599054, 1472280758, '127.0.0.1', 1, '', NULL, NULL, 0),
(9, 'jianding-demo1', '鉴定人A', 'public/images/avatar/user8-128x128.jpg', '$2y$08$GqumJcWGIEa25v1OB3i5M.k8Vgxg99kuKXpGsUs5ZzQiUIp.Qer5G', NULL, 'jianding@g.cc', NULL, 1471599152, 0, '127.0.0.1', 1, '', NULL, NULL, 0),
(10, 'jianding-demo2', '鉴定人B', 'public/images/avatar/user7-128x128.jpg', '$2y$08$kPYhqg2giK0IhN5v6WS4WuMQvXq0m0gpF6Cx.xAR4..dsxS9UmNDG', NULL, 'admin@admin.com', NULL, 1471599225, 0, '127.0.0.1', 1, '', NULL, NULL, 0),
(11, 'all-demo1', '综合账户', 'public/images/avatar/user2-160x160.jpg', '$2y$08$bnDehV48c1sDsmwPNmmTHOdMMxUE1MHNGItvkmvL7CC2G20doVhcq', NULL, 'all@b.cc', NULL, 1471599856, 1471600479, '127.0.0.1', 1, '', NULL, NULL, 0),
(12, 'zhujingxiu1', '朱景修2', NULL, '$2y$08$QQOBCnHUhFTH/CjeWztJGOOfAz2xuqSki7P2qn5/WojZQvXc10NAK', NULL, 'zhujingxiu@hotmail.com', NULL, 1470736567, 1470736771, '127.0.0.1', 1, '18850911766', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_activity`
--

CREATE TABLE IF NOT EXISTS `gd_worker_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `gd_worker_activity`
--

INSERT INTO `gd_worker_activity` (`activity_id`, `worker_id`, `content`, `addtime`) VALUES
(1, 3, '经理测试 于 2016-09-04 20:30:16 更新了个人资料', 1472992216);

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_attempt`
--

CREATE TABLE IF NOT EXISTS `gd_worker_attempt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_company`
--

CREATE TABLE IF NOT EXISTS `gd_worker_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_group`
--

CREATE TABLE IF NOT EXISTS `gd_worker_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `is_system` tinyint(4) NOT NULL DEFAULT '0',
  `permission` text,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `gd_worker_group`
--

INSERT INTO `gd_worker_group` (`id`, `code`, `title`, `is_system`, `permission`, `status`) VALUES
(1, 'admin', '管理组', 1, '', 1),
(2, 'member', '业务员', 0, '2997,2999,3001,3003,2998,3000,3002', 1),
(3, 'manager', '经理', 0, '1,2,3,5,6,7,8,9,10,11,22,23,24,25,26,27,30,33,35,48,49,50,51,52,55,59,63,67,68,70,78,80,84,85,94,96,98,100,101,102,105,106,107,108,109,110,112,113,114,115,116,118', 1),
(4, 'warehouser', '库管', 0, '1,2,3,55,61,65,70,82,87,98,100,101,105,107,108,111,117,118,119', 1),
(5, 'appraiser', '鉴定人', 0, '74,73,70,1,3,2', 1),
(6, 'booker', '登记人', 0, '1,2,3,52,55,57,70,72,93,98,100,101,103', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_notify`
--

CREATE TABLE IF NOT EXISTS `gd_worker_notify` (
  `notify_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL DEFAULT '0',
  `receiver_id` int(11) NOT NULL,
  `mode` enum('announcement',' summary') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'announcement',
  `title` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`notify_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_rel`
--

CREATE TABLE IF NOT EXISTS `gd_worker_rel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`worker_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`worker_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `gd_worker_rel`
--

INSERT INTO `gd_worker_rel` (`id`, `worker_id`, `group_id`) VALUES
(20, 1, 1),
(5, 3, 3),
(7, 4, 3),
(9, 5, 6),
(11, 6, 6),
(13, 7, 4),
(15, 8, 4),
(17, 9, 5),
(19, 10, 5),
(22, 11, 3),
(23, 11, 5),
(24, 11, 6),
(21, 12, 2);

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
