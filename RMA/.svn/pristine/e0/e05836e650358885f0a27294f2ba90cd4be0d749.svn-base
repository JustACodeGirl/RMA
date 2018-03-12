/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:49:45
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_bill`
-- ----------------------------
DROP TABLE IF EXISTS `t_bill`;
CREATE TABLE `t_bill` (
  `bill_id` int(20) NOT NULL AUTO_INCREMENT,
  `apply_type_id` int(11) NOT NULL,
  `apply_type_name` varchar(100) DEFAULT NULL,
  `client_name` varchar(100) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `buy_time` varchar(255) DEFAULT NULL,
  `sku` varchar(100) NOT NULL,
  `goods_type_id` int(11) NOT NULL,
  `goods_type_name` varchar(100) DEFAULT NULL,
  `fault_description` varchar(200) DEFAULT NULL,
  `damage_type_id` int(11) NOT NULL,
  `damage_type_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `archive_time` datetime DEFAULT NULL,
  `used_time` datetime DEFAULT NULL,
  `accept_time` datetime DEFAULT NULL,
  `accept_human_id` int(11) DEFAULT NULL,
  `accept_human_name` varchar(255) DEFAULT NULL,
  `dispatch_time` datetime DEFAULT NULL,
  `repair_time` datetime DEFAULT NULL,
  `repair_human_id` int(11) DEFAULT NULL,
  `repair_human_name` varchar(255) DEFAULT NULL,
  `damage_reason` varchar(255) DEFAULT NULL,
  `act_state_id` int(11) DEFAULT NULL,
  `act_state_name` varchar(255) DEFAULT NULL,
  `check_human_id` int(11) DEFAULT NULL,
  `check_human_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bill
-- ----------------------------
INSERT INTO `t_bill` VALUES ('1', '1', '退货', 'lyman.meng', 'menglei', '13697348295', '1', '', '1', '1', '智能门铃', '外观损坏', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', 'lyman', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', 'lyman', '1', '1', '客服受理阶段', '0', 'lyman');
INSERT INTO `t_bill` VALUES ('2', '1', '退货', 'lyman', 'csmenglei', '133', '123', '2014', '', '-1', null, '11', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_bill` VALUES ('3', '1', '退货', 'lyman', 'csmenglei', '133', '123', '2014', '', '-1', null, '11', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
DELIMITER ;;
CREATE TRIGGER `t_bill_insert_trigger` BEFORE INSERT ON `t_bill` FOR EACH ROW BEGIN
  set new.apply_type_name = (select apply_type_name from t_dic_apply_type where apply_type_id = new.apply_type_id);
  set new.goods_type_name = (select goods_type_name from t_dic_goods_type where goods_type_id = new.goods_type_id);
  set new.act_state_name = (select act_state_name from t_dic_act_state where act_state_id = new.act_state_id);
  set new.accept_human_name = (select human_name from t_human where human_id = new.accept_human_id);
  set new.repair_human_name = (select human_name from t_human where human_id = new.repair_human_id);
  set new.check_human_name = (select human_name from t_human where human_id = new.check_human_id);
END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `t_bill_update_trigger` BEFORE UPDATE ON `t_bill` FOR EACH ROW BEGIN
  if new.apply_type_id is not null
    then
      set new.apply_type_name = (select apply_type_name from t_dic_apply_type where apply_type_id = new.apply_type_id);
    end if;
  if new.goods_type_id is not null
    then
      set new.goods_type_name = (select goods_type_name from t_dic_goods_type where goods_type_id = new.goods_type_id);
    end if;
  if new.act_state_id is not null
    then
      set new.act_state_name = (select act_state_name from t_dic_act_state where act_state_id = new.act_state_id);
    end if;
  if new.accept_human_id is not null
    then
      set new.accept_human_name = (select human_name from t_human where human_id = new.accept_human_id);
    end if;
  if new.repair_human_id is not null
    then
      set new.repair_human_name = (select human_name from t_human where human_id = new.repair_human_id);
    end if;
END
;;
DELIMITER ;
