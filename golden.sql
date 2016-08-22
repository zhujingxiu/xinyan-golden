-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-08-22 14:16:45
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
-- 表的结构 `gd_customer`
--

CREATE TABLE `gd_customer` (
  `customer_id` int(11) NOT NULL,
  `realname` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `idnumber` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `wechat` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `referrer` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gd_node`
--

INSERT INTO `gd_node` (`node_id`, `mode`, `parent_id`, `level`, `name`, `title`, `path`, `status`, `auth`, `sort`, `note`) VALUES
(1, 'auth', 0, 1, 'tool', '小工具', '', 1, 1, 0, NULL),
(2, 'auth', 1, 1, 'API', '通用接口', 'tool/api', 1, 1, 0, ''),
(3, 'auth', 2, 1, 'golden_price', '获取黄金价格', 'tool/api/golden_price', 1, 1, 0, ''),
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
(52, 'auth', 48, 1, 'get_info', '获取文章信息', 'article/article/get_info', 1, 1, 0, ''),
(53, 'auth', 0, 1, 'project', '项目管理', 'project', 1, 1, 0, ''),
(54, 'auth', 53, 1, 'investing', '钱生金', 'project/investing', 1, 1, 0, ''),
(55, 'auth', 54, 1, 'index', '读取钱生金项目列表', 'project/investing/index', 1, 1, 0, ''),
(57, 'auth', 54, 1, 'applied', '添加项目', 'project/investing/applied', 1, 1, 0, ''),
(59, 'auth', 54, 1, 'checked', '核实项目信息', 'project/investing/checked', 1, 1, 0, ''),
(61, 'auth', 54, 1, 'confirmed', '库管确认', 'project/investing/confirmed', 1, 1, 0, ''),
(63, 'auth', 54, 1, 'certificated', '申请取金凭证', 'project/investing/certificated', 1, 1, 0, ''),
(65, 'auth', 54, 1, 'taken', '确认提金', 'project/investing/taken', 1, 1, 0, ''),
(67, 'auth', 54, 1, 'refused', '拒绝申请', 'project/investing/refused', 1, 1, 0, ''),
(68, 'auth', 54, 1, 'trashed', '废弃项目', 'project/investing/trashed', 1, 1, 0, ''),
(69, 'auth', 53, 1, 'recycling', '金生金', 'project/recycling', 1, 1, 0, ''),
(70, 'auth', 69, 1, 'index', '读取项目列表', 'project/recycling/index', 1, 1, 0, ''),
(72, 'auth', 69, 1, 'applied', '登记项目', 'project/recycling/applied', 1, 1, 0, ''),
(74, 'auth', 69, 1, 'appraised', '鉴定结果', 'project/recycling/appraised', 1, 1, 0, ''),
(76, 'auth', 69, 1, 'agreed', '客户同意鉴定结果', 'project/recycling/agreed', 1, 1, 0, ''),
(78, 'auth', 69, 1, 'checked', '核实项目信息', 'project/recycling/checked', 1, 1, 0, ''),
(80, 'auth', 69, 3, 'certificated', '申请取金凭证', 'project/recycling/certificated', 1, 1, 0, ''),
(82, 'auth', 69, 1, 'taken', '确认提金', 'project/recycling/taken', 1, 1, 0, ''),
(84, 'auth', 69, 1, 'refused', '拒绝申请', 'project/recycling/refused', 1, 1, 0, ''),
(85, 'auth', 69, 1, 'trashed', '废弃项目', 'project/recycling/trashed', 1, 1, 0, ''),
(87, 'auth', 69, 1, 'confirmed', '库管确认', 'project/recycling/confirmed', 1, 1, 0, ''),
(88, 'auth', 0, 1, 'dashboard', '首页', '', 1, 0, 0, NULL),
(89, 'auth', 88, 1, 'home', '控制面板', 'home/index', 1, 0, 0, NULL),
(90, 'auth', 0, 1, 'error', '错误提示', '', 1, 0, 0, NULL),
(91, 'auth', 90, 1, 'permission', '无此授权', 'error/permission', 1, 0, 0, NULL),
(92, 'auth', 90, 1, 'permission', '无此授权', 'error/permission/index', 1, 0, 0, NULL),
(93, 'auth', 54, 1, 'update', '编辑项目', 'project/investing/update', 1, 1, 0, '');

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
-- 表的结构 `gd_project_investing`
--

CREATE TABLE `gd_project_investing` (
  `project_id` int(11) NOT NULL,
  `project_sn` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `idnumber` char(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wechat` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referrer` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(11,2) NOT NULL DEFAULT '0.00',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `period` tinyint(4) NOT NULL DEFAULT '0',
  `total` decimal(11,2) NOT NULL DEFAULT '0.00',
  `note` text COLLATE utf8_unicode_ci,
  `status_id` tinyint(1) NOT NULL DEFAULT '0',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `locker` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_investing`
--

INSERT INTO `gd_project_investing` (`project_id`, `project_sn`, `customer_id`, `realname`, `phone`, `idnumber`, `wechat`, `referrer`, `price`, `weight`, `amount`, `period`, `total`, `note`, `status_id`, `worker_id`, `addtime`, `lasttime`, `locker`) VALUES
(1, 'SD20156454564522', 0, 'OKOK', '18800011000', NULL, NULL, NULL, '288.88', '100.00', '28888.00', 0, '0.00', NULL, 1, 0, 1470000000, 0, 0),
(2, 'SD20155454564511', 0, 'OKOK', '18800011001', NULL, NULL, NULL, '288.88', '100.00', '28888.00', 1, '0.00', NULL, 1, 1, 1470000000, 0, 0),
(3, '1608188031093542', 0, '朱景修', '18850911111', '321324200808080415', '', 'XX', '287.35', '10.00', '2873.50', 3, '10.15', '<p>sadsadasdsa</p><ol class=" list-paddingleft-2" style="list-style-type: decimal;"><li><p>dsadadsa</p></li><li><p><strong>asdsadsadsa</strong><br/></p></li></ol>', 1, 1, 1471509342, 0, 0),
(4, '1608188261053809', 0, '朱景修', '13813801380', '321325199902024510', '', '', '287.98', '100.00', '28798.00', 12, '106.00', '&lt;p&gt;dasdsada&lt;/p&gt;', 1, 1, 1471509489, 0, 0),
(5, '1608181371034554', 0, '沈万三', '18888888888', '325326150008080808', '', '', '287.35', '1000000.00', '287350000.00', 12, '1060000.00', '&lt;p&gt;我是沈万三&lt;/p&gt;&lt;p&gt;我有聚宝盆&lt;/p&gt;&lt;p&gt;爱买几吨买几吨&lt;/p&gt;', 1, 1, 1471509954, 0, 0),
(6, '1608186671184447', 0, '赵公明', '15815801580', '321324198808080808', '', '', '287.35', '10.00', '2873.50', 3, '10.15', '&lt;p&gt;哈哈哈哈哈哈&lt;/p&gt;', 1, 1, 1471513487, 0, 0),
(7, '1608183471764952', 0, '马晓云', '13913901390', '500250196606080806', '', '', '287.35', '10.00', '2873.50', 3, '10.15', '&lt;p&gt;我是马晓云&lt;/p&gt;&lt;p&gt;我是财神爷&lt;/p&gt;', 1, 1, 1471513792, 0, 0),
(8, '1608222241360343', 0, '朱景修', '18850911766', '321324155010254569', '', '', '286.80', '12.00', '3441.60', 12, '12.72', '&lt;p&gt;asdasdsadsa&lt;/p&gt;', 1, 5, 1471842223, 1471856775, 0),
(9, '1608229881435008', 0, '朱景修', '18850911766', '321245198905080904', '', '', '290.00', '100.00', '29000.00', 12, '106.00', '&lt;p&gt;65465456&lt;/p&gt;', 1, 5, 1471848608, 1471856884, 0),
(10, '1608229951425621', 0, '朱景修', '18850911766', '321245198905080904', '', '', '289.67', '100.00', '28967.00', 12, '106.00', '', 1, 5, 1471848981, 1471856834, 0),
(11, '1608225151495752', 0, '陈国', '13001023005', '321245198905080904', '', '', '289.67', '12.00', '3476.04', 12, '12.72', '&lt;p&gt;asdsadsaxzcxz&lt;/p&gt;', 1, 5, 1471849072, 1471856820, 0),
(12, '1608222511510103', 0, '陈国', '18850911766', '321245198905080904', '', '', '288.39', '12.00', '3460.68', 12, '12.72', '&lt;p&gt;22222&lt;/p&gt;', 1, 5, 1471849263, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_investing_history`
--

CREATE TABLE `gd_project_investing_history` (
  `history_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `extra` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_investing_history`
--

INSERT INTO `gd_project_investing_history` (`history_id`, `project_id`, `status_id`, `note`, `extra`, `worker_id`, `addtime`, `ip`) VALUES
(1, 3, 1, '', NULL, 1, 1471509342, NULL),
(2, 4, 1, '', NULL, 1, 1471509489, NULL),
(3, 5, 1, '', NULL, 1, 1471509954, '127.0.0.1'),
(4, 6, 1, '', NULL, 1, 1471513487, '127.0.0.1'),
(5, 7, 1, '', NULL, 1, 1471513792, '127.0.0.1'),
(10, 12, 1, '&lt;p&gt;22222&lt;/p&gt;', NULL, 5, 1471849263, '127.0.0.1'),
(11, 8, 1, '&lt;p&gt;asdasdsadsa&lt;/p&gt;', NULL, 5, 1471856775, '127.0.0.1'),
(12, 11, 1, '&lt;p&gt;asdsadsaxzcxz&lt;/p&gt;', NULL, 5, 1471856820, '127.0.0.1'),
(13, 10, 1, '', NULL, 5, 1471856834, '127.0.0.1'),
(14, 9, 1, '&lt;p&gt;65465456&lt;/p&gt;', NULL, 5, 1471856884, '127.0.0.1');

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
-- 表的结构 `gd_project_recycling`
--

CREATE TABLE `gd_project_recycling` (
  `project_id` int(11) NOT NULL,
  `project_sn` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(11,2) NOT NULL DEFAULT '0.00',
  `value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status_id` tinyint(1) NOT NULL DEFAULT '0',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_recycling`
--

INSERT INTO `gd_project_recycling` (`project_id`, `project_sn`, `title`, `customer_id`, `realname`, `phone`, `price`, `weight`, `value`, `status_id`, `worker_id`, `addtime`, `lasttime`) VALUES
(1, 'SD201564545645', '测试titleA', 0, 'OKOK', '18800011000', '288.88', '100.00', '28888.00', 1, 0, 1470000000, 0),
(2, 'SD201554545645', '测试titleB', 0, 'OKOK', '18800011001', '288.88', '100.00', '28888.00', 1, 1, 1470000000, 0);

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
('65cbddb189774dd545b62df029469e382b1b0afa', '127.0.0.1', 1471490220, '__ci_last_regenerate|i:1471490212;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('b93750528814f33bec864c2537e42d30f6a87133', '127.0.0.1', 1471491055, '__ci_last_regenerate|i:1471490847;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('f27adfbc16638f80851daf284c1464ab21c5c509', '127.0.0.1', 1471493212, '__ci_last_regenerate|i:1471493155;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('0d292df4c8ae3e2f7abfe91e6308372c8c6bc1cc', '127.0.0.1', 1471495288, '__ci_last_regenerate|i:1471495052;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('ff4278e63a33619094958d7123eabfa8bad05f52', '127.0.0.1', 1471495659, '__ci_last_regenerate|i:1471495373;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('66fe0c3b42ac5aabddcfc1dad2447b1f1ca91529', '127.0.0.1', 1471495980, '__ci_last_regenerate|i:1471495748;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('148bf144b3a672a1857b96e7ce4feee2fba2221e', '127.0.0.1', 1471497178, '__ci_last_regenerate|i:1471496926;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('14f588e1b24f8802c91d597b13b7a2abcb4452e4', '127.0.0.1', 1471497724, '__ci_last_regenerate|i:1471497523;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('7e422835bd4e504a3dc7b053c010e63c8024a0a4', '127.0.0.1', 1471497908, '__ci_last_regenerate|i:1471497907;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('afee63e8d18529fb2ce8e777cf855148296056d3', '127.0.0.1', 1471498776, '__ci_last_regenerate|i:1471498506;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('f62cd11731832272bcf1fbaeed7a6ea567a16b6e', '127.0.0.1', 1471499001, '__ci_last_regenerate|i:1471498921;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('b5af92e5cc4605b6b88a283c0dc0371812995398', '127.0.0.1', 1471503284, '__ci_last_regenerate|i:1471501213;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('b628482674c9b1f2a1a49941891ab29d344233c5', '127.0.0.1', 1471503773, '__ci_last_regenerate|i:1471503524;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('b1957948e8a6da67e4e5bb7b0780ff1595840814', '127.0.0.1', 1471503920, '__ci_last_regenerate|i:1471503919;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('9b2c21488a95fe4fbaaf984174298b233e2fec9c', '127.0.0.1', 1471504493, '__ci_last_regenerate|i:1471504268;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('1d34bd47c009ed5ab689d5d9a422eb27ca093293', '127.0.0.1', 1471504995, '__ci_last_regenerate|i:1471504717;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('a1aa7efb256436f4de6d7583ef49e3ec2b0f09af', '127.0.0.1', 1471505406, '__ci_last_regenerate|i:1471505169;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('8dfbae881ffafa601267eadb8cfd2e151916a666', '127.0.0.1', 1471505619, '__ci_last_regenerate|i:1471505555;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('1257801b1bf950307826bb90b08231925f3efbbb', '127.0.0.1', 1471507015, '__ci_last_regenerate|i:1471506736;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('0fc5cd87e84b9a86e3db279bb4143cdf69db8287', '127.0.0.1', 1471507274, '__ci_last_regenerate|i:1471507058;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('ae4bc431ae178fa154e2596913ce8c47119aa5f3', '127.0.0.1', 1471509342, '__ci_last_regenerate|i:1471508690;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";success|s:21:"项目添加成功！";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('536edb630e565a9c27643acb312f38c1a516f3e3', '127.0.0.1', 1471509489, '__ci_last_regenerate|i:1471509342;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('b87597e08661d2c1d82d2792248cf2a6c953c3d0', '127.0.0.1', 1471509955, '__ci_last_regenerate|i:1471509842;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('7bd00bd7afc8e7c85e8364b988610787eb5306a3', '127.0.0.1', 1471511579, '__ci_last_regenerate|i:1471510194;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('95a68add0f5e42aac71f5a477086deac9a5bd989', '127.0.0.1', 1471511829, '__ci_last_regenerate|i:1471511694;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('3be924685c88eed0951aee9d05b9710f3b896bec', '127.0.0.1', 1471512103, '__ci_last_regenerate|i:1471512071;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('e6753aec0158b42bcdd29b16f3a67859d460fb64', '127.0.0.1', 1471512835, '__ci_last_regenerate|i:1471512629;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('de5e53c07b15a1b24c06405e01eea0def22891df', '127.0.0.1', 1471513792, '__ci_last_regenerate|i:1471513358;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";success|s:21:"项目添加成功！";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('fe7651e9ad36c3ae8e3db61bdf2478f8141f4aff', '127.0.0.1', 1471513975, '__ci_last_regenerate|i:1471513792;code|s:4:"2v8d";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471416781";'),
('bbd10a70c0093c0bab1c51c7d351df447fb403da', '127.0.0.1', 1471567959, '__ci_last_regenerate|i:1471567314;code|s:4:"jAbR";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471481330";'),
('0985d3ac040f496274a45bd3ad08f6a3c382b763', '127.0.0.1', 1471568186, '__ci_last_regenerate|i:1471567978;code|s:4:"jAbR";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471481330";'),
('92ae71806d869673c352431277185e6d4bb58844', '127.0.0.1', 1471568721, '__ci_last_regenerate|i:1471568440;code|s:4:"jAbR";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471481330";'),
('5f8db2a60df920413a24b3de06052a64a9c6d888', '127.0.0.1', 1471569982, '__ci_last_regenerate|i:1471568818;code|s:4:"jAbR";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471481330";'),
('adbfb678e80fdd32f3fd286a94af8e5bb7cd6fc7', '127.0.0.1', 1471571347, '__ci_last_regenerate|i:1471570040;code|s:4:"jAbR";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471481330";'),
('324d35b2d48aa0216557625ba5498feffcfa955c', '127.0.0.1', 1471572776, '__ci_last_regenerate|i:1471571412;code|s:4:"jAbR";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471481330";'),
('0e22d57c6eb2133d56950cbcc58e164937bcc9dc', '127.0.0.1', 1471573294, '__ci_last_regenerate|i:1471573103;code|s:4:"jAbR";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471481330";'),
('724ede72e47b5da0df5a4b5d42b82d1be5b02664', '127.0.0.1', 1471574328, '__ci_last_regenerate|i:1471574009;code|s:4:"jAbR";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471481330";success|s:28:"<p>Group details updated</p>";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('d034a0f31e8aaa977dd1d5cb0b5094c7209fce55', '127.0.0.1', 1471574329, '__ci_last_regenerate|i:1471574328;code|s:4:"jAbR";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471481330";'),
('4e8e0170fc4c96a97aa968d2d44581e91310b658', '127.0.0.1', 1471589851, '__ci_last_regenerate|i:1471588407;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";'),
('82794c7b4a60c3a817cb6badf5fba2acfda3cea3', '127.0.0.1', 1471590339, '__ci_last_regenerate|i:1471590035;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";'),
('99093435f722c0888858bde54835cec0a6e78484', '127.0.0.1', 1471592084, '__ci_last_regenerate|i:1471590622;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";success|s:33:"<p>Group created Successfully</p>";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('e3185f29a1005d6e41d3fdddefa4fb72646b5911', '127.0.0.1', 1471592311, '__ci_last_regenerate|i:1471592084;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";'),
('327e04f2178179ce5caed1f96ae01989224b5f8e', '127.0.0.1', 1471592591, '__ci_last_regenerate|i:1471592590;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";'),
('7370352bb19a73831a8b8478df538df4e3820229', '127.0.0.1', 1471594696, '__ci_last_regenerate|i:1471594395;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";success|s:28:"<p>Group details updated</p>";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('c605799bb6537430f9eacab19ca42a8c7f193a7a', '127.0.0.1', 1471594915, '__ci_last_regenerate|i:1471594696;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";'),
('d558e87ad4ee3e41562be6c467ae74107381a423', '127.0.0.1', 1471595249, '__ci_last_regenerate|i:1471595107;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";'),
('a4f9ddd40661a8a8ee5de897f482d6e243bf5c28', '127.0.0.1', 1471596286, '__ci_last_regenerate|i:1471596131;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";'),
('6a47373f410eb51a67175de882ef75f7fa590483', '127.0.0.1', 1471597915, '__ci_last_regenerate|i:1471596689;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";'),
('f5dde0debbf5fe6c6490fda4baeea5afaa8b2252', '127.0.0.1', 1471598720, '__ci_last_regenerate|i:1471598304;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";success|s:25:"<p>账号创建成功</p>";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('0d21bbe546425f1f4641f26764b47f88899909be', '127.0.0.1', 1471599152, '__ci_last_regenerate|i:1471598800;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";success|s:25:"<p>账号创建成功</p>";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('cc9db36f1e20f0d5b7267fb74ba79fe9aab1e984', '127.0.0.1', 1471599856, '__ci_last_regenerate|i:1471599152;code|s:4:"yeVT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471567319";success|s:25:"<p>账号创建成功</p>";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('cfc14e11f8290a7947a7ebbfc931eb8891b24fa9', '127.0.0.1', 1471600252, '__ci_last_regenerate|i:1471599954;code|s:4:"wQy6";identity|s:9:"all-demo1";username|s:9:"all-demo1";email|s:8:"all@b.cc";user_id|s:2:"11";old_last_login|s:1:"0";'),
('3e8f66b958a6a1d4e5b71beb0a1a26a6f6c857b8', '127.0.0.1', 1471600510, '__ci_last_regenerate|i:1471600468;code|s:4:"7RRP";identity|s:9:"all-demo1";username|s:9:"all-demo1";email|s:8:"all@b.cc";user_id|s:2:"11";old_last_login|s:10:"1471599969";'),
('5c90715a7ce631fb6799b7bc3fe264d90b1bb376', '127.0.0.1', 1471601087, '__ci_last_regenerate|i:1471600871;code|s:4:"7RRP";identity|s:9:"all-demo1";username|s:9:"all-demo1";email|s:8:"all@b.cc";user_id|s:2:"11";old_last_login|s:10:"1471599969";'),
('3cc073886372dec9e5239f58169061827a88e9aa', '127.0.0.1', 1471672476, '__ci_last_regenerate|i:1471672401;code|s:4:"Bwry";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471600409";'),
('2c2e41a6a1caaead9e2998430a2e4e76e2072cc6', '127.0.0.1', 1471673273, '__ci_last_regenerate|i:1471672825;code|s:4:"Bwry";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471600409";'),
('1dc89a8ee7b4716b0dd2fec80fddeae6dce18481', '127.0.0.1', 1471687850, '__ci_last_regenerate|i:1471687840;code|s:4:"qCj2";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471672450";'),
('c335fe6b8209df22500a1be63f75255e37413e3a', '127.0.0.1', 1471688918, '__ci_last_regenerate|i:1471688918;code|s:4:"qCj2";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471672450";'),
('ce04cfe25b9352a32159bf80dc30edaa9421e17c', '127.0.0.1', 1471698578, '__ci_last_regenerate|i:1471698363;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('df3325afb80434c134ee2c57d3557de4e75a119f', '127.0.0.1', 1471698759, '__ci_last_regenerate|i:1471698691;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('17a60ab79f8866a8b26e398fd3cb9c2a64570292', '127.0.0.1', 1471701279, '__ci_last_regenerate|i:1471701249;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('857046182853e133b902c7b9e4759274a7ca054c', '127.0.0.1', 1471702028, '__ci_last_regenerate|i:1471701787;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('8dd30687c0bfda2fad5837ab76ea15f63f5eb5cb', '127.0.0.1', 1471702722, '__ci_last_regenerate|i:1471702620;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('840882a70df6205883183380d6bc8baab5d5635d', '127.0.0.1', 1471703433, '__ci_last_regenerate|i:1471703133;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('a1478523f750526029e4b58368582bd0c8950663', '127.0.0.1', 1471703834, '__ci_last_regenerate|i:1471703556;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('7e5a31cc793f8a3c10947f5185a123230bc6e87e', '127.0.0.1', 1471704977, '__ci_last_regenerate|i:1471704545;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('a7408e17bf21b15d67e20c93c68df1175afdfc41', '127.0.0.1', 1471705398, '__ci_last_regenerate|i:1471705006;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('a853354770584e06c92db0978ba16a957262356f', '127.0.0.1', 1471705427, '__ci_last_regenerate|i:1471705402;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('3f7f14f4829c8d1411a78b52ba4261703303f42b', '127.0.0.1', 1471706060, '__ci_last_regenerate|i:1471705995;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('bc154190beeb812558eb393567f2a9b85641dbef', '127.0.0.1', 1471707629, '__ci_last_regenerate|i:1471707348;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('3b8d01a125f54b996e5907221b554e4d79ec3b7b', '127.0.0.1', 1471707734, '__ci_last_regenerate|i:1471707718;code|s:4:"A58N";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471687844";'),
('9b4d4ee4f6b9bfc101abd419ea63bf07aa7ecabc', '127.0.0.1', 1471742855, '__ci_last_regenerate|i:1471742294;code|s:4:"VFhn";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471698367";'),
('2730873e26bed97f63053ed2db816d1487a6bf65', '127.0.0.1', 1471742901, '__ci_last_regenerate|i:1471742900;code|s:4:"VFhn";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471698367";'),
('609c2400db1641c87ac95bc4137572f7a0a9e5c8', '127.0.0.1', 1471752287, '__ci_last_regenerate|i:1471752251;code|s:4:"xadF";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471742299";'),
('5286c8722ca54443e27c77ec98ec9646412bce01', '127.0.0.1', 1471755424, '__ci_last_regenerate|i:1471755141;code|s:4:"GfsJ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:1:"0";error_permission|s:46:"未被授权访问该页面 [error/permission]";__ci_vars|a:1:{s:16:"error_permission";s:3:"old";}'),
('c86877d0473a4e61cab215ac1ed8188226e940c1', '127.0.0.1', 1471755729, '__ci_last_regenerate|i:1471755442;code|s:4:"GfsJ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:1:"0";error_permission|s:46:"未被授权访问该页面 [error/permission]";__ci_vars|a:1:{s:16:"error_permission";s:3:"new";}'),
('7cf85d9704b748c5977e4af04b7e627bbdce7502', '127.0.0.1', 1471756033, '__ci_last_regenerate|i:1471755748;code|s:4:"GfsJ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:1:"0";'),
('ec757ed84d877a2cd47d03fadadbb8e85ed3ff05', '127.0.0.1', 1471756359, '__ci_last_regenerate|i:1471756075;code|s:4:"GfsJ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:1:"0";error_permission|s:51:"未被授权访问该页面 [auth/permission/index]";__ci_vars|a:1:{s:16:"error_permission";s:3:"new";}'),
('14875f24fd6486cb44c849990a8c9d8f2159329d', '127.0.0.1', 1471772879, '__ci_last_regenerate|i:1471772583;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";error_permission|s:46:"未被授权访问该页面 [article/category]";__ci_vars|a:1:{s:16:"error_permission";s:3:"new";}'),
('e306bcee1899133380d20e1364f02ef4018627e4', '127.0.0.1', 1471773580, '__ci_last_regenerate|i:1471773295;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";error_permission|s:46:"未被授权访问该页面 [article/category]";__ci_vars|a:1:{s:16:"error_permission";s:3:"old";}'),
('c2f186d35e28548105754cff53dee732c58dd380', '127.0.0.1', 1471773719, '__ci_last_regenerate|i:1471773665;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";error_permission|s:45:"未被授权访问该页面 [auth/permission]";__ci_vars|a:1:{s:16:"error_permission";s:3:"old";}'),
('4c4aa15204736f10a38e8bbff7e7fb9c417902ec', '127.0.0.1', 1471774244, '__ci_last_regenerate|i:1471774098;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";error_permission|s:41:"未被授权访问该页面 [setting/api]";__ci_vars|a:1:{s:16:"error_permission";s:3:"old";}'),
('fd6a6597b5137448bafc18e67a0be64efba365ee', '127.0.0.1', 1471774813, '__ci_last_regenerate|i:1471774530;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";error_permission|s:45:"未被授权访问该页面 [auth/permission]";__ci_vars|a:1:{s:16:"error_permission";s:3:"old";}'),
('0557a1c085f141ad013dad5ddc98b1164e5d43aa', '127.0.0.1', 1471775246, '__ci_last_regenerate|i:1471775019;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";error_permission|s:46:"未被授权访问该页面 [article/category]";__ci_vars|a:1:{s:16:"error_permission";s:3:"old";}'),
('1ab8a12481b97b5d373787c9ce9dc0c8b92784ea', '127.0.0.1', 1471775642, '__ci_last_regenerate|i:1471775343;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";error_permission|s:50:"未被授权访问该页面 <br> [auth/permission]";__ci_vars|a:1:{s:16:"error_permission";s:3:"old";}'),
('1f4e1b4548f8ad5eaca248f7e70f6264b78e2364', '127.0.0.1', 1471776244, '__ci_last_regenerate|i:1471775652;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";error_permission|s:60:"未被授权访问该页面 <br> [project/investing/applied]";__ci_vars|a:1:{s:16:"error_permission";s:3:"old";}'),
('676b06081332798485a04b5facf30042b77406c8', '127.0.0.1', 1471777311, '__ci_last_regenerate|i:1471776509;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";'),
('f488e923b0df41d3e2cdf583f6bced8177a711d2', '127.0.0.1', 1471777537, '__ci_last_regenerate|i:1471777319;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";'),
('24de1a6a0b2b72a962793aad14564edf0b84d305', '127.0.0.1', 1471778228, '__ci_last_regenerate|i:1471778105;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";ajax_permission|s:60:"未被授权访问该页面 <br> [project/investing/applied]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('793ea9d7223e5e3526c9a47c32d289a1633e85cf', '127.0.0.1', 1471780745, '__ci_last_regenerate|i:1471778408;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";ajax_permission|s:60:"未被授权访问该页面 <br> [project/investing/applied]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('faaa14c48480984dd96814037277a93d593a23d4', '127.0.0.1', 1471781045, '__ci_last_regenerate|i:1471780756;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";ajax_permission|s:60:"未被授权访问该页面 <br> [project/investing/applied]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('2a4941078d37269d88a432887cc3246379ee9f1f', '127.0.0.1', 1471781336, '__ci_last_regenerate|i:1471781060;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";'),
('8a9df1eefe5d8b6ec146adaf2a2ba4dd8167a01a', '127.0.0.1', 1471781947, '__ci_last_regenerate|i:1471781393;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";ajax_permission|s:60:"未被授权访问该页面 <br> [project/investing/applied]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('db0df05e1b94abdb1aefad80d226acdde0a5a85d', '127.0.0.1', 1471782262, '__ci_last_regenerate|i:1471781964;code|s:4:"VKVV";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471755165";ajax_permission|s:60:"未被授权访问该页面 <br> [project/investing/applied]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('2f68122898f90a5a99ec367cb2a41f4afcf6573d', '127.0.0.1', 1471782563, '__ci_last_regenerate|i:1471782269;code|s:4:"TvH2";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471752253";'),
('050019661ab29821ad383a292d979120fd20466a', '127.0.0.1', 1471783498, '__ci_last_regenerate|i:1471783224;code|s:4:"TvH2";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471752253";'),
('983053722209a8206c76a96be3f8c02f0fd7c117', '127.0.0.1', 1471783848, '__ci_last_regenerate|i:1471783783;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";ajax_permission|s:60:"未被授权访问该页面 <br> [project/investing/applied]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('9f3b267ce117485be8c401fc0a0ce0d0ad0d0d45', '127.0.0.1', 1471784399, '__ci_last_regenerate|i:1471784352;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('17a64c695835f39ed5417860b962edcf0d269e00', '127.0.0.1', 1471784790, '__ci_last_regenerate|i:1471784682;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('02a6bbd4675776b9b6a43579b3328031c886de52', '127.0.0.1', 1471785339, '__ci_last_regenerate|i:1471785290;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('a982ee60e76b642449af25319a01b703e58a7c9d', '127.0.0.1', 1471785932, '__ci_last_regenerate|i:1471785679;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('94db0e8ec6d1855d343988736543c8787ff252d2', '127.0.0.1', 1471787369, '__ci_last_regenerate|i:1471786219;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('0bb582e0d913de04036cd6d0181d7844f19da395', '127.0.0.1', 1471786651, '__ci_last_regenerate|i:1471786580;code|s:4:"NEEz";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:1:"0";'),
('60c865e3871ad5144d97c1a0da10f9b6278bf89f', '127.0.0.1', 1471787176, '__ci_last_regenerate|i:1471787175;code|s:4:"NEEz";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:1:"0";'),
('76a42939b60c114e52e3e5a0537eca2051b69136', '127.0.0.1', 1471788387, '__ci_last_regenerate|i:1471787764;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('d262f1ad78305bb02fa89941c6ae5583db6df296', '127.0.0.1', 1471788907, '__ci_last_regenerate|i:1471788585;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('4e0bc86cbba81e57307ea6443daf24dddee5ac80', '127.0.0.1', 1471789613, '__ci_last_regenerate|i:1471788916;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('742f6c51211a870da5cb05ec9d33d8b5495faa30', '127.0.0.1', 1471790093, '__ci_last_regenerate|i:1471789828;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('747ced704cdcafae85f9bac447839b4c869c0d2e', '127.0.0.1', 1471790390, '__ci_last_regenerate|i:1471790141;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('122bf7869b45378bf138d809a43cc317f04990c2', '127.0.0.1', 1471790602, '__ci_last_regenerate|i:1471790497;code|s:4:"yf8v";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471772618";'),
('162786dc7f6f9b18767d85224bf40bc4a34ad520', '127.0.0.1', 1471826300, '__ci_last_regenerate|i:1471826298;code|s:4:"5tuq";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471782279";'),
('ec37f0957bb98330581c44c540e481e906eab42f', '127.0.0.1', 1471827737, '__ci_last_regenerate|i:1471827457;code|s:4:"5tuq";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471782279";'),
('5c12ae70fd0b26f480a2b539150779576977fed4', '127.0.0.1', 1471827780, '__ci_last_regenerate|i:1471827769;code|s:4:"5tuq";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471782279";'),
('daf1020101251acba84209a1480b48811a95cbf0', '127.0.0.1', 1471828756, '__ci_last_regenerate|i:1471828662;code|s:4:"3pRy";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471783801";'),
('3f3cb18b3b0976539149b84770fe4e4587cabc24', '127.0.0.1', 1471829046, '__ci_last_regenerate|i:1471829046;code|s:4:"3pRy";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471783801";'),
('ef0cb63d51a1fcaf346bfdd6596d435a1e51038b', '127.0.0.1', 1471829387, '__ci_last_regenerate|i:1471829367;code|s:4:"TpFJ";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471786595";'),
('6f9650604e62d143c46a8b0c5446de718cbe4f54', '127.0.0.1', 1471829886, '__ci_last_regenerate|i:1471829484;code|s:4:"3pRy";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471783801";'),
('8b1d092b583dfa1ddbed61a3e041e4c17d8ea780', '127.0.0.1', 1471829956, '__ci_last_regenerate|i:1471829956;code|s:4:"TpFJ";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471786595";'),
('c8b13a7948db7f90fbd76042ddb7799a2cde9e39', '127.0.0.1', 1471837698, '__ci_last_regenerate|i:1471837396;code|s:4:"2NnP";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471828681";ajax_permission|s:60:"未被授权访问该页面 <br> [project/investing/applied]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('c608ff335ab39fec629753b8f369f2717cdc8b56', '127.0.0.1', 1471837704, '__ci_last_regenerate|i:1471837413;code|s:4:"nefX";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471829383";current_price|s:6:"287.35";__ci_vars|a:1:{s:13:"current_price";s:3:"new";}'),
('829afef13a79607c961d11a93c88057b85969045', '127.0.0.1', 1471838005, '__ci_last_regenerate|i:1471837727;code|s:4:"nefX";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471829383";current_price|s:6:"288.39";__ci_vars|a:1:{s:13:"current_price";s:3:"new";}'),
('ffa4026b92e61fcced92db701fe261962e9fa97a', '127.0.0.1', 1471838204, '__ci_last_regenerate|i:1471838040;code|s:4:"nefX";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471829383";current_price|s:6:"288.15";__ci_vars|a:1:{s:13:"current_price";s:3:"new";}'),
('2283c82a7dabef1d71d058545fad797782d32e2f', '127.0.0.1', 1471838457, '__ci_last_regenerate|i:1471838228;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";current_price|s:6:"287.84";__ci_vars|a:1:{s:13:"current_price";s:3:"new";}'),
('0f3058c6c5db3511a7946ac1a228dd3c6291698b', '127.0.0.1', 1471840633, '__ci_last_regenerate|i:1471840367;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";current_price|s:19:"p3GpB7ur7kFIQIoTCvU";__ci_vars|a:1:{s:13:"current_price";i:1471841833;}'),
('8e4046035845ce69623ec94dd6e61efc381aa688', '127.0.0.1', 1471841120, '__ci_last_regenerate|i:1471840951;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";current_price|s:19:"9iH0Vbysu09IQIUTCvQ";__ci_vars|a:1:{s:13:"current_price";i:1471842256;}'),
('6a4e4083e1aee07766f2c4f5f55f558e2a90e12c', '127.0.0.1', 1471842223, '__ci_last_regenerate|i:1471841849;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";current_price|s:19:"8HKsAr2r7hVIQIsTC/0";success|s:21:"项目添加成功！";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('d16cc6c588e542e56f618b7d47c5d9edb6518d44', '127.0.0.1', 1471848376, '__ci_last_regenerate|i:1471842223;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";current_price|s:19:"9iH0Vbysu09IQIUTCvQ";__ci_vars|a:3:{s:13:"current_price";i:1471849576;s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"bGYs1H8B";csrfvalue|s:20:"crQgPxTvLyAmfY8uX7Oj";'),
('fd82b6435ded31c00fe89b3b051fdda1e82efafa', '127.0.0.1', 1471848609, '__ci_last_regenerate|i:1471848390;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";current_price|N;__ci_vars|a:1:{s:13:"current_price";i:1471849764;}'),
('5da25f30388bb0ac3727c64907f2c77392ac7d0f', '127.0.0.1', 1471849264, '__ci_last_regenerate|i:1471848965;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";current_price|N;__ci_vars|a:1:{s:13:"current_price";i:1471850447;}'),
('32d96535d1f70c72f4e992e2a5f15bd49880e1f5', '127.0.0.1', 1471850325, '__ci_last_regenerate|i:1471850048;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";current_price|s:19:"p3GpB7ur7kFIQIoTCvU";__ci_vars|a:1:{s:13:"current_price";i:1471851440;}'),
('4fe28e9f8a262fccf5f36fa4746c709cc020b420', '127.0.0.1', 1471852111, '__ci_last_regenerate|i:1471850443;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"TPbMwQjJ";csrfvalue|s:20:"XwRf3MNeZIbahUlPT81p";'),
('d5ed1f38163aef3e9bf686b4a44a0312c59c2c1c', '127.0.0.1', 1471851065, '__ci_last_regenerate|i:1471850970;code|s:4:"RQjt";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471826299";'),
('0f48fd326acb414b15122f5304fe80ba18e40f1f', '127.0.0.1', 1471855375, '__ci_last_regenerate|i:1471852148;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";csrfkey|s:8:"yZgBL4kl";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"SDTO0d1yuJZ5EXx4Bz6e";'),
('aa642fd7ab23fd5f2ee0e17984b295bb1b9aeadc', '127.0.0.1', 1471862284, '__ci_last_regenerate|i:1471856760;code|s:4:"shVa";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471837429";csrfkey|s:8:"aw9nFM7Y";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"GOHUYuP4ZLtQrFqbElwj";'),
('5c9f929b1e233719df9e07d02be63d735f913a09', '127.0.0.1', 1471862332, '__ci_last_regenerate|i:1471859629;code|s:4:"HQwK";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471837398";csrfkey|s:8:"iSPtDJmM";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"NVXkOdMuJZ3Y98C6mnEL";'),
('510408d123d7fdb0e1d07349a89d32b77327558a', '127.0.0.1', 1471862774, '__ci_last_regenerate|i:1471862356;code|s:4:"HQwK";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471837398";csrfkey|s:8:"lGL72rfF";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"eHqLI2WwQyu3598kmgsZ";');

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
(1, 'admin-root', '管理员', 'public/images/avatar/121034209220f1.jpg', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', NULL, 1469999823, 1471850991, '127.0.0.1', 1, ''),
(2, 'zhujingxiu', '朱景修', NULL, '$2y$08$QQOBCnHUhFTH/CjeWztJGOOfAz2xuqSki7P2qn5/WojZQvXc10NAK', NULL, 'zhujingxiu@hotmail.com', NULL, 1470736567, 1470736771, '127.0.0.1', 1, '18850911766'),
(3, 'jingli-demo1', '经理测试A', NULL, '$2y$08$k1dyXUI7CRYqc/CpH9UT0ONk93y3sP7EQ5Jdcr/lvOoUE4Tob05Oe', NULL, 'a@a.c', NULL, 1471598448, 1471859647, '127.0.0.1', 1, ''),
(4, 'jingli-demo2', '经理测试B', NULL, '$2y$08$1gGt5kfd2/S0WGDZNt6PMu8bj1WBhiww4AgNx4TJSRrJaiQ7jV4gu', NULL, 'a@a.cc', NULL, 1471598720, 0, '127.0.0.1', 1, ''),
(5, 'dengji-demo1', '登记测试A', NULL, '$2y$08$YHzCZKpn3DYoZWYfE4UD4.7KSke2QaVc5Ou04ljhRNZn5sDqc7QF2', NULL, 'b@a.cc', NULL, 1471598889, 1471838237, '127.0.0.1', 1, ''),
(6, 'dengji-demo2', '录单测试B', NULL, '$2y$08$7JByOlb/P/L.c8P.mqeMX.N7qSiLGBWyx3YWA44wUDkAMY0rGKtQS', NULL, 'ludan@b.cc', NULL, 1471598958, 0, '127.0.0.1', 1, ''),
(7, 'kuguan-demo1', '库管测试A', NULL, '$2y$08$SuuFWJ0sZL2z.SZDLaTX3Od/bkVZ04Ax1fc1SmDtoVf8X0XjuRuJO', NULL, 'kuguan@bb.c', NULL, 1471599005, 0, '127.0.0.1', 1, ''),
(8, 'kuguan-demo2', '库管测试B', NULL, '$2y$08$18MwNqHD5QKE/M2xcF4NXuLScN67KrGQfBCfXPEEEM/W5PNC/5/5G', NULL, 'kuguan@a.cc', NULL, 1471599054, 0, '127.0.0.1', 1, ''),
(9, 'jianding-demo1', '鉴定人A', NULL, '$2y$08$GqumJcWGIEa25v1OB3i5M.k8Vgxg99kuKXpGsUs5ZzQiUIp.Qer5G', NULL, 'jianding@g.cc', NULL, 1471599152, 0, '127.0.0.1', 1, ''),
(10, 'jianding-demo2', '鉴定人B', NULL, '$2y$08$kPYhqg2giK0IhN5v6WS4WuMQvXq0m0gpF6Cx.xAR4..dsxS9UmNDG', NULL, 'admin@admin.com', NULL, 1471599225, 0, '127.0.0.1', 1, ''),
(11, 'all-demo1', '综合账户', NULL, '$2y$08$bnDehV48c1sDsmwPNmmTHOdMMxUE1MHNGItvkmvL7CC2G20doVhcq', NULL, 'all@b.cc', NULL, 1471599856, 1471600479, '127.0.0.1', 1, '');

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
(2, 'members', '未分组', 0, '2997,2999,3001,3003,2998,3000,3002', 1),
(3, 'manager', '经理', 1, '5,6,7,8,9,10,11,22,23,24,25,26,27,33,35,30,3,2,1,49,52,51,50,48,55,58,59,62,63,66,67,68,70,77,78,83,84,85', 1),
(4, 'warehouser', '库管', 0, '55,70,82,81,65,64,60,61,86,87,3,2,1', 1),
(5, 'appraiser', '鉴定人', 0, '74,73,70,1,3,2', 1),
(6, 'booker', '登记人', 0, '55,57,70,72,1,3,2,93', 1);

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
(20, 1, 1),
(3, 2, 2),
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
(24, 11, 6);

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
-- Indexes for table `gd_customer`
--
ALTER TABLE `gd_customer`
  ADD PRIMARY KEY (`customer_id`);

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
-- Indexes for table `gd_project_recycling`
--
ALTER TABLE `gd_project_recycling`
  ADD PRIMARY KEY (`project_id`);

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
-- 使用表AUTO_INCREMENT `gd_customer`
--
ALTER TABLE `gd_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `node_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- 使用表AUTO_INCREMENT `gd_project`
--
ALTER TABLE `gd_project`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `gd_project_investing`
--
ALTER TABLE `gd_project_investing`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `gd_project_investing_history`
--
ALTER TABLE `gd_project_investing_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `gd_project_investing_status`
--
ALTER TABLE `gd_project_investing_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `gd_project_recycling`
--
ALTER TABLE `gd_project_recycling`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
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
