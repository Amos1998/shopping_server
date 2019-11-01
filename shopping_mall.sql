/*
Navicat MySQL Data Transfer

Source Server         : segment
Source Server Version : 80015
Source Host           : localhost:3306
Source Database       : shopping_mall

Target Server Type    : MYSQL
Target Server Version : 80015
File Encoding         : 65001

Date: 2019-11-01 19:06:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car_charger_list
-- ----------------------------
DROP TABLE IF EXISTS `car_charger_list`;
CREATE TABLE `car_charger_list` (
  `goods_id` int(255) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  `pro_type` int(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `normal_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_name` (`goods_name`),
  UNIQUE KEY `goods_name_2` (`goods_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_charger_list
-- ----------------------------
INSERT INTO `car_charger_list` VALUES ('6', 'HLT208BK', 'USB A口+Type-C口,PD=QC3.0,输入：12VDC-Z4VDC,输出C口：5V+2.4A/9V=2.0A/12V=1.5A,输出A口：5V=3.0A/9V+2.0A/12V=1.5A,接通指示灯,防火塑胶外壳', '2', 'http://127.0.0.1:3000/images/car_charger/HLT208BK.jpg', '32.00', '0.00');
INSERT INTO `car_charger_list` VALUES ('7', 'HLT208WH', 'USB A口+Type-C口,PD=QC3.0,输入：12VDC-Z4VDC,输出C口：5V+2.4A/9V=2.0A/12V=1.5A,输出A口：5V=3.0A/9V+2.0A/12V=1.5A,接通指示灯,防火塑胶外壳', '2', 'http://127.0.0.1:3000/images/car_charger/HLT208WH.jpg', '32.00', '0.00');
INSERT INTO `car_charger_list` VALUES ('8', 'HLT208PK', 'USB A口+Type-C口,PD=QC3.0,输入：12VDC-Z4VDC,输出C口：5V+2.4A/9V=2.0A/12V=1.5A,输出A口：5V=3.0A/9V+2.0A/12V=1.5A,接通指示灯,防火塑胶外壳', '2', 'http://127.0.0.1:3000/images/car_charger/HLT208PK.jpg', '32.00', '0.00');
INSERT INTO `car_charger_list` VALUES ('9', 'HLT308', 'USB A口+Type-C口,PD=QC3.0,输入：12VDC-Z4VDC,输出C口：5V+2.4A/9V=2.0A/12V=1.5A,输出A口：5V=3.0A/9V+2.0A/12V=1.5A,接通指示灯,防火塑胶外壳', '2', 'http://127.0.0.1:3000/images/car_charger/HLT308.jpg', '32.00', '0.00');
INSERT INTO `car_charger_list` VALUES ('10', 'HLT108', '双QC3.0,输入：12VDC-Z4VDC,输出：5V+3A*2/9V=2.0A*2/12V=1.5A*2,接通指示灯,铝合金外壳', '2', 'http://127.0.0.1:3000/images/car_charger/HLT108.jpg', '32.00', '0.00');

-- ----------------------------
-- Table structure for charger_list
-- ----------------------------
DROP TABLE IF EXISTS `charger_list`;
CREATE TABLE `charger_list` (
  `goods_id` int(255) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  `pro_type` int(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `normal_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_name` (`goods_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of charger_list
-- ----------------------------
INSERT INTO `charger_list` VALUES ('4', 'HLT-CA-10010', '材质：ABS + PC,接口：1 x USB,支持快充,输入电压：90 ~ 264Vac,电流频率：50/60HZ,输入电流：0.35A,输出电压：5 ~ 48Vdc,输出电流：0.1 ~ 3A,输出功率：12W Max', '3', 'http://127.0.0.1:3000/images/charger/HLT-CA-10010.jpg', '22.00', '0.00');
INSERT INTO `charger_list` VALUES ('5', 'HLT-CA-10011', '材质：ABS + PC,接口：1 x USB,支持快充,输入电压：90 ~ 264Vac,电流频率：50/60HZ,输入电流：0.35A,输出电压：5 ~ 48Vdc,输出电流：0.1 ~ 3A,输出功率：12W Max', '3', 'http://127.0.0.1:3000/images/charger/HLT-CA-10011.jpg', '22.00', '0.00');

-- ----------------------------
-- Table structure for color_type
-- ----------------------------
DROP TABLE IF EXISTS `color_type`;
CREATE TABLE `color_type` (
  `color_id` int(255) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `imgUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`color_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of color_type
-- ----------------------------
INSERT INTO `color_type` VALUES ('1', '象牙白', null);
INSERT INTO `color_type` VALUES ('2', '经典黑', null);
INSERT INTO `color_type` VALUES ('3', '土豪金', null);
INSERT INTO `color_type` VALUES ('4', '中国红', null);
INSERT INTO `color_type` VALUES ('5', '宝石蓝', null);
INSERT INTO `color_type` VALUES ('6', '神秘银', null);

-- ----------------------------
-- Table structure for homecasual
-- ----------------------------
DROP TABLE IF EXISTS `homecasual`;
CREATE TABLE `homecasual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homecasual
-- ----------------------------
INSERT INTO `homecasual` VALUES ('1', 'http://127.0.0.1:3000/images/home/s1.png', 'http://mobile.yangkeduo.com/subject.html?subject_id=6153');
INSERT INTO `homecasual` VALUES ('2', 'http://127.0.0.1:3000/images/home/s2.png', 'http://mobile.yangkeduo.com/promotion_op.html?type=12&id=228');
INSERT INTO `homecasual` VALUES ('3', 'http://127.0.0.1:3000/images/home/s3.png', 'http://mobile.yangkeduo.com/subject.html?subject_id=6242');
INSERT INTO `homecasual` VALUES ('4', 'http://127.0.0.1:3000/images/home/s4.png', 'http://mobile.yangkeduo.com/subject.html?subject_id=6153');

-- ----------------------------
-- Table structure for hub_list
-- ----------------------------
DROP TABLE IF EXISTS `hub_list`;
CREATE TABLE `hub_list` (
  `goods_id` int(255) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  `pro_type` int(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `normal_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_name` (`goods_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hub_list
-- ----------------------------
INSERT INTO `hub_list` VALUES ('1', 'HLT1028G', '长度：10cm,电流: 1.5A Max,外壳: 铝合金,音频接口: 3.5mm,线芯：镀锌铜线,充电接口：Type-C,外被：TPE', '4', 'http://127.0.0.1:3000/images/hub/HLT1028G.jpg', '18.00', '0.00');
INSERT INTO `hub_list` VALUES ('2', 'HLT1028L', '长度：10cm,电流: 1.5A Max,外壳: 铝合金,音频接口: 3.5mm,线芯：镀锌铜线,充电接口：Type-C,外被：TPE', '4', 'http://127.0.0.1:3000/images/hub/HLT1028L.jpg', '18.00', '0.00');
INSERT INTO `hub_list` VALUES ('3', 'HLT1028S', '长度：10cm,电流: 1.5A Max,外壳: 铝合金,音频接口: 3.5mm,线芯：镀锌铜线,充电接口：Type-C,外被：TPE', '4', 'http://127.0.0.1:3000/images/hub/HLT1028S.jpg', '18.00', '0.00');

-- ----------------------------
-- Table structure for lightning_cable_list
-- ----------------------------
DROP TABLE IF EXISTS `lightning_cable_list`;
CREATE TABLE `lightning_cable_list` (
  `goods_id` int(255) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  `pro_type` int(255) DEFAULT NULL,
  `pro_stype` int(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `normal_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_name` (`goods_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lightning_cable_list
-- ----------------------------
INSERT INTO `lightning_cable_list` VALUES ('4', 'HLT26088SR', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT26088SR.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('5', 'HLT26088BK', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT26088BK.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('6', 'HLT0508BK', 'ABS材质，注塑成型, 优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT0508BK.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('7', 'HLT0508WH', 'ABS材质，注塑成型, 优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT0508WH.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('8', 'HLT1508BK', 'ABS材质，注塑成型, 优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT1508BK.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('9', 'HLT1508WH', 'ABS材质，注塑成型, 优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT1508WH.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('10', 'HLT1508BN', 'ABS材质，注塑成型, 优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT1508BN.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('11', 'HLT1508GN', 'ABS材质，注塑成型, 优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT1508GN.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('12', 'HLT1508BU', 'ABS材质，注塑成型, 优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT1508BU.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('13', 'HLT1508OG', 'ABS材质，注塑成型, 优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT1508OG.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('14', 'HLT1508GY', 'ABS材质，注塑成型, 优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT1508GY.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('15', 'HLT2508C', 'ABS材质，注塑成型, 优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2508C.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('16', 'HLT2508OG', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2508OG.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('17', 'HLT2508GN', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2508GN.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('18', 'HLT2508BN', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2508BN.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('19', 'HLT2508F', '铝合金外壳,优质铜线芯,尼龙编织线,数据传输速度:480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2508F.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('20', 'HLT2508M', '铝合金外壳,优质铜线芯,尼龙编织线,数据传输速度:480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2508M.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('21', 'HLT2508G', '铝合金外壳,优质铜线芯,尼龙编织线,数据传输速度:480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2508G.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('22', 'HLT2508B', '铝合金外壳,优质铜线芯,尼龙编织线,数据传输速度:480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2508B.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('23', 'HLT2508N', '铝合金外壳,优质铜线芯,尼龙编织线,数据传输速度:480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2508N.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('24', 'HLT2608T', '铝合金外壳,优质铜线芯,尼龙编织线,数据传输速度:480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2608T.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('25', 'HLT2608G', '铝合金外壳,优质铜线芯,尼龙编织线,数据传输速度:480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2608G.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('26', 'HLT2608R', '铝合金外壳,优质铜线芯,尼龙编织线,数据传输速度:480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2608R.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('27', 'HLT2608B', '铝合金外壳,优质铜线芯,尼龙编织线,数据传输速度:480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2608B.jpg', '19.00', '0.00');
INSERT INTO `lightning_cable_list` VALUES ('28', 'HLT2608S', '铝合金外壳,优质铜线芯,尼龙编织线,数据传输速度:480Mbps,最大电流: 2.4A', '1', '1', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT2608S.jpg', '19.00', '0.00');

-- ----------------------------
-- Table structure for micro_usb_cable_list
-- ----------------------------
DROP TABLE IF EXISTS `micro_usb_cable_list`;
CREATE TABLE `micro_usb_cable_list` (
  `goods_id` int(255) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  `pro_type` int(255) DEFAULT NULL,
  `pro_stype` int(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `normal_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_name` (`goods_name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of micro_usb_cable_list
-- ----------------------------
INSERT INTO `micro_usb_cable_list` VALUES ('4', 'HLT1518GN', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT1518GN.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('5', 'HLT0518BK', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT0518BK.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('6', 'HLT0518WH', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT0518WH.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('7', 'HLT1518BK', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT1518BK.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('8', 'HLT1518WH', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT1518WH.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('9', 'HLT1518BN', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT1518BN.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('10', 'HLT1518BU', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT1518BU.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('11', 'HLT1518GU', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT1518GU.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('12', 'HLT1518OG', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT1518OG.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('13', 'HLT1518GY', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT1518GY.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('14', 'HLT2518C', 'ABS材质，注塑成型,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2518C.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('15', 'HLT2518OG', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2518OG.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('16', 'HLT2518GN', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2518GN.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('17', 'HLT2518BN', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2518BN.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('18', 'HLT3518BK', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT3518BK.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('19', 'HLT3518WH', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT3518WH.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('20', 'HLT2618N', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2618N.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('21', 'HLT2518F', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2518F.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('22', 'HLT2518M', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2518M.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('23', 'HLT2518G', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2518G.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('24', 'HLT2518B', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2518B.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('25', 'HLT2618T', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2618T.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('26', 'HLT2618G', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2618G.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('27', 'HLT2618R', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2618R.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('28', 'HLT2618B', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2618B.jpg', '19.00', '0.00');
INSERT INTO `micro_usb_cable_list` VALUES ('29', 'HLT2618S', '优质铜线芯,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '2', 'http://127.0.0.1:3000/images/cable/micro_usb_cable/HLT2618S.jpg', '19.00', '0.00');

-- ----------------------------
-- Table structure for shopping_address_list
-- ----------------------------
DROP TABLE IF EXISTS `shopping_address_list`;
CREATE TABLE `shopping_address_list` (
  `address_id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `address_info` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` int(11) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shopping_address_list
-- ----------------------------
INSERT INTO `shopping_address_list` VALUES ('20', '1', '{\"name\":\"打瞌睡V领近年\",\"province\":\"天津市/市辖区/南开区\",\"desc\":\"发多少sa\",\"phone\":13162178816,\"email\":\"1574898514@qq.com\"}', '0');
INSERT INTO `shopping_address_list` VALUES ('21', '1', '{\"name\":\"帅\",\"province\":\"河北省/秦皇岛市/北戴河区\",\"desc\":\"朱建文\",\"phone\":13162178816,\"email\":\"1574898514@qq.com\"}', '0');
INSERT INTO `shopping_address_list` VALUES ('22', '1', '{\"name\":\"djj\",\"province\":\"内蒙古自治区/通辽市/库伦旗\",\"desc\":\"sdfsdfsdfsdf\",\"phone\":13162178816,\"email\":\"1574898514@qq.com\"}', '1');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `pro_type` int(255) DEFAULT NULL,
  `pro_stype` int(255) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `color_type` varchar(255) DEFAULT NULL,
  `length_type` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `buy_count` int(11) DEFAULT '0',
  `is_pay` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES ('1', '7', '1', '1', 'HLT0508WH', 'http://127.0.0.1:3000/images/cable/lightning_cable/HLT0508WH.jpg', '象牙白', '1m', '19.00', '1', '0');

-- ----------------------------
-- Table structure for shopping_order_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_order_cart`;
CREATE TABLE `shopping_order_cart` (
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `pro_type` int(255) DEFAULT NULL,
  `pro_stype` int(255) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `color_type` varchar(255) DEFAULT NULL,
  `length_type` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `buy_count` int(11) DEFAULT '0',
  `is_pay` int(11) DEFAULT '0',
  `AddTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_order_cart
-- ----------------------------
INSERT INTO `shopping_order_cart` VALUES ('1', '7', null, null, 'HLT208WH', 'http://127.0.0.1:3000/images/car_charger/HLT208WH.jpg', null, null, '32.00', '1', '0', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for type_c_list
-- ----------------------------
DROP TABLE IF EXISTS `type_c_list`;
CREATE TABLE `type_c_list` (
  `goods_id` int(255) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  `pro_type` int(255) DEFAULT NULL,
  `pro_stype` int(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `normal_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_name` (`goods_name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_c_list
-- ----------------------------
INSERT INTO `type_c_list` VALUES ('6', 'HLT0528BK', '优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT0528BK.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('7', 'HLT0528WH', '优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT0528WH.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('8', 'HLT1528BK', '优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT1528BK.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('9', 'HLT1528WH', '优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT1528WH.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('10', 'HLT1528BN', '优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT1528BN.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('11', 'HLT1528GN', '优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT1528GN.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('12', 'HLT1528BU', '优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT1528BU.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('13', 'HLT1528OG', '优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT1528OG.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('14', 'HLT1528GY', '优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT1528GY.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('15', 'HLT2528C', '优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2528C.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('16', 'HLT2528OG', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2528OG.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('17', 'HLT2528GN', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2528GN.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('18', 'HLT2528BN', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2528BN.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('19', 'HLT3528BK', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT3528BK.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('20', 'HLT3528WH', 'ABS材质，注塑成型,尼龙编织线,优质铜线芯,数据传输速度: 480Mbps,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT3528WH.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('21', 'HLT2528F', '优质铜线芯 ,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2528F.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('22', 'HLT2528M', '优质铜线芯 ,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2528M.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('23', 'HLT2528G', '优质铜线芯 ,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2528G.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('24', 'HLT2528B', '优质铜线芯 ,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2528B.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('25', 'HLT2528N', '优质铜线芯 ,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2528N.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('26', 'HLT2628T', '优质铜线芯 ,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2628T.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('27', 'HLT2628G', '优质铜线芯 ,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2628G.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('28', 'HLT2628R', '优质铜线芯 ,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2628R.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('29', 'HLT2628B', '优质铜线芯 ,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2628B.jpg', '19.00', '0.00');
INSERT INTO `type_c_list` VALUES ('30', 'HLT2628S', '优质铜线芯 ,尼龙编织线,数据传输速度: 480Mbps,铝合金外壳,最大电流: 3A', '1', '3', 'http://127.0.0.1:3000/images/cable/type_c/HLT2628S.jpg', '19.00', '0.00');

-- ----------------------------
-- Table structure for type_c_to_lightning_cable_list
-- ----------------------------
DROP TABLE IF EXISTS `type_c_to_lightning_cable_list`;
CREATE TABLE `type_c_to_lightning_cable_list` (
  `goods_id` int(255) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) DEFAULT NULL,
  `param` varchar(1000) DEFAULT NULL,
  `pro_type` int(255) DEFAULT NULL,
  `pro_stype` int(255) DEFAULT NULL,
  `thumb_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `normal_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_name` (`goods_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_c_to_lightning_cable_list
-- ----------------------------
INSERT INTO `type_c_to_lightning_cable_list` VALUES ('4', 'HLT5808BU', '优质铜线芯, 尼龙编织线,铝合金外壳,12000次弯折寿命,MFi苹果官方认证,支持PD快充3A(Max),数据传输速度: 480Mbps,适用苹果ios全系列产品', '1', '4', 'http://127.0.0.1:3000/images/cable/type_c_to_lightning_cable/HLT5808BU.jpg', '19.00', '0.00');
INSERT INTO `type_c_to_lightning_cable_list` VALUES ('5', 'HLT5808RD', '优质铜线芯, 尼龙编织线,铝合金外壳,12000次弯折寿命,MFi苹果官方认证,支持PD快充3A(Max),数据传输速度: 480Mbps,适用苹果ios全系列产品', '1', '4', 'http://127.0.0.1:3000/images/cable/type_c_to_lightning_cable/HLT5808RD.jpg', '19.00', '0.00');
INSERT INTO `type_c_to_lightning_cable_list` VALUES ('6', 'HLT5818BK', '优质铜线芯, 尼龙编织线,铝合金外壳,12000次弯折寿命,MFi苹果官方认证,支持PD快充3A(Max),数据传输速度: 480Mbps,适用苹果ios全系列产品', '1', '4', 'http://127.0.0.1:3000/images/cable/type_c_to_lightning_cable/HLT5818BK.jpg', '19.00', '0.00');
INSERT INTO `type_c_to_lightning_cable_list` VALUES ('7', 'HLT5808BN', '优质铜线芯, 尼龙编织线,铝合金外壳,12000次弯折寿命,MFi苹果官方认证,支持PD快充3A(Max),数据传输速度: 480Mbps,适用苹果ios全系列产品', '1', '4', 'http://127.0.0.1:3000/images/cable/type_c_to_lightning_cable/HLT5808BN.jpg', '19.00', '0.00');
INSERT INTO `type_c_to_lightning_cable_list` VALUES ('8', 'HLT5808OG', '优质铜线芯, 尼龙编织线,铝合金外壳,12000次弯折寿命,MFi苹果官方认证,支持PD快充3A(Max),数据传输速度: 480Mbps,适用苹果ios全系列产品', '1', '4', 'http://127.0.0.1:3000/images/cable/type_c_to_lightning_cable/HLT5808OG.jpg', '19.00', '0.00');
INSERT INTO `type_c_to_lightning_cable_list` VALUES ('9', 'HLT5818WH', '优质铜线芯, 尼龙编织线,铝合金外壳,12000次弯折寿命,MFi苹果官方认证,支持PD快充3A(Max),数据传输速度: 480Mbps,适用苹果ios全系列产品', '1', '4', 'http://127.0.0.1:3000/images/cable/type_c_to_lightning_cable/HLT5818WH.jpg', '19.00', '0.00');
INSERT INTO `type_c_to_lightning_cable_list` VALUES ('10', 'HLT5808PK', '优质铜线芯, 尼龙编织线,铝合金外壳,12000次弯折寿命,MFi苹果官方认证,支持PD快充3A(Max),数据传输速度: 480Mbps,适用苹果ios全系列产品', '1', '4', 'http://127.0.0.1:3000/images/cable/type_c_to_lightning_cable/HLT5808PK.jpg', '19.00', '0.00');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_pwd` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_sex` varchar(255) DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_birthday` varchar(255) DEFAULT NULL,
  `user_sign` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'zjw', '123456', '13162178816', 'nan', null, null, null);
INSERT INTO `user_info` VALUES ('2', '1111', 'd6d1d2b50655a964810ba5592c9200a5', null, null, null, null, null);
INSERT INTO `user_info` VALUES ('3', '1346', '123456', null, null, null, null, null);
INSERT INTO `user_info` VALUES ('4', '18770884199', '011', '18770884199', null, null, null, null);
INSERT INTO `user_info` VALUES ('5', '18770884198', '011', '18770884198', null, null, null, null);
INSERT INTO `user_info` VALUES ('6', '18770884197', '011', '18770884197', null, null, null, null);
INSERT INTO `user_info` VALUES ('7', '18770884196', '011', '18770884196', null, null, null, null);
INSERT INTO `user_info` VALUES ('8', '13162178811', '123', '13162178811', null, null, null, null);
INSERT INTO `user_info` VALUES ('9', '13162178813', '123', '13162178813', null, null, null, null);
