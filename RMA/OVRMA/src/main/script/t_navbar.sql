/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:50:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_navbar`
-- ----------------------------
DROP TABLE IF EXISTS `t_navbar`;
CREATE TABLE `t_navbar` (
  `navbar_id` int(11) NOT NULL,
  `nav_bar_name` varchar(255) NOT NULL,
  `nav_bar_url` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`navbar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_navbar
-- ----------------------------
