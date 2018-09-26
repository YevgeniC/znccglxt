/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : znccglpt

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-09-26 09:16:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `inlibrary_id` int(10) DEFAULT NULL,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pnum` int(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1578948974 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1578948904', '1151864949', '奶酪', '12', 'A1', '101', '食品饮品');
INSERT INTO `goods` VALUES ('1578948945', '1151864950', '奶酪', '14', 'A2', '102', '食品饮品');
INSERT INTO `goods` VALUES ('1578948946', '1151864950', '起司', '14', 'A1', '101', '食品饮品');
INSERT INTO `goods` VALUES ('1578948947', '1151864975', '蛤蛤', '15', 'A2', '156', '食品饮品');
INSERT INTO `goods` VALUES ('1578948948', '1151864989', '肥宅快乐水', '111', 'A2', '103', '食品饮品');
INSERT INTO `goods` VALUES ('1578948949', '1151864992', '肥宅快乐水', '1', 'A1', '101', '食品饮品');
INSERT INTO `goods` VALUES ('1578948950', '1151865012', '肥宅快乐奶茶', '1123', 'A1', '101', '食品饮品');
INSERT INTO `goods` VALUES ('1578948951', '1151865013', '一颗赛艇', '1123', 'A2', '102', null);
INSERT INTO `goods` VALUES ('1578948952', '1151865014', '二院视察', '50', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948953', '1151865015', '三个代表', '50', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948954', '1151865016', '四次起身', '5', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948955', '1151865017', '无可奉告', '50', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948956', '1151865018', '六月水柜', '50', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948957', '1151865019', '七因国服', '50', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948958', '1151865020', '八门外语', '165', 'A2', '102', null);
INSERT INTO `goods` VALUES ('1578948959', '1151865021', '九十大寿', '561', 'A4', '205', null);
INSERT INTO `goods` VALUES ('1578948960', '1151865022', '十全长者', '65', 'A3', '405', null);
INSERT INTO `goods` VALUES ('1578948961', '1151865023', '张宝华', '1', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948962', '1151865024', '董先生', '123', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948963', '1151865029', '野子', '1', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948964', '1151865030', 'the', '1', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948965', '1151865031', '百叶', '1', 'A1', '101', '食品饮品');
INSERT INTO `goods` VALUES ('1578948966', '1151865032', '牛百叶', '16', 'A2', '102', '食品饮品');
INSERT INTO `goods` VALUES ('1578948967', '1151865032', '水', '1', 'A1', '101', '食品饮品');
INSERT INTO `goods` VALUES ('1578948968', '1151865032', '1', '1', 'A1', '101', null);
INSERT INTO `goods` VALUES ('1578948969', '1151865033', '千张', '1', 'A1', '101', '食品饮品');
INSERT INTO `goods` VALUES ('1578948970', '1151864989', '肥宅快乐水', '12', 'A2', '103', '食品饮品');
INSERT INTO `goods` VALUES ('1578948971', '1151864989', '肥宅快乐水', '12', 'A2', '103', '食品饮品');
INSERT INTO `goods` VALUES ('1578948972', '1151865034', '农夫山泉', '81', 'A1', '101', '食品饮品');

-- ----------------------------
-- Table structure for inlibrary
-- ----------------------------
DROP TABLE IF EXISTS `inlibrary`;
CREATE TABLE `inlibrary` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `pnum` int(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `in_date` datetime DEFAULT NULL,
  `in_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1151865035 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inlibrary
-- ----------------------------
INSERT INTO `inlibrary` VALUES ('1151864949', '奶酪', '14', 'A2', '205', '2018-08-13 15:25:26', 'Mike');
INSERT INTO `inlibrary` VALUES ('1151864950', '起司', '14', 'A2', '205', '2018-08-13 15:25:27', 'Mike');
INSERT INTO `inlibrary` VALUES ('1151864975', '蛤蛤', '15', 'A2', '156', '2018-08-16 10:17:46', '蛤蛤');
INSERT INTO `inlibrary` VALUES ('1151864989', '肥宅快乐水', '123', 'A1', '101', '2018-08-16 11:53:27', '长者');
INSERT INTO `inlibrary` VALUES ('1151864992', '肥宅快乐水', '1', 'A1', '101', '2018-08-16 11:56:11', '钢闸门');
INSERT INTO `inlibrary` VALUES ('1151865012', '肥宅快乐奶茶', '1123', 'A2', '102', '2018-08-16 13:35:00', '上海市委书记');
INSERT INTO `inlibrary` VALUES ('1151865013', '一颗赛艇', '1123', 'A2', '102', '2018-08-16 13:35:00', '一颗赛艇');
INSERT INTO `inlibrary` VALUES ('1151865014', '二院视察', '50', 'A1', '101', '2018-08-16 13:37:21', '二院视察');
INSERT INTO `inlibrary` VALUES ('1151865015', '三个代表', '50', 'A1', '101', '2018-08-16 13:39:01', '三个代表');
INSERT INTO `inlibrary` VALUES ('1151865016', '四次起身', '5', 'A1', '101', '2018-08-16 13:42:40', '四次起身');
INSERT INTO `inlibrary` VALUES ('1151865017', '无可奉告', '50', 'A1', '101', '2018-08-16 13:58:10', '无可奉告');
INSERT INTO `inlibrary` VALUES ('1151865018', '六月水柜', '50', 'A1', '101', '2018-08-16 16:07:10', '六月水柜');
INSERT INTO `inlibrary` VALUES ('1151865019', '七因国服', '50', 'A1', '101', '2018-08-16 16:08:12', '七因国服');
INSERT INTO `inlibrary` VALUES ('1151865020', '八门外语', '165', 'A2', '102', '2018-08-17 11:12:35', '八门外语');
INSERT INTO `inlibrary` VALUES ('1151865021', '九十大寿', '561', 'A4', '205', '2018-08-17 11:12:52', '九十大寿');
INSERT INTO `inlibrary` VALUES ('1151865022', '十全长者', '65', 'A3', '405', '2018-08-17 11:13:01', '十全长者');
INSERT INTO `inlibrary` VALUES ('1151865023', '张宝华', '1', 'A1', '101', '2018-08-17 11:51:52', '张宝华');
INSERT INTO `inlibrary` VALUES ('1151865025', ' 梁逸峰', '2', 'A1', '102', '2018-08-23 11:02:28', '梁逸峰');
INSERT INTO `inlibrary` VALUES ('1151865033', '千_张', '1', 'A1', '101', '2018-08-27 14:57:03', '超级管理员');
INSERT INTO `inlibrary` VALUES ('1151865034', '农夫山泉', '100', 'A2', '103', '2018-08-30 09:56:09', '超级管理员');

-- ----------------------------
-- Table structure for move
-- ----------------------------
DROP TABLE IF EXISTS `move`;
CREATE TABLE `move` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `pnum` int(255) DEFAULT NULL,
  `before_area` varchar(255) DEFAULT NULL,
  `before_room` varchar(255) DEFAULT NULL,
  `after_area` varchar(255) DEFAULT NULL,
  `after_room` varchar(255) DEFAULT NULL,
  `move_time` datetime DEFAULT NULL,
  `move_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=1184949808 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of move
-- ----------------------------
INSERT INTO `move` VALUES ('1184949777', '1578948945', '奶酪', '14', 'A2', '503', 'A1', '102', '2018-08-13 15:56:17', 'Bob');
INSERT INTO `move` VALUES ('1184949778', '1578948945', '奶酪', '1', 'A1', '102', 'A1', '101', '2018-08-24 14:09:26', 'admin');
INSERT INTO `move` VALUES ('1184949779', '1151865013', '一颗赛艇', '1123', 'A2', '101', 'A2', '102', '2018-08-16 13:35:00', '一颗赛艇');
INSERT INTO `move` VALUES ('1184949780', '1151865014', '二院视察', '50', 'A1', '103', 'A1', '101', '2018-08-16 13:37:21', '二院视察');
INSERT INTO `move` VALUES ('1184949781', '1151865015', '三个代表', '50', 'A1', '103', 'A1', '101', '2018-08-16 13:39:01', '三个代表');
INSERT INTO `move` VALUES ('1184949782', '1151865016', '四次起身', '5', 'A1', '105', 'A1', '101', '2018-08-16 13:42:40', '四次起身');
INSERT INTO `move` VALUES ('1184949783', '1151865017', '无可奉告', '50', 'A1', '110', 'A1', '101', '2018-08-16 13:58:10', '无可奉告');
INSERT INTO `move` VALUES ('1184949784', '1151865018', '六月水柜', '50', 'A1', '151', 'A1', '101', '2018-08-16 16:07:10', '六月水柜');
INSERT INTO `move` VALUES ('1184949785', '1151865019', '七因国服', '50', 'A1', '104', 'A1', '101', '2018-08-16 16:08:12', '七因国服');
INSERT INTO `move` VALUES ('1184949786', '1151865020', '八门外语', '165', 'A2', '113', 'A2', '102', '2018-08-17 11:12:35', '八门外语');
INSERT INTO `move` VALUES ('1184949787', '1151865021', '九十大寿', '561', 'A4', '320', 'A4', '205', '2018-08-17 11:12:52', '九十大寿');
INSERT INTO `move` VALUES ('1184949788', '1151865022', '十全长者', '65', 'A3', '105', 'A3', '405', '2018-08-17 11:13:01', '十全长者');
INSERT INTO `move` VALUES ('1184949789', '1578948944', '奶酪', '14', 'A2', '502', 'A1', '101', '2018-08-27 16:26:06', null);
INSERT INTO `move` VALUES ('1184949790', '1578948944', '奶酪', '14', 'A1', '101', 'A1', '102', '2018-08-27 16:27:15', null);
INSERT INTO `move` VALUES ('1184949791', '1578948944', '奶酪', '14', 'A1', '102', 'A1', '103', '2018-08-27 16:28:17', '超级管理员');
INSERT INTO `move` VALUES ('1184949792', '1578948946', '起司', '14', 'A2', '205', 'A1', '101', '2018-08-27 16:29:20', '超级管理员');
INSERT INTO `move` VALUES ('1184949793', '1578948946', '起司', '14', 'A2', '205', 'A1', '101', '2018-08-27 16:29:16', '超级管理员');
INSERT INTO `move` VALUES ('1184949794', '1578948950', '肥宅快乐奶茶', '1123', 'A2', '102', 'A1', '101', '2018-08-27 16:31:46', '超级管理员');
INSERT INTO `move` VALUES ('1184949795', '1578948946', '起司', '14', 'A1', '101', 'A3', '103', '2018-08-27 16:35:52', '超级管理员');
INSERT INTO `move` VALUES ('1184949796', '1578948944', '奶酪', '14', 'A1', '103', 'A1', '101', '2018-08-27 16:39:43', '超级管理员');
INSERT INTO `move` VALUES ('1184949797', '1578948944', '奶酪', '14', 'A1', '101', 'A3', '101', '2018-08-27 16:44:05', '超级管理员');
INSERT INTO `move` VALUES ('1184949798', '1578948944', '奶酪', '14', 'A1', '101', 'A3', '102', '2018-08-27 16:54:31', '超级管理员');
INSERT INTO `move` VALUES ('1184949799', '1578948944', '奶酪', '14', 'A3', '102', 'A1', '103', '2018-08-27 16:55:00', '超级管理员');
INSERT INTO `move` VALUES ('1184949800', '1578948944', '奶酪', '14', 'A1', '103', 'A3', '103', '2018-08-27 16:57:48', '超级管理员');
INSERT INTO `move` VALUES ('1184949801', '1578948944', '奶酪', '14', 'A3', '103', 'A3', '101', '2018-08-27 17:07:21', '超级管理员');
INSERT INTO `move` VALUES ('1184949802', '1578948948', '肥宅快乐水', '12', 'A1', '101', 'A2', '103', '2018-08-27 17:22:26', '超级管理员');
INSERT INTO `move` VALUES ('1184949803', '1578948948', '肥宅快乐水', '12', 'A1', '101', 'A2', '103', '2018-08-27 17:22:26', '超级管理员');
INSERT INTO `move` VALUES ('1184949804', '1578948944', '奶酪', '1', 'A3', '101', 'A1', '101', '2018-08-27 17:24:37', '超级管理员');
INSERT INTO `move` VALUES ('1184949805', '1578948972', '农夫山泉', '10', 'A2', '103', 'A3', '101', '2018-08-30 10:05:09', '超级管理员');
INSERT INTO `move` VALUES ('1184949806', '1578948972', '农夫山泉', '10', 'A2', '103', 'A1', '101', '2018-08-30 10:14:16', '超级管理员');
INSERT INTO `move` VALUES ('1184949807', '1578948973', '农夫山泉', '10', 'A1', '101', 'A1', '102', '2018-08-30 10:15:20', '超级管理员');

-- ----------------------------
-- Table structure for outlibrary
-- ----------------------------
DROP TABLE IF EXISTS `outlibrary`;
CREATE TABLE `outlibrary` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `pnum` int(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `out_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `out_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1156498524 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outlibrary
-- ----------------------------
INSERT INTO `outlibrary` VALUES ('1156498495', '1151865013', '一颗赛艇', '1', 'A3', '101', '2018-08-17 14:36:46', '科院超市', '一颗赛艇');
INSERT INTO `outlibrary` VALUES ('1156498496', '1151865014', '二院视察', '2', 'A3', '101', '2018-08-17 14:36:49', '科院超市', '二院视察');
INSERT INTO `outlibrary` VALUES ('1156498497', '1151865015', '三个代表', '3', 'A3', '101', '2018-08-17 14:36:52', '科院超市', '三个代表');
INSERT INTO `outlibrary` VALUES ('1156498498', '1151865016', '四次起身', '4', 'A3', '101', '2018-08-17 14:36:55', '科院超市', '四次起身');
INSERT INTO `outlibrary` VALUES ('1156498499', '1151865017', '无可奉告', '5', 'A3', '101', '2018-08-17 14:36:58', '科院超市', '无可奉告');
INSERT INTO `outlibrary` VALUES ('1156498500', '1151865018', '六月水柜', '6', 'A3', '101', '2018-08-17 14:37:01', '科院超市', '六月水柜');
INSERT INTO `outlibrary` VALUES ('1156498501', '1151865019', '七因祸福', '7', 'A3', '101', '2018-08-17 14:37:04', '科院超市', '七因祸福');
INSERT INTO `outlibrary` VALUES ('1156498502', '1151865020', '八门外语', '8', 'A3', '101', '2018-08-17 14:37:06', '科院超市', '八门外语');
INSERT INTO `outlibrary` VALUES ('1156498503', '1151865021', '九十大寿', '9', 'A3', '101', '2018-08-17 14:37:08', '科院超市', '九十大寿');
INSERT INTO `outlibrary` VALUES ('1156498504', '1151865022', '十全长者', '10', 'A3', '101', '2018-08-17 14:37:16', '科院超市', '十全长者');
INSERT INTO `outlibrary` VALUES ('1156498505', null, '张宝华', null, null, null, '2018-08-17 16:23:59', null, null);
INSERT INTO `outlibrary` VALUES ('1156498509', null, '彭定康', null, null, null, '2018-08-17 16:24:09', null, null);
INSERT INTO `outlibrary` VALUES ('1156498510', null, '彭定康', null, null, null, '2018-08-17 16:24:12', null, null);
INSERT INTO `outlibrary` VALUES ('1156498511', null, '彭定康', null, null, null, '2018-08-17 16:24:14', null, null);
INSERT INTO `outlibrary` VALUES ('1156498512', null, '彭定康', null, null, null, '2018-08-17 16:24:17', null, null);
INSERT INTO `outlibrary` VALUES ('1156498513', null, '彭定康', null, null, null, '2018-08-17 16:24:22', null, null);
INSERT INTO `outlibrary` VALUES ('1156498514', null, '彭定康', null, null, null, '2018-08-17 16:24:25', null, null);
INSERT INTO `outlibrary` VALUES ('1156498515', null, '彭定康', null, null, null, '2018-08-17 16:24:27', null, null);
INSERT INTO `outlibrary` VALUES ('1156498516', null, '彭定康', null, null, null, '2018-08-17 16:24:35', null, null);
INSERT INTO `outlibrary` VALUES ('1156498517', null, '彭定康', null, null, null, '2018-08-17 16:24:38', null, null);
INSERT INTO `outlibrary` VALUES ('1156498518', '1578948944', '奶酪', '1', 'A1', '101', '2018-08-28 10:45:48', '撒大大大', '超级管理员');
INSERT INTO `outlibrary` VALUES ('1156498519', '1578948972', '奶酪', '1', 'A1', '101', '2018-08-28 10:46:26', '我爱普股份股票符合', '超级管理员');
INSERT INTO `outlibrary` VALUES ('1156498520', '1578948972', '奶酪', '1', 'A1', '101', '2018-08-28 10:46:40', '我爱普股份股票符合', '超级管理员');
INSERT INTO `outlibrary` VALUES ('1156498521', '1578948972', '奶酪', '1', 'A1', '101', '2018-08-28 10:50:21', '就要付邮费贵', '超级管理员');
INSERT INTO `outlibrary` VALUES ('1156498522', '1578948973', '农夫山泉', '10', 'A1', '102', '2018-08-30 10:15:41', '科院超市', '超级管理员');
INSERT INTO `outlibrary` VALUES ('1156498523', '1578948972', '农夫山泉', '9', 'A1', '101', '2018-08-30 10:17:03', '东和公寓', '超级管理员');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `phonumber` varchar(20) DEFAULT NULL,
  `type` int(5) DEFAULT NULL,
  `director` varchar(20) DEFAULT NULL,
  `userdescribe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '超级管理员', '13589849848', '0', '1', '超级管理员');
INSERT INTO `user` VALUES ('2', '哈哈', '123', '123', '15888888888', '0', 'null', null);
