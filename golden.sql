-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 �?08 �?29 �?00:07
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
-- 表的结构 `gd_customer`
--

CREATE TABLE IF NOT EXISTS `gd_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `idnumber` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `wechat` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `referrer` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

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
(26, '2016-08-28', 'Au99.99', '沪金99', '284.89', 1472400119);

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
('2016-08-26', 'Au(T+D)', '黄金延期', '284.48', '285.30', '287.90', '283.52', '-0.05', '284.61', '58702.0000', 1472227080, 1472400392),
('2016-08-26', 'mAu(T+D)', '迷你黄金延期', '284.52', '285.15', '287.98', '283.60', '-0.08', '284.75', '6241.6000', 1472227080, 1472400392),
('2016-08-26', 'Au99.99', '沪金99', '284.52', '285.20', '287.28', '284.00', '-0.13', '284.89', '182.4800', 1472227034, 1472400392),
('2016-08-26', 'Au(T+N2)', '延期双金', '285.20', '286.00', '288.50', '284.55', '0.09', '284.95', '133.8000', 1472227050, 1472400392),
('2016-08-26', 'Au(T+N1)', '延期单金', '287.00', '286.05', '289.45', '286.05', '0.00', '287.00', '71.2000', 1472226948, 1472400392),
('2016-08-26', 'Au100g', '沪金100G', '285.00', '286.20', '287.55', '284.20', '0.05', '284.86', '8.2000', 1472227064, 1472400392),
('2016-08-26', 'Au99.95', '沪金95', '286.00', '268.99', '286.00', '268.99', '0.53', '284.49', '4.0000', 1472226380, 1472400392),
('2016-08-26', 'Pt99.95', '沪铂95', '0.00', '0.00', '0.00', '0.00', '0.00', '245.51', '0.0000', 1472226801, 1472400392),
('2016-08-26', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '282.53', '0.0000', 1472213695, 1472400392),
('2016-08-26', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1472211631, 1472400392),
('2016-08-26', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '283.98', '0.0000', 1472227080, 1472400392);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=96 ;

--
-- 转存表中的数据 `gd_node`
--

INSERT INTO `gd_node` (`node_id`, `mode`, `parent_id`, `level`, `name`, `title`, `path`, `status`, `auth`, `sort`, `note`) VALUES
(1, 'auth', 0, 1, 'tool', '小工具', '', 1, 1, 0, NULL),
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
(52, 'auth', 48, 1, 'get_info', '获取文章信息', 'article/article/get_info', 1, 1, 0, ''),
(53, 'auth', 0, 1, 'project', '项目管理', 'project', 1, 1, 0, ''),
(54, 'auth', 53, 1, 'investing', '钱生金', 'project/investing', 1, 1, 0, ''),
(55, 'auth', 54, 1, 'index', '读取钱生金项目列表', 'project/investing/index', 1, 1, 0, ''),
(57, 'auth', 54, 1, 'applied', '添加项目', 'project/investing/booked', 1, 1, 0, ''),
(59, 'auth', 54, 1, 'checked', '核实项目信息', 'project/investing/checked', 1, 1, 0, ''),
(61, 'auth', 54, 1, 'confirmed', '库管确认', 'project/investing/confirmed', 1, 1, 0, ''),
(63, 'auth', 54, 1, 'applied', '申请取金', 'project/investing/applied', 1, 1, 0, ''),
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
(93, 'auth', 54, 1, 'update', '编辑项目', 'project/investing/update', 1, 1, 0, ''),
(94, 'auth', 54, 1, 'terminated', '终止项目', 'project/investing/terminated', 1, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_apply`
--

CREATE TABLE IF NOT EXISTS `gd_project_apply` (
  `apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `weight` decimal(11,2) NOT NULL DEFAULT '0.00',
  `mode` enum('taking','order') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'taking',
  `note` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`apply_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `gd_project_apply`
--

INSERT INTO `gd_project_apply` (`apply_id`, `project_id`, `weight`, `mode`, `note`, `status`, `worker_id`, `addtime`) VALUES
(1, 7, '6.00', 'taking', NULL, 1, 3, 1472399968);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_investing`
--

CREATE TABLE IF NOT EXISTS `gd_project_investing` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `total` decimal(11,2) NOT NULL DEFAULT '0.00',
  `note` text COLLATE utf8_unicode_ci,
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  `status_id` tinyint(1) NOT NULL DEFAULT '0',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `locker` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `gd_project_investing`
--

INSERT INTO `gd_project_investing` (`project_id`, `project_sn`, `customer_id`, `realname`, `phone`, `idnumber`, `wechat`, `referrer`, `price`, `weight`, `amount`, `period`, `start`, `end`, `total`, `note`, `is_del`, `status_id`, `worker_id`, `addtime`, `lasttime`, `locker`) VALUES
(1, 'SD20156454564522', 0, 'OKOK', '18800011000', NULL, NULL, NULL, '288.88', '100.00', '28888.00', 6, NULL, NULL, '0.00', NULL, 0, 1, 0, 1470000000, 0, 0),
(2, 'SD20155454564511', 0, '林木森', '18800011001', '599455198505050808', '', '', '288.88', '100.00', '28888.00', 1, '2016-08-01', '2016-08-31', '101.50', 'hh', 0, 2, 3, 1470000000, 1472384841, 0),
(3, '1608188031093542', 0, '朱景修', '18850911111', '321324200808080415', '', 'XX', '287.35', '10.00', '2873.50', 3, NULL, NULL, '10.15', 'sadsadsadsa', 0, 7, 3, 1471509342, 1472392903, 0),
(4, '1608188261053809', 0, '朱景修', '13813801380', '321325199902024510', '', '', '287.98', '100.00', '28798.00', 12, NULL, NULL, '106.00', '&lt;p&gt;okok&lt;/p&gt;', 0, 1, 3, 1471509489, 1472048310, 0),
(5, '1608181371034554', 0, '沈万三', '18888888888', '325326150008080808', '', '', '287.35', '1000000.00', '287350000.00', 12, NULL, NULL, '1060000.00', '去问问企鹅完全', 1, 1, 3, 1471509954, 1472289031, 0),
(6, '1608186671184447', 0, '赵公明', '15815801580', '321324198808080808', '', '', '287.35', '10.00', '2873.50', 3, '2016-08-18', '2016-11-17', '10.15', '', 0, 3, 7, 1471513487, 1472388755, 0),
(7, '1608183471764952', 0, '马晓云', '13913901390', '500250196606080806', '', '', '287.35', '10.00', '2873.50', 3, '2016-08-18', '2016-11-17', '10.15', 'sadsadsa', 0, 3, 3, 1471513792, 1472399968, 0),
(8, '1608222241360343', 0, '朱景修', '18850911766', '321324155010254569', '', '', '286.80', '12.00', '3441.60', 9, NULL, NULL, '12.72', '&lt;p&gt;asdasdsadsa&lt;/p&gt;', 0, 1, 5, 1471842223, 1471856775, 0),
(9, '1608229881435008', 0, '朱景修', '18850911766', '321245198905080904', '', '', '290.00', '100.00', '29000.00', 6, '2016-08-22', '2017-02-21', '106.00', '', 0, 2, 3, 1471848608, 1472386688, 0),
(10, '1608229951425621', 0, '朱景修', '18850911766', '321245198905080904', '', '', '289.67', '100.00', '28967.00', 3, NULL, NULL, '106.00', '', 0, 1, 5, 1471848981, 1471856834, 0),
(11, '1608225151495752', 0, '陈国', '13001023005', '321245198905080904', '', '', '289.67', '12.00', '3476.04', 6, NULL, NULL, '12.72', '&lt;p&gt;asdsadsaxzcxz&lt;/p&gt;', 0, 1, 5, 1471849072, 1471856820, 0),
(12, '1608222511510103', 0, '陈国', '18850911766', '321245198905080904', '', '', '288.39', '12.00', '3460.68', 12, '2016-08-22', '2017-08-21', '12.72', '', 0, 2, 3, 1471849263, 1472386760, 0),
(13, '1608252211011343', 0, '朱景修', '18850911223', '321324196606060606', '', '', '288.15', '12.00', '3457.80', 12, '2016-08-25', '2017-08-24', '12.72', 'sadsadsadsadsadsadsa', 0, 2, 3, 1472091223, 1472289668, 0),
(14, '1608272541144202', 0, '华大妈', '13316618899', '110120199909090909', '', '', '284.52', '1000.00', '284520.00', 12, '2016-08-27', '2017-08-26', '1060.00', '&lt;p&gt;撒打算打算的撒&lt;/p&gt;', 0, 2, 4, 1472269322, 1472278417, 0),
(15, '1608281632155533', 0, '测试', '13344556677', '234123198709089876', '', '', '284.52', '100.00', '28452.00', 12, '2016-08-28', '2017-08-27', '106.00', 'asdsdd', 0, 2, 3, 1472392533, 1472392834, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `gd_project_investing_history`
--

INSERT INTO `gd_project_investing_history` (`history_id`, `project_id`, `status_id`, `note`, `request`, `worker_id`, `addtime`, `ip`) VALUES
(1, 3, 1, '', NULL, 1, 1471509342, NULL),
(2, 4, 1, '', NULL, 1, 1471509489, NULL),
(3, 5, 1, '', NULL, 1, 1471509954, '127.0.0.1'),
(4, 6, 1, '', NULL, 1, 1471513487, '127.0.0.1'),
(5, 7, 1, '', NULL, 1, 1471513792, '127.0.0.1'),
(10, 12, 1, '&lt;p&gt;22222&lt;/p&gt;', NULL, 5, 1471849263, '127.0.0.1'),
(11, 8, 1, '&lt;p&gt;asdasdsadsa&lt;/p&gt;', NULL, 5, 1471856775, '127.0.0.1'),
(12, 11, 1, '&lt;p&gt;asdsadsaxzcxz&lt;/p&gt;', NULL, 5, 1471856820, '127.0.0.1'),
(13, 10, 1, '', NULL, 5, 1471856834, '127.0.0.1'),
(14, 9, 1, '&lt;p&gt;65465456&lt;/p&gt;', NULL, 5, 1471856884, '127.0.0.1'),
(15, 4, 2, '&lt;p&gt;okok&lt;/p&gt;', NULL, 3, 1472048310, '127.0.0.1'),
(16, 2, 2, '', 'array (\n  ''amount'' =&gt; ''28888.00'',\n  ''_amount'' =&gt; ''28888.00'',\n  ''phone'' =&gt; ''18800011001'',\n  ''_phone'' =&gt; ''18800011001'',\n)', 3, 1472049634, '127.0.0.1'),
(17, 3, 2, '', 'array (\n  ''amount'' =&gt; ''2873.50'',\n  ''_amount'' =&gt; ''2873.50'',\n  ''phone'' =&gt; ''18850911111'',\n  ''_phone'' =&gt; ''18850911111'',\n)', 3, 1472049785, '127.0.0.1'),
(18, 6, 2, '', 'array (\n  ''amount'' =&gt; ''2873.50'',\n  ''_amount'' =&gt; ''2873.50'',\n  ''phone'' =&gt; ''15815801580'',\n  ''_phone'' =&gt; ''15815801580'',\n)', 3, 1472049868, '127.0.0.1'),
(19, 7, 2, '', 'array (\n  ''amount'' =&gt; ''2873.50'',\n  ''_amount'' =&gt; ''2873.50'',\n  ''phone'' =&gt; ''13913901390'',\n  ''_phone'' =&gt; ''13913901390'',\n)', 3, 1472049929, '127.0.0.1'),
(20, 12, 2, '&lt;p&gt;sa&lt;span style=&quot;text-decoration: underline;&quot;&gt;&lt;em&gt;&lt;strong&gt;dasdsagfdhgfhgfhgf&lt;/strong&gt;&lt;/em&gt;&lt;/span&gt;&lt;span style=&quot;text-decoration: none;&quot;&gt; &amp;nbsp;&lt;/span&gt;&lt;span style=&quot;text-decoration: line-through;&quot;&gt;sssssss&lt;/span&gt;&lt;/p&gt;', 'array (\n  ''amount'' =&gt; ''3460.68'',\n  ''_amount'' =&gt; ''3460.68'',\n  ''phone'' =&gt; ''18850911766'',\n  ''_phone'' =&gt; ''18850911766'',\n)', 3, 1472049992, '127.0.0.1'),
(21, 9, 2, '&lt;p&gt;6565461333&lt;/p&gt;', 'array (\n  ''amount'' =&gt; ''29000.00'',\n  ''_amount'' =&gt; ''29000.00'',\n  ''phone'' =&gt; ''18850911766'',\n  ''_phone'' =&gt; ''18850911766'',\n)', 3, 1472085444, '127.0.0.1'),
(22, 13, 1, '&lt;p&gt;是老客户&lt;br/&gt;&lt;/p&gt;', '', 5, 1472091223, '127.0.0.1'),
(23, 5, 7, '数据异常', '', 3, 1472093730, '127.0.0.1'),
(24, 14, 1, '&lt;p&gt;疯狂的中国大妈买了2斤黄金，咱们库存够不够&lt;/p&gt;', '', 6, 1472269322, '127.0.0.1'),
(25, 2, 3, '&lt;p&gt;432432432432432432432&lt;br/&gt;&lt;/p&gt;', 'array (\n  ''weight'' =&gt; ''100.00'',\n  ''_weight'' =&gt; ''100.00'',\n  ''phone'' =&gt; ''18800011001'',\n  ''_phone'' =&gt; ''18800011001'',\n)', 7, 1472276945, '127.0.0.1'),
(26, 9, 3, '', 'array (\n  ''weight'' =&gt; ''100.00'',\n  ''_weight'' =&gt; ''100.00'',\n  ''phone'' =&gt; ''18850911766'',\n  ''_phone'' =&gt; ''18850911766'',\n)', 7, 1472277090, '127.0.0.1'),
(28, 9, 3, '&lt;p&gt;fdsfsdggdgfdgfd&lt;br/&gt;&lt;/p&gt;', 'array (\n  ''weight'' =&gt; ''100.00'',\n  ''_weight'' =&gt; ''100.00'',\n  ''phone'' =&gt; ''18850911766'',\n  ''_phone'' =&gt; ''18850911766'',\n)', 7, 1472277224, '127.0.0.1'),
(29, 14, 2, '&lt;p&gt;管够，管够&lt;/p&gt;', 'array (\n  ''amount'' =&gt; ''284520.00'',\n  ''_amount'' =&gt; ''284520.00'',\n  ''phone'' =&gt; ''13316618899'',\n  ''_phone'' =&gt; ''13316618899'',\n)', 4, 1472277747, '127.0.0.1'),
(30, 14, 2, '&lt;p&gt;撒旦撒旦撒&lt;/p&gt;', 'array (\n  ''amount'' =&gt; ''284520.00'',\n  ''_amount'' =&gt; ''284520.00'',\n  ''phone'' =&gt; ''13316618899'',\n  ''_phone'' =&gt; ''13316618899'',\n)', 4, 1472278195, '127.0.0.1'),
(31, 14, 2, '&lt;p&gt;阿斯顿撒旦撒大&lt;/p&gt;', 'array (\n  ''amount'' =&gt; ''284520.00'',\n  ''_amount'' =&gt; ''284520.00'',\n  ''phone'' =&gt; ''13316618899'',\n  ''_phone'' =&gt; ''13316618899'',\n)', 4, 1472278325, '127.0.0.1'),
(32, 14, 2, '&lt;p&gt;撒打算打算的撒&lt;/p&gt;', 'array (\n  ''amount'' =&gt; ''284520.00'',\n  ''_amount'' =&gt; ''284520.00'',\n  ''phone'' =&gt; ''13316618899'',\n  ''_phone'' =&gt; ''13316618899'',\n)', 4, 1472278417, '127.0.0.1'),
(33, 5, 8, '去问问企鹅完全', '', 3, 1472288961, '127.0.0.1'),
(34, 13, 2, 'sadsadsadsadsadsadsa', 'array (\n  ''amount'' =&gt; ''3457.80'',\n  ''_amount'' =&gt; ''3457.80'',\n  ''phone'' =&gt; ''18850911223'',\n  ''_phone'' =&gt; ''18850911223'',\n)', 3, 1472289668, '127.0.0.1'),
(35, 2, 7, '资料不完整', '', 3, 1472289921, '127.0.0.1'),
(36, 2, 1, '                        资料不完整                    ', '', 6, 1472290004, '127.0.0.1'),
(37, 2, 1, '已更改资料              ', '', 6, 1472290152, '127.0.0.1'),
(38, 2, 2, 'hh', 'array (\n  ''amount'' =&gt; ''28888.00'',\n  ''_amount'' =&gt; ''28888.00'',\n  ''phone'' =&gt; ''18800011001'',\n  ''_phone'' =&gt; ''18800011001'',\n)', 3, 1472384841, '127.0.0.1'),
(39, 9, 2, '', 'array (\n  ''amount'' =&gt; ''29000.00'',\n  ''_amount'' =&gt; ''29000.00'',\n  ''phone'' =&gt; ''18850911766'',\n  ''_phone'' =&gt; ''18850911766'',\n)', 3, 1472386688, '127.0.0.1'),
(40, 12, 2, '', 'array (\n  ''amount'' =&gt; ''3460.68'',\n  ''_amount'' =&gt; ''3460.68'',\n  ''phone'' =&gt; ''18850911766'',\n  ''_phone'' =&gt; ''18850911766'',\n)', 3, 1472386760, '127.0.0.1'),
(41, 7, 2, '', 'array (\n  ''amount'' =&gt; ''2873.50'',\n  ''_amount'' =&gt; ''2873.50'',\n  ''phone'' =&gt; ''13913901390'',\n  ''_phone'' =&gt; ''13913901390'',\n)', 3, 1472387499, '127.0.0.1'),
(42, 6, 2, '', 'array (\n  ''amount'' =&gt; ''2873.50'',\n  ''_amount'' =&gt; ''2873.50'',\n  ''phone'' =&gt; ''15815801580'',\n  ''_phone'' =&gt; ''15815801580'',\n)', 3, 1472387579, '127.0.0.1'),
(43, 6, 3, '', 'array (\n  ''weight'' =&gt; ''10.00'',\n  ''_weight'' =&gt; ''10.00'',\n  ''phone'' =&gt; ''15815801580'',\n  ''_phone'' =&gt; ''15815801580'',\n)', 7, 1472388632, '127.0.0.1'),
(44, 6, 3, '', 'array (\n  ''weight'' =&gt; ''10.00'',\n  ''_weight'' =&gt; ''10.00'',\n  ''phone'' =&gt; ''15815801580'',\n  ''_phone'' =&gt; ''15815801580'',\n)', 7, 1472388755, '127.0.0.1'),
(45, 7, 3, '', 'array (\n  ''weight'' =&gt; ''10.00'',\n  ''_weight'' =&gt; ''10.00'',\n  ''phone'' =&gt; ''13913901390'',\n  ''_phone'' =&gt; ''13913901390'',\n)', 7, 1472388933, '127.0.0.1'),
(46, 15, 1, '撒的撒的撒', '', 5, 1472392533, '127.0.0.1'),
(47, 15, 2, 'asdsdd', 'array (\n  ''amount'' =&gt; ''28452.00'',\n  ''_amount'' =&gt; ''28452.00'',\n  ''phone'' =&gt; ''13344556677'',\n  ''_phone'' =&gt; ''13344556677'',\n)', 3, 1472392834, '127.0.0.1'),
(48, 3, 7, 'sadsadsadsa', '', 3, 1472392903, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_investing_status`
--

CREATE TABLE IF NOT EXISTS `gd_project_investing_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `gd_project_investing_status`
--

INSERT INTO `gd_project_investing_status` (`status_id`, `title`, `code`, `note`, `status`) VALUES
(1, '已登记', 'booked', '登记客户买金信息', 1),
(2, '已核实', 'checked', '上级主管核对客户及库存信息，并确认', 1),
(3, '已确认', 'confirmed', '库管确认并标记', 1),
(4, '已到期', 'expired', '项目到期，生金', 1),
(5, '已申请', 'applied', '申请提金', 1),
(6, '已完结', 'finished', '到期取金，项目完结 （可转到金生金）', 1),
(7, '已驳回', 'refused', '客户信息等问题造成', 1),
(8, '已终止', 'terminated', '客户提前终止项目', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_recycling`
--

CREATE TABLE IF NOT EXISTS `gd_project_recycling` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
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
  `lasttime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `gd_project_recycling_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

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
(8, '已完结', 'finished', '到期取金，项目完结 ', 1),
(9, '已拒绝', 'refused', '客户信息等问题造成', 1),
(10, '已终止', 'terminated', '客户提前终止项目', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_stock`
--

CREATE TABLE IF NOT EXISTS `gd_project_stock` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_sn` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('investing','recycling','stock') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'investing',
  `info` text COLLATE utf8_unicode_ci,
  `weight` decimal(13,2) NOT NULL DEFAULT '0.00',
  `note` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `lasttime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `gd_project_stock`
--

INSERT INTO `gd_project_stock` (`project_id`, `project_sn`, `title`, `mode`, `info`, `weight`, `note`, `status`, `worker_id`, `addtime`, `lasttime`) VALUES
(1, 'SD201564545645', '测试titleA', 'investing', 'OKOK', '0.00', NULL, 1, 0, 1470000000, 0),
(2, 'SD201554545645', '测试titleB', 'investing', 'OKOK', '0.00', NULL, 1, 1, 1470000000, 0),
(3, '1608229881435008', '朱景修:18850911766:100.00', 'investing', 'a:11:{s:10:"project_sn";s:16:"1608229881435008";s:8:"realname";s:9:"朱景修";s:5:"phone";s:11:"18850911766";s:8:"idnumber";s:18:"321245198905080904";s:5:"price";s:6:"290.00";s:6:"weight";s:6:"100.00";s:6:"amount";s:8:"29000.00";s:6:"period";s:2:"12";s:5:"total";s:6:"106.00";s:5:"start";N;s:3:"end";N;}', '100.00', '&lt;p&gt;fdsfsdggdgfdgfd&lt;br/&gt;&lt;/p&gt;', 1, 7, 1472277224, 1472277224),
(4, '1608186671184447', '赵公明:15815801580:10.00', 'investing', 'a:11:{s:10:"project_sn";s:16:"1608186671184447";s:8:"realname";s:9:"赵公明";s:5:"phone";s:11:"15815801580";s:8:"idnumber";s:18:"321324198808080808";s:5:"price";s:6:"287.35";s:6:"weight";s:5:"10.00";s:6:"amount";s:7:"2873.50";s:6:"period";s:1:"3";s:5:"total";s:5:"10.15";s:5:"start";s:10:"2016-08-18";s:3:"end";s:10:"2016-11-17";}', '-10.00', '', 1, 7, 1472388632, 1472388632),
(5, '1608186671184447', '赵公明:15815801580:10.00', 'investing', 'a:11:{s:10:"project_sn";s:16:"1608186671184447";s:8:"realname";s:9:"赵公明";s:5:"phone";s:11:"15815801580";s:8:"idnumber";s:18:"321324198808080808";s:5:"price";s:6:"287.35";s:6:"weight";s:5:"10.00";s:6:"amount";s:7:"2873.50";s:6:"period";s:1:"3";s:5:"total";s:5:"10.15";s:5:"start";s:10:"2016-08-18";s:3:"end";s:10:"2016-11-17";}', '-10.00', '', 1, 7, 1472388755, 1472388755),
(6, '1608183471764952', '马晓云:13913901390:10.00', 'investing', 'a:11:{s:10:"project_sn";s:16:"1608183471764952";s:8:"realname";s:9:"马晓云";s:5:"phone";s:11:"13913901390";s:8:"idnumber";s:18:"500250196606080806";s:5:"price";s:6:"287.35";s:6:"weight";s:5:"10.00";s:6:"amount";s:7:"2873.50";s:6:"period";s:1:"3";s:5:"total";s:5:"10.15";s:5:"start";s:10:"2016-08-18";s:3:"end";s:10:"2016-11-17";}', '-10.00', '', 1, 7, 1472388933, 1472388933);

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
('510408d123d7fdb0e1d07349a89d32b77327558a', '127.0.0.1', 1471862774, '__ci_last_regenerate|i:1471862356;code|s:4:"HQwK";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471837398";csrfkey|s:8:"lGL72rfF";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"eHqLI2WwQyu3598kmgsZ";'),
('ba859381da6284fa31bb3236271da0c850baf66b', '127.0.0.1', 1471873294, '__ci_last_regenerate|i:1471873267;code|s:4:"rv9H";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471850991";'),
('8f6d742f575b8c5cb15540d33ebf9ce323958db3', '127.0.0.1', 1471873850, '__ci_last_regenerate|i:1471873757;code|s:4:"rv9H";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471850991";'),
('801e80598e6950f975da951b574a0e333d9d41c1', '127.0.0.1', 1471874269, '__ci_last_regenerate|i:1471874185;code|s:4:"rv9H";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471850991";'),
('14a2bb74cf3a4d4dc1b903e6546ae1e3adf3119d', '127.0.0.1', 1471874895, '__ci_last_regenerate|i:1471874635;code|s:4:"rv9H";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471850991";'),
('757dbc49fdd61475f60a80626cf731a211d8286a', '127.0.0.1', 1471877110, '__ci_last_regenerate|i:1471875917;code|s:4:"rv9H";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471850991";'),
('65824e051cd82539a2031cb0936f127ee777cce6', '127.0.0.1', 1471878636, '__ci_last_regenerate|i:1471878357;code|s:4:"rv9H";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471850991";'),
('ae8955d7bd6d825f411e0839f0ce87fdbdc922f6', '127.0.0.1', 1471879512, '__ci_last_regenerate|i:1471878766;code|s:4:"rv9H";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471850991";'),
('7b4b80c3fe5222bd57e7c0709e534d5c24170df7', '127.0.0.1', 1471879724, '__ci_last_regenerate|i:1471879529;code|s:4:"rv9H";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471850991";'),
('8a556c4cfe9c2a312194417e227c5ba1bc48f7dd', '127.0.0.1', 1471880088, '__ci_last_regenerate|i:1471879885;code|s:4:"rv9H";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1471850991";'),
('32127e03a50e7f9a412962868c68cbd893922892', '127.0.0.1', 1471966248, '__ci_last_regenerate|i:1471966247;code|s:4:"qTWs";'),
('96527af42c9206abd7885317c1b4f029ab7608d1', '127.0.0.1', 1472041287, '__ci_last_regenerate|i:1472040860;code|s:4:"ZR8E";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471859647";csrfkey|s:8:"sy7QVjPF";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"dxSaGrg8THpKXBfeloF7";'),
('ba1d43ab21b0777da4df45c1986ac44ae841a2d7', '127.0.0.1', 1472041471, '__ci_last_regenerate|i:1472041390;code|s:4:"ZR8E";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471859647";csrfkey|s:8:"82nvWG0u";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"yVdl9XJ7ScIszLxAaTbW";'),
('d3a53744f39ad2c37c97b988ce7b9ddd5baf76e9', '127.0.0.1', 1472042797, '__ci_last_regenerate|i:1472042548;code|s:4:"ZR8E";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471859647";ajax_permission|s:47:"没有访问授权  <br> [setting/project/save]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('dd1f9f308be1358d169eb51c7dfd237a1e36cc78', '127.0.0.1', 1472048310, '__ci_last_regenerate|i:1472043074;code|s:4:"ZR8E";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471859647";success|s:34:"项目1608188261053809已核实！";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('08475cf63692cbb21badbc5af92ed48ecde056fa', '127.0.0.1', 1472047101, '__ci_last_regenerate|i:1472047006;code|s:4:"FfJi";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472040827";'),
('93f82fe82b3482726411e47867ceb6ff7006e2ba', '127.0.0.1', 1472048701, '__ci_last_regenerate|i:1472048311;code|s:4:"ZR8E";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471859647";csrfkey|s:8:"d5xSn82E";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"xpVk4Ugorlm5TKSQZ3y2";'),
('df883459f1ab9fc4103101aa75004d5dc384cd24', '127.0.0.1', 1472049634, '__ci_last_regenerate|i:1472048836;code|s:4:"ZR8E";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471859647";success|s:34:"项目SD20155454564511已核实！";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('e6962834a9d0086afb9daba63b97e4c4e2aff40f', '127.0.0.1', 1472049992, '__ci_last_regenerate|i:1472049635;code|s:4:"ZR8E";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471859647";csrfkey|s:8:"oaTPcVdB";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:7:"success";s:3:"new";}csrfvalue|s:20:"VnxeRDkt1qGcEAPXoL4a";success|s:34:"项目1608222511510103已核实！";'),
('1afbedd4a9b15acf19a723c3426faedcef728d8f', '127.0.0.1', 1472050234, '__ci_last_regenerate|i:1472049993;code|s:4:"ZR8E";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471859647";csrfkey|s:8:"BuMaE7ew";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"pvyYrCRSA8DslWE3VnjL";'),
('a98f78d18242baae8b19656c04d01538283139a6', '127.0.0.1', 1472050708, '__ci_last_regenerate|i:1472050306;code|s:4:"ZR8E";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471859647";csrfkey|s:8:"s1aQTpFJ";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"rnRgxBzd3LWktKyjDIU8";'),
('598421128e319633743b24d33aa784ed1fb8b0ab', '127.0.0.1', 1472051017, '__ci_last_regenerate|i:1472050813;code|s:4:"ZR8E";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1471859647";csrfkey|s:8:"IKj14yb3";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"wFHpBsehqE9Xr7xSPyIG";'),
('f9cc42f5805493a910817ff474e5e3bae6737975', '127.0.0.1', 1472051167, '__ci_last_regenerate|i:1472051150;code|s:4:"bQpq";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:1:"0";'),
('3c9f82f41fd5a13a5cecc00486b98f3159169436', '127.0.0.1', 1472085444, '__ci_last_regenerate|i:1472085140;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";csrfkey|s:8:"hRolOErg";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:7:"success";s:3:"new";}csrfvalue|s:20:"ld09oFkXtYCqHrQ4wLj2";success|s:34:"项目1608229881435008已核实！";'),
('5d87ef91e6b36552a443e30a631f8077a2ca1fda', '127.0.0.1', 1472085539, '__ci_last_regenerate|i:1472085444;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";csrfkey|s:8:"0YctVTqe";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"gtqsiu9oEm3PDZCnldb5";'),
('6d005e5f73d7dfbe24431dbf93d152a53be689f1', '127.0.0.1', 1472085813, '__ci_last_regenerate|i:1472085764;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";'),
('737effdfa46381ded535b0649579b3c0c80e4b8d', '127.0.0.1', 1472086545, '__ci_last_regenerate|i:1472086311;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";csrfkey|s:8:"DN0ivp7n";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"pn2KGkQ89XlbgyqFV3YW";'),
('d2bc52c19b0bfac5a5c38b635ca94a918352b3fe', '127.0.0.1', 1472086807, '__ci_last_regenerate|i:1472086807;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";'),
('f3a7c3712cb661a9f53012d7ea53ee00b7e0356d', '127.0.0.1', 1472090755, '__ci_last_regenerate|i:1472087137;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";csrfkey|s:8:"mv87RxbZ";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"7CDYgNq3xvRXb9PzmJWf";'),
('14c1199698b510c84cfbb585e14d33cdad8b9e38', '127.0.0.1', 1472091008, '__ci_last_regenerate|i:1472090760;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";ajax_permission|s:52:"没有访问授权  <br> [project/investing/applied]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('1902af18798b4ec3891283bcffc1e9f88f6370a0', '127.0.0.1', 1472092426, '__ci_last_regenerate|i:1472091032;code|s:4:"y3du";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471838237";csrfkey|s:8:"wxcp8nUS";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"w7YzZylE3SbfDr9QAnOp";'),
('4402334a4521f08bc810771be378eee018dc7da9', '127.0.0.1', 1472091380, '__ci_last_regenerate|i:1472091068;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";csrfkey|s:8:"Wytiu7Iw";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"r0Gq52lMohFJwWxgj6Ac";'),
('059af2961b037ac8e83e38d8d5017bff7d4cde87', '127.0.0.1', 1472091713, '__ci_last_regenerate|i:1472091382;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";csrfkey|s:8:"bFESgdUN";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"bkeDFu5O7ZjHzwLgStMJ";'),
('45312fd96ebd05c441c32ff35469c8a899bc543d', '127.0.0.1', 1472093730, '__ci_last_regenerate|i:1472091776;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";success|s:42:"项目已驳回！编号: 1608181371034554";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('27f429be411ae8977baa3cf2685a1e9a8529e24c', '127.0.0.1', 1472092601, '__ci_last_regenerate|i:1472092442;code|s:4:"y3du";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1471838237";csrfkey|s:8:"7CSFXBz8";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"JTmP5iXQ8RLGOoUEM6ey";');
INSERT INTO `gd_sessions` (`sess_id`, `ip_address`, `timestamp`, `data`) VALUES
('01e096e7c92e82befe9d6672893a604f35bf064d', '127.0.0.1', 1472093854, '__ci_last_regenerate|i:1472093730;code|s:4:"4EMk";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472040901";'),
('74c001e4891401683b8963bf164bc1006185e803', '127.0.0.1', 1472174190, '__ci_last_regenerate|i:1472173987;code|s:4:"7D3b";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472047016";'),
('9c5e0597de3c24d8c2f18e76cfe0f2fa06476d92', '127.0.0.1', 1472175601, '__ci_last_regenerate|i:1472175601;code|s:4:"eQmp";'),
('c19dccd1082ee49fc3922e3192fa444e6b2ed3fe', '127.0.0.1', 1472176281, '__ci_last_regenerate|i:1472176184;code|s:4:"VmIP";'),
('1d40d4612fbcc0f69353b6e1396c206b534c9c19', '127.0.0.1', 1472176824, '__ci_last_regenerate|i:1472176536;code|s:4:"3zmn";'),
('10fdf68caf9e472ed04bdb5bdcd800c94e7672a5', '127.0.0.1', 1472176956, '__ci_last_regenerate|i:1472176902;code|s:4:"g7Es";'),
('d42bdbee71146a4b7eaa576a5c9834b84113c1b6', '127.0.0.1', 1472177612, '__ci_last_regenerate|i:1472177361;code|s:4:"pd3K";'),
('29f24ae695d97433f592b539a014dd19a051680f', '127.0.0.1', 1472178515, '__ci_last_regenerate|i:1472177817;code|s:4:"I2Np";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472173997";'),
('8640428f019ee8201a4ea8a308aee4fb089671bf', '127.0.0.1', 1472178722, '__ci_last_regenerate|i:1472178515;code|s:4:"I2Np";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472173997";'),
('c2dcf2936cd7e74fdececf15e574d15dc2528110', '127.0.0.1', 1472179108, '__ci_last_regenerate|i:1472178859;code|s:4:"I2Np";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472173997";'),
('731ddcfdfe019a0fbc6580b32f357beb32eca1cb', '127.0.0.1', 1472179453, '__ci_last_regenerate|i:1472179207;code|s:4:"I2Np";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472173997";'),
('f93501f3701dea0a699bb168ba28e532fe53ff86', '127.0.0.1', 1472179768, '__ci_last_regenerate|i:1472179512;code|s:4:"I2Np";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472173997";'),
('63bddd210ee00e04a243287747a95d09e6a5add7', '127.0.0.1', 1472179833, '__ci_last_regenerate|i:1472179833;code|s:4:"I2Np";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472173997";'),
('b358d34b53d6d254097bb72af21b6a6e7912b9d2', '127.0.0.1', 1472179994, '__ci_last_regenerate|i:1472179833;code|s:4:"y3xr";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472178515";'),
('c6aa0d5eef9140ba414f316d980c296acaeb08b7', '127.0.0.1', 1472180366, '__ci_last_regenerate|i:1472180109;code|s:4:"n6hz";'),
('9a8db4f1cf546ea3945dc6269a384dfe4de3a182', '127.0.0.1', 1472180446, '__ci_last_regenerate|i:1472180259;code|s:4:"y3xr";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472178515";'),
('73a78f6e41b23dd26e415b97739a171db864b47b', '127.0.0.1', 1472180528, '__ci_last_regenerate|i:1472180459;code|s:4:"UQYT";'),
('afc2d01112876d06477708020fc3238549b9994f', '127.0.0.1', 1472181193, '__ci_last_regenerate|i:1472180999;code|s:4:"UQYT";'),
('f25600d7452d2e1f50c81aadac9f82caeb67dd04', '127.0.0.1', 1472181763, '__ci_last_regenerate|i:1472181345;code|s:4:"5Nsa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472173888";'),
('a7b9e6cc26dd8e027fbb430c4adc4c153fe5f137', '127.0.0.1', 1472181745, '__ci_last_regenerate|i:1472181531;code|s:4:"y3xr";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472178515";'),
('415d3d2222df2f6524d861085b08a97f43bfbdd9', '127.0.0.1', 1472181921, '__ci_last_regenerate|i:1472181763;code|s:4:"5Nsa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472173888";'),
('729884e0144aa4fb125d82bb384606ab5b030d6c', '127.0.0.1', 1472182273, '__ci_last_regenerate|i:1472182013;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('2e565b218c4a46b7b126c7d0e59ebf39c44c70ad', '127.0.0.1', 1472182190, '__ci_last_regenerate|i:1472182189;code|s:4:"5Nsa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472173888";ajax_permission|s:41:"没有访问授权  <br> [tool/api/price]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('5c58aa28132c771469804eb95115aad752dcf2cd', '127.0.0.1', 1472182594, '__ci_last_regenerate|i:1472182450;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('f993a720887a0b0f3814319156e91f6417440b5b', '127.0.0.1', 1472183030, '__ci_last_regenerate|i:1472182773;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('431a77671a751142944b689c231174fc280f4228', '127.0.0.1', 1472184003, '__ci_last_regenerate|i:1472183715;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('0aa3b3a974ba6557b95cbf1bb87aa6c20c1d13e6', '127.0.0.1', 1472184063, '__ci_last_regenerate|i:1472184063;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('b868d69a3a0ee2423f1d90a4ddf9569e20bbcaea', '127.0.0.1', 1472186512, '__ci_last_regenerate|i:1472186218;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('f65025988df5a65d6af8bc41971d65f348b090a3', '127.0.0.1', 1472186901, '__ci_last_regenerate|i:1472186754;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('00dcb538538444235c45b9159c91a899076ac7b0', '127.0.0.1', 1472188392, '__ci_last_regenerate|i:1472188391;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('baff3d9a3cc57bbaeac7b602c512fd5e6751fc4f', '127.0.0.1', 1472193610, '__ci_last_regenerate|i:1472193453;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('5200fb11c66f11afdea4d29510227df829b8cb15', '127.0.0.1', 1472194072, '__ci_last_regenerate|i:1472193774;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('251b43209749fcd2bf48acc8610f2093611112d9', '127.0.0.1', 1472194098, '__ci_last_regenerate|i:1472194096;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('7c9f3f192192c35daae8fad3e1cd1bdb9c00457a', '127.0.0.1', 1472195748, '__ci_last_regenerate|i:1472194409;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('e2442559926f40e1947f7fa29b7b386b562b5f1e', '127.0.0.1', 1472196187, '__ci_last_regenerate|i:1472195946;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('925de11bee62c64caf7486100cf5baa3f7cf1481', '127.0.0.1', 1472196828, '__ci_last_regenerate|i:1472196512;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('a562dd5d071ba8b5c41d2fb9569c5e2016099a20', '127.0.0.1', 1472198894, '__ci_last_regenerate|i:1472197088;code|s:4:"FJqz";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472179846";'),
('f58f18d2ebf1d5392cfac18b7f749740455449d8', '127.0.0.1', 1472199689, '__ci_last_regenerate|i:1472199047;code|s:4:"sf23";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472182032";'),
('bde5202bbb93fa9f0b4f3a87cad61a432ef75447', '127.0.0.1', 1472200518, '__ci_last_regenerate|i:1472199689;code|s:4:"sf23";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472182032";'),
('f9a1007f102c654e40649f190e097a57000a599c', '127.0.0.1', 1472200854, '__ci_last_regenerate|i:1472200611;code|s:4:"sf23";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472182032";'),
('40f6e8801eac233d78c91fb1e0f136812b8c4afa', '127.0.0.1', 1472206873, '__ci_last_regenerate|i:1472201007;code|s:4:"pn7M";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472199689";'),
('ec5c7ff2a6637299706328a7fd03c240d2e58dbb', '127.0.0.1', 1472201716, '__ci_last_regenerate|i:1472201455;code|s:4:"ZbAS";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472051161";ajax_permission|s:41:"没有访问授权  <br> [tool/api/price]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('ecbd47113bc02b1ac6ea85588afadc3067a554f4', '127.0.0.1', 1472202888, '__ci_last_regenerate|i:1472201780;code|s:4:"ZbAS";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472051161";ajax_permission|s:41:"没有访问授权  <br> [tool/api/price]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('c5c5fc7168f85e5d81269ebaa252ad2cb52751e1', '127.0.0.1', 1472204608, '__ci_last_regenerate|i:1472202993;code|s:4:"ZbAS";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472051161";csrfkey|s:8:"LRJQbwug";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:15:"ajax_permission";s:3:"new";}csrfvalue|s:20:"B0cA6os1vgqTYCDR5LdP";ajax_permission|s:41:"没有访问授权  <br> [tool/api/price]";'),
('5d1c2d340231ee9788dccb4194345bb404cb4fb8', '127.0.0.1', 1472203472, '__ci_last_regenerate|i:1472203472;code|s:4:"NIUx";'),
('410f4b7aa8484943e278fbeff1d0771fdac85c55', '127.0.0.1', 1472203472, '__ci_last_regenerate|i:1472203472;code|s:4:"ZbAS";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472051161";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"old";}ajax_permission|s:41:"没有访问授权  <br> [tool/api/price]";'),
('09fc4dff7dede6ca61f39d3d68f75b94a3aca61e', '127.0.0.1', 1472205396, '__ci_last_regenerate|i:1472204615;code|s:4:"ZbAS";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472051161";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}ajax_permission|s:41:"没有访问授权  <br> [tool/api/price]";'),
('17032648a3913514a107a13e70ffe6bef48e9340', '127.0.0.1', 1472206638, '__ci_last_regenerate|i:1472205436;code|s:4:"ZbAS";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472051161";csrfkey|s:8:"uxNYS3T2";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:15:"ajax_permission";s:3:"new";}csrfvalue|s:20:"e95Blprtuw32gQb1dPVM";ajax_permission|s:41:"没有访问授权  <br> [tool/api/price]";'),
('5ef8b47996ded2482ccd693921bc6fcaac57b049', '127.0.0.1', 1472207369, '__ci_last_regenerate|i:1472206847;code|s:4:"ZbAS";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472051161";csrfkey|s:8:"U6PRlotD";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"e14CJlrXzLPBEj8AIhwR";'),
('b03d929fbe82ab018537843df8584ffd179346d3', '127.0.0.1', 1472207211, '__ci_last_regenerate|i:1472206928;code|s:4:"pn7M";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472199689";current_price|s:19:"83H8A72u7hNIQIkTC/g";__ci_vars|a:3:{s:13:"current_price";i:1472208206;s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfkey|s:8:"ob5A0xsz";csrfvalue|s:20:"L2AXFlvONmRbU5ugG64w";'),
('fab59e772053977b21e64212ee25bd8e29492148', '127.0.0.1', 1472207499, '__ci_last_regenerate|i:1472207394;code|s:4:"EDaI";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472201129";'),
('1163468b98318fb1d537ec80540e3f3e87e41654', '127.0.0.1', 1472260860, '__ci_last_regenerate|i:1472260557;code|s:4:"s8Wh";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472207498";'),
('5ca4facc0ed44f69516486e73827e7cb5b4c3fc8', '127.0.0.1', 1472262125, '__ci_last_regenerate|i:1472260923;code|s:4:"s8Wh";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472207498";'),
('b11526082a5f8e66ed6f8b11fc31a908f858e06e', '127.0.0.1', 1472277751, '__ci_last_regenerate|i:1472262150;code|s:4:"s8Wh";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472207498";'),
('dfcb47bda737fbaf1876d3367f2a2d8b3ad24686', '127.0.0.1', 1472263850, '__ci_last_regenerate|i:1472262197;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"K7V4tiHy";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"ONyIhU8Ef2CRpjTiF4Ko";'),
('b0dbcfa1640b880a1164c823ce3dbb193c0e1b6b', '127.0.0.1', 1472265940, '__ci_last_regenerate|i:1472264121;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"jENqwtIy";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"DBtygapbSxdO1HJ7LVzm";'),
('57896e33f4c04da2d03eadd2e907deb4829295d8', '127.0.0.1', 1472267254, '__ci_last_regenerate|i:1472266384;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"ZjYGFRHl";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"TQh38yMupS5coxKFPBVO";'),
('6f250a8f34840940ecbf3f4633b00cea9c1178ca', '127.0.0.1', 1472267984, '__ci_last_regenerate|i:1472267254;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"7FC3SPA8";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"TiEdp4Dn1HafYeWARBq0";'),
('1958aa015de198c961672a167a1af99b5f85cc9b', '127.0.0.1', 1472269926, '__ci_last_regenerate|i:1472268032;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"xP2YdrDb";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"DErOFz1RMa6plXuxJBiL";'),
('b491eb35d76c5edfef457eb445e67806feb48bbd', '127.0.0.1', 1472269125, '__ci_last_regenerate|i:1472269124;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";ajax_permission|s:41:"没有访问授权  <br> [tool/api/price]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('ee1d35e957475f620e8e0e0195c8205cd5c62acd', '127.0.0.1', 1472269846, '__ci_last_regenerate|i:1472269154;code|s:4:"XJAF";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:1:"0";current_price|s:19:"832pVbj06UBIQIkTBv8";__ci_vars|a:3:{s:13:"current_price";i:1472271046;s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"6ASqtpbe";csrfvalue|s:20:"WxP5vpSTErZO3MhoqXF2";'),
('de436b8b8fcb9594b7621d95c84bd90bedd76e6f', '127.0.0.1', 1472269792, '__ci_last_regenerate|i:1472269333;code|s:4:"QdPf";identity|s:12:"jingli-demo2";username|s:12:"jingli-demo2";email|s:6:"a@a.cc";user_id|s:1:"4";old_last_login|s:1:"0";csrfkey|s:8:"V7oTF2ze";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"BZ06WoMUQAFLGb1zOxn3";'),
('3cc52b24d2954ccc4d52f31e3e13d6d39234da13', '127.0.0.1', 1472278928, '__ci_last_regenerate|i:1472269894;code|s:4:"XJAF";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:1:"0";'),
('3d05aab6be05a51273a72100bb621ef760e08c7c', '127.0.0.1', 1472274888, '__ci_last_regenerate|i:1472270087;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}ajax_permission|s:41:"没有访问授权  <br> [tool/api/price]";'),
('9af03a200f807d26a77847386342c20e7eb9918a', '127.0.0.1', 1472275430, '__ci_last_regenerate|i:1472275126;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"old";}ajax_permission|s:41:"没有访问授权  <br> [tool/api/price]";'),
('4da2af2cbcffa77e59b801b4107eb6d0c0b496bf', '127.0.0.1', 1472275752, '__ci_last_regenerate|i:1472275434;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"4l2JZ5g6";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"dwh2FXQ3Wi0YNRepIyUj";'),
('8010bbee2a96b1ebe05ec7e758a94d3d241cf12c', '127.0.0.1', 1472276945, '__ci_last_regenerate|i:1472275797;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";success|s:48:"项目已入库标记！编号: SD20155454564511";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('31355580cbe6d8bc2633423a3c8202c0a018947f', '127.0.0.1', 1472279501, '__ci_last_regenerate|i:1472276945;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"gnI0SRCK";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"ZglrftqzVJc5n8P3kCQM";'),
('9161d8710259322d219539f1673c2e494d777b22', '127.0.0.1', 1472277747, '__ci_last_regenerate|i:1472277376;code|s:4:"ekqK";identity|s:12:"jingli-demo2";username|s:12:"jingli-demo2";email|s:6:"a@a.cc";user_id|s:1:"4";old_last_login|s:10:"1472269345";csrfkey|s:8:"K4fUsmFJ";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:7:"success";s:3:"new";}csrfvalue|s:20:"DJY5IQmzoTW2ZL1v3k9E";success|s:42:"项目已核实！编号: 1608272541144202";'),
('63e51ad350946799c059948bec6a4efa37915022', '127.0.0.1', 1472277748, '__ci_last_regenerate|i:1472277747;code|s:4:"ekqK";identity|s:12:"jingli-demo2";username|s:12:"jingli-demo2";email|s:6:"a@a.cc";user_id|s:1:"4";old_last_login|s:10:"1472269345";'),
('71ea5369b33a198dbff6747dbeb752105bf2f452', '127.0.0.1', 1472278418, '__ci_last_regenerate|i:1472278166;code|s:4:"ekqK";identity|s:12:"jingli-demo2";username|s:12:"jingli-demo2";email|s:6:"a@a.cc";user_id|s:1:"4";old_last_login|s:10:"1472269345";'),
('99614ba2e63eb32ae4905be487a33009f6b40d57', '127.0.0.1', 1472278683, '__ci_last_regenerate|i:1472278432;code|s:4:"s8Wh";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472207498";'),
('35fb532dd99e7b1c71cfb10bbb96ce54b6fcf3bd', '127.0.0.1', 1472278898, '__ci_last_regenerate|i:1472278897;code|s:4:"s8Wh";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472207498";'),
('3fdbdb6bef9155072687d41c43ed8349196b4376', '127.0.0.1', 1472278971, '__ci_last_regenerate|i:1472278931;code|s:4:"XJAF";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:1:"0";'),
('3b74579b048ffaa6a72b3479fc20a2dfc0f3ba24', '127.0.0.1', 1472279556, '__ci_last_regenerate|i:1472279507;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";'),
('de987c001d401c9774758994edf3f6c58758c83b', '127.0.0.1', 1472280751, '__ci_last_regenerate|i:1472279547;code|s:4:"XJAF";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:1:"0";'),
('0e3fde35fdb00d1f4b2ac44636309b5c99bacda4', '127.0.0.1', 1472279663, '__ci_last_regenerate|i:1472279568;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"ZxEXv3DN";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"IOYUCtRqm24sTKwAeBLd";'),
('8f6188f0d9657dfc020299d368caa672abd5a05e', '127.0.0.1', 1472279762, '__ci_last_regenerate|i:1472279731;code|s:4:"s8Wh";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472207498";'),
('969b81e8956c670ce3d952b56f0ead306208ebbd', '127.0.0.1', 1472280357, '__ci_last_regenerate|i:1472280094;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"8ktJ9Lfb";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"qDbQdwP8r5npsKNlLZgW";'),
('2d2bc3bb9d92dccd715640762fd06ea3ab4ce19e', '127.0.0.1', 1472280757, '__ci_last_regenerate|i:1472280430;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"2IJSxk6G";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"NOC36rUBjusQflGHbaXm";'),
('2014d7c7e08bfa71ecc99295c6808a64df9eb2ec', '127.0.0.1', 1472281506, '__ci_last_regenerate|i:1472280748;code|s:4:"iyED";identity|s:12:"kuguan-demo2";username|s:12:"kuguan-demo2";email|s:11:"kuguan@a.cc";user_id|s:1:"8";old_last_login|s:1:"0";csrfkey|s:8:"Ytq4xPWv";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"wOC3mJIijkUlQ0rzMVLR";'),
('b8125ccc7af17ff6db6ac92a8d18992a0435c8b3', '127.0.0.1', 1472281196, '__ci_last_regenerate|i:1472280856;code|s:4:"RbTw";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472201475";csrfkey|s:8:"gF0bPrad";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"EosfR1Fz8mjiGXdHq7Un";'),
('3ad70ee6b065cbf3f730f98ae0a4c2450fa94e3d', '127.0.0.1', 1472281957, '__ci_last_regenerate|i:1472281564;code|s:4:"gMBy";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472280529";csrfkey|s:8:"EkOJoBIF";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"E109RPrjikqapCuWOlvc";'),
('5d7250e82fdcd1b5fac638596f7cf2977356dff7', '127.0.0.1', 1472287946, '__ci_last_regenerate|i:1472281648;code|s:4:"XJAF";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:1:"0";'),
('94d877ae2aeb6ee4af7cdbec57c1f63b6aa23410', '127.0.0.1', 1472282385, '__ci_last_regenerate|i:1472281909;code|s:4:"iyED";identity|s:12:"kuguan-demo2";username|s:12:"kuguan-demo2";email|s:11:"kuguan@a.cc";user_id|s:1:"8";old_last_login|s:1:"0";csrfkey|s:8:"DKUmwMGk";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"caKHsSrgzI4eOdytECB1";'),
('a8c6a5e780bdc2a5e419f1c6356a8b37fe1aa746', '127.0.0.1', 1472287957, '__ci_last_regenerate|i:1472282517;code|s:4:"gMBy";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472280529";'),
('a6b64e13da345025821212b49a0d34611125343c', '127.0.0.1', 1472283385, '__ci_last_regenerate|i:1472282617;code|s:4:"iyED";identity|s:12:"kuguan-demo2";username|s:12:"kuguan-demo2";email|s:11:"kuguan@a.cc";user_id|s:1:"8";old_last_login|s:1:"0";csrfkey|s:8:"u4clskqR";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"sqwuvnh2HkG15UmYRito";'),
('97fac9ccec22ab6c70338056912d365ae7678fd5', '127.0.0.1', 1472284617, '__ci_last_regenerate|i:1472283410;code|s:4:"7sym";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472281575";'),
('3d67caed8f0f5609de3bd55954660183d160502a', '127.0.0.1', 1472285832, '__ci_last_regenerate|i:1472285575;code|s:4:"7sym";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472281575";'),
('0d21fd77bb6df9be6ad8e017ad7c0b04c3b273e4', '127.0.0.1', 1472286352, '__ci_last_regenerate|i:1472286304;code|s:4:"7sym";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472281575";'),
('3f4156d20328887e4b09847aa9a4432b502de82d', '127.0.0.1', 1472287317, '__ci_last_regenerate|i:1472287091;code|s:4:"7sym";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472281575";'),
('a6dd8fd7f3cbe1151c5c29b6f88c33fe0c107e46', '127.0.0.1', 1472287971, '__ci_last_regenerate|i:1472287950;code|s:4:"7sym";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472281575";csrfkey|s:8:"ZMaNsUeu";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"l9dHVeAu0rPvZjwqQDcs";'),
('ad3a890b757498bd0644e2cc634f6eadb21dc667', '127.0.0.1', 1472288351, '__ci_last_regenerate|i:1472288169;code|s:4:"eIqT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472260756";'),
('8bb223dbc078e4d66d113b30bc0eddb16a9b7e02', '127.0.0.1', 1472288779, '__ci_last_regenerate|i:1472288558;code|s:4:"XJAF";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:1:"0";csrfkey|s:8:"vJgbqrzA";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"wsQSx97jAdXcJybZWa0O";'),
('50ce80f6081fe48d5ec1d41f2b176622c3d9f9de', '127.0.0.1', 1472289031, '__ci_last_regenerate|i:1472288662;code|s:4:"7sym";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472281575";success|s:42:"项目已回收！编号: 1608181371034554";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('751c9f60697a8655566d841bc8af2fbf0051ccd9', '127.0.0.1', 1472290701, '__ci_last_regenerate|i:1472288838;code|s:4:"M5be";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472262219";'),
('bd8b08cbad0d3cbbbc4ef55ee9741310ce7aa4b2', '127.0.0.1', 1472289668, '__ci_last_regenerate|i:1472289031;code|s:4:"7sym";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472281575";csrfkey|s:8:"8d4T5bN9";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:7:"success";s:3:"new";}csrfvalue|s:20:"0WBsQGVOlKbjk7ItF1yP";success|s:42:"项目已核实！编号: 1608252211011343";'),
('b87ba3b9b1318fe177269b2975fdb4e840591c6f', '127.0.0.1', 1472289922, '__ci_last_regenerate|i:1472289668;code|s:4:"7sym";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472281575";'),
('dab9e204e74d034967117c6500fae27833df4288', '127.0.0.1', 1472290890, '__ci_last_regenerate|i:1472289936;code|s:4:"XJAF";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:1:"0";csrfkey|s:8:"lWaQm72p";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"w9zQd7hbO3Zxi8DUGJ6R";'),
('5b96526e39fcf12d45e1f774ce8ce1c6acdc4b9e', '127.0.0.1', 1472290899, '__ci_last_regenerate|i:1472290246;code|s:4:"7sym";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472281575";csrfkey|s:8:"pyx0J3MD";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"UHfrnDlJQ1bGAhWjsmz0";'),
('2e5fd3f9468aa33fc0691f2ce0c0b0771241aabd', '127.0.0.1', 1472290861, '__ci_last_regenerate|i:1472290701;code|s:4:"M5be";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472262219";csrfkey|s:8:"MQLVxBvK";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"JNUbdYLC8WehIjo2HEcn";'),
('970c54c34294611473c2336db279d215948ae0ab', '127.0.0.1', 1472355784, '__ci_last_regenerate|i:1472355495;code|s:4:"WI6k";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472288906";'),
('1150c906a3601f2111ad8cb0a16ee6f0061e8a25', '127.0.0.1', 1472356523, '__ci_last_regenerate|i:1472356390;code|s:4:"s58v";'),
('b7cf16b5930f008d7b733de0d7179d5102ea41ce', '127.0.0.1', 1472357319, '__ci_last_regenerate|i:1472357079;code|s:4:"3QFt";'),
('dca3abed8e9b358d9663c810c7191a5f102402f6', '127.0.0.1', 1472358082, '__ci_last_regenerate|i:1472357786;code|s:4:"rxSR";'),
('9249a6854f40569c0e49c4745ffa4ee4b1d535df', '127.0.0.1', 1472359115, '__ci_last_regenerate|i:1472358093;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";'),
('4aa33b99876aeaeab83591df4589c34fd2157d00', '127.0.0.1', 1472359276, '__ci_last_regenerate|i:1472359138;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";csrfkey|s:8:"kbs6Idgf";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"9EyfX5owzAxCdUBRMFKv";'),
('613c7290923e6643bb73a3fafa0a65c42f50054d', '127.0.0.1', 1472359542, '__ci_last_regenerate|i:1472359485;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";'),
('948ef0bcf5ec87f6ada5289d973290d30b6c91ab', '127.0.0.1', 1472363703, '__ci_last_regenerate|i:1472360092;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";'),
('44e2867fdb0532134671a80cebeefa3447665419', '127.0.0.1', 1472380875, '__ci_last_regenerate|i:1472364015;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";'),
('1849177d0a9bde9d6b4effb65cf6892cab1bbbe5', '127.0.0.1', 1472381147, '__ci_last_regenerate|i:1472381117;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";csrfkey|s:8:"tk5JAzLy";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"Dbehc7LKNd8Xula5fpEA";'),
('97f88a954ddbf2ef09874eb45a6e220dc8568cdd', '127.0.0.1', 1472381844, '__ci_last_regenerate|i:1472381696;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";csrfkey|s:8:"rWgvYIMm";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"5ClnP9L7rX1zsqu2gpB8";'),
('e4f3c6a3452fb8d3b77f2163fd883aa130080aaf', '127.0.0.1', 1472382645, '__ci_last_regenerate|i:1472382335;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";csrfkey|s:8:"fhc401ZR";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"7Kg0ivCZGQrBTJYanc8H";'),
('76e3893075838b82f55ce53c1fbdbcd5a1b11bfe', '127.0.0.1', 1472383314, '__ci_last_regenerate|i:1472382968;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";csrfkey|s:8:"I0oQMyxS";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"5yR1WOu46irUc0EfY7SV";'),
('ef5b4ee95839a90fb891f58e96945581ed3e8a07', '127.0.0.1', 1472383511, '__ci_last_regenerate|i:1472383393;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";csrfkey|s:8:"VGodZIvn";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"HestmWhBCU5QGTcxLgl6";'),
('dc9dc738d8c4e1f4115a3eb3d627774748f8f6a8', '127.0.0.1', 1472384608, '__ci_last_regenerate|i:1472383759;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";csrfkey|s:8:"5AwopzOf";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"On1rKS0VaXDZ4svjxdBP";'),
('409d2d71d8c9f72c5f2df34d3e5a444ade4aa7f6', '127.0.0.1', 1472386523, '__ci_last_regenerate|i:1472384712;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";csrfkey|s:8:"kUVHxBmu";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"iR5uqKdHgWVfNG8zoQXw";'),
('b713dc077c3e21300ea1fea166c689dab547f28f', '127.0.0.1', 1472387102, '__ci_last_regenerate|i:1472386650;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";csrfkey|s:8:"rSfvstJA";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"LXoNi9qp2H74EOak1wdy";'),
('0ee1b0c36aaec7e5fa119aee0c40d0af244eea0f', '127.0.0.1', 1472387579, '__ci_last_regenerate|i:1472387210;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";csrfkey|s:8:"VqPezgHp";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:7:"success";s:3:"new";}csrfvalue|s:20:"X8k36fWrTZYsOUpdQlnN";success|s:42:"项目已核实！编号: 1608186671184447";'),
('7529a19360650d8ef620c686efec625f43f075c0', '127.0.0.1', 1472387593, '__ci_last_regenerate|i:1472387581;code|s:4:"2fN2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472283412";'),
('fdff3afc01f3d6eb32c6f5c646b548cd121479a3', '127.0.0.1', 1472392486, '__ci_last_regenerate|i:1472387627;code|s:4:"rz6I";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472290701";'),
('cdb840d67e366ea1fdee4ba523d4593ee00b7a19', '127.0.0.1', 1472388187, '__ci_last_regenerate|i:1472387924;code|s:4:"MEnr";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472387674";csrfkey|s:8:"5AsyqPHw";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"4rDKT9LC1G8aJfYbvcQu";'),
('e67a79f0839515056903c24b55535aa2fc11300f', '127.0.0.1', 1472388755, '__ci_last_regenerate|i:1472388273;code|s:4:"MEnr";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472387674";__ci_vars|a:1:{s:7:"success";s:3:"new";}success|s:48:"项目已入库标记！编号: 1608186671184447";'),
('750b54997d5f44b5cd545a0d03503a87b533f866', '127.0.0.1', 1472388499, '__ci_last_regenerate|i:1472388463;code|s:4:"XQyb";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472387936";csrfkey|s:8:"PlGXSnU8";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"wDUOfLdAE1n7WpVt4qYl";'),
('869792f5009266f07cf822aa1b43eccb712970d7', '127.0.0.1', 1472391336, '__ci_last_regenerate|i:1472388755;code|s:4:"MEnr";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1472387674";'),
('aa68bf1c99b1604b0d3e3884719724596c7e9fb4', '127.0.0.1', 1472389317, '__ci_last_regenerate|i:1472389001;code|s:4:"2BT2";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472355497";success|s:12:"保存成功";__ci_vars|a:1:{s:7:"success";s:3:"old";}'),
('76e97772c10baad8c97a4d195ff25f7d353c846e', '127.0.0.1', 1472391238, '__ci_last_regenerate|i:1472390029;code|s:4:"2BT2";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472355497";'),
('d509c94b71f75a49304d21e8df3b23ae9e7aa431', '127.0.0.1', 1472392303, '__ci_last_regenerate|i:1472392014;code|s:4:"2BT2";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472355497";'),
('83ca6ab09d57d6a3b5f0c97189a6ab1bb78f337c', '127.0.0.1', 1472392535, '__ci_last_regenerate|i:1472392435;code|s:4:"r7Rf";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1472091043";current_price|N;__ci_vars|a:1:{s:13:"current_price";i:1472393665;}'),
('5fa5a5eee98aac41777f7e22cad452e0f68acd09', '127.0.0.1', 1472392731, '__ci_last_regenerate|i:1472392553;code|s:4:"2BT2";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472355497";'),
('74db100d5535b43b52afccb3f343a85fba7fbd2b', '127.0.0.1', 1472393077, '__ci_last_regenerate|i:1472392776;code|s:4:"2MbQ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472358269";ajax_permission|s:57:"没有访问授权  <br> [project/investing/certificated]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('3a64ce35bf218d3968b83af47865f106b740eac8', '127.0.0.1', 1472400119, '__ci_last_regenerate|i:1472392872;code|s:4:"r7Rf";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1472091043";'),
('d66b6e7c9a8b35a705330c1d9a8ccf50ce2975b5', '127.0.0.1', 1472393129, '__ci_last_regenerate|i:1472393120;code|s:4:"2MbQ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472358269";csrfkey|s:8:"nAUmq41K";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"PrCdhMyQgID7qSVRpsOk";'),
('9d402a05be8a330d04b55e5482bed9be1f2ab49a', '127.0.0.1', 1472397068, '__ci_last_regenerate|i:1472393140;code|s:4:"dq4D";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472392785";csrfkey|s:8:"LJdal36w";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"nIsMokx5OCRHmPb2VDL9";'),
('c3f91fbe364c08136d2fdd2f43205f2093cc8bda', '127.0.0.1', 1472394841, '__ci_last_regenerate|i:1472394677;code|s:4:"tRZG";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472389014";'),
('020d61af15c856047161a189ba9a2ec1c5a06015', '127.0.0.1', 1472395541, '__ci_last_regenerate|i:1472395269;code|s:4:"tRZG";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472389014";'),
('1fc33ce30deee98237e5233571405d1e05e3dbe3', '127.0.0.1', 1472399268, '__ci_last_regenerate|i:1472395667;code|s:4:"tRZG";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1472389014";'),
('e0fbd8771ee41e5e36d9f227f99b4fd0ef6d5c86', '127.0.0.1', 1472398294, '__ci_last_regenerate|i:1472397086;code|s:4:"dq4D";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472392785";csrfkey|s:8:"I26lfYxa";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"qTAvU2iLo9KMglXPRptu";'),
('2b1db2c89769dcb6f56b1c32f0bad08b6a6b75ce', '127.0.0.1', 1472398383, '__ci_last_regenerate|i:1472398373;code|s:4:"dq4D";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472392785";csrfkey|s:8:"Ni1Jqk4x";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"l3onhfu7R2Hv9DpFxJPq";'),
('12eeac3742499c99ba41113884df24079a174e46', '127.0.0.1', 1472399311, '__ci_last_regenerate|i:1472399019;code|s:4:"dq4D";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472392785";csrfkey|s:8:"HIzZ6vVa";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:15:"ajax_permission";s:3:"new";}csrfvalue|s:20:"vcOBTCtf6Fl8Mey3uDXV";ajax_permission|s:54:"没有访问授权  <br> [project/investing/confirmed]";'),
('d135941ba400f2f237ad99735a0572716e7ba094', '127.0.0.1', 1472399686, '__ci_last_regenerate|i:1472399369;code|s:4:"dq4D";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472392785";csrfkey|s:8:"u9RQ3ApS";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"nROqo2Tr79FdtgSYL61c";'),
('6cbfa3a1596959318026ab2ec71110f12b73578e', '127.0.0.1', 1472399982, '__ci_last_regenerate|i:1472399812;code|s:4:"dq4D";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472392785";'),
('65b6bcfa25bcc5f86d33b34a9b120be5720ff898', '127.0.0.1', 1472400392, '__ci_last_regenerate|i:1472400381;code|s:4:"dq4D";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1472392785";');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

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
(8, 'golden_price', 'a:2:{s:6:"apikey";s:16:"101ae9aa1007ce6d";s:6:"apiurl";s:34:"http://api.jisuapi.com/gold/shgold";}', 1, 'api', 1),
(9, 'investing_privacy', '2', 0, 'project', 1),
(10, 'investing_initial', '1', 0, 'project', 1),
(11, 'recycling_privacy', '3', 0, 'project', 1),
(12, 'recycling_initial', '1', 0, 'project', 1),
(13, 'profit_weight', '6', 0, 'project', 1),
(14, 'investing_checked', '2', 0, 'project', 1),
(15, 'investing_confirmed', '3', 0, 'project', 1),
(16, 'investing_expired', '4', 0, 'project', 1),
(17, 'investing_lacking', '6', 0, 'project', 1),
(18, 'investing_refused', '7', 0, 'project', 1),
(19, 'investing_terminated', '8', 0, 'project', 1),
(20, 'investing_finished', '6', 0, 'project', 1),
(21, 'investing_appling', '5', 0, 'project', 1),
(22, 'month_taking', '1', 0, 'project', 1),
(23, 'season_taking', '1', 0, 'project', 1);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `gd_worker`
--

INSERT INTO `gd_worker` (`id`, `username`, `realname`, `avatar`, `password`, `salt`, `email`, `remember_code`, `addtime`, `last_login`, `last_ip`, `status`, `phone`) VALUES
(1, 'admin-root', '管理员', 'public/images/avatar/121034209220f1.jpg', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', NULL, 1469999823, 1472394689, '127.0.0.1', 1, ''),
(2, 'zhujingxiu', '朱景修', NULL, '$2y$08$QQOBCnHUhFTH/CjeWztJGOOfAz2xuqSki7P2qn5/WojZQvXc10NAK', NULL, 'zhujingxiu@hotmail.com', NULL, 1470736567, 1470736771, '127.0.0.1', 1, '18850911766'),
(3, 'jingli-demo1', '经理测试A', 'public/images/avatar/avatar2.png', '$2y$08$k1dyXUI7CRYqc/CpH9UT0ONk93y3sP7EQ5Jdcr/lvOoUE4Tob05Oe', NULL, 'a@a.c', NULL, 1471598448, 1472393178, '127.0.0.1', 1, ''),
(4, 'jingli-demo2', '经理测试B', 'public/images/avatar/user1-128x128.jpg', '$2y$08$1gGt5kfd2/S0WGDZNt6PMu8bj1WBhiww4AgNx4TJSRrJaiQ7jV4gu', NULL, 'a@a.cc', NULL, 1471598720, 1472277405, '127.0.0.1', 1, ''),
(5, 'dengji-demo1', '登记测试A', 'public/images/avatar/avatar1.png', '$2y$08$YHzCZKpn3DYoZWYfE4UD4.7KSke2QaVc5Ou04ljhRNZn5sDqc7QF2', NULL, 'b@a.cc', NULL, 1471598889, 1472392449, '127.0.0.1', 1, ''),
(6, 'dengji-demo2', '录单测试B', 'public/images/avatar/user3-128x128.jpg', '$2y$08$7JByOlb/P/L.c8P.mqeMX.N7qSiLGBWyx3YWA44wUDkAMY0rGKtQS', NULL, 'ludan@b.cc', NULL, 1471598958, 1472269180, '127.0.0.1', 1, ''),
(7, 'kuguan-demo1', '库管测试A', 'public/images/avatar/user4-128x128.jpg', '$2y$08$SuuFWJ0sZL2z.SZDLaTX3Od/bkVZ04Ax1fc1SmDtoVf8X0XjuRuJO', NULL, 'kuguan@bb.c', NULL, 1471599005, 1472388482, '127.0.0.1', 1, ''),
(8, 'kuguan-demo2', '库管测试B', 'public/images/avatar/user5-128x128.jpg', '$2y$08$18MwNqHD5QKE/M2xcF4NXuLScN67KrGQfBCfXPEEEM/W5PNC/5/5G', NULL, 'kuguan@a.cc', NULL, 1471599054, 1472280758, '127.0.0.1', 1, ''),
(9, 'jianding-demo1', '鉴定人A', 'public/images/avatar/user8-128x128.jpg', '$2y$08$GqumJcWGIEa25v1OB3i5M.k8Vgxg99kuKXpGsUs5ZzQiUIp.Qer5G', NULL, 'jianding@g.cc', NULL, 1471599152, 0, '127.0.0.1', 1, ''),
(10, 'jianding-demo2', '鉴定人B', 'public/images/avatar/user7-128x128.jpg', '$2y$08$kPYhqg2giK0IhN5v6WS4WuMQvXq0m0gpF6Cx.xAR4..dsxS9UmNDG', NULL, 'admin@admin.com', NULL, 1471599225, 0, '127.0.0.1', 1, ''),
(11, 'all-demo1', '综合账户', 'public/images/avatar/user2-160x160.jpg', '$2y$08$bnDehV48c1sDsmwPNmmTHOdMMxUE1MHNGItvkmvL7CC2G20doVhcq', NULL, 'all@b.cc', NULL, 1471599856, 1471600479, '127.0.0.1', 1, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=361 ;

--
-- 转存表中的数据 `gd_worker_activity`
--

INSERT INTO `gd_worker_activity` (`activity_id`, `worker_id`, `content`, `addtime`) VALUES
(1, 1, 'SELECT COUNT(*) AS `numrows`', 1472186284),
(2, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_price`\nWHERE `date` = ''2016-08-25''', 1472186366),
(3, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(4, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(5, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(6, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(7, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(8, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(9, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(10, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(11, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(12, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(13, 1, 'SELECT COUNT(*) AS `numrows`', 1472194969),
(14, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(15, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(16, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(17, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(18, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(19, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(20, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(21, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(22, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(23, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(24, 1, 'SELECT COUNT(*) AS `numrows`', 1472194999),
(25, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(26, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(27, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(28, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(29, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(30, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(31, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(32, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(33, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(34, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(35, 1, 'SELECT COUNT(*) AS `numrows`', 1472195029),
(36, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(37, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(38, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(39, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(40, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(41, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(42, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(43, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(44, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(45, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(46, 1, 'SELECT COUNT(*) AS `numrows`', 1472195059),
(47, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(48, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(49, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(50, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(51, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(52, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(53, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(54, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(55, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(56, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(57, 1, 'SELECT COUNT(*) AS `numrows`', 1472195089),
(58, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(59, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(60, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(61, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(62, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(63, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(64, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(65, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(66, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(67, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(68, 1, 'SELECT COUNT(*) AS `numrows`', 1472195119),
(69, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(70, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(71, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(72, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(73, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(74, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(75, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(76, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(77, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(78, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(79, 1, 'SELECT COUNT(*) AS `numrows`', 1472195149),
(80, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(81, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(82, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(83, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(84, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(85, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(86, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(87, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(88, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(89, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(90, 1, 'SELECT COUNT(*) AS `numrows`', 1472195178),
(91, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(92, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(93, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(94, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(95, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(96, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(97, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(98, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(99, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(100, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(101, 1, 'SELECT COUNT(*) AS `numrows`', 1472195208),
(102, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(103, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(104, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(105, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(106, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(107, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(108, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(109, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(110, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(111, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(112, 1, 'SELECT COUNT(*) AS `numrows`', 1472195238),
(113, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(114, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(115, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(116, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(117, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(118, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(119, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(120, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(121, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(122, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(123, 1, 'SELECT COUNT(*) AS `numrows`', 1472195268),
(124, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(125, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(126, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(127, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(128, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(129, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(130, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(131, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(132, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(133, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(134, 1, 'SELECT COUNT(*) AS `numrows`', 1472195298),
(135, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(136, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(137, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(138, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(139, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(140, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(141, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(142, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(143, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(144, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(145, 1, 'SELECT COUNT(*) AS `numrows`', 1472195329),
(146, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195359),
(147, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195359),
(148, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195359),
(149, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195359),
(150, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195359),
(151, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195359),
(152, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195359),
(153, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195359),
(154, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195359),
(155, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195359),
(156, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195359),
(157, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195389),
(158, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195389),
(159, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195389),
(160, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195389),
(161, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195389),
(162, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195389),
(163, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195389),
(164, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195389),
(165, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195389),
(166, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195389),
(167, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195389),
(168, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195419),
(169, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195419),
(170, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195419),
(171, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195419),
(172, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195419),
(173, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195419),
(174, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195419),
(175, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195419),
(176, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195419),
(177, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195419),
(178, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195419),
(179, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195449),
(180, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195449),
(181, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195449),
(182, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195449),
(183, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195449),
(184, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195449),
(185, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195449),
(186, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195449),
(187, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195449),
(188, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195449),
(189, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195449),
(190, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195479),
(191, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195479),
(192, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195479),
(193, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195479),
(194, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195479),
(195, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195479),
(196, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195479),
(197, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195479),
(198, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195479),
(199, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195479),
(200, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195479),
(201, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195508),
(202, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195508),
(203, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195508),
(204, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195508),
(205, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195508),
(206, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195508),
(207, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195508),
(208, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195508),
(209, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195508),
(210, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195508),
(211, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195508),
(212, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195538),
(213, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195538),
(214, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195538),
(215, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195538),
(216, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195538),
(217, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195538),
(218, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195538),
(219, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195538),
(220, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195538),
(221, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195538),
(222, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195538),
(223, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195568),
(224, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195568),
(225, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195568),
(226, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195568),
(227, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195568),
(228, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195568),
(229, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195568),
(230, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195568),
(231, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195568),
(232, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195568),
(233, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195568),
(234, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195598),
(235, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195598),
(236, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195598),
(237, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195598),
(238, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195598),
(239, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195598),
(240, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195598),
(241, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195598),
(242, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195598),
(243, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195598),
(244, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195598),
(245, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195628),
(246, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195628),
(247, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195628),
(248, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195628),
(249, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195628),
(250, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195628),
(251, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195628),
(252, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195628),
(253, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195628),
(254, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195628),
(255, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195628),
(256, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195658),
(257, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195658),
(258, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195658),
(259, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195658),
(260, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195658),
(261, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195658),
(262, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195658),
(263, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195658),
(264, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195658),
(265, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195658),
(266, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195658),
(267, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195688),
(268, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195688),
(269, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195688),
(270, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195688),
(271, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195688),
(272, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195688),
(273, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195688),
(274, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195688),
(275, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195688),
(276, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195688),
(277, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195688),
(278, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195718),
(279, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195718),
(280, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195718),
(281, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195718),
(282, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195718),
(283, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195718),
(284, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195718),
(285, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195718),
(286, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195718),
(287, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195718),
(288, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195718),
(289, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''Au(T+D)''', 1472195748),
(290, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au99.99''', 1472195748),
(291, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190237\nAND `type` = ''mAu(T+D)''', 1472195748),
(292, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190232\nAND `type` = ''Au(T+N2)''', 1472195748),
(293, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190158\nAND `type` = ''Au99.95''', 1472195748),
(294, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472189752\nAND `type` = ''Pt99.95''', 1472195748),
(295, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190233\nAND `type` = ''Au(T+N1)''', 1472195748),
(296, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190063\nAND `type` = ''Au100g''', 1472195748),
(297, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472190224\nAND `type` = ''iAu99.99''', 1472195748),
(298, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472145654\nAND `type` = ''iAu100g''', 1472195748),
(299, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195748),
(300, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472195946),
(301, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192789\nAND `type` = ''Au(T+D)''', 1472196023),
(302, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192741\nAND `type` = ''Au99.99''', 1472196023),
(303, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192788\nAND `type` = ''mAu(T+D)''', 1472196023),
(304, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192704\nAND `type` = ''Au99.95''', 1472196023),
(305, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192621\nAND `type` = ''Au(T+N2)''', 1472196023),
(306, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192469\nAND `type` = ''Pt99.95''', 1472196023),
(307, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192736\nAND `type` = ''Au(T+N1)''', 1472196023),
(308, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192784\nAND `type` = ''Au100g''', 1472196023),
(309, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192723\nAND `type` = ''iAu100g''', 1472196023),
(310, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192776\nAND `type` = ''iAu99.99''', 1472196023),
(311, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472196023),
(312, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192789\nAND `type` = ''Au(T+D)''', 1472196186),
(313, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192741\nAND `type` = ''Au99.99''', 1472196186),
(314, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192788\nAND `type` = ''mAu(T+D)''', 1472196186),
(315, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192704\nAND `type` = ''Au99.95''', 1472196186),
(316, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192621\nAND `type` = ''Au(T+N2)''', 1472196186),
(317, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192469\nAND `type` = ''Pt99.95''', 1472196186),
(318, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192736\nAND `type` = ''Au(T+N1)''', 1472196186),
(319, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192784\nAND `type` = ''Au100g''', 1472196186),
(320, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192723\nAND `type` = ''iAu100g''', 1472196186),
(321, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192776\nAND `type` = ''iAu99.99''', 1472196186),
(322, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472196186),
(323, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192789\nAND `type` = ''Au(T+D)''', 1472196512),
(324, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192741\nAND `type` = ''Au99.99''', 1472196512),
(325, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192788\nAND `type` = ''mAu(T+D)''', 1472196512),
(326, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192704\nAND `type` = ''Au99.95''', 1472196512),
(327, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192621\nAND `type` = ''Au(T+N2)''', 1472196512),
(328, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192469\nAND `type` = ''Pt99.95''', 1472196512),
(329, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192736\nAND `type` = ''Au(T+N1)''', 1472196512),
(330, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192784\nAND `type` = ''Au100g''', 1472196512),
(331, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192723\nAND `type` = ''iAu100g''', 1472196512),
(332, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472192776\nAND `type` = ''iAu99.99''', 1472196512),
(333, 1, 'SELECT COUNT(*) AS `numrows`\nFROM `gd_golden_today`\nWHERE `updatetime` = 1472125226\nAND `type` = ''iAu99.5''', 1472196512),
(334, 4, '1608272541144202|1', 1472278195),
(335, 4, 'active_period|1608272541144202', 1472278195),
(336, 4, '1608272541144202|1', 1472278325),
(337, 4, '1608272541144202|UPDATE `gd_project_investing` SET `worker_id` = ''4'', `lasttime` = 1472278325\nWHERE `project_sn` = ''1608272541144202''', 1472278325),
(338, 4, 'active_period|1608272541144202', 1472278325),
(339, 4, '1608272541144202|1', 1472278417),
(340, 4, '1608272541144202|UPDATE `gd_project_investing` SET `start` = ''2016-08-27'', `end` = ''2017-08-26'', `worker_id` = ''4'', `lasttime` = 1472278417\nWHERE `project_sn` = ''1608272541144202''', 1472278417),
(341, 4, 'active_period|1608272541144202', 1472278417),
(342, 3, '1608252211011343|1', 1472289668),
(343, 3, '1608252211011343|UPDATE `gd_project_investing` SET `start` = ''2016-08-25'', `end` = ''2017-08-24'', `worker_id` = ''3'', `lasttime` = 1472289668\nWHERE `project_sn` = ''1608252211011343''', 1472289668),
(344, 3, 'active_period|1608252211011343', 1472289668),
(345, 3, 'SD20155454564511|1', 1472384841),
(346, 3, 'SD20155454564511|UPDATE `gd_project_investing` SET `start` = ''2016-08-01'', `end` = ''2016-08-31'', `worker_id` = ''3'', `lasttime` = 1472384841\nWHERE `project_sn` = ''SD20155454564511''', 1472384841),
(347, 3, 'active_period|SD20155454564511', 1472384841),
(348, 3, '1608229881435008|1', 1472386688),
(349, 3, '1608229881435008|UPDATE `gd_project_investing` SET `start` = ''2016-08-22'', `end` = ''2017-02-21'', `worker_id` = ''3'', `lasttime` = 1472386688\nWHERE `project_sn` = ''1608229881435008''', 1472386688),
(350, 3, 'active_period|1608229881435008', 1472386688),
(351, 3, '1608222511510103|1', 1472386760),
(352, 3, '1608222511510103|UPDATE `gd_project_investing` SET `start` = ''2016-08-22'', `end` = ''2017-08-21'', `worker_id` = ''3'', `lasttime` = 1472386760\nWHERE `project_sn` = ''1608222511510103''', 1472386760),
(353, 3, 'active_period|1608222511510103', 1472386760),
(354, 3, '1608183471764952|1', 1472387499),
(355, 3, '1608183471764952|UPDATE `gd_project_investing` SET `start` = ''2016-08-18'', `end` = ''2016-11-17'', `worker_id` = ''3'', `lasttime` = 1472387499\nWHERE `project_sn` = ''1608183471764952''', 1472387499),
(356, 3, 'active_period|1608183471764952', 1472387499),
(357, 3, '1608186671184447|1', 1472387579),
(358, 3, '1608186671184447|UPDATE `gd_project_investing` SET `start` = ''2016-08-18'', `end` = ''2016-11-17'', `worker_id` = ''3'', `lasttime` = 1472387579\nWHERE `project_sn` = ''1608186671184447''', 1472387579),
(359, 3, 'active_period|1608186671184447', 1472387579),
(360, 7, 'in_stock|Array', 1472388632);

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
(2, 'members', '未分组', 0, '2997,2999,3001,3003,2998,3000,3002', 1),
(3, 'manager', '经理', 0, '1,2,3,5,6,7,8,9,10,11,22,23,24,25,26,27,30,33,35,48,49,50,51,52,55,59,63,67,68,70,78,84,85,94', 1),
(4, 'warehouser', '库管', 1, '55,70,82,65,61,87,3,2,1', 1),
(5, 'appraiser', '鉴定人', 0, '74,73,70,1,3,2', 1),
(6, 'booker', '登记人', 0, '55,57,70,72,1,3,2,93', 1);

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
