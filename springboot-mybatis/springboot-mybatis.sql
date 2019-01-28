-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.28 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5284
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 springboot-mybatis 的数据库结构
CREATE DATABASE IF NOT EXISTS `springboot-mybatis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `springboot-mybatis`;

-- 导出  表 springboot-mybatis.alibaba 结构
CREATE TABLE IF NOT EXISTS `alibaba` (
  `ali` int(11) NOT NULL,
  `baba` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ali`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  springboot-mybatis.alibaba 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `alibaba` DISABLE KEYS */;
INSERT INTO `alibaba` (`ali`, `baba`) VALUES
	(1, '999');
/*!40000 ALTER TABLE `alibaba` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
