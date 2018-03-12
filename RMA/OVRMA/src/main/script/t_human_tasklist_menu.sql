/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:50:46
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_human_tasklist_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_human_tasklist_menu`;
CREATE TABLE `t_human_tasklist_menu` (
  `menu_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `tasklist_id` int(11) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`menu_id`,`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_human_tasklist_menu
-- ----------------------------
INSERT INTO `t_human_tasklist_menu` VALUES ('1', '0', 'transit', '1', '批转', null, '1', '0000-00-00 00:00:00', null);
INSERT INTO `t_human_tasklist_menu` VALUES ('2', '0', 'accept', '1', '受理', null, '2', '0000-00-00 00:00:00', null);
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '0', 'rollback', '1', '回退', null, '3', '0000-00-00 00:00:00', null);
