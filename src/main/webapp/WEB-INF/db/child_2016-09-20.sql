# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.10)
# Database: child
# Generation Time: 2016-09-20 06:19:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user`;

CREATE TABLE `admin_user` (
  `adminUserId` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT '',
  `status` int(1) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `createUserId` int(11) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `updateUserId` int(11) DEFAULT NULL,
  `isDelete` int(11) DEFAULT '0',
  PRIMARY KEY (`adminUserId`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;

INSERT INTO `admin_user` (`adminUserId`, `loginname`, `password`, `nickname`, `phone`, `email`, `status`, `description`, `createDate`, `createUserId`, `updateDate`, `updateUserId`, `isDelete`)
VALUES
	(131,'jiawook','E10ADC3949BA59ABBE56E057F20F883E','开发帐号－勿动','13333333333','13333333333@qq.com',1,' sdsdsad','2016-02-26 12:51:23',113,'2016-04-11 12:42:09',131,0),
	(132,'manager_1','E10ADC3949BA59ABBE56E057F20F883E','业务主管一号','13338888888','',1,'……','2016-08-25 17:47:56',131,NULL,NULL,0),
	(133,'service_1','E10ADC3949BA59ABBE56E057F20F883E','业务员一号','13333344444','',1,'……','2016-08-25 17:49:00',131,NULL,NULL,0),
	(134,'sdjksajdks','25E57531CDE4D13A294D3CAA604FC8BC','dfdsf','15748645451','sdsadsadsa@qq.com',1,'asd','2016-09-12 17:55:53',131,NULL,NULL,0),
	(135,'你好','E10ADC3949BA59ABBE56E057F20F883E','就撒嗲死的','18789464564','1415645sad@qc.com',1,'sadsd','2016-09-13 15:57:33',131,NULL,NULL,0);

/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auto_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auto_menu`;

CREATE TABLE `auto_menu` (
  `menuId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `code` varchar(50) NOT NULL DEFAULT '',
  `parentCode` varchar(50) DEFAULT '',
  `type` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `servletUrl` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `extend` int(11) DEFAULT '0',
  PRIMARY KEY (`menuId`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table login_cookie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_cookie`;

CREATE TABLE `login_cookie` (
  `cookieId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `loginname` varchar(11) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `createDate` datetime NOT NULL,
  PRIMARY KEY (`cookieId`),
  UNIQUE KEY `loginname` (`loginname`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table login_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_history`;

CREATE TABLE `login_history` (
  `historyId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `adminUserId` int(11) NOT NULL,
  `sessionId` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(100) NOT NULL DEFAULT '',
  `logininTime` datetime NOT NULL,
  `loginoutTime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`historyId`),
  UNIQUE KEY `sessionId` (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table role_manager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_manager`;

CREATE TABLE `role_manager` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `status` int(2) NOT NULL,
  `createDate` datetime NOT NULL,
  `createUserId` int(11) DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `updateUserId` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role_manager` WRITE;
/*!40000 ALTER TABLE `role_manager` DISABLE KEYS */;

INSERT INTO `role_manager` (`roleId`, `roleName`, `status`, `createDate`, `createUserId`, `updateDate`, `updateUserId`)
VALUES
	(1,'超级管理员',1,'2015-08-31 13:48:59',NULL,NULL,NULL),
	(2,'管理员',1,'2016-01-19 12:05:30',NULL,NULL,NULL),
	(19,'业务员',1,'2016-08-17 18:12:22',NULL,NULL,NULL),
	(20,'店铺负责人',1,'2016-08-19 12:55:58',NULL,NULL,NULL),
	(21,'业务主管',1,'2016-08-25 17:41:46',NULL,NULL,NULL);

/*!40000 ALTER TABLE `role_manager` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_to_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_to_menus`;

CREATE TABLE `role_to_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleId` (`roleId`,`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table system_source
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_source`;

CREATE TABLE `system_source` (
  `sourceId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `value` varchar(200) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `type` int(11) NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8mb4 DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`sourceId`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `system_source` WRITE;
/*!40000 ALTER TABLE `system_source` DISABLE KEYS */;

INSERT INTO `system_source` (`sourceId`, `key`, `value`, `type`, `description`, `createDate`)
VALUES
	(1,X'696D675F70617468','imgStore',1,'系统静态文件目录，%CATALINA_HOME%下面的一级目录(tomcat安装目录)','2016-04-25 14:16:40'),
	(2,X'73797374656D4E616D65','qzm-back',1,'后台企业模版名字','2016-04-25 14:21:26'),
	(3,X'6C6F676F','/imgStore/2016-04/sysLogo/eb06a0d9-29d6-4c49-b6bb-b40c1684f8e0.png',0,'系统logo','2016-04-25 15:22:12'),
	(4,X'736F636B6574506F7274','14082',1,'socket??',NULL),
	(5,X'7469746C65','system-manager',0,NULL,NULL),
	(6,X'6C6F676F5F75726C','http://www.baidu.com',0,NULL,NULL);

/*!40000 ALTER TABLE `system_source` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_to_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_to_role`;

CREATE TABLE `user_to_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleId` (`roleId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
