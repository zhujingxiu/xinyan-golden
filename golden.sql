-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-09-26 10:37:46
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
-- 表的结构 `gd_cron_job`
--

CREATE TABLE `gd_cron_job` (
  `job_id` int(11) NOT NULL,
  `method` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `args` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_cron_job`
--

INSERT INTO `gd_cron_job` (`job_id`, `method`, `args`, `status`, `addtime`) VALUES
(1, 'today_price', NULL, 1, 1473003003),
(2, 'push_growing', NULL, 1, 1473211232),
(3, 'growing', NULL, 1, 1473211232);

-- --------------------------------------------------------

--
-- 表的结构 `gd_cron_log`
--

CREATE TABLE `gd_cron_log` (
  `log_time` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `action` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `gd_cron_schedule`
--

CREATE TABLE `gd_cron_schedule` (
  `schedule_id` int(10) UNSIGNED NOT NULL,
  `job_code` varchar(255) NOT NULL DEFAULT '0',
  `status` enum('pending','running','success','missed','error') NOT NULL DEFAULT 'pending',
  `messages` text,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `executed_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `finished_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer`
--

CREATE TABLE `gd_customer` (
  `customer_id` int(11) NOT NULL,
  `realname` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `idnumber` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `wechat` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `qq` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(96) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_id` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `referrer_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT '0',
  `card_number` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_customer`
--

INSERT INTO `gd_customer` (`customer_id`, `realname`, `avatar`, `phone`, `idnumber`, `wechat`, `qq`, `email`, `address`, `group_id`, `status`, `referrer_id`, `company_id`, `card_number`, `note`, `worker_id`, `addtime`, `lasttime`) VALUES
(2, '李百度', NULL, '18856911766', '321245198905080904', '', NULL, NULL, NULL, 1, 1, '2', 1, '', NULL, 5, 1472552472, 1472552472),
(3, '刘京东', NULL, '18959506595', '321324199008080808', '', NULL, NULL, NULL, 1, 1, '2', 0, '', NULL, 5, 1472559583, 1472559583),
(4, '马晓云', NULL, '18850219878', '321324195406050508', '', '', '', '', 1, 1, '18', 1, '', '', 3, 1472604934, 1474786853),
(5, '马腾讯', NULL, '18959596565', '321254198808050604', '', NULL, NULL, NULL, 1, 1, '12', 0, '', NULL, 5, 1472605860, 1472605860),
(6, '余华为', NULL, '18959596767', '321254198908050604', '', NULL, NULL, NULL, 1, 1, '12', 0, '', NULL, 5, 1472605860, 1472605860),
(7, '雷小米', NULL, '13113213313', '347483196403212419', 'leixiaomi', '324456532', 'a@a.c', '', 1, 1, '2', 1, '312355435436554', 'sadasdasd', 3, 1472645815, 1474729134),
(8, '乔苹果', NULL, '18808800990', '325225197008078888', 'qiaopingguo', '32323454435', '', '', 2, 1, '33', 1, '', '乔帮主', 3, 1472646256, 1474786826),
(9, '沈万三', NULL, '13813800138', '138139199810039997', 'shenwansan', '64568789797', 'a@b.cc', NULL, 2, 1, '12', 1, '1234354354634', 'asdsadasds', 3, 1472707274, 1472707274),
(10, '赵公明', NULL, '13606660888', '123321196606066666', 'zhaogongming', '', NULL, NULL, 3, 1, '12', 0, '', 'asdsad', 1, 1473059868, 1473059868),
(11, '陌生人', NULL, '13856987898', '328526198707074598', 'stranger', NULL, NULL, NULL, 1, 1, '14', 0, '', NULL, 3, 1474624551, 1474624551),
(12, '我也是陌生人', NULL, '15968980546', '780159200001010458', 'strangertoo', '', '', '', 1, 1, '11', 1, '', '', 3, 1474625099, 1474787409),
(13, '朱羽楼', NULL, '18850911766', '321432198709244610', 'zhuyulou', '', 'sadsa@ss.cc', 'asdsadsa', 1, 1, '15', 1, '20140415004444', 'asdsadsadasda', 3, 1474786779, 1474786779);

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer_apply`
--

CREATE TABLE `gd_customer_apply` (
  `apply_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` decimal(11,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(8,2) NOT NULL DEFAULT '0.00',
  `mode` enum('taking','order','renew') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'taking',
  `file` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  `note` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `locker_id` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_customer_apply`
--

INSERT INTO `gd_customer_apply` (`apply_id`, `customer_id`, `phone`, `weight`, `fee`, `mode`, `file`, `data`, `note`, `status`, `worker_id`, `addtime`, `locker_id`, `ip`) VALUES
(1, 9, '13813800138', '50.00', '50.00', 'taking', '[{"name":"privacy.jpg","path":"public\\/uploads\\/2016\\/09\\/250201041190d6.jpg"}]', '', 'sadsadsa', 0, 3, 1474740092, 0, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer_card`
--

CREATE TABLE `gd_customer_card` (
  `card_number` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `card_serial` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_customer_card`
--

INSERT INTO `gd_customer_card` (`card_number`, `card_serial`, `status`) VALUES
('312355435436554', '9C8914DB', 1),
('1234354354634', '3B8814DB', 1),
('20140415004444', '8616B845', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer_group`
--

CREATE TABLE `gd_customer_group` (
  `group_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule` text COLLATE utf8_unicode_ci,
  `note` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_customer_group`
--

INSERT INTO `gd_customer_group` (`group_id`, `title`, `code`, `icon`, `rule`, `note`, `status`, `worker_id`, `addtime`, `lasttime`) VALUES
(1, '金卡', 'bronze', NULL, NULL, '普通金卡会员', 1, 1, 1472583692, 1472583692),
(2, '白金卡', 'silver', NULL, NULL, '白金卡会员', 1, 1, 1472589632, 1472589632),
(3, '钻石卡', ' gold', NULL, NULL, '钻石卡会员', 1, 1, 1472589963, 1472589963);

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer_history`
--

CREATE TABLE `gd_customer_history` (
  `history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_customer_history`
--

INSERT INTO `gd_customer_history` (`history_id`, `customer_id`, `note`, `worker_id`, `addtime`) VALUES
(1, 9, 'taking 50.00克', 3, 1474740092);

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer_sms`
--

CREATE TABLE `gd_customer_sms` (
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `code` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_customer_sms`
--

INSERT INTO `gd_customer_sms` (`phone`, `code`, `time`) VALUES
('13113213313', '519036', 1474875440),
('18850911766', '166516', 1474878448);

-- --------------------------------------------------------

--
-- 表的结构 `gd_customer_stock`
--

CREATE TABLE `gd_customer_stock` (
  `stock_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `mode` enum('frozen','in','out','profit','free') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'profit',
  `frozen` enum('0','checking','taking','renew','order') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `weight` decimal(13,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(13,2) NOT NULL DEFAULT '0.00',
  `file` text COLLATE utf8_unicode_ci,
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_customer_stock`
--

INSERT INTO `gd_customer_stock` (`stock_id`, `customer_id`, `mode`, `frozen`, `project_sn`, `weight`, `fee`, `file`, `notify`, `note`, `worker_id`, `status`, `addtime`) VALUES
(1, 12, 'frozen', 'checking', 'GM1609242512321047', '30.00', '0.00', NULL, 1, '核实并冻结项目 GM1609242512321047 黄金克重 30.00 克 到客户账户', 3, 0, 1474730277),
(2, 3, 'frozen', 'checking', 'GM1609257100083858', '11.00', '0.00', NULL, 1, '核实并冻结项目 GM1609257100083858 黄金克重 11.00 克 到客户账户', 3, 1, 1474737229),
(3, 11, 'frozen', 'checking', 'GM1609245802235706', '20.00', '0.00', NULL, 1, '核实并冻结项目 GM1609245802235706 黄金克重 20.00 克 到客户账户', 3, 1, 1474738345),
(4, 11, 'frozen', 'checking', 'GR1609231601775551', '9.99', '0.00', NULL, 1, '核实并冻结项目 GR1609231601775551 黄金克重 9.99 克 到客户账户', 3, 0, 1474738454),
(5, 11, 'in', '0', 'GR1609231601775551', '9.99', '0.00', NULL, 1, 'sadsadsadd', 3, 1, 1474739358),
(6, 11, 'profit', '0', 'GR1609231601775551', '0.14', '0.00', NULL, 1, '项目提前终止所得金息', 3, 1, 1474739358),
(7, 9, 'frozen', 'checking', 'GR1609253360155336', '198.90', '0.00', NULL, 1, '核实并冻结项目 GR1609253360155336 黄金克重 198.90 克 到客户账户', 3, 0, 1474739650),
(8, 9, 'in', '0', 'GR1609253360155336', '198.90', '0.00', NULL, 1, 'sadsadasdsa', 3, 1, 1474739711),
(9, 9, 'profit', '0', 'GR1609253360155336', '1.00', '0.00', NULL, 1, '项目提前终止所得金息', 3, 1, 1474739711),
(11, 9, 'out', '0', '', '-50.00', '50.00', '[{"name":"privacy.jpg","path":"public\\/uploads\\/2016\\/09\\/250201041190d6.jpg"}]', 1, 'sadsadsa', 7, 1, 1474740329),
(12, 12, 'in', '0', 'GM1609242512321047', '30.00', '0.00', NULL, 1, 'wqrtretrtre', 3, 1, 1474858403),
(13, 12, 'profit', '0', 'GM1609242512321047', '0.44', '0.00', NULL, 1, '项目提前终止所得金息', 3, 1, 1474858403);

-- --------------------------------------------------------

--
-- 表的结构 `gd_golden_price`
--

CREATE TABLE `gd_golden_price` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `typename` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(31, '2016-09-04', 'Au99.99', '沪金99', '282.46', 1473047202),
(32, '2016-09-05', 'Au99.99', '沪金99', '285.33', 1473122091),
(33, '2016-09-06', 'Au99.99', '沪金99', '286.30', 1473208513),
(34, '2016-09-07', 'Au99.99', '沪金99', '289.37', 1473297213),
(35, '2016-09-08', 'Au99.99', '沪金99', '289.20', 1473382443),
(36, '2016-09-12', 'Au99.99', '沪金99', '286.39', 1473731215),
(37, '2016-09-13', 'Au99.99', '沪金99', '286.15', 1473782641),
(38, '2016-09-14', 'Au99.99', '沪金99', '286.15', 1473929731),
(39, '2016-09-15', 'Au99.99', '沪金99', '265.00', 1473961244),
(40, '2016-09-18', 'Au99.99', '沪金99', '286.15', 1474214815),
(41, '2016-09-19', 'Au99.99', '沪金99', '283.80', 1474303598),
(42, '2016-09-20', 'Au99.99', '沪金99', '283.50', 1474390039),
(43, '2016-09-21', 'Au99.99', '沪金99', '284.40', 1474476456),
(44, '2016-09-22', 'Au99.99', '沪金99', '286.85', 1474562878),
(45, '2016-09-23', 'Au99.99', '沪金99', '286.80', 1474575878);

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
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(62, 'auth', 54, 1, 'privacy', '打印协议', 'project/investing/privacy', 1, 1, 0, ''),
(63, 'auth', 54, 1, 'applied', '申请取金', 'project/investing/applied', 1, 1, 0, ''),
(64, 'auth', 54, 1, 'reset_locker', '释放表单锁', 'project/investing/reset_locker', 1, 0, 0, ''),
(65, 'auth', 54, 1, 'detail', '项目详情', 'project/investing/detail', 1, 1, 0, ''),
(67, 'auth', 54, 1, 'refused', '驳回项目', 'project/investing/refused', 1, 1, 0, ''),
(68, 'auth', 54, 1, 'trashed', '废弃项目', 'project/investing/trashed', 1, 1, 0, ''),
(69, 'auth', 53, 1, 'recycling', '金生金', 'project/recycling', 1, 1, 0, ''),
(70, 'auth', 69, 1, 'index', '读取项目列表', 'project/recycling/index', 1, 1, 0, ''),
(72, 'auth', 69, 1, 'booked', '登记项目', 'project/recycling/booked', 1, 1, 0, ''),
(78, 'auth', 69, 1, 'checked', '核实项目资料', 'project/recycling/checked', 1, 1, 0, ''),
(80, 'auth', 69, 3, 'terminated', '终止项目', 'project/recycling/terminated', 1, 1, 0, ''),
(81, 'auth', 69, 3, 'reset_locker', '释放表单锁', 'project/recycling/reset_locker', 1, 0, 0, ''),
(82, 'auth', 69, 1, 'detail', '项目详情', 'project/recycling/detail', 1, 1, 0, ''),
(83, 'auth', 69, 1, 'privacy', '打印协议', 'project/recycling/privacy', 1, 1, 0, ''),
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
(95, 'auth', 88, 1, 'home', '发布通知', 'home/notification', 1, 0, 0, NULL),
(96, 'auth', 54, 1, 'cancle', '取消申请提金', 'project/investing/cancle', 1, 1, 0, ''),
(98, 'auth', 1, 1, 'filemanager', '文件管理', 'tool/filemanager', 1, 0, 0, ''),
(100, 'auth', 98, 1, 'upload', '上传文件', 'tool/filemanager/upload', 1, 0, 0, ''),
(101, 'auth', 98, 1, 'download', '下载文件', 'tool/filemanager/download', 1, 0, 0, ''),
(102, 'auth', 5, 1, 'autocomplete', '自动匹配', 'auth/worker/autocomplete', 1, 0, 0, ''),
(103, 'auth', 69, 1, 'update', '编辑项目', 'project/recycling/update', 1, 1, 0, ''),
(104, 'auth', 53, 1, 'customer', '客户管理', 'project/customer', 1, 1, 0, ''),
(105, 'auth', 104, 1, 'index', '查看客户列表', 'project/customer/index', 1, 1, 0, ''),
(106, 'auth', 104, 1, 'update', '更新客户资料', 'project/customer/update', 1, 1, 0, ''),
(107, 'auth', 104, 1, 'projects', '查看客户项目明细', 'project/customer/projects', 1, 1, 0, ''),
(108, 'auth', 104, 1, 'autocomplete', '自动匹配客户资料', 'project/customer/autocomplete', 1, 0, 0, ''),
(109, 'auth', 104, 1, 'taking', '客户申请提金', 'project/customer/taking', 1, 1, 0, ''),
(110, 'auth', 104, 1, 'order', '门店消费申请', 'project/customer/order', 1, 1, 0, ''),
(111, 'auth', 104, 1, 'taken', '确认申请提金或消费', 'project/customer/taken', 1, 1, 0, ''),
(112, 'auth', 104, 1, 'cancle', '取消客户提金申请', 'project/customer/cancle', 1, 1, 0, ''),
(113, 'auth', 53, 1, 'trash', '回收站', 'project/trash', 1, 1, 0, ''),
(114, 'auth', 113, 1, 'index', '读取回收站列表', 'project/trash/index', 1, 1, 0, ''),
(115, 'auth', 113, 1, 'restore', '还原', 'project/trash/restore', 1, 1, 0, ''),
(116, 'auth', 113, 1, 'remove', '删除', 'project/trash/remove', 1, 1, 0, ''),
(117, 'auth', 53, 1, 'stock', '库存管理', 'project/stock', 1, 1, 0, ''),
(118, 'auth', 117, 1, 'inde', '读取库存列表', 'project/stock/index', 1, 1, 0, ''),
(119, 'auth', 117, 1, 'taken', '处理提金申请', 'project/stock/taken', 1, 1, 0, ''),
(120, 'auth', 117, 1, 'detail', '详细信息', 'project/stock/detail', 1, 1, 0, ''),
(121, 'auth', 117, 3, 'terminated', '终止项目', 'project/stock/terminated', 1, 1, 0, ''),
(122, 'auth', 117, 3, 'order', '消费抵扣', 'project/stock/order', 1, 1, 0, ''),
(123, 'auth', 117, 3, 'renew', '可用金续存', 'project/stock/renew', 1, 1, 0, ''),
(124, 'auth', 104, 1, 'bind', '绑定金卡', 'project/customer/bind', 1, 1, 0, ''),
(125, 'auth', 104, 1, 'unbind', '取消客户金卡绑定', 'project/customer/unbind', 1, 1, 0, ''),
(126, 'auth', 104, 1, 'check_card', '验证输入的卡号', 'project/customer/check_card', 1, 1, 0, ''),
(127, 'auth', 104, 1, 'renew', '客户续存黄金', 'project/customer/renew', 1, 1, 0, ''),
(128, 'auth', 104, 1, 'free', '赠送客户黄金', 'project/customer/free', 1, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_file`
--

CREATE TABLE `gd_project_file` (
  `file_id` int(11) NOT NULL,
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `mode` enum('investing','recycling') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'recycling',
  `dir` enum('photo','invoice','report','privacy') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'photo',
  `file` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_file`
--

INSERT INTO `gd_project_file` (`file_id`, `project_sn`, `mode`, `dir`, `file`, `status`, `worker_id`, `addtime`) VALUES
(1, 'GR1609231601775551', 'recycling', 'photo', '[{"name":"goldbar.jpg","path":"public\\/uploads\\/2016\\/09\\/23175126fcf4c7.jpg"}]', 1, 3, 1474624551),
(2, 'GR1609231601775551', 'recycling', 'invoice', '[{"name":"invoice.jpg","path":"public\\/uploads\\/2016\\/09\\/2317541695b401.jpg"}]', 1, 3, 1474624551),
(3, 'GR1609231601775551', 'recycling', 'report', '[{"name":"report.jpg","path":"public\\/uploads\\/2016\\/09\\/23175420bdd402.jpg"}]', 1, 3, 1474624551),
(4, 'GR1609231601775551', 'recycling', 'privacy', '[{"name":"privacy.jpg","path":"public\\/uploads\\/2016\\/09\\/2317554380106e.jpg"}]', 1, 3, 1474624551),
(5, 'GR1609235221840459', 'recycling', 'photo', '[{"name":"goldbar.jpg","path":"public\\/uploads\\/2016\\/09\\/23180341de96ee.jpg"}]', 1, 3, 1474625099),
(6, 'GR1609235221840459', 'recycling', 'invoice', '[{"name":"invoice.jpg","path":"public\\/uploads\\/2016\\/09\\/2318034601e8e2.jpg"}]', 1, 3, 1474625099),
(7, 'GR1609235221840459', 'recycling', 'report', '[{"name":"report.jpg","path":"public\\/uploads\\/2016\\/09\\/2318035416a486.jpg"}]', 1, 3, 1474625099),
(8, 'GM1609243622254747', 'investing', 'privacy', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/242247401c17c6.txt"}]', 1, 3, 1474728467),
(9, 'GM1609241302234835', 'investing', 'privacy', '[{"name":"29155000ed424f.txt","path":"public\\/uploads\\/2016\\/09\\/242248319f2a68.txt"}]', 1, 3, 1474728515),
(10, 'GM1609245802235706', 'investing', 'privacy', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/24225703118379.txt"}]', 1, 3, 1474729026),
(11, 'GM1609241512310037', 'investing', 'privacy', '[{"name":"privacy.jpg","path":"public\\/uploads\\/2016\\/09\\/2423002467ceaf.jpg"}]', 1, 3, 1474729237),
(12, 'GM1609242502310914', 'investing', 'privacy', '[{"name":"privacy.jpg","path":"public\\/uploads\\/2016\\/09\\/242309099e5cc3.jpg"}]', 1, 3, 1474729754),
(13, 'GM1609242512321047', 'investing', 'privacy', '[{"name":"report.jpg","path":"public\\/uploads\\/2016\\/09\\/24231044f66cbf.jpg"}]', 1, 3, 1474729847),
(14, 'GM1609257100083858', 'investing', 'privacy', '[{"name":"report.jpg","path":"public\\/uploads\\/2016\\/09\\/2500385342fe5e.jpg"}]', 1, 3, 1474735138),
(15, 'GR1609253370191206', 'recycling', 'photo', '[{"name":"goldcoin.jpg","path":"public\\/uploads\\/2016\\/09\\/25011131a9d0ea.jpg"}]', 1, 3, 1474737126),
(16, 'GR1609253370191206', 'recycling', 'report', '[{"name":"report.jpg","path":"public\\/uploads\\/2016\\/09\\/25011152577d92.jpg"}]', 1, 3, 1474737126),
(17, 'GR1609253360155336', 'recycling', 'photo', '[{"name":"goldcoin.jpg","path":"public\\/uploads\\/2016\\/09\\/2501530676d00b.jpg"}]', 1, 3, 1474739616),
(18, 'GR1609269901444317', 'recycling', 'photo', '[{"name":"goldcoin.jpg","path":"public\\/uploads\\/2016\\/09\\/26144158cb12ae.jpg"}]', 1, 3, 1474872197),
(19, 'GR1609269901444317', 'recycling', 'invoice', '[{"name":"invoice.jpg","path":"public\\/uploads\\/2016\\/09\\/261442097c221a.jpg"}]', 1, 3, 1474872197),
(20, 'GR1609269901444317', 'recycling', 'report', '[{"name":"report.jpg","path":"public\\/uploads\\/2016\\/09\\/26144218e45cad.jpg"}]', 1, 3, 1474872197),
(21, 'GM1609267481484350', 'investing', 'privacy', '[{"name":"privacy.jpg","path":"public\\/uploads\\/2016\\/09\\/26144344e7ee79.jpg"}]', 1, 3, 1474872230);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_investing`
--

CREATE TABLE `gd_project_investing` (
  `project_id` int(11) NOT NULL,
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` tinyint(4) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `referrer_id` int(11) DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(11,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `month` tinyint(4) NOT NULL DEFAULT '1',
  `profit` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `payment` enum('cash','gold') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gold',
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  `transferrer` int(11) NOT NULL DEFAULT '0',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `locker_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_investing`
--

INSERT INTO `gd_project_investing` (`project_id`, `project_sn`, `status_id`, `customer_id`, `referrer_id`, `company_id`, `price`, `weight`, `amount`, `month`, `profit`, `payment`, `start`, `end`, `note`, `is_del`, `transferrer`, `worker_id`, `addtime`, `lasttime`, `locker_id`) VALUES
(1, 'GM1609243622254747', 1, 5, 12, 1, '283.25', '20.00', '5665.00', 3, '0.0200', 'gold', NULL, NULL, 'asdsadsa', 0, 3, 3, 1474728467, 1474728467, 0),
(2, 'GM1609241302234835', 2, 4, 2, 1, '283.25', '50.00', '14162.50', 12, '0.0800', 'gold', NULL, NULL, 'sadsadsa', 0, 7, 3, 1474728515, 1474737901, 0),
(3, 'GM1609245802235706', 4, 11, 14, 1, '283.25', '20.00', '5665.00', 3, '0.0100', 'gold', '2016-09-24', '2016-12-23', '库存已确认标记，自动推进到正在增值', 0, 3, 7, 1474729026, 1474738610, 0),
(4, 'GM1609241512310037', 4, 8, 12, 1, '283.25', '19.00', '5381.75', 3, '0.0200', 'gold', NULL, NULL, '库存已确认标记，自动推进到正在增值', 0, 3, 7, 1474729237, 1474738573, 0),
(5, 'GM1609242502310914', 1, 6, 12, 1, '283.25', '10.00', '2832.50', 3, '0.0200', 'gold', NULL, NULL, 'qwewqewqewq', 0, 3, 3, 1474729754, 1474729754, 0),
(6, 'GM1609242512321047', 6, 12, 130, 1, '283.25', '30.00', '8497.50', 3, '0.0150', 'gold', '2016-09-24', '2016-12-23', 'wqrtretrtre', 0, 3, 3, 1474729847, 1474858403, 0),
(7, 'GM1609257100083858', 4, 3, 2, 1, '286.25', '11.00', '3148.75', 3, '0.0150', 'gold', '2016-09-25', '2016-12-24', '库存已确认标记，自动推进到正在增值', 0, 3, 7, 1474735138, 1474737297, 0),
(8, 'GM1609267481484350', 1, 13, 15, 1, '283.25', '30.00', '8497.50', 3, '0.0150', 'gold', NULL, NULL, 'asdsadsadsa', 0, 3, 3, 1474872230, 1474872230, 0);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_investing_history`
--

CREATE TABLE `gd_project_investing_history` (
  `history_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `request` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_investing_history`
--

INSERT INTO `gd_project_investing_history` (`history_id`, `project_id`, `status_id`, `note`, `request`, `worker_id`, `addtime`, `ip`) VALUES
(1, 1, 1, 'asdsadsa', '', 3, 1474728467, '127.0.0.1'),
(2, 2, 1, 'wqewqeqe', '', 3, 1474728515, '127.0.0.1'),
(3, 3, 1, 'asdasdsa', '', 3, 1474729026, '127.0.0.1'),
(4, 4, 1, 'wqewqeqweq', '', 3, 1474729237, '127.0.0.1'),
(5, 5, 1, 'qwewqewqewq', '', 3, 1474729754, '127.0.0.1'),
(6, 6, 1, 'asdsadsa', '', 3, 1474729847, '127.0.0.1'),
(9, 6, 2, 'dadssadas', 'array (\n  ''amount'' =&gt; ''8497.50'',\n  ''_amount'' =&gt; ''8497.50'',\n  ''phone'' =&gt; ''15968980546'',\n  ''_phone'' =&gt; ''15968980546'',\n)', 3, 1474730277, '127.0.0.1'),
(10, 7, 1, 'qwewqewqewq', '', 3, 1474735138, '127.0.0.1'),
(11, 7, 2, 'sadsadas', 'array (\n  ''amount'' =&gt; ''3148.75'',\n  ''_amount'' =&gt; ''3148.75'',\n  ''phone'' =&gt; ''18959506595'',\n  ''_phone'' =&gt; ''18959506595'',\n)', 3, 1474737229, '127.0.0.1'),
(12, 7, 3, 'sadsadasda', 'array (\n  ''weight'' =&gt; ''11.00'',\n  ''_weight'' =&gt; ''11.00'',\n  ''phone'' =&gt; ''18959506595'',\n  ''_phone'' =&gt; ''18959506595'',\n)', 7, 1474737297, '127.0.0.1'),
(13, 7, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1474737297, '127.0.0.1'),
(14, 6, 3, '', 'array (\n  ''weight'' =&gt; ''30.00'',\n  ''_weight'' =&gt; ''30.00'',\n  ''phone'' =&gt; ''15968980546'',\n  ''_phone'' =&gt; ''15968980546'',\n)', 7, 1474737324, '127.0.0.1'),
(15, 6, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1474737324, '127.0.0.1'),
(16, 4, 2, '231321', 'array (\n  ''amount'' =&gt; ''5381.75'',\n  ''_amount'' =&gt; ''5381.75'',\n  ''phone'' =&gt; ''18808800990'',\n  ''_phone'' =&gt; ''18808800990'',\n)', 3, 1474737831, '127.0.0.1'),
(17, 2, 2, 'sadsadsa', 'array (\n  ''amount'' =&gt; ''14162.50'',\n  ''_amount'' =&gt; ''14162.50'',\n  ''phone'' =&gt; ''18850219878'',\n  ''_phone'' =&gt; ''18850219878'',\n)', 3, 1474737901, '127.0.0.1'),
(18, 3, 2, 'sadsa', 'array (\n  ''amount'' =&gt; ''5665.00'',\n  ''_amount'' =&gt; ''5665.00'',\n  ''phone'' =&gt; ''13856987898'',\n  ''_phone'' =&gt; ''13856987898'',\n)', 3, 1474738345, '127.0.0.1'),
(19, 4, 3, 'sadsa', 'array (\n  ''weight'' =&gt; ''19.00'',\n  ''_weight'' =&gt; ''19.00'',\n  ''phone'' =&gt; ''18808800990'',\n  ''_phone'' =&gt; ''18808800990'',\n)', 7, 1474738573, '127.0.0.1'),
(20, 4, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1474738573, '127.0.0.1'),
(21, 3, 3, 'sadsadsa', 'array (\n  ''weight'' =&gt; ''20.00'',\n  ''_weight'' =&gt; ''20.00'',\n  ''phone'' =&gt; ''13856987898'',\n  ''_phone'' =&gt; ''13856987898'',\n)', 7, 1474738610, '127.0.0.1'),
(22, 3, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1474738610, '127.0.0.1'),
(23, 6, 6, 'wqrtretrtre', '', 3, 1474858403, '127.0.0.1'),
(24, 8, 1, 'asdsadsadsa', '', 3, 1474872230, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_investing_status`
--

CREATE TABLE `gd_project_investing_status` (
  `status_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `list_label` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_investing_status`
--

INSERT INTO `gd_project_investing_status` (`status_id`, `title`, `code`, `list_label`, `note`, `status`) VALUES
(1, '已登记', 'booked', NULL, '登记客户买金信息', 1),
(2, '已核实', 'checked', NULL, '上级主管核对客户信息、黄金买入信息', 1),
(3, '已确认', 'confirmed', NULL, '库管确认并标记', 1),
(4, '生金中', 'growing', NULL, '生金增值', 1),
(5, '已驳回', 'refused', NULL, '客户信息等问题造成', 1),
(6, '已终止', 'terminated', NULL, '提前终止项目', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_period`
--

CREATE TABLE `gd_project_period` (
  `period_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `month` tinyint(4) NOT NULL DEFAULT '1',
  `profit` decimal(5,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `default` tinyint(4) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_period`
--

INSERT INTO `gd_project_period` (`period_id`, `title`, `month`, `profit`, `status`, `default`, `note`) VALUES
(1, '3个月 年化6% 活动', 3, '6.00', 1, 0, '活动期间'),
(2, '6个月 年化7% 活动', 6, '7.00', 1, 0, '活动期间'),
(3, '1年 年化8% 活动', 12, '8.00', 1, 0, '活动期间'),
(4, '3个月 年化4%', 3, '4.00', 1, 0, ''),
(5, '6个月 年化5%', 6, '5.00', 1, 0, ''),
(6, '1年 年化6%', 12, '6.00', 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_recycling`
--

CREATE TABLE `gd_project_recycling` (
  `project_id` int(11) NOT NULL,
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `status_id` tinyint(4) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `referrer_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `origin_weight` decimal(9,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(9,2) NOT NULL DEFAULT '0.00',
  `number` tinyint(4) NOT NULL DEFAULT '0',
  `type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` tinyint(4) NOT NULL DEFAULT '1',
  `profit` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `payment` enum('cash','gold') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gold',
  `appraiser_id` int(11) NOT NULL DEFAULT '0',
  `loss` decimal(5,2) NOT NULL DEFAULT '0.00',
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `transferrer` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `locker_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_recycling`
--

INSERT INTO `gd_project_recycling` (`project_id`, `project_sn`, `status_id`, `customer_id`, `referrer_id`, `company_id`, `price`, `origin_weight`, `weight`, `number`, `type`, `month`, `profit`, `payment`, `appraiser_id`, `loss`, `start`, `end`, `note`, `is_del`, `worker_id`, `transferrer`, `addtime`, `lasttime`, `locker_id`) VALUES
(1, 'GR1609231601775551', 6, 11, 14, 1, '283.25', '10.00', '9.99', 1, 'ornament', 3, '0.0150', 'gold', 9, '0.10', '2016-09-23', '2016-12-22', 'sadsadsadd', 0, 3, '3', 1474624551, 1474739358, 0),
(2, 'GR1609235221840459', 4, 12, 0, 1, '283.25', '120.00', '119.00', 2, 'goldbar', 3, '0.0150', 'gold', 9, '0.83', '2016-09-25', '2016-12-24', '库存已确认标记，自动推进到正在增值', 0, 7, '3', 1474625099, 1474786966, 0),
(3, 'GR1609253370191206', 4, 2, 2, 1, '283.25', '50.00', '49.00', 1, 'goldcoin', 3, '0.0150', 'gold', 9, '2.00', '2016-09-25', '2016-12-24', '库存已确认标记，自动推进到正在增值', 0, 7, '3', 1474737126, 1474738833, 0),
(4, 'GR1609253360155336', 6, 9, 12, 1, '283.25', '200.00', '198.90', 10, 'goldcoin', 3, '0.0150', 'gold', 9, '0.55', '2016-09-25', '2016-12-24', 'sadsadasdsa', 0, 3, '3', 1474739616, 1474739711, 0),
(5, 'GR1609269901444317', 1, 13, 15, 1, '283.25', '20.00', '19.99', 1, 'goldbar', 3, '0.0150', 'gold', 9, '0.05', NULL, NULL, 'zcxzcxzcxzxcz', 0, 3, '3', 1474872197, 1474872197, 0);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_recycling_history`
--

CREATE TABLE `gd_project_recycling_history` (
  `history_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `request` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_recycling_history`
--

INSERT INTO `gd_project_recycling_history` (`history_id`, `project_id`, `status_id`, `note`, `request`, `worker_id`, `addtime`, `ip`) VALUES
(1, 1, 1, 'asdsadadsadsa', '', 3, 1474624551, '127.0.0.1'),
(2, 2, 1, 'asdsadsadsa', '', 3, 1474625099, '127.0.0.1'),
(3, 3, 1, 'sadsadsada', '', 3, 1474737126, '127.0.0.1'),
(5, 3, 2, 'dasdsa', 'array (\n  ''weight'' =&gt; ''49.00'',\n  ''_weight'' =&gt; ''49.00'',\n  ''phone'' =&gt; ''18850911766'',\n  ''_phone'' =&gt; ''18850911766'',\n)', 3, 1474738092, '127.0.0.1'),
(6, 2, 2, '', 'array (\n  ''weight'' =&gt; ''119.00'',\n  ''_weight'' =&gt; ''119.00'',\n  ''phone'' =&gt; ''15968980546'',\n  ''_phone'' =&gt; ''15968980546'',\n)', 3, 1474738257, '127.0.0.1'),
(7, 1, 2, 'sadsad', 'array (\n  ''weight'' =&gt; ''9.99'',\n  ''_weight'' =&gt; ''9.99'',\n  ''phone'' =&gt; ''13856987898'',\n  ''_phone'' =&gt; ''13856987898'',\n)', 3, 1474738454, '127.0.0.1'),
(8, 1, 3, 'sadsadas', 'array (\n  ''weight'' =&gt; ''9.99'',\n  ''_weight'' =&gt; ''9.99'',\n  ''phone'' =&gt; ''13856987898'',\n  ''_phone'' =&gt; ''13856987898'',\n)', 7, 1474738647, '127.0.0.1'),
(9, 1, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1474738647, '127.0.0.1'),
(10, 3, 3, 'asdsadsa', 'array (\n  ''weight'' =&gt; ''49.00'',\n  ''_weight'' =&gt; ''49.00'',\n  ''phone'' =&gt; ''18850911766'',\n  ''_phone'' =&gt; ''18850911766'',\n)', 7, 1474738833, '127.0.0.1'),
(11, 3, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1474738833, '127.0.0.1'),
(12, 1, 6, 'sadsadsadd', '', 3, 1474739358, '127.0.0.1'),
(13, 4, 1, 'sadsadsa', '', 3, 1474739616, '127.0.0.1'),
(14, 4, 2, 'asdsadsa', 'array (\n  ''weight'' =&gt; ''198.90'',\n  ''_weight'' =&gt; ''198.90'',\n  ''phone'' =&gt; ''13813800138'',\n  ''_phone'' =&gt; ''13813800138'',\n)', 3, 1474739650, '127.0.0.1'),
(15, 4, 3, 'sadsad', 'array (\n  ''weight'' =&gt; ''198.90'',\n  ''_weight'' =&gt; ''198.90'',\n  ''phone'' =&gt; ''13813800138'',\n  ''_phone'' =&gt; ''13813800138'',\n)', 7, 1474739687, '127.0.0.1'),
(16, 4, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1474739687, '127.0.0.1'),
(17, 4, 6, 'sadsadasdsa', '', 3, 1474739711, '127.0.0.1'),
(18, 2, 3, 'asssas', 'array (\n  ''weight'' =&gt; ''119.00'',\n  ''_weight'' =&gt; ''119.00'',\n  ''phone'' =&gt; ''15968980546'',\n  ''_phone'' =&gt; ''15968980546'',\n)', 7, 1474786966, '127.0.0.1'),
(19, 2, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1474786966, '127.0.0.1'),
(20, 5, 1, 'zcxzcxzcxzxcz', '', 3, 1474872197, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_recycling_status`
--

CREATE TABLE `gd_project_recycling_status` (
  `status_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `list_label` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `gd_project_stock` (
  `stock_id` int(11) NOT NULL,
  `project_sn` char(18) COLLATE utf8_unicode_ci DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `referrer_id` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('investing','recycling','stock') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'investing',
  `info` text COLLATE utf8_unicode_ci,
  `weight` decimal(13,2) NOT NULL DEFAULT '0.00',
  `profit` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `month` tinyint(4) NOT NULL DEFAULT '1',
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `last_profit` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `lasttime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_stock`
--

INSERT INTO `gd_project_stock` (`stock_id`, `project_sn`, `customer_id`, `referrer_id`, `company_id`, `title`, `mode`, `info`, `weight`, `profit`, `month`, `start`, `end`, `last_profit`, `note`, `status`, `worker_id`, `addtime`, `lasttime`) VALUES
(1, 'GM1609257100083858', 3, 2, 1, '项目GM1609257100083858存金11.00克', 'investing', 'a:10:{s:10:"project_id";s:1:"7";s:8:"realname";s:9:"刘京东";s:5:"phone";s:11:"18959506595";s:8:"idnumber";s:18:"321324199008080808";s:6:"wechat";s:0:"";s:5:"price";s:6:"286.25";s:6:"amount";s:7:"3148.75";s:6:"weight";s:5:"11.00";s:8:"referrer";s:9:"朱景修";s:7:"payment";s:4:"gold";}', '11.00', '0.0150', 3, '2016-09-25', '2016-12-24', NULL, 'sadsadasda', 1, 7, 1474737297, 1474737297),
(2, 'GM1609242512321047', 12, 130, 1, '项目GM1609242512321047存金30.00克', 'investing', 'a:10:{s:10:"project_id";s:1:"6";s:8:"realname";s:18:"我也是陌生人";s:5:"phone";s:11:"15968980546";s:8:"idnumber";s:18:"780159200001010458";s:6:"wechat";s:11:"strangertoo";s:5:"price";s:6:"283.25";s:6:"amount";s:7:"8497.50";s:6:"weight";s:5:"30.00";s:8:"referrer";s:9:"朱世宗";s:7:"payment";s:4:"gold";}', '30.00', '0.0150', 3, '2016-09-24', '2016-12-23', NULL, '', 0, 7, 1474737324, 1474737324),
(3, 'GM1609241512310037', 8, 12, 1, '项目GM1609241512310037存金19.00克', 'investing', 'a:10:{s:10:"project_id";s:1:"4";s:8:"realname";s:9:"乔苹果";s:5:"phone";s:11:"18808800990";s:8:"idnumber";s:18:"325225197008078888";s:6:"wechat";s:11:"qiaopingguo";s:5:"price";s:6:"283.25";s:6:"amount";s:7:"5381.75";s:6:"weight";s:5:"19.00";s:8:"referrer";s:9:"陈卫健";s:7:"payment";s:4:"gold";}', '19.00', '0.0200', 3, NULL, NULL, NULL, 'sadsa', 1, 7, 1474738573, 1474738573),
(4, 'GM1609245802235706', 11, 14, 1, '项目GM1609245802235706存金20.00克', 'investing', 'a:10:{s:10:"project_id";s:1:"3";s:8:"realname";s:9:"陌生人";s:5:"phone";s:11:"13856987898";s:8:"idnumber";s:18:"328526198707074598";s:6:"wechat";s:8:"stranger";s:5:"price";s:6:"283.25";s:6:"amount";s:7:"5665.00";s:6:"weight";s:5:"20.00";s:8:"referrer";s:6:"郑雯";s:7:"payment";s:4:"gold";}', '20.00', '0.0100', 3, '2016-09-24', '2016-12-23', NULL, 'sadsadsa', 1, 7, 1474738610, 1474738610),
(5, 'GR1609231601775551', 11, 14, 1, '项目GR1609231601775551存金9.99克', 'recycling', 'a:14:{s:10:"project_id";s:1:"1";s:8:"realname";s:9:"陌生人";s:5:"phone";s:11:"13856987898";s:8:"idnumber";s:18:"328526198707074598";s:6:"wechat";s:8:"stranger";s:5:"price";s:6:"283.25";s:4:"type";s:6:"金饰";s:6:"number";s:1:"1";s:13:"origin_weight";s:5:"10.00";s:6:"weight";s:4:"9.99";s:4:"loss";s:5:"0.10%";s:9:"appraiser";s:10:"鉴定人A";s:8:"referrer";s:6:"郑雯";s:7:"payment";s:4:"gold";}', '9.99', '0.0150', 3, '2016-09-23', '2016-12-22', NULL, 'sadsadas', 0, 7, 1474738647, 1474738647),
(6, 'GR1609253370191206', 2, 2, 1, '项目GR1609253370191206存金49.00克', 'recycling', 'a:14:{s:10:"project_id";s:1:"3";s:8:"realname";s:9:"李百度";s:5:"phone";s:11:"18850911766";s:8:"idnumber";s:18:"321245198905080904";s:6:"wechat";s:0:"";s:5:"price";s:6:"283.25";s:4:"type";s:6:"金币";s:6:"number";s:1:"1";s:13:"origin_weight";s:5:"50.00";s:6:"weight";s:5:"49.00";s:4:"loss";s:5:"2.00%";s:9:"appraiser";s:10:"鉴定人A";s:8:"referrer";s:9:"朱景修";s:7:"payment";s:4:"gold";}', '49.00', '0.0150', 3, '2016-09-25', '2016-12-24', NULL, 'asdsadsa', 1, 7, 1474738833, 1474738833),
(7, 'GR1609253360155336', 9, 12, 1, '项目GR1609253360155336存金198.90克', 'recycling', 'a:14:{s:10:"project_id";s:1:"4";s:8:"realname";s:9:"沈万三";s:5:"phone";s:11:"13813800138";s:8:"idnumber";s:18:"138139199810039997";s:6:"wechat";s:10:"shenwansan";s:5:"price";s:6:"283.25";s:4:"type";s:6:"金币";s:6:"number";s:2:"10";s:13:"origin_weight";s:6:"200.00";s:6:"weight";s:6:"198.90";s:4:"loss";s:5:"0.55%";s:9:"appraiser";s:10:"鉴定人A";s:8:"referrer";s:9:"陈卫健";s:7:"payment";s:4:"gold";}', '198.90', '0.0150', 3, '2016-09-25', '2016-12-24', NULL, 'sadsad', 0, 7, 1474739687, 1474739687),
(8, 'GR1609235221840459', 12, 0, 1, '项目GR1609235221840459存金119.00克', 'recycling', 'a:14:{s:10:"project_id";s:1:"2";s:8:"realname";s:18:"我也是陌生人";s:5:"phone";s:11:"15968980546";s:8:"idnumber";s:18:"780159200001010458";s:6:"wechat";s:11:"strangertoo";s:5:"price";s:6:"283.25";s:4:"type";s:6:"金条";s:6:"number";s:1:"2";s:13:"origin_weight";s:6:"120.00";s:6:"weight";s:6:"119.00";s:4:"loss";s:5:"0.83%";s:9:"appraiser";s:10:"鉴定人A";s:8:"referrer";s:13:"库管测试A";s:7:"payment";s:4:"gold";}', '119.00', '0.0150', 3, '2016-09-25', '2016-12-24', NULL, 'asssas', 1, 7, 1474786966, 1474786966);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_track`
--

CREATE TABLE `gd_project_track` (
  `track_id` int(11) NOT NULL,
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('investing','recycling') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'recycling',
  `content` text COLLATE utf8_unicode_ci,
  `file` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_trash`
--

CREATE TABLE `gd_project_trash` (
  `trash_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('investing','recycling') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'recycling',
  `customer` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gold` text COLLATE utf8_unicode_ci,
  `note` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
('d54f5afba0d7b15b470b662f38c805817883d706', '127.0.0.1', 1474872099, '__ci_last_regenerate|i:1474859858;captcha|s:4:"y9BT";identity|s:5:"C1000";username|s:5:"C1000";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1474795713";'),
('71111f813881f52b94bdcb21e4c0e1fa19e94506', '127.0.0.1', 1474870603, ''),
('ef82405ce9d3b9685e9e699323a97df8fce1e946', '127.0.0.1', 1474870603, ''),
('2c4332ff06beed06bde8d9be5d26556280f82887', '127.0.0.1', 1474871256, '__ci_last_regenerate|i:1474870611;captcha|s:4:"I6tg";'),
('7de3e5fb2cbdd5e5add8ff2096558d48d7b14044', '127.0.0.1', 1474870603, ''),
('e4dacd6758f1812d12bca45636f34a1f878a2d3b', '127.0.0.1', 1474872365, '__ci_last_regenerate|i:1474871492;captcha|s:4:"pUHN";'),
('3c4e528c0fda28e4a8f0a9c62393b0d6d5708e3a', '127.0.0.1', 1474878974, '__ci_last_regenerate|i:1474872099;captcha|s:4:"y9BT";identity|s:5:"C1000";username|s:5:"C1000";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1474795713";'),
('4c6e24766dce1c9d90395554cac1205fd6015ef4', '127.0.0.1', 1474873024, '__ci_last_regenerate|i:1474872367;captcha|s:4:"y7vg";'),
('ae3c7d72a14ee531b9581a2c275f856c0b272ce6', '127.0.0.1', 1474873978, '__ci_last_regenerate|i:1474873054;captcha|s:4:"jC68";'),
('ab1a42ae197549b06ce1e402abd867cb60ffc6d1', '127.0.0.1', 1474874401, '__ci_last_regenerate|i:1474874158;captcha|s:4:"SbAn";'),
('3fb76cfd3084e03f2c1084516d2b07358e1df752', '127.0.0.1', 1474876007, '__ci_last_regenerate|i:1474875060;captcha|s:4:"5FbP";'),
('90623319a073ea143583b9a32b4fb5383f354a81', '127.0.0.1', 1474876256, '__ci_last_regenerate|i:1474876012;captcha|s:4:"pJIy";'),
('c7533cb2ee60c01bbbad4317f8cbefcac1a22539', '127.0.0.1', 1474877716, '__ci_last_regenerate|i:1474876428;captcha|s:4:"7gKc";'),
('48db7d0afd096158e1025034ccd66630294decc5', '127.0.0.1', 1474877767, '__ci_last_regenerate|i:1474877724;captcha|s:4:"vgBx";'),
('8b0c3da190b35ddb2dad1ecb8679d350d17baf6a', '127.0.0.1', 1474878633, '__ci_last_regenerate|i:1474878311;captcha|s:4:"MOg5";identity|s:5:"C1000";username|s:5:"C1000";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1474857474";'),
('b2e35697db3f60f25ee21ccb2dbda1e25c9144b5', '127.0.0.1', 1474879000, '__ci_last_regenerate|i:1474878633;captcha|s:4:"MOg5";identity|s:5:"C1000";username|s:5:"C1000";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1474857474";');

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
  `initial` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(13, 'warning_end', '7', 0, 'project', 1),
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
(38, 'site_title', '黄金码头 黄金线下交易平台', 0, 'site', 1),
(39, 'cron_interval', '3600', 0, 'site', 1),
(40, 'cron_encrypt', 'xy-zhujingxiu-4610', 0, 'site', 1),
(41, 'default_avatar', 'public/images/avatar/avatar.png', 0, 'site', 1),
(42, 'hexun_url', 'http://data.gold.hexun.com/outData/AuSH.ashx', 0, 'api', 1),
(43, 'hexun_intval', '180', 0, 'api', 1),
(44, 'recycling_renew', '2', 0, 'project', 1),
(45, 'min_weight', '10', 0, 'project', 1),
(46, 'apply_renew', '1', 0, 'project', 1),
(47, 'apply_order', '1', 0, 'project', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker`
--

CREATE TABLE `gd_worker` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `code` char(6) DEFAULT NULL,
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
  `company_id` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gd_worker`
--

INSERT INTO `gd_worker` (`id`, `username`, `code`, `realname`, `avatar`, `password`, `salt`, `email`, `remember_code`, `addtime`, `last_login`, `last_ip`, `status`, `phone`, `wechat`, `qq`, `company_id`) VALUES
(1, 'admin-root', NULL, '管理员', 'public/images/avatar/121034209220f1.jpg', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', NULL, 1469999823, 1474741020, '127.0.0.1', 1, '', NULL, NULL, 1),
(2, 'C0000', NULL, '朱景修', NULL, '$2y$08$QQOBCnHUhFTH/CjeWztJGOOfAz2xuqSki7P2qn5/WojZQvXc10NAK', NULL, 'zhujingxiu@hotmail.com', NULL, 1470736567, 1470736771, '127.0.0.1', 1, '18850911766', NULL, NULL, 1),
(3, 'C1000', NULL, '经理测试', 'public/images/avatar/avatar2.png', '$2y$08$iBQ3xwkr5PWd/apGKaePh.S3GYcgo5.3HLTh48mc1OyIRUansdkUS', NULL, 'a@a.c', NULL, 1471598448, 1474878633, '127.0.0.1', 1, '13913901390', 'qweweqweq', '', 1),
(4, 'C2000', NULL, '经理测试B', 'public/images/avatar/user1-128x128.jpg', '$2y$08$1gGt5kfd2/S0WGDZNt6PMu8bj1WBhiww4AgNx4TJSRrJaiQ7jV4gu', NULL, 'a@a.cc', NULL, 1471598720, 1473435360, '127.0.0.1', 1, '', NULL, NULL, 1),
(5, 'C3000', NULL, '登记测试A', 'public/images/avatar/avatar1.png', '$2y$08$YHzCZKpn3DYoZWYfE4UD4.7KSke2QaVc5Ou04ljhRNZn5sDqc7QF2', NULL, 'b@a.cc', NULL, 1471598889, 1473738292, '127.0.0.1', 1, '', NULL, NULL, 1),
(6, 'C4000', NULL, '录单测试B', 'public/images/avatar/user3-128x128.jpg', '$2y$08$7JByOlb/P/L.c8P.mqeMX.N7qSiLGBWyx3YWA44wUDkAMY0rGKtQS', NULL, 'ludan@b.cc', NULL, 1471598958, 1473299074, '127.0.0.1', 1, '', NULL, NULL, 1),
(7, 'C5000', NULL, '库管测试A', 'public/images/avatar/user4-128x128.jpg', '$2y$08$SuuFWJ0sZL2z.SZDLaTX3Od/bkVZ04Ax1fc1SmDtoVf8X0XjuRuJO', NULL, 'kuguan@bb.c', NULL, 1471599005, 1474854407, '127.0.0.1', 1, '', NULL, NULL, 1),
(8, 'C6000', NULL, '库管测试B', 'public/images/avatar/user5-128x128.jpg', '$2y$08$18MwNqHD5QKE/M2xcF4NXuLScN67KrGQfBCfXPEEEM/W5PNC/5/5G', NULL, 'kuguan@a.cc', NULL, 1471599054, 1473152537, '127.0.0.1', 1, '', NULL, NULL, 1),
(9, 'C7000', NULL, '鉴定人A', 'public/images/avatar/user8-128x128.jpg', '$2y$08$GqumJcWGIEa25v1OB3i5M.k8Vgxg99kuKXpGsUs5ZzQiUIp.Qer5G', NULL, 'jianding@g.cc', NULL, 1471599152, 0, '127.0.0.1', 1, '', NULL, NULL, 1),
(10, 'S0896', 'S0896', '方雪静', NULL, '$2y$08$iBQ3xwkr5PWd/apGKaePh.S3GYcgo5.3HLTh48mc1OyIRUansdkUS', NULL, '', NULL, 1474442551, 1474451250, '127.0.0.1', 1, '13305946318', NULL, NULL, 1),
(11, 'C0892', 'C0892', '蔡凤辉', NULL, '$2y$08$aiuvf3uvmkynVczv.92QVOdSWDgsEqFpN/pt5sxwISowfqtlV3Fg2', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305941363', NULL, NULL, 1),
(12, 'C0898', 'C0898', '陈卫健', NULL, '$2y$08$9lkra/ZvslU0Gjw0nK9gA.3H21PmWkWz52Z6wgXJqZbub3tCNekVa', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '15080457686', NULL, NULL, 1),
(13, 'C0888', 'C0888', '林志龙', NULL, '$2y$08$yXs73HxICO7Y.Hs4DFPSzeqZYw1r.75VvHfz.xkKJJ06AVQKZ.3Ju', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305942502', NULL, NULL, 1),
(14, 'C0891', 'C0891', '郑雯', NULL, '$2y$08$ZwgAzHOYOzTxRGScxWvtjOxdQsZ8hsOehZqB/sgkmrNW5fzrD6ptO', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305946108', NULL, NULL, 1),
(15, 'C0880', 'C0880', '吴健飞', NULL, '$2y$08$s5dLtqy8ZikflPoCc0x4NeGmbHEk0lnDhDKSq8o6APckkAoxW.JKi', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305942150', NULL, NULL, 1),
(16, 'C0886', 'C0886', '张琳', NULL, '$2y$08$SbK4FJvRcZpCoGasEvg2POEWphWJxWvabHSAvqgqkVXUgaDd6IqSK', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305945811', NULL, NULL, 1),
(17, 'S0895', 'S0895', '许俊贤', NULL, '$2y$08$jYCH8TkBqQEX8D0FO7droefQUBvOghj0y8qXXEGhAW5MRbIGqMHAW', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305940231', NULL, NULL, 1),
(18, 'C0889', 'C0889', '邱辉辉', NULL, '$2y$08$V2ZW7rhyUkefHRzClZ2Vyu/2NgxUrdwJ0dN3U5p4G0URqU0B7IaQe', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305941913', NULL, NULL, 1),
(19, 'S0888', 'S0888', '陈慕玲', NULL, '$2y$08$TOANg5Fmok8byPc8sNlbvud5S8af2xE1Irm0ezWqk.dByO7rkIc0K', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305945775', NULL, NULL, 1),
(20, 'C0881', 'C0881', '陈国仁', NULL, '$2y$08$zsUhiNxYgX8T9T7EKFPZoeaUBgrAd9RC65OVe5ENuXotu5VL2IkZC', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305942095', NULL, NULL, 1),
(21, 'C0885', 'C0885', '陈国仙', NULL, '$2y$08$/mAyKjeQ5dESB4p1zpGkauRiVTHKKJ07KPBgD0j3.FwL1AksSCc5e', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305942113', NULL, NULL, 1),
(22, 'C0890', 'C0890', '严芳', NULL, '$2y$08$nYZNWqTf8I9fD8O4f8QIt.42NgsZsuTA8vPJSOJ/sZGQC3gmCCWpe', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '18905941255', NULL, NULL, 1),
(23, 'C0893', 'C0893', '黄建杰', NULL, '$2y$08$D/iYQVmmuAQ0671Jo9CzueL4dXzWiTKN2DPgln4WolKoLcw3QJ61W', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305943039', NULL, NULL, 1),
(24, 'S0899', 'S0899', '于欣', NULL, '$2y$08$ThrTC5wRIoZMUQYgk0MOTOSGe0q1jwAd/y2eSSczEMMIXBVncDPnG', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305942013', NULL, NULL, 1),
(25, 'S0890', 'S0890', '林伟', NULL, '$2y$08$1jhn2M41d15Nt7v8HZr7OO4ap7Jlo93CAQq4pSFq7LmOwWsF.IvZ2', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305940132', NULL, NULL, 1),
(26, 'S0889', 'S0889', '林志忠', NULL, '$2y$08$slVyJY2Omz9yhfdxZ8ArC.0rFbihUTlDGvy4XdvU9/YZvlTE78Y.W', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305940256', NULL, NULL, 1),
(27, 'S0880', 'S0880', '林淑珍', NULL, '$2y$08$tLIsL1oJPvtz2jv/K1iXjuhqN0h.hLpeT2mpjVjyGRu3jfanJ0QVu', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305948093', NULL, NULL, 1),
(28, 'S0883', 'S0883', '蒋建山', NULL, '$2y$08$6Ic7/jPnoZ2NOwSWnDJf5e7jNDYjdThUn3lJTxekAhdczWQe4Q8ne', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '18756799811', NULL, NULL, 1),
(29, 'S0885', 'S0885', '苏晓燕', NULL, '$2y$08$qZinRjABWGE7MegvAqsZGegitZzCpY7R20rqZzSdAspEKrVUOJV1W', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305948352', NULL, NULL, 1),
(30, 'S0882', 'S0882', '吴秀芳', NULL, '$2y$08$zw2kR1KpZN2J.dyagdRoEuY2oD83mkw3SIGNQyqnKD.h2WgUmk5q2', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305946167', NULL, NULL, 1),
(31, 'S0887', 'S0887', '陈秀贞', NULL, '$2y$08$Tiw9AfIiTQJBqSsVX2cvSO3bqYqXdEJUiDFcbjaEZsw63Op/Nk9.i', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305948130', NULL, NULL, 1),
(32, 'C0808', 'C0808', '林国春', NULL, '$2y$08$ZttV5Rd5i5dDcqa8H9ueuu0x98HWEF58wHrWENpUn9D9m1wlsROae', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13515646484', NULL, NULL, 1),
(33, 'C0866', 'C0866', '黄美宇', NULL, '$2y$08$lS58nOZHfgAAFoPYUU594u8jMVY./PxT44Y3neZg5ApKJtfYEUuh.', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '15654646486', NULL, NULL, 1),
(34, 'S0875', 'S0875', '郑赛萍', NULL, '$2y$08$w6boZN6oLb78Rc0IfAvXIeS8da4t3cFfhBEw8PP1jP2kulEuqOPPy', NULL, '', NULL, 1474442551, 0, '127.0.0.1', 1, '13305943583', NULL, NULL, 1),
(35, 'S0876', 'S0876', '方玉腾', NULL, '$2y$08$MZy54dC4W5L44X.D.QoQaeQ5rd/h1DV6e/CdbTo1qDTfcl6io.TuO', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15659398909', NULL, NULL, 1),
(36, 'S0873', 'S0873', '陈素辉', NULL, '$2y$08$ruqHKRD2W1GUe/gMZNtlx.4mlcIVV.WY0oAXKtUVCYHUqA.kY1I7y', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '17759820207', NULL, NULL, 1),
(37, 'S0872', 'S0872', '龚钰英', NULL, '$2y$08$7aJeUf2NGUfBHSkZ3naMJ.mLccpGT.fkaIbs9uscsGyBeT6m0TOmG', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13305948010', NULL, NULL, 1),
(38, 'S0892', 'S0892', '何明枝', NULL, '$2y$08$NBBUrspn9AUeEWiPbReYh.0RWmRUPT2h.WoNigDIRMLzR3YrUfXei', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13959508689', NULL, NULL, 1),
(39, 'S1269', 'S1269', '黄仁富', NULL, '$2y$08$S1LVmU.hjY1Q1RTL2FS0M.63BofVBdgRJUXeu7SNAspYcpfGq.FIG', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13305941600', NULL, NULL, 1),
(40, 'S1226', 'S1226', '李雪', NULL, '$2y$08$qmboJFve2pXKtZb5S639HuKiNmx084ydV2JctQMk.ltubR/rAr3Wm', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13850282988', NULL, NULL, 1),
(41, 'S1111', 'S1111', '推广', NULL, '$2y$08$qhS2nmlXdq/gknc6zeYMQOtvMEcfMZxcXTFKPCpsnuwYqgv.IjecC', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13611111111', NULL, NULL, 1),
(42, 'C1111', 'C1111', '推广1', NULL, '$2y$08$N4qygr9hBCGIJSH5c1hPE.JvDVcNM3YGgYZPpX1qlwbuIYgOloZuG', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13658685858', NULL, NULL, 1),
(43, 'S0860', 'S0860', '李静', NULL, '$2y$08$JndQob3Rf4phNqE6IHSyuOW9Z9P4di4uy7SL16a2GlU10f/bXQiLe', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13305948135', NULL, NULL, 1),
(44, 'S0865', 'S0865', '邹丽榜', NULL, '$2y$08$IeXkI0o0EA4MWdWppB5Zpe8opqaMmeHT8bTdi/m06T03iTiXzutQK', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13305943283', NULL, NULL, 1),
(45, 'S0870', 'S0870', '林丽钦', NULL, '$2y$08$ny8TacNFHr2PWIhCLhFKMeKvue7Dz3FCor2rik/zUJLOd8NUsKsJm', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13305940213', NULL, NULL, 1),
(46, 'S0869', 'S0869', '黄俊涵', NULL, '$2y$08$VImfbHuA7zh7XEV0Bsl0mOYkIYE.5xEY0MNlFcAvKsSy4rzvXTYiG', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13110555385', NULL, NULL, 1),
(47, 'C0895', 'C0895', '环球专用', NULL, '$2y$08$wusHXZYVrnKs3PQYYMmhnuUcxh8UKlzqrmhvoq4celgzKtnYgmQvi', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13325465656', NULL, NULL, 1),
(48, 'S0855', 'S0855', '杨建花', NULL, '$2y$08$V21Gp1IwaiW9Aq3yUUNHfO2qxZ8IzRYneUMktheaFloX1gY2JGthO', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13607501383', NULL, NULL, 1),
(49, 'S0858', 'S0858', '陆碧婷', NULL, '$2y$08$qRlEzsIyvEOauTsMXJxnIe2BrhmRZ5WP2YokzEInfsRIbA1bH3bvq', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13850204249', NULL, NULL, 1),
(50, 'S0859', 'S0859', '李腾达', NULL, '$2y$08$.Ws9EI2/GjEMYhjdLI7eDeTJaUk/6STMiAe49wALIaFfd3IHlVE9m', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13860901122', NULL, NULL, 1),
(51, 'S0861', 'S0861', '杨世美', NULL, '$2y$08$uCprag5wgyzJSK51Ru2k7Oy6UJOC4sepAheuAIGUcEje/8BplMa2.', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13313805758', NULL, NULL, 1),
(52, 'S0863', 'S0863', '赵忆涵', NULL, '$2y$08$/7ZzdozaBM5xNqGImP/iV.n5yusRybwm.CMh4VZF4PraIvvMCULMK', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13850264966', NULL, NULL, 1),
(53, 'S1200', 'S1200', '刘洋', NULL, '$2y$08$C5PTHI.5JmJRiVhW4xuBDOCA5Vupz4kf2Twum2abUgpw96GVpao3W', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13204745298', NULL, NULL, 1),
(54, 'S1201', 'S1201', '李源', NULL, '$2y$08$c/UJOqUVX43kVWzZxTjF7u8DAvVQApzORIpe5Oqi02ILGcaNjjjG6', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15847457606', NULL, NULL, 1),
(55, 'S1202', 'S1202', '李玲', NULL, '$2y$08$ixdPvYCaZJ4bRr/WjX7k5e28bfTcl1CI.atML2Dvl9wUmiRUaww1G', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15598164333', NULL, NULL, 1),
(56, 'S1203', 'S1203', '郭佳丽', NULL, '$2y$08$e34sdsiC21jGF5Ikdk7DNuJLeJiw0w4SlZ5OpVHKlD5bEFc7.5EaC', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '18247404272', NULL, NULL, 1),
(57, 'S1205', 'S1205', '刘晓燕', NULL, '$2y$08$GV3JdTBK4Pa9K6NFxmyvWOqrdIbNr0RgGW7lxDl.jWus6rwWKlId6', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13234726381', NULL, NULL, 1),
(58, 'S1206', 'S1206', '赵素芳', NULL, '$2y$08$sYmLdJneQdzt53VzG8Gp9.RT5IvOWHqA.xWvAdHW42w/3q7EllIJi', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13947440499', NULL, NULL, 1),
(59, 'S1207', 'S1207', '张俊芳', NULL, '$2y$08$hH3Wq34UmgeukwU0pg3AquHa4KwbI620TKsqrmd7YSog.e6dGCwMS', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13614842996', NULL, NULL, 1),
(60, 'S1208', 'S1208', '李利霞', NULL, '$2y$08$tnU9hp3mRtOUXvznXQtIruJ3LHF4O/jYd0Q7hKf0huCjaC3q5sOcK', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15764892288', NULL, NULL, 1),
(61, 'S1209', 'S1209', '郇瑛', NULL, '$2y$08$ZbiZQOHla8Pw/V5f3KfbzuLVYvryg8ZxUnZHrECZNtE45we2yykDq', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13847464619', NULL, NULL, 1),
(62, 'S1210', 'S1210', '崔晓娟', NULL, '$2y$08$9mk7rgMS.pZWX4afISeKrut5ZKNElca0e/kjSxqnq3rvmnjwIhlVm', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15384745523', NULL, NULL, 1),
(63, 'S1211', 'S1211', '郭沙沙', NULL, '$2y$08$/aWA1fQbNg0L/HqLEWU.3ebvKjWmH6mGMtDbirSm07c/wbTpxjDua', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '18748401116', NULL, NULL, 1),
(64, 'S1212', 'S1212', '卢林芳', NULL, '$2y$08$gvD6wwzUbSYbCYNzWK4Kl.PObGY4TDZ4Kg2DTOnfhMBAxjB5a0xye', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15904849094', NULL, NULL, 1),
(65, 'S1213', 'S1213', '赵利强', NULL, '$2y$08$CkwW7clrVgKp/diAfVrUk.ywL/2/EmMuRtY04rveEO6I5LmnXER1O', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13847418030', NULL, NULL, 1),
(66, 'S1215', 'S1215', '李静', NULL, '$2y$08$.qJgE2AW6r4qvecLm/ackOOxNnAXRnTvVCGJrjy5yKOgTONAD906y', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '18947410660', NULL, NULL, 1),
(67, 'S1216', 'S1216', '王彦君', NULL, '$2y$08$36ddsjnJbuO8J1kou.MLN..4zLyulL4d5uCLU9dyUAM3FWPAgG.jq', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '18647471512', NULL, NULL, 1),
(68, 'S1217', 'S1217', '贾晓晴', NULL, '$2y$08$sXLQpSMhokMiHjiaKioUD.Qw2mJwZC05EGyMXG1PgX486GXlN8RQO', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13150821742', NULL, NULL, 1),
(69, 'S1218', 'S1218', '冀连青', NULL, '$2y$08$hfN.0OblbiLKjvv0fAcRgulQ2SqbSMePRVUTpaU9cIBGyu4tWmOFK', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15247484422', NULL, NULL, 1),
(70, 'S1219', 'S1219', '孙瑞敏', NULL, '$2y$08$3y3/lgugUBR0GYiKdc904.NREZ2G1356zADjgSVcmXadot6/UjQCq', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15849404018', NULL, NULL, 1),
(71, 'S1220', 'S1220', '田雨', NULL, '$2y$08$NqhELIr0Fmfi5UDQ.fjCuOWTzlHlvBOS2UoZORD.piD9x2fuFSthW', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '18947411271', NULL, NULL, 1),
(72, 'S1221', 'S1221', '李林', NULL, '$2y$08$6wEZayQb9HldQbaK7W2YR.Sgb.wYojgm6Tim1swA8r2jQb.5gP936', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13500644095', NULL, NULL, 1),
(73, 'S1222', 'S1222', '常振华', NULL, '$2y$08$iVcxrjr2ddfPyGd5Ceo79uCOIR8EvacinhQ.YlmrgIIYunVXHAMqC', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13337146990', NULL, NULL, 1),
(74, 'S1223', 'S1223', '刘婷', NULL, '$2y$08$U1Eba.Qedfm7swWa7aY9he2PbCuEjzR66LEFPeLtFkffQZL6KyV.a', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15124761160', NULL, NULL, 1),
(75, 'S1225', 'S1225', '张晔', NULL, '$2y$08$sbTThqAJLpgGZfIe7GeynOoF7FNjtMigdMhgOhjuhn0yYJih3MLKu', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15114749519', NULL, NULL, 1),
(76, 'S1227', 'S1227', '赵敏', NULL, '$2y$08$PIoRKfMrQ32ibpFgBJsZuee6GI.ocQ3x8pPfrbm4OhULFdjgcU.By', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '13789643488', NULL, NULL, 1),
(77, 'S1230', 'S1230', '郝俊莲', NULL, '$2y$08$7zU21rUQWVLRcbpta/g1AOTbED3BFue.TPJrFDB3taPvLQQ5EYEl2', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15647480030', NULL, NULL, 1),
(78, 'S1100', 'S1100', '李琛', NULL, '$2y$08$3SpSljw591Zsb5ogp6.V3ebkfQQhc1V4IMa5a7bsiw4KA0sGCxEz2', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15384745565', NULL, NULL, 1),
(79, 'S1101', 'S1101', '郝斌', NULL, '$2y$08$2sQrVVdeyKE4GsmTGY3axOli4Zdv0ut9Pl.guLDsJP0oBgNlv67fu', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15704716060', NULL, NULL, 1),
(80, 'S1102', 'S1102', '杨林', NULL, '$2y$08$q0S8WaJ1qhJdjUNJmQdahOYRcgZ4Wg0bP1cTwoIgzYbcEWsRJUosS', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '18548126416', NULL, NULL, 1),
(81, 'S1103', 'S1103', '陈震', NULL, '$2y$08$98joiDJ60oJ3E5cHceVXz.vhRLdSOafSIV4N4Qn0/oRuG0mM0HXA.', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15947703046', NULL, NULL, 1),
(82, 'S1105', 'S1105', '苏锦华', NULL, '$2y$08$9WMNOjyuaxlgNXhWDDh2Muv1NiqfV5tLlbUH3ZxN90Ps7Ds3C2zye', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15847784537', NULL, NULL, 1),
(83, 'S1106', 'S1106', '曹建武', NULL, '$2y$08$IrRovwi4ZprKPSjLZgHvAuau3pxnRtf1316HnQrMkSJp9SEHaDH82', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '15848488813', NULL, NULL, 1),
(84, 'S1107', 'S1107', '郭振兴', NULL, '$2y$08$w5oivl9.iLDotnxGdJ3QWeEfsveyuxioNzomIZagHqLwQpTu7gx9u', NULL, '', NULL, 1474442552, 0, '127.0.0.1', 1, '18698404550', NULL, NULL, 1),
(85, 'S1108', 'S1108', '张易', NULL, '$2y$08$9kG7VJMZYS04nyehm9R3Q.TaCfFh3uZjtlO0Hxyp3TnW.MndOPN0e', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18504842014', NULL, NULL, 1),
(86, 'S1109', 'S1109', '白玉瑛', NULL, '$2y$08$QYc3ctB6Yfa/7wQUtlHbEO.NHvoslxb7Y8EOXprVT9SOTEGAVOvnq', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13150834827', NULL, NULL, 1),
(87, 'S1110', 'S1110', '杨丽娜', NULL, '$2y$08$k/HbhGt29nRbU2DhP7a/d.Wwc6NnqqCceK33aSED27PWAhBzpukCu', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18548181124', NULL, NULL, 1),
(88, 'S1112', 'S1112', '赵艳霞', NULL, '$2y$08$soDbkyBlQT3v1yjuqrKwauNnqKkaL.xgOwd5FxzI8D7evWKtB9f0G', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15848460836', NULL, NULL, 1),
(89, 'S1113', 'S1113', '张红霞', NULL, '$2y$08$6VsHUFAJZym96aqfQPukyuD4iZUlUaMiu8YV0GTLWgXnD.W1EIVli', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18647405605', NULL, NULL, 1),
(90, 'S1115', 'S1115', '朱莎', NULL, '$2y$08$//Qr2NEYXHxvYEnrvZWwAuk6Bvlw61b3jVPZ7asY8YPuyb5mWnqgW', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '14747461917', NULL, NULL, 1),
(91, 'S1116', 'S1116', '张荣', NULL, '$2y$08$F3ZsJ4FDOmOl5vwGegjnRelJVG0mcUUzWNF4hCFoZQkNNrwNiSiuu', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15754852687', NULL, NULL, 1),
(92, 'S1118', 'S1118', '康宁', NULL, '$2y$08$1ksMPEh2hFA9DBOup7YHO.6W8aiidLzHQeYSCBcJiZnATJyI.h3qW', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18647482288', NULL, NULL, 1),
(93, 'S1117', 'S1117', '付卫敏', NULL, '$2y$08$iykQZuS47KMiixxlXi0w8uAHiKn.ePbvHxBbsAOcKGXOopzYTBSxm', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18847417866', NULL, NULL, 1),
(94, 'S1119', 'S1119', '刘成刚', NULL, '$2y$08$GaRBuow7PP9Fdv5GG0APXu4xQk6VmAwFfnZwUmvFHpxC8Io91FlJu', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18748111754', NULL, NULL, 1),
(95, 'S1120', 'S1120', '韩新宇', NULL, '$2y$08$koSC2QZjz28jFdXHPFBAH.MYcQPzA3JZMZRnQI93RkjZefsj6AxMe', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '14784740401', NULL, NULL, 1),
(96, 'S1121', 'S1121', '王艳清', NULL, '$2y$08$MPphaoYwFO3eAnIbCORDjuAoYKjGbfqSgDQvTpbS3qc8gEepiAOZO', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18748414581', NULL, NULL, 1),
(97, 'S1122', 'S1122', '刘璐', NULL, '$2y$08$/45erPrqKy5W4eYWwxELPOHFCN3ZAFCYthOe5fs5WGAwwmsTvjZB2', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15384745561', NULL, NULL, 1),
(98, 'S1123', 'S1123', '刘甲军', NULL, '$2y$08$wChg97NbPBswjwwQMcvx4eCrY6jj6kCc6nBq3AxTtwrjXwgU54MjS', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15148085324', NULL, NULL, 1),
(99, 'S1125', 'S1125', '杨文英', NULL, '$2y$08$XWRtcg/PEc..pdtDL0ufreIlxQqwEpdNi/4/D2EPCmIVVSFE5s4ve', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18647420424', NULL, NULL, 1),
(100, 'S1126', 'S1126', '崔乐英', NULL, '$2y$08$.1Njqm/UYX78dqIKRLPohubNQHsI2kOVUxpcpz2Qi.E0JhSlcV6NK', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15164798997', NULL, NULL, 1),
(101, 'S1127', 'S1127', '褚文静', NULL, '$2y$08$1jsBh3SSidjglP40rbChQOfixgqdToD56u/QLfnHUTieJUovzm5FC', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15947685830', NULL, NULL, 1),
(102, 'S1128', 'S1128', '张敏', NULL, '$2y$08$9FDY.m/icfibp9WsKLI..egSX7th8lIogVe6VbzU7wh.adzPlYeK2', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13704746941', NULL, NULL, 1),
(103, 'S1129', 'S1129', '郭文忠', NULL, '$2y$08$alWr5kxTxcWL8XLKNoIfruUkmbzf2qED9LYMe2Iv4n9WFQ6YF.gAy', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13084747683', NULL, NULL, 1),
(104, 'S1130', 'S1130', '张晓宇', NULL, '$2y$08$rMpZR.5vT2rWWdx2I9mJSu5e6FHajwpCxR6hk.3gLOqnLcNGQvhtW', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13500645678', NULL, NULL, 1),
(105, 'S1131', 'S1131', '李佳和', NULL, '$2y$08$5FYkk3KcikgXH8BGiTIcj.RD2pyA5Ftyem9JXobmXGqV6tuE01ooq', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15384745533', NULL, NULL, 1),
(106, 'S1132', 'S1132', '王晶晶', NULL, '$2y$08$l2BonoR/bd2HOZGX/KFDJug3giaoCW7fpfLZnNjra3VFW9e92rSa.', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15014743936', NULL, NULL, 1),
(107, 'S1133', 'S1133', '马泽宇', NULL, '$2y$08$aqVJL50lhQ1lvYlnbQjuHucsD1bflKdF46wT2vlhK5BxIWS8TTUGu', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18547105066', NULL, NULL, 1),
(108, 'S1135', 'S1135', '郭荣荣', NULL, '$2y$08$6f6jA7T.VLVuSwJhgRgNNeGiTkdc4G/JC41TtsScEAUdGAqvNqIiq', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15849416766', NULL, NULL, 1),
(109, 'S1136', 'S1136', '张丽丝', NULL, '$2y$08$jJAhK5agxWomDdqMGSC58.LZNhBrT50bB/A8Wtj3W5CBhnaO.aGYe', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15847418393', NULL, NULL, 1),
(110, 'S1137', 'S1137', '郎艳', NULL, '$2y$08$Wy1ow2jHCJpavJzLUWOCju8dbSamwS9axxTDcuRkgggLSJytp06Ce', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18504741106', NULL, NULL, 1),
(111, 'S1138', 'S1138', '张晓龙', NULL, '$2y$08$brmaVUBYyHAcf/VsQts3ae3TRqOzFZ9xzqxB4KnSayWxDagYh9P9.', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13948593907', NULL, NULL, 1),
(112, 'S1139', 'S1139', '黄东升', NULL, '$2y$08$MFE678h4np5sHF2tmQdNy.8pQWkbzDWv2RjSrJBpVuG3OG6wqUH76', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15354838618', NULL, NULL, 1),
(113, 'S1140', 'S1140', '曹志慧', NULL, '$2y$08$4cKuS2ehWDNULnhic/bYmu1vXaOTDomhUQ5LATpEsZWVClOn4fGEK', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15124733417', NULL, NULL, 1),
(114, 'S1141', 'S1141', '张鑫', NULL, '$2y$08$Y45d7R0AUNuxrtcVHt1tzeLMXVOlUkACXyHQgR70jlj18bVlniWFm', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18047428520', NULL, NULL, 1),
(115, 'S1142', 'S1142', '杨俊华', NULL, '$2y$08$fb6wwx5KOalXpevWdlUNsudMPqdq64oB9LeR4.Su8JEbVxK5zATcG', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15555523592', NULL, NULL, 1),
(116, 'S1143', 'S1143', '雷乐元', NULL, '$2y$08$qDXLPh6CPStYvQc9gxGLWu9tBe/VOBsgdwXY2M.Wy6SXuWampIEfO', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13214748420', NULL, NULL, 1),
(117, 'S1145', 'S1145', '胥兰强', NULL, '$2y$08$g9tyGhrBb0dprQMgZTd71eUMk13bRCJ1nnTUuvI8r58Ry93Kb.wba', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15849417619', NULL, NULL, 1),
(118, 'S1146', 'S1146', '池翠云', NULL, '$2y$08$1SUEkc5sPAXw79oxFZ7Ygeb27HikLT62ZiIteMqviaCml0iPUGT0S', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15847443854', NULL, NULL, 1),
(119, 'S1148', 'S1148', '薛强', NULL, '$2y$08$euc/7OLeRRWwsnVOj4j7s..mcK9Bpd8533BndU307D/SlPHn0U4jy', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18604742452', NULL, NULL, 1),
(120, 'S0812', 'S0812', '方芹霞', NULL, '$2y$08$zKo.azvy/Mzh9t/aexdI4O6zuEDZ5LvmT7gq9JLfbtwxeSSzcR/rC', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13799640511', NULL, NULL, 1),
(121, 'S0871', 'S0871', '林凌', NULL, '$2y$08$oFdUBzv7Ptvz7VYRGN9uau6VYhPKRnKS9egN0GKlvk/QFkdW20EAy', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15928758720', NULL, NULL, 1),
(122, 'S1229', 'S1229', '高蕾', NULL, '$2y$08$j2d1aV76rFm0wTiw89tiQeQTJ3GZaW0DPxtqZdXJSQu3sE5CT8p2G', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18647471334', NULL, NULL, 1),
(123, 'S1231', 'S1231', '徐美凤', NULL, '$2y$08$O7MkhwI8C9sEThgpyfihIO4OJDch5dxXUR.LPBQW1mEoz8ZS71i0e', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15904889053', NULL, NULL, 1),
(124, 'S1232', 'S1232', '武英英', NULL, '$2y$08$SASmtxvWpJK4ztOoKWKBS.jmNMVgs/1gwg5.r88u7E.tfChnvdwqe', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13171300725', NULL, NULL, 1),
(125, 'S1233', 'S1233', '王宇', NULL, '$2y$08$zyJZX0lfygXdVR/FJJuHlu0lLpxdOkjqyuTgIAiAq3q9wo9cK38C.', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18647479992', NULL, NULL, 1),
(126, 'S1235', 'S1235', '何龙', NULL, '$2y$08$QNDgW1QrLrEvrw5URQQUGeNxQf17G5Uork4pn0yJOQhzZIJ9siSRe', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13488515043', NULL, NULL, 1),
(127, 'S1236', 'S1236', '张晓霞', NULL, '$2y$08$6sub2j12YUv9GGoUn0FnheKt5TPtXKNi.oRN9O.DNwIlSeuUTAR2u', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15384745518', NULL, NULL, 1),
(128, 'S1237', 'S1237', '崔雪英', NULL, '$2y$08$4vKdvTFTRROCC.OT18UNBuDMTl/R5st41c8I/V/vzl5c9gbfEyKK6', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15004743559', NULL, NULL, 1),
(129, 'S1240', 'S1240', '郭树清', NULL, '$2y$08$ie0yIfa6oW5DJyJgaXHkfeeBmBd5VvkU2qi1nvVwQP.OJlyYBSbAy', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15754740006', NULL, NULL, 1),
(130, 'C0830', 'C0830', '朱世宗', NULL, '$2y$08$N23Ryx/DGG6m/FEaZt92fONDNlc1ZYrtvbDYIUaLv.NazkFIBt56K', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18105947698', NULL, NULL, 1),
(131, 'C0825', 'C0825', '陈光和', NULL, '$2y$08$Dt9C4ArHDYmj4k1s4jrtBevGzPuIMt08lFBpapO8FD6HGpwmjU4ou', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '15305946051', NULL, NULL, 1),
(132, 'C0836', 'C0836', '李冰', NULL, '$2y$08$vTITtGv0KIBGaYwgpcRk7OBSaxaDKbwttfBrQ6Orpt0Q52Qeg.YbO', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13915980413', NULL, NULL, 1),
(133, 'C0829', 'C0829', '林建清', NULL, '$2y$08$TYv8WNiY6gnz7Csfds2pievwVkFvcQpu/3X9lhXPkdn.IOyzxg4xu', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18850986248', NULL, NULL, 1),
(134, 'S1241', 'S1241', '姚淑敏', NULL, '$2y$08$LQ80Lpr2XE2149wB/FSDUeY1M53XlCN6iphrGW4qAI.IMBHkCfk.q', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '13848441913', NULL, NULL, 1),
(135, 'S1245', 'S1245', '李峰', NULL, '$2y$08$rttWuuYwJxSDaYRlNnyqW.moGXWXNfXerqcV0n8EdIAj2awhhMUxC', NULL, '', NULL, 1474442553, 0, '127.0.0.1', 1, '18847400465', NULL, NULL, 1),
(136, 'S0822', 'S0822', '黄继元', NULL, '$2y$08$vQpGVrJNpP0JEy40Yze3WOdTe5fq53kLjrkpc3XvnsKpY6.0lUxI.', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13599011941', NULL, NULL, 1),
(137, 'S1239', 'S1239', '蔡耸华', NULL, '$2y$08$9opXHiag4jQlYFKSenwi8Oefwm2U73UjstizpJkb/xVVYmh1UC3l6', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13704746903', NULL, NULL, 1),
(138, 'S1266', 'S1266', '段缘', NULL, '$2y$08$Iq2XWVV86fnRG82bmvBbo.s9VQtIpgXR5FPrmXtdswNwyzcFzhPJK', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13644749949', NULL, NULL, 1),
(139, 'S0819', 'S0819', '曾秀芳', NULL, '$2y$08$iQao2Sor3dmKuJxfsRos3.WDb9VNWH97j3PSF8bavsiA2n3ZCszx6', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13559382925', NULL, NULL, 1),
(140, 'S1255', 'S1255', '杨德辉', NULL, '$2y$08$BhbEOQUGC/26vN7p0euvs.8rwT.jWiM20DyvqEkxJv8tM2l5eiZAy', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18504740006', NULL, NULL, 1),
(141, 'S1242', 'S1242', '赵利惠', NULL, '$2y$08$IrzqSWQGDABmOv8ObMk6KuSRborbQRXbiMKNykdBMor0iatUIMBRq', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15848474242', NULL, NULL, 1),
(142, 'S1243', 'S1243', '李文成', NULL, '$2y$08$o2mdLBgUm6WeuH9fTG41b.YfZQiEftil0cNSU85ukesATG3Yg.3y.', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15849456658', NULL, NULL, 1),
(143, 'S1246', 'S1246', '马春晖', NULL, '$2y$08$TPzPp0733ks.RvAcz1nKLOA6Bm6v5tCYVvG2hgA5sgwqskZpezIbK', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15384745511', NULL, NULL, 1),
(144, 'S1250', 'S1250', '张俊丽', NULL, '$2y$08$QAP1ej3kEXnOKDjz8DhA2eEVzvr8TSoy8YFNqv1RzatTJSmA5CsMW', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18604740080', NULL, NULL, 1),
(145, 'S1251', 'S1251', '郭逢雨', NULL, '$2y$08$ButcLNecEDKWDuuEVkZCy.n3pFKeYdqvUQjuch7fTpzp0nRN0X8lO', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15147470661', NULL, NULL, 1),
(146, 'S0818', 'S0818', '张赛华', NULL, '$2y$08$qOQ48pTL2oVKsWPu0mRkX.gjNxrIwCZFGg93twecAnsCEL.LqSiYa', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15375940376', NULL, NULL, 1),
(147, 'S0810', 'S0810', '郑奋东', NULL, '$2y$08$2EPODA2BVZnOEkP.557fJ.v95m6neiMzyEVsYevOHIi/oPeoY1c2W', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13799699407', NULL, NULL, 1),
(148, 'S0811', 'S0811', '黄明德', NULL, '$2y$08$ngLXe8J.K1beWsWUkTu3vOVNWhVL3sZDgwGNveA1Z3wx.SSt62wja', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13859895157', NULL, NULL, 1),
(149, 'S1252', 'S1252', '孙凌浩', NULL, '$2y$08$xp66smvI5Q.M48gPSTsnOOdyNj1fhEyTYunQ0AstK33X/Yd/bXvgO', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13394885551', NULL, NULL, 1),
(150, 'S1256', 'S1256', '弓树繁', NULL, '$2y$08$JMSQNJ4yyvcXlh/8RP89LOZwGdOQuglXIEHcBYWDio0EGv02psNFG', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15384745522', NULL, NULL, 1),
(151, 'S0836', 'S0836', '何建杭', NULL, '$2y$08$FT90ZEQHNdRHi75KPstfjuyaP1aMy6viygGVIv1fHGpi16LwXzAtO', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18259174143', NULL, NULL, 1),
(152, 'S0815', 'S0815', '蔡峰银', NULL, '$2y$08$fJWW4.irKIwgggMl8l46/eNxBzpdwMtNziB57DI02K0DK5Vn6sTnG', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13860935400', NULL, NULL, 1),
(153, 'S0838', 'S0838', '吴文华', NULL, '$2y$08$at8Bb2ekxgmbtYxlFPKY0.0324YDwFMxD.XkUtxfd.KHgxvkuIiT.', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13358524225', NULL, NULL, 1),
(154, 'S0830', 'S0830', '陈宏爱', NULL, '$2y$08$wrWCkTax309nJgzQqieGk.020iGN9hxbbZNnICaznReb636wQhKTy', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18850951198', NULL, NULL, 1),
(155, 'S0839', 'S0839', '陈洪如', NULL, '$2y$08$mz9leYUcCk8CSoVJBNpQ/.nhNuUBldLn9p1CV1ebQ5yPaoAGp3VNm', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13959577690', NULL, NULL, 1),
(156, 'S0829', 'S0829', '曾思霞', NULL, '$2y$08$8rf2KDGiE5PU9w/6NVbTYu.8wv96fCXJUoLNjIo93zicRSkWoxDWS', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15060300513', NULL, NULL, 1),
(157, 'S0868', 'S0868', '杨瑞华', NULL, '$2y$08$ztsDYsX4MG4gjBcBdrt.5.MvTBKTb9Gyu.B5AGDbfG1lcgKmb923q', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15260930586', NULL, NULL, 1),
(158, 'S0813', 'S0813', '林榕', NULL, '$2y$08$NPrXzR9HhMTWuQ.e9XJqmegSl3C6QgeRAsP7znUlhMv6VX3TlpwWO', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18965569056', NULL, NULL, 1),
(159, 'S0826', 'S0826', '陈光耀', NULL, '$2y$08$uCIwh3Edjx/PjuBAVjVvHOrHfx6RAYQ3LjZ/KaV2ACYQs5vIHWmAe', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18750091652', NULL, NULL, 1),
(160, 'S0831', 'S0831', '林建清', NULL, '$2y$08$bi/ROSDDGgcZKjDk0qaTT../oBJUa8u342PMF3ixNNupDx0jqzRZi', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13706067813', NULL, NULL, 1),
(161, 'NM104', 'NM104', '赵明义', NULL, '$2y$08$eDHM5jnt8FxaxIQqO47sD.QMT1pdKO0ZEOVjNp0yrf7DmKIu.z/LO', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13674754527', NULL, NULL, 1),
(162, 'NM113', 'NM113', '朱金凤', NULL, '$2y$08$1HnuAI4ixU8y4OuZ0RZrGuM8E6PC.o/ANj7LcCFtiMMQeTU8x4gFe', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15247102260', NULL, NULL, 1),
(163, 'NM112', 'NM112', '潘月鲜', NULL, '$2y$08$VhDgauKGzmicfzVp0LW45u.2a4QkeqVbxmgkJNAUZHHxrQbzLbl3W', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13087111166', NULL, NULL, 1),
(164, 'NM115', 'NM115', '张小强', NULL, '$2y$08$1ITU3VI92rAm/JrNYAqwM.Y7OUIFapRTygR7uqJimUUuABdfiq.zC', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18241111138', NULL, NULL, 1),
(165, 'NM211', 'NM211', '李国英', NULL, '$2y$08$6HnAIHQV5Uu6tLDUUVVOqu/KO22KAeFJJL9b0j2yVkNgmTQfzIrqC', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15034956657', NULL, NULL, 1),
(166, 'NM209', 'NM209', '麻晓婷', NULL, '$2y$08$0aUUKCISSiDzJ3SRI.Hx1.lwir5r/nbVv8M4SBEfuN3z.WdnNPWXK', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13847183022', NULL, NULL, 1),
(167, 'NM2010', 'NM2010', '董茗', NULL, '$2y$08$thiGs7wxHI6HIoGnEvwFQesZcJnIhJxPKstrM973o.wYpKQHuV1Kq', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15149740985', NULL, NULL, 1),
(168, 'NM216', 'NM216', '张利军', NULL, '$2y$08$KaXJgd0iLrOaA7cGhRRiv.MMpe5K6YuNdUcZ7cybIwjd4NzU/gh3q', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '14747888504', NULL, NULL, 1),
(169, 'NM208', 'NM208', '赵平小', NULL, '$2y$08$YpCvTDT586q8IHeZX4muzuMuy0mlkZTVQPgVIW6nib3RpUguQyUvS', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15949470045', NULL, NULL, 1),
(170, 'NM210', 'NM210', '董芳', NULL, '$2y$08$wW3jHUQ5ewBP.Ev39jFLM.hMYrg4WShI3NVME5cSOPEIQnkhUjYhK', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15149740985', NULL, NULL, 1),
(171, 'NM206', 'NM206', '黄健卫', NULL, '$2y$08$KRgEz9WYP94p4XQTYr0kOuzZIs2MBkT0qd89ox9Sqjk8KKp3T8Laa', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15849196251', NULL, NULL, 1),
(172, 'NM203', 'NM203', '包晨明', NULL, '$2y$08$AuhFqUchhLPHi4EUpTD4VuUSGUyuPAfSGSbWnuddlIBsPhMr3.rOq', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15247132201', NULL, NULL, 1),
(173, 'NM301', 'NM301', '王丽', NULL, '$2y$08$iqy8N.u.JJF/swi1w1syduQOLTKYrcWQicOKzHB51xBi4UocAkw8S', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13847178848', NULL, NULL, 1),
(174, 'NM205', 'NM205', '李波', NULL, '$2y$08$bs753BlcdgMMNnk8A1lGTu80Hf3fEG28yo2or2pK0Bw9nuMr8dDW6', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15947717813', NULL, NULL, 1),
(175, 'NM207', 'NM207', '刘素珍', NULL, '$2y$08$i6YWsUlJ.cXJrOApPN7/dOhfVvsyXvj8X3YlbY9umHkh1fp8tgunu', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13674842196', NULL, NULL, 1),
(176, 'NM202', 'NM202', '窦明霞', NULL, '$2y$08$V03.9EcDejgKh9JOVIqyzOIgGWac2fIA0m9M3qm3MRCoqMX5QGGb2', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18604888619', NULL, NULL, 1),
(177, 'NM204', 'NM204', '郝三厚', NULL, '$2y$08$236uZ7qE/REDwFNclBfn1uulCPitJl3u.d16mY8jQlSZOO04kCyqG', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18847124399', NULL, NULL, 1),
(178, 'S0820', 'S0820', '蔡秀英', NULL, '$2y$08$xFbxPiHFV/K83YdUFLC2qeJXiVuwIDgx9TlihDXFdELmK.vlRKTVG', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15080147398', NULL, NULL, 1),
(179, 'NM001', 'NM001', '董怀军', NULL, '$2y$08$.tGzKUQQ5jNcJt9N7bQ86OfUAfxIcHZjk8OxI4lUAOH4DaXp2G7Fi', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13327109212', NULL, NULL, 1),
(180, 'NM002', 'NM002', '陈金华', NULL, '$2y$08$lbcQSQJ6JkvFDlE7jYxIbOrnKU7Eyh.QvJCrBjpiW08CFoxM8sTY.', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15304792727', NULL, NULL, 1),
(181, 'NM114', 'NM114', '马海刚', NULL, '$2y$08$uJIKN5S8777eCNaOmbd12eU3FL7vatwm2vWITr./S46K4kaKY98/6', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13384711135', NULL, NULL, 1),
(182, 'S0835', 'S0835', '郑理政', NULL, '$2y$08$M5d7ULy5qguAdVNdpXQ73.pXBdAguF..zmKAShT8eV0V3Rw3D0/Qi', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18750072321', NULL, NULL, 1),
(183, 'S0845', 'S0845', '黄肖肖', NULL, '$2y$08$CzUvaavHTKytQ8Tn1CjZLujzgEqVbaGffO8TzORNsS0EHyoo/8lTO', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15959190032', NULL, NULL, 1),
(184, 'NM118', 'NM118', '潘其乐', NULL, '$2y$08$UhFDO8fhLZVeioWm1cVoIOT04hXEfQ0Segg4Y5wZZSxIVqTRHIAuK', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '15047143060', NULL, NULL, 1),
(185, 'C0810', 'C0810', '杨鹭', NULL, '$2y$08$vm9N6ffzcW4zr8MLTCiq4uaE0BdHbIF9taRqAUwvwi7b1IYdawJ8G', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18159426920', NULL, NULL, 1),
(186, 'S0840', 'S0840', '翁玲', NULL, '$2y$08$ik8YQiB51l3pjbSAO6F4o.J/aPB8N.IkiQ0Y4ZBQ2Cc6.1Q.sNnje', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '18650320184', NULL, NULL, 1),
(187, 's0832', 's0832', '潘晓晨', NULL, '$2y$08$s8PUwstdAEt2.DvHH/zmkO4/omV4etubdfm8wgwC/hB1yTXg1iZ3y', NULL, '', NULL, 1474442554, 0, '127.0.0.1', 1, '13850267585', NULL, NULL, 1),
(188, 'NM116', 'NM116', '曹雅璐', NULL, '$2y$08$SlZH3DS2j/GRxZLYonmY2up5aTUzwhTgVQwEoweSJKOw4DK.RZUDa', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '18748175818', NULL, NULL, 1),
(189, 'NM117', 'NM117', '郑雅萍', NULL, '$2y$08$hiBB9hiE5UnmXDF8.CkrH.uIHuAzismrIufFUspKIV0ZKTkBbRvhS', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13451318151', NULL, NULL, 1),
(190, 's0848', 's0848', '蔡剑飞', NULL, '$2y$08$0hcrpdYCpE6Ju7Ae2EXnue3gr9qQK6mH.O0PILlAB7kwzj95rTGmy', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13666037753', NULL, NULL, 1),
(191, 's0809', 's0809', '林向红', NULL, '$2y$08$n7NPMKYMqYHpsKVJ7zg5l.ox5c2LGGUyl/RSh9imAbuiBM62wm0c6', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13799688269', NULL, NULL, 1),
(192, 's0821', 's0821', '黄爱武', NULL, '$2y$08$4usQvtsgBSILJSLvqr2I4eK7MFVTLFWbcQP7j8mekL2l22G.i.HVq', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13607522072', NULL, NULL, 1),
(193, 's0833', 's0833', '林剑波', NULL, '$2y$08$lnd456ByKNugB.9vreE9/uhNX75W6qgQm90dFoklLFqcRbs041s1S', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13860979899', NULL, NULL, 1),
(194, 's0846', 's0846', '林雪梅', NULL, '$2y$08$/WAW/3/BjvWOZH8TwvAiQuIYNN9Yrf5fZ5XGlx9K6t74ZBd50/JCS', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13626929711', NULL, NULL, 1),
(195, 'C0809', 'C0809', '陈彩霞', NULL, '$2y$08$yNrR6NF8FI58dfV1RpOppOGNgKDnryZWbBz1chIo9TlX7ABZpw382', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '18005948060', NULL, NULL, 1),
(196, 'NM212', 'NM212', '李娜', NULL, '$2y$08$cXvqHg6kdbXbMd8lMNgU4uup9lYyQyExM7SEx2SJv3TX7/cBA7J/.', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '15849109275', NULL, NULL, 1),
(197, 'NM213', 'NM213', '吕小龙', NULL, '$2y$08$iZVqzi3xaZkVrbPYESlSQeWNNexXz5ejPR0yBehNgzPL9DsVwpPeu', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13074738830', NULL, NULL, 1),
(198, 'NM214', 'NM214', '于静', NULL, '$2y$08$dFntYTP18uTOj7WpRw0M5eHumoAzA2Cr6bvnfXadAO2tIlsVm9NSO', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '18947104858', NULL, NULL, 1),
(199, 'NM215', 'NM215', '杨雪敏', NULL, '$2y$08$FzRWk0ld.GA3bPHmVRjib.EmJ7GpThjQWsJxcyIAKb45Mbe3gJ2Q6', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13384892392', NULL, NULL, 1),
(200, 'NM217', 'NM217', '姜雪娇', NULL, '$2y$08$gqOm0yeObtWagzXZht2rY.mlvHCBPleEQlcqp4ag9N6FN6fAdz.Qy', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '15326091152', NULL, NULL, 1),
(201, 'NM218', 'NM218', '王利敏', NULL, '$2y$08$7pkHC5U9m04.2jf7On/CW.7Bq.vNyCEJu.2GYwONgouQM0yGfhq8a', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '15754865150', NULL, NULL, 1),
(202, 'S0862', 'S0862', '徐丽婷', NULL, '$2y$08$uVtzstWw7ob1erRCsaMxSefEAcwHJFo.zeyC6rbqQaYFmZ/8Zxg/.', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '18720933092', NULL, NULL, 1),
(203, 'S1087', 'S1087', '林宁', NULL, '$2y$08$WPz4jKcRDgkgzRBtoraztujrTgEJvqdsIxtnVVYJGOfq8IhaorENe', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '15080177750', NULL, NULL, 1),
(204, 'S0816', 'S0816', '严琳琳', NULL, '$2y$08$o4bo2a7XUNoDETwCkPVSW.UkY2Q9pKVvNLfSgFDvrw3/pTEEzQKEG', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13607527966', NULL, NULL, 1),
(205, 'S0842', 'S0842', '张燕花', NULL, '$2y$08$RHGlg3WjO.BOMC72kfUhreF0cRBHTxiLQLc4N6CL.z6eX.BdLnOeK', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13194444457', NULL, NULL, 1),
(206, 'S0867', 'S0867', '林建聪', NULL, '$2y$08$/bNNk/mTBZUkB9aGFFOLQ.CBl/b9KjCvrR2y6Sp7OJAUT6S2AdSvO', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13799662162', NULL, NULL, 1),
(207, 'NM201', 'NM201', '王爱', NULL, '$2y$08$FJiE1yumXQV3YoYl4ylqduHvxEhen.4lVWIx3TW68mEy4PVPAJEGm', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '18047182554', NULL, NULL, 1),
(208, 'NM111', 'NM111', '陈国雯', NULL, '$2y$08$tBwDks0ECnX7j4GmsVNcHupgw5HKFgbATrly9/78j1EC.v.gsWA1i', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '15847757050', NULL, NULL, 1),
(209, 'NM219', 'NM219', '谭国强', NULL, '$2y$08$noCoVZEBDKlxr0tsvjgXQeu6isuTi3Rs/9qUJ3Qcy2mTRGvtJZRl2', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13029504100', NULL, NULL, 1),
(210, 'S0968', 'S0968', '吴志斌', NULL, '$2y$08$fXpzk6InziFgYg3Dla2fJO30Sq.wAN2y78wG9s3cKjiLNEjSxoZYu', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13905947375', NULL, NULL, 1),
(211, 'S0827', 'S0827', '陈伟正', NULL, '$2y$08$D3UW3SpyfL7nB7lGahmHO.9I5Q9vvzlK3tYXsOFHxI1I3iU73LiyK', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '18705043621', NULL, NULL, 1),
(212, 'S0841', 'S0841', '林晨霞', NULL, '$2y$08$H.w7okBNnbOzSpv0DGyuY.dGrDVQOzR8VdT1Rvy2gxtqL/tJ9NqGu', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '18350267909', NULL, NULL, 1),
(213, 'S0828', 'S0828', '邱陶楠', NULL, '$2y$08$iFvVfDL6W3O3FSUe7XLZVuAbb62OArd9HKj2AybD2N1i8lrZm00HO', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13850241323', NULL, NULL, 1),
(214, 'S0837', 'S0837', '郑志敏', NULL, '$2y$08$QnJLprv5qvjZuIzix8IqAubKVb2uuH5s5AciMu5SIardCDpH9mw6O', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13615993226', NULL, NULL, 1),
(215, 'S0853', 'S0853', '陈文斌', NULL, '$2y$08$c7YPAnxqWYbWu239AsFQ8eslKcmGgFFXJxyzSpPLH2862Ioxj5DIS', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '15260828778', NULL, NULL, 1),
(216, 'NM220', 'NM220', '胡慧娟', NULL, '$2y$08$pHGM4KAg2thnB.Go5d70P.LQX/IXPYWmgHArgH8a.oZfs3gX50lyC', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '18698408728', NULL, NULL, 1),
(217, 'NM302', 'NM302', '温海洋', NULL, '$2y$08$KeZ/Y3577bvMZsUpncZ2PuG76eHOKBwJLyT1LP3Q2OLzit7Dnqioi', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '15124707079', NULL, NULL, 1),
(218, 'NM303', 'NM303', '赵建文', NULL, '$2y$08$XH6u329R9wLoIRlaWpB02uABwpnvvkvD/wJL7UriDagSKTpQFIO2i', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '15248103931', NULL, NULL, 1),
(219, 'NM304', 'NM304', '段罗娜', NULL, '$2y$08$pyxKoMHxKR5JnrVys/eKTeaiKRP/fkoQoHXRy4hd6AB38tfqa88s2', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '17704889892', NULL, NULL, 1),
(220, 'NM305', 'NM305', '玮玮', NULL, '$2y$08$ceJ5x3N1kfQgIq4BZtOMluCFK98Eot.R3uDkNqk4t6NEd/FQzifdC', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '18847137170', NULL, NULL, 1),
(221, 'S0843', 'S0843', '吕碧红', NULL, '$2y$08$HOZxo.5GJxtH5MXdNBZ5ROc.0DyFwwD7vEuuhPsVnsXDShuSaCk56', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13959593312', NULL, NULL, 1),
(222, 'NM119', 'NM119', '杨滢', NULL, '$2y$08$MeFZwZ5LOgBK/1W.59cuOOUV.d/oudOXmnxUMoymodqhGsnmBXbCW', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13488517038', NULL, NULL, 1),
(223, 'S0897', 'S0897', '于梅', NULL, '$2y$08$5QCO7chXZRcWD2nlmi3jz.3JzvHMlDAj/KfVt8sKVJJ4dMpdRl75u', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '15255293278', NULL, NULL, 1),
(224, 'S0847', 'S0847', '林梅钦', NULL, '$2y$08$vHIfrhziefEr/3XMi5/aCum2F6YcXJOVB9F0mxhkyNVqlYzVw7uQC', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '13599863241', NULL, NULL, 1),
(225, 'S0998', 'S0998', '朱冷冷', NULL, '$2y$08$Av27limkxUbLzsZolEuAHOy8V4ZkX9tQueqlt/bTQhcRQQQ05zoFO', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '15080357426', NULL, NULL, 1),
(226, 'HJMT8', 'HJMT8', '朱景修', NULL, '$2y$08$fAMixznNM45CRXM.Lf2/aOGpZfh30NvnYz4CdHO6fhD43VNHITax6', NULL, '', NULL, 1474442555, 0, '127.0.0.1', 1, '18850911766', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_activity`
--

CREATE TABLE `gd_worker_activity` (
  `activity_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addtime` int(11) NOT NULL,
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL
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
-- 表的结构 `gd_worker_company`
--

CREATE TABLE `gd_worker_company` (
  `company_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_worker_company`
--

INSERT INTO `gd_worker_company` (`company_id`, `title`, `alias`, `status`, `addtime`) VALUES
(1, '莆田总公司', '莆田', 1, 1472518963),
(2, '泉州分公司', '泉州', 1, 1473652666);

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_group`
--

CREATE TABLE `gd_worker_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `is_system` tinyint(4) NOT NULL DEFAULT '0',
  `permission` text,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gd_worker_group`
--

INSERT INTO `gd_worker_group` (`id`, `code`, `title`, `is_system`, `permission`, `status`) VALUES
(1, 'admin', '管理组', 1, '', 1),
(2, 'member', '业务员', 0, '2997,2999,3001,3003,2998,3000,3002', 1),
(3, 'manager', '经理', 0, '1,2,3,5,6,7,8,9,10,11,22,23,24,25,26,27,30,33,35,48,49,50,51,52,54,55,57,59,61,62,63,64,65,67,68,69,70,72,78,80,81,82,83,84,85,87,93,94,96,98,100,101,102,103,105,106,107,108,109,110,112,113,114,115,116,118,120,121,124,125,126,127,128', 1),
(4, 'warehouser', '库管', 0, '1,2,3,55,61,65,70,82,87,98,100,101,105,107,108,111,117,118,119,120,121,122,123', 1),
(5, 'appraiser', '鉴定人', 0, '74,73,70,1,3,2', 1),
(6, 'booker', '登记人', 0, '1,2,3,52,55,57,70,72,93,98,100,101,103', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_worker_notify`
--

CREATE TABLE `gd_worker_notify` (
  `notify_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL DEFAULT '0',
  `receiver_id` int(11) NOT NULL,
  `mode` enum('announcement','summary') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'announcement',
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
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
(20, 1, 1),
(25, 2, 2),
(5, 3, 3),
(28, 4, 3),
(9, 5, 6),
(26, 6, 6),
(13, 7, 4),
(29, 8, 4),
(17, 9, 5),
(248, 10, 2),
(249, 11, 2),
(250, 12, 2),
(251, 13, 2),
(252, 14, 2),
(253, 15, 2),
(254, 16, 2),
(255, 17, 2),
(256, 18, 2),
(257, 19, 2),
(258, 20, 2),
(259, 21, 2),
(260, 22, 2),
(261, 23, 2),
(262, 24, 2),
(263, 25, 2),
(264, 26, 2),
(265, 27, 2),
(266, 28, 2),
(267, 29, 2),
(268, 30, 2),
(269, 31, 2),
(466, 32, 1),
(271, 33, 2),
(272, 34, 2),
(273, 35, 2),
(274, 36, 2),
(275, 37, 2),
(276, 38, 2),
(277, 39, 2),
(278, 40, 2),
(279, 41, 2),
(280, 42, 2),
(281, 43, 2),
(282, 44, 2),
(283, 45, 2),
(284, 46, 2),
(285, 47, 2),
(286, 48, 2),
(287, 49, 2),
(288, 50, 2),
(289, 51, 2),
(290, 52, 2),
(291, 53, 2),
(292, 54, 2),
(293, 55, 2),
(294, 56, 2),
(295, 57, 2),
(296, 58, 2),
(297, 59, 2),
(298, 60, 2),
(299, 61, 2),
(300, 62, 2),
(301, 63, 2),
(302, 64, 2),
(303, 65, 2),
(304, 66, 2),
(305, 67, 2),
(306, 68, 2),
(307, 69, 2),
(308, 70, 2),
(309, 71, 2),
(310, 72, 2),
(311, 73, 2),
(312, 74, 2),
(313, 75, 2),
(314, 76, 2),
(315, 77, 2),
(316, 78, 2),
(317, 79, 2),
(318, 80, 2),
(319, 81, 2),
(320, 82, 2),
(321, 83, 2),
(322, 84, 2),
(323, 85, 2),
(324, 86, 2),
(325, 87, 2),
(326, 88, 2),
(327, 89, 2),
(328, 90, 2),
(329, 91, 2),
(330, 92, 2),
(331, 93, 2),
(332, 94, 2),
(333, 95, 2),
(334, 96, 2),
(335, 97, 2),
(336, 98, 2),
(337, 99, 2),
(338, 100, 2),
(339, 101, 2),
(340, 102, 2),
(341, 103, 2),
(342, 104, 2),
(343, 105, 2),
(344, 106, 2),
(345, 107, 2),
(346, 108, 2),
(347, 109, 2),
(348, 110, 2),
(349, 111, 2),
(350, 112, 2),
(351, 113, 2),
(352, 114, 2),
(353, 115, 2),
(354, 116, 2),
(355, 117, 2),
(356, 118, 2),
(357, 119, 2),
(358, 120, 2),
(359, 121, 2),
(360, 122, 2),
(361, 123, 2),
(362, 124, 2),
(363, 125, 2),
(364, 126, 2),
(365, 127, 2),
(366, 128, 2),
(367, 129, 2),
(368, 130, 2),
(369, 131, 2),
(370, 132, 2),
(371, 133, 2),
(372, 134, 2),
(373, 135, 2),
(374, 136, 2),
(375, 137, 2),
(376, 138, 2),
(377, 139, 2),
(378, 140, 2),
(379, 141, 2),
(380, 142, 2),
(381, 143, 2),
(382, 144, 2),
(383, 145, 2),
(384, 146, 2),
(385, 147, 2),
(386, 148, 2),
(387, 149, 2),
(388, 150, 2),
(389, 151, 2),
(390, 152, 2),
(391, 153, 2),
(392, 154, 2),
(393, 155, 2),
(394, 156, 2),
(395, 157, 2),
(396, 158, 2),
(397, 159, 2),
(398, 160, 2),
(399, 161, 2),
(400, 162, 2),
(401, 163, 2),
(402, 164, 2),
(403, 165, 2),
(404, 166, 2),
(405, 167, 2),
(406, 168, 2),
(407, 169, 2),
(408, 170, 2),
(409, 171, 2),
(410, 172, 2),
(411, 173, 2),
(412, 174, 2),
(413, 175, 2),
(414, 176, 2),
(415, 177, 2),
(416, 178, 2),
(417, 179, 2),
(418, 180, 2),
(419, 181, 2),
(420, 182, 2),
(421, 183, 2),
(422, 184, 2),
(423, 185, 2),
(424, 186, 2),
(425, 187, 2),
(426, 188, 2),
(427, 189, 2),
(428, 190, 2),
(429, 191, 2),
(430, 192, 2),
(431, 193, 2),
(432, 194, 2),
(433, 195, 2),
(434, 196, 2),
(435, 197, 2),
(436, 198, 2),
(437, 199, 2),
(438, 200, 2),
(439, 201, 2),
(440, 202, 2),
(441, 203, 2),
(442, 204, 2),
(443, 205, 2),
(444, 206, 2),
(445, 207, 2),
(446, 208, 2),
(447, 209, 2),
(448, 210, 2),
(449, 211, 2),
(450, 212, 2),
(451, 213, 2),
(452, 214, 2),
(453, 215, 2),
(454, 216, 2),
(455, 217, 2),
(456, 218, 2),
(457, 219, 2),
(458, 220, 2),
(459, 221, 2),
(460, 222, 2),
(461, 223, 2),
(462, 224, 2),
(463, 225, 2),
(464, 226, 2);

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
-- Indexes for table `gd_cron_job`
--
ALTER TABLE `gd_cron_job`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `gd_cron_schedule`
--
ALTER TABLE `gd_cron_schedule`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `task_name` (`job_code`),
  ADD KEY `scheduled_at` (`scheduled_at`,`status`);

--
-- Indexes for table `gd_customer`
--
ALTER TABLE `gd_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `gd_customer_apply`
--
ALTER TABLE `gd_customer_apply`
  ADD PRIMARY KEY (`apply_id`);

--
-- Indexes for table `gd_customer_group`
--
ALTER TABLE `gd_customer_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `gd_customer_history`
--
ALTER TABLE `gd_customer_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `gd_customer_sms`
--
ALTER TABLE `gd_customer_sms`
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `gd_customer_stock`
--
ALTER TABLE `gd_customer_stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `gd_golden_price`
--
ALTER TABLE `gd_golden_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gd_node`
--
ALTER TABLE `gd_node`
  ADD PRIMARY KEY (`node_id`);

--
-- Indexes for table `gd_project_file`
--
ALTER TABLE `gd_project_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `gd_project_investing`
--
ALTER TABLE `gd_project_investing`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `gd_project_investing_history`
--
ALTER TABLE `gd_project_investing_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `gd_project_investing_status`
--
ALTER TABLE `gd_project_investing_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `gd_project_period`
--
ALTER TABLE `gd_project_period`
  ADD PRIMARY KEY (`period_id`);

--
-- Indexes for table `gd_project_recycling`
--
ALTER TABLE `gd_project_recycling`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `gd_project_recycling_history`
--
ALTER TABLE `gd_project_recycling_history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `gd_project_recycling_status`
--
ALTER TABLE `gd_project_recycling_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `gd_project_stock`
--
ALTER TABLE `gd_project_stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `gd_project_track`
--
ALTER TABLE `gd_project_track`
  ADD PRIMARY KEY (`track_id`);

--
-- Indexes for table `gd_project_trash`
--
ALTER TABLE `gd_project_trash`
  ADD PRIMARY KEY (`trash_id`);

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
-- Indexes for table `gd_worker_company`
--
ALTER TABLE `gd_worker_company`
  ADD PRIMARY KEY (`company_id`);

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
-- 使用表AUTO_INCREMENT `gd_cron_job`
--
ALTER TABLE `gd_cron_job`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `gd_cron_schedule`
--
ALTER TABLE `gd_cron_schedule`
  MODIFY `schedule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_customer`
--
ALTER TABLE `gd_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `gd_customer_apply`
--
ALTER TABLE `gd_customer_apply`
  MODIFY `apply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `gd_customer_group`
--
ALTER TABLE `gd_customer_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `gd_customer_history`
--
ALTER TABLE `gd_customer_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `gd_customer_stock`
--
ALTER TABLE `gd_customer_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `gd_golden_price`
--
ALTER TABLE `gd_golden_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- 使用表AUTO_INCREMENT `gd_node`
--
ALTER TABLE `gd_node`
  MODIFY `node_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- 使用表AUTO_INCREMENT `gd_project_file`
--
ALTER TABLE `gd_project_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- 使用表AUTO_INCREMENT `gd_project_investing`
--
ALTER TABLE `gd_project_investing`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `gd_project_investing_history`
--
ALTER TABLE `gd_project_investing_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用表AUTO_INCREMENT `gd_project_investing_status`
--
ALTER TABLE `gd_project_investing_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `gd_project_period`
--
ALTER TABLE `gd_project_period`
  MODIFY `period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `gd_project_recycling`
--
ALTER TABLE `gd_project_recycling`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `gd_project_recycling_history`
--
ALTER TABLE `gd_project_recycling_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `gd_project_recycling_status`
--
ALTER TABLE `gd_project_recycling_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `gd_project_stock`
--
ALTER TABLE `gd_project_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `gd_project_track`
--
ALTER TABLE `gd_project_track`
  MODIFY `track_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_project_trash`
--
ALTER TABLE `gd_project_trash`
  MODIFY `trash_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_setting`
--
ALTER TABLE `gd_setting`
  MODIFY `setting_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- 使用表AUTO_INCREMENT `gd_worker`
--
ALTER TABLE `gd_worker`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;
--
-- 使用表AUTO_INCREMENT `gd_worker_activity`
--
ALTER TABLE `gd_worker_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_worker_attempt`
--
ALTER TABLE `gd_worker_attempt`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `gd_worker_company`
--
ALTER TABLE `gd_worker_company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `gd_worker_group`
--
ALTER TABLE `gd_worker_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `gd_worker_notify`
--
ALTER TABLE `gd_worker_notify`
  MODIFY `notify_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_worker_rel`
--
ALTER TABLE `gd_worker_rel`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=467;
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
