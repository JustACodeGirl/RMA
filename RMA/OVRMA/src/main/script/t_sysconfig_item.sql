/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:51:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_sysconfig_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_sysconfig_item`;
CREATE TABLE `t_sysconfig_item` (
  `config_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_item_name` varchar(255) DEFAULT NULL,
  `data_type_id` int(11) DEFAULT NULL,
  `item_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_sysconfig_item
-- ----------------------------
