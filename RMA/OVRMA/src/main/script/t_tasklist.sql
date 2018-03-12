/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:51:06
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_tasklist`
-- ----------------------------
DROP TABLE IF EXISTS `t_tasklist`;
CREATE TABLE `t_tasklist` (
  `tasklist_id` int(11) NOT NULL,
  `tasklist_name` varchar(255) NOT NULL,
  `query_sql` varchar(1000) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`tasklist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tasklist
-- ----------------------------
INSERT INTO `t_tasklist` VALUES ('1', 'todolist', '1=1', '待办案件', null, '1', '0000-00-00 00:00:00', null);
