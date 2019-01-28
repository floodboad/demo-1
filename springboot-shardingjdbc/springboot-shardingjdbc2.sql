-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.11-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 springboot-shardingjdbc2 的数据库结构
CREATE DATABASE IF NOT EXISTS `springboot-shardingjdbc2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `springboot-shardingjdbc2`;


-- 导出  表 springboot-shardingjdbc2.alibaba 结构
CREATE TABLE IF NOT EXISTS `alibaba` (
  `ali` int(11) NOT NULL,
  `baba` int(11) DEFAULT NULL,
  PRIMARY KEY (`ali`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  springboot-shardingjdbc2.alibaba 的数据：~0 rows (大约)
DELETE FROM `alibaba`;
/*!40000 ALTER TABLE `alibaba` DISABLE KEYS */;
INSERT INTO `alibaba` (`ali`, `baba`) VALUES
	(2, 222);
/*!40000 ALTER TABLE `alibaba` ENABLE KEYS */;


-- 导出  表 springboot-shardingjdbc2.alibaba2 结构
CREATE TABLE IF NOT EXISTS `alibaba2` (
  `ali` int(11) NOT NULL,
  `baba` int(11) DEFAULT NULL,
  PRIMARY KEY (`ali`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  springboot-shardingjdbc2.alibaba2 的数据：~0 rows (大约)
DELETE FROM `alibaba2`;
/*!40000 ALTER TABLE `alibaba2` DISABLE KEYS */;
/*!40000 ALTER TABLE `alibaba2` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
