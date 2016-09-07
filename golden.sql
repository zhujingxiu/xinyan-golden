-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-09-07 12:10:46
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
-- 表的结构 `gd_cron_log`
--

CREATE TABLE `gd_cron_log` (
  `log_time` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `action` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_cron_log`
--

INSERT INTO `gd_cron_log` (`log_time`, `date`, `time`, `action`, `text`) VALUES
(1473227303, '2016-09-07', '13:48:23', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 13:48:23'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473227366, '2016-09-07', '13:49:26', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 13:49:26'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473227786, '2016-09-07', '13:56:26', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 13:56:26'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473227786, '2016-09-07', '13:56:26', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 13:56:26'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473228086, '2016-09-07', '14:01:26', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:01:26'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473228086, '2016-09-07', '14:01:26', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:01:26'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473228386, '2016-09-07', '14:06:26', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:06:26'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473228386, '2016-09-07', '14:06:26', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:06:26'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473228687, '2016-09-07', '14:11:27', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:11:27'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473228687, '2016-09-07', '14:11:27', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:11:27'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473228987, '2016-09-07', '14:16:27', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:16:27'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473228987, '2016-09-07', '14:16:27', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:16:27'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473229287, '2016-09-07', '14:21:27', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:21:27'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473229287, '2016-09-07', '14:21:27', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:21:27'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473229587, '2016-09-07', '14:26:27', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:26:27'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473229587, '2016-09-07', '14:26:27', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:26:27'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473230081, '2016-09-07', '14:34:41', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:34:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473230081, '2016-09-07', '14:34:41', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:34:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473230096, '2016-09-07', '14:34:56', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:34:56'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473230140, '2016-09-07', '14:35:40', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:35:40'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473230268, '2016-09-07', '14:37:48', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:37:48'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473230382, '2016-09-07', '14:39:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:39:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473230382, '2016-09-07', '14:39:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:39:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473230682, '2016-09-07', '14:44:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:44:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473230682, '2016-09-07', '14:44:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:44:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473230982, '2016-09-07', '14:49:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:49:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473230982, '2016-09-07', '14:49:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:49:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473231282, '2016-09-07', '14:54:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:54:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473231282, '2016-09-07', '14:54:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:54:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473231306, '2016-09-07', '14:55:06', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:55:06'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473231583, '2016-09-07', '14:59:43', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 14:59:43'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473231583, '2016-09-07', '14:59:43', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 14:59:43'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473231622, '2016-09-07', '15:00:22', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:00:22'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473231677, '2016-09-07', '15:01:17', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:01:17'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473231883, '2016-09-07', '15:04:43', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:04:43'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473231883, '2016-09-07', '15:04:43', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 15:04:43'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473232183, '2016-09-07', '15:09:43', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:09:43'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473232183, '2016-09-07', '15:09:43', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 15:09:43'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473232484, '2016-09-07', '15:14:44', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:14:44'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473232484, '2016-09-07', '15:14:44', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 15:14:44'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473232784, '2016-09-07', '15:19:44', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:19:44'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473232784, '2016-09-07', '15:19:44', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 15:19:44'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473233085, '2016-09-07', '15:24:45', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:24:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473233085, '2016-09-07', '15:24:45', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 15:24:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473233385, '2016-09-07', '15:29:45', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:29:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473233385, '2016-09-07', '15:29:45', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 15:29:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473233403, '2016-09-07', '15:30:03', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:30:03'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473233455, '2016-09-07', '15:30:55', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:30:55'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473233685, '2016-09-07', '15:34:45', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:34:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473233685, '2016-09-07', '15:34:45', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 15:34:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473233925, '2016-09-07', '15:38:45', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:38:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473234641, '2016-09-07', '15:50:41', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 15:50:41'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473234641, '2016-09-07', '15:50:41', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:50:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473234641, '2016-09-07', '15:50:41', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 15:50:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473234941, '2016-09-07', '15:55:41', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 15:55:41'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473234941, '2016-09-07', '15:55:41', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 15:55:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473234941, '2016-09-07', '15:55:41', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 15:55:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473235241, '2016-09-07', '16:00:41', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:00:41'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473235241, '2016-09-07', '16:00:41', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:00:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473235241, '2016-09-07', '16:00:41', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:00:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473235542, '2016-09-07', '16:05:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:05:42'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473235542, '2016-09-07', '16:05:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:05:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473235542, '2016-09-07', '16:05:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:05:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473235842, '2016-09-07', '16:10:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:10:42'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473235842, '2016-09-07', '16:10:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:10:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473235842, '2016-09-07', '16:10:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:10:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473235879, '2016-09-07', '16:11:19', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:11:19'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473235996, '2016-09-07', '16:13:16', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:13:16'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473236142, '2016-09-07', '16:15:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:15:42'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473236142, '2016-09-07', '16:15:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:15:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473236142, '2016-09-07', '16:15:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:15:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473236444, '2016-09-07', '16:20:44', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:20:44'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473236444, '2016-09-07', '16:20:44', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:20:44'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473236444, '2016-09-07', '16:20:44', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:20:44'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)');
INSERT INTO `gd_cron_log` (`log_time`, `date`, `time`, `action`, `text`) VALUES
(1473236745, '2016-09-07', '16:25:45', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:25:45'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473236745, '2016-09-07', '16:25:45', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:25:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473236745, '2016-09-07', '16:25:45', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:25:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473237045, '2016-09-07', '16:30:45', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:30:45'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473237045, '2016-09-07', '16:30:45', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:30:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473237045, '2016-09-07', '16:30:45', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:30:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473237345, '2016-09-07', '16:35:45', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:35:45'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473237345, '2016-09-07', '16:35:45', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:35:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473237345, '2016-09-07', '16:35:45', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:35:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473237646, '2016-09-07', '16:40:46', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:40:46'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473237646, '2016-09-07', '16:40:46', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:40:46'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473237646, '2016-09-07', '16:40:46', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:40:46'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473237946, '2016-09-07', '16:45:46', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:45:46'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473237946, '2016-09-07', '16:45:46', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:45:46'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473237946, '2016-09-07', '16:45:46', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:45:46'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473238248, '2016-09-07', '16:50:48', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:50:48'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473238248, '2016-09-07', '16:50:48', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:50:48'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473238248, '2016-09-07', '16:50:48', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:50:48'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473238549, '2016-09-07', '16:55:49', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 16:55:49'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473238549, '2016-09-07', '16:55:49', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 16:55:49'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473238549, '2016-09-07', '16:55:49', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 16:55:49'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473238849, '2016-09-07', '17:00:49', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:00:49'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473238849, '2016-09-07', '17:00:49', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:00:49'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473238849, '2016-09-07', '17:00:49', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:00:49'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473239149, '2016-09-07', '17:05:49', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:05:49'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473239149, '2016-09-07', '17:05:49', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:05:49'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473239149, '2016-09-07', '17:05:49', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:05:49'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)');
INSERT INTO `gd_cron_log` (`log_time`, `date`, `time`, `action`, `text`) VALUES
(1473239449, '2016-09-07', '17:10:49', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:10:49'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473239449, '2016-09-07', '17:10:49', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:10:49'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473239450, '2016-09-07', '17:10:50', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:10:50'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473239750, '2016-09-07', '17:15:50', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:15:50'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473239750, '2016-09-07', '17:15:50', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:15:50'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473239750, '2016-09-07', '17:15:50', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:15:50'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473240050, '2016-09-07', '17:20:50', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:20:50'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473240050, '2016-09-07', '17:20:50', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:20:50'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473240050, '2016-09-07', '17:20:50', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:20:50'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473240351, '2016-09-07', '17:25:51', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:25:51'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473240351, '2016-09-07', '17:25:51', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:25:51'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473240351, '2016-09-07', '17:25:51', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:25:51'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473240651, '2016-09-07', '17:30:51', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:30:51'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473240651, '2016-09-07', '17:30:51', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:30:51'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473240651, '2016-09-07', '17:30:51', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:30:51'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473240948, '2016-09-07', '17:35:48', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:35:48'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473240951, '2016-09-07', '17:35:51', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:35:51'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473240951, '2016-09-07', '17:35:51', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:35:51'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473240951, '2016-09-07', '17:35:51', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:35:51'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473240963, '2016-09-07', '17:36:03', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:36:03'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473241018, '2016-09-07', '17:36:58', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:36:58'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473241037, '2016-09-07', '17:37:17', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:37:17'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473241251, '2016-09-07', '17:40:51', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:40:51'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473241251, '2016-09-07', '17:40:51', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:40:51'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473241251, '2016-09-07', '17:40:51', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:40:51'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473241389, '2016-09-07', '17:43:09', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:43:09'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473241552, '2016-09-07', '17:45:52', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:45:52'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473241552, '2016-09-07', '17:45:52', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:45:52'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473241552, '2016-09-07', '17:45:52', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:45:52'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473241853, '2016-09-07', '17:50:53', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:50:53'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473241853, '2016-09-07', '17:50:53', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:50:53'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473241853, '2016-09-07', '17:50:53', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:50:53'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)');
INSERT INTO `gd_cron_log` (`log_time`, `date`, `time`, `action`, `text`) VALUES
(1473242153, '2016-09-07', '17:55:53', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 17:55:53'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473242153, '2016-09-07', '17:55:53', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 17:55:53'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473242153, '2016-09-07', '17:55:53', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 17:55:53'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473242453, '2016-09-07', '18:00:53', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 18:00:53'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473242453, '2016-09-07', '18:00:53', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 18:00:53'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473242453, '2016-09-07', '18:00:53', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 18:00:53'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)'),
(1473242753, '2016-09-07', '18:05:53', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-07 18:05:53'',\n  ''insert'' => \n  array (\n    0 => \n    array (\n      ''type'' => ''Au(T+D)'',\n      ''typename'' => ''黄金延期'',\n      ''price'' => ''289.28'',\n      ''openingprice'' => ''286.66'',\n      ''maxprice'' => ''290.30'',\n      ''minprice'' => ''286.21'',\n      ''changepercent'' => ''1.20%'',\n      ''lastclosingprice'' => ''285.85'',\n      ''tradeamount'' => ''92030.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    1 => \n    array (\n      ''type'' => ''Au(T+N2)'',\n      ''typename'' => ''延期双金'',\n      ''price'' => ''292.00'',\n      ''openingprice'' => ''287.50'',\n      ''maxprice'' => ''292.00'',\n      ''minprice'' => ''275.00'',\n      ''changepercent'' => ''1.81%'',\n      ''lastclosingprice'' => ''286.80'',\n      ''tradeamount'' => ''20318.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:17'',\n    ),\n    2 => \n    array (\n      ''type'' => ''Au99.99'',\n      ''typename'' => ''沪金99'',\n      ''price'' => ''289.40'',\n      ''openingprice'' => ''286.30'',\n      ''maxprice'' => ''290.45'',\n      ''minprice'' => ''286.00'',\n      ''changepercent'' => ''1.08%'',\n      ''lastclosingprice'' => ''286.30'',\n      ''tradeamount'' => ''14878.5200'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    3 => \n    array (\n      ''type'' => ''mAu(T+D)'',\n      ''typename'' => ''迷你黄金延期'',\n      ''price'' => ''289.52'',\n      ''openingprice'' => ''286.58'',\n      ''maxprice'' => ''290.33'',\n      ''minprice'' => ''286.46'',\n      ''changepercent'' => ''1.21%'',\n      ''lastclosingprice'' => ''286.07'',\n      ''tradeamount'' => ''8584.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:26'',\n    ),\n    4 => \n    array (\n      ''type'' => ''Au99.95'',\n      ''typename'' => ''沪金95'',\n      ''price'' => ''289.21'',\n      ''openingprice'' => ''287.00'',\n      ''maxprice'' => ''290.20'',\n      ''minprice'' => ''286.90'',\n      ''changepercent'' => ''1.14%'',\n      ''lastclosingprice'' => ''285.96'',\n      ''tradeamount'' => ''1394.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    5 => \n    array (\n      ''type'' => ''Au(T+N1)'',\n      ''typename'' => ''延期单金'',\n      ''price'' => ''291.55'',\n      ''openingprice'' => ''289.00'',\n      ''maxprice'' => ''293.00'',\n      ''minprice'' => ''289.00'',\n      ''changepercent'' => ''0.99%'',\n      ''lastclosingprice'' => ''288.70'',\n      ''tradeamount'' => ''214.2000'',\n      ''updatetime'' => ''2016-09-07 15:29:24'',\n    ),\n    6 => \n    array (\n      ''type'' => ''Pt99.95'',\n      ''typename'' => ''沪铂95'',\n      ''price'' => ''251.00'',\n      ''openingprice'' => ''250.50'',\n      ''maxprice'' => ''251.00'',\n      ''minprice'' => ''250.50'',\n      ''changepercent'' => ''2.00%'',\n      ''lastclosingprice'' => ''246.07'',\n      ''tradeamount'' => ''190.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    7 => \n    array (\n      ''type'' => ''Au100g'',\n      ''typename'' => ''沪金100G'',\n      ''price'' => ''289.25'',\n      ''openingprice'' => ''287.49'',\n      ''maxprice'' => ''290.49'',\n      ''minprice'' => ''287.00'',\n      ''changepercent'' => ''1.13%'',\n      ''lastclosingprice'' => ''286.02'',\n      ''tradeamount'' => ''99.6000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    8 => \n    array (\n      ''type'' => ''iAu99.99'',\n      ''typename'' => ''IAU99.99'',\n      ''price'' => ''288.50'',\n      ''openingprice'' => ''286.95'',\n      ''maxprice'' => ''288.50'',\n      ''minprice'' => ''286.95'',\n      ''changepercent'' => ''0.95%'',\n      ''lastclosingprice'' => ''285.79'',\n      ''tradeamount'' => ''0.2600'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    9 => \n    array (\n      ''type'' => ''iAu100g'',\n      ''typename'' => ''IAU100G'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''261.18'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n    10 => \n    array (\n      ''type'' => ''iAu99.5'',\n      ''typename'' => ''IAU99.5'',\n      ''price'' => ''0.00'',\n      ''openingprice'' => ''0.00'',\n      ''maxprice'' => ''0.00'',\n      ''minprice'' => ''0.00'',\n      ''changepercent'' => ''0.00%'',\n      ''lastclosingprice'' => ''237.80'',\n      ''tradeamount'' => ''0.0000'',\n      ''updatetime'' => ''2016-09-07 15:29:27'',\n    ),\n  ),\n)'),
(1473242753, '2016-09-07', '18:05:53', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-07 18:05:53'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473242753, '2016-09-07', '18:05:53', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-07 18:05:53'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n)');

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
  `group_id` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `referrer_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `gd_customer_apply` (
  `apply_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` decimal(11,2) NOT NULL DEFAULT '0.00',
  `mode` enum('appling','order') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'appling',
  `note` text COLLATE utf8_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `locker_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, '铜牌', 'bronze', NULL, NULL, '铜牌客户', 1, 1, 1472583692, 1472583692),
(2, '银牌', 'silver', NULL, NULL, '银牌客户', 1, 1, 1472589632, 1472589632),
(3, '金牌', ' gold', NULL, NULL, '金牌客户', 1, 1, 1472589963, 1472589963),
(4, '钻石', 'diamond', NULL, NULL, '钻石客户', 1, 1, 1472589995, 1472589995);

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

CREATE TABLE `gd_customer_stock` (
  `stock_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `mode` enum('in','out','profit','free') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'profit',
  `project_sn` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `weight` decimal(13,2) NOT NULL DEFAULT '0.00',
  `file` text COLLATE utf8_unicode_ci,
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(11, 6, 'profit', 'GM1609016370915225', '1.15', NULL, 1, '删除项目', 3, 1472707008),
(12, 9, 'profit', 'GR1609011121322704', '0.78', NULL, 1, NULL, 0, 1473225890),
(13, 6, 'profit', 'GR1609049592224441', '0.17', NULL, 1, NULL, 0, 1473225890),
(14, 10, 'profit', 'GM1609055931733042', '0.30', NULL, 1, NULL, 0, 1473225890),
(15, 6, 'profit', 'GR1609069731685843', '1.47', NULL, 1, NULL, 0, 1473225890),
(16, 4, 'profit', 'GR1609062941713226', '0.83', NULL, 1, NULL, 0, 1473225890);

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
(33, '2016-09-06', 'Au99.99', '沪金99', '286.30', 1473208513);

-- --------------------------------------------------------

--
-- 表的结构 `gd_golden_today`
--

CREATE TABLE `gd_golden_today` (
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
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_golden_today`
--

INSERT INTO `gd_golden_today` (`date`, `type`, `typename`, `price`, `opening`, `maxprice`, `minprice`, `change`, `lastclosing`, `tradeamount`, `updatetime`, `addtime`) VALUES
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
('2016-09-05', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473087178, 1473087919),
('2016-09-06', 'Au(T+D)', '黄金延期', '285.56', '285.47', '285.88', '285.23', '0.14', '285.16', '9470.0000', 1473100126, 1473122091),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '285.66', '285.40', '285.84', '285.25', '0.14', '285.25', '772.0000', 1473100164, 1473122091),
('2016-09-06', 'Au99.95', '沪金95', '285.59', '286.00', '286.00', '285.59', '0.08', '285.36', '54.0000', 1473098027, 1473122091),
('2016-09-06', 'Au99.99', '沪金99', '285.52', '286.25', '286.25', '285.40', '0.07', '285.33', '31.0800', 1473099637, 1473122091),
('2016-09-06', 'Pt99.95', '沪铂95', '244.75', '244.75', '244.75', '244.75', '0.28', '244.07', '8.0000', 1473100083, 1473122091),
('2016-09-06', 'Au100g', '沪金100G', '285.99', '285.31', '286.00', '285.31', '0.14', '285.58', '4.4000', 1473099128, 1473122091),
('2016-09-06', 'Au(T+N1)', '延期单金', '288.55', '288.20', '288.90', '287.25', '0.12', '288.20', '3.4000', 1473100151, 1473122091),
('2016-09-06', 'iAu99.99', 'IAU99.99', '286.36', '286.36', '286.36', '286.36', '0.44', '285.10', '0.0200', 1473100018, 1473122091),
('2016-09-06', 'Au(T+N2)', '延期双金', '0.00', '0.00', '0.00', '0.00', '0.00', '285.30', '0.0000', 1473100171, 1473122091),
('2016-09-05', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473088153, 1473122091),
('2016-09-06', 'Au(T+D)', '黄金延期', '285.28', '285.47', '285.88', '285.23', '0.04', '285.16', '10454.0000', 1473124288, 1473126060),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '285.36', '285.40', '285.84', '285.25', '0.04', '285.25', '848.6000', 1473124288, 1473126060),
('2016-09-06', 'Au99.99', '沪金99', '285.55', '286.25', '286.25', '285.40', '0.08', '285.33', '95.3200', 1473124273, 1473126060),
('2016-09-06', 'Au99.95', '沪金95', '285.59', '286.00', '286.00', '285.59', '0.08', '285.36', '54.0000', 1473124067, 1473126060),
('2016-09-06', 'Pt99.95', '沪铂95', '244.75', '244.75', '244.75', '244.75', '0.28', '244.07', '8.0000', 1473123603, 1473126060),
('2016-09-06', 'Au100g', '沪金100G', '285.99', '285.31', '286.00', '285.31', '0.14', '285.58', '4.4000', 1473124169, 1473126060),
('2016-09-06', 'Au(T+N1)', '延期单金', '288.55', '288.20', '288.90', '287.25', '0.12', '288.20', '3.4000', 1473124255, 1473126060),
('2016-09-06', 'iAu99.99', 'IAU99.99', '286.36', '286.36', '286.36', '286.36', '0.44', '285.10', '0.0200', 1473124288, 1473126060),
('2016-09-06', 'Au(T+N2)', '延期双金', '0.00', '0.00', '0.00', '0.00', '0.00', '285.30', '0.0000', 1473124237, 1473126060),
('2016-09-06', 'Au(T+D)', '黄金延期', '285.48', '285.47', '285.88', '285.23', '0.11', '285.16', '12270.0000', 1473125372, 1473127260),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '285.60', '285.40', '285.84', '285.25', '0.12', '285.25', '966.6000', 1473125364, 1473127260),
('2016-09-06', 'Au99.99', '沪金99', '285.60', '286.25', '286.25', '285.40', '0.09', '285.33', '244.9000', 1473125352, 1473127260),
('2016-09-06', 'Au(T+N1)', '延期单金', '288.45', '288.20', '288.90', '287.25', '0.09', '288.20', '97.4000', 1473125364, 1473127260),
('2016-09-06', 'Au(T+N2)', '延期双金', '286.85', '286.80', '286.85', '286.80', '0.54', '285.30', '93.8000', 1473125365, 1473127260),
('2016-09-06', 'Au99.95', '沪金95', '285.59', '286.00', '286.00', '285.59', '0.08', '285.36', '54.0000', 1473125192, 1473127260),
('2016-09-06', 'Pt99.95', '沪铂95', '244.75', '244.75', '244.75', '244.75', '0.28', '244.07', '8.0000', 1473125270, 1473127260),
('2016-09-06', 'Au100g', '沪金100G', '285.79', '285.31', '286.00', '285.31', '0.07', '285.58', '6.6000', 1473125211, 1473127260),
('2016-09-06', 'iAu99.99', 'IAU99.99', '286.36', '286.36', '286.36', '286.36', '0.44', '285.10', '0.0200', 1473125366, 1473127260),
('2016-09-06', 'Au(T+N1)', '延期单金', '288.40', '288.20', '288.90', '287.25', '0.07', '288.20', '20097.4000', 1473127865, 1473128943),
('2016-09-06', 'Au(T+D)', '黄金延期', '285.35', '285.47', '285.88', '285.23', '0.07', '285.16', '17798.0000', 1473127917, 1473128943),
('2016-09-06', 'Au99.99', '沪金99', '285.48', '286.25', '286.25', '285.40', '0.05', '285.33', '1665.4000', 1473127917, 1473128943),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '285.46', '285.40', '285.84', '285.25', '0.07', '285.25', '1217.6000', 1473127906, 1473128943),
('2016-09-06', 'Au(T+N2)', '延期双金', '286.80', '286.80', '286.85', '286.80', '0.53', '285.30', '94.0000', 1473127904, 1473128943),
('2016-09-06', 'Au99.95', '沪金95', '285.40', '286.00', '286.00', '285.40', '0.01', '285.36', '66.0000', 1473127729, 1473128943),
('2016-09-06', 'Au100g', '沪金100G', '285.50', '285.31', '286.00', '285.31', '-0.03', '285.58', '9.4000', 1473127762, 1473128943),
('2016-09-06', 'Pt99.95', '沪铂95', '244.75', '244.75', '244.75', '244.75', '0.28', '244.07', '8.0000', 1473126984, 1473128943),
('2016-09-06', 'iAu99.99', 'IAU99.99', '286.36', '286.36', '286.36', '286.36', '0.44', '285.10', '0.0200', 1473127916, 1473128943),
('2016-09-06', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473126163, 1473128943),
('2016-09-06', 'Au(T+D)', '黄金延期', '285.55', '285.47', '285.88', '285.23', '0.14', '285.16', '22134.0000', 1473131549, 1473132657),
('2016-09-06', 'Au(T+N1)', '延期单金', '288.40', '288.20', '288.90', '287.25', '0.07', '288.20', '20097.4000', 1473131538, 1473132657),
('2016-09-06', 'Au99.99', '沪金99', '285.76', '286.25', '286.25', '285.40', '0.15', '285.33', '5865.1600', 1473131532, 1473132657),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '285.75', '285.40', '285.84', '285.25', '0.18', '285.25', '1575.0000', 1473131547, 1473132657),
('2016-09-06', 'Au99.95', '沪金95', '285.65', '286.00', '286.00', '285.40', '0.10', '285.36', '378.0000', 1473131485, 1473132657),
('2016-09-06', 'Pt99.95', '沪铂95', '245.75', '244.75', '245.75', '244.75', '0.69', '244.07', '110.0000', 1473131281, 1473132657),
('2016-09-06', 'Au(T+N2)', '延期双金', '286.90', '286.80', '286.90', '286.80', '0.56', '285.30', '94.2000', 1473131423, 1473132657),
('2016-09-06', 'Au100g', '沪金100G', '285.90', '285.31', '286.00', '285.31', '0.11', '285.58', '14.2000', 1473131331, 1473132657),
('2016-09-06', 'iAu99.99', 'IAU99.99', '286.36', '286.36', '286.36', '286.36', '0.44', '285.10', '0.0200', 1473131545, 1473132657),
('2016-09-06', 'Au(T+D)', '黄金延期', '285.62', '285.47', '285.88', '285.23', '0.16', '285.16', '22482.0000', 1473132569, 1473134156),
('2016-09-06', 'Au(T+N1)', '延期单金', '288.40', '288.20', '288.90', '287.25', '0.07', '288.20', '20097.4000', 1473132571, 1473134156),
('2016-09-06', 'Au99.99', '沪金99', '285.70', '286.25', '286.25', '285.40', '0.13', '285.33', '6363.4200', 1473132567, 1473134156),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '285.50', '285.40', '285.84', '285.25', '0.09', '285.25', '1602.0000', 1473132562, 1473134156),
('2016-09-06', 'Au99.95', '沪金95', '285.70', '286.00', '286.00', '285.40', '0.12', '285.36', '396.0000', 1473132571, 1473134156),
('2016-09-06', 'Pt99.95', '沪铂95', '245.75', '244.75', '245.75', '244.75', '0.69', '244.07', '150.0000', 1473132547, 1473134156),
('2016-09-06', 'Au(T+N2)', '延期双金', '286.90', '286.80', '286.90', '286.80', '0.56', '285.30', '94.2000', 1473132566, 1473134156),
('2016-09-06', 'Au100g', '沪金100G', '285.90', '285.31', '286.00', '285.31', '0.11', '285.58', '14.2000', 1473132368, 1473134156),
('2016-09-06', 'iAu99.99', 'IAU99.99', '286.36', '286.36', '286.36', '286.36', '0.44', '285.10', '0.0200', 1473132562, 1473134156),
('2016-09-06', 'Au(T+D)', '黄金延期', '285.60', '285.47', '285.88', '285.23', '0.15', '285.16', '24852.0000', 1473142373, 1473143507),
('2016-09-06', 'Au(T+N1)', '延期单金', '288.40', '288.20', '288.90', '287.25', '0.07', '288.20', '20097.4000', 1473142376, 1473143507),
('2016-09-06', 'Au99.99', '沪金99', '285.74', '286.25', '286.25', '285.40', '0.14', '285.33', '8688.1600', 1473142378, 1473143507),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '285.67', '285.40', '285.84', '285.25', '0.15', '285.25', '1806.4000', 1473142372, 1473143507),
('2016-09-06', 'Au99.95', '沪金95', '285.59', '286.00', '286.00', '285.40', '0.08', '285.36', '482.0000', 1473142376, 1473143507),
('2016-09-06', 'Pt99.95', '沪铂95', '246.00', '244.75', '246.00', '244.75', '0.79', '244.07', '312.0000', 1473141701, 1473143507),
('2016-09-06', 'Au(T+N2)', '延期双金', '286.90', '286.80', '286.90', '286.80', '0.56', '285.30', '94.2000', 1473142376, 1473143507),
('2016-09-06', 'Au100g', '沪金100G', '285.76', '285.31', '286.00', '285.31', '0.06', '285.58', '18.0000', 1473142282, 1473143507),
('2016-09-06', 'iAu99.99', 'IAU99.99', '286.36', '286.36', '286.36', '286.36', '0.44', '285.10', '0.0200', 1473142276, 1473143507),
('2016-09-06', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473142155, 1473143507),
('2016-09-06', 'Au(T+D)', '黄金延期', '285.55', '285.47', '285.88', '285.23', '0.14', '285.16', '25632.0000', 1473143464, 1473145299),
('2016-09-06', 'Au(T+N1)', '延期单金', '288.35', '288.20', '288.90', '287.25', '0.05', '288.20', '20098.4000', 1473143333, 1473145299),
('2016-09-06', 'Au99.99', '沪金99', '285.79', '286.25', '286.25', '285.40', '0.16', '285.33', '9870.3200', 1473143454, 1473145299),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '285.61', '285.40', '285.84', '285.25', '0.13', '285.25', '1842.2000', 1473143457, 1473145299),
('2016-09-06', 'Au99.95', '沪金95', '285.55', '286.00', '286.00', '285.40', '0.07', '285.36', '550.0000', 1473143458, 1473145299),
('2016-09-06', 'Pt99.95', '沪铂95', '246.50', '244.75', '246.50', '244.75', '1.00', '244.07', '322.0000', 1473143147, 1473145299),
('2016-09-06', 'Au(T+N2)', '延期双金', '286.90', '286.80', '286.90', '286.80', '0.56', '285.30', '94.2000', 1473143377, 1473145299),
('2016-09-06', 'Au100g', '沪金100G', '285.80', '285.31', '286.00', '285.31', '0.08', '285.58', '19.4000', 1473143167, 1473145299),
('2016-09-06', 'iAu99.99', 'IAU99.99', '286.00', '286.36', '286.36', '285.90', '0.32', '285.10', '2.0400', 1473143458, 1473145299),
('2016-09-06', 'Au(T+D)', '黄金延期', '285.71', '285.47', '285.88', '285.23', '0.19', '285.16', '30208.0000', 1473145982, 1473147561),
('2016-09-06', 'Au(T+N1)', '延期单金', '288.85', '288.20', '288.90', '287.25', '0.23', '288.20', '24098.4000', 1473145403, 1473147561),
('2016-09-06', 'Au99.99', '沪金99', '286.00', '286.25', '286.25', '285.40', '0.23', '285.33', '14222.3000', 1473145972, 1473147561),
('2016-09-06', 'Au(T+N2)', '延期双金', '285.60', '286.80', '286.90', '285.60', '0.11', '285.30', '4128.4000', 1473145960, 1473147561),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '285.77', '285.40', '285.84', '285.25', '0.18', '285.25', '2152.0000', 1473145979, 1473147561),
('2016-09-06', 'Au99.95', '沪金95', '285.65', '286.00', '286.00', '285.35', '0.10', '285.36', '910.0000', 1473145973, 1473147561),
('2016-09-06', 'Pt99.95', '沪铂95', '246.50', '244.75', '246.50', '244.75', '1.00', '244.07', '322.0000', 1473144148, 1473147561),
('2016-09-06', 'Au100g', '沪金100G', '285.90', '285.31', '286.00', '285.31', '0.11', '285.58', '20.6000', 1473145778, 1473147561),
('2016-09-06', 'iAu99.99', 'IAU99.99', '285.75', '286.36', '286.36', '285.75', '0.23', '285.10', '2.0800', 1473145778, 1473147561),
('2016-09-06', 'Au(T+D)', '黄金延期', '285.87', '285.47', '285.90', '285.23', '0.25', '285.16', '32848.0000', 1473146971, 1473151056),
('2016-09-06', 'Au(T+N1)', '延期单金', '288.85', '288.20', '288.90', '287.25', '0.23', '288.20', '24098.6000', 1473146971, 1473151056),
('2016-09-06', 'Au99.99', '沪金99', '286.30', '286.25', '286.30', '285.40', '0.34', '285.33', '14735.7600', 1473146971, 1473151056),
('2016-09-06', 'Au(T+N2)', '延期双金', '285.60', '286.80', '286.90', '285.60', '0.11', '285.30', '4128.4000', 1473146944, 1473151056),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '286.02', '285.40', '286.10', '285.25', '0.27', '285.25', '2454.8000', 1473146970, 1473151056),
('2016-09-06', 'Au99.95', '沪金95', '285.97', '286.00', '286.00', '285.35', '0.21', '285.36', '924.0000', 1473146971, 1473151056),
('2016-09-06', 'Pt99.95', '沪铂95', '246.50', '244.75', '246.50', '244.75', '1.00', '244.07', '322.0000', 1473146971, 1473151056),
('2016-09-06', 'Au100g', '沪金100G', '286.19', '285.31', '286.19', '285.31', '0.21', '285.58', '28.0000', 1473146971, 1473151056),
('2016-09-06', 'iAu99.99', 'IAU99.99', '285.80', '286.36', '286.36', '285.75', '0.25', '285.10', '8.2800', 1473146971, 1473151056),
('2016-09-06', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473146971, 1473151056),
('2016-09-06', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1473146971, 1473151056),
('2016-09-06', 'Au(T+D)', '黄金延期', '286.80', '286.66', '287.00', '286.21', '0.33', '285.85', '16758.0000', 1473167670, 1473169975),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '286.90', '286.58', '287.11', '286.46', '0.29', '286.07', '1062.6000', 1473167668, 1473169975),
('2016-09-06', 'Au99.95', '沪金95', '287.00', '287.00', '287.10', '286.90', '0.36', '285.96', '60.0000', 1473167651, 1473169975),
('2016-09-06', 'Au99.99', '沪金99', '287.00', '286.30', '287.00', '286.00', '0.24', '286.30', '21.5200', 1473167660, 1473169975),
('2016-09-06', 'Au(T+N1)', '延期单金', '289.50', '289.00', '289.50', '289.00', '0.28', '288.70', '16.2000', 1473166888, 1473169975),
('2016-09-06', 'Au(T+N2)', '延期双金', '287.80', '287.50', '287.80', '287.50', '0.35', '286.80', '2.0000', 1473166549, 1473169975),
('2016-09-06', 'Au100g', '沪金100G', '287.49', '287.49', '287.49', '287.49', '0.51', '286.02', '0.4000', 1473167662, 1473169975),
('2016-09-06', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473166513, 1473169975),
('2016-09-06', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1473161950, 1473169975),
('2016-09-06', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '285.79', '0.0000', 1473167664, 1473169975),
('2016-09-06', 'Pt99.95', '沪铂95', '0.00', '0.00', '0.00', '0.00', '0.00', '246.07', '0.0000', 1473165076, 1473169975),
('2016-09-06', 'Au(T+D)', '黄金延期', '286.92', '286.66', '287.00', '286.21', '0.37', '285.85', '18604.0000', 1473168756, 1473171175),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '287.07', '286.58', '287.15', '286.46', '0.35', '286.07', '1215.6000', 1473168755, 1473171175),
('2016-09-06', 'Au99.95', '沪金95', '287.00', '287.00', '287.10', '286.90', '0.36', '285.96', '60.0000', 1473168540, 1473171175),
('2016-09-06', 'Au99.99', '沪金99', '286.93', '286.30', '287.00', '286.00', '0.22', '286.30', '30.2000', 1473168692, 1473171175),
('2016-09-06', 'Au(T+N1)', '延期单金', '289.50', '289.00', '289.50', '289.00', '0.28', '288.70', '16.2000', 1473168384, 1473171175),
('2016-09-06', 'Au(T+N2)', '延期双金', '287.80', '287.50', '287.80', '287.50', '0.35', '286.80', '2.0000', 1473168613, 1473171175),
('2016-09-06', 'Au100g', '沪金100G', '287.00', '287.49', '287.49', '287.00', '0.34', '286.02', '1.0000', 1473168730, 1473171175),
('2016-09-06', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '285.79', '0.0000', 1473168746, 1473171175),
('2016-09-06', 'Au(T+D)', '黄金延期', '287.63', '286.66', '287.65', '286.21', '0.62', '285.85', '31758.0000', 1473172356, 1473173097),
('2016-09-06', 'mAu(T+D)', '迷你黄金延期', '287.60', '286.58', '287.77', '286.46', '0.53', '286.07', '2329.4000', 1473172352, 1473173097),
('2016-09-06', 'Au99.99', '沪金99', '287.30', '286.30', '287.55', '286.00', '0.35', '286.30', '75.3800', 1473172346, 1473173097),
('2016-09-06', 'Au99.95', '沪金95', '287.00', '287.00', '287.10', '286.90', '0.36', '285.96', '60.0000', 1473172061, 1473173097),
('2016-09-06', 'Au(T+N1)', '延期单金', '290.00', '289.00', '290.00', '289.00', '0.45', '288.70', '22.2000', 1473172177, 1473173097),
('2016-09-06', 'Au100g', '沪金100G', '287.50', '287.49', '287.50', '287.00', '0.52', '286.02', '7.6000', 1473172099, 1473173097),
('2016-09-06', 'Au(T+N2)', '延期双金', '288.30', '287.50', '288.50', '287.50', '0.52', '286.80', '2.6000', 1473172111, 1473173097),
('2016-09-06', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473170513, 1473173097),
('2016-09-06', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '285.79', '0.0000', 1473172352, 1473173097),
('2016-09-06', 'Pt99.95', '沪铂95', '0.00', '0.00', '0.00', '0.00', '0.00', '246.07', '0.0000', 1473170879, 1473173097),
('2016-09-07', 'Au(T+D)', '黄金延期', '289.30', '286.66', '289.71', '286.21', '1.21', '285.85', '49986.0000', 1473186569, 1473208513),
('2016-09-07', 'mAu(T+D)', '迷你黄金延期', '289.25', '286.58', '289.68', '286.46', '1.11', '286.07', '4443.6000', 1473186569, 1473208513),
('2016-09-07', 'Au99.99', '沪金99', '289.00', '286.30', '289.00', '286.00', '0.94', '286.30', '349.0800', 1473186568, 1473208513),
('2016-09-07', 'Au(T+N2)', '延期双金', '290.55', '287.50', '290.90', '275.00', '1.31', '286.80', '149.8000', 1473186557, 1473208513),
('2016-09-07', 'Au99.95', '沪金95', '287.00', '287.00', '287.10', '286.90', '0.36', '285.96', '60.0000', 1473185931, 1473208513),
('2016-09-07', 'Au(T+N1)', '延期单金', '292.40', '289.00', '293.00', '289.00', '1.28', '288.70', '52.4000', 1473186561, 1473208513),
('2016-09-07', 'Au100g', '沪金100G', '289.00', '287.49', '289.00', '287.00', '1.04', '286.02', '23.4000', 1473186150, 1473208513),
('2016-09-07', 'iAu99.99', 'IAU99.99', '288.00', '286.95', '288.00', '286.95', '0.77', '285.79', '0.1800', 1473186455, 1473208513),
('2016-09-07', 'Pt99.95', '沪铂95', '0.00', '0.00', '0.00', '0.00', '0.00', '246.07', '0.0000', 1473186422, 1473208513),
('2016-09-06', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473174650, 1473208513),
('2016-09-07', 'Au(T+D)', '黄金延期', '289.49', '286.66', '289.71', '286.21', '1.27', '285.85', '57592.0000', 1473212076, 1473215305),
('2016-09-07', 'mAu(T+D)', '迷你黄金延期', '289.47', '286.58', '289.98', '286.46', '1.19', '286.07', '5645.6000', 1473212076, 1473215305),
('2016-09-07', 'Au99.99', '沪金99', '289.44', '286.30', '289.86', '286.00', '1.10', '286.30', '933.6600', 1473212076, 1473215305),
('2016-09-07', 'Au(T+N2)', '延期双金', '290.70', '287.50', '290.95', '275.00', '1.36', '286.80', '245.8000', 1473211981, 1473215305),
('2016-09-07', 'Au99.95', '沪金95', '289.30', '287.00', '289.30', '286.90', '1.17', '285.96', '180.0000', 1473212076, 1473215305),
('2016-09-07', 'Au(T+N1)', '延期单金', '292.45', '289.00', '293.00', '289.00', '1.30', '288.70', '147.4000', 1473212076, 1473215305),
('2016-09-07', 'Au100g', '沪金100G', '289.30', '287.49', '289.30', '287.00', '1.15', '286.02', '46.4000', 1473212059, 1473215305),
('2016-09-07', 'iAu99.99', 'IAU99.99', '288.50', '286.95', '288.50', '286.95', '0.95', '285.79', '0.2600', 1473212065, 1473215305),
('2016-09-07', 'Pt99.95', '沪铂95', '0.00', '0.00', '0.00', '0.00', '0.00', '246.07', '0.0000', 1473211518, 1473215305),
('2016-09-07', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473211126, 1473215305),
('2016-09-07', 'Au(T+D)', '黄金延期', '289.80', '286.66', '289.88', '286.21', '1.38', '285.85', '68236.0000', 1473215708, 1473216505),
('2016-09-07', 'mAu(T+D)', '迷你黄金延期', '289.90', '286.58', '289.98', '286.46', '1.34', '286.07', '6210.8000', 1473215705, 1473216505),
('2016-09-07', 'Au99.99', '沪金99', '290.00', '286.30', '290.00', '286.00', '1.29', '286.30', '3304.5200', 1473215706, 1473216505),
('2016-09-07', 'Au99.95', '沪金95', '289.80', '287.00', '289.80', '286.90', '1.34', '285.96', '418.0000', 1473215679, 1473216505),
('2016-09-07', 'Au(T+N2)', '延期双金', '291.05', '287.50', '291.05', '275.00', '1.48', '286.80', '307.6000', 1473215011, 1473216505),
('2016-09-07', 'Au(T+N1)', '延期单金', '292.55', '289.00', '293.00', '289.00', '1.33', '288.70', '209.8000', 1473215439, 1473216505),
('2016-09-07', 'Pt99.95', '沪铂95', '251.00', '250.50', '251.00', '250.50', '2.00', '246.07', '160.0000', 1473215358, 1473216505),
('2016-09-07', 'Au100g', '沪金100G', '289.86', '287.49', '289.86', '287.00', '1.34', '286.02', '58.4000', 1473215692, 1473216505),
('2016-09-07', 'iAu99.99', 'IAU99.99', '288.50', '286.95', '288.50', '286.95', '0.95', '285.79', '0.2600', 1473215690, 1473216505),
('2016-09-07', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473213835, 1473216505),
('2016-09-07', 'Au(T+D)', '黄金延期', '289.80', '286.66', '289.88', '286.21', '1.38', '285.85', '68118.0000', 1473215674, 1473217982),
('2016-09-07', 'mAu(T+D)', '迷你黄金延期', '289.89', '286.58', '289.98', '286.46', '1.34', '286.07', '6185.6000', 1473215674, 1473217982),
('2016-09-07', 'Au99.99', '沪金99', '290.00', '286.30', '290.00', '286.00', '1.29', '286.30', '3304.4800', 1473215675, 1473217982),
('2016-09-07', 'Au99.95', '沪金95', '289.80', '287.00', '289.80', '286.90', '1.34', '285.96', '418.0000', 1473215673, 1473217982),
('2016-09-07', 'Au100g', '沪金100G', '289.86', '287.49', '289.86', '287.00', '1.34', '286.02', '58.4000', 1473215673, 1473217982),
('2016-09-07', 'iAu99.99', 'IAU99.99', '288.50', '286.95', '288.50', '286.95', '0.95', '285.79', '0.2600', 1473215675, 1473217982),
('2016-09-07', 'Au(T+D)', '黄金延期', '290.20', '286.66', '290.30', '286.21', '1.52', '285.85', '74750.0000', 1473218968, 1473219667),
('2016-09-07', 'mAu(T+D)', '迷你黄金延期', '290.23', '286.58', '290.33', '286.46', '1.45', '286.07', '6687.2000', 1473218968, 1473219667),
('2016-09-07', 'Au99.99', '沪金99', '290.36', '286.30', '290.45', '286.00', '1.42', '286.30', '5498.3400', 1473218963, 1473219667),
('2016-09-07', 'Au99.95', '沪金95', '290.20', '287.00', '290.20', '286.90', '1.48', '285.96', '782.0000', 1473218949, 1473219667),
('2016-09-07', 'Au(T+N2)', '延期双金', '291.00', '287.50', '291.10', '275.00', '1.46', '286.80', '309.0000', 1473218950, 1473219667),
('2016-09-07', 'Au(T+N1)', '延期单金', '292.80', '289.00', '293.00', '289.00', '1.42', '288.70', '210.0000', 1473218949, 1473219667),
('2016-09-07', 'Pt99.95', '沪铂95', '251.00', '250.50', '251.00', '250.50', '2.00', '246.07', '176.0000', 1473218291, 1473219667),
('2016-09-07', 'Au100g', '沪金100G', '290.49', '287.49', '290.49', '287.00', '1.56', '286.02', '86.4000', 1473218965, 1473219667),
('2016-09-07', 'iAu99.99', 'IAU99.99', '288.50', '286.95', '288.50', '286.95', '0.95', '285.79', '0.2600', 1473218966, 1473219667),
('2016-09-07', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473216029, 1473219667),
('2016-09-07', 'Au(T+D)', '黄金延期', '290.15', '286.66', '290.30', '286.21', '1.50', '285.85', '75242.0000', 1473226503, 1473227303),
('2016-09-07', 'mAu(T+D)', '迷你黄金延期', '290.13', '286.58', '290.33', '286.46', '1.42', '286.07', '6735.8000', 1473226502, 1473227303),
('2016-09-07', 'Au99.99', '沪金99', '290.31', '286.30', '290.45', '286.00', '1.40', '286.30', '5539.0400', 1473226500, 1473227303),
('2016-09-07', 'Au99.95', '沪金95', '290.20', '287.00', '290.20', '286.90', '1.48', '285.96', '782.0000', 1473226461, 1473227303),
('2016-09-07', 'Au(T+N2)', '延期双金', '291.00', '287.50', '291.10', '275.00', '1.46', '286.80', '309.0000', 1473226246, 1473227303),
('2016-09-07', 'Au(T+N1)', '延期单金', '292.80', '289.00', '293.00', '289.00', '1.42', '288.70', '210.0000', 1473226237, 1473227303),
('2016-09-07', 'Pt99.95', '沪铂95', '251.00', '250.50', '251.00', '250.50', '2.00', '246.07', '176.0000', 1473226319, 1473227303),
('2016-09-07', 'Au100g', '沪金100G', '290.00', '287.49', '290.49', '287.00', '1.39', '286.02', '87.0000', 1473226405, 1473227303),
('2016-09-07', 'iAu99.99', 'IAU99.99', '288.50', '286.95', '288.50', '286.95', '0.95', '285.79', '0.2600', 1473226480, 1473227303),
('2016-09-07', 'Au(T+D)', '黄金延期', '289.63', '286.66', '290.30', '286.21', '1.32', '285.85', '83148.0000', 1473230137, 1473230982),
('2016-09-07', 'Au99.99', '沪金99', '290.02', '286.30', '290.45', '286.00', '1.30', '286.30', '11106.1400', 1473230128, 1473230982),
('2016-09-07', 'mAu(T+D)', '迷你黄金延期', '289.85', '286.58', '290.33', '286.46', '1.32', '286.07', '7741.2000', 1473230136, 1473230982),
('2016-09-07', 'Au99.95', '沪金95', '289.80', '287.00', '290.20', '286.90', '1.34', '285.96', '958.0000', 1473230136, 1473230982),
('2016-09-07', 'Au(T+N2)', '延期双金', '291.10', '287.50', '291.10', '275.00', '1.50', '286.80', '310.8000', 1473230119, 1473230982),
('2016-09-07', 'Au(T+N1)', '延期单金', '292.65', '289.00', '293.00', '289.00', '1.37', '288.70', '211.6000', 1473230120, 1473230982),
('2016-09-07', 'Pt99.95', '沪铂95', '251.00', '250.50', '251.00', '250.50', '2.00', '246.07', '176.0000', 1473228565, 1473230982),
('2016-09-07', 'Au100g', '沪金100G', '289.60', '287.49', '290.49', '287.00', '1.25', '286.02', '94.8000', 1473230070, 1473230982),
('2016-09-07', 'iAu99.99', 'IAU99.99', '288.50', '286.95', '288.50', '286.95', '0.95', '285.79', '0.2600', 1473230136, 1473230982),
('2016-09-07', 'Au(T+D)', '黄金延期', '289.28', '286.66', '290.30', '286.21', '1.20', '285.85', '92030.0000', 1473233366, 1473234641),
('2016-09-07', 'Au(T+N2)', '延期双金', '292.00', '287.50', '292.00', '275.00', '1.81', '286.80', '20318.0000', 1473233357, 1473234641),
('2016-09-07', 'Au99.99', '沪金99', '289.40', '286.30', '290.45', '286.00', '1.08', '286.30', '14878.5200', 1473233367, 1473234641),
('2016-09-07', 'mAu(T+D)', '迷你黄金延期', '289.52', '286.58', '290.33', '286.46', '1.21', '286.07', '8584.6000', 1473233366, 1473234641),
('2016-09-07', 'Au99.95', '沪金95', '289.21', '287.00', '290.20', '286.90', '1.14', '285.96', '1394.0000', 1473233367, 1473234641),
('2016-09-07', 'Au(T+N1)', '延期单金', '291.55', '289.00', '293.00', '289.00', '0.99', '288.70', '214.2000', 1473233364, 1473234641),
('2016-09-07', 'Pt99.95', '沪铂95', '251.00', '250.50', '251.00', '250.50', '2.00', '246.07', '190.0000', 1473233367, 1473234641),
('2016-09-07', 'Au100g', '沪金100G', '289.25', '287.49', '290.49', '287.00', '1.13', '286.02', '99.6000', 1473233367, 1473234641),
('2016-09-07', 'iAu99.99', 'IAU99.99', '288.50', '286.95', '288.50', '286.95', '0.95', '285.79', '0.2600', 1473233367, 1473234641),
('2016-09-07', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473233367, 1473234641),
('2016-09-07', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1473233367, 1473234641);

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
(101, 'auth', 98, 1, 'download', '下载文件', 'tool/filemanager/download', 1, 0, 0, ''),
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
(20, 'GM1609056201833953', 'investing', 'privacy', '[{"name":"user6-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/0518394375db4a.jpg"}]', 1, 5, 1473071993),
(21, 'GR1609069731685843', 'recycling', 'photo', '[{"name":"user7-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/06165734c21572.jpg"}]', 1, 5, 1473152323),
(22, 'GR1609069731685843', 'recycling', 'invoice', '[{"name":"user8-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/06165813d5dfca.jpg"}]', 1, 5, 1473152323),
(25, 'GR1609062941713226', 'recycling', 'photo', '[{"name":"user7-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/06173248297d0f.jpg"}]', 1, 5, 1473154423),
(26, 'GR1609062941713226', 'recycling', 'report', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/06173252cba3c7.txt"}]', 1, 5, 1473154423);

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
  `locker_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(4, '增长中', 'growing', NULL, '生金增值', 1),
(5, '已驳回', 'refused', NULL, '客户信息等问题造成', 1),
(6, '已终止', 'terminated', NULL, '提前终止项目', 1);

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
  `locker_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `gd_project_recycling`
--

INSERT INTO `gd_project_recycling` (`project_id`, `project_sn`, `status_id`, `customer_id`, `referrer_id`, `price`, `origin_weight`, `weight`, `number`, `type`, `appraiser_id`, `loss`, `start`, `note`, `is_del`, `worker_id`, `transferrer`, `addtime`, `lasttime`, `locker_id`) VALUES
(1, 'GR1608315162053241', 6, 8, 12, '283.16', '22.00', '20.00', 2, 'ornaments', 9, '6.00', NULL, '231243242432', 1, 3, NULL, 1472646761, 1472653784, 0),
(2, 'GR1608319242154447', 6, 7, 0, '283.16', '33.00', '31.00', 3, 'ornaments', 9, '7.00', NULL, 'sawewqrewtretetre', 1, 3, NULL, 1472651087, 1472653349, 0),
(3, 'GR1609018170081051', 4, 8, 12, '282.30', '12.00', '11.00', 1, 'ornaments', 9, '8.00', NULL, '库存已确认标记，自动推进到正在增值', 0, 7, NULL, 1472659851, 1472660062, 0),
(4, 'GR1609011121322704', 4, 9, 12, '282.25', '55.00', '52.00', 1, 'goldbar', 10, '6.00', '2016-09-01', '库存已确认标记，自动推进到正在增值', 0, 7, NULL, 1472707624, 1472707775, 0),
(5, 'GR1609049592224441', 4, 6, 12, '284.31', '12.00', '11.00', 1, 'ornaments', 9, '9.00', '2016-09-04', '库存已确认标记，自动推进到正在增值', 0, 7, '11', 1473000281, 1473064798, 0),
(6, 'GR1609053831781829', 2, 10, 12, '285.39', '50.00', '49.99', 1, 'ornaments', 9, '2.00', '2016-09-05', '', 0, 3, '3', 1473067109, 1473134384, 0),
(7, 'GR1609069731685843', 4, 6, 12, '286.30', '100.00', '98.00', 2, 'goldbar', 9, '2.00', '2016-09-06', '库存已确认标记，自动推进到正在增值', 0, 8, '8', 1473152323, 1473153442, 0),
(8, 'GR1609062941713226', 4, 4, 2, '286.30', '56.00', '55.00', 2, 'ornaments', 11, '0.90', '2016-09-06', '库存已确认标记，自动推进到正在增值', 0, 7, '3', 1473154346, 1473155250, 0);

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
(25, 6, 1, '324324423432', '', 5, 1473083447, '127.0.0.1'),
(26, 6, 2, '', 'array (\n  ''weight'' =&gt; ''49.99'',\n  ''_weight'' =&gt; ''49.99'',\n  ''phone'' =&gt; ''13606660888'',\n  ''_phone'' =&gt; ''13606660888'',\n)', 3, 1473134384, '127.0.0.1'),
(27, 7, 1, 'qweqweqw', '', 5, 1473152323, '127.0.0.1'),
(28, 7, 2, '', 'array (\n  ''weight'' =&gt; ''98.00'',\n  ''_weight'' =&gt; ''98.00'',\n  ''phone'' =&gt; ''18959596767'',\n  ''_phone'' =&gt; ''18959596767'',\n)', 3, 1473152492, '127.0.0.1'),
(29, 7, 3, 'sasdasdsad', 'array (\n  ''weight'' =&gt; ''98.00'',\n  ''_weight'' =&gt; ''98.00'',\n  ''phone'' =&gt; ''18959596767'',\n  ''_phone'' =&gt; ''18959596767'',\n)', 8, 1473153442, '127.0.0.1'),
(30, 7, 4, '库存已确认标记，自动推进到正在增值', '', 8, 1473153442, '127.0.0.1'),
(31, 8, 1, '', '', 5, 1473154346, '127.0.0.1'),
(32, 8, 1, '', '', 5, 1473154375, '127.0.0.1'),
(33, 8, 1, '', '', 5, 1473154423, '127.0.0.1'),
(34, 8, 2, 'dsadsa', 'array (\n  ''weight'' =&gt; ''55.00'',\n  ''_weight'' =&gt; ''55.00'',\n  ''phone'' =&gt; ''18850219878'',\n  ''_phone'' =&gt; ''18850219878'',\n)', 3, 1473154517, '127.0.0.1'),
(35, 8, 3, 'sadasdasdasdsa', 'array (\n  ''weight'' =&gt; ''55.00'',\n  ''_weight'' =&gt; ''55.00'',\n  ''phone'' =&gt; ''18850219878'',\n  ''_phone'' =&gt; ''18850219878'',\n)', 7, 1473154570, '127.0.0.1'),
(36, 8, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473154570, '127.0.0.1'),
(37, 8, 3, 'dsadsa', 'array (\n  ''weight'' =&gt; ''55.00'',\n  ''_weight'' =&gt; ''55.00'',\n  ''phone'' =&gt; ''18850219878'',\n  ''_phone'' =&gt; ''18850219878'',\n)', 7, 1473154774, '127.0.0.1'),
(38, 8, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473154774, '127.0.0.1'),
(39, 8, 3, 'asdsadsa', 'array (\n  ''weight'' =&gt; ''55.00'',\n  ''_weight'' =&gt; ''55.00'',\n  ''phone'' =&gt; ''18850219878'',\n  ''_phone'' =&gt; ''18850219878'',\n)', 7, 1473155001, '127.0.0.1'),
(40, 8, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473155001, '127.0.0.1'),
(41, 8, 3, '', 'array (\n  ''weight'' =&gt; ''55.00'',\n  ''_weight'' =&gt; ''55.00'',\n  ''phone'' =&gt; ''18850219878'',\n  ''_phone'' =&gt; ''18850219878'',\n)', 7, 1473155087, '127.0.0.1'),
(42, 8, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473155087, '127.0.0.1'),
(45, 8, 3, 'sdsadsa', 'array (\n  ''weight'' =&gt; ''55.00'',\n  ''_weight'' =&gt; ''55.00'',\n  ''phone'' =&gt; ''18850219878'',\n  ''_phone'' =&gt; ''18850219878'',\n)', 7, 1473155250, '127.0.0.1'),
(46, 8, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473155250, '127.0.0.1');

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
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('investing','recycling','stock') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'investing',
  `info` text COLLATE utf8_unicode_ci,
  `weight` decimal(13,2) NOT NULL DEFAULT '0.00',
  `start` date DEFAULT NULL,
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

INSERT INTO `gd_project_stock` (`stock_id`, `project_sn`, `customer_id`, `referrer_id`, `title`, `mode`, `info`, `weight`, `start`, `last_profit`, `note`, `status`, `worker_id`, `addtime`, `lasttime`) VALUES
(5, 'GM1609013171352349', 9, 12, '项目GM1609013171352349存金1,000.00克', 'investing', 'a:7:{s:10:"project_id";s:1:"4";s:8:"realname";s:9:"沈万三";s:5:"phone";s:11:"13813800138";s:8:"idnumber";s:18:"138139199810039997";s:5:"price";s:6:"282.25";s:6:"amount";s:9:"282250.00";s:6:"weight";s:7:"1000.00";}', '1000.00', '2016-09-01', '2016-09-07', '我也OK啊', 1, 7, 1472707533, 1472707533),
(6, 'GR1609011121322704', 9, 12, '项目GR1609011121322704存金52.00克', 'recycling', 'a:10:{s:10:"project_id";s:1:"4";s:8:"realname";s:9:"沈万三";s:5:"phone";s:11:"13813800138";s:8:"idnumber";s:18:"138139199810039997";s:5:"price";s:6:"282.25";s:4:"type";s:6:"金条";s:6:"number";s:1:"1";s:13:"origin_weight";s:5:"55.00";s:6:"weight";s:5:"52.00";s:12:"appraiser_id";s:2:"10";}', '52.00', '2016-09-01', '2016-09-07', '偷了他的聚宝盆', 1, 7, 1472707775, 1473225890),
(7, 'GR1609049592224441', 6, 12, '项目GR1609049592224441存金11.00克', 'recycling', 'a:10:{s:10:"project_id";s:1:"5";s:8:"realname";s:9:"余华为";s:5:"phone";s:11:"18959596767";s:8:"idnumber";s:18:"321254198908050604";s:5:"price";s:6:"284.31";s:4:"type";s:6:"金饰";s:6:"number";s:1:"1";s:13:"origin_weight";s:5:"12.00";s:6:"weight";s:5:"11.00";s:12:"appraiser_id";s:1:"9";}', '11.00', '2016-09-04', '2016-09-07', 'asdsadsad', 1, 7, 1473064798, 1473225890),
(8, 'GM1609055931733042', 10, 0, '项目GM1609055931733042存金20.00克', 'investing', 'a:7:{s:10:"project_id";s:1:"5";s:8:"realname";s:9:"赵公明";s:5:"phone";s:11:"13606660888";s:8:"idnumber";s:18:"123321196606066666";s:5:"price";s:6:"285.39";s:6:"amount";s:7:"5707.80";s:6:"weight";s:5:"20.00";}', '20.00', '2016-09-05', '2016-09-07', 'tertretret', 1, 7, 1473068754, 1473225890),
(9, 'GR1609069731685843', 6, 12, '项目GR1609069731685843存金98.00克', 'recycling', 'a:10:{s:10:"project_id";s:1:"7";s:8:"realname";s:9:"余华为";s:5:"phone";s:11:"18959596767";s:8:"idnumber";s:18:"321254198908050604";s:5:"price";s:6:"286.30";s:4:"type";s:6:"金条";s:6:"number";s:1:"2";s:13:"origin_weight";s:6:"100.00";s:6:"weight";s:5:"98.00";s:12:"appraiser_id";s:1:"9";}', '98.00', '2016-09-06', '2016-09-07', 'sasdasdsad', 1, 8, 1473153442, 1473225890),
(10, 'GR1609062941713226', 4, 2, '项目GR1609062941713226存金55.00克', 'recycling', 'a:10:{s:10:"project_id";s:1:"8";s:8:"realname";s:9:"马晓云";s:5:"phone";s:11:"18850219878";s:8:"idnumber";s:18:"321324195406050508";s:5:"price";s:6:"286.30";s:4:"type";s:6:"金饰";s:6:"number";s:1:"2";s:13:"origin_weight";s:5:"56.00";s:6:"weight";s:5:"55.00";s:12:"appraiser_id";s:2:"11";}', '55.00', '2016-09-06', '2016-09-07', 'sadasdasdasdsa', 1, 7, 1473154570, 1473225890);

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
('8077efb993995a1b72d127635e5d6fd74d9fb6e8', '127.0.0.1', 1473148899, '__ci_last_regenerate|i:1473138098;code|s:4:"y8m6";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473124911";'),
('2e200aeebb9c612bf63caff0bb74c08d2a4c1ac3', '127.0.0.1', 1473141107, '__ci_last_regenerate|i:1473138226;code|s:4:"TvjU";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473064770";csrfkey|s:8:"vHKDsjgz";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"H43NFSae8QnMBkZ07bWY";'),
('4bb27dd7a24ddfa9d7be086eff3aa24902fb19db', '127.0.0.1', 1473140898, '__ci_last_regenerate|i:1473138265;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('a148af09ce8cde6a073227ac28fd1663c2330db1', '127.0.0.1', 1473141336, '__ci_last_regenerate|i:1473141224;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('63d8f84494c811bd189860f17d511f2a0a3893dd', '127.0.0.1', 1473142173, '__ci_last_regenerate|i:1473141245;code|s:4:"TvjU";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473064770";csrfkey|s:8:"rcB0O7Fx";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"wjp4qUOFN9PmyhusYia2";'),
('f6cde54a39f8b6ee57d00727b8df4c49fb5eb9fa', '127.0.0.1', 1473151790, '__ci_last_regenerate|i:1473142189;code|s:4:"TvjU";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473064770";'),
('903af79f52a854fcf004783fe1584081c047da0b', '127.0.0.1', 1473142490, '__ci_last_regenerate|i:1473142198;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";csrfkey|s:8:"ZhRajrkM";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"RTWfkSwdDJ6xBOgM5Y4P";'),
('c44dd2dfccfc9adb374fc784a6b57e360bd05655', '127.0.0.1', 1473142985, '__ci_last_regenerate|i:1473142514;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";csrfkey|s:8:"Cue2Itis";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"Ys2vFbaMiTe9BwfuldDR";'),
('5e31fc98f7ce523acc2805ee2847a4584ea972a5', '127.0.0.1', 1473143415, '__ci_last_regenerate|i:1473143026;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";csrfkey|s:8:"BLeRZ9a1";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"OKlmsIA3xE5bWqPYkeRM";'),
('bf8d8efa1f65981ee955ec3677c020f827e97018', '127.0.0.1', 1473144708, '__ci_last_regenerate|i:1473143418;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('aa85d21dad0437a41b6b2ee394f4434fdde6c68f', '127.0.0.1', 1473145083, '__ci_last_regenerate|i:1473145082;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('1e7a11d42974e81e2940c249175104c161b80e28', '127.0.0.1', 1473145647, '__ci_last_regenerate|i:1473145408;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";ajax_permission|s:51:"没有授权访问  <br> [project/recycling/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"old";}'),
('a43ea4d46b8c2a92b9302d5f6590ec26d7c7b32e', '127.0.0.1', 1473146106, '__ci_last_regenerate|i:1473145751;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";ajax_permission|s:51:"没有授权访问  <br> [project/recycling/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"old";}'),
('dfe97616d9c8c15d68d05dbcd603c80ad2aca44e', '127.0.0.1', 1473147561, '__ci_last_regenerate|i:1473146121;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";csrfkey|s:8:"FPoarLCz";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"Jz72kf4CwgrnqjuGaOR0";'),
('18eb2dca741fee9ef3e37345ee0360a374483d9a', '127.0.0.1', 1473149521, '__ci_last_regenerate|i:1473148702;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";csrfkey|s:8:"VCR7kJce";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"y9xC6ZUateWzgGX8YLSq";'),
('38eb81484edd5c162af12ad48244c2e4d439f655', '127.0.0.1', 1473149853, '__ci_last_regenerate|i:1473149001;code|s:4:"y8m6";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473124911";csrfkey|s:8:"TJPSK49x";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"BeEnbUO7Hjdu2QtVTikr";'),
('6c4c211289a8144d899d3631dbaee4bc530e2561', '127.0.0.1', 1473149812, '__ci_last_regenerate|i:1473149528;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";csrfkey|s:8:"ZueHSlm7";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"8dAbkvDh6qU9fnuBmVsS";'),
('29c8b2dccf9251085ab8dee45c9d507de56ab1c3', '127.0.0.1', 1473151056, '__ci_last_regenerate|i:1473149855;code|s:4:"y8m6";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473124911";'),
('c68f3e7936debc645753824977a6a12b813f2599', '127.0.0.1', 1473150147, '__ci_last_regenerate|i:1473149875;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('d0940a2c0278b9fa9e961d751255135d11c17cce', '127.0.0.1', 1473150273, '__ci_last_regenerate|i:1473150205;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('d8d23926c9d5cfe8b57db6b5af6738e62823fdf6', '127.0.0.1', 1473151210, '__ci_last_regenerate|i:1473150934;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('d6eb01cac389c012fded9e4c98c8080934397d8e', '127.0.0.1', 1473151456, '__ci_last_regenerate|i:1473151247;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('4920fdc3233fc3ef9c7b50c0426975a77bd0f2c6', '127.0.0.1', 1473151791, '__ci_last_regenerate|i:1473151567;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";ajax_permission|s:51:"没有授权访问  <br> [project/investing/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"old";}'),
('32f8d02f0c4f04d6ff28a583f9952d01d0bf3a05', '127.0.0.1', 1473151661, '__ci_last_regenerate|i:1473151650;code|s:4:"y8m6";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473124911";csrfkey|s:8:"LqrxPB4S";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"awozK801n2RPeDpuSsOr";'),
('d2189dead0aa9baca3bec28dadc995b3d8130498', '127.0.0.1', 1473154346, '__ci_last_regenerate|i:1473152063;code|s:4:"y8m6";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473124911";success|s:21:"项目添加成功！";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('9fbdb5c0737ddb25658f3ab48dd79b553c1b42f1', '127.0.0.1', 1473152492, '__ci_last_regenerate|i:1473152095;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";csrfkey|s:8:"4BkN3TK1";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:7:"success";s:3:"new";}csrfvalue|s:20:"1s8nzAmRbG0DUr7I2C9J";success|s:44:"项目已核实！编号: GR1609069731685843";'),
('02b024d9ff9a215cca64fff65992bee09c025911', '127.0.0.1', 1473152131, '__ci_last_regenerate|i:1473152131;code|s:4:"TvjU";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473064770";'),
('97bc62547f07347491631ec424d3b8ddb0ad353f', '127.0.0.1', 1473152768, '__ci_last_regenerate|i:1473152492;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('7103201a89e2bde06feb16ea37ba27d41d89dcf8', '127.0.0.1', 1473152503, '__ci_last_regenerate|i:1473152502;code|s:4:"TvjU";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473064770";'),
('768f06ecc8484c8426f6299bacf48aa6eec7bee3', '127.0.0.1', 1473153442, '__ci_last_regenerate|i:1473152523;code|s:4:"ma8s";identity|s:12:"kuguan-demo2";username|s:12:"kuguan-demo2";email|s:11:"kuguan@a.cc";user_id|s:1:"8";old_last_login|s:10:"1472280758";csrfkey|s:8:"SlxaoG5P";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:7:"success";s:3:"new";}csrfvalue|s:20:"RFS5TwqpMlWYc8m93LDK";success|s:50:"项目已入库标记！编号: GR1609069731685843";'),
('acc62611300e2bf1faaf94368a9362c469a1d698', '127.0.0.1', 1473153443, '__ci_last_regenerate|i:1473153442;code|s:4:"ma8s";identity|s:12:"kuguan-demo2";username|s:12:"kuguan-demo2";email|s:11:"kuguan@a.cc";user_id|s:1:"8";old_last_login|s:10:"1472280758";'),
('bd7f7441d04caea2219895b2d1a74c4afe0b0980', '127.0.0.1', 1473153750, '__ci_last_regenerate|i:1473153489;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";ajax_permission|s:51:"没有授权访问  <br> [project/recycling/booked]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('e42d31fe348d5dfdabc40188bbb90ead0b6fca75', '127.0.0.1', 1473153586, '__ci_last_regenerate|i:1473153585;code|s:4:"TvjU";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473064770";'),
('7e6679fa1d592f1929291fec42b7227df90a29a5', '127.0.0.1', 1473153684, '__ci_last_regenerate|i:1473153684;code|s:4:"md4z";'),
('228449b98c5cbad16b7086d8ee4d424ca728622b', '127.0.0.1', 1473156825, '__ci_last_regenerate|i:1473154346;code|s:4:"y8m6";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473124911";'),
('bf0cb1a18446387d75916ac555cb4fd0dfaefd26', '127.0.0.1', 1473154721, '__ci_last_regenerate|i:1473154484;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('f476ff6424ebce25157a2b6306ea60382233fc15', '127.0.0.1', 1473154775, '__ci_last_regenerate|i:1473154528;code|s:4:"TvjU";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473064770";'),
('e1186d82547c6fe8baf26609de56908b7c54dd93', '127.0.0.1', 1473155259, '__ci_last_regenerate|i:1473154977;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('2b048a674843abcca66ed9cfd795bc9890427c6c', '127.0.0.1', 1473156451, '__ci_last_regenerate|i:1473154983;code|s:4:"TvjU";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473064770";'),
('b00a4cd5d3244fbc0c6a8bb7936f898fb8ba314c', '127.0.0.1', 1473155640, '__ci_last_regenerate|i:1473155501;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('485fb7ddbc14a2041815dba831b251074070024c', '127.0.0.1', 1473155987, '__ci_last_regenerate|i:1473155985;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('2b2226791facf14a0c77c0675763e19ad834b943', '127.0.0.1', 1473156901, '__ci_last_regenerate|i:1473156725;code|s:4:"3DY3";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473124845";'),
('e3457d2d9ce0a612f8875e2dac830ad56d8ae779', '127.0.0.1', 1473162247, '__ci_last_regenerate|i:1473162241;code|s:4:"XHuQ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473131177";'),
('e5df225582b9770e811f03b1424ff801f5aaa587', '127.0.0.1', 1473163361, '__ci_last_regenerate|i:1473162924;code|s:4:"XHuQ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473131177";ajax_permission|s:51:"没有授权访问  <br> [project/recycling/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('9fd3081dfd94a400edb92f3ce9d0e4f084efdaa0', '127.0.0.1', 1473164626, '__ci_last_regenerate|i:1473163366;code|s:4:"XHuQ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473131177";ajax_permission|s:51:"没有授权访问  <br> [project/recycling/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"old";}'),
('608a7b04091a013ad3bcbab371bbd11c4ac75b57', '127.0.0.1', 1473165030, '__ci_last_regenerate|i:1473164630;code|s:4:"XHuQ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473131177";'),
('5d2404177e2cf4b3d6377e400c41a2cf3dc66e46', '127.0.0.1', 1473171176, '__ci_last_regenerate|i:1473165172;code|s:4:"XHuQ";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473131177";'),
('7ac55183aff003a4c3bb97474873d3f5a0498abb', '127.0.0.1', 1473173564, '__ci_last_regenerate|i:1473172331;code|s:4:"VEn8";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473124819";'),
('cb67e16921ddae073ddfee047e19321ae2d7cc54', '127.0.0.1', 1473173111, '__ci_last_regenerate|i:1473173096;code|s:4:"sD7T";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473162246";'),
('cd1367b3a57e19b90c37300980efff9109e4c3e7', '127.0.0.1', 1473173823, '__ci_last_regenerate|i:1473173616;code|s:4:"sD7T";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473162246";'),
('bff53bf5b127b55b04206905b912c74176f64157', '127.0.0.1', 1473174194, '__ci_last_regenerate|i:1473173957;code|s:4:"sD7T";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473162246";'),
('c529f623c0e276cd17cb05fa97436d5ef022daf3', '127.0.0.1', 1473174347, '__ci_last_regenerate|i:1473174285;code|s:4:"VEn8";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473124819";'),
('76e3a15ff2af1b573e0a240aeb198ad81d4c3e88', '127.0.0.1', 1473208553, '__ci_last_regenerate|i:1473208512;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('40af41bfb9884ff395bc212bf00d3da34c5cfc16', '127.0.0.1', 1473208857, '__ci_last_regenerate|i:1473208856;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('1fb5871c5d9eb6b64fe1177cc5f02c1f470442c5', '127.0.0.1', 1473209587, '__ci_last_regenerate|i:1473209533;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('774d99253f70b1abc2a86445e102ce8d53bb8181', '127.0.0.1', 1473210941, '__ci_last_regenerate|i:1473210746;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";error_permission|s:40:"没有授权访问  <br> [article/index]";__ci_vars|a:1:{s:16:"error_permission";s:3:"new";}'),
('454ff6995c9ce91709032159e9be665f83386fd2', '127.0.0.1', 1473211362, '__ci_last_regenerate|i:1473211132;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";error_permission|s:40:"没有授权访问  <br> [article/index]";__ci_vars|a:1:{s:16:"error_permission";s:3:"new";}'),
('cf474d76a36982c12ff409a4684971d7f0979a79', '127.0.0.1', 1473216505, '__ci_last_regenerate|i:1473211632;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('4dc0329e64a564cc71b1422f08dfff70495b75a3', '127.0.0.1', 1473217595, '__ci_last_regenerate|i:1473217487;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('a6d7f5b78805a6ecd8684f07bfc82b759b8f735c', '127.0.0.1', 1473219382, '__ci_last_regenerate|i:1473217982;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('2a611b317551ca4f87cb87171fee80550bc22e95', '127.0.0.1', 1473219853, '__ci_last_regenerate|i:1473219652;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('19e3e234025c2e7560a01ce2df6fcc850b3cd7a0', '127.0.0.1', 1473220495, '__ci_last_regenerate|i:1473220494;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('25f1fcf99e263c3adf1512649ce32fe030d91edf', '127.0.0.1', 1473222227, '__ci_last_regenerate|i:1473221025;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('3d9007c222fee131800592c64d078324b49c360f', '127.0.0.1', 1473223086, '__ci_last_regenerate|i:1473222866;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('2e7e8c8a299f70f07e1d19f6b711405133c77a0b', '127.0.0.1', 1473224578, '__ci_last_regenerate|i:1473223321;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('16ec35991ac2f735c26331b0e2e1d9e9dea7a03c', '127.0.0.1', 1473225369, '__ci_last_regenerate|i:1473225368;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('a060931e085f03a3d3fa8bc00817a26812bea7d5', '127.0.0.1', 1473225891, '__ci_last_regenerate|i:1473225809;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('4d54f7bad9166af1617c78f231e24b9acce98788', '127.0.0.1', 1473226775, '__ci_last_regenerate|i:1473226773;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('c4d56f7b1444f3fbb6fd43999e4d5d0009f06ba7', '127.0.0.1', 1473229767, '__ci_last_regenerate|i:1473227303;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('55e1956c3d3c4fd50cb7a7efeab2ee21f0d06397', '127.0.0.1', 1473230314, '__ci_last_regenerate|i:1473230095;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('a7df2b5453301b7e91acb07ef91147220b4d288c', '127.0.0.1', 1473231307, '__ci_last_regenerate|i:1473231306;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('a4a78835cfdb0a873489b38f286fdd35d92950b7', '127.0.0.1', 1473232878, '__ci_last_regenerate|i:1473231622;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('8a26967ea95dadf3c0b2d1b98c7639862860cad3', '127.0.0.1', 1473233456, '__ci_last_regenerate|i:1473233403;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('450bf8fe1b2e085ba2a6c7b91b28207d98b14827', '127.0.0.1', 1473234083, '__ci_last_regenerate|i:1473233925;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('9a2bc06e777a32a4e52c2c76eb69e26b8b07daf1', '127.0.0.1', 1473235617, '__ci_last_regenerate|i:1473234243;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('730b56dfc9f0bb325333d59d5f01e725636381d3', '127.0.0.1', 1473236093, '__ci_last_regenerate|i:1473235819;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";ajax_permission|s:48:"没有授权访问  <br> [project/stock/storage]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"old";}'),
('0dcf3a9d01603045ed989d5f755623f2986602e4', '127.0.0.1', 1473236200, '__ci_last_regenerate|i:1473236160;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('1cac1685ef2cf40a10c597e7f8bc5eb52b5ee4ae', '127.0.0.1', 1473237050, '__ci_last_regenerate|i:1473236822;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('afdb982863e02b2f649375358a9320a16eded5f6', '127.0.0.1', 1473237470, '__ci_last_regenerate|i:1473237235;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";'),
('5df5a0f84349f9b8eed7ae10ca4ebc03b1156b20', '127.0.0.1', 1473237763, '__ci_last_regenerate|i:1473237575;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";csrfkey|s:8:"nbIjDKSQ";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"No7YK8mQ0A9aJZODEG2B";'),
('76efc01e43d872a48d64c9b1a40da86b9e75e3c0', '127.0.0.1', 1473238347, '__ci_last_regenerate|i:1473238053;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";csrfkey|s:8:"KujWA1wn";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"NI2iWbnvodDYAgtEF9kp";'),
('667a30d128449cbdfa7e1281f4db17b808147822', '127.0.0.1', 1473238727, '__ci_last_regenerate|i:1473238397;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";csrfkey|s:8:"FP5M7WOt";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"6Lq18Jy7AsmYl4Sa3jfC";'),
('d9b20978c6f7bfb331d4276d56e1df16ec47c5c5', '127.0.0.1', 1473238852, '__ci_last_regenerate|i:1473238785;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";csrfkey|s:8:"keFQJtIp";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"OQ5xTI7Xo4NRta1uSAvz";'),
('040919cddfbf1ec997df7b71a3ce69248eb1e04d', '127.0.0.1', 1473240887, '__ci_last_regenerate|i:1473239436;code|s:4:"5qmG";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473173109";csrfkey|s:8:"4SnRq7IM";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"ovDGslrbZPgK1pRWI78L";'),
('1f0897676e38026a4d31600f6bf7be6c4bfcfad7', '127.0.0.1', 1473241038, '__ci_last_regenerate|i:1473240954;code|s:4:"5bDp";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473134149";csrfkey|s:8:"MI5RB0Qj";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"aCQeYgibVt6ENTyFvIJu";'),
('bbff738c77fc9cc15e6a1d9c888ff1720bf81415', '127.0.0.1', 1473242590, '__ci_last_regenerate|i:1473241384;code|s:4:"jNtz";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473208514";');

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
  `phone` varchar(20) DEFAULT NULL,
  `wechat` varchar(64) DEFAULT NULL,
  `qq` char(12) DEFAULT NULL,
  `company_id` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `gd_worker`
--

INSERT INTO `gd_worker` (`id`, `username`, `realname`, `avatar`, `password`, `salt`, `email`, `remember_code`, `addtime`, `last_login`, `last_ip`, `status`, `phone`, `wechat`, `qq`, `company_id`) VALUES
(1, 'admin-root', '管理员', 'public/images/avatar/121034209220f1.jpg', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', NULL, 1469999823, 1473172336, '127.0.0.1', 1, '', NULL, NULL, 0),
(2, 'zhujingxiu', '朱景修', NULL, '$2y$08$QQOBCnHUhFTH/CjeWztJGOOfAz2xuqSki7P2qn5/WojZQvXc10NAK', NULL, 'zhujingxiu@hotmail.com', NULL, 1470736567, 1470736771, '127.0.0.1', 1, '18850911766', NULL, NULL, 0),
(3, 'jingli-demo1', '经理测试', 'public/images/avatar/avatar2.png', '$2y$08$k1dyXUI7CRYqc/CpH9UT0ONk93y3sP7EQ5Jdcr/lvOoUE4Tob05Oe', NULL, 'a@a.c', NULL, 1471598448, 1473241385, '127.0.0.1', 1, '13913901390', 'qweweqweq', '', 0),
(4, 'jingli-demo2', '经理测试B', 'public/images/avatar/user1-128x128.jpg', '$2y$08$1gGt5kfd2/S0WGDZNt6PMu8bj1WBhiww4AgNx4TJSRrJaiQ7jV4gu', NULL, 'a@a.cc', NULL, 1471598720, 1472277405, '127.0.0.1', 1, '', NULL, NULL, 0),
(5, 'dengji-demo1', '登记测试A', 'public/images/avatar/avatar1.png', '$2y$08$YHzCZKpn3DYoZWYfE4UD4.7KSke2QaVc5Ou04ljhRNZn5sDqc7QF2', NULL, 'b@a.cc', NULL, 1471598889, 1473240960, '127.0.0.1', 1, '', NULL, NULL, 0),
(6, 'dengji-demo2', '录单测试B', 'public/images/avatar/user3-128x128.jpg', '$2y$08$7JByOlb/P/L.c8P.mqeMX.N7qSiLGBWyx3YWA44wUDkAMY0rGKtQS', NULL, 'ludan@b.cc', NULL, 1471598958, 1473133650, '127.0.0.1', 1, '', NULL, NULL, 0),
(7, 'kuguan-demo1', '库管测试A', 'public/images/avatar/user4-128x128.jpg', '$2y$08$SuuFWJ0sZL2z.SZDLaTX3Od/bkVZ04Ax1fc1SmDtoVf8X0XjuRuJO', NULL, 'kuguan@bb.c', NULL, 1471599005, 1473138246, '127.0.0.1', 1, '', NULL, NULL, 0),
(8, 'kuguan-demo2', '库管测试B', 'public/images/avatar/user5-128x128.jpg', '$2y$08$18MwNqHD5QKE/M2xcF4NXuLScN67KrGQfBCfXPEEEM/W5PNC/5/5G', NULL, 'kuguan@a.cc', NULL, 1471599054, 1473152537, '127.0.0.1', 1, '', NULL, NULL, 0),
(9, 'jianding-demo1', '鉴定人A', 'public/images/avatar/user8-128x128.jpg', '$2y$08$GqumJcWGIEa25v1OB3i5M.k8Vgxg99kuKXpGsUs5ZzQiUIp.Qer5G', NULL, 'jianding@g.cc', NULL, 1471599152, 0, '127.0.0.1', 1, '', NULL, NULL, 0),
(10, 'jianding-demo2', '鉴定人B', 'public/images/avatar/user7-128x128.jpg', '$2y$08$kPYhqg2giK0IhN5v6WS4WuMQvXq0m0gpF6Cx.xAR4..dsxS9UmNDG', NULL, 'admin@admin.com', NULL, 1471599225, 0, '127.0.0.1', 1, '', NULL, NULL, 0),
(11, 'all-demo1', '综合账户', 'public/images/avatar/user2-160x160.jpg', '$2y$08$bnDehV48c1sDsmwPNmmTHOdMMxUE1MHNGItvkmvL7CC2G20doVhcq', NULL, 'all@b.cc', NULL, 1471599856, 1471600479, '127.0.0.1', 1, '', NULL, NULL, 0),
(12, 'zhujingxiu1', '朱景修2', NULL, '$2y$08$QQOBCnHUhFTH/CjeWztJGOOfAz2xuqSki7P2qn5/WojZQvXc10NAK', NULL, 'zhujingxiu@hotmail.com', NULL, 1470736567, 1470736771, '127.0.0.1', 1, '18850911766', NULL, NULL, 0);

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

--
-- 转存表中的数据 `gd_worker_activity`
--

INSERT INTO `gd_worker_activity` (`activity_id`, `worker_id`, `content`, `addtime`) VALUES
(1, 3, '经理测试 于 2016-09-04 20:30:16 更新了个人资料', 1472992216),
(2, 7, '{"project_id":"GR1609062941713226","status_id":"2"}', 1473155087);

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
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(3, 'manager', '经理', 0, '1,2,3,5,6,7,8,9,10,11,22,23,24,25,26,27,30,33,35,48,49,50,51,52,55,59,63,67,68,70,78,80,84,85,94,96,98,100,101,102,105,106,107,108,109,110,112,113,114,115,116,118', 1),
(4, 'warehouser', '库管', 0, '1,2,3,55,61,65,70,82,87,98,100,101,105,107,108,111,117,118,119', 1),
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
-- Indexes for table `gd_golden_today`
--
ALTER TABLE `gd_golden_today`
  ADD KEY `date` (`date`),
  ADD KEY `updatetime` (`updatetime`);

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
-- 使用表AUTO_INCREMENT `gd_cron_schedule`
--
ALTER TABLE `gd_cron_schedule`
  MODIFY `schedule_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_customer`
--
ALTER TABLE `gd_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `gd_customer_apply`
--
ALTER TABLE `gd_customer_apply`
  MODIFY `apply_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_customer_group`
--
ALTER TABLE `gd_customer_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `gd_customer_history`
--
ALTER TABLE `gd_customer_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `gd_customer_stock`
--
ALTER TABLE `gd_customer_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `gd_golden_price`
--
ALTER TABLE `gd_golden_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `gd_node`
--
ALTER TABLE `gd_node`
  MODIFY `node_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- 使用表AUTO_INCREMENT `gd_project_file`
--
ALTER TABLE `gd_project_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- 使用表AUTO_INCREMENT `gd_project_investing`
--
ALTER TABLE `gd_project_investing`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `gd_project_investing_history`
--
ALTER TABLE `gd_project_investing_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- 使用表AUTO_INCREMENT `gd_project_investing_status`
--
ALTER TABLE `gd_project_investing_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `gd_project_recycling`
--
ALTER TABLE `gd_project_recycling`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `gd_project_recycling_history`
--
ALTER TABLE `gd_project_recycling_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- 使用表AUTO_INCREMENT `gd_project_recycling_status`
--
ALTER TABLE `gd_project_recycling_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `gd_project_stock`
--
ALTER TABLE `gd_project_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `gd_project_trash`
--
ALTER TABLE `gd_project_trash`
  MODIFY `trash_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `gd_setting`
--
ALTER TABLE `gd_setting`
  MODIFY `setting_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- 使用表AUTO_INCREMENT `gd_worker`
--
ALTER TABLE `gd_worker`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `gd_worker_activity`
--
ALTER TABLE `gd_worker_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `gd_worker_attempt`
--
ALTER TABLE `gd_worker_attempt`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `gd_worker_company`
--
ALTER TABLE `gd_worker_company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT;
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
