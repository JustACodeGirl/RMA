/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:50:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_dic_damage_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_damage_type`;
CREATE TABLE `t_dic_damage_type` (
  `damage_type_id` int(11) NOT NULL,
  `damage_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`damage_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_damage_type
-- ----------------------------
INSERT INTO `t_dic_damage_type` VALUES ('1', '外观损坏');
