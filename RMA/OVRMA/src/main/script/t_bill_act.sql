/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50622
Source Host           : localhost:3306
Source Database       : ovrma

Target Server Type    : MYSQL
Target Server Version : 50622
File Encoding         : 65001

Date: 2016-02-29 13:49:53
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_bill_act`
-- ----------------------------
DROP TABLE IF EXISTS `t_bill_act`;
CREATE TABLE `t_bill_act` (
  `act_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `human_id` int(11) NOT NULL,
  `human_name` varchar(255) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `pre_role_id` int(11) NOT NULL,
  `pre_role_name` varchar(255) NOT NULL,
  `create_time` datetime NOT NULL,
  `dead_line` datetime NOT NULL,
  `warning_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `pre_act_id` int(11) NOT NULL,
  `act_def_id` int(11) NOT NULL,
  `act_def_name` varchar(255) NOT NULL,
  `pre_human_id` int(11) NOT NULL,
  `pre_human_name` varchar(255) NOT NULL,
  `pre_act_def_id` int(11) NOT NULL,
  `pre_act_def_name` varchar(255) DEFAULT NULL,
  `act_used_time` datetime NOT NULL,
  `act_remain_time` datetime NOT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bill_act
-- ----------------------------
INSERT INTO `t_bill_act` VALUES ('1', '1', '0', 'lyman', '1', '客服部门', '1', 'accept', '1', 'accept', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0', '1', '客服', '0', 'lyman', '1', '客服', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
DELIMITER ;;
CREATE TRIGGER `t_bill_act_insert_trigger` BEFORE INSERT ON `t_bill_act` FOR EACH ROW BEGIN
  set new.human_name = (select human_name from t_human where human_id = new.human_id);
  set new.pre_human_name = (select human_name from t_human where human_id = new.pre_human_id);
  set new.unit_name = (select unit_name from t_unit where unit_id = new.unit_id);
  set new.role_name = (select role_name from t_role where role_id = new.role_id);
  set new.pre_role_name = (select role_name from t_role where role_id = new.pre_role_id);
  set new.act_def_name = (select act_def_name from t_dic_act_def where act_def_id = new.act_def_id);
  set new.pre_act_def_name = (select act_def_name from t_dic_act_def where act_def_id = new.pre_act_def_id);
END
;;
DELIMITER ;
DELIMITER ;;
CREATE TRIGGER `t_bill_act_update_trigger` BEFORE UPDATE ON `t_bill_act` FOR EACH ROW BEGIN
  if new.human_id is not null
    then
      set new.human_name = (select human_name from t_human where human_id = new.human_id);
  end if;
  if new.pre_human_id is not null
    then
      set new.pre_human_name = (select human_name from t_human where human_id = new.pre_human_id);
  end if;
  if new.unit_id is not null
    then 
      set new.unit_name = (select unit_name from t_unit where unit_id = new.unit_id);
  end if;
  if new.role_id is not null
    then
      set new.role_name = (select role_name from t_role where role_id = new.role_id);
  end if;
  if new.pre_role_id is not null
    then
      set new.pre_role_name = (select role_name from t_role where role_id = new.pre_role_id);
  end if;
  if new.act_def_id is not null
    then
      set new.act_def_name = (select act_def_name from t_dic_act_def where act_def_id = new.act_def_id);
  end if;
  if new.act_def_id is not null
    then
      set new.pre_act_def_name = (select act_def_name from t_dic_act_def where pre_act_def_id = new.act_def_id);
 end if;
END
;;
DELIMITER ;
