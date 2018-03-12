/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:50:04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_dic_act_def`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_act_def`;
CREATE TABLE `t_dic_act_def` (
  `act_def_id` int(11) NOT NULL,
  `act_def_name` varchar(255) NOT NULL,
  PRIMARY KEY (`act_def_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_act_def
-- ----------------------------
INSERT INTO `t_dic_act_def` VALUES ('1', '客服');
