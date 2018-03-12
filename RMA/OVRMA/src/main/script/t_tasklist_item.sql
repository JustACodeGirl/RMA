/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:51:10
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_tasklist_item`
-- ----------------------------
DROP TABLE IF EXISTS `t_tasklist_item`;
CREATE TABLE `t_tasklist_item` (
  `tasklist_item_id` int(11) NOT NULL,
  `tasklist_item_name` varchar(255) NOT NULL,
  `tasklist_id` int(11) NOT NULL,
  `display_order` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  PRIMARY KEY (`tasklist_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tasklist_item
-- ----------------------------
INSERT INTO `t_tasklist_item` VALUES ('1', 'apply_type_name', '1', '1', '申请类型');
INSERT INTO `t_tasklist_item` VALUES ('2', 'client_name', '1', '2', '客户姓名');
INSERT INTO `t_tasklist_item` VALUES ('3', 'account_name', '1', '3', '账户名称');
INSERT INTO `t_tasklist_item` VALUES ('4', 'phone', '1', '4', '联系方式');
INSERT INTO `t_tasklist_item` VALUES ('5', 'address', '1', '5', '客户地址');
INSERT INTO `t_tasklist_item` VALUES ('6', 'goods_type_name', '1', '6', '商品类型');
