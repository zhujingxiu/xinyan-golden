-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 �?09 �?08 �?23:32
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
-- 表的结构 `gd_cron_job`
--

CREATE TABLE IF NOT EXISTS `gd_cron_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `args` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `addtime` int(11) NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

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

CREATE TABLE IF NOT EXISTS `gd_cron_log` (
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
(1473295843, '2016-09-08', '08:50:43', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 08:50:43'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473297213, '2016-09-08', '09:13:33', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 09:13:33'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473298151, '2016-09-08', '09:29:11', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 09:29:11'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473298452, '2016-09-08', '09:34:12', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 09:34:12'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473298752, '2016-09-08', '09:39:12', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 09:39:12'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473299052, '2016-09-08', '09:44:12', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 09:44:12'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473299352, '2016-09-08', '09:49:12', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 09:49:12'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473299653, '2016-09-08', '09:54:13', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 09:54:13'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473299953, '2016-09-08', '09:59:13', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 09:59:13'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473300253, '2016-09-08', '10:04:13', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:04:13'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473300554, '2016-09-08', '10:09:14', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:09:14'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473300854, '2016-09-08', '10:14:14', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:14:14'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473301154, '2016-09-08', '10:19:14', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:19:14'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473301472, '2016-09-08', '10:24:32', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:24:32'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473301772, '2016-09-08', '10:29:32', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:29:32'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473302072, '2016-09-08', '10:34:32', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:34:32'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473302373, '2016-09-08', '10:39:33', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:39:33'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473302673, '2016-09-08', '10:44:33', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:44:33'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473302973, '2016-09-08', '10:49:33', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:49:33'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473303275, '2016-09-08', '10:54:35', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:54:35'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473303575, '2016-09-08', '10:59:35', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 10:59:35'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473303876, '2016-09-08', '11:04:36', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:04:36'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473304176, '2016-09-08', '11:09:36', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:09:36'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473304476, '2016-09-08', '11:14:36', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:14:36'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473304776, '2016-09-08', '11:19:36', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:19:36'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473305077, '2016-09-08', '11:24:37', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:24:37'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473305377, '2016-09-08', '11:29:37', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:29:37'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473305677, '2016-09-08', '11:34:37', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:34:37'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473305978, '2016-09-08', '11:39:38', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:39:38'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473306278, '2016-09-08', '11:44:38', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:44:38'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473306578, '2016-09-08', '11:49:38', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:49:38'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473306879, '2016-09-08', '11:54:39', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:54:39'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473307179, '2016-09-08', '11:59:39', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 11:59:39'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473307479, '2016-09-08', '12:04:39', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:04:39'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473307780, '2016-09-08', '12:09:40', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:09:40'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473308080, '2016-09-08', '12:14:40', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:14:40'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473308380, '2016-09-08', '12:19:40', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:19:40'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473308701, '2016-09-08', '12:25:01', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:25:01'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473309002, '2016-09-08', '12:30:02', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:30:02'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473309302, '2016-09-08', '12:35:02', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:35:02'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473309602, '2016-09-08', '12:40:02', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:40:02'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473309902, '2016-09-08', '12:45:02', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:45:02'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473310203, '2016-09-08', '12:50:03', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:50:03'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473310525, '2016-09-08', '12:55:25', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 12:55:25'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473310825, '2016-09-08', '13:00:25', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:00:25'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473311125, '2016-09-08', '13:05:25', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:05:25'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473311425, '2016-09-08', '13:10:25', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:10:25'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473311726, '2016-09-08', '13:15:26', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:15:26'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473312026, '2016-09-08', '13:20:26', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:20:26'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473312352, '2016-09-08', '13:25:52', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:25:52'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473312652, '2016-09-08', '13:30:52', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:30:52'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473312953, '2016-09-08', '13:35:53', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:35:53'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473313253, '2016-09-08', '13:40:53', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:40:53'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473313553, '2016-09-08', '13:45:53', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:45:53'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473313854, '2016-09-08', '13:50:54', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:50:54'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473314154, '2016-09-08', '13:55:54', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 13:55:54'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473314454, '2016-09-08', '14:00:54', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 14:00:54'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473314755, '2016-09-08', '14:05:55', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 14:05:55'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473316032, '2016-09-08', '14:27:12', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 14:27:12'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473316332, '2016-09-08', '14:32:12', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 14:32:12'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473316633, '2016-09-08', '14:37:13', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 14:37:13'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473316933, '2016-09-08', '14:42:13', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 14:42:13'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473317233, '2016-09-08', '14:47:13', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 14:47:13'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473317533, '2016-09-08', '14:52:13', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 14:52:13'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473317881, '2016-09-08', '14:58:01', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 14:58:01'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473318182, '2016-09-08', '15:03:02', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:03:02'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473318482, '2016-09-08', '15:08:02', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:08:02'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473318782, '2016-09-08', '15:13:02', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:13:02'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473319082, '2016-09-08', '15:18:02', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:18:02'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473319382, '2016-09-08', '15:23:02', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:23:02'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473319683, '2016-09-08', '15:28:03', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:28:03'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473319983, '2016-09-08', '15:33:03', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:33:03'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473320284, '2016-09-08', '15:38:04', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:38:04'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473320584, '2016-09-08', '15:43:04', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:43:04'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473320884, '2016-09-08', '15:48:04', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:48:04'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473321184, '2016-09-08', '15:53:04', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:53:04'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473321520, '2016-09-08', '15:58:40', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 15:58:40'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473321820, '2016-09-08', '16:03:40', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:03:40'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473322120, '2016-09-08', '16:08:40', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:08:40'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473322420, '2016-09-08', '16:13:40', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:13:40'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473322721, '2016-09-08', '16:18:41', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:18:41'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473323021, '2016-09-08', '16:23:41', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:23:41'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473323321, '2016-09-08', '16:28:41', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:28:41'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473323622, '2016-09-08', '16:33:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:33:42'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473323922, '2016-09-08', '16:38:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:38:42'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473324222, '2016-09-08', '16:43:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:43:42'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473324522, '2016-09-08', '16:48:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:48:42'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473324823, '2016-09-08', '16:53:43', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:53:43'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473325123, '2016-09-08', '16:58:43', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 16:58:43'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473325423, '2016-09-08', '17:03:43', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:03:43'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473325724, '2016-09-08', '17:08:44', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:08:44'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473326024, '2016-09-08', '17:13:44', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:13:44'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473326324, '2016-09-08', '17:18:44', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:18:44'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473326624, '2016-09-08', '17:23:44', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:23:44'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473326925, '2016-09-08', '17:28:45', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:28:45'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473327225, '2016-09-08', '17:33:45', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:33:45'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473327525, '2016-09-08', '17:38:45', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:38:45'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473327826, '2016-09-08', '17:43:46', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:43:46'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473328126, '2016-09-08', '17:48:46', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:48:46'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473328426, '2016-09-08', '17:53:46', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:53:46'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473328727, '2016-09-08', '17:58:47', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 17:58:47'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473329028, '2016-09-08', '18:03:48', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 18:03:48'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473329328, '2016-09-08', '18:08:48', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 18:08:48'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473329628, '2016-09-08', '18:13:48', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 18:13:48'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473329928, '2016-09-08', '18:18:48', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 18:18:48'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473330228, '2016-09-08', '18:23:48', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 18:23:48'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473330529, '2016-09-08', '18:28:49', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 18:28:49'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473343506, '2016-09-08', '22:05:06', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:05:06'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473343506, '2016-09-08', '22:05:06', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:05:06'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473343648, '2016-09-08', '22:07:28', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:07:28'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473343648, '2016-09-08', '22:07:28', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:07:28'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473343839, '2016-09-08', '22:10:39', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:10:39'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473343839, '2016-09-08', '22:10:39', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:10:39'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473343839, '2016-09-08', '22:10:39', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 22:10:39'',\n  ''stock'' => \n  array (\n    0 => ''GR1609072292323723'',\n    1 => ''GR1609089881733728'',\n  ),\n  ''history'' => \n  array (\n    0 => ''1'',\n    1 => ''5'',\n  ),\n)'),
(1473344140, '2016-09-08', '22:15:40', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:15:40'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473344140, '2016-09-08', '22:15:40', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:15:40'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473344140, '2016-09-08', '22:15:40', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 22:15:40'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473344440, '2016-09-08', '22:20:40', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:20:40'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473344440, '2016-09-08', '22:20:40', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:20:40'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473344440, '2016-09-08', '22:20:40', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 22:20:40'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473344741, '2016-09-08', '22:25:41', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:25:41'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473344741, '2016-09-08', '22:25:41', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:25:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473344741, '2016-09-08', '22:25:41', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 22:25:41'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473345041, '2016-09-08', '22:30:41', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:30:41'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473345041, '2016-09-08', '22:30:41', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:30:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473345041, '2016-09-08', '22:30:41', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 22:30:41'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473345341, '2016-09-08', '22:35:41', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:35:41'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473345341, '2016-09-08', '22:35:41', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:35:41'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473345341, '2016-09-08', '22:35:41', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 22:35:41'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473345642, '2016-09-08', '22:40:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:40:42'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473345642, '2016-09-08', '22:40:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:40:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473345642, '2016-09-08', '22:40:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 22:40:42'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473345942, '2016-09-08', '22:45:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:45:42'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473345942, '2016-09-08', '22:45:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:45:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473345942, '2016-09-08', '22:45:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 22:45:42'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473346242, '2016-09-08', '22:50:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:50:42'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473346242, '2016-09-08', '22:50:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:50:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473346242, '2016-09-08', '22:50:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 22:50:42'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473346542, '2016-09-08', '22:55:42', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 22:55:42'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473346542, '2016-09-08', '22:55:42', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 22:55:42'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473346542, '2016-09-08', '22:55:42', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 22:55:42'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473346843, '2016-09-08', '23:00:43', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 23:00:43'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473346843, '2016-09-08', '23:00:43', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 23:00:43'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473346843, '2016-09-08', '23:00:43', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 23:00:43'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473347143, '2016-09-08', '23:05:43', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 23:05:43'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473347143, '2016-09-08', '23:05:43', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 23:05:43'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473347143, '2016-09-08', '23:05:43', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 23:05:43'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473347444, '2016-09-08', '23:10:44', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 23:10:44'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473347444, '2016-09-08', '23:10:44', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 23:10:44'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473347444, '2016-09-08', '23:10:44', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 23:10:44'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473347744, '2016-09-08', '23:15:44', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 23:15:44'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473347744, '2016-09-08', '23:15:44', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 23:15:44'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473347744, '2016-09-08', '23:15:44', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 23:15:44'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473348044, '2016-09-08', '23:20:44', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 23:20:44'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473348044, '2016-09-08', '23:20:44', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 23:20:44'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473348044, '2016-09-08', '23:20:44', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 23:20:44'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473348344, '2016-09-08', '23:25:44', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 23:25:44'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473348344, '2016-09-08', '23:25:44', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 23:25:44'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473348344, '2016-09-08', '23:25:44', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 23:25:44'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)'),
(1473348645, '2016-09-08', '23:30:45', 'Tool_model::today_price', 'array (\n  ''datetime'' => ''2016-09-08 23:30:45'',\n  ''insert'' => \n  array (\n    ''apikey'' => ''101ae9aa1007ce6d'',\n    ''apiurl'' => ''http://api.jisuapi.com/gold/shgold'',\n  ),\n)'),
(1473348645, '2016-09-08', '23:30:45', 'Tool_model::push_growing', 'array (\n  ''datetime'' => ''2016-09-08 23:30:45'',\n  ''insert'' => \n  array (\n  ),\n  ''update'' => \n  array (\n  ),\n  ''sn'' => \n  array (\n  ),\n)'),
(1473348645, '2016-09-08', '23:30:45', 'Tool_model::growing', 'array (\n  ''datetime'' => ''2016-09-08 23:30:45'',\n  ''stock'' => \n  array (\n  ),\n  ''history'' => \n  array (\n  ),\n)');

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
  `locker_id` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
  `fee` decimal(13,2) NOT NULL DEFAULT '0.00',
  `file` text COLLATE utf8_unicode_ci,
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `note` text COLLATE utf8_unicode_ci,
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `gd_customer_stock`
--

INSERT INTO `gd_customer_stock` (`stock_id`, `customer_id`, `mode`, `project_sn`, `weight`, `fee`, `file`, `notify`, `note`, `worker_id`, `addtime`) VALUES
(1, 9, 'in', 'GM1609086331083244', '100.00', '0.00', NULL, 1, '', 3, 1473325712),
(2, 9, 'profit', 'GM1609086331083244', '0.00', '0.00', NULL, 1, '阿斯顿撒旦撒大撒旦撒旦撒', 3, 1473325712),
(3, 5, 'in', 'GR1609084360044048', '98.00', '0.00', NULL, 1, '', 3, 1473327189),
(4, 5, 'profit', 'GR1609084360044048', '0.00', '0.00', NULL, 1, 'sadsadasdsadasdasds', 3, 1473327189),
(5, 5, 'in', 'GM1609087441773818', '50.00', '0.00', NULL, 1, '', 3, 1473327916),
(6, 5, 'profit', 'GM1609087441773818', '0.00', '0.00', NULL, 1, '799878797897978797', 3, 1473327916),
(7, 2, 'in', 'GM1609084341753558', '15.00', '0.00', NULL, 1, '', 3, 1473327993),
(8, 2, 'profit', 'GM1609084341753558', '0.00', '0.00', NULL, 1, '465465446465', 3, 1473327993),
(13, 8, 'in', 'GR1609072292323723', '9.00', '0.00', NULL, 1, '0', 0, 1473343839),
(14, 8, 'profit', 'GR1609072292323723', '0.72', '0.00', NULL, 1, '0', 0, 1473343839),
(15, 10, 'in', 'GR1609089881733728', '26.00', '0.00', NULL, 1, '0', 0, 1473343839),
(16, 10, 'profit', 'GR1609089881733728', '2.08', '0.00', NULL, 1, '0', 0, 1473343839);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

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
(34, '2016-09-07', 'Au99.99', '沪金99', '289.37', 1473297213);

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
('2016-09-07', 'Au(T+D)', '黄金延期', '289.30', '286.66', '289.71', '286.21', '1.21', '285.85', '49986.0000', 1473186569, 1473208513),
('2016-09-07', 'mAu(T+D)', '迷你黄金延期', '289.25', '286.58', '289.68', '286.46', '1.11', '286.07', '4443.6000', 1473186569, 1473208513),
('2016-09-07', 'Au99.99', '沪金99', '289.00', '286.30', '289.00', '286.00', '0.94', '286.30', '349.0800', 1473186568, 1473208513),
('2016-09-07', 'Au(T+N2)', '延期双金', '290.55', '287.50', '290.90', '275.00', '1.31', '286.80', '149.8000', 1473186557, 1473208513),
('2016-09-07', 'Au99.95', '沪金95', '287.00', '287.00', '287.10', '286.90', '0.36', '285.96', '60.0000', 1473185931, 1473208513),
('2016-09-07', 'Au(T+N1)', '延期单金', '292.40', '289.00', '293.00', '289.00', '1.28', '288.70', '52.4000', 1473186561, 1473208513),
('2016-09-07', 'Au100g', '沪金100G', '289.00', '287.49', '289.00', '287.00', '1.04', '286.02', '23.4000', 1473186150, 1473208513),
('2016-09-07', 'iAu99.99', 'IAU99.99', '288.00', '286.95', '288.00', '286.95', '0.77', '285.79', '0.1800', 1473186455, 1473208513),
('2016-09-07', 'Pt99.95', '沪铂95', '0.00', '0.00', '0.00', '0.00', '0.00', '246.07', '0.0000', 1473186422, 1473208513),
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
('2016-09-07', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1473233367, 1473234641),
('2016-09-08', 'Au(T+D)', '黄金延期', '288.69', '289.25', '289.55', '287.50', '-0.21', '289.29', '24888.0000', 1473272967, 1473297213),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '288.81', '289.68', '289.70', '288.00', '-0.24', '289.51', '1942.8000', 1473272958, 1473297213),
('2016-09-08', 'Au99.99', '沪金99', '288.95', '289.48', '289.50', '288.20', '-0.15', '289.37', '108.4800', 1473272919, 1473297213),
('2016-09-08', 'Au99.95', '沪金95', '289.30', '289.50', '289.50', '289.30', '0.02', '289.24', '42.0000', 1473272661, 1473297213),
('2016-09-08', 'Au100g', '沪金100G', '288.00', '288.50', '289.39', '288.00', '-0.51', '289.47', '8.2000', 1473268911, 1473297213),
('2016-09-08', 'Au(T+N1)', '延期单金', '292.40', '292.45', '292.45', '291.20', '0.05', '292.25', '5.8000', 1473272966, 1473297213),
('2016-09-08', 'Au(T+N2)', '延期双金', '290.15', '289.70', '290.20', '289.05', '-0.50', '291.60', '4.6000', 1473272960, 1473297213),
('2016-09-07', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473260449, 1473297213),
('2016-09-07', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1473248351, 1473297213),
('2016-09-08', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '287.99', '0.0000', 1473272958, 1473297213),
('2016-09-08', 'Pt99.95', '沪铂95', '0.00', '0.00', '0.00', '0.00', '0.00', '251.00', '0.0000', 1473272894, 1473297213),
('2016-09-08', 'Au(T+D)', '黄金延期', '288.90', '289.25', '289.55', '287.50', '-0.13', '289.29', '29230.0000', 1473298961, 1473299653),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '289.00', '289.68', '289.70', '288.00', '-0.18', '289.51', '2214.8000', 1473298956, 1473299653),
('2016-09-08', 'Au99.99', '沪金99', '289.17', '289.48', '289.50', '288.20', '-0.07', '289.37', '318.0800', 1473298959, 1473299653),
('2016-09-08', 'Au99.95', '沪金95', '289.00', '289.50', '289.50', '289.00', '-0.08', '289.24', '58.0000', 1473298960, 1473299653),
('2016-09-08', 'Au(T+N1)', '延期单金', '291.85', '292.45', '292.45', '291.20', '-0.14', '292.25', '25.8000', 1473298961, 1473299653),
('2016-09-08', 'Au(T+N2)', '延期双金', '290.30', '289.70', '290.30', '289.05', '-0.45', '291.60', '24.6000', 1473298957, 1473299653),
('2016-09-08', 'Au100g', '沪金100G', '289.00', '288.50', '289.39', '288.00', '-0.16', '289.47', '12.4000', 1473298917, 1473299653),
('2016-09-08', 'Pt99.95', '沪铂95', '248.50', '248.50', '248.50', '248.50', '-1.00', '251.00', '2.0000', 1473297157, 1473299653),
('2016-09-08', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '287.99', '0.0000', 1473298912, 1473299653),
('2016-09-08', 'Au(T+D)', '黄金延期', '288.95', '289.25', '289.55', '287.50', '-0.12', '289.29', '34262.0000', 1473302529, 1473303275),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '289.15', '289.68', '289.70', '288.00', '-0.12', '289.51', '2315.2000', 1473302529, 1473303275),
('2016-09-08', 'Au99.99', '沪金99', '289.35', '289.48', '289.50', '288.20', '-0.01', '289.37', '1667.9000', 1473302522, 1473303275),
('2016-09-08', 'Au99.95', '沪金95', '289.00', '289.50', '289.50', '288.90', '-0.08', '289.24', '440.0000', 1473302522, 1473303275),
('2016-09-08', 'Au(T+N2)', '延期双金', '289.10', '289.70', '290.65', '289.05', '-0.86', '291.60', '73.0000', 1473301512, 1473303275),
('2016-09-08', 'Au(T+N1)', '延期单金', '292.35', '292.45', '292.45', '291.20', '0.03', '292.25', '42.6000', 1473302527, 1473303275),
('2016-09-08', 'Au100g', '沪金100G', '289.00', '288.50', '289.39', '288.00', '-0.16', '289.47', '18.0000', 1473302474, 1473303275),
('2016-09-08', 'Pt99.95', '沪铂95', '248.25', '248.50', '248.50', '248.25', '-1.10', '251.00', '12.0000', 1473301836, 1473303275),
('2016-09-08', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '287.99', '0.0000', 1473302496, 1473303275),
('2016-09-08', 'Au(T+D)', '黄金延期', '288.90', '289.25', '289.55', '287.50', '-0.13', '289.29', '36326.0000', 1473305355, 1473306879),
('2016-09-08', 'Au99.99', '沪金99', '289.23', '289.48', '289.50', '288.20', '-0.05', '289.37', '3602.8200', 1473305361, 1473306879),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '289.15', '289.68', '289.70', '288.00', '-0.12', '289.51', '2522.0000', 1473305366, 1473306879),
('2016-09-08', 'Au99.95', '沪金95', '289.00', '289.50', '289.50', '288.90', '-0.08', '289.24', '778.0000', 1473305359, 1473306879),
('2016-09-08', 'Au(T+N2)', '延期双金', '289.10', '289.70', '290.65', '289.05', '-0.86', '291.60', '73.0000', 1473305367, 1473306879),
('2016-09-08', 'Au(T+N1)', '延期单金', '292.35', '292.45', '292.45', '291.20', '0.03', '292.25', '43.2000', 1473305355, 1473306879),
('2016-09-08', 'Pt99.95', '沪铂95', '248.00', '248.50', '248.50', '248.00', '-1.20', '251.00', '20.0000', 1473305349, 1473306879),
('2016-09-08', 'Au100g', '沪金100G', '288.56', '288.50', '289.39', '288.00', '-0.31', '289.47', '19.6000', 1473305355, 1473306879),
('2016-09-08', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '287.99', '0.0000', 1473305368, 1473306879),
('2016-09-08', 'Au(T+D)', '黄金延期', '289.05', '289.25', '289.55', '287.50', '-0.08', '289.29', '37180.0000', 1473313390, 1473314154),
('2016-09-08', 'Au99.99', '沪金99', '289.35', '289.48', '289.50', '288.20', '-0.01', '289.37', '4497.2200', 1473313382, 1473314154),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '289.16', '289.68', '289.70', '288.00', '-0.12', '289.51', '2596.8000', 1473313388, 1473314154),
('2016-09-08', 'Au99.95', '沪金95', '288.80', '289.50', '289.50', '288.80', '-0.15', '289.24', '796.0000', 1473313146, 1473314154),
('2016-09-08', 'Au(T+N2)', '延期双金', '289.10', '289.70', '290.65', '289.05', '-0.86', '291.60', '73.0000', 1473313362, 1473314154),
('2016-09-08', 'Au(T+N1)', '延期单金', '292.35', '292.45', '292.45', '291.20', '0.03', '292.25', '43.2000', 1473313298, 1473314154),
('2016-09-08', 'Au100g', '沪金100G', '289.28', '288.50', '289.39', '288.00', '-0.07', '289.47', '20.6000', 1473313380, 1473314154),
('2016-09-08', 'Pt99.95', '沪铂95', '248.00', '248.50', '248.50', '248.00', '-1.20', '251.00', '20.0000', 1473312731, 1473314154),
('2016-09-08', 'iAu99.99', 'IAU99.99', '289.20', '289.20', '289.20', '289.20', '0.42', '287.99', '0.0200', 1473312570, 1473314154),
('2016-09-08', 'Au(T+D)', '黄金延期', '289.05', '289.25', '289.55', '287.50', '-0.08', '289.29', '37180.0000', 1473313420, 1473316032),
('2016-09-08', 'Au99.99', '沪金99', '289.34', '289.48', '289.50', '288.20', '-0.01', '289.37', '4500.6200', 1473313416, 1473316032),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '289.16', '289.68', '289.70', '288.00', '-0.12', '289.51', '2598.2000', 1473313418, 1473316032),
('2016-09-08', 'Au99.95', '沪金95', '288.80', '289.50', '289.50', '288.80', '-0.15', '289.24', '796.0000', 1473313415, 1473316032),
('2016-09-08', 'Au(T+D)', '黄金延期', '289.10', '289.25', '289.55', '287.50', '-0.07', '289.29', '43490.0000', 1473316994, 1473317881),
('2016-09-08', 'Au(T+N2)', '延期双金', '290.30', '289.70', '290.65', '289.05', '-0.45', '291.60', '16073.0000', 1473316926, 1473317881),
('2016-09-08', 'Au(T+N1)', '延期单金', '292.10', '292.45', '292.45', '291.20', '-0.05', '292.25', '12043.6000', 1473316926, 1473317881),
('2016-09-08', 'Au99.99', '沪金99', '289.33', '289.48', '289.50', '288.20', '-0.01', '289.37', '9337.6600', 1473316993, 1473317881),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '289.18', '289.68', '289.70', '288.00', '-0.11', '289.51', '2887.0000', 1473316971, 1473317881),
('2016-09-08', 'Au99.95', '沪金95', '289.05', '289.50', '289.50', '288.80', '-0.07', '289.24', '1090.0000', 1473316875, 1473317881),
('2016-09-08', 'Au100g', '沪金100G', '289.30', '288.50', '289.40', '288.00', '-0.06', '289.47', '37.8000', 1473316893, 1473317881),
('2016-09-08', 'Pt99.95', '沪铂95', '248.00', '248.50', '248.50', '248.00', '-1.20', '251.00', '20.0000', 1473314519, 1473317881),
('2016-09-08', 'iAu99.99', 'IAU99.99', '289.20', '289.20', '289.20', '289.20', '0.42', '287.99', '0.0200', 1473313648, 1473317881),
('2016-09-08', 'Au(T+D)', '黄金延期', '289.10', '289.25', '289.55', '287.50', '-0.07', '289.29', '43570.0000', 1473317023, 1473319683),
('2016-09-08', 'Au99.99', '沪金99', '289.35', '289.48', '289.50', '288.20', '-0.01', '289.37', '9437.6600', 1473317000, 1473319683),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '289.18', '289.68', '289.70', '288.00', '-0.11', '289.51', '2887.0000', 1473317017, 1473319683),
('2016-09-08', 'Au99.95', '沪金95', '289.05', '289.50', '289.50', '288.80', '-0.07', '289.24', '1090.0000', 1473317010, 1473319683),
('2016-09-08', 'Au(T+D)', '黄金延期', '289.09', '289.25', '289.55', '287.50', '-0.07', '289.29', '47666.0000', 1473319767, 1473321520),
('2016-09-08', 'Au(T+N2)', '延期双金', '290.30', '289.70', '290.65', '289.05', '-0.45', '291.60', '16073.0000', 1473319739, 1473321520),
('2016-09-08', 'Au99.99', '沪金99', '289.20', '289.48', '289.50', '288.20', '-0.06', '289.37', '13585.8400', 1473319769, 1473321520),
('2016-09-08', 'Au(T+N1)', '延期单金', '292.35', '292.45', '292.45', '291.20', '0.03', '292.25', '12048.0000', 1473319739, 1473321520),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '289.23', '289.68', '289.70', '288.00', '-0.10', '289.51', '3509.0000', 1473319763, 1473321520),
('2016-09-08', 'Au99.95', '沪金95', '289.10', '289.50', '289.50', '288.80', '-0.05', '289.24', '1228.0000', 1473319769, 1473321520),
('2016-09-08', 'Au100g', '沪金100G', '289.00', '288.50', '289.40', '288.00', '-0.16', '289.47', '40.6000', 1473319769, 1473321520),
('2016-09-08', 'Pt99.95', '沪铂95', '248.75', '248.50', '248.75', '248.00', '-0.90', '251.00', '32.0000', 1473319769, 1473321520),
('2016-09-08', 'iAu99.99', 'IAU99.99', '289.20', '289.20', '289.20', '289.20', '0.42', '287.99', '0.0200', 1473319769, 1473321520),
('2016-09-08', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473319769, 1473321520),
('2016-09-08', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1473319769, 1473321520),
('2016-09-08', 'Au(T+D)', '黄金延期', '288.52', '288.65', '289.25', '288.10', '-0.19', '289.08', '13624.0000', 1473342405, 1473343839),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '288.62', '289.26', '289.40', '288.20', '-0.21', '289.23', '1200.6000', 1473342405, 1473343839),
('2016-09-08', 'Au99.95', '沪金95', '289.00', '289.10', '289.46', '289.00', '-0.03', '289.10', '80.0000', 1473342342, 1473343839),
('2016-09-08', 'Au99.99', '沪金99', '288.98', '289.69', '289.69', '288.50', '-0.08', '289.20', '8.4400', 1473342364, 1473343839),
('2016-09-08', 'Au100g', '沪金100G', '289.00', '289.00', '289.00', '289.00', '0.00', '289.00', '0.4000', 1473342222, 1473343839),
('2016-09-08', 'Au(T+N2)', '延期双金', '289.90', '289.90', '289.90', '289.90', '-0.14', '290.30', '0.2000', 1473342404, 1473343839),
('2016-09-08', 'Pt99.95', '沪铂95', '0.00', '0.00', '0.00', '0.00', '0.00', '248.33', '0.0000', 1473341727, 1473343839),
('2016-09-08', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473341491, 1473343839),
('2016-09-08', 'iAu99.5', 'IAU99.5', '0.00', '0.00', '0.00', '0.00', '0.00', '237.80', '0.0000', 1473334755, 1473343839),
('2016-09-08', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '289.20', '0.0000', 1473342405, 1473343839),
('2016-09-08', 'Au(T+N1)', '延期单金', '0.00', '0.00', '0.00', '0.00', '0.00', '292.35', '0.0000', 1473342362, 1473343839),
('2016-09-08', 'Au(T+D)', '黄金延期', '288.56', '288.65', '289.25', '288.10', '-0.18', '289.08', '13612.0000', 1473342372, 1473345642),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '288.61', '289.26', '289.40', '288.20', '-0.21', '289.23', '1199.0000', 1473342372, 1473345642),
('2016-09-08', 'Au(T+N2)', '延期双金', '289.90', '289.90', '289.90', '289.90', '-0.14', '290.30', '0.2000', 1473342372, 1473345642),
('2016-09-08', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '289.20', '0.0000', 1473342371, 1473345642),
('2016-09-08', 'Au(T+D)', '黄金延期', '288.60', '288.65', '289.25', '288.10', '-0.17', '289.08', '16310.0000', 1473346003, 1473347444),
('2016-09-08', 'mAu(T+D)', '迷你黄金延期', '288.70', '289.26', '289.40', '288.20', '-0.18', '289.23', '1472.0000', 1473346003, 1473347444),
('2016-09-08', 'Au99.95', '沪金95', '289.00', '289.10', '289.46', '289.00', '-0.03', '289.10', '80.0000', 1473344872, 1473347444),
('2016-09-08', 'Au99.99', '沪金99', '288.80', '289.69', '289.69', '288.22', '-0.14', '289.20', '16.8000', 1473346001, 1473347444),
('2016-09-08', 'Au100g', '沪金100G', '289.00', '289.00', '289.00', '289.00', '0.00', '289.00', '1.2000', 1473345916, 1473347444),
('2016-09-08', 'Au(T+N1)', '延期单金', '292.00', '291.60', '292.00', '291.60', '-0.12', '292.35', '1.0000', 1473345987, 1473347444),
('2016-09-08', 'Au(T+N2)', '延期双金', '289.90', '289.90', '289.90', '289.90', '-0.14', '290.30', '0.2000', 1473345940, 1473347444),
('2016-09-08', 'iAu100g', 'IAU100G', '0.00', '0.00', '0.00', '0.00', '0.00', '261.18', '0.0000', 1473345683, 1473347444),
('2016-09-08', 'iAu99.99', 'IAU99.99', '0.00', '0.00', '0.00', '0.00', '0.00', '289.20', '0.0000', 1473345988, 1473347444);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=122 ;

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
(119, 'auth', 117, 1, 'storage', '添加黄金入库记录', 'project/stock/storage', 1, 1, 0, ''),
(120, 'auth', 117, 1, 'detail', '详细信息', 'project/stock/detail', 1, 1, 0, ''),
(121, 'auth', 117, 3, 'terminated', '终止项目', 'project/stock/terminated', 1, 1, 0, '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `gd_project_file`
--

INSERT INTO `gd_project_file` (`file_id`, `project_sn`, `mode`, `dir`, `file`, `status`, `worker_id`, `addtime`) VALUES
(1, 'GR1609072292323723', 'recycling', 'photo', '[{"name":"user2-160x160.jpg","path":"public\\/uploads\\/2016\\/09\\/07233430c4779f.jpg"}]', 1, 5, 1473262643),
(2, 'GR1609072292323723', 'recycling', 'invoice', '[{"name":"avatar.png","path":"public\\/uploads\\/2016\\/09\\/0723343230d1e5.png"}]', 1, 5, 1473262643),
(3, 'GR1609072292323723', 'recycling', 'report', '[{"name":"121034209220f1.jpg","path":"public\\/uploads\\/2016\\/09\\/07233656415412.jpg"}]', 1, 5, 1473262643),
(4, 'GR1609072292323723', 'recycling', 'privacy', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/0723371138ba1a.txt"}]', 1, 5, 1473262643),
(9, 'GR1609082350070713', 'recycling', 'photo', '[{"name":"user5-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/0800064159997c.jpg"}]', 1, 5, 1473266405),
(10, 'GR1609082350070713', 'recycling', 'invoice', '[{"name":"avatar2.png","path":"public\\/uploads\\/2016\\/09\\/08000645a58955.png"}]', 1, 5, 1473266405),
(11, 'GR1609082350070713', 'recycling', 'report', '[{"name":"29155000ed424f.txt","path":"public\\/uploads\\/2016\\/09\\/080006488d5330.txt"}]', 1, 5, 1473266405),
(12, 'GR1609082350070713', 'recycling', 'privacy', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/08000657981570.txt"}]', 1, 5, 1473266405),
(13, 'GR1609084360044048', 'recycling', 'photo', '[{"name":"user1-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/08004148b6eafa.jpg"}]', 1, 5, 1473266526),
(14, 'GR1609084360044048', 'recycling', 'invoice', '[{"name":"avatar3.png","path":"public\\/uploads\\/2016\\/09\\/08004152bde3de.png"}]', 1, 5, 1473266526),
(15, 'GR1609084360044048', 'recycling', 'report', '[{"name":"29155000ed424f.txt","path":"public\\/uploads\\/2016\\/09\\/080041540b5664.txt"}]', 1, 5, 1473266526),
(16, 'GR1609084360044048', 'recycling', 'privacy', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/0800420280969f.txt"}]', 1, 5, 1473266526),
(17, 'GM1609086331083244', 'investing', 'privacy', '[{"name":"29155000ed424f.txt","path":"public\\/uploads\\/2016\\/09\\/0810323639fb44.txt"}]', 1, 6, 1473301964),
(18, 'GM1609084341753558', 'investing', 'privacy', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/081735538c1d19.txt"}]', 1, 6, 1473327358),
(19, 'GR1609085411713645', 'recycling', 'photo', '[{"name":"avatar2.png","path":"public\\/uploads\\/2016\\/09\\/08173630dad0bd.png"}]', 1, 6, 1473327405),
(20, 'GR1609085411713645', 'recycling', 'invoice', '[{"name":"user6-128x128.jpg","path":"public\\/uploads\\/2016\\/09\\/081736328ce060.jpg"}]', 1, 6, 1473327405),
(21, 'GR1609085411713645', 'recycling', 'report', '[{"name":"29155021142d12.txt","path":"public\\/uploads\\/2016\\/09\\/08173634582d73.txt"}]', 1, 6, 1473327405),
(22, 'GR1609089881733728', 'recycling', 'photo', '[{"name":"avatar4.png","path":"public\\/uploads\\/2016\\/09\\/08173737fc7978.png"}]', 1, 6, 1473327463),
(23, 'GR1609089881733728', 'recycling', 'report', '[{"name":"avatar3.png","path":"public\\/uploads\\/2016\\/09\\/08173740ef522e.png"}]', 1, 6, 1473327463),
(24, 'GM1609087441773818', 'investing', 'privacy', '[{"name":"29155000ed424f.txt","path":"public\\/uploads\\/2016\\/09\\/081738146147ba.txt"}]', 1, 6, 1473327498);

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
  `month` tinyint(4) NOT NULL DEFAULT '1',
  `profit` decimal(5,2) NOT NULL DEFAULT '0.00',
  `payment` enum('cash','gold') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'gold',
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  `transferrer` int(11) NOT NULL DEFAULT '0',
  `worker_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `lasttime` int(11) NOT NULL DEFAULT '0',
  `locker_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `gd_project_investing`
--

INSERT INTO `gd_project_investing` (`project_id`, `project_sn`, `status_id`, `customer_id`, `referrer_id`, `price`, `weight`, `amount`, `month`, `profit`, `payment`, `start`, `end`, `note`, `is_del`, `transferrer`, `worker_id`, `addtime`, `lasttime`, `locker_id`) VALUES
(1, 'GM1609086331083244', 6, 9, 12, '289.17', '100.00', '28917.00', 12, '0.08', 'cash', '2016-09-08', '2017-09-07', '阿斯顿撒旦撒大撒旦撒旦撒', 1, 3, 3, 1473301964, 1473325712, 0),
(2, 'GM1609084341753558', 6, 2, 2, '289.20', '15.00', '4338.00', 12, '0.08', 'gold', '2016-09-08', '2017-09-07', '465465446465', 1, 3, 3, 1473327358, 1473327993, 0),
(3, 'GM1609087441773818', 6, 5, 12, '289.20', '50.00', '14460.00', 12, '0.08', 'gold', '2016-09-08', '2017-09-07', '799878797897978797', 1, 3, 3, 1473327498, 1473327916, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `gd_project_investing_history`
--

INSERT INTO `gd_project_investing_history` (`history_id`, `project_id`, `status_id`, `note`, `request`, `worker_id`, `addtime`, `ip`) VALUES
(1, 1, 1, '46445sad6sad', '', 6, 1473301964, '127.0.0.1'),
(2, 1, 1, '46445sad6sad', '', 6, 1473302492, '127.0.0.1'),
(3, 1, 2, '', 'array (\n  ''amount'' =&gt; ''28917.00'',\n  ''_amount'' =&gt; ''28917.00'',\n  ''phone'' =&gt; ''13813800138'',\n  ''_phone'' =&gt; ''13813800138'',\n)', 3, 1473303455, '127.0.0.1'),
(4, 1, 3, '', 'array (\n  ''weight'' =&gt; ''100.00'',\n  ''_weight'' =&gt; ''100.00'',\n  ''phone'' =&gt; ''13813800138'',\n  ''_phone'' =&gt; ''13813800138'',\n)', 7, 1473305883, '127.0.0.1'),
(5, 1, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473305883, '127.0.0.1'),
(12, 1, 6, '阿斯顿撒旦撒大撒旦撒旦撒', '', 3, 1473325712, '127.0.0.1'),
(13, 2, 1, 'sadsadsadas', '', 6, 1473327358, '127.0.0.1'),
(14, 3, 1, '7987897', '', 6, 1473327498, '127.0.0.1'),
(15, 3, 2, '', 'array (\n  ''amount'' =&gt; ''14460.00'',\n  ''_amount'' =&gt; ''14460.00'',\n  ''phone'' =&gt; ''18959596565'',\n  ''_phone'' =&gt; ''18959596565'',\n)', 3, 1473327619, '127.0.0.1'),
(16, 2, 2, '46544', 'array (\n  ''amount'' =&gt; ''4338.00'',\n  ''_amount'' =&gt; ''4338.00'',\n  ''phone'' =&gt; ''18850911766'',\n  ''_phone'' =&gt; ''18850911766'',\n)', 3, 1473327648, '127.0.0.1'),
(17, 2, 3, '465454', 'array (\n  ''weight'' =&gt; ''15.00'',\n  ''_weight'' =&gt; ''15.00'',\n  ''phone'' =&gt; ''18850911766'',\n  ''_phone'' =&gt; ''18850911766'',\n)', 7, 1473327737, '127.0.0.1'),
(18, 2, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473327737, '127.0.0.1'),
(19, 3, 3, '', 'array (\n  ''weight'' =&gt; ''50.00'',\n  ''_weight'' =&gt; ''50.00'',\n  ''phone'' =&gt; ''18959596565'',\n  ''_phone'' =&gt; ''18959596565'',\n)', 7, 1473327762, '127.0.0.1'),
(20, 3, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473327762, '127.0.0.1'),
(21, 3, 6, '799878797897978797', '', 3, 1473327916, '127.0.0.1'),
(22, 2, 6, '465465446465', '', 3, 1473327993, '127.0.0.1');

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
(4, '生金中', 'growing', NULL, '生金增值', 1),
(5, '已驳回', 'refused', NULL, '客户信息等问题造成', 1),
(6, '已终止', 'terminated', NULL, '提前终止项目', 1);

-- --------------------------------------------------------

--
-- 表的结构 `gd_project_period`
--

CREATE TABLE IF NOT EXISTS `gd_project_period` (
  `period_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `month` tinyint(4) NOT NULL DEFAULT '1',
  `profit` decimal(5,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `default` tinyint(4) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `gd_project_period`
--

INSERT INTO `gd_project_period` (`period_id`, `title`, `month`, `profit`, `status`, `default`, `note`) VALUES
(1, '3个月 年化6%', 3, '6.00', 1, 0, ''),
(2, '6个月 年化7%', 6, '7.00', 1, 0, ''),
(3, '1年 年化8%', 12, '8.00', 1, 1, '');

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
  `locker_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `gd_project_recycling`
--

INSERT INTO `gd_project_recycling` (`project_id`, `project_sn`, `status_id`, `customer_id`, `referrer_id`, `price`, `origin_weight`, `weight`, `number`, `type`, `month`, `profit`, `payment`, `appraiser_id`, `loss`, `start`, `end`, `note`, `is_del`, `worker_id`, `transferrer`, `addtime`, `lasttime`, `locker_id`) VALUES
(1, 'GR1609072292323723', 0, 8, 12, '289.40', '12.00', '9.00', 2, 'ornaments', 12, '0.0800', 'gold', 9, '0.75', '2016-09-07', '2017-09-06', '0', 0, 0, '3', 1473262643, 1473343839, 0),
(2, 'GR1609082350070713', 2, 6, 12, '289.40', '100.00', '99.00', 2, 'goldbar', 12, '0.0800', 'cash', 9, '0.99', '2016-09-08', '2017-09-07', '', 0, 3, '7', 1473264433, 1473344472, 0),
(3, 'GR1609084360044048', 6, 5, 12, '289.40', '100.00', '98.00', 2, 'ornaments', 12, '0.0800', 'gold', 9, '0.98', '2016-09-08', '2017-09-07', 'sadsadasdsadasdasds', 1, 3, '3', 1473266448, 1473327189, 0),
(4, 'GR1609085411713645', 2, 9, 12, '289.20', '18.00', '17.00', 1, 'ornaments', 12, '0.0800', 'gold', 9, '0.94', '2016-09-08', '2017-09-07', '', 0, 3, '7', 1473327405, 1473344442, 0),
(5, 'GR1609089881733728', 0, 10, 12, '289.20', '28.00', '26.00', 2, 'ornaments', 12, '0.0800', 'gold', 9, '0.93', '2016-09-08', '2017-09-07', '0', 0, 0, '3', 1473327448, 1473343839, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `gd_project_recycling_history`
--

INSERT INTO `gd_project_recycling_history` (`history_id`, `project_id`, `status_id`, `note`, `request`, `worker_id`, `addtime`, `ip`) VALUES
(1, 1, 1, 'ZXzxzXZxzxz', '', 5, 1473262643, '127.0.0.1'),
(2, 2, 1, 'asdsadsadsa', '', 5, 1473264433, '127.0.0.1'),
(3, 2, 1, 'asdsadsadsa', '', 5, 1473266405, '127.0.0.1'),
(4, 3, 1, 'qweqweq', '', 5, 1473266448, '127.0.0.1'),
(5, 3, 1, 'qweqweq', '', 5, 1473266526, '127.0.0.1'),
(6, 3, 2, 'asdasdsadsa', 'array (\n  ''weight'' =&gt; ''98.00'',\n  ''_weight'' =&gt; ''98.00'',\n  ''phone'' =&gt; ''18959596565'',\n  ''_phone'' =&gt; ''18959596565'',\n)', 3, 1473268511, '127.0.0.1'),
(7, 3, 3, '332432432', 'array (\n  ''weight'' =&gt; ''98.00'',\n  ''_weight'' =&gt; ''98.00'',\n  ''phone'' =&gt; ''18959596565'',\n  ''_phone'' =&gt; ''18959596565'',\n)', 7, 1473269361, '127.0.0.1'),
(8, 3, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473269361, '127.0.0.1'),
(9, 3, 6, 'sadsadasdsadasdasds', '', 3, 1473327189, '127.0.0.1'),
(10, 4, 1, 'asdsadsadas', '', 6, 1473327405, '127.0.0.1'),
(11, 5, 1, 'adasdsad', '', 6, 1473327448, '127.0.0.1'),
(12, 5, 1, 'adasdsad', '', 6, 1473327463, '127.0.0.1'),
(13, 5, 2, '79798', 'array (\n  ''weight'' =&gt; ''26.00'',\n  ''_weight'' =&gt; ''26.00'',\n  ''phone'' =&gt; ''13606660888'',\n  ''_phone'' =&gt; ''13606660888'',\n)', 3, 1473327545, '127.0.0.1'),
(14, 1, 2, '4654654', 'array (\n  ''weight'' =&gt; ''9.00'',\n  ''_weight'' =&gt; ''9.00'',\n  ''phone'' =&gt; ''18808800990'',\n  ''_phone'' =&gt; ''18808800990'',\n)', 3, 1473327585, '127.0.0.1'),
(15, 1, 3, '', 'array (\n  ''weight'' =&gt; ''9.00'',\n  ''_weight'' =&gt; ''9.00'',\n  ''phone'' =&gt; ''18808800990'',\n  ''_phone'' =&gt; ''18808800990'',\n)', 7, 1473327681, '127.0.0.1'),
(16, 1, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473327681, '127.0.0.1'),
(17, 5, 3, '456546', 'array (\n  ''weight'' =&gt; ''26.00'',\n  ''_weight'' =&gt; ''26.00'',\n  ''phone'' =&gt; ''13606660888'',\n  ''_phone'' =&gt; ''13606660888'',\n)', 7, 1473327708, '127.0.0.1'),
(18, 5, 4, '库存已确认标记，自动推进到正在增值', '', 7, 1473327708, '127.0.0.1'),
(19, 1, 0, '0', '', 0, 1473343839, '0.0.0.0'),
(20, 5, 0, '0', '', 0, 1473343839, '0.0.0.0'),
(21, 4, 2, '', 'array (\n  ''weight'' =&gt; ''17.00'',\n  ''_weight'' =&gt; ''17.00'',\n  ''phone'' =&gt; ''13813800138'',\n  ''_phone'' =&gt; ''13813800138'',\n)', 3, 1473344442, '127.0.0.1'),
(22, 2, 2, '', 'array (\n  ''weight'' =&gt; ''99.00'',\n  ''_weight'' =&gt; ''99.00'',\n  ''phone'' =&gt; ''18959596767'',\n  ''_phone'' =&gt; ''18959596767'',\n)', 3, 1473344472, '127.0.0.1');

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
  `profit` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `month` tinyint(4) NOT NULL DEFAULT '1',
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `last_profit` date DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `lasttime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `gd_project_stock`
--

INSERT INTO `gd_project_stock` (`stock_id`, `project_sn`, `customer_id`, `referrer_id`, `title`, `mode`, `info`, `weight`, `profit`, `month`, `start`, `end`, `last_profit`, `note`, `status`, `worker_id`, `addtime`, `lasttime`) VALUES
(1, 'GR1609084360044048', 5, 12, '项目GR1609084360044048存金98.00克', 'recycling', 'a:12:{s:10:"project_id";s:1:"3";s:8:"realname";s:9:"马腾讯";s:5:"phone";s:11:"18959596565";s:8:"idnumber";s:18:"321254198808050604";s:5:"price";s:6:"289.40";s:5:"month";s:2:"12";s:4:"type";s:6:"金饰";s:6:"number";s:1:"2";s:13:"origin_weight";s:6:"100.00";s:6:"weight";s:5:"98.00";s:12:"appraiser_id";s:1:"9";s:7:"payment";s:4:"gold";}', '98.00', '0.0800', 12, '2016-09-08', '2017-09-07', NULL, '332432432', 0, 7, 1473269361, 1473269361),
(2, 'GM1609086331083244', 9, 12, '项目GM1609086331083244存金100.00克', 'investing', 'a:9:{s:10:"project_id";s:1:"1";s:8:"realname";s:9:"沈万三";s:5:"phone";s:11:"13813800138";s:8:"idnumber";s:18:"138139199810039997";s:5:"price";s:6:"289.17";s:6:"amount";s:8:"28917.00";s:6:"weight";s:6:"100.00";s:5:"month";s:2:"12";s:7:"payment";s:4:"cash";}', '100.00', '0.0800', 12, '2016-09-08', '2017-09-07', NULL, '', 0, 7, 1473305883, 1473305883),
(3, 'GR1609072292323723', 8, 12, '项目GR1609072292323723存金9.00克', 'recycling', 'a:15:{s:10:"project_id";s:1:"1";s:8:"realname";s:9:"乔苹果";s:5:"phone";s:11:"18808800990";s:8:"idnumber";s:18:"325225197008078888";s:6:"wechat";s:11:"qiaopingguo";s:5:"price";s:6:"289.40";s:5:"month";s:2:"12";s:4:"type";s:6:"金饰";s:6:"number";s:1:"2";s:13:"origin_weight";s:5:"12.00";s:6:"weight";s:4:"9.00";s:4:"loss";s:5:"0.75%";s:9:"appraiser";s:10:"鉴定人A";s:8:"referrer";s:10:"朱景修2";s:7:"payment";s:4:"gold";}', '9.00', '0.0800', 12, '2016-09-07', '2017-09-06', NULL, '', 0, 7, 1473327681, 1473327681),
(4, 'GR1609089881733728', 10, 12, '项目GR1609089881733728存金26.00克', 'recycling', 'a:15:{s:10:"project_id";s:1:"5";s:8:"realname";s:9:"赵公明";s:5:"phone";s:11:"13606660888";s:8:"idnumber";s:18:"123321196606066666";s:6:"wechat";s:12:"zhaogongming";s:5:"price";s:6:"289.20";s:5:"month";s:2:"12";s:4:"type";s:6:"金饰";s:6:"number";s:1:"2";s:13:"origin_weight";s:5:"28.00";s:6:"weight";s:5:"26.00";s:4:"loss";s:5:"0.93%";s:9:"appraiser";s:10:"鉴定人A";s:8:"referrer";s:10:"朱景修2";s:7:"payment";s:4:"gold";}', '26.00', '0.0800', 12, '2016-09-08', '2017-09-07', NULL, '456546', 0, 7, 1473327708, 1473327708),
(5, 'GM1609084341753558', 2, 2, '项目GM1609084341753558存金15.00克', 'investing', 'a:11:{s:10:"project_id";s:1:"2";s:8:"realname";s:9:"李百度";s:5:"phone";s:11:"18850911766";s:8:"idnumber";s:18:"321245198905080904";s:6:"wechat";s:0:"";s:5:"price";s:6:"289.20";s:6:"amount";s:7:"4338.00";s:6:"weight";s:5:"15.00";s:5:"month";s:2:"12";s:8:"referrer";s:9:"朱景修";s:7:"payment";s:4:"gold";}', '15.00', '0.0800', 12, '2016-09-08', '2017-09-07', NULL, '465454', 0, 7, 1473327737, 1473327737),
(6, 'GM1609087441773818', 5, 12, '项目GM1609087441773818存金50.00克', 'investing', 'a:11:{s:10:"project_id";s:1:"3";s:8:"realname";s:9:"马腾讯";s:5:"phone";s:11:"18959596565";s:8:"idnumber";s:18:"321254198808050604";s:6:"wechat";s:0:"";s:5:"price";s:6:"289.20";s:6:"amount";s:8:"14460.00";s:6:"weight";s:5:"50.00";s:5:"month";s:2:"12";s:8:"referrer";s:10:"朱景修2";s:7:"payment";s:4:"gold";}', '50.00', '0.0800', 12, '2016-09-08', '2017-09-07', NULL, '', 0, 7, 1473327762, 1473327762);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `gd_project_trash`
--

INSERT INTO `gd_project_trash` (`trash_id`, `project_id`, `project_sn`, `mode`, `customer`, `gold`, `note`, `worker_id`, `addtime`, `ip`) VALUES
(6, 1, 'GM1609086331083244', 'investing', 'a:5:{s:8:"realname";s:9:"沈万三";s:5:"phone";s:11:"13813800138";s:8:"idnumber";s:18:"138139199810039997";s:6:"wechat";s:10:"shenwansan";s:8:"referrer";s:10:"朱景修2";}', 'a:8:{s:5:"price";s:6:"289.17";s:6:"weight";s:6:"100.00";s:6:"amount";s:8:"28917.00";s:5:"start";s:10:"2016-09-08";s:3:"end";s:10:"2017-09-07";s:5:"month";s:2:"12";s:6:"profit";s:4:"0.08";s:7:"payment";s:4:"cash";}', '阿斯顿撒旦撒大撒旦撒旦撒', 3, 1473325712, '127.0.0.1'),
(7, 3, 'GR1609084360044048', 'recycling', 'a:5:{s:8:"realname";s:9:"马腾讯";s:5:"phone";s:11:"18959596565";s:8:"idnumber";s:18:"321254198808050604";s:6:"wechat";s:0:"";s:8:"referrer";s:10:"朱景修2";}', 'a:11:{s:5:"price";s:6:"289.40";s:4:"type";s:6:"金饰";s:6:"number";s:1:"2";s:13:"origin_weight";s:6:"100.00";s:6:"weight";s:5:"98.00";s:9:"appraiser";s:10:"鉴定人A";s:5:"start";s:10:"2016-09-08";s:3:"end";s:10:"2017-09-07";s:5:"month";s:2:"12";s:6:"profit";s:6:"0.0800";s:7:"payment";s:4:"gold";}', 'sadsadasdsadasdasds', 3, 1473327189, '127.0.0.1'),
(8, 3, 'GM1609087441773818', 'investing', 'a:5:{s:8:"realname";s:9:"马腾讯";s:5:"phone";s:11:"18959596565";s:8:"idnumber";s:18:"321254198808050604";s:6:"wechat";s:0:"";s:8:"referrer";s:10:"朱景修2";}', 'a:8:{s:5:"price";s:6:"289.20";s:6:"weight";s:5:"50.00";s:6:"amount";s:8:"14460.00";s:5:"start";s:10:"2016-09-08";s:3:"end";s:10:"2017-09-07";s:5:"month";s:2:"12";s:6:"profit";s:4:"0.08";s:7:"payment";s:4:"gold";}', '799878797897978797', 3, 1473327916, '127.0.0.1'),
(9, 2, 'GM1609084341753558', 'investing', 'a:5:{s:8:"realname";s:9:"李百度";s:5:"phone";s:11:"18850911766";s:8:"idnumber";s:18:"321245198905080904";s:6:"wechat";s:0:"";s:8:"referrer";s:9:"朱景修";}', 'a:8:{s:5:"price";s:6:"289.20";s:6:"weight";s:5:"15.00";s:6:"amount";s:7:"4338.00";s:5:"start";s:10:"2016-09-08";s:3:"end";s:10:"2017-09-07";s:5:"month";s:2:"12";s:6:"profit";s:4:"0.08";s:7:"payment";s:4:"gold";}', '465465446465', 3, 1473327993, '127.0.0.1');

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
('bbff738c77fc9cc15e6a1d9c888ff1720bf81415', '127.0.0.1', 1473242590, '__ci_last_regenerate|i:1473241384;code|s:4:"jNtz";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473208514";'),
('b13da3643adf9d9c9044e916308e1485c43a89eb', '127.0.0.1', 1473249732, '__ci_last_regenerate|i:1473249169;code|s:4:"M5cQ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473172336";'),
('e5ca4d80d1c5910508119bebf744a1d7d830fee5', '127.0.0.1', 1473250174, '__ci_last_regenerate|i:1473250017;code|s:4:"M5cQ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473172336";'),
('50ebfb7a72141fbaf233026f1cab9cd3a0f146fd', '127.0.0.1', 1473251991, '__ci_last_regenerate|i:1473250722;code|s:4:"M5cQ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473172336";'),
('c1c86b6ca7e3178389bf534c3d21c3651e5fef86', '127.0.0.1', 1473252168, '__ci_last_regenerate|i:1473252067;code|s:4:"M5cQ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473172336";'),
('199a080de6e55fa36b221aade4ec5815401d287d', '127.0.0.1', 1473252515, '__ci_last_regenerate|i:1473252444;code|s:4:"M5cQ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473172336";'),
('a56a96df3b2f8d9fb602ee959e8da6c726912246', '127.0.0.1', 1473252933, '__ci_last_regenerate|i:1473252758;code|s:4:"M5cQ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473172336";'),
('d2bce371aa8da62913308d64844e18e9cad3b095', '127.0.0.1', 1473253396, '__ci_last_regenerate|i:1473253083;code|s:4:"M5cQ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473172336";success|s:12:"保存成功";__ci_vars|a:1:{s:7:"success";s:3:"old";}'),
('54d277ccd053630d9b0625910813c870dcabf3b3', '127.0.0.1', 1473256006, '__ci_last_regenerate|i:1473253495;code|s:4:"M5cQ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473172336";'),
('27885e9fd543ac1b49fd660e0ad84ce0bc66ffb6', '127.0.0.1', 1473254646, '__ci_last_regenerate|i:1473253724;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";csrfkey|s:8:"7fzor9Vk";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"rht6OAMWsDeUuqGV8i7C";'),
('c941c0716428add10d6ecffb067b1077bc948ccc', '127.0.0.1', 1473257216, '__ci_last_regenerate|i:1473254784;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";'),
('04e262359165bcd08fcdf39a0669f9f64889530d', '127.0.0.1', 1473256340, '__ci_last_regenerate|i:1473256148;code|s:4:"M5cQ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473172336";'),
('01a05b821739ec8658d8528ba392cfe483c5e070', '127.0.0.1', 1473266416, '__ci_last_regenerate|i:1473256691;code|s:4:"M5cQ";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473172336";'),
('3f8bd7fa97ef91983b20aeef27a27773bcf7fef1', '127.0.0.1', 1473257244, '__ci_last_regenerate|i:1473257234;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";'),
('5c15fb06ea34b86aa05b5cae0bcae65586738b28', '127.0.0.1', 1473258536, '__ci_last_regenerate|i:1473257816;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";csrfkey|s:8:"nyBmAspv";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"Co5VP1jElqQbyc9OhvB6";'),
('334837d0de4d4c92638aef0667e96ba5cbadb02e', '127.0.0.1', 1473259019, '__ci_last_regenerate|i:1473258771;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";'),
('76e989c3f1f20e952f3d6860646f0acb23ebf436', '127.0.0.1', 1473260763, '__ci_last_regenerate|i:1473259144;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";csrfkey|s:8:"Yqp07h4V";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"mj4sk6RYQSUeu15tZf3b";'),
('c253935b41d74137947ee99237d452505ecfbb1b', '127.0.0.1', 1473261217, '__ci_last_regenerate|i:1473260980;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";csrfkey|s:8:"g6iBAUX5";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"yaOosTCRXxL2bg1GpvPu";'),
('0ac876fe713300d920b25b9b63630ed6a997393e', '127.0.0.1', 1473261720, '__ci_last_regenerate|i:1473261460;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";csrfkey|s:8:"lM3TP297";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"8aVxr3yBWpRkXYMCFtAS";'),
('13de300f7b4810e4b32528b493e2aa04f4c093bc', '127.0.0.1', 1473262465, '__ci_last_regenerate|i:1473262143;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";csrfkey|s:8:"QxphC5bG";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"AoJdhbRz9HX6r54s3SqM";'),
('8789c57b239b3608324f8020aa11b42899564215', '127.0.0.1', 1473263059, '__ci_last_regenerate|i:1473262470;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";'),
('6a5c7fc3658be5ca75fe306d6b2e1e3491f82b81', '127.0.0.1', 1473264063, '__ci_last_regenerate|i:1473263777;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";'),
('7efa8175d44d3994be8525d61181ac95750670cd', '127.0.0.1', 1473264393, '__ci_last_regenerate|i:1473264085;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";csrfkey|s:8:"AUrknOwR";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"2afBuZYHg3UsPiAQ0Dtz";'),
('a6478dde6cecbdeb383d21fd45e6ce9bd37dbc1e', '127.0.0.1', 1473264726, '__ci_last_regenerate|i:1473264401;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";'),
('d2e66362183ef4e3c7ded76fb24d92e525d390c7', '127.0.0.1', 1473266405, '__ci_last_regenerate|i:1473264770;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";success|s:21:"项目编辑成功！";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('8749d73354e483cebf5962c4fed49506a6461604', '127.0.0.1', 1473267727, '__ci_last_regenerate|i:1473266405;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";csrfkey|s:8:"ReMsPQug";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"N7LiCWbaJFVjvO1UnYxE";'),
('ce46c5b33f1e029d8915f5bd15232112f4be9725', '127.0.0.1', 1473267878, '__ci_last_regenerate|i:1473266549;code|s:4:"QxYH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473241385";csrfkey|s:8:"NHJbS0pQ";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"zCYLRfWBnlK7yMVtmNdv";'),
('5a75ea57140e9d95df574164896308c3a5cf33de', '127.0.0.1', 1473269297, '__ci_last_regenerate|i:1473267869;code|s:4:"pFXU";identity|s:12:"dengji-demo1";username|s:12:"dengji-demo1";email|s:6:"b@a.cc";user_id|s:1:"5";old_last_login|s:10:"1473240960";'),
('3f9e894d988c5911e3a89fe362b214604f475a7a', '127.0.0.1', 1473268511, '__ci_last_regenerate|i:1473267879;code|s:4:"QxYH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473241385";csrfkey|s:8:"2jQTYmDR";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:7:"success";s:3:"new";}csrfvalue|s:20:"04TaEQcuLlf9FPBWNi17";success|s:44:"项目已核实！编号: GR1609084360044048";'),
('656dff57575b4693b35b8385e901a9a39e4e6e1f', '127.0.0.1', 1473268528, '__ci_last_regenerate|i:1473268513;code|s:4:"QxYH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473241385";'),
('e665cc0801896bd5080357d10999dad8a93d5b15', '127.0.0.1', 1473269140, '__ci_last_regenerate|i:1473268822;code|s:4:"dT72";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473138246";csrfkey|s:8:"eN4SBn6Q";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"UuGn2M0bD6LKgcAfQIyZ";'),
('5a23610ba11e23a63c4da91c1804b8f01f3bcfd1', '127.0.0.1', 1473269362, '__ci_last_regenerate|i:1473269148;code|s:4:"dT72";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473138246";'),
('3706ddc59c7e0d5e7849a5bdf24ff1465ff79c87', '127.0.0.1', 1473294694, '__ci_last_regenerate|i:1473294671;code|s:4:"RXFa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473266567";'),
('b3903939f634d477413e8ac35bb62f3a32edce63', '127.0.0.1', 1473297043, '__ci_last_regenerate|i:1473295843;code|s:4:"RXFa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473266567";'),
('6e6fa4cc32657802b65a60953fcb76fd1c5393c4', '127.0.0.1', 1473297214, '__ci_last_regenerate|i:1473297213;code|s:4:"RXFa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473266567";'),
('a5dafb6294a35eb72c49bb181618a4772a761389', '127.0.0.1', 1473297951, '__ci_last_regenerate|i:1473297853;code|s:4:"Tzmh";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473249173";'),
('e1e1ec6be2b449eca8408a903cc85406f518cf38', '127.0.0.1', 1473298173, '__ci_last_regenerate|i:1473298021;code|s:4:"RXFa";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473266567";'),
('d1a8bae40aeed455d269424b65e6ba430a29a2e6', '127.0.0.1', 1473298668, '__ci_last_regenerate|i:1473298490;code|s:4:"Tzmh";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473249173";'),
('6cb29d60b891bfc138fccecb056cd54393405ae9', '127.0.0.1', 1473298941, '__ci_last_regenerate|i:1473298679;code|s:4:"25HU";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473297861";'),
('de8e4ef62b3ca5e7c2039aa0feca4915a375ad91', '127.0.0.1', 1473301442, '__ci_last_regenerate|i:1473298996;code|s:4:"87XH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298674";'),
('78467f3e0fc82c958ec0c724651e81523218800b', '127.0.0.1', 1473299993, '__ci_last_regenerate|i:1473299063;code|s:4:"zCUq";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:10:"1473133650";current_price|s:19:"pSH7Ae6ruRJIQIQTAvo";__ci_vars|a:3:{s:13:"current_price";i:1473301193;s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"T3XAz45r";csrfvalue|s:20:"4S9Dn6rPMwmgekjhWvBd";'),
('815ddbf81f97aaf2f8d56aba97946551b9880caf', '127.0.0.1', 1473300279, '__ci_last_regenerate|i:1473300005;code|s:4:"zCUq";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:10:"1473133650";current_price|s:19:"pSH7Ae6ruRJIQIQTAvo";__ci_vars|a:3:{s:13:"current_price";i:1473301479;s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"6WMksqP2";csrfvalue|s:20:"U5CGgVaRbMN1IvrBxyip";'),
('36252d6f804a79eeff368a9744af4a6a676f032c', '127.0.0.1', 1473301552, '__ci_last_regenerate|i:1473300352;code|s:4:"zCUq";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:10:"1473133650";current_price|s:19:"pSH7Ae6ruRJIQIQTAvo";__ci_vars|a:1:{s:13:"current_price";i:1473301593;}'),
('cdec3841e3bb48e5690244379aba0aa8fb50578b', '127.0.0.1', 1473301964, '__ci_last_regenerate|i:1473301849;code|s:4:"zCUq";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:10:"1473133650";current_price|N;__ci_vars|a:1:{s:13:"current_price";i:1473303051;}'),
('f0988954466fd41d60442399c440a1c4ce108ff9', '127.0.0.1', 1473302492, '__ci_last_regenerate|i:1473302160;code|s:4:"zCUq";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:10:"1473133650";current_price|N;__ci_vars|a:2:{s:13:"current_price";i:1473303051;s:7:"success";s:3:"new";}success|s:48:"项目编辑成功！ 编号: GM1609086331083244";'),
('c2eb6bab5379b447b5c248bb9ac17eac386117db', '127.0.0.1', 1473304383, '__ci_last_regenerate|i:1473302492;code|s:4:"zCUq";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:10:"1473133650";current_price|s:19:"piGsBrj67xFIQIQTAPg";__ci_vars|a:3:{s:13:"current_price";i:1473305583;s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"an8GXujy";csrfvalue|s:20:"I8jTeXZlzQ3Skw6i5BE2";'),
('c526d2d66e9f319df06097e17aee514325a85f71', '127.0.0.1', 1473302812, '__ci_last_regenerate|i:1473302507;code|s:4:"87XH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298674";csrfkey|s:8:"g3XdeMvA";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"CKu2PhzyWQxbFiZe3tMD";'),
('0ed493d3ce28583f557291fa8deafc2e1d8e1f1c', '127.0.0.1', 1473303387, '__ci_last_regenerate|i:1473302813;code|s:4:"87XH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298674";csrfkey|s:8:"Wly4feCs";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"YiGExfOqIDCVcBaTJ8nj";'),
('9f92c83875536f8500f1840526067f97099dd41c', '127.0.0.1', 1473303676, '__ci_last_regenerate|i:1473303387;code|s:4:"87XH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298674";'),
('364e5fd93b245444e956486399eed570eb58a68b', '127.0.0.1', 1473303691, '__ci_last_regenerate|i:1473303489;code|s:4:"76y8";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473268843";csrfkey|s:8:"oTSLJz8R";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"xE35dBmukLeDngVOt6jI";'),
('4f50d918ee17b8dc01fa9f8a61fa8f7405a0068f', '127.0.0.1', 1473303873, '__ci_last_regenerate|i:1473303872;code|s:4:"87XH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298674";'),
('3486bbacdc0dc97342b7fae002e2737b11cdeca0', '127.0.0.1', 1473304620, '__ci_last_regenerate|i:1473303877;code|s:4:"76y8";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473268843";csrfkey|s:8:"jF8MoEPG";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"JjDiF5uI2EStM3V49HpP";'),
('86f6dc09bdd63a6e0d99fbbe16755b185edf6f1b', '127.0.0.1', 1473327319, '__ci_last_regenerate|i:1473304386;code|s:4:"zCUq";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:10:"1473133650";current_price|s:19:"oHX4ULj+vkNIQIQTAf0";__ci_vars|a:3:{s:13:"current_price";i:1473328519;s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"tLA3rcsx";csrfvalue|s:20:"A4g2OUbrcBqK96CNiezp";'),
('a68008da5b9f733b3377993da343cc8031214d82', '127.0.0.1', 1473304808, '__ci_last_regenerate|i:1473304595;code|s:4:"87XH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298674";ajax_permission|s:51:"没有授权访问  <br> [project/recycling/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('232b30f3dd6907e87e9342e9bd746353bce41f63', '127.0.0.1', 1473304622, '__ci_last_regenerate|i:1473304621;code|s:4:"76y8";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473268843";'),
('70e80e9d30164a36fe94b27439e201758161a783', '127.0.0.1', 1473305250, '__ci_last_regenerate|i:1473305126;code|s:4:"76y8";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473268843";'),
('097a9870fd0c5307095812ea7e5193b58ebebdf9', '127.0.0.1', 1473305998, '__ci_last_regenerate|i:1473305401;code|s:4:"7MPs";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473303511";csrfkey|s:8:"fHLIykTe";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"PEwjpb8iKWD4GzkNQtor";'),
('f8ff5f4ae76be5c897803a4036ecede2465d79e8', '127.0.0.1', 1473305883, '__ci_last_regenerate|i:1473305456;code|s:4:"76y8";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473268843";csrfkey|s:8:"KtDgAl7M";__ci_vars|a:3:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";s:7:"success";s:3:"new";}csrfvalue|s:20:"kaG5IxA4e6t3HjP1MJ7R";success|s:50:"项目已入库标记！编号: GM1609086331083244";'),
('caf26a29831210e9e80f37c54c8fe884f8b99527', '127.0.0.1', 1473326765, '__ci_last_regenerate|i:1473305883;code|s:4:"76y8";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473268843";'),
('44e5beb963d5492980a284b6b0ead1e7f027a6ac', '127.0.0.1', 1473306175, '__ci_last_regenerate|i:1473306143;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";ajax_permission|s:51:"没有授权访问  <br> [project/investing/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"old";}'),
('1a518ff01f1f06005b05954cc2947b45306da0ee', '127.0.0.1', 1473306868, '__ci_last_regenerate|i:1473306667;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";ajax_permission|s:51:"没有授权访问  <br> [project/investing/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('fb19e40e6704c18de0fde6983ec81223bd0606d1', '127.0.0.1', 1473309514, '__ci_last_regenerate|i:1473307086;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";'),
('b172bd79ca0288bd31f165ff15390872a8ae1384', '127.0.0.1', 1473309682, '__ci_last_regenerate|i:1473309566;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";'),
('1ceb90e0a26d4a3d47b0166b171f6cd87dd71ffb', '127.0.0.1', 1473310268, '__ci_last_regenerate|i:1473309882;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";ajax_permission|s:51:"没有授权访问  <br> [project/investing/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('5033c4c9a24fd3a7e3c1bfb1755672c2b5afdc02', '127.0.0.1', 1473311127, '__ci_last_regenerate|i:1473310272;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";ajax_permission|s:47:"没有授权访问  <br> [project/stock/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('833f9e5071d7ed5bd3f83b52e54d0b973231d381', '127.0.0.1', 1473312871, '__ci_last_regenerate|i:1473311165;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";ajax_permission|s:47:"没有授权访问  <br> [project/stock/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('5e73f4d39488f75869e591b949ea59d6c27dec2c', '127.0.0.1', 1473316483, '__ci_last_regenerate|i:1473313163;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";ajax_permission|s:47:"没有授权访问  <br> [project/stock/detail]";__ci_vars|a:1:{s:15:"ajax_permission";s:3:"new";}'),
('1da1c10ea9cdf6856a9c8a69e86fc1efa77f4c4a', '127.0.0.1', 1473323708, '__ci_last_regenerate|i:1473316507;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";'),
('1e8cd223f71c6170acfba8095272530e91c0f156', '127.0.0.1', 1473325734, '__ci_last_regenerate|i:1473324379;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";success|s:44:"项目已终止！编号: GM1609086331083244";__ci_vars|a:1:{s:7:"success";s:3:"old";}'),
('391f665679bda8a2cf7d3322c38515edd9d0a50b', '127.0.0.1', 1473324513, '__ci_last_regenerate|i:1473324456;code|s:4:"syXT";identity|s:10:"admin-root";username|s:10:"admin-root";email|s:15:"admin@admin.com";user_id|s:1:"1";old_last_login|s:10:"1473298682";'),
('a5679ce930183d275f94b7698b362eac9cfe003d', '127.0.0.1', 1473325991, '__ci_last_regenerate|i:1473325797;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";'),
('3490d7738d3d5552e6db8fb2ddd194ca5f385d57', '127.0.0.1', 1473326441, '__ci_last_regenerate|i:1473326167;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";'),
('2b755b695665306cb22034219695fafe08357ab7', '127.0.0.1', 1473327189, '__ci_last_regenerate|i:1473326498;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";success|s:44:"项目已终止！编号: GR1609084360044048";__ci_vars|a:1:{s:7:"success";s:3:"new";}'),
('d128fd5c2580c33bd12552acec0558f7abfcdfad', '127.0.0.1', 1473327190, '__ci_last_regenerate|i:1473327189;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";'),
('840f2754c51e8c52098c75e08966c0cbf13a04ca', '127.0.0.1', 1473327308, '__ci_last_regenerate|i:1473327276;code|s:4:"76y8";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473268843";'),
('21240d772155154cc0a7c6ec81e14b52b2cd7504', '127.0.0.1', 1473330513, '__ci_last_regenerate|i:1473327324;code|s:4:"zCUq";identity|s:12:"dengji-demo2";username|s:12:"dengji-demo2";email|s:10:"ludan@b.cc";user_id|s:1:"6";old_last_login|s:10:"1473133650";'),
('3cf3a6e4c9d7a590ca16e0a96e61fc8c26cd64d3', '127.0.0.1', 1473327653, '__ci_last_regenerate|i:1473327508;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";'),
('16a3e4723c36cb40083de88a40da49b1b573e6a0', '127.0.0.1', 1473330165, '__ci_last_regenerate|i:1473327662;code|s:4:"76y8";identity|s:12:"kuguan-demo1";username|s:12:"kuguan-demo1";email|s:11:"kuguan@bb.c";user_id|s:1:"7";old_last_login|s:10:"1473268843";'),
('63724e75552aa6d8a5717c1595e9197d5a3ba2bc', '127.0.0.1', 1473330393, '__ci_last_regenerate|i:1473327892;code|s:4:"57B2";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473298999";'),
('35da65f1395583f0b9aa6b7bdc3697e5b0fd58f7', '127.0.0.1', 1473342950, '__ci_last_regenerate|i:1473338119;code|s:4:"dtuH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473306145";'),
('0b6c465387a91fb8510d9db58547ff7ebc48f74b', '127.0.0.1', 1473344143, '__ci_last_regenerate|i:1473343907;code|s:4:"dtuH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473306145";csrfkey|s:8:"PSVE3WZg";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"4u9KhmiTz8QH6SlWaqIR";');
INSERT INTO `gd_sessions` (`sess_id`, `ip_address`, `timestamp`, `data`) VALUES
('81905645e86988139b8510b01c94bb19e7ed160b', '127.0.0.1', 1473344615, '__ci_last_regenerate|i:1473344386;code|s:4:"dtuH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473306145";'),
('b13a01fc0da98c31680951ae0867e4bd369fcadf', '127.0.0.1', 1473345659, '__ci_last_regenerate|i:1473344713;code|s:4:"dtuH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473306145";csrfkey|s:8:"jrcYu9Zh";__ci_vars|a:2:{s:7:"csrfkey";s:3:"old";s:9:"csrfvalue";s:3:"old";}csrfvalue|s:20:"ne2cYDLqFQzUA8TWhxKb";'),
('56dea283e186fa375b4ad790f7593279899d5562', '127.0.0.1', 1473345857, '__ci_last_regenerate|i:1473345669;code|s:4:"dtuH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473306145";'),
('c17077903e09714d17c79aa2e723b7f6e5f27811', '127.0.0.1', 1473346171, '__ci_last_regenerate|i:1473346004;code|s:4:"dtuH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473306145";'),
('0f552ec67ca3716851759eb6ad9ab5c960669e39', '127.0.0.1', 1473346395, '__ci_last_regenerate|i:1473346395;code|s:4:"dtuH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473306145";'),
('d8c9f817e537c00ec6b28dabcc7ba872f46a377d', '127.0.0.1', 1473347640, '__ci_last_regenerate|i:1473346409;code|s:4:"tuiq";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473338121";'),
('3d094ada9e4ea27515f3ca226a3d9a31da24a95d', '127.0.0.1', 1473347625, '__ci_last_regenerate|i:1473347036;code|s:4:"dtuH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473306145";ajax_permission|s:34:"没有授权访问  <br> [project]";__ci_vars|a:3:{s:15:"ajax_permission";s:3:"new";s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfkey|s:8:"5XSaDEKP";csrfvalue|s:20:"klXx2YeLAjiuNz7QmDTP";'),
('479e7d2f37d3e510eab3b7ab5565bd01664b1b13', '127.0.0.1', 1473347999, '__ci_last_regenerate|i:1473347691;code|s:4:"dtuH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473306145";'),
('3275c56a4617a3e13b7aaf7dd04ca6b79973a8b5', '127.0.0.1', 1473348087, '__ci_last_regenerate|i:1473348012;code|s:4:"dtuH";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473306145";'),
('c792bd268f2f488d3fb42200acc94fac16e5194f', '127.0.0.1', 1473348094, '__ci_last_regenerate|i:1473348091;code|s:4:"tuiq";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473338121";csrfkey|s:8:"iRNwVGXj";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"ZNpBgxK1aS4kDWhX97b2";'),
('e765f8344942e1776092ec17458088bdd49e332c', '127.0.0.1', 1473348701, '__ci_last_regenerate|i:1473348418;code|s:4:"tuiq";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473338121";csrfkey|s:8:"DatB8p7c";__ci_vars|a:2:{s:7:"csrfkey";s:3:"new";s:9:"csrfvalue";s:3:"new";}csrfvalue|s:20:"lmSWL6YP0Cwdb1AOIVth";'),
('aa3d3a6f3bf840bbd5ff77fb71d64866c573f18c', '127.0.0.1', 1473348745, '__ci_last_regenerate|i:1473348744;code|s:4:"tuiq";identity|s:12:"jingli-demo1";username|s:12:"jingli-demo1";email|s:5:"a@a.c";user_id|s:1:"3";old_last_login|s:10:"1473338121";');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

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
(38, 'site_title', '黄金码头 黄金线下交易平台', 0, 'site', 1),
(39, 'cron_interval', '300', 0, 'site', 1),
(40, 'cron_encrypt', 'xy-zhujingxiu-4610', 0, 'site', 1);

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
(1, 'admin-root', '管理员', 'public/images/avatar/121034209220f1.jpg', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', NULL, 1469999823, 1473324465, '127.0.0.1', 1, '', NULL, NULL, 0),
(2, 'zhujingxiu', '朱景修', NULL, '$2y$08$QQOBCnHUhFTH/CjeWztJGOOfAz2xuqSki7P2qn5/WojZQvXc10NAK', NULL, 'zhujingxiu@hotmail.com', NULL, 1470736567, 1470736771, '127.0.0.1', 1, '18850911766', NULL, NULL, 0),
(3, 'jingli-demo1', '经理测试', 'public/images/avatar/avatar2.png', '$2y$08$k1dyXUI7CRYqc/CpH9UT0ONk93y3sP7EQ5Jdcr/lvOoUE4Tob05Oe', NULL, 'a@a.c', NULL, 1471598448, 1473346427, '127.0.0.1', 1, '13913901390', 'qweweqweq', '', 0),
(4, 'jingli-demo2', '经理测试B', 'public/images/avatar/user1-128x128.jpg', '$2y$08$1gGt5kfd2/S0WGDZNt6PMu8bj1WBhiww4AgNx4TJSRrJaiQ7jV4gu', NULL, 'a@a.cc', NULL, 1471598720, 1472277405, '127.0.0.1', 1, '', NULL, NULL, 0),
(5, 'dengji-demo1', '登记测试A', 'public/images/avatar/avatar1.png', '$2y$08$YHzCZKpn3DYoZWYfE4UD4.7KSke2QaVc5Ou04ljhRNZn5sDqc7QF2', NULL, 'b@a.cc', NULL, 1471598889, 1473253736, '127.0.0.1', 1, '', NULL, NULL, 0),
(6, 'dengji-demo2', '录单测试B', 'public/images/avatar/user3-128x128.jpg', '$2y$08$7JByOlb/P/L.c8P.mqeMX.N7qSiLGBWyx3YWA44wUDkAMY0rGKtQS', NULL, 'ludan@b.cc', NULL, 1471598958, 1473299074, '127.0.0.1', 1, '', NULL, NULL, 0),
(7, 'kuguan-demo1', '库管测试A', 'public/images/avatar/user4-128x128.jpg', '$2y$08$SuuFWJ0sZL2z.SZDLaTX3Od/bkVZ04Ax1fc1SmDtoVf8X0XjuRuJO', NULL, 'kuguan@bb.c', NULL, 1471599005, 1473305414, '127.0.0.1', 1, '', NULL, NULL, 0),
(8, 'kuguan-demo2', '库管测试B', 'public/images/avatar/user5-128x128.jpg', '$2y$08$18MwNqHD5QKE/M2xcF4NXuLScN67KrGQfBCfXPEEEM/W5PNC/5/5G', NULL, 'kuguan@a.cc', NULL, 1471599054, 1473152537, '127.0.0.1', 1, '', NULL, NULL, 0),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `gd_worker_activity`
--

INSERT INTO `gd_worker_activity` (`activity_id`, `worker_id`, `content`, `addtime`) VALUES
(1, 3, '63189|-6628214672811|2016-09-08|12|0.0800', 1473327189),
(2, 3, '63916|1473327347|2016-09-08|12|0.0800', 1473327916),
(3, 3, '63993|0|2016-09-08|12|0.0800', 1473327993);

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
(3, 'manager', '经理', 0, '1,2,3,5,6,7,8,9,10,11,22,23,24,25,26,27,30,33,35,48,49,50,51,52,55,59,63,67,68,70,78,80,84,85,94,96,98,100,101,102,105,106,107,108,109,110,112,113,114,115,116,118,120,121', 1),
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
  `mode` enum('announcement','summary') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'announcement',
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
