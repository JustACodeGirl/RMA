/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:50:33
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_human_navbar`
-- ----------------------------
DROP TABLE IF EXISTS `t_human_navbar`;
CREATE TABLE `t_human_navbar` (
  `navbar_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `navbar_name` varchar(255) NOT NULL,
  `navbar_url` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`navbar_id`,`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_human_navbar
-- ----------------------------
INSERT INTO `t_human_navbar` VALUES ('0', '0', 'query', '', '统计查询', null, '2', '0000-00-00 00:00:00', null);
INSERT INTO `t_human_navbar` VALUES ('1', '0', 'accept', '', '受理平台', null, '1', '0000-00-00 00:00:00', null);
INSERT INTO `t_human_navbar` VALUES ('3', '0', 'settting', '', '系统设置', null, '3', '0000-00-00 00:00:00', null);
