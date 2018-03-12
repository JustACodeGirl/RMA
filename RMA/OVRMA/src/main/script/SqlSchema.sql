/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma_dev

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-03-08 17:09:36
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_admin_token`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_token`;
CREATE TABLE `t_admin_token` (
  `at_admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `at_admin_token` varchar(255) NOT NULL,
  `at_expire_time` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`at_admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin_token
-- ----------------------------
INSERT INTO `t_admin_token` VALUES ('1', '222', '1', null, null);
INSERT INTO `t_admin_token` VALUES ('2', '222', '1', null, null);
INSERT INTO `t_admin_token` VALUES ('3', '222', '1', '2016-03-02 22:21:11', null);
INSERT INTO `t_admin_token` VALUES ('4', '222', '1', '2016-03-02 22:22:13', '2016-03-02 22:22:13');
INSERT INTO `t_admin_token` VALUES ('5', 'de245f66b37eaf7d2c2f3a210a84bc3e', '2016', '2016-03-07 16:43:05', '2016-03-07 16:43:05');
INSERT INTO `t_admin_token` VALUES ('6', '71758b688232fc57f1ce0d4b7bd911b7', '2016', '2016-03-08 17:05:58', '2016-03-08 17:05:58');

-- ----------------------------
-- Table structure for `t_bill`
-- ----------------------------
DROP TABLE IF EXISTS `t_bill`;
CREATE TABLE `t_bill` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_type_id` int(11) NOT NULL,
  `apply_type_name` varchar(100) DEFAULT NULL,
  `client_name` varchar(100) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `buy_time` date NOT NULL,
  `sku` varchar(100) NOT NULL,
  `goods_type_id` int(11) NOT NULL,
  `goods_type_name` varchar(100) DEFAULT NULL,
  `fault_description` varchar(255) DEFAULT NULL,
  `damage_type_id` int(11) NOT NULL,
  `damage_type_name` varchar(100) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archive_time` datetime DEFAULT NULL,
  `accept_time` datetime DEFAULT NULL,
  `accept_human_id` int(11) DEFAULT NULL,
  `accept_human_name` varchar(100) DEFAULT NULL,
  `check_human_id` int(11) DEFAULT NULL,
  `check_human_name` varchar(100) DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `check_result_id` int(11) DEFAULT NULL,
  `check_result_name` varchar(100) DEFAULT NULL,
  `check_opinion` varchar(1500) DEFAULT NULL,
  `cs_approve_human_id` int(11) DEFAULT NULL,
  `cs_approve_human_name` varchar(100) DEFAULT NULL,
  `cs_approve_opinion` varchar(1500) DEFAULT NULL,
  `cs_approve_time` datetime DEFAULT NULL,
  `cs_approve_result_id` int(11) DEFAULT NULL,
  `cs_approve_result_name` varchar(100) DEFAULT NULL,
  `fault_reason` varchar(255) DEFAULT NULL,
  `repair_human_id` int(11) DEFAULT NULL,
  `repair_human_name` varchar(100) DEFAULT NULL,
  `repair_time` datetime DEFAULT NULL,
  `receive_human_id` int(11) DEFAULT NULL,
  `receive_human_name` varchar(100) DEFAULT NULL,
  `receive_time` datetime DEFAULT NULL,
  `receive_courier_no` varchar(100) DEFAULT NULL,
  `receive_courier_company_id` int(11) DEFAULT NULL,
  `receive_courier_company_name` varchar(100) DEFAULT NULL,
  `send_human_id` int(11) DEFAULT NULL,
  `send_human_name` varchar(100) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `send_courier_no` varchar(100) DEFAULT NULL,
  `send_courier_company_id` int(11) DEFAULT NULL,
  `send_courier_company_name` varchar(100) DEFAULT NULL,
  `repair_mode_id` int(11) DEFAULT NULL,
  `repair_mode_name` varchar(100) DEFAULT NULL,
  `act_property_id` int(11) DEFAULT NULL,
  `act_property_name` varchar(100) DEFAULT NULL,
  `is_charge` int(11) DEFAULT NULL,
  `repair_cost` float(10,2) DEFAULT NULL,
  `exchange_sku` varchar(100) DEFAULT NULL,
  `exchange_goods_type_id` int(11) DEFAULT NULL,
  `exchange_goods_type_name` varchar(100) DEFAULT NULL,
  `as_approve_human_id` int(11) DEFAULT NULL,
  `as_approve_human_name` varchar(100) DEFAULT NULL,
  `as_approve_time` datetime DEFAULT NULL,
  `as_approve_opinion` varchar(1500) DEFAULT NULL,
  `as_approve_result_id` int(11) DEFAULT NULL,
  `as_approve_result_name` varchar(100) DEFAULT NULL,
  `card_no` varchar(100) DEFAULT NULL,
  `card_bank` varchar(100) DEFAULT NULL,
  `goods_price` float(10,2) DEFAULT NULL,
  `postage` float DEFAULT NULL,
  `total_cost` float(10,2) DEFAULT NULL,
  `accounting_human_id` int(11) DEFAULT NULL,
  `accounting_human_name` varchar(100) DEFAULT NULL,
  `accounting_apply_time` datetime DEFAULT NULL,
  `fa_approve_human_id` int(11) DEFAULT NULL,
  `fa_approve_human_name` varchar(100) DEFAULT NULL,
  `fa_approve_human_opinion` varchar(100) DEFAULT NULL,
  `fa_approve_time` datetime DEFAULT NULL,
  `fa_approve_result_id` int(11) DEFAULT NULL,
  `fa_approve_result_name` varchar(100) DEFAULT NULL,
  `cashier_human_id` int(11) DEFAULT NULL,
  `cashier_human_name` varchar(100) DEFAULT NULL,
  `cashier_pay_time` datetime DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bill
-- ----------------------------
INSERT INTO `t_bill` VALUES ('21', '1', '退货', '??????', 'lyman.meng', '12312132132', 'sadasd', '2016-03-08', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 09:00:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('22', '1', '退货', '??????', 'lyman.meng', '12312132132', 'sadasd', '2016-03-08', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 09:00:05', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('23', '1', '退货', '??????', 'lyman.meng', '12312132132', 'sadasd', '2016-03-08', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 09:00:08', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('29', '1', '退货', '??????', 'lyman.meng', '12312132132', 'sadasd', '2016-03-08', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 09:00:10', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('30', '1', '退货', '??????', 'lyman.meng', '12312132132', 'sadasd', '2016-03-08', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 09:00:12', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('31', '1', '退货', '??????', 'lyman.meng', '12312132132', 'sadasd', '2016-03-08', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 09:00:18', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('32', '1', '退货', '??????', 'lyman.meng', '12312132132', 'sadasd', '2015-12-02', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 10:00:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('33', '2', '换货', 'Brad', 'lyman.meng', '12312132132', 'hhhhhh', '2016-03-07', '3213213213', '2', '智能手机', 'nothing', '2', '功能损坏', '2016-03-08 10:00:24', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('34', '1', '退货', 'Leo', 'lyman.meng', '12312132132', 'sadasd', '2015-11-11', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 10:00:33', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('35', '1', '退货', 'leo.lll', 'lyman.meng', '12312132132', 'sadasd', '2015-12-12', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 10:36:06', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('36', '1', '退货', 'leoleo', 'lyman.meng', '12312132132', 'sadasd', '2015-12-12', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 10:56:27', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('37', '1', '退货', 'leoleoloe', 'lyman.meng', '12312132132', 'sadasd', '2015-01-01', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 11:27:07', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('38', '1', '退货', 'liulu', 'lyman.meng', '12312132132', 'sadasd', '2016-03-02', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 13:11:55', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('39', '1', '退货', 'luliu', 'lyman.meng', '12312132132', 'sadasd', '2016-03-02', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 13:15:42', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('40', '1', '退货', 'liulull', 'lyman.meng', '12312132132', 'sadasd', '2016-03-08', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 13:21:02', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('41', '1', '退货', 'leo.liu', 'lyman.meng', '12312132132', 'sadasd', '2016-03-09', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 14:08:30', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('42', '1', '退货', 'leo.liuliu', 'lyman.meng', '12312132132', 'sadasd', '2016-03-08', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 14:11:09', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('43', '1', '退货', '??????', 'lyman.meng', '12312132132', 'sadasd', '2016-03-08', '3213213213', '1', '智能门铃', 'nothing', '1', '外观损坏', '2016-03-08 15:42:50', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('44', '1', '退货', '??????', 'lyman.meng', '12312132132', 'jinronggang', '2016-03-09', '57857857', '2', '智能手机', 'bujiansunhuai', '2', '功能损坏', '2016-03-08 17:03:55', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5', 'lyman5', null, '4', 'lyman4', null, '254522356', '1', '??', null, null, null, null, null, null, '1', '更换零件', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_bill_act`
-- ----------------------------
DROP TABLE IF EXISTS `t_bill_act`;
CREATE TABLE `t_bill_act` (
  `act_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `human_id` int(11) DEFAULT NULL,
  `human_name` varchar(100) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `unit_name` varchar(100) DEFAULT NULL,
  `pre_human_id` int(11) DEFAULT NULL,
  `pre_human_name` varchar(100) DEFAULT NULL,
  `pre_role_id` int(11) DEFAULT NULL,
  `pre_role_name` varchar(100) DEFAULT NULL,
  `pre_unit_id` int(11) DEFAULT NULL,
  `pre_unit_name` varchar(100) DEFAULT NULL,
  `act_state_id` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dead_line` float(10,2) DEFAULT NULL,
  `warning_time` float(10,2) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `used_time` varchar(100) DEFAULT NULL,
  `remain_time` varchar(100) DEFAULT NULL,
  `pre_act_id` int(11) DEFAULT NULL,
  `act_def_id` int(11) DEFAULT NULL,
  `pre_act_def_id` int(11) DEFAULT NULL,
  `act_property_id` int(11) DEFAULT NULL,
  `act_property_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bill_act
-- ----------------------------
INSERT INTO `t_bill_act` VALUES ('20', '29', '5', 'lyman5', '5', 'as_repairer', '2', '售后服务部门 ', '1', 'lyman1', '1', 'cs_accepter', '1', '客诉受理部门', null, '2016-03-07 16:52:55', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill_act` VALUES ('29', '29', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, null, '2016-03-07 16:17:27', null, null, '2016-03-07 16:17:27', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('30', '29', '2', 'lyman2', '2', 'cs_checker', null, null, null, null, '1', 'cs_accepter', null, null, null, '2016-03-08 09:10:13', null, null, '2016-03-08 09:10:13', '2016-03-07 16:17:27', null, null, '29', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('31', '30', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, null, '2016-03-07 16:30:17', null, null, '2016-03-07 16:30:17', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('32', '30', '2', 'lyman2', '2', 'cs_checker', null, null, null, null, '1', 'cs_accepter', null, null, null, '2016-03-08 09:53:30', null, null, '2016-03-08 09:53:30', '2016-03-07 16:30:17', null, null, '31', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('33', '31', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, null, '2016-03-08 10:35:19', null, null, '2016-03-08 10:35:19', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('34', '29', null, null, '1', 'cs_accepter', null, null, null, null, '2', 'cs_checker', null, null, '4', '2016-03-08 09:10:13', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill_act` VALUES ('35', '30', null, null, '1', 'cs_accepter', null, null, null, null, '2', 'cs_checker', null, null, '4', '2016-03-08 09:53:30', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill_act` VALUES ('36', '32', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 10:35:28', null, null, '2016-03-08 10:35:28', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('37', '33', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 10:00:24', null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('38', '34', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 10:00:40', null, null, '2016-03-08 10:00:40', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('39', '34', '2', 'lyman2', '2', 'cs_checker', null, null, null, null, '1', 'cs_accepter', null, null, '2', '2016-03-08 10:00:56', null, null, '2016-03-08 10:00:56', '2016-03-08 10:00:40', null, null, '38', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('40', '34', null, null, '1', 'cs_accepter', null, null, null, null, '2', 'cs_checker', null, null, '4', '2016-03-08 10:00:56', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill_act` VALUES ('41', '31', '2', 'lyman2', '2', 'cs_checker', null, null, null, null, '1', 'cs_accepter', null, null, '2', '2016-03-08 10:35:42', null, null, '2016-03-08 10:35:42', '2016-03-08 10:35:19', null, null, '33', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('42', '32', '2', 'lyman2', '2', 'cs_checker', null, null, null, null, '1', 'cs_accepter', null, null, '2', '2016-03-08 11:26:50', null, null, '2016-03-08 11:26:50', '2016-03-08 10:35:28', null, null, '36', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('43', '31', null, null, '1', 'cs_accepter', null, null, null, null, '2', 'cs_checker', null, null, '4', '2016-03-08 10:35:42', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill_act` VALUES ('44', '35', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 10:36:10', null, null, '2016-03-08 10:36:10', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('45', '35', '2', 'lyman2', '2', 'cs_checker', null, null, null, null, '1', 'cs_accepter', null, null, '2', '2016-03-08 10:36:19', null, null, '2016-03-08 10:36:19', '2016-03-08 10:36:10', null, null, '44', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('46', '35', null, null, '1', 'cs_accepter', null, null, null, null, '2', 'cs_checker', null, null, '4', '2016-03-08 10:36:19', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill_act` VALUES ('47', '36', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 10:56:32', null, null, '2016-03-08 10:56:32', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('48', '36', '5', 'lyman5', '5', 'as_repairer', null, null, null, null, '1', 'cs_accepter', null, null, '2', '2016-03-08 10:56:42', null, null, null, '2016-03-08 10:56:32', null, null, '47', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('49', '32', null, null, '1', 'cs_accepter', null, null, '2', 'lyman2', '2', 'cs_checker', null, null, '4', '2016-03-08 11:26:50', null, null, null, null, null, null, '42', '1', '2', null, null);
INSERT INTO `t_bill_act` VALUES ('50', '37', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 11:27:21', null, null, '2016-03-08 11:27:21', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('51', '37', '2', 'lyman2', '2', 'cs_checker', null, null, '1', 'lyman1', '1', 'cs_accepter', null, null, '2', '2016-03-08 11:27:29', null, null, '2016-03-08 11:27:29', '2016-03-08 11:27:21', null, null, '50', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('52', '37', null, null, '1', 'cs_accepter', null, null, '2', 'lyman2', '2', 'cs_checker', null, null, '4', '2016-03-08 11:27:29', null, null, null, null, null, null, '51', '1', '2', null, null);
INSERT INTO `t_bill_act` VALUES ('53', '38', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 13:20:24', null, null, '2016-03-08 13:20:24', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('54', '39', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 13:17:45', null, null, '2016-03-08 13:17:45', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('55', '39', '2', 'lyman2', '2', 'cs_checker', null, null, '1', 'lyman1', '1', 'cs_accepter', null, null, '2', '2016-03-08 13:18:03', null, null, '2016-03-08 13:18:03', '2016-03-08 13:17:45', null, null, '54', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('56', '39', null, null, '1', 'cs_accepter', null, null, '2', 'lyman2', '2', 'cs_checker', null, null, '4', '2016-03-08 13:18:03', null, null, null, null, null, null, '55', '1', '2', null, null);
INSERT INTO `t_bill_act` VALUES ('57', '38', '2', 'lyman2', '2', 'cs_checker', null, null, '1', 'lyman1', '1', 'cs_accepter', null, null, '2', '2016-03-08 13:20:32', null, null, '2016-03-08 13:20:32', '2016-03-08 13:20:24', null, null, '53', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('58', '38', '1', 'lyman1', '1', 'cs_accepter', null, null, '2', 'lyman2', '2', 'cs_checker', null, null, '3', '2016-03-08 15:01:26', null, null, null, null, null, null, '57', '1', '2', null, null);
INSERT INTO `t_bill_act` VALUES ('59', '40', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 13:21:06', null, null, '2016-03-08 13:21:06', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('60', '40', '2', 'lyman2', '2', 'cs_checker', null, null, '1', 'lyman1', '1', 'cs_accepter', null, null, '2', '2016-03-08 13:21:13', null, null, '2016-03-08 13:21:13', '2016-03-08 13:21:06', null, null, '59', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('61', '40', '1', 'lyman1', '1', 'cs_accepter', null, null, '2', 'lyman2', '2', 'cs_checker', null, null, '4', '2016-03-08 13:21:13', null, null, null, null, null, null, '60', '1', '2', null, null);
INSERT INTO `t_bill_act` VALUES ('62', '41', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 14:08:34', null, null, '2016-03-08 14:08:34', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('63', '41', '2', 'lyman2', '2', 'cs_checker', null, null, '1', 'lyman1', '1', 'cs_accepter', null, null, '3', '2016-03-08 16:42:37', null, null, null, '2016-03-08 14:08:34', null, null, '62', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('64', '42', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 14:17:09', null, null, '2016-03-08 14:17:09', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('65', '42', '2', 'lyman2', '2', 'cs_checker', null, null, '1', 'lyman1', '1', 'cs_accepter', null, null, '2', '2016-03-08 14:24:39', null, null, '2016-03-08 14:24:39', '2016-03-08 14:17:10', null, null, '64', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('66', '42', '3', 'lyman3', '3', 'cs_manager', null, null, '2', 'lyman2', '2', 'cs_checker', null, null, '2', '2016-03-08 15:36:05', null, null, '2016-03-08 15:36:05', '2016-03-08 14:24:39', null, null, '65', '3', '2', null, null);
INSERT INTO `t_bill_act` VALUES ('67', '42', '2', 'lyman2', '2', 'cs_checker', null, null, '3', 'lyman3', '3', 'cs_manager', null, null, '2', '2016-03-08 16:09:59', null, null, null, '2016-03-08 15:36:05', null, null, '66', '4', '3', null, null);
INSERT INTO `t_bill_act` VALUES ('68', '43', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 15:42:50', null, null, null, null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('69', '44', '1', 'lyman1', '1', 'cs_accepter', null, null, null, null, null, null, null, null, '1', '2016-03-08 15:44:44', null, null, '2016-03-08 15:44:44', null, null, null, null, '1', null, null, null);
INSERT INTO `t_bill_act` VALUES ('70', '44', '2', 'lyman2', '2', 'cs_checker', null, null, '1', 'lyman1', '1', 'cs_accepter', null, null, '2', '2016-03-08 15:46:14', null, null, '2016-03-08 15:46:14', '2016-03-08 15:44:45', null, null, '69', '2', '1', null, null);
INSERT INTO `t_bill_act` VALUES ('71', '44', '2', 'lyman2', '2', 'cs_checker', null, null, '2', 'lyman2', '2', 'cs_checker', null, null, '2', '2016-03-08 15:46:32', null, null, '2016-03-08 15:46:32', '2016-03-08 15:46:14', null, null, '70', '3', '2', null, null);
INSERT INTO `t_bill_act` VALUES ('72', '44', '2', 'lyman2', '2', 'cs_checker', null, null, '2', 'lyman2', '2', 'cs_checker', null, null, '2', '2016-03-08 15:48:50', null, null, '2016-03-08 15:48:50', '2016-03-08 15:46:32', null, null, '71', '4', '3', null, null);
INSERT INTO `t_bill_act` VALUES ('73', '44', '3', 'lyman3', '3', 'cs_manager', null, null, '2', 'lyman2', '2', 'cs_checker', null, null, '2', '2016-03-08 15:49:59', null, null, '2016-03-08 15:49:59', '2016-03-08 15:48:50', null, null, '72', '5', '4', null, null);
INSERT INTO `t_bill_act` VALUES ('74', '44', '3', 'lyman3', '3', 'cs_manager', null, null, '3', 'lyman3', '3', 'cs_manager', null, null, '2', '2016-03-08 15:50:36', null, null, '2016-03-08 15:50:36', '2016-03-08 15:49:59', null, null, '73', '8', '5', null, null);
INSERT INTO `t_bill_act` VALUES ('75', '44', '4', 'lyman4', '4', 'cs_receiver', null, null, '3', 'lyman3', '3', 'cs_manager', null, null, '2', '2016-03-08 16:43:41', null, null, '2016-03-08 16:43:41', '2016-03-08 15:50:36', null, null, '74', '5', '8', null, null);
INSERT INTO `t_bill_act` VALUES ('76', '44', '5', 'lyman5', '5', 'as_repairer', null, null, '4', 'lyman4', '4', 'cs_receiver', null, null, '2', '2016-03-08 17:05:45', null, null, '2016-03-08 17:05:45', '2016-03-08 16:43:41', null, null, '75', '8', '5', null, null);
INSERT INTO `t_bill_act` VALUES ('77', '44', '6', 'lyman6', '6', 'as_manager', null, null, '5', 'lyman5', '5', 'as_repairer', null, null, '2', '2016-03-08 17:06:11', null, null, null, '2016-03-08 17:05:45', null, null, '76', '5', '8', null, null);

-- ----------------------------
-- Table structure for `t_dic_act_property`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_act_property`;
CREATE TABLE `t_dic_act_property` (
  `act_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `act_property_name` varchar(100) NOT NULL,
  PRIMARY KEY (`act_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_act_property
-- ----------------------------
INSERT INTO `t_dic_act_property` VALUES ('1', '客服受理阶段');
INSERT INTO `t_dic_act_property` VALUES ('2', '客服收货阶段');
INSERT INTO `t_dic_act_property` VALUES ('3', '客服质检阶段');
INSERT INTO `t_dic_act_property` VALUES ('4', '客服主管审核阶段');
INSERT INTO `t_dic_act_property` VALUES ('5', '售后维修阶段');
INSERT INTO `t_dic_act_property` VALUES ('6', '售后换货阶段');
INSERT INTO `t_dic_act_property` VALUES ('7', '售后发货阶段');
INSERT INTO `t_dic_act_property` VALUES ('8', '售后主管审核阶段');
INSERT INTO `t_dic_act_property` VALUES ('9', '会计核算阶段');
INSERT INTO `t_dic_act_property` VALUES ('10', '财务审核阶段');
INSERT INTO `t_dic_act_property` VALUES ('11', '出纳收付款阶段');
INSERT INTO `t_dic_act_property` VALUES ('12', '客服结案阶段');

-- ----------------------------
-- Table structure for `t_dic_act_state`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_act_state`;
CREATE TABLE `t_dic_act_state` (
  `act_state_id` int(11) NOT NULL,
  `act_state_name` varchar(255) NOT NULL,
  PRIMARY KEY (`act_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_act_state
-- ----------------------------
INSERT INTO `t_dic_act_state` VALUES ('1', '未激活');
INSERT INTO `t_dic_act_state` VALUES ('2', '打开');
INSERT INTO `t_dic_act_state` VALUES ('3', '挂起');
INSERT INTO `t_dic_act_state` VALUES ('4', '回退');
INSERT INTO `t_dic_act_state` VALUES ('5', '关闭');

-- ----------------------------
-- Table structure for `t_dic_apply_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_apply_type`;
CREATE TABLE `t_dic_apply_type` (
  `apply_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`apply_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_apply_type
-- ----------------------------
INSERT INTO `t_dic_apply_type` VALUES ('1', '退货');
INSERT INTO `t_dic_apply_type` VALUES ('2', '换货');
INSERT INTO `t_dic_apply_type` VALUES ('3', '维修');

-- ----------------------------
-- Table structure for `t_dic_approve_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_approve_result`;
CREATE TABLE `t_dic_approve_result` (
  `approve_result_id` int(11) NOT NULL,
  `approve_result_name` varchar(255) NOT NULL,
  PRIMARY KEY (`approve_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_approve_result
-- ----------------------------
INSERT INTO `t_dic_approve_result` VALUES ('1', '审核通过');
INSERT INTO `t_dic_approve_result` VALUES ('2', '审核不通过');

-- ----------------------------
-- Table structure for `t_dic_check_result`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_check_result`;
CREATE TABLE `t_dic_check_result` (
  `check_result_id` int(11) NOT NULL,
  `check_result_name` varchar(100) NOT NULL,
  PRIMARY KEY (`check_result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_check_result
-- ----------------------------
INSERT INTO `t_dic_check_result` VALUES ('1', '不予处理');
INSERT INTO `t_dic_check_result` VALUES ('2', '退货');
INSERT INTO `t_dic_check_result` VALUES ('3', '换货');
INSERT INTO `t_dic_check_result` VALUES ('4', '维修');

-- ----------------------------
-- Table structure for `t_dic_courier_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_courier_company`;
CREATE TABLE `t_dic_courier_company` (
  `courier_company_id` int(11) NOT NULL,
  `courier_company_name` varchar(255) NOT NULL,
  PRIMARY KEY (`courier_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_dic_courier_company
-- ----------------------------
INSERT INTO `t_dic_courier_company` VALUES ('1', '??');
INSERT INTO `t_dic_courier_company` VALUES ('2', '??');
INSERT INTO `t_dic_courier_company` VALUES ('3', '??');

-- ----------------------------
-- Table structure for `t_dic_damage_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_damage_type`;
CREATE TABLE `t_dic_damage_type` (
  `damage_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `damage_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`damage_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_damage_type
-- ----------------------------
INSERT INTO `t_dic_damage_type` VALUES ('1', '外观损坏');
INSERT INTO `t_dic_damage_type` VALUES ('2', '功能损坏');

-- ----------------------------
-- Table structure for `t_dic_goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_goods_type`;
CREATE TABLE `t_dic_goods_type` (
  `goods_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`goods_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_goods_type
-- ----------------------------
INSERT INTO `t_dic_goods_type` VALUES ('1', '智能门铃');
INSERT INTO `t_dic_goods_type` VALUES ('2', '智能手机');

-- ----------------------------
-- Table structure for `t_dic_repair_mode`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_repair_mode`;
CREATE TABLE `t_dic_repair_mode` (
  `repair_mode_id` int(11) NOT NULL,
  `repair_mode_name` varchar(100) NOT NULL,
  PRIMARY KEY (`repair_mode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_repair_mode
-- ----------------------------
INSERT INTO `t_dic_repair_mode` VALUES ('1', '更换零件');
INSERT INTO `t_dic_repair_mode` VALUES ('2', '维修零件');

-- ----------------------------
-- Table structure for `t_human`
-- ----------------------------
DROP TABLE IF EXISTS `t_human`;
CREATE TABLE `t_human` (
  `human_id` int(11) NOT NULL AUTO_INCREMENT,
  `human_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL default '',
  `unit_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`human_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_human
-- ----------------------------
INSERT INTO `t_human` VALUES ('1', 'lyman1', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '1', 'lyman的帐号', '2016-03-03 12:40:32', null, '0');
INSERT INTO `t_human` VALUES ('2', 'lyman2', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '1', 'lyman的帐号', '2016-03-03 12:40:33', null, '0');
INSERT INTO `t_human` VALUES ('3', 'lyman3', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '1', 'lyman的帐号', '2016-03-03 12:40:34', null, '0');
INSERT INTO `t_human` VALUES ('4', 'lyman4', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '1', 'lyman的帐号', '2016-03-03 12:40:35', null, '0');
INSERT INTO `t_human` VALUES ('5', 'lyman5', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '2', 'lyman的帐号', '2016-03-03 12:40:36', null, '0');
INSERT INTO `t_human` VALUES ('6', 'lyman6', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '2', 'lyman的帐号', '2016-03-03 12:40:37', null, '0');
INSERT INTO `t_human` VALUES ('7', 'lyman7', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '2', 'lyman的帐号', '2016-03-03 12:40:37', null, '0');
INSERT INTO `t_human` VALUES ('8', 'lyman8', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '2', 'lyman的帐号', '2016-03-03 12:40:38', null, '0');
INSERT INTO `t_human` VALUES ('9', 'lyman9', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '3', 'lyman的帐号', '2016-03-03 12:40:39', null, '0');
INSERT INTO `t_human` VALUES ('10', 'lyman10', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '3', 'lyman的帐号', '2016-03-03 12:40:41', null, '0');
INSERT INTO `t_human` VALUES ('11', 'lyman11', '28526e3ebc5f7a9f7b4709e1f3738e0c', '13697348295', '', '3', 'lyman的帐号', '2016-03-03 15:42:30', null, '0');

-- ----------------------------
-- Table structure for `t_human_navbar`
-- ----------------------------
DROP TABLE IF EXISTS `t_human_navbar`;
CREATE TABLE `t_human_navbar` (
  `navbar_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `navbar_name` varchar(100) NOT NULL,
  `navbar_url` varchar(255) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_human_navbar
-- ----------------------------
INSERT INTO `t_human_navbar` VALUES ('1', '1', 'cs_accept', '', '客诉受理中心', '受理平台', '受理平台', '1', '2016-03-03 15:06:30', '2016-03-03 14:42:41');
INSERT INTO `t_human_navbar` VALUES ('1', '2', 'cs_accept', '', '客诉受理中心', '受理平台', '受理平台', '1', '2016-03-03 15:06:30', '2016-03-03 14:42:41');
INSERT INTO `t_human_navbar` VALUES ('1', '3', 'cs_accept', '', '客诉受理中心', '受理平台', '受理平台', '1', '2016-03-03 15:06:30', '2016-03-03 14:42:41');
INSERT INTO `t_human_navbar` VALUES ('1', '4', 'cs_accept', '', '客诉受理中心', '受理平台', '受理平台', '1', '2016-03-03 15:06:30', '2016-03-03 14:42:41');
INSERT INTO `t_human_navbar` VALUES ('2', '1', 'cs_query', '', '客诉受理中心', '统计查询', '统计查询', '2', '2016-03-03 15:07:41', '2016-03-03 14:43:08');
INSERT INTO `t_human_navbar` VALUES ('2', '2', 'cs_query', '', '客诉受理中心', '统计查询', '统计查询', '2', '2016-03-03 15:07:41', '2016-03-03 14:43:08');
INSERT INTO `t_human_navbar` VALUES ('2', '3', 'cs_query', '', '客诉受理中心', '统计查询', '统计查询', '2', '2016-03-03 15:07:41', '2016-03-03 14:43:08');
INSERT INTO `t_human_navbar` VALUES ('2', '4', 'cs_query', '', '客诉受理中心', '统计查询', '统计查询', '2', '2016-03-03 15:07:41', '2016-03-03 14:43:08');
INSERT INTO `t_human_navbar` VALUES ('3', '1', 'cs_setting', '', '客诉受理中心', '系统设置', '系统设置', '3', '2016-03-03 15:07:51', '2016-03-03 15:06:05');
INSERT INTO `t_human_navbar` VALUES ('3', '2', 'cs_setting', '', '客诉受理中心', '系统设置', '系统设置', '3', '2016-03-03 15:07:51', '2016-03-03 15:06:05');
INSERT INTO `t_human_navbar` VALUES ('3', '3', 'cs_setting', '', '客诉受理中心', '系统设置', '系统设置', '3', '2016-03-03 15:07:51', '2016-03-03 15:06:05');
INSERT INTO `t_human_navbar` VALUES ('3', '4', 'cs_setting', '', '客诉受理中心', '系统设置', '系统设置', '3', '2016-03-03 15:07:51', '2016-03-03 15:06:05');
INSERT INTO `t_human_navbar` VALUES ('7', '9', 'fa_accept', '', '财务中心', '受理平台', '受理平台', '7', '2016-03-03 15:14:29', '2016-03-03 15:10:51');
INSERT INTO `t_human_navbar` VALUES ('7', '10', 'fa_accept', '', '财务中心', '受理平台', '受理平台', '7', '2016-03-03 15:14:29', '2016-03-03 15:10:51');
INSERT INTO `t_human_navbar` VALUES ('8', '9', 'fa_query', '', '财务中心', '统计查询', '统计查询', '8', '2016-03-03 15:14:31', '2016-03-03 15:11:24');
INSERT INTO `t_human_navbar` VALUES ('8', '10', 'fa_query', '', '财务中心', '统计查询', '统计查询', '8', '2016-03-03 15:14:31', '2016-03-03 15:11:24');
INSERT INTO `t_human_navbar` VALUES ('9', '9', 'fa_setting', '', '财务中心', '系统设置', '系统设置', '9', '2016-03-03 15:14:33', '2016-03-03 15:11:53');
INSERT INTO `t_human_navbar` VALUES ('9', '10', 'fa_setting', '', '财务中心', '系统设置', '系统设置', '9', '2016-03-03 15:14:33', '2016-03-03 15:11:53');
INSERT INTO `t_human_navbar` VALUES ('10', '1', 'cs_query_sale', '', '客诉受理中心', '分类统计', '售后案件分类统计', '10', '2016-03-08 10:13:49', '2016-03-03 15:13:43');
INSERT INTO `t_human_navbar` VALUES ('10', '2', 'cs_query_sale', '', '客诉受理中心', '分类统计', '售后案件分类统计', '10', '2016-03-08 10:13:49', '2016-03-03 15:13:43');
INSERT INTO `t_human_navbar` VALUES ('10', '3', 'cs_query_sale', '', '客诉受理中心', '分类统计', '售后案件分类统计', '10', '2016-03-08 10:13:49', '2016-03-03 15:13:43');
INSERT INTO `t_human_navbar` VALUES ('10', '4', 'cs_query_sale', '', '客诉受理中心', '分类统计', '售后案件分类统计', '10', '2016-03-08 10:13:49', '2016-03-03 15:13:43');
INSERT INTO `t_human_navbar` VALUES ('12', '9', 'fa_query_sale', '', '财务中心', '分类统计', '售后案件分类统计', '12', '2016-03-08 10:13:49', '2016-03-03 15:15:46');
INSERT INTO `t_human_navbar` VALUES ('12', '10', 'fa_query_sale', '', '财务中心', '分类统计', '售后案件分类统计', '12', '2016-03-08 10:13:49', '2016-03-03 15:15:46');
INSERT INTO `t_human_navbar` VALUES ('13', '1', 'cs_setting_add_human', '', '客诉受理中心', '添加人员', '添加人员', '13', '2016-03-03 15:17:25', '2016-03-03 15:16:50');
INSERT INTO `t_human_navbar` VALUES ('13', '2', 'cs_setting_add_human', '', '客诉受理中心', '添加人员', '添加人员', '13', '2016-03-03 15:17:25', '2016-03-03 15:16:50');
INSERT INTO `t_human_navbar` VALUES ('13', '3', 'cs_setting_add_human', '', '客诉受理中心', '添加人员', '添加人员', '13', '2016-03-03 15:17:25', '2016-03-03 15:16:50');
INSERT INTO `t_human_navbar` VALUES ('13', '4', 'cs_setting_add_human', '', '客诉受理中心', '添加人员', '添加人员', '13', '2016-03-03 15:17:25', '2016-03-03 15:16:50');
INSERT INTO `t_human_navbar` VALUES ('15', '9', 'fa_setting_add_human', '', '财务中心', '添加人员', '添加人员', '15', '2016-03-03 15:18:41', '2016-03-03 15:18:19');
INSERT INTO `t_human_navbar` VALUES ('15', '10', 'fa_setting_add_human', '', '财务中心', '添加人员', '添加人员', '15', '2016-03-03 15:18:41', '2016-03-03 15:18:19');
INSERT INTO `t_human_navbar` VALUES ('16', '1', 'cs_setting_change_psd', '', '客诉受理中心', '修改密码', '修改密码', '16', '2016-03-03 15:22:09', '2016-03-03 15:19:07');
INSERT INTO `t_human_navbar` VALUES ('16', '2', 'cs_setting_change_psd', '', '客诉受理中心', '修改密码', '修改密码', '16', '2016-03-03 15:22:09', '2016-03-03 15:19:07');
INSERT INTO `t_human_navbar` VALUES ('16', '3', 'cs_setting_change_psd', '', '客诉受理中心', '修改密码', '修改密码', '16', '2016-03-03 15:22:09', '2016-03-03 15:19:07');
INSERT INTO `t_human_navbar` VALUES ('16', '4', 'cs_setting_change_psd', '', '客诉受理中心', '修改密码', '修改密码', '16', '2016-03-03 15:22:09', '2016-03-03 15:19:07');
INSERT INTO `t_human_navbar` VALUES ('18', '9', 'fa_setting_change_psd', '', '财务中心', '修改密码', '修改密码', '18', '2016-03-03 15:22:12', '2016-03-03 15:19:57');
INSERT INTO `t_human_navbar` VALUES ('18', '10', 'fa_setting_change_psd', '', '财务中心', '修改密码', '修改密码', '18', '2016-03-03 15:22:12', '2016-03-03 15:19:57');
INSERT INTO `t_human_navbar` VALUES ('19', '1', 'cs_setting_modify_info', '', '客诉受理中心', '个人信息', '修改个人信息', '19', '2016-03-08 10:14:13', '2016-03-03 15:20:27');
INSERT INTO `t_human_navbar` VALUES ('19', '2', 'cs_setting_modify_info', '', '客诉受理中心', '个人信息', '修改个人信息', '19', '2016-03-08 10:14:13', '2016-03-03 15:20:27');
INSERT INTO `t_human_navbar` VALUES ('19', '3', 'cs_setting_modify_info', '', '客诉受理中心', '个人信息', '修改个人信息', '19', '2016-03-08 10:14:13', '2016-03-03 15:20:27');
INSERT INTO `t_human_navbar` VALUES ('19', '4', 'cs_setting_modify_info', '', '客诉受理中心', '个人信息', '修改个人信息', '19', '2016-03-08 10:14:13', '2016-03-03 15:20:27');
INSERT INTO `t_human_navbar` VALUES ('21', '9', 'fa_setting_modify_info', '', '财务中心', '个人信息', '修改个人信息', '21', '2016-03-08 10:14:13', '2016-03-03 15:21:14');
INSERT INTO `t_human_navbar` VALUES ('21', '10', 'fa_setting_modify_info', '', '财务中心', '个人信息', '修改个人信息', '21', '2016-03-08 10:14:13', '2016-03-03 15:21:14');
INSERT INTO `t_human_navbar` VALUES ('1', '5', 'cs_accept', '', '售后服务中心', '受理平台', '受理平台', '1', '2016-03-07 10:55:16', '2016-03-03 14:42:41');
INSERT INTO `t_human_navbar` VALUES ('1', '5', 'cs_accept', '', '售后服务中心', '受理平台', '受理平台', '1', '2016-03-07 10:55:16', '2016-03-03 14:42:41');
INSERT INTO `t_human_navbar` VALUES ('1', '5', 'cs_accept', '', '售后服务中心', '受理平台', '受理平台', '1', '2016-03-07 10:55:16', '2016-03-03 14:42:41');
INSERT INTO `t_human_navbar` VALUES ('1', '5', 'cs_accept', '', '售后服务中心', '受理平台', '受理平台', '1', '2016-03-07 10:55:16', '2016-03-03 14:42:41');
INSERT INTO `t_human_navbar` VALUES ('2', '5', 'cs_query', '', '售后服务中心', '统计查询', '统计查询', '2', '2016-03-07 10:55:16', '2016-03-03 14:43:08');
INSERT INTO `t_human_navbar` VALUES ('2', '5', 'cs_query', '', '售后服务中心', '统计查询', '统计查询', '2', '2016-03-07 10:55:16', '2016-03-03 14:43:08');
INSERT INTO `t_human_navbar` VALUES ('2', '5', 'cs_query', '', '售后服务中心', '统计查询', '统计查询', '2', '2016-03-07 10:55:16', '2016-03-03 14:43:08');
INSERT INTO `t_human_navbar` VALUES ('2', '5', 'cs_query', '', '售后服务中心', '统计查询', '统计查询', '2', '2016-03-07 10:55:16', '2016-03-03 14:43:08');
INSERT INTO `t_human_navbar` VALUES ('3', '5', 'cs_setting', '', '售后服务中心', '系统设置', '系统设置', '3', '2016-03-07 10:55:16', '2016-03-03 15:06:05');
INSERT INTO `t_human_navbar` VALUES ('3', '5', 'cs_setting', '', '售后服务中心', '系统设置', '系统设置', '3', '2016-03-07 10:55:16', '2016-03-03 15:06:05');
INSERT INTO `t_human_navbar` VALUES ('3', '5', 'cs_setting', '', '售后服务中心', '系统设置', '系统设置', '3', '2016-03-07 10:55:16', '2016-03-03 15:06:05');
INSERT INTO `t_human_navbar` VALUES ('3', '5', 'cs_setting', '', '售后服务中心', '系统设置', '系统设置', '3', '2016-03-07 10:55:16', '2016-03-03 15:06:05');
INSERT INTO `t_human_navbar` VALUES ('10', '5', 'cs_query_sale', '', '售后服务中心', '分类统计', '售后案件分类统计', '10', '2016-03-08 10:13:49', '2016-03-03 15:13:43');
INSERT INTO `t_human_navbar` VALUES ('10', '5', 'cs_query_sale', '', '售后服务中心', '分类统计', '售后案件分类统计', '10', '2016-03-08 10:13:49', '2016-03-03 15:13:43');
INSERT INTO `t_human_navbar` VALUES ('10', '5', 'cs_query_sale', '', '售后服务中心', '分类统计', '售后案件分类统计', '10', '2016-03-08 10:13:49', '2016-03-03 15:13:43');
INSERT INTO `t_human_navbar` VALUES ('10', '5', 'cs_query_sale', '', '售后服务中心', '分类统计', '售后案件分类统计', '10', '2016-03-08 10:13:49', '2016-03-03 15:13:43');
INSERT INTO `t_human_navbar` VALUES ('13', '5', 'cs_setting_add_human', '', '售后服务中心', '添加人员', '添加人员', '13', '2016-03-07 10:55:16', '2016-03-03 15:16:50');
INSERT INTO `t_human_navbar` VALUES ('13', '5', 'cs_setting_add_human', '', '售后服务中心', '添加人员', '添加人员', '13', '2016-03-07 10:55:16', '2016-03-03 15:16:50');
INSERT INTO `t_human_navbar` VALUES ('13', '5', 'cs_setting_add_human', '', '售后服务中心', '添加人员', '添加人员', '13', '2016-03-07 10:55:16', '2016-03-03 15:16:50');
INSERT INTO `t_human_navbar` VALUES ('13', '5', 'cs_setting_add_human', '', '售后服务中心', '添加人员', '添加人员', '13', '2016-03-07 10:55:16', '2016-03-03 15:16:50');
INSERT INTO `t_human_navbar` VALUES ('16', '5', 'cs_setting_change_psd', '', '售后服务中心', '修改密码', '修改密码', '16', '2016-03-07 10:55:16', '2016-03-03 15:19:07');
INSERT INTO `t_human_navbar` VALUES ('16', '5', 'cs_setting_change_psd', '', '售后服务中心', '修改密码', '修改密码', '16', '2016-03-07 10:55:16', '2016-03-03 15:19:07');
INSERT INTO `t_human_navbar` VALUES ('16', '5', 'cs_setting_change_psd', '', '售后服务中心', '修改密码', '修改密码', '16', '2016-03-07 10:55:16', '2016-03-03 15:19:07');
INSERT INTO `t_human_navbar` VALUES ('16', '5', 'cs_setting_change_psd', '', '售后服务中心', '修改密码', '修改密码', '16', '2016-03-07 10:55:16', '2016-03-03 15:19:07');
INSERT INTO `t_human_navbar` VALUES ('19', '5', 'cs_setting_modify_info', '', '售后服务中心', '个人信息', '修改个人信息', '19', '2016-03-08 10:14:13', '2016-03-03 15:20:27');
INSERT INTO `t_human_navbar` VALUES ('19', '5', 'cs_setting_modify_info', '', '售后服务中心', '个人信息', '修改个人信息', '19', '2016-03-08 10:14:13', '2016-03-03 15:20:27');
INSERT INTO `t_human_navbar` VALUES ('19', '5', 'cs_setting_modify_info', '', '售后服务中心', '个人信息', '修改个人信息', '19', '2016-03-08 10:14:13', '2016-03-03 15:20:27');
INSERT INTO `t_human_navbar` VALUES ('19', '5', 'cs_setting_modify_info', '', '售后服务中心', '个人信息', '修改个人信息', '19', '2016-03-08 10:14:13', '2016-03-03 15:20:27');

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
INSERT INTO `t_human_role` VALUES ('0', '1', '1');
INSERT INTO `t_human_role` VALUES ('2', '2', '2');
INSERT INTO `t_human_role` VALUES ('3', '3', '3');
INSERT INTO `t_human_role` VALUES ('4', '4', '4');
INSERT INTO `t_human_role` VALUES ('5', '5', '5');
INSERT INTO `t_human_role` VALUES ('6', '6', '6');
INSERT INTO `t_human_role` VALUES ('7', '7', '7');
INSERT INTO `t_human_role` VALUES ('8', '8', '8');
INSERT INTO `t_human_role` VALUES ('9', '9', '9');
INSERT INTO `t_human_role` VALUES ('10', '10', '10');
INSERT INTO `t_human_role` VALUES ('11', '11', '11');

-- ----------------------------
-- Table structure for `t_human_tasklist`
-- ----------------------------
DROP TABLE IF EXISTS `t_human_tasklist`;
CREATE TABLE `t_human_tasklist` (
  `tasklist_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `tasklist_name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `query_sql` varchar(1000) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`tasklist_id`,`human_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_human_tasklist
-- ----------------------------
INSERT INTO `t_human_tasklist` VALUES ('1', '1', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('1', '2', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('1', '3', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('1', '4', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('1', '5', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('1', '6', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('1', '7', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('1', '8', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('1', '9', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('1', '10', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('1', '11', 'todolist', '待办案件', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '1', '2016-03-08 10:30:59', '2016-03-03 15:54:30');
INSERT INTO `t_human_tasklist` VALUES ('2', '1', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('2', '2', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('2', '3', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('2', '4', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('2', '5', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('2', '6', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('2', '7', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('2', '8', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('2', '9', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('2', '10', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('2', '11', 'donelist', '经办案件', '1=1', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_human_tasklist` VALUES ('3', '1', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('3', '2', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('3', '3', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('3', '4', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('3', '5', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('3', '6', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('3', '7', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('3', '8', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('3', '9', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('3', '10', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('3', '11', 'rollbacklist', '退回案件', 'b.act_state_id = 4', '退回案件', '3', '2016-03-08 09:05:01', '2016-03-03 15:57:30');
INSERT INTO `t_human_tasklist` VALUES ('4', '1', 'tofinishlist', '待结案件', '1=1', '待结案件', '4', '2016-03-03 15:58:27', '2016-03-03 15:58:24');
INSERT INTO `t_human_tasklist` VALUES ('4', '2', 'tofinishlist', '待结案件', '1=1', '待结案件', '4', '2016-03-03 15:58:27', '2016-03-03 15:58:24');
INSERT INTO `t_human_tasklist` VALUES ('4', '3', 'tofinishlist', '待结案件', '1=1', '待结案件', '4', '2016-03-03 15:58:27', '2016-03-03 15:58:24');
INSERT INTO `t_human_tasklist` VALUES ('4', '4', 'tofinishlist', '待结案件', '1=1', '待结案件', '4', '2016-03-03 15:58:27', '2016-03-03 15:58:24');
INSERT INTO `t_human_tasklist` VALUES ('5', '2', 'suspendlist', '挂起案件', 'b.act_state_id = 3', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');
INSERT INTO `t_human_tasklist` VALUES ('5', '3', 'suspendlist', '挂起案件', 'b.act_state_id = 3', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');
INSERT INTO `t_human_tasklist` VALUES ('5', '4', 'suspendlist', '挂起案件', 'b.act_state_id = 3', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');
INSERT INTO `t_human_tasklist` VALUES ('5', '5', 'suspendlist', '挂起案件', 'b.act_state_id = 3', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');
INSERT INTO `t_human_tasklist` VALUES ('5', '6', 'suspendlist', '挂起案件', 'b.act_state_id = 3', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');
INSERT INTO `t_human_tasklist` VALUES ('5', '7', 'suspendlist', '挂起案件', 'b.act_state_id = 3', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');
INSERT INTO `t_human_tasklist` VALUES ('5', '8', 'suspendlist', '挂起案件', 'b.act_state_id = 3', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');
INSERT INTO `t_human_tasklist` VALUES ('5', '9', 'suspendlist', '挂起案件', 'b.act_state_id = 3', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');
INSERT INTO `t_human_tasklist` VALUES ('5', '10', 'suspendlist', '挂起案件', 'b.act_state_id = 3', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');
INSERT INTO `t_human_tasklist` VALUES ('5', '11', 'suspendlist', '挂起案件', 'b.act_state_id = 3', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');

-- ----------------------------
-- Table structure for `t_human_tasklist_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_human_tasklist_menu`;
CREATE TABLE `t_human_tasklist_menu` (
  `menu_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `tasklist_id` int(11) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_human_tasklist_menu
-- ----------------------------
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '3', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '3', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '3', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '3', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '4', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '4', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '4', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '4', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '5', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '5', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '5', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '5', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '6', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '6', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '6', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '6', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '7', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '7', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '7', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '7', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '8', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '8', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '8', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '8', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '9', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '9', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '9', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '9', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '10', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '10', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '10', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '10', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '11', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '11', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '11', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '11', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('5', '2', 'rollback', '1', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_human_tasklist_menu` VALUES ('5', '3', 'rollback', '1', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_human_tasklist_menu` VALUES ('5', '4', 'rollback', '1', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_human_tasklist_menu` VALUES ('5', '5', 'rollback', '1', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_human_tasklist_menu` VALUES ('5', '6', 'rollback', '1', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_human_tasklist_menu` VALUES ('5', '7', 'rollback', '1', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_human_tasklist_menu` VALUES ('5', '8', 'rollback', '1', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_human_tasklist_menu` VALUES ('5', '9', 'rollback', '1', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_human_tasklist_menu` VALUES ('5', '10', 'rollback', '1', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_human_tasklist_menu` VALUES ('5', '11', 'rollback', '1', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_human_tasklist_menu` VALUES ('9', '2', 'check', '1', '质检', '质检', '9', '2016-03-03 16:57:27', '2016-03-03 16:56:30');
INSERT INTO `t_human_tasklist_menu` VALUES ('10', '3', 'cs_approve', '1', '审核', '客服主管审核', '10', '2016-03-03 17:05:55', '2016-03-03 16:57:19');
INSERT INTO `t_human_tasklist_menu` VALUES ('11', '2', 'receive_bill', '1', '收件', '收件', '11', '2016-03-03 18:47:28', '2016-03-03 16:58:06');
INSERT INTO `t_human_tasklist_menu` VALUES ('11', '4', 'receive_bill', '1', '收件', '收件', '11', '2016-03-03 18:47:28', '2016-03-03 16:58:06');
INSERT INTO `t_human_tasklist_menu` VALUES ('11', '5', 'receive_bill', '1', '收件', '收件', '11', '2016-03-03 18:47:28', '2016-03-03 16:58:06');
INSERT INTO `t_human_tasklist_menu` VALUES ('11', '6', 'receive_bill', '1', '收件', '收件', '11', '2016-03-03 18:47:28', '2016-03-03 16:58:06');
INSERT INTO `t_human_tasklist_menu` VALUES ('11', '7', 'receive_bill', '1', '收件', '收件', '11', '2016-03-03 18:47:28', '2016-03-03 16:58:06');
INSERT INTO `t_human_tasklist_menu` VALUES ('11', '8', 'receive_bill', '1', '收件', '收件', '11', '2016-03-03 18:47:28', '2016-03-03 16:58:06');
INSERT INTO `t_human_tasklist_menu` VALUES ('11', '9', 'receive_bill', '1', '收件', '收件', '11', '2016-03-03 18:47:28', '2016-03-03 16:58:06');
INSERT INTO `t_human_tasklist_menu` VALUES ('11', '10', 'receive_bill', '1', '收件', '收件', '11', '2016-03-03 18:47:28', '2016-03-03 16:58:06');
INSERT INTO `t_human_tasklist_menu` VALUES ('11', '11', 'receive_bill', '1', '收件', '收件', '11', '2016-03-03 18:47:28', '2016-03-03 16:58:06');
INSERT INTO `t_human_tasklist_menu` VALUES ('14', '6', 'as_approve', '1', '审核', '售后主管审核', '14', '2016-03-03 18:47:33', '2016-03-03 17:05:55');
INSERT INTO `t_human_tasklist_menu` VALUES ('15', '4', 'receive_goods', '1', '收货', '收货', '15', '2016-03-03 18:47:34', '2016-03-03 17:06:45');
INSERT INTO `t_human_tasklist_menu` VALUES ('16', '5', 'repair', '1', '维修', '维修', '16', '2016-03-03 18:47:36', '2016-03-03 17:07:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('17', '7', 'exchange', '1', '换货', '换货', '17', '2016-03-03 18:47:39', '2016-03-03 17:07:42');
INSERT INTO `t_human_tasklist_menu` VALUES ('18', '8', 'send', '1', '发货', '发货', '18', '2016-03-03 18:47:41', '2016-03-03 17:08:10');
INSERT INTO `t_human_tasklist_menu` VALUES ('19', '11', 'pay', '1', '付款', '付款', '19', '2016-03-03 18:47:45', '2016-03-03 17:08:48');
INSERT INTO `t_human_tasklist_menu` VALUES ('20', '9', 'apply_pay', '1', '付款申请', '付款申请', '20', '2016-03-03 18:47:47', '2016-03-03 17:09:23');
INSERT INTO `t_human_tasklist_menu` VALUES ('21', '10', 'apply_pay_approve', '1', '付款申请审核', '付款申请审核', '21', '2016-03-03 18:47:49', '2016-03-03 17:09:54');
INSERT INTO `t_human_tasklist_menu` VALUES ('21', '10', 'apply_pay_approve', '2', '付款申请审核', '付款申请审核', '21', '2016-03-03 18:47:49', '2016-03-03 17:09:54');
INSERT INTO `t_human_tasklist_menu` VALUES ('21', '10', 'apply_pay_approve', '3', '付款申请审核', '付款申请审核', '21', '2016-03-03 18:47:49', '2016-03-03 17:09:54');
INSERT INTO `t_human_tasklist_menu` VALUES ('21', '10', 'apply_pay_approve', '4', '付款申请审核', '付款申请审核', '21', '2016-03-03 18:47:49', '2016-03-03 17:09:54');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '5', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '3', 'viewprocess', '5', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '4', 'viewprocess', '5', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '5', 'viewprocess', '5', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '6', 'viewprocess', '5', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '7', 'viewprocess', '5', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '8', 'viewprocess', '5', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '9', 'viewprocess', '5', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '10', 'viewprocess', '5', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '11', 'viewprocess', '5', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '3', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '3', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '3', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '3', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '4', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '4', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '4', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '4', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '5', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '5', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '5', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '5', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '6', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '6', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '6', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '6', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '7', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '7', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '7', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '7', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '8', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '8', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '8', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '8', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '9', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '9', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '9', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '9', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '10', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '10', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '10', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '10', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '11', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '11', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '11', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '11', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('1', '1', 'register', '1', '登记', '登记', '1', '2016-03-03 16:52:40', '2016-03-03 16:52:37');
INSERT INTO `t_human_tasklist_menu` VALUES ('2', '1', 'modify', '1', '修改', '修改', '2', '2016-03-03 16:53:00', '2016-03-03 16:52:57');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '1', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '1', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('6', '1', 'archive', '1', '办结', '办结', '6', '2016-03-03 16:57:23', '2016-03-03 16:54:50');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '1', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('8', '1', 'reopen', '2', '重启', '重启', '8', '2016-03-03 16:57:26', '2016-03-03 16:55:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '1', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '1', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '2', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '1', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '2', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '3', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('4', '2', 'viewprocess', '4', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '3', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '4', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '5', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '6', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '7', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '8', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '9', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '10', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('3', '11', 'transit', '1', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '1', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '2', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '3', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '4', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '5', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '6', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '7', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '8', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '9', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '10', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_human_tasklist_menu` VALUES ('7', '11', 'suspend', '1', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');

-- ----------------------------
-- Table structure for `t_navbar`
-- ----------------------------
DROP TABLE IF EXISTS `t_navbar`;
CREATE TABLE `t_navbar` (
  `navbar_id` int(11) NOT NULL AUTO_INCREMENT,
  `navbar_name` varchar(1000) NOT NULL,
  `navbar_url` varchar(255) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`navbar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_navbar
-- ----------------------------
INSERT INTO `t_navbar` VALUES ('1', 'cs_accept', '', '受理平台', '客诉受理中心', '受理平台', '1', '2016-03-03 15:06:30', '2016-03-03 14:42:41', null, '0');
INSERT INTO `t_navbar` VALUES ('2', 'cs_query', '', '统计查询', '客诉受理中心', '统计查询', '2', '2016-03-03 15:07:41', '2016-03-03 14:43:08', null, '0');
INSERT INTO `t_navbar` VALUES ('3', 'cs_setting', '', '系统设置', '客诉受理中心', '系统设置', '3', '2016-03-03 15:07:51', '2016-03-03 15:06:05', null, '0');
INSERT INTO `t_navbar` VALUES ('4', 'as_accept', '', '受理平台', '售后服务中心', '受理平台', '4', '2016-03-03 15:09:51', '2016-03-03 15:08:04', null, '0');
INSERT INTO `t_navbar` VALUES ('5', 'as_query', '', '统计查询', '售后服务中心', '统计查询', '5', '2016-03-03 15:10:01', '2016-03-03 15:09:58', null, '0');
INSERT INTO `t_navbar` VALUES ('6', 'as_setting', '', '系统设置', '售后服务中心', '系统设置', '6', '2016-03-03 15:10:27', '2016-03-03 15:10:20', null, '0');
INSERT INTO `t_navbar` VALUES ('7', 'fa_accept', '', '受理平台', '财务中心', '受理平台', '7', '2016-03-03 15:14:29', '2016-03-03 15:10:51', null, '0');
INSERT INTO `t_navbar` VALUES ('8', 'fa_query', '', '统计查询', '财务中心', '统计查询', '8', '2016-03-03 15:14:31', '2016-03-03 15:11:24', null, '0');
INSERT INTO `t_navbar` VALUES ('9', 'fa_setting', '', '系统设置', '财务中心', '系统设置', '9', '2016-03-03 15:14:33', '2016-03-03 15:11:53', null, '0');
INSERT INTO `t_navbar` VALUES ('10', 'cs_query_sale', '', '分类统计', '客诉受理中心', '售后案件分类统计', '10', '2016-03-08 10:10:31', '2016-03-03 15:13:43', '2', '0');
INSERT INTO `t_navbar` VALUES ('11', 'as_query_sale', '', '分类统计', '售后服务中心', '售后案件分类统计', '11', '2016-03-08 10:10:42', '2016-03-03 15:14:44', '5', '0');
INSERT INTO `t_navbar` VALUES ('12', 'fa_query_sale', '', '分类统计', '财务中心', '售后案件分类统计', '12', '2016-03-08 10:10:45', '2016-03-03 15:15:46', '8', '0');
INSERT INTO `t_navbar` VALUES ('13', 'cs_setting_add_human', '', '添加人员', '客诉受理中心', '添加人员', '13', '2016-03-03 15:17:25', '2016-03-03 15:16:50', '3', '0');
INSERT INTO `t_navbar` VALUES ('14', 'as_setting_add_human', '', '添加人员', '售后服务中心', '添加人员', '14', '2016-03-03 15:18:01', '2016-03-03 15:17:49', '6', '0');
INSERT INTO `t_navbar` VALUES ('15', 'fa_setting_add_human', '', '添加人员', '财务中心', '添加人员', '15', '2016-03-03 15:18:41', '2016-03-03 15:18:19', '9', '0');
INSERT INTO `t_navbar` VALUES ('16', 'cs_setting_change_psd', '', '修改密码', '客诉受理中心', '修改密码', '16', '2016-03-03 15:22:09', '2016-03-03 15:19:07', '3', '0');
INSERT INTO `t_navbar` VALUES ('17', 'as_setting_change_psd', '', '修改密码', '售后服务中心', '修改密码', '17', '2016-03-03 15:22:10', '2016-03-03 15:19:35', '6', '0');
INSERT INTO `t_navbar` VALUES ('18', 'fa_setting_change_psd', '', '修改密码', '财务中心', '修改密码', '18', '2016-03-03 15:22:12', '2016-03-03 15:19:57', '9', '0');
INSERT INTO `t_navbar` VALUES ('19', 'cs_setting_modify_info', '', '个人信息', '客诉受理中心', '修改个人信息', '19', '2016-03-08 10:10:55', '2016-03-03 15:20:27', '3', '0');
INSERT INTO `t_navbar` VALUES ('20', 'as_setting_modify_info', '', '个人信息', '售后服务中心', '修改个人信息', '20', '2016-03-08 10:10:59', '2016-03-03 15:20:53', '6', '0');
INSERT INTO `t_navbar` VALUES ('21', 'fa_setting_modify_info', '', '个人信息', '财务中心', '修改个人信息', '21', '2016-03-08 10:11:03', '2016-03-03 15:21:14', '9', '0');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_ime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `is_deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'cs_accepter', '客诉受理员', '客诉受理员', '2016-03-03 08:52:53', '2016-03-03 08:52:48', '0');
INSERT INTO `t_role` VALUES ('2', 'cs_checker', '商品质检员', '商品质检员', '2016-03-03 08:53:32', '2016-03-03 08:53:21', '0');
INSERT INTO `t_role` VALUES ('3', 'cs_manager', '客服主管', '客服主管', '2016-03-03 08:53:45', '2016-03-03 08:53:42', '0');
INSERT INTO `t_role` VALUES ('4', 'cs_receiver', '客诉收货员', '客诉收货员', '2016-03-03 15:40:57', '2016-03-03 08:56:23', '0');
INSERT INTO `t_role` VALUES ('5', 'as_repairer', '售后维修员', '售后维修员', '2016-03-03 08:58:41', '2016-03-03 08:58:36', '0');
INSERT INTO `t_role` VALUES ('6', 'as_manager', '售后主管', '售后主管', '2016-03-03 08:59:11', '2016-03-03 08:59:08', '0');
INSERT INTO `t_role` VALUES ('7', 'as_exchanger', '售后换货专员', '售后换货专员', '2016-03-03 09:11:26', '2016-03-03 09:11:20', '0');
INSERT INTO `t_role` VALUES ('8', 'as_sender', '售后发货员', '售后发货员', '2016-03-03 09:12:10', '2016-03-03 09:11:55', '0');
INSERT INTO `t_role` VALUES ('9', 'fa_accounting', '财务会计', '财务会计', '2016-03-03 09:14:51', '2016-03-03 09:14:47', '0');
INSERT INTO `t_role` VALUES ('10', 'fa_manager', '财务主管', '财务主管', '2016-03-03 09:15:18', '2016-03-03 09:15:11', '0');
INSERT INTO `t_role` VALUES ('11', 'fa_cashier', '财务出纳', '财务出纳', '2016-03-03 12:44:59', '2016-03-03 12:44:53', '0');

-- ----------------------------
-- Records of t_human_role
-- ----------------------------


CREATE TABLE IF NOT EXISTS `t_human_role` (

  `human_role_id` int(11) NOT NULL AUTO_INCREMENT,

  `human_id` int(11) NOT NULL,

  `role_id` int(11) NOT NULL,

  PRIMARY KEY (`human_role_id`)

) ENGINE=InnoDB  DEFAULT CHARSET=utf8


INSERT INTO `t_human_role` (`human_role_id`, `human_id`, `role_id`) VALUES
(7, 1, 1),
(8, 2, 2),
(17, 3, 3),
(23, 4, 4),
(24, 5, 5),
(26, 6, 6),
(27, 7, 7),
(28, 8, 8),
(29, 9, 9),
(30, 10, 10),
(31, 11, 11);

-- ----------------------------
-- Table structure for `t_sheet`
-- ----------------------------
DROP TABLE IF EXISTS `t_sheet`;
CREATE TABLE `t_sheet` (
  `function` varchar(100) NOT NULL,
  `field` varchar(100) NOT NULL,
  `field_type` int(11) NOT NULL,
  `rw` int(11) NOT NULL,
  `is_deleted` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_sheet
-- ----------------------------
INSERT INTO `t_sheet` VALUES ('register', 'apply_type_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('register', 'client_name', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('register', 'phone', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('register', 'address', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('register', 'buy_time', '3', '1', '0');
INSERT INTO `t_sheet` VALUES ('register', 'sku', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('register', 'goods_type_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('registter', 'damage_type_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('register', 'fault_description', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('register', 'account_name', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('register', 'human_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('transit', 'role_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('transit', 'role_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('transit', 'transit_memo', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('viewprocess', 'human_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewprocess', 'human_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewprocess', 'unit_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewprocess', 'unit_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewprocess', 'end_time', '3', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewprocess', 'operation', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('archive', 'archive_memo', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('reopen', 'reopen_memo', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'bill_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'apply_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'apply_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'client_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'address', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'goods_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'buy_time', '3', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'act_property_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'act_property_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'accept_human_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'accept_human_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'accept_time', '3', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'check_human_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'check_human_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'check_time', '3', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'check_result_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'check_result_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('viewbill', 'send_courier_no', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'apply_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'apply_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'client_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'account_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'goods_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'buy_time', '3', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'fault_description', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('check', 'check_result_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('check', 'check_result_name', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('check', 'check_opinion', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'apply_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'apply_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'client_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'account_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'goods_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'buy_time', '3', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'fault_description', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'check_result_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'check_result_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'check_opinion', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('cs_approve', 'cs_approve_opinion', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'apply_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'apply_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'client_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'account_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'goods_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'buy_time', '3', '0', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'receive_human_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'receive_courier_no', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('accept_goods', 'receive_courier_company_id', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('repair', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('repair', 'sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('repair', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('repair', 'goods_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('repair', 'fault_description', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('repair', 'repair_human_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('repair', 'repair_mode_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('exchange', 'client_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('exchange', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('exchange', 'exchange_sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('exchange', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('as_approve', 'client_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('as_approve', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('as_approve', 'exchange_sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('as_approve', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('as_approve', 'goods_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('as_approve', 'apply_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('as_approve', 'apply_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('as_approve', 'as_approve_human_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('as_approve', 'as_approve_opinion', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'apply_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'apply_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'client_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'account_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'goods_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'send_time', '3', '1', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'send_human_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'send_courier_no', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('send_goods', 'send_courier_company', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'apply_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'apply_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'client_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'account_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'goods_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'card_no', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'card_bank', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'goods_price', '4', '1', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'postage', '4', '1', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'total_cost', '4', '1', '0');
INSERT INTO `t_sheet` VALUES ('apply_pay', 'accounting_human_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'apply_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'apply_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'client_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'account_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'goods_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'card_no', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'card_bank', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'goods_price', '4', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'postage', '4', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'total_cost', '4', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'accounting_human_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'fa_approve_opinion', '2', '1', '0');
INSERT INTO `t_sheet` VALUES ('apply_approve', 'fa_approve_human_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'apply_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'apply_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'client_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'account_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'phone', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'sku', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'goods_type_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'goods_type_name', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'card_no', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'card_bank', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'goods_price', '4', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'postage', '4', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'total_cost', '4', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'accounting_human_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'fa_approve_opinion', '2', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'fa_approve_human_id', '1', '0', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'cashier_human_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('pay', 'fa_approve_result_id', '1', '1', '0');
INSERT INTO `t_sheet` VALUES ('repair', 'client_name', '2', '0', '0');

-- ----------------------------
-- Table structure for `t_sysconfig_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_sysconfig_item`;
CREATE TABLE `t_sysconfig_item` (
  `config_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_item_name` varchar(100) DEFAULT NULL,
  `data_type_id` int(11) DEFAULT NULL,
  `item_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_sysconfig_item
-- ----------------------------

-- ----------------------------
-- Table structure for `t_tasklist`
-- ----------------------------
DROP TABLE IF EXISTS `t_tasklist`;
CREATE TABLE `t_tasklist` (
  `tasklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `tasklist_name` varchar(255) NOT NULL,
  `query_sql` varchar(1000) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`tasklist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tasklist
-- ----------------------------
INSERT INTO `t_tasklist` VALUES ('1', 'todolist', 'b.end_time is null and b.act_state_id not in (3,4)', '待办案件', '待办案件', '1', '2016-03-08 10:30:25', '2016-03-03 15:54:30');
INSERT INTO `t_tasklist` VALUES ('2', 'donelist', '1=1', '经办案件', '经办案件', '2', '2016-03-03 15:54:57', '2016-03-03 15:54:54');
INSERT INTO `t_tasklist` VALUES ('3', 'rollbacklist', 'b.act_state_id = 4', '退回案件', '退回案件', '3', '2016-03-08 09:04:02', '2016-03-03 15:57:30');
INSERT INTO `t_tasklist` VALUES ('4', 'tofinishlist', '1=1', '待结案件', '待结案件', '4', '2016-03-03 15:58:27', '2016-03-03 15:58:24');
INSERT INTO `t_tasklist` VALUES ('5', 'suspendlist', 'b.act_state_id = 3', '挂起案件', '挂起案件', '5', '2016-03-08 14:41:48', '2016-03-08 14:41:45');

-- ----------------------------
-- Table structure for `t_tasklist_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_tasklist_item`;
CREATE TABLE `t_tasklist_item` (
  `tasklist_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `tasklist_item_name` varchar(100) NOT NULL,
  `tasklist_id` int(11) NOT NULL,
  `display_order` int(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `is_deleted` int(11) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_visible` int(11) DEFAULT '0',
  PRIMARY KEY (`tasklist_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tasklist_item
-- ----------------------------
INSERT INTO `t_tasklist_item` VALUES ('1', 'apply_type_name', '1', '1', '申请类型', '0', '2016-03-03 19:53:03', '0');
INSERT INTO `t_tasklist_item` VALUES ('2', 'client_name', '1', '2', '客户姓名', '0', '2016-03-03 19:53:04', '0');
INSERT INTO `t_tasklist_item` VALUES ('3', 'account_name', '1', '3', '账户名称', '0', '2016-03-03 19:53:05', '0');
INSERT INTO `t_tasklist_item` VALUES ('4', 'phone', '1', '4', '联系方式', '0', '2016-03-03 19:53:06', '0');
INSERT INTO `t_tasklist_item` VALUES ('5', 'sku', '1', '5', '商品编号', '0', '2016-03-03 19:53:07', '0');
INSERT INTO `t_tasklist_item` VALUES ('6', 'goods_type_name', '1', '6', '商品类型', '0', '2016-03-03 19:53:10', '0');
INSERT INTO `t_tasklist_item` VALUES ('7', 'damage_type_name', '1', '7', '损坏类型', '0', '2016-03-03 19:53:37', '0');
INSERT INTO `t_tasklist_item` VALUES ('8', 'apply_type_name', '2', '1', '申请类型', '0', '2016-03-03 19:53:03', '0');
INSERT INTO `t_tasklist_item` VALUES ('9', 'client_name', '2', '2', '客户姓名', '0', '2016-03-03 19:53:04', '0');
INSERT INTO `t_tasklist_item` VALUES ('10', 'account_name', '2', '3', '账户名称', '0', '2016-03-03 19:53:05', '0');
INSERT INTO `t_tasklist_item` VALUES ('11', 'phone', '2', '4', '联系方式', '0', '2016-03-03 19:53:06', '0');
INSERT INTO `t_tasklist_item` VALUES ('12', 'sku', '2', '5', '商品编号', '0', '2016-03-03 19:53:07', '0');
INSERT INTO `t_tasklist_item` VALUES ('13', 'goods_type_name', '2', '6', '商品类型', '0', '2016-03-03 19:53:10', '0');
INSERT INTO `t_tasklist_item` VALUES ('14', 'damage_type_name', '2', '7', '损坏类型', '0', '2016-03-03 19:53:37', '0');
INSERT INTO `t_tasklist_item` VALUES ('15', 'apply_type_name', '3', '1', '申请类型', '0', '2016-03-03 19:53:03', '0');
INSERT INTO `t_tasklist_item` VALUES ('16', 'client_name', '3', '2', '客户姓名', '0', '2016-03-03 19:53:04', '0');
INSERT INTO `t_tasklist_item` VALUES ('17', 'account_name', '3', '3', '账户名称', '0', '2016-03-03 19:53:05', '0');
INSERT INTO `t_tasklist_item` VALUES ('18', 'phone', '3', '4', '联系方式', '0', '2016-03-03 19:53:06', '0');
INSERT INTO `t_tasklist_item` VALUES ('19', 'sku', '3', '5', '商品编号', '0', '2016-03-03 19:53:07', '0');
INSERT INTO `t_tasklist_item` VALUES ('20', 'goods_type_name', '3', '6', '商品类型', '0', '2016-03-03 19:53:10', '0');
INSERT INTO `t_tasklist_item` VALUES ('21', 'damage_type_name', '3', '7', '损坏类型', '0', '2016-03-03 19:53:37', '0');
INSERT INTO `t_tasklist_item` VALUES ('22', 'apply_type_name', '4', '1', '申请类型', '0', '2016-03-03 19:53:03', '0');
INSERT INTO `t_tasklist_item` VALUES ('23', 'client_name', '4', '2', '客户姓名', '0', '2016-03-03 19:53:04', '0');
INSERT INTO `t_tasklist_item` VALUES ('24', 'account_name', '4', '3', '账户名称', '0', '2016-03-03 19:53:05', '0');
INSERT INTO `t_tasklist_item` VALUES ('25', 'phone', '4', '4', '联系方式', '0', '2016-03-03 19:53:06', '0');
INSERT INTO `t_tasklist_item` VALUES ('26', 'sku', '4', '5', '商品编号', '0', '2016-03-03 19:53:07', '0');
INSERT INTO `t_tasklist_item` VALUES ('27', 'goods_type_name', '4', '6', '商品类型', '0', '2016-03-03 19:53:10', '0');
INSERT INTO `t_tasklist_item` VALUES ('28', 'damage_type_name', '4', '7', '损坏类型', '0', '2016-03-03 19:53:37', '0');
INSERT INTO `t_tasklist_item` VALUES ('29', 'a.bill_id', '1', '8', '单据编号', '0', '2016-03-07 14:23:51', '1');
INSERT INTO `t_tasklist_item` VALUES ('30', 'act_id', '1', '9', '活动ID', '0', '2016-03-07 14:23:51', '1');
INSERT INTO `t_tasklist_item` VALUES ('31', 'act_def_id', '1', '10', '活动定义ID', '0', '2016-03-07 14:23:51', '1');
INSERT INTO `t_tasklist_item` VALUES ('32', 'a.bill_id', '2', '8', '单据ID', '0', '2016-03-07 15:45:58', '1');
INSERT INTO `t_tasklist_item` VALUES ('33', 'act_id', '2', '9', '活动ID', '0', '2016-03-07 15:45:58', '1');
INSERT INTO `t_tasklist_item` VALUES ('34', 'act_def_id', '2', '10', '活动定义ID', '0', '2016-03-07 15:45:58', '1');
INSERT INTO `t_tasklist_item` VALUES ('35', 'b.human_id', '1', '11', '办理人员', '0', '2016-03-07 15:48:16', '1');
INSERT INTO `t_tasklist_item` VALUES ('36', 'a.bill_id', '3', '8', '单据编号', '0', '2016-03-07 14:23:51', '1');
INSERT INTO `t_tasklist_item` VALUES ('37', 'act_id', '3', '9', '活动ID', '0', '2016-03-07 14:23:51', '1');
INSERT INTO `t_tasklist_item` VALUES ('38', 'act_def_id', '3', '10', '活动定义ID', '0', '2016-03-07 14:23:51', '1');
INSERT INTO `t_tasklist_item` VALUES ('39', 'b.human_id', '3', '11', '办理人员', '0', '2016-03-07 15:48:16', '1');
INSERT INTO `t_tasklist_item` VALUES ('43', 'apply_type_name', '5', '1', '申请类型', '0', '2016-03-03 19:53:03', '0');
INSERT INTO `t_tasklist_item` VALUES ('44', 'client_name', '5', '2', '客户姓名', '0', '2016-03-03 19:53:04', '0');
INSERT INTO `t_tasklist_item` VALUES ('45', 'account_name', '5', '3', '账户名称', '0', '2016-03-03 19:53:05', '0');
INSERT INTO `t_tasklist_item` VALUES ('46', 'phone', '5', '4', '联系方式', '0', '2016-03-03 19:53:06', '0');
INSERT INTO `t_tasklist_item` VALUES ('47', 'sku', '5', '5', '商品编号', '0', '2016-03-03 19:53:07', '0');
INSERT INTO `t_tasklist_item` VALUES ('48', 'goods_type_name', '5', '6', '商品类型', '0', '2016-03-03 19:53:10', '0');
INSERT INTO `t_tasklist_item` VALUES ('49', 'damage_type_name', '5', '7', '损坏类型', '0', '2016-03-03 19:53:37', '0');
INSERT INTO `t_tasklist_item` VALUES ('50', 'a.bill_id', '5', '8', '单据编号', '0', '2016-03-07 14:23:51', '1');
INSERT INTO `t_tasklist_item` VALUES ('51', 'act_id', '5', '9', '活动ID', '0', '2016-03-07 14:23:51', '1');
INSERT INTO `t_tasklist_item` VALUES ('52', 'act_def_id', '5', '10', '活动定义ID', '0', '2016-03-07 14:23:51', '1');
INSERT INTO `t_tasklist_item` VALUES ('53', 'b.human_id', '5', '11', '办理人员', '0', '2016-03-07 15:48:16', '1');

-- ----------------------------
-- Table structure for `t_tasklist_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_tasklist_menu`;
CREATE TABLE `t_tasklist_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tasklist_menu
-- ----------------------------
INSERT INTO `t_tasklist_menu` VALUES ('1', 'register', '登记', '登记', '1', '2016-03-03 16:52:40', '2016-03-03 16:52:37');
INSERT INTO `t_tasklist_menu` VALUES ('2', 'modify', '修改', '修改', '2', '2016-03-03 16:53:00', '2016-03-03 16:52:57');
INSERT INTO `t_tasklist_menu` VALUES ('3', 'transit', '批转', '批转', '3', '2016-03-03 16:53:22', '2016-03-03 16:53:18');
INSERT INTO `t_tasklist_menu` VALUES ('4', 'viewprocess', '查看办理流程', '查看办理流程', '4', '2016-03-03 16:53:47', '2016-03-03 16:53:44');
INSERT INTO `t_tasklist_menu` VALUES ('5', 'rollback', '回退', '回退', '5', '2016-03-03 16:54:36', '2016-03-03 16:54:34');
INSERT INTO `t_tasklist_menu` VALUES ('6', 'archive', '办结', '办结', '6', '2016-03-03 16:57:23', '2016-03-03 16:54:50');
INSERT INTO `t_tasklist_menu` VALUES ('7', 'suspend', '挂起', '挂起', '7', '2016-03-03 16:57:24', '2016-03-03 16:55:12');
INSERT INTO `t_tasklist_menu` VALUES ('8', 'reopen', '重启', '重启', '8', '2016-03-03 16:57:26', '2016-03-03 16:55:44');
INSERT INTO `t_tasklist_menu` VALUES ('9', 'check', '质检', '质检', '9', '2016-03-03 16:57:27', '2016-03-03 16:56:30');
INSERT INTO `t_tasklist_menu` VALUES ('10', 'cs_approve', '审核', '客服主管审核', '10', '2016-03-03 17:05:55', '2016-03-03 16:57:19');
INSERT INTO `t_tasklist_menu` VALUES ('11', 'receive_bill', '收件', '收件', '11', '2016-03-03 18:47:28', '2016-03-03 16:58:06');
INSERT INTO `t_tasklist_menu` VALUES ('12', 'assign', '分派', '分派', '12', '2016-03-03 18:47:29', '2016-03-03 16:58:46');
INSERT INTO `t_tasklist_menu` VALUES ('13', 'print', '打印', '打印', '13', '2016-03-03 18:47:31', '2016-03-03 16:59:05');
INSERT INTO `t_tasklist_menu` VALUES ('14', 'as_approve', '审核', '售后主管审核', '14', '2016-03-03 18:47:33', '2016-03-03 17:05:55');
INSERT INTO `t_tasklist_menu` VALUES ('15', 'receive_goods', '收货', '收货', '15', '2016-03-03 18:47:34', '2016-03-03 17:06:45');
INSERT INTO `t_tasklist_menu` VALUES ('16', 'repair', '维修', '维修', '16', '2016-03-03 18:47:36', '2016-03-03 17:07:18');
INSERT INTO `t_tasklist_menu` VALUES ('17', 'exchange', '换货', '换货', '17', '2016-03-03 18:47:39', '2016-03-03 17:07:42');
INSERT INTO `t_tasklist_menu` VALUES ('18', 'send', '发货', '发货', '18', '2016-03-03 18:47:41', '2016-03-03 17:08:10');
INSERT INTO `t_tasklist_menu` VALUES ('19', 'pay', '付款', '付款', '19', '2016-03-03 18:47:45', '2016-03-03 17:08:48');
INSERT INTO `t_tasklist_menu` VALUES ('20', 'apply_pay', '付款申请', '付款申请', '20', '2016-03-03 18:47:47', '2016-03-03 17:09:23');
INSERT INTO `t_tasklist_menu` VALUES ('21', 'apply_pay_approve', '付款申请审核', '付款申请审核', '21', '2016-03-03 18:47:49', '2016-03-03 17:09:54');

-- ----------------------------
-- Table structure for `t_unit`
-- ----------------------------
DROP TABLE IF EXISTS `t_unit`;
CREATE TABLE `t_unit` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(11) DEFAULT '0',
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_unit
-- ----------------------------
INSERT INTO `t_unit` VALUES ('1', '客诉受理部门', '2016-03-03 08:51:17', '0');
INSERT INTO `t_unit` VALUES ('2', '售后服务部门 ', '2016-03-03 08:51:36', '0');
INSERT INTO `t_unit` VALUES ('3', '财务部门', '2016-03-03 08:51:45', '0');

-- ----------------------------
-- Table structure for `t_wf_act_def`
-- ----------------------------
DROP TABLE IF EXISTS `t_wf_act_def`;
CREATE TABLE `t_wf_act_def` (
  `act_def_id` int(11) NOT NULL AUTO_INCREMENT,
  `act_def_name` varchar(80) DEFAULT NULL,
  `act_def_desc` varchar(255) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `warning_limit` int(11) DEFAULT NULL,
  `act_property_id` int(11) NOT NULL,
  `act_def_type` int(11) NOT NULL,
  PRIMARY KEY (`act_def_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wf_act_def
-- ----------------------------
INSERT INTO `t_wf_act_def` VALUES ('1', '客诉受理', '客诉受理', '2', '1', '1', '1');
INSERT INTO `t_wf_act_def` VALUES ('2', '客服收货', '客服收货', '2', '1', '2', '2');
INSERT INTO `t_wf_act_def` VALUES ('3', '客服质检', '客服质检', '2', '1', '3', '2');
INSERT INTO `t_wf_act_def` VALUES ('4', '客服主管审核', '客服主管审核', '2', '1', '4', '2');
INSERT INTO `t_wf_act_def` VALUES ('5', '售后维修', '售后维修', '2', '1', '5', '2');
INSERT INTO `t_wf_act_def` VALUES ('6', '售后换货', '售后换货', '2', '1', '6', '2');
INSERT INTO `t_wf_act_def` VALUES ('7', '售后发货', '售后发货', '2', '1', '7', '2');
INSERT INTO `t_wf_act_def` VALUES ('8', '售后主管审核', '售后主管审核', '2', '1', '8', '2');
INSERT INTO `t_wf_act_def` VALUES ('9', '会计核算', '会计核算', '2', '1', '9', '2');
INSERT INTO `t_wf_act_def` VALUES ('10', '财务审核', '财务审核', '2', '1', '10', '2');
INSERT INTO `t_wf_act_def` VALUES ('11', '出纳收付款', '出纳收付款', '2', '1', '11', '2');
INSERT INTO `t_wf_act_def` VALUES ('12', '客服结案', '客服结案', '2', '1', '12', '3');

-- ----------------------------
-- Table structure for `t_wf_act_part`
-- ----------------------------
DROP TABLE IF EXISTS `t_wf_act_part`;
CREATE TABLE `t_wf_act_part` (
  `act_def_id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) NOT NULL,
  `part_property` int(11) NOT NULL,
  PRIMARY KEY (`act_def_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wf_act_part
-- ----------------------------
INSERT INTO `t_wf_act_part` VALUES ('1', '1', '2');
INSERT INTO `t_wf_act_part` VALUES ('2', '2', '2');
INSERT INTO `t_wf_act_part` VALUES ('3', '3', '2');
INSERT INTO `t_wf_act_part` VALUES ('4', '4', '2');
INSERT INTO `t_wf_act_part` VALUES ('5', '5', '2');
INSERT INTO `t_wf_act_part` VALUES ('6', '6', '2');
INSERT INTO `t_wf_act_part` VALUES ('7', '7', '2');
INSERT INTO `t_wf_act_part` VALUES ('8', '8', '2');
INSERT INTO `t_wf_act_part` VALUES ('9', '9', '2');
INSERT INTO `t_wf_act_part` VALUES ('10', '10', '2');
INSERT INTO `t_wf_act_part` VALUES ('11', '11', '2');
INSERT INTO `t_wf_act_part` VALUES ('12', '1', '2');

-- ----------------------------
-- Table structure for `t_wf_trans_def`
-- ----------------------------
DROP TABLE IF EXISTS `t_wf_trans_def`;
CREATE TABLE `t_wf_trans_def` (
  `trans_def_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_def_name` varchar(80) NOT NULL,
  `trans_def_desc` varchar(255) DEFAULT NULL,
  `from_act_def_id` int(11) NOT NULL,
  `to_act_def_id` int(11) NOT NULL,
  PRIMARY KEY (`trans_def_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wf_trans_def
-- ----------------------------
INSERT INTO `t_wf_trans_def` VALUES ('1', '受理->收货', '受理->收货', '1', '2');
INSERT INTO `t_wf_trans_def` VALUES ('2', '收货->质检', '收货->质检', '2', '3');
INSERT INTO `t_wf_trans_def` VALUES ('4', '质检->客服审核', '质检->客服审核', '3', '4');
INSERT INTO `t_wf_trans_def` VALUES ('5', '客服审核->维修', '审核->维修', '4', '5');
INSERT INTO `t_wf_trans_def` VALUES ('6', '客服审核>换货', '客服审核->退货', '4', '6');
INSERT INTO `t_wf_trans_def` VALUES ('7', '客服审核->会计核算', '客服审核->会计核算', '4', '9');
INSERT INTO `t_wf_trans_def` VALUES ('8', '维修->售后审核', '维修->售后审核', '5', '8');
INSERT INTO `t_wf_trans_def` VALUES ('9', '换货->售后审核', '换货->售后审核', '6', '8');
INSERT INTO `t_wf_trans_def` VALUES ('10', '售后审核->维修', '售后审核>维修', '8', '5');
INSERT INTO `t_wf_trans_def` VALUES ('11', '售后审核->换货', '售后审核->换货', '8', '6');
INSERT INTO `t_wf_trans_def` VALUES ('12', '维修->发货', '维修->发货', '5', '7');
INSERT INTO `t_wf_trans_def` VALUES ('13', '换货->发货', '换货->发货', '6', '7');
INSERT INTO `t_wf_trans_def` VALUES ('14', '发货->结案', '发货->结案', '7', '1');
INSERT INTO `t_wf_trans_def` VALUES ('15', '会计核算->财务审核', '会计核算->财务审核', '9', '10');
INSERT INTO `t_wf_trans_def` VALUES ('16', '财务审核->出纳收付款', '财务审核->出纳收付款', '10', '11');
INSERT INTO `t_wf_trans_def` VALUES ('17', '出纳收付款->客服结案', '出纳收付款->客服结案', '11', '12');
DELIMITER ;;
CREATE TRIGGER `t_bill_insert_trigger` BEFORE INSERT ON `t_bill` FOR EACH ROW BEGIN
  set new.apply_type_name = (select apply_type_name from t_dic_apply_type where apply_type_id = new.apply_type_id);
  set new.goods_type_name = (select goods_type_name from t_dic_goods_type where goods_type_id = new.goods_type_id);
  set new.act_property_name = (select act_property_name from t_dic_act_property where act_property_id = new.act_property_id);
  set new.accept_human_name = (select human_name from t_human where human_id = new.accept_human_id);
  set new.damage_type_name = (select damage_type_name from t_dic_damage_type where damage_type_id = new.damage_type_id); 
END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `t_bill_update_trigger` BEFORE UPDATE ON `t_bill` FOR EACH ROW BEGIN
  if new.apply_type_id is not null
    then
      set new.apply_type_name = (select apply_type_name from t_dic_apply_type where apply_type_id = new.apply_type_id);
    end if;
  if new.act_property_id is not null
    then
      set new.act_property_name = (select act_property_name from t_dic_act_property where act_property_id = new.act_property_id);
    end if;
  if new.repair_human_id is not null
    then
      set new.repair_human_name = (select human_name from t_human where human_id = new.repair_human_id);
    end if;
  if new.exchange_goods_type_id is not null
    then
      set new.exchange_goods_type_name = (select goods_type_name from t_dic_goods_type where goods_type_id = new.exchange_goods_type_id);
    end if;
  if new.repair_human_id is not null
    then
      set new.repair_human_name = (select human_name from t_human where human_id = new.repair_human_id);
    end if;
  if new.check_human_id is not null
    then
      set new.check_human_name = (select human_name from t_human where human_id = new.check_human_id);
    end if;
  if new.receive_human_id is not null
    then
      set new.receive_human_name = (select human_name from t_human where human_id = new.receive_human_id);
    end if;
  if new.send_human_id is not null
    then
      set new.send_human_name = (select human_name from t_human where human_id = new.send_human_id);
    end if;
  if new.check_result_id is not null
    then
      set new.check_result_name = (select check_result_name from t_dic_check_result where check_result_id = new.check_result_id);
    end if;
  if new.cs_approve_human_id is not null
    then
      set new.cs_approve_human_name = (select human_name from t_human where human_id = new.cs_approve_human_id);
    end if;
  if new.as_approve_human_id is not null
    then
      set new.as_approve_human_name = (select human_name from t_human where human_id = new.as_approve_human_id);
    end if;
  if new.fa_approve_human_id is not null
    then
      set new.fa_approve_human_name = (select human_name from t_human where human_id = new.fa_approve_human_id);
    end if;
  if new.cashier_human_id is not null
    then
      set new.cashier_human_name = (select human_name from t_human where human_id = new.cashier_human_id);
    end if;
  if new.cs_approve_result_id is not null
    then
      set new.cs_approve_result_name = (select approve_result_name from t_dic_approve_result where approve_result_id = new.cs_approve_result_id);
    end if;
  if new.as_approve_result_id is not null
    then
      set new.as_approve_result_name = (select approve_result_name from t_dic_approve_result where approve_result_id = new.as_approve_result_id);
    end if;
  if new.fa_approve_result_id is not null
    then
      set new.fa_approve_result_name = (select approve_result_name from t_dic_approve_result where approve_result_id = new.fa_approve_result_id);
    end if;
  if new.repair_mode_id is not null
    then
      set new.repair_mode_name = (select repair_mode_name from t_dic_repair_mode where repair_mode_id = new.repair_mode_id);
    end if;
  if new.send_courier_company_id is not null
    then
      set new.send_courier_company_name = (select courier_company_name from t_dic_courier_company where courier_company_id = new.send_courier_company_id);
    end if;
  if new.receive_courier_company_id is not null
    then
      set new.receive_courier_company_name = (select courier_company_name from t_dic_courier_company where courier_company_id = new.receive_courier_company_id);
    end if;
END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `t_bill_act_insert_trigger` BEFORE INSERT ON `t_bill_act` FOR EACH ROW BEGIN
  set new.act_property_name = (select act_property_name from t_dic_act_property where act_property_id = new.act_property_id);
  set new.human_name = (select human_name from t_human where human_id = new.human_id);
  set new.role_name = (select role_name from t_role where role_id = new.role_id);
  set new.unit_name = (select unit_name from t_unit where unit_id = new.unit_id);
  set new.pre_human_name = (select human_name from t_human where human_id = new.pre_human_id);
  set new.pre_role_name = (select role_name from t_role where role_id = new.pre_role_id);
  set new.pre_unit_name = (select unit_name from t_unit where unit_id = new.pre_unit_id);
END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `t_bill_act_update_trigger` BEFORE UPDATE ON `t_bill_act` FOR EACH ROW BEGIN
  if new.act_property_id is not null
    then
      set new.act_property_name = (select act_property_name from t_dic_act_property where act_property_id = new.act_property_id);
  end if;
  if new.human_id is not null
    then
      set new.human_name = (select human_name from t_human where human_id = new.human_id);
  end if;
  if new.role_id is not null
    then
      set new.role_name = (select role_name from t_role where role_id = new.role_id);
  end if;
  if new.unit_id is not null
    then
      set new.unit_name = (select unit_name from t_unit where unit_id = new.unit_id);
  end if;
  if new.pre_human_id is not null
    then
      set new.pre_human_name = (select human_name from t_human where human_id = new.pre_human_id);
  end if;
  if new.pre_role_id is not null
    then
      set new.pre_role_name = (select role_name from t_role where role_id = new.pre_role_id);
  end if;
  if new.pre_unit_id is not null
    then
      set new.pre_unit_name = (select unit_name from t_unit where unit_id = new.pre_unit_id);
  end if;
END
;;
DELIMITER ;
