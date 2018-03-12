/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:50:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_human_tasklist`
-- ----------------------------
DROP TABLE IF EXISTS `t_human_tasklist`;
CREATE TABLE `t_human_tasklist` (
  `tasklist_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `tasklist_name` varchar(255) NOT NULL,
  `query_sql` varchar(1000) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`tasklist_id`,`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_human_tasklist
-- ----------------------------
INSERT INTO `t_human_tasklist` VALUES ('1', '0', 'todolist', '1=1', '待办列表', null, '1', '0000-00-00 00:00:00', null);
INSERT INTO `t_human_tasklist` VALUES ('2', '0', 'donelist', '1=1', '经办列表', null, '2', '0000-00-00 00:00:00', null);
INSERT INTO `t_human_tasklist` VALUES ('3', '0', 'rollback', '1=1', '回退列表', null, '3', '0000-00-00 00:00:00', null);
