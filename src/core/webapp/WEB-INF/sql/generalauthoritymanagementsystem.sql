/*
Navicat MySQL Data Transfer

Source Server         : localhost:3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : generalauthoritymanagementsystem

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-09-01 22:38:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_system_authority_info
-- ----------------------------
DROP TABLE IF EXISTS `t_system_authority_info`;
CREATE TABLE `t_system_authority_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `name` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `cnname` varchar(100) DEFAULT NULL COMMENT '权限中文标识',
  `parent_id` int(11) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `order_index` int(4) DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_authority_info
-- ----------------------------
INSERT INTO `t_system_authority_info` VALUES ('1', 'ADMIN', '超级权限', '0', '2015-08-22 19:19:46', '2015-08-27 20:50:23', '1');
INSERT INTO `t_system_authority_info` VALUES ('2', 'ADMIN_ADMIN', '后台权限', '1', '2015-08-22 19:19:44', '2015-09-01 21:28:50', '1');
INSERT INTO `t_system_authority_info` VALUES ('3', 'ADMIN_HOME', '前台权限', '1', '2015-08-22 20:15:02', '2015-09-01 21:29:01', '1');
INSERT INTO `t_system_authority_info` VALUES ('4', 'ADMIN_USER', '用户管理权限', '2', '2015-09-01 21:27:02', '2015-09-01 21:27:02', '1');
INSERT INTO `t_system_authority_info` VALUES ('5', 'ADMIN_ROLE', '角色管理权限', '2', '2015-09-01 21:27:32', '2015-09-01 21:27:32', '1');
INSERT INTO `t_system_authority_info` VALUES ('6', 'ADMIN_AUTHORITY', '权限分配权限', '2', '2015-09-01 21:27:59', '2015-09-01 21:28:15', '1');
INSERT INTO `t_system_authority_info` VALUES ('7', 'ADMIN_RESOURCE', '资源管理权限', '2', '2015-09-01 21:29:24', '2015-09-01 21:29:55', '1');
INSERT INTO `t_system_authority_info` VALUES ('8', 'ADMIN_PARAMETER', '参数管理权限', '2', '2015-09-01 21:29:42', '2015-09-01 21:29:42', '1');

-- ----------------------------
-- Table structure for t_system_authority_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_system_authority_resource`;
CREATE TABLE `t_system_authority_resource` (
  `authority_id` int(11) NOT NULL COMMENT '权限ID',
  `resource_id` int(11) NOT NULL COMMENT '资源ID',
  PRIMARY KEY (`resource_id`,`authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_authority_resource
-- ----------------------------
INSERT INTO `t_system_authority_resource` VALUES ('1', '1');
INSERT INTO `t_system_authority_resource` VALUES ('2', '1');
INSERT INTO `t_system_authority_resource` VALUES ('1', '2');
INSERT INTO `t_system_authority_resource` VALUES ('2', '2');
INSERT INTO `t_system_authority_resource` VALUES ('1', '3');
INSERT INTO `t_system_authority_resource` VALUES ('2', '3');
INSERT INTO `t_system_authority_resource` VALUES ('4', '3');
INSERT INTO `t_system_authority_resource` VALUES ('1', '4');
INSERT INTO `t_system_authority_resource` VALUES ('2', '4');
INSERT INTO `t_system_authority_resource` VALUES ('5', '4');
INSERT INTO `t_system_authority_resource` VALUES ('1', '5');
INSERT INTO `t_system_authority_resource` VALUES ('2', '5');
INSERT INTO `t_system_authority_resource` VALUES ('6', '5');
INSERT INTO `t_system_authority_resource` VALUES ('1', '6');
INSERT INTO `t_system_authority_resource` VALUES ('2', '6');
INSERT INTO `t_system_authority_resource` VALUES ('7', '6');
INSERT INTO `t_system_authority_resource` VALUES ('1', '7');
INSERT INTO `t_system_authority_resource` VALUES ('2', '7');
INSERT INTO `t_system_authority_resource` VALUES ('8', '7');

-- ----------------------------
-- Table structure for t_system_parameter
-- ----------------------------
DROP TABLE IF EXISTS `t_system_parameter`;
CREATE TABLE `t_system_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT NULL,
  `parValue` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_parameter
-- ----------------------------
INSERT INTO `t_system_parameter` VALUES ('1', 'siteTitle', '网站标题', '通用权限管理系统');
INSERT INTO `t_system_parameter` VALUES ('2', 'siteKeys', '网站关键字', '权限管理，系统');
INSERT INTO `t_system_parameter` VALUES ('3', 'siteDescription', '网站描述', '通用权限管理系统');

-- ----------------------------
-- Table structure for t_system_resource_info
-- ----------------------------
DROP TABLE IF EXISTS `t_system_resource_info`;
CREATE TABLE `t_system_resource_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `name` varchar(50) NOT NULL COMMENT '资源标识',
  `path` varchar(200) NOT NULL COMMENT '资源URL',
  `cnname` varchar(50) DEFAULT NULL COMMENT '资源中文标识',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `order_index` int(4) DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `path` (`path`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_resource_info
-- ----------------------------
INSERT INTO `t_system_resource_info` VALUES ('1', 'ADMIN', '/index.htm', '后台首页', '2015-08-23 23:41:34', '2015-08-30 11:47:31', '1');
INSERT INTO `t_system_resource_info` VALUES ('2', 'ADMIN_START', '/start.htm', '后台系统页', '2015-08-30 11:47:29', '2015-08-30 11:47:50', '1');
INSERT INTO `t_system_resource_info` VALUES ('3', 'ADMIN_USER', '/admin/user/**', '用户管理总资源', '2015-09-01 21:31:47', '2015-09-01 21:31:57', '1');
INSERT INTO `t_system_resource_info` VALUES ('4', 'ADMIN_ROLE', '/admin/role/**', '角色管理总资源', '2015-09-01 21:32:48', '2015-09-01 21:32:48', '1');
INSERT INTO `t_system_resource_info` VALUES ('5', 'ADMIN_AUTHORITY', '/admin/authority/**', '权限分配总资源', '2015-09-01 21:33:24', '2015-09-01 21:33:24', '1');
INSERT INTO `t_system_resource_info` VALUES ('6', 'ADMIN_RESOURCE', '/admin/resource/**', '资源管理总资源', '2015-09-01 21:33:55', '2015-09-01 21:33:55', '1');
INSERT INTO `t_system_resource_info` VALUES ('7', 'ADMIN_PARAMETER', '/admin/parameter/**', '参数管理总资源', '2015-09-01 21:34:29', '2015-09-01 21:34:29', '1');

-- ----------------------------
-- Table structure for t_system_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role_authority`;
CREATE TABLE `t_system_role_authority` (
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `authority_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`authority_id`),
  KEY `index_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_role_authority
-- ----------------------------
INSERT INTO `t_system_role_authority` VALUES ('1', '1');
INSERT INTO `t_system_role_authority` VALUES ('1', '2');
INSERT INTO `t_system_role_authority` VALUES ('1', '3');
INSERT INTO `t_system_role_authority` VALUES ('1', '4');
INSERT INTO `t_system_role_authority` VALUES ('1', '5');
INSERT INTO `t_system_role_authority` VALUES ('1', '6');
INSERT INTO `t_system_role_authority` VALUES ('1', '7');
INSERT INTO `t_system_role_authority` VALUES ('1', '8');
INSERT INTO `t_system_role_authority` VALUES ('811', '2');
INSERT INTO `t_system_role_authority` VALUES ('811', '4');
INSERT INTO `t_system_role_authority` VALUES ('811', '5');
INSERT INTO `t_system_role_authority` VALUES ('811', '6');
INSERT INTO `t_system_role_authority` VALUES ('811', '7');
INSERT INTO `t_system_role_authority` VALUES ('811', '8');
INSERT INTO `t_system_role_authority` VALUES ('812', '3');

-- ----------------------------
-- Table structure for t_system_role_info
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role_info`;
CREATE TABLE `t_system_role_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `cnname` varchar(50) DEFAULT NULL COMMENT '角色中文名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父角色ID',
  `is_use` tinyint(4) DEFAULT '1' COMMENT '1在用，0停用',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `order_index` int(4) DEFAULT '1' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=814 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_role_info
-- ----------------------------
INSERT INTO `t_system_role_info` VALUES ('1', 'ADMIN', '超级角色', '0', '1', '2010-11-16 17:23:48', '2015-08-27 20:56:55', '1');
INSERT INTO `t_system_role_info` VALUES ('811', 'MANAGE', '管理员', '1', '1', '2015-08-27 22:11:57', '2015-09-01 21:24:40', '1');
INSERT INTO `t_system_role_info` VALUES ('812', 'USER', '普通用户', '1', '1', '2015-08-29 17:43:30', '2015-09-01 21:38:10', '1');

-- ----------------------------
-- Table structure for t_system_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user_info`;
CREATE TABLE `t_system_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名称',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `enabled` tinyint(4) DEFAULT '1' COMMENT '可用（1表示可用，0表示停用）',
  `cnname` varchar(50) DEFAULT NULL COMMENT '中文名称',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(50) DEFAULT NULL COMMENT '电话',
  `default_role_id` int(11) DEFAULT NULL COMMENT '默认使用的角色ID',
  `department_code` varchar(3) DEFAULT NULL COMMENT '组织代码（暂时保留）',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `last_login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_user_info
-- ----------------------------
INSERT INTO `t_system_user_info` VALUES ('1', 'admin', 'admin', '1', '系统管理员', 'admin@163.com', '123', '1', '001', '2010-11-16 17:23:48', '2015-09-01 21:38:38', '2015-01-25 08:39:07');
INSERT INTO `t_system_user_info` VALUES ('2', 'zhangsan', '123456', '1', '张三', '123@163.com', '123', '1', '001', '2015-08-27 21:22:53', '2015-09-01 21:39:47', '2015-09-01 21:39:46');
INSERT INTO `t_system_user_info` VALUES ('3', 'lisi', '123456', '1', '李四', '123@163.com', '123', '1', '001', '2015-09-01 21:39:13', '2015-09-01 21:39:49', '2015-09-01 21:39:48');

-- ----------------------------
-- Table structure for t_system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user_role`;
CREATE TABLE `t_system_user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `roleId` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_user_role
-- ----------------------------
INSERT INTO `t_system_user_role` VALUES ('1', '1');
INSERT INTO `t_system_user_role` VALUES ('1', '811');
INSERT INTO `t_system_user_role` VALUES ('2', '811');
INSERT INTO `t_system_user_role` VALUES ('1', '812');
INSERT INTO `t_system_user_role` VALUES ('3', '812');
INSERT INTO `t_system_user_role` VALUES ('4', '812');

-- ----------------------------
-- Procedure structure for func_findAuthorityChildId
-- ----------------------------
DROP PROCEDURE IF EXISTS `func_findAuthorityChildId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `func_findAuthorityChildId`(in pid int)
begin
declare lev int;
set lev=1;
drop table if exists t_temp;
    CREATE TABLE t_temp(id int,level_row INT);
		/*插入第一层子节点*/
    INSERT t_temp SELECT id,1 FROM t_system_authority_info WHERE parent_id=pid;
while  row_count()>0
do
     set lev=lev+1;
     INSERT t_temp SELECT a.id,lev from t_system_authority_info a join t_temp t on a.parent_id=t.id AND level_row=lev-1;
end while ;
    /*插入当前查询节点*/
		INSERT t_temp SELECT id,0 FROM t_system_authority_info WHERE id= pid;
    SELECT id FROM t_temp;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for func_findChildList
-- ----------------------------
DROP PROCEDURE IF EXISTS `func_findChildList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `func_findChildList`(in pid int)
begin
declare lev int;
set lev=1;
drop table if exists temp_child_list;
    CREATE TABLE temp_child_list(id int,`name` varchar(255),cnname varchar(255),parent_id int,level_row INT);
		/*插入第一层子节点*/
    INSERT temp_child_list SELECT id,`name`,cnname,parent_id,1 FROM `t_system_authority_info` WHERE parent_id=pid;
while  row_count()>0
do
     set lev=lev+1;
     INSERT temp_child_list SELECT t.id,t.`name`,t.cnname,t.`parent_id`,lev from t_system_authority_info t join temp_child_list a on t.parent_id=a.id AND level_row=lev-1;
end while ;
    /*插入当前查询节点*/
		INSERT temp_child_list SELECT id,`name`,cnname,parent_id,0 FROM `t_system_authority_info` WHERE id= pid;
    SELECT * FROM temp_child_list;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for func_findRoleChildId
-- ----------------------------
DROP PROCEDURE IF EXISTS `func_findRoleChildId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `func_findRoleChildId`(in pid int)
begin
declare lev int;
set lev=1;
drop table if exists t_temp;
    CREATE TABLE t_temp(id int,level_row INT);
		/*插入第一层子节点*/
    INSERT t_temp SELECT id,1 FROM t_system_role_info WHERE parent_id=pid;
while  row_count()>0
do
     set lev=lev+1;
     INSERT t_temp SELECT r.id,lev from t_system_role_info r join t_temp t on r.parent_id=t.id AND level_row=lev-1;
end while ;
    /*插入当前查询节点*/
		INSERT t_temp SELECT id,0 FROM t_system_role_info WHERE id= pid;
    SELECT id FROM t_temp;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insertAuthority`;
DELIMITER ;;
CREATE TRIGGER `insertAuthority` BEFORE INSERT ON `t_system_authority_info` FOR EACH ROW BEGIN
	SET NEW.insert_date = current_timestamp;
	SET NEW.update_date = current_timestamp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `updateAuthority`;
DELIMITER ;;
CREATE TRIGGER `updateAuthority` BEFORE UPDATE ON `t_system_authority_info` FOR EACH ROW BEGIN
	SET NEW.update_date = current_timestamp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `deleteAuthority`;
DELIMITER ;;
CREATE TRIGGER `deleteAuthority` AFTER DELETE ON `t_system_authority_info` FOR EACH ROW BEGIN
	DELETE FROM t_system_role_authority WHERE authority_id=old.id;
	DELETE FROM t_system_authority_resource WHERE authority_id=old.id;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insertResource`;
DELIMITER ;;
CREATE TRIGGER `insertResource` BEFORE INSERT ON `t_system_resource_info` FOR EACH ROW BEGIN
	SET NEW.insert_date = current_timestamp;
	SET NEW.update_date = current_timestamp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `updateResource`;
DELIMITER ;;
CREATE TRIGGER `updateResource` BEFORE UPDATE ON `t_system_resource_info` FOR EACH ROW BEGIN
	SET NEW.update_date = current_timestamp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `deleteResource`;
DELIMITER ;;
CREATE TRIGGER `deleteResource` AFTER DELETE ON `t_system_resource_info` FOR EACH ROW BEGIN
	DELETE FROM t_system_authority_resource WHERE resource_id=old.id;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insertRole`;
DELIMITER ;;
CREATE TRIGGER `insertRole` BEFORE INSERT ON `t_system_role_info` FOR EACH ROW BEGIN
	SET NEW.insert_date = current_timestamp;
	SET NEW.update_date = current_timestamp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `updateRole`;
DELIMITER ;;
CREATE TRIGGER `updateRole` BEFORE UPDATE ON `t_system_role_info` FOR EACH ROW BEGIN
	SET NEW.update_date = current_timestamp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `deleteRole`;
DELIMITER ;;
CREATE TRIGGER `deleteRole` AFTER DELETE ON `t_system_role_info` FOR EACH ROW BEGIN
	DELETE FROM t_system_user_role WHERE role_id=old.id;
	DELETE FROM t_system_role_authority WHERE role_id=old.id;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `insertUser`;
DELIMITER ;;
CREATE TRIGGER `insertUser` BEFORE INSERT ON `t_system_user_info` FOR EACH ROW BEGIN
	SET NEW.insert_date = current_timestamp;
	SET NEW.update_date = current_timestamp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `updateUser`;
DELIMITER ;;
CREATE TRIGGER `updateUser` BEFORE UPDATE ON `t_system_user_info` FOR EACH ROW BEGIN
	SET NEW.update_date = current_timestamp;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `deleteUser`;
DELIMITER ;;
CREATE TRIGGER `deleteUser` AFTER DELETE ON `t_system_user_info` FOR EACH ROW BEGIN
	DELETE FROM t_system_user_role WHERE user_id=old.id;
END
;;
DELIMITER ;
