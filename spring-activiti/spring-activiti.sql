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

-- 导出 spring-activiti 的数据库结构
CREATE DATABASE IF NOT EXISTS `spring-activiti` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `spring-activiti`;


-- 导出  表 spring-activiti.act_evt_log 结构
CREATE TABLE IF NOT EXISTS `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_evt_log 的数据：~0 rows (大约)
DELETE FROM `act_evt_log`;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_ge_bytearray 结构
CREATE TABLE IF NOT EXISTS `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_ge_bytearray 的数据：~0 rows (大约)
DELETE FROM `act_ge_bytearray`;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_ge_property 结构
CREATE TABLE IF NOT EXISTS `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_ge_property 的数据：~3 rows (大约)
DELETE FROM `act_ge_property`;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` (`NAME_`, `VALUE_`, `REV_`) VALUES
	('next.dbid', '1', 1),
	('schema.history', 'create(5.16.4.0)', 1),
	('schema.version', '5.16.4.0', 1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_hi_actinst 结构
CREATE TABLE IF NOT EXISTS `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_hi_actinst 的数据：~0 rows (大约)
DELETE FROM `act_hi_actinst`;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_hi_attachment 结构
CREATE TABLE IF NOT EXISTS `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_hi_attachment 的数据：~0 rows (大约)
DELETE FROM `act_hi_attachment`;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_hi_comment 结构
CREATE TABLE IF NOT EXISTS `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_hi_comment 的数据：~0 rows (大约)
DELETE FROM `act_hi_comment`;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_hi_detail 结构
CREATE TABLE IF NOT EXISTS `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_hi_detail 的数据：~0 rows (大约)
DELETE FROM `act_hi_detail`;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_hi_identitylink 结构
CREATE TABLE IF NOT EXISTS `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_hi_identitylink 的数据：~0 rows (大约)
DELETE FROM `act_hi_identitylink`;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_hi_procinst 结构
CREATE TABLE IF NOT EXISTS `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_hi_procinst 的数据：~0 rows (大约)
DELETE FROM `act_hi_procinst`;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_hi_taskinst 结构
CREATE TABLE IF NOT EXISTS `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_hi_taskinst 的数据：~0 rows (大约)
DELETE FROM `act_hi_taskinst`;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_hi_varinst 结构
CREATE TABLE IF NOT EXISTS `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_hi_varinst 的数据：~0 rows (大约)
DELETE FROM `act_hi_varinst`;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_id_group 结构
CREATE TABLE IF NOT EXISTS `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_id_group 的数据：~0 rows (大约)
DELETE FROM `act_id_group`;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_id_info 结构
CREATE TABLE IF NOT EXISTS `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_id_info 的数据：~0 rows (大约)
DELETE FROM `act_id_info`;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_id_membership 结构
CREATE TABLE IF NOT EXISTS `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_id_membership 的数据：~0 rows (大约)
DELETE FROM `act_id_membership`;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_id_user 结构
CREATE TABLE IF NOT EXISTS `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_id_user 的数据：~0 rows (大约)
DELETE FROM `act_id_user`;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_leave 结构
CREATE TABLE IF NOT EXISTS `act_leave` (
  `id` varchar(50) NOT NULL,
  `days` varchar(50) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  spring-activiti.act_leave 的数据：~0 rows (大约)
DELETE FROM `act_leave`;
/*!40000 ALTER TABLE `act_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_leave` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_re_deployment 结构
CREATE TABLE IF NOT EXISTS `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_re_deployment 的数据：~0 rows (大约)
DELETE FROM `act_re_deployment`;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_re_model 结构
CREATE TABLE IF NOT EXISTS `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_re_model 的数据：~0 rows (大约)
DELETE FROM `act_re_model`;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_re_procdef 结构
CREATE TABLE IF NOT EXISTS `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_re_procdef 的数据：~0 rows (大约)
DELETE FROM `act_re_procdef`;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_ru_event_subscr 结构
CREATE TABLE IF NOT EXISTS `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_ru_event_subscr 的数据：~0 rows (大约)
DELETE FROM `act_ru_event_subscr`;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_ru_execution 结构
CREATE TABLE IF NOT EXISTS `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_ru_execution 的数据：~0 rows (大约)
DELETE FROM `act_ru_execution`;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_ru_identitylink 结构
CREATE TABLE IF NOT EXISTS `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_ru_identitylink 的数据：~0 rows (大约)
DELETE FROM `act_ru_identitylink`;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_ru_job 结构
CREATE TABLE IF NOT EXISTS `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_ru_job 的数据：~0 rows (大约)
DELETE FROM `act_ru_job`;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_ru_task 结构
CREATE TABLE IF NOT EXISTS `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_ru_task 的数据：~0 rows (大约)
DELETE FROM `act_ru_task`;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;


-- 导出  表 spring-activiti.act_ru_variable 结构
CREATE TABLE IF NOT EXISTS `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  spring-activiti.act_ru_variable 的数据：~0 rows (大约)
DELETE FROM `act_ru_variable`;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;


-- 导出  表 spring-activiti.sys_dict 结构
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  spring-activiti.sys_dict 的数据：~2 rows (大约)
DELETE FROM `sys_dict`;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` (`id`, `code`, `name`, `type`) VALUES
	('0e05c0f2-a0bc-4b75-8240-7500c9879a04', '2', '按钮', '1'),
	('a4c4df86-d72e-4cea-b90e-753440faf6f2', '1', '菜单', '1');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;


-- 导出  表 spring-activiti.sys_resources 结构
CREATE TABLE IF NOT EXISTS `sys_resources` (
  `id` varchar(50) NOT NULL,
  `pid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `sort` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  spring-activiti.sys_resources 的数据：~27 rows (大约)
DELETE FROM `sys_resources`;
/*!40000 ALTER TABLE `sys_resources` DISABLE KEYS */;
INSERT INTO `sys_resources` (`id`, `pid`, `name`, `url`, `type`, `sort`) VALUES
	('013335a4-ff1e-465d-b983-95b65f1260f3', '1', '工作流', '/', '1', '3'),
	('0cf26ffd-88e9-42ca-91fb-374359e12f82', 'a9b97767-54ff-4477-a81a-274d6e2b5ce9', '菜单管理', '/system/resources/toList.do', '1', '3'),
	('0ff729fc-a43c-4a5c-a2bf-07fbeefa2520', '13fd01f1-20d8-49fd-9630-6fb7f8539920', '删除', '/system/dict/delete', '2', NULL),
	('1', '', '菜单', '/', '1', NULL),
	('1115d196-fd3a-4ca1-99c8-5452bae30c8f', '0cf26ffd-88e9-42ca-91fb-374359e12f82', '增加', '/system/resources/add', '2', NULL),
	('1255d03e-0e75-467d-8f41-ecec751635b0', '013335a4-ff1e-465d-b983-95b65f1260f3', '流程实例', '/activiti/processDefinition/toList.do', '1', '2'),
	('13fd01f1-20d8-49fd-9630-6fb7f8539920', 'a9b97767-54ff-4477-a81a-274d6e2b5ce9', '字典管理', '/system/dict/toList.do', '1', '4'),
	('21e9a57d-b7a2-45b0-8359-cc21d636c0fa', '0cf26ffd-88e9-42ca-91fb-374359e12f82', '更改', '/system/resources/update', '2', NULL),
	('2b56b958-3b0d-46d4-8988-d7c5ae1d804b', 'a9b97767-54ff-4477-a81a-274d6e2b5ce9', '用户管理', '/system/user/toList.do', '1', '1'),
	('32680760-3ad2-4ac5-bd2f-fca4917d8f74', '2b56b958-3b0d-46d4-8988-d7c5ae1d804b', '更改', '/system/user/update', '2', NULL),
	('3f4c3cd9-8926-487b-a13f-3bfda9e3456a', '013335a4-ff1e-465d-b983-95b65f1260f3', '流程历史', '/activiti/history/toList.do', '1', '4'),
	('4c31e76d-b98f-4cd0-9b0e-ed0cfc1dedfd', '013335a4-ff1e-465d-b983-95b65f1260f3', '流程部署', '/activiti/deployment/toList.do', '1', '1'),
	('500aef96-1461-4af0-ac66-bf4406827558', '013335a4-ff1e-465d-b983-95b65f1260f3', '流程管理', '/activiti/bpm/toList.do', '1', '3'),
	('51745327-1978-48ab-aa19-6986a3f628d7', 'c56d6e95-5515-492b-866a-b8555e7b647c', '添加', '/system/role/add', '2', NULL),
	('63efc666-ee88-45f7-bdad-2b019c19eb1d', '0cf26ffd-88e9-42ca-91fb-374359e12f82', '列表', '/system/resources/list', '2', NULL),
	('652b3c26-5085-4739-94db-ebbbb1397acf', '2b56b958-3b0d-46d4-8988-d7c5ae1d804b', '添加', '/system/user/add', '2', NULL),
	('8d1d2815-d011-4da9-a66e-573a5f056f62', '13fd01f1-20d8-49fd-9630-6fb7f8539920', '添加', '/system/dict/add', '2', NULL),
	('8fec88df-50c5-4a5e-800e-621d203f7a55', 'c56d6e95-5515-492b-866a-b8555e7b647c', '删除', '/system/role/delete', '2', NULL),
	('93400178-2c2f-47de-9b30-5d126b33e197', '2b56b958-3b0d-46d4-8988-d7c5ae1d804b', '列表', '/system/user/list', '2', NULL),
	('9ee4dade-b3af-4664-82c8-4d712f231db4', '2b56b958-3b0d-46d4-8988-d7c5ae1d804b', '删除', '/system/user/delete', '2', NULL),
	('a9b97767-54ff-4477-a81a-274d6e2b5ce9', '1', '系统管理', '/', '1', '1'),
	('c01620cd-4845-4a4a-a72f-1524b3c54d24', '13fd01f1-20d8-49fd-9630-6fb7f8539920', '更改', '/system/dict/update', '2', NULL),
	('c56d6e95-5515-492b-866a-b8555e7b647c', 'a9b97767-54ff-4477-a81a-274d6e2b5ce9', '角色管理', '/system/role/toList.do', '1', '2'),
	('c65e7c94-a3c1-43b7-a8c7-94e1d693f0b5', 'c56d6e95-5515-492b-866a-b8555e7b647c', '更改', '/system/role/update', '2', NULL),
	('ea7a58c3-74d2-45c1-8b66-974cd82d1fbd', '13fd01f1-20d8-49fd-9630-6fb7f8539920', '列表', '/system/dict/list', '2', NULL),
	('ecb6527f-0548-40f7-b92e-6719ff3f9556', '0cf26ffd-88e9-42ca-91fb-374359e12f82', '删除', '/system/resources/delete', '2', NULL),
	('f0e5351e-7291-4d41-87c2-3ebfc5388d7c', 'c56d6e95-5515-492b-866a-b8555e7b647c', '列表', '/system/role/list', '2', NULL);
/*!40000 ALTER TABLE `sys_resources` ENABLE KEYS */;


-- 导出  表 spring-activiti.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  spring-activiti.sys_role 的数据：~3 rows (大约)
DELETE FROM `sys_role`;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`id`, `name`) VALUES
	('111', '项目经理'),
	('a0d308b4-7787-4822-a2e3-f59612a8c5b3', '22222'),
	('f9127759-1116-4159-adcf-98dbe1d77576', '软件工程师');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;


-- 导出  表 spring-activiti.sys_role_resources 结构
CREATE TABLE IF NOT EXISTS `sys_role_resources` (
  `id` varchar(50) NOT NULL,
  `role_id` varchar(50) DEFAULT NULL,
  `resources_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  spring-activiti.sys_role_resources 的数据：~55 rows (大约)
DELETE FROM `sys_role_resources`;
/*!40000 ALTER TABLE `sys_role_resources` DISABLE KEYS */;
INSERT INTO `sys_role_resources` (`id`, `role_id`, `resources_id`) VALUES
	('047787e2-fb94-481b-9aa8-b365eb1d5f6f', 'a0d308b4-7787-4822-a2e3-f59612a8c5b3', '2b56b958-3b0d-46d4-8988-d7c5ae1d804b'),
	('050f5034-d8da-40ab-836f-85a5831db7d6', '111', '0cf26ffd-88e9-42ca-91fb-374359e12f82'),
	('054e5d91-c244-4e13-a279-00183150c534', '111', '63efc666-ee88-45f7-bdad-2b019c19eb1d'),
	('13530f98-f09b-46ab-b30a-ffecf5b585ff', '111', 'a9b97767-54ff-4477-a81a-274d6e2b5ce9'),
	('1b2cefb0-5e1d-4dd8-9885-7ef1c4aebae4', '111', '1115d196-fd3a-4ca1-99c8-5452bae30c8f'),
	('1d6967f0-f14e-4c7a-af4b-301c49eb2e2f', '111', 'c01620cd-4845-4a4a-a72f-1524b3c54d24'),
	('236563f2-3385-4c7d-b608-353ff1811568', 'f9127759-1116-4159-adcf-98dbe1d77576', 'c65e7c94-a3c1-43b7-a8c7-94e1d693f0b5'),
	('244bc016-a930-49be-a046-280ee5083ae7', 'f9127759-1116-4159-adcf-98dbe1d77576', '63efc666-ee88-45f7-bdad-2b019c19eb1d'),
	('24d64f07-7fb9-4f42-9d03-9eeb1ff81c6f', '111', 'ea7a58c3-74d2-45c1-8b66-974cd82d1fbd'),
	('2acb6419-c76e-419f-beb7-3f4e4c7f8811', '111', '4c31e76d-b98f-4cd0-9b0e-ed0cfc1dedfd'),
	('2ad3ff2c-04d7-4671-a8be-433652a9cab9', '111', '21e9a57d-b7a2-45b0-8359-cc21d636c0fa'),
	('31648bd0-737d-49a3-9660-2e036d3ef76d', 'f9127759-1116-4159-adcf-98dbe1d77576', 'ea7a58c3-74d2-45c1-8b66-974cd82d1fbd'),
	('37632aa5-8104-4031-81da-b3ca142b81e9', 'f9127759-1116-4159-adcf-98dbe1d77576', 'c01620cd-4845-4a4a-a72f-1524b3c54d24'),
	('3f93ae14-f591-4e48-aa2e-d90ac61f5a6d', '111', '1'),
	('4376daf3-cce5-4be7-9193-dfb8359b3018', 'f9127759-1116-4159-adcf-98dbe1d77576', '8d1d2815-d011-4da9-a66e-573a5f056f62'),
	('441656ad-6d69-4a75-b34b-6187255528ea', 'f9127759-1116-4159-adcf-98dbe1d77576', '32680760-3ad2-4ac5-bd2f-fca4917d8f74'),
	('48e89626-6c84-442d-a134-1ee71184db47', '111', '93400178-2c2f-47de-9b30-5d126b33e197'),
	('4e4ba357-1279-488e-befe-57873c27ad9f', '111', '9ee4dade-b3af-4664-82c8-4d712f231db4'),
	('4e5580b6-e1ea-470f-92ff-f21affd2ebf1', 'f9127759-1116-4159-adcf-98dbe1d77576', 'ecb6527f-0548-40f7-b92e-6719ff3f9556'),
	('4feea0e4-a64e-41ba-9fd6-bacafb8e8a48', '111', '3f4c3cd9-8926-487b-a13f-3bfda9e3456a'),
	('53df9058-cf9a-4bcb-96fa-0cfff53ae67c', '111', '1255d03e-0e75-467d-8f41-ecec751635b0'),
	('562814f8-9273-4bca-a5d3-79dfaecf5d01', 'f9127759-1116-4159-adcf-98dbe1d77576', '0cf26ffd-88e9-42ca-91fb-374359e12f82'),
	('588c5174-09b4-4034-887d-d63c6d18eb3e', 'f9127759-1116-4159-adcf-98dbe1d77576', 'c56d6e95-5515-492b-866a-b8555e7b647c'),
	('58948d0a-148d-404b-8ad7-94d8ac678dd0', '111', 'ecb6527f-0548-40f7-b92e-6719ff3f9556'),
	('5ad6b075-64e8-44ca-8a6b-2371e85d7401', 'f9127759-1116-4159-adcf-98dbe1d77576', '1'),
	('5effc16c-1f0f-47e9-84ae-b0b5e8d93bc0', '111', '013335a4-ff1e-465d-b983-95b65f1260f3'),
	('616255a8-fb99-4163-8772-05a072ade4fb', 'f9127759-1116-4159-adcf-98dbe1d77576', '013335a4-ff1e-465d-b983-95b65f1260f3'),
	('63210f31-23db-4c20-8dd1-5ea3d425e261', 'f9127759-1116-4159-adcf-98dbe1d77576', 'f0e5351e-7291-4d41-87c2-3ebfc5388d7c'),
	('63676c9d-ea84-4a4c-b333-0219c4e46624', '111', '8fec88df-50c5-4a5e-800e-621d203f7a55'),
	('645e644d-a5ab-4f4f-8afd-759db09412e5', 'f9127759-1116-4159-adcf-98dbe1d77576', 'a9b97767-54ff-4477-a81a-274d6e2b5ce9'),
	('68954075-5627-4a94-932b-79bffb783f38', '111', '13fd01f1-20d8-49fd-9630-6fb7f8539920'),
	('72b6adcf-6844-4036-a593-633d283f5181', '111', '652b3c26-5085-4739-94db-ebbbb1397acf'),
	('732c7a3c-56f6-4ae2-8927-b9c16f4b3fdb', 'f9127759-1116-4159-adcf-98dbe1d77576', '9ee4dade-b3af-4664-82c8-4d712f231db4'),
	('90d61971-d07c-4141-9332-089fd8600f5e', 'f9127759-1116-4159-adcf-98dbe1d77576', '21e9a57d-b7a2-45b0-8359-cc21d636c0fa'),
	('920041cb-6749-4c8e-8304-fca3fc41490f', 'f9127759-1116-4159-adcf-98dbe1d77576', '652b3c26-5085-4739-94db-ebbbb1397acf'),
	('959ec811-8cb1-4683-bf90-07ad64799a88', 'f9127759-1116-4159-adcf-98dbe1d77576', '1255d03e-0e75-467d-8f41-ecec751635b0'),
	('9ace7679-dd2b-48c3-aa1b-042776ecc478', 'f9127759-1116-4159-adcf-98dbe1d77576', '2b56b958-3b0d-46d4-8988-d7c5ae1d804b'),
	('a326a2b3-0b9a-42de-b22a-98dbb7597992', 'f9127759-1116-4159-adcf-98dbe1d77576', '3f4c3cd9-8926-487b-a13f-3bfda9e3456a'),
	('a9696792-d421-4c48-95c1-c3a5318a9ecc', 'f9127759-1116-4159-adcf-98dbe1d77576', '4c31e76d-b98f-4cd0-9b0e-ed0cfc1dedfd'),
	('abb16781-4a0c-4db5-a7e7-ba44dddff766', '111', '500aef96-1461-4af0-ac66-bf4406827558'),
	('ad581e95-d1db-406f-a50c-55e6e274d1c7', '111', 'f0e5351e-7291-4d41-87c2-3ebfc5388d7c'),
	('b9ef4d13-1632-46b3-bb1e-96600a828c74', 'f9127759-1116-4159-adcf-98dbe1d77576', '8fec88df-50c5-4a5e-800e-621d203f7a55'),
	('bbd169ff-60f5-4cf5-a456-334a0a1dbfee', 'f9127759-1116-4159-adcf-98dbe1d77576', '1115d196-fd3a-4ca1-99c8-5452bae30c8f'),
	('c16235d4-6435-4bc7-a970-9bdb86145b80', '111', '32680760-3ad2-4ac5-bd2f-fca4917d8f74'),
	('c2dbc7d3-804e-4137-9ff8-8dee105c1af1', '111', 'c65e7c94-a3c1-43b7-a8c7-94e1d693f0b5'),
	('c36fa1cb-3af0-4b65-875f-1c4bb8e88c34', '111', '2b56b958-3b0d-46d4-8988-d7c5ae1d804b'),
	('c8594166-0252-42be-bf74-e684a5ac2c33', '111', 'c56d6e95-5515-492b-866a-b8555e7b647c'),
	('cd118549-8aac-4699-b88d-6fd5d534711c', 'f9127759-1116-4159-adcf-98dbe1d77576', '93400178-2c2f-47de-9b30-5d126b33e197'),
	('cd12586c-f31c-449f-938a-15da76d29d0a', 'f9127759-1116-4159-adcf-98dbe1d77576', '500aef96-1461-4af0-ac66-bf4406827558'),
	('d0a34451-03ff-439c-858f-f40b545597e3', 'f9127759-1116-4159-adcf-98dbe1d77576', '51745327-1978-48ab-aa19-6986a3f628d7'),
	('dfcbd66d-7a68-4906-ad47-25e86c5181cd', '111', '0ff729fc-a43c-4a5c-a2bf-07fbeefa2520'),
	('dfd387be-5463-4a01-82fb-c62d5313aee8', '111', '51745327-1978-48ab-aa19-6986a3f628d7'),
	('e4c32966-232c-40f4-9f1d-a745cabb95f4', 'f9127759-1116-4159-adcf-98dbe1d77576', '0ff729fc-a43c-4a5c-a2bf-07fbeefa2520'),
	('e66edca7-4caa-480e-986e-ddd52eed1833', '111', '8d1d2815-d011-4da9-a66e-573a5f056f62'),
	('f41e5a1c-274d-4d2b-b5b3-7e1589e83d23', 'f9127759-1116-4159-adcf-98dbe1d77576', '13fd01f1-20d8-49fd-9630-6fb7f8539920');
/*!40000 ALTER TABLE `sys_role_resources` ENABLE KEYS */;


-- 导出  表 spring-activiti.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  spring-activiti.sys_user 的数据：~2 rows (大约)
DELETE FROM `sys_user`;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `username`, `password`) VALUES
	('62619962-c88c-4530-b424-ced43b30e1ea', 'wangsong', '532da1c5da9fb86bf61b2a63487f300c'),
	('67697cb6-2f31-42de-9fc3-8ba9fa71e49d', '22222', 'e3ceb5881a0a1fdaad01296d7554868d');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;


-- 导出  表 spring-activiti.sys_user_role 结构
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `role_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  spring-activiti.sys_user_role 的数据：~2 rows (大约)
DELETE FROM `sys_user_role`;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES
	('5b6e768a-088a-472a-a005-7122de1f92ff', '62619962-c88c-4530-b424-ced43b30e1ea', 'f9127759-1116-4159-adcf-98dbe1d77576'),
	('a158c44e-e987-4b85-b815-aa1ad643833b', '67697cb6-2f31-42de-9fc3-8ba9fa71e49d', '111');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
