/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:50:29
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_human`
-- ----------------------------
DROP TABLE IF EXISTS `t_human`;
CREATE TABLE `t_human` (
  `human_id` int(11) NOT NULL,
  `human_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_human
-- ----------------------------
INSERT INTO `t_human` VALUES ('0', 'lyman', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13645859654', 'lyman的帐号', null, null, '0');
