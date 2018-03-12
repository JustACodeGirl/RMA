/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:49:59
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_bill_act_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_bill_act_item`;
CREATE TABLE `t_bill_act_item` (
  `item_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `act_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `dead_line` datetime NOT NULL,
  `warning_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `act_def_id` int(11) NOT NULL,
  `act_def_name` varchar(255) DEFAULT NULL,
  `pre_act_id` int(11) NOT NULL,
  `pre_user_id` int(11) NOT NULL,
  `pre_user_name` varchar(100) NOT NULL,
  `pre_role_id` int(11) NOT NULL,
  `pre_role_name` varchar(100) NOT NULL,
  `pre_act_def_id` int(11) NOT NULL,
  `pre_act_def_name` varchar(255) DEFAULT NULL,
  `act_used_time` datetime NOT NULL,
  `act_remain_time` datetime NOT NULL,
  `operation` varchar(200) NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `item_type_name` varchar(200) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bill_act_item
-- ----------------------------
