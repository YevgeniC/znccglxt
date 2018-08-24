/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : znccglpt

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-08-24 17:54:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `inlibrary_id` int(10) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `pnum` int(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1578948963 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1578948944', '1151864949', '奶酪', '14', 'A2', '502');
INSERT INTO `goods` VALUES ('1578948945', '1151864950', '奶酪', '14', 'A1', '102');
INSERT INTO `goods` VALUES ('1578948946', '1151864950', '起司', '14', 'A2', '205');
INSERT INTO `goods` VALUES ('1578948947', '1151864975', '蛤蛤', '15', 'A2', '156');
INSERT INTO `goods` VALUES ('1578948948', '1151864989', '肥宅快乐水', '123', 'A1', '101');
INSERT INTO `goods` VALUES ('1578948949', '1151864992', '肥宅快乐水', '1', 'A1', '101');
INSERT INTO `goods` VALUES ('1578948950', '1151865012', '肥宅快乐奶茶', '1123', 'A2', '102');
INSERT INTO `goods` VALUES ('1578948951', '1151865013', '一颗赛艇', '1123', 'A2', '102');
INSERT INTO `goods` VALUES ('1578948952', '1151865014', '二院视察', '50', 'A1', '101');
INSERT INTO `goods` VALUES ('1578948953', '1151865015', '三个代表', '50', 'A1', '101');
INSERT INTO `goods` VALUES ('1578948954', '1151865016', '四次起身', '5', 'A1', '101');
INSERT INTO `goods` VALUES ('1578948955', '1151865017', '无可奉告', '50', 'A1', '101');
INSERT INTO `goods` VALUES ('1578948956', '1151865018', '六月水柜', '50', 'A1', '101');
INSERT INTO `goods` VALUES ('1578948957', '1151865019', '七因国服', '50', 'A1', '101');
INSERT INTO `goods` VALUES ('1578948958', '1151865020', '八门外语', '165', 'A2', '102');
INSERT INTO `goods` VALUES ('1578948959', '1151865021', '九十大寿', '561', 'A4', '205');
INSERT INTO `goods` VALUES ('1578948960', '1151865022', '十全长者', '65', 'A3', '405');
INSERT INTO `goods` VALUES ('1578948961', '1151865023', '张宝华', '1', 'A1', '101');
INSERT INTO `goods` VALUES ('1578948962', '1151865024', '董先生', '123', 'A1', '101');

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
) ENGINE=InnoDB AUTO_INCREMENT=1151865026 DEFAULT CHARSET=utf8;

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
INSERT INTO `inlibrary` VALUES ('1151865024', '董先生', '123', 'A1', '101', '2018-08-20 14:42:44', null);
INSERT INTO `inlibrary` VALUES ('1151865025', ' 梁逸峰', '2', 'A1', '102', '2018-08-23 11:02:28', '梁逸峰');

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
) ENGINE=InnoDB AUTO_INCREMENT=1184949789 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for outlibrary
-- ----------------------------
DROP TABLE IF EXISTS `outlibrary`;
CREATE TABLE `outlibrary` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `pnum` int(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `out_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `out_user` varchar(255) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1156498518 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outlibrary
-- ----------------------------
INSERT INTO `outlibrary` VALUES ('1156498495', '一颗赛艇', '1', 'A3', '101', '2018-08-17 14:36:46', '科院超市', '一颗赛艇', '1151865013');
INSERT INTO `outlibrary` VALUES ('1156498496', '二院视察', '2', 'A3', '101', '2018-08-17 14:36:49', '科院超市', '二院视察', '1151865014');
INSERT INTO `outlibrary` VALUES ('1156498497', '三个代表', '3', 'A3', '101', '2018-08-17 14:36:52', '科院超市', '三个代表', '1151865015');
INSERT INTO `outlibrary` VALUES ('1156498498', '四次起身', '4', 'A3', '101', '2018-08-17 14:36:55', '科院超市', '四次起身', '1151865016');
INSERT INTO `outlibrary` VALUES ('1156498499', '无可奉告', '5', 'A3', '101', '2018-08-17 14:36:58', '科院超市', '无可奉告', '1151865017');
INSERT INTO `outlibrary` VALUES ('1156498500', '六月水柜', '6', 'A3', '101', '2018-08-17 14:37:01', '科院超市', '六月水柜', '1151865018');
INSERT INTO `outlibrary` VALUES ('1156498501', '七因祸福', '7', 'A3', '101', '2018-08-17 14:37:04', '科院超市', '七因祸福', '1151865019');
INSERT INTO `outlibrary` VALUES ('1156498502', '八门外语', '8', 'A3', '101', '2018-08-17 14:37:06', '科院超市', '八门外语', '1151865020');
INSERT INTO `outlibrary` VALUES ('1156498503', '九十大寿', '9', 'A3', '101', '2018-08-17 14:37:08', '科院超市', '九十大寿', '1151865021');
INSERT INTO `outlibrary` VALUES ('1156498504', '十全长者', '10', 'A3', '101', '2018-08-17 14:37:16', '科院超市', '十全长者', '1151865022');
INSERT INTO `outlibrary` VALUES ('1156498505', '张宝华', null, null, null, '2018-08-17 16:23:59', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498508', '彭定康', null, null, null, '2018-08-17 16:24:07', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498509', '彭定康', null, null, null, '2018-08-17 16:24:09', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498510', '彭定康', null, null, null, '2018-08-17 16:24:12', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498511', '彭定康', null, null, null, '2018-08-17 16:24:14', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498512', '彭定康', null, null, null, '2018-08-17 16:24:17', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498513', '彭定康', null, null, null, '2018-08-17 16:24:22', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498514', '彭定康', null, null, null, '2018-08-17 16:24:25', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498515', '彭定康', null, null, null, '2018-08-17 16:24:27', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498516', '彭定康', null, null, null, '2018-08-17 16:24:35', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498517', '彭定康', null, null, null, '2018-08-17 16:24:38', null, null, null);

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
