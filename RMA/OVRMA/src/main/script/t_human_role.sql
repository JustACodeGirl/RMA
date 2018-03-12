/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:50:38
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_human_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_human_role`;
CREATE TABLE `t_human_role` (
  `human_role_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`human_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_human_role
-- ----------------------------
INSERT INTO `t_human_role` VALUES ('1', '0', '1');
