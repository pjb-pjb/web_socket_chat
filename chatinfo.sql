/*
MySQL Data Transfer
Source Host: localhost
Source Database: fecshop
Target Host: localhost
Target Database: fecshop
Date: 2018/8/10 17:26:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for chatinfo
-- ----------------------------
DROP TABLE IF EXISTS `chatinfo`;
CREATE TABLE `chatinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friId` int(11) DEFAULT NULL,
  `myCon` text CHARACTER SET utf8,
  `chatTime` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=269 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for friends
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friId` int(11) DEFAULT NULL,
  `remark` text CHARACTER SET utf8,
  `userId` int(11) DEFAULT NULL,
  `accstatus` tinyint(1) DEFAULT NULL,
  `addtime` varchar(100) DEFAULT NULL,
  `num` int(11) DEFAULT '0' COMMENT '新消息的条数',
  `lastInfo` text CHARACTER SET utf8,
  `lastTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userNum` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `userPhone` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `userPass` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `userGender` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `userImg` varchar(100) CHARACTER SET utf8 DEFAULT 'http://localhost:1701/avatar.jpg',
  `userName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `userAddress` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `userSocketId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `chatinfo` VALUES ('3', '2', '的撒大', '2018-07-07 13:39:12', '1');
INSERT INTO `chatinfo` VALUES ('4', '2', '大撒大撒', '2018-07-07 13:47:51', '1');
INSERT INTO `chatinfo` VALUES ('5', '2', '阿三打撒', '2018-07-07 13:55:57', '1');
INSERT INTO `chatinfo` VALUES ('6', '2', '阿三打撒', '2018-07-07 13:56:56', '1');
INSERT INTO `chatinfo` VALUES ('7', '2', '阿三打撒', '2018-07-07 13:58:47', '1');
INSERT INTO `chatinfo` VALUES ('8', '2', '阿三打撒', '2018-07-07 14:05:31', '1');
INSERT INTO `chatinfo` VALUES ('9', '2', '阿三打撒', '2018-07-07 14:07:24', '1');
INSERT INTO `chatinfo` VALUES ('10', '1', 'dsadsa', '2018-07-07 14:50:13', '2');
INSERT INTO `chatinfo` VALUES ('11', '1', 'llllllll', '2018-07-07 14:50:35', '2');
INSERT INTO `chatinfo` VALUES ('48', '1', 'llll', '2018-07-08 18:40:41', '2');
INSERT INTO `chatinfo` VALUES ('13', '1', 'llllllll', '2018-07-07 14:55:08', '2');
INSERT INTO `chatinfo` VALUES ('69', '2', 'ddsadsadasd', '2018-07-08 19:06:51', '1');
INSERT INTO `chatinfo` VALUES ('16', '2', 'dsadsad', '2018-07-07 15:26:01', '1');
INSERT INTO `chatinfo` VALUES ('17', '2', 'dsadad', '2018-07-07 15:27:43', '1');
INSERT INTO `chatinfo` VALUES ('18', '1', 'dsadsaddsad', '2018-07-07 15:28:24', '2');
INSERT INTO `chatinfo` VALUES ('19', '1', 'dsadasad', '2018-07-07 15:28:39', '2');
INSERT INTO `chatinfo` VALUES ('20', '2', 'dsadad', '2018-07-07 15:35:13', '1');
INSERT INTO `chatinfo` VALUES ('21', '2', 'dsadad', '2018-07-07 15:35:26', '1');
INSERT INTO `chatinfo` VALUES ('22', '2', 'dsadad', '2018-07-07 15:35:30', '1');
INSERT INTO `chatinfo` VALUES ('23', '2', 'dsadad', '2018-07-07 15:35:32', '1');
INSERT INTO `chatinfo` VALUES ('24', '1', '我们', '2018-07-07 15:36:10', '2');
INSERT INTO `chatinfo` VALUES ('25', '1', '我们', '2018-07-07 15:40:25', '2');
INSERT INTO `chatinfo` VALUES ('26', '1', '我们', '2018-07-07 15:43:30', '2');
INSERT INTO `chatinfo` VALUES ('27', '1', '我们', '2018-07-07 15:45:44', '2');
INSERT INTO `chatinfo` VALUES ('28', '1', '我们', '2018-07-07 15:45:44', '2');
INSERT INTO `chatinfo` VALUES ('29', '1', '我们', '2018-07-07 15:45:45', '2');
INSERT INTO `chatinfo` VALUES ('30', '1', '我们', '2018-07-07 15:45:45', '2');
INSERT INTO `chatinfo` VALUES ('31', '1', '我们', '2018-07-07 15:45:45', '2');
INSERT INTO `chatinfo` VALUES ('32', '1', '我们', '2018-07-07 15:45:46', '2');
INSERT INTO `chatinfo` VALUES ('33', '1', '我们', '2018-07-07 15:45:46', '2');
INSERT INTO `chatinfo` VALUES ('34', '1', '我们', '2018-07-07 15:45:46', '2');
INSERT INTO `chatinfo` VALUES ('35', '1', '我们', '2018-07-07 15:45:46', '2');
INSERT INTO `chatinfo` VALUES ('36', '1', '我们', '2018-07-07 15:45:47', '2');
INSERT INTO `chatinfo` VALUES ('37', '2', '啦啦啦', '2018-07-07 15:55:53', '1');
INSERT INTO `chatinfo` VALUES ('38', '1', '我们', '2018-07-07 15:56:10', '2');
INSERT INTO `chatinfo` VALUES ('39', '1', '我们', '2018-07-07 15:56:15', '2');
INSERT INTO `chatinfo` VALUES ('40', '1', '我们', '2018-07-07 15:56:17', '2');
INSERT INTO `chatinfo` VALUES ('41', '1', '我们', '2018-07-07 15:56:19', '2');
INSERT INTO `chatinfo` VALUES ('42', '2', '零零零零', '2018-07-07 16:00:19', '1');
INSERT INTO `chatinfo` VALUES ('43', '2', '零零零零', '2018-07-07 16:00:26', '1');
INSERT INTO `chatinfo` VALUES ('44', '2', '零零', '2018-07-07 16:00:33', '1');
INSERT INTO `chatinfo` VALUES ('45', '2', '了', '2018-07-07 16:00:47', '1');
INSERT INTO `chatinfo` VALUES ('46', '2', '了', '2018-07-07 16:00:56', '1');
INSERT INTO `chatinfo` VALUES ('47', '2', '了', '2018-07-07 16:01:02', '1');
INSERT INTO `chatinfo` VALUES ('66', '2', '大撒大撒', '2018-07-08 18:57:58', '1');
INSERT INTO `chatinfo` VALUES ('67', '2', 'oooo', '2018-07-08 18:58:17', '1');
INSERT INTO `chatinfo` VALUES ('68', '2', 'dsada', '2018-07-08 18:59:15', '1');
INSERT INTO `chatinfo` VALUES ('70', '2', 'ddsadsadasd', '2018-07-08 19:07:26', '1');
INSERT INTO `chatinfo` VALUES ('71', '2', 'dsadsad', '2018-07-08 19:08:26', '1');
INSERT INTO `chatinfo` VALUES ('72', '2', 'dsasa', '2018-07-08 19:09:00', '1');
INSERT INTO `chatinfo` VALUES ('73', '2', 'dsada', '2018-07-08 19:10:25', '1');
INSERT INTO `chatinfo` VALUES ('74', '2', 'saddsadad', '2018-07-09 08:50:33', '1');
INSERT INTO `chatinfo` VALUES ('75', '1', 'pan你好', '2018-07-09 08:54:07', '2');
INSERT INTO `chatinfo` VALUES ('76', '2', '你好', '2018-07-09 08:59:51', '1');
INSERT INTO `chatinfo` VALUES ('77', '2', '你好', '2018-07-09 09:00:34', '1');
INSERT INTO `chatinfo` VALUES ('78', '2', '1', '2018-07-09 09:01:25', '1');
INSERT INTO `chatinfo` VALUES ('79', '1', '2', '2018-07-09 09:01:49', '2');
INSERT INTO `chatinfo` VALUES ('80', '1', '3', '2018-07-09 09:04:22', '2');
INSERT INTO `chatinfo` VALUES ('81', '1', '4', '2018-07-09 09:04:35', '2');
INSERT INTO `chatinfo` VALUES ('82', '2', '5', '2018-07-09 09:04:48', '1');
INSERT INTO `chatinfo` VALUES ('83', '1', '6', '2018-07-09 09:09:46', '2');
INSERT INTO `chatinfo` VALUES ('84', '1', '7', '2018-07-09 09:12:29', '2');
INSERT INTO `chatinfo` VALUES ('85', '2', '打算 多萨多萨多萨多萨多萨多萨多萨打算达到撒大', '2018-07-09 10:34:31', '1');
INSERT INTO `chatinfo` VALUES ('86', '2', '零零零零', '2018-07-09 10:37:36', '1');
INSERT INTO `chatinfo` VALUES ('87', '2', '零零零零', '2018-07-09 10:37:39', '1');
INSERT INTO `chatinfo` VALUES ('88', '2', 'llll', '2018-07-09 10:55:39', '1');
INSERT INTO `chatinfo` VALUES ('89', '2', 'llll', '2018-07-09 10:55:44', '1');
INSERT INTO `chatinfo` VALUES ('90', '2', '我峨嵋你', '2018-07-09 10:56:01', '1');
INSERT INTO `chatinfo` VALUES ('91', '2', '1', '2018-07-09 10:56:25', '1');
INSERT INTO `chatinfo` VALUES ('92', '2', '1', '2018-07-09 10:56:35', '1');
INSERT INTO `chatinfo` VALUES ('93', '2', '1', '2018-07-09 10:56:49', '1');
INSERT INTO `chatinfo` VALUES ('94', '2', '1', '2018-07-09 10:56:55', '1');
INSERT INTO `chatinfo` VALUES ('95', '2', '我们', '2018-07-09 10:57:06', '1');
INSERT INTO `chatinfo` VALUES ('96', '1', '你好啊', '2018-07-09 11:00:21', '2');
INSERT INTO `chatinfo` VALUES ('97', '2', '的撒旦          撒旦撒旦大撒大撒', '2018-07-09 11:01:56', '1');
INSERT INTO `chatinfo` VALUES ('98', '2', '的撒旦        撒旦撒旦大撒大撒', '2018-07-09 11:02:19', '1');
INSERT INTO `chatinfo` VALUES ('99', '2', '我们', '2018-07-09 11:04:11', '1');
INSERT INTO `chatinfo` VALUES ('100', '2', '健康酷酷酷酷酷酷酷酷酷酷酷酷酷酷酷酷酷', '2018-07-09 12:09:24', '1');
INSERT INTO `chatinfo` VALUES ('101', '2', '', '2018-07-09 13:35:18', '1');
INSERT INTO `chatinfo` VALUES ('102', '2', '撒旦撒旦', '2018-07-09 13:55:56', '1');
INSERT INTO `chatinfo` VALUES ('103', '2', '的萨达姆萨科', '2018-07-09 13:56:34', '1');
INSERT INTO `chatinfo` VALUES ('104', '2', '1', '2018-07-09 13:57:40', '1');
INSERT INTO `chatinfo` VALUES ('105', '2', '2', '2018-07-09 13:57:44', '1');
INSERT INTO `chatinfo` VALUES ('106', '2', '5', '2018-07-09 13:57:51', '1');
INSERT INTO `chatinfo` VALUES ('107', '2', '6', '2018-07-09 13:57:56', '1');
INSERT INTO `chatinfo` VALUES ('108', '1', '<div>大苏打的</div><div>的撒大</div>', '2018-07-09 13:58:41', '2');
INSERT INTO `chatinfo` VALUES ('109', '2', '大撒大撒按时<div>阿瑟东撒的</div>', '2018-07-09 13:58:52', '1');
INSERT INTO `chatinfo` VALUES ('110', '1', '大撒大撒大撒大撒', '2018-07-09 13:59:05', '2');
INSERT INTO `chatinfo` VALUES ('111', '1', '<div>大撒大撒</div><div>的撒大</div>', '2018-07-09 13:59:22', '2');
INSERT INTO `chatinfo` VALUES ('112', '2', '的撒大<div>的撒大</div>', '2018-07-09 13:59:31', '1');
INSERT INTO `chatinfo` VALUES ('113', '2', '我们', '2018-07-09 13:59:44', '1');
INSERT INTO `chatinfo` VALUES ('114', '2', '我<div>们</div>', '2018-07-09 13:59:52', '1');
INSERT INTO `chatinfo` VALUES ('115', '2', '你&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 们', '2018-07-09 14:11:46', '1');
INSERT INTO `chatinfo` VALUES ('116', '2', '你&nbsp; 们 稿', '2018-07-09 14:12:06', '1');
INSERT INTO `chatinfo` VALUES ('117', '2', '我们<div>不好</div>', '2018-07-09 14:12:13', '1');
INSERT INTO `chatinfo` VALUES ('118', '1', '<br>', '2018-07-09 14:15:02', '2');
INSERT INTO `chatinfo` VALUES ('119', '1', '<br>', '2018-07-09 14:15:04', '2');
INSERT INTO `chatinfo` VALUES ('120', '2', '111', '2018-07-09 14:15:58', '1');
INSERT INTO `chatinfo` VALUES ('121', '1', '啦啦啦', '2018-07-09 14:16:22', '2');
INSERT INTO `chatinfo` VALUES ('122', '1', '的撒旦撒旦', '2018-07-09 14:19:10', '2');
INSERT INTO `chatinfo` VALUES ('123', '1', '大撒大撒', '2018-07-09 14:20:03', '2');
INSERT INTO `chatinfo` VALUES ('124', '1', '<br>', '2018-07-09 14:20:29', '2');
INSERT INTO `chatinfo` VALUES ('125', '2', '1111', '2018-07-09 14:20:38', '1');
INSERT INTO `chatinfo` VALUES ('126', '1', '<div><br></div><div><br></div>', '2018-07-09 14:21:12', '2');
INSERT INTO `chatinfo` VALUES ('127', '1', '的撒大', '2018-07-09 14:23:56', '2');
INSERT INTO `chatinfo` VALUES ('128', '2', '大撒大撒', '2018-07-09 14:24:10', '1');
INSERT INTO `chatinfo` VALUES ('129', '2', '我么', '2018-07-09 14:30:04', '1');
INSERT INTO `chatinfo` VALUES ('130', '2', 'dsadsadas&nbsp;', '2018-07-09 14:40:07', '1');
INSERT INTO `chatinfo` VALUES ('131', '2', 'dsadsadsa', '2018-07-09 14:40:26', '1');
INSERT INTO `chatinfo` VALUES ('132', '2', 'dsdsa', '2018-07-09 14:44:26', '1');
INSERT INTO `chatinfo` VALUES ('133', '2', '1', '2018-07-09 14:45:39', '1');
INSERT INTO `chatinfo` VALUES ('134', '2', '1', '2018-07-09 14:47:20', '1');
INSERT INTO `chatinfo` VALUES ('135', '1', '1', '2018-07-09 14:47:31', '2');
INSERT INTO `chatinfo` VALUES ('136', '2', '1', '2018-07-09 14:48:00', '1');
INSERT INTO `chatinfo` VALUES ('137', '2', '1', '2018-07-09 14:48:32', '1');
INSERT INTO `chatinfo` VALUES ('138', '1', '2', '2018-07-09 14:48:37', '2');
INSERT INTO `chatinfo` VALUES ('139', '2', '1', '2018-07-09 14:51:02', '1');
INSERT INTO `chatinfo` VALUES ('140', '2', '2', '2018-07-09 14:53:49', '1');
INSERT INTO `chatinfo` VALUES ('141', '2', '3', '2018-07-09 14:59:03', '1');
INSERT INTO `chatinfo` VALUES ('153', '3', '是傻子', '2018-07-09 16:38:17', '1');
INSERT INTO `chatinfo` VALUES ('150', '3', '你好', '2018-07-09 16:37:37', '1');
INSERT INTO `chatinfo` VALUES ('151', '1', '哦哦', '2018-07-09 16:37:45', '3');
INSERT INTO `chatinfo` VALUES ('152', '1', '宋丽蓉是什么啊', '2018-07-09 16:38:11', '3');
INSERT INTO `chatinfo` VALUES ('154', '3', '你好啊', '2018-07-09 16:53:57', '1');
INSERT INTO `chatinfo` VALUES ('155', '1', '我还行吧', '2018-07-09 16:54:16', '3');
INSERT INTO `chatinfo` VALUES ('156', '1', '你好', '2018-07-09 17:41:28', '3');
INSERT INTO `chatinfo` VALUES ('157', '1', '11', '2018-07-09 17:43:02', '3');
INSERT INTO `chatinfo` VALUES ('158', '1', '2', '2018-07-09 17:43:29', '3');
INSERT INTO `chatinfo` VALUES ('159', '1', '3', '2018-07-09 17:43:35', '3');
INSERT INTO `chatinfo` VALUES ('160', '1', '4', '2018-07-09 17:43:46', '3');
INSERT INTO `chatinfo` VALUES ('161', '1', '5', '2018-07-09 17:47:27', '3');
INSERT INTO `chatinfo` VALUES ('162', '1', '6', '2018-07-09 17:47:46', '3');
INSERT INTO `chatinfo` VALUES ('163', '1', '7', '2018-07-09 17:48:50', '3');
INSERT INTO `chatinfo` VALUES ('164', '1', '8', '2018-07-09 17:53:05', '3');
INSERT INTO `chatinfo` VALUES ('165', '3', '9', '2018-07-09 17:53:18', '1');
INSERT INTO `chatinfo` VALUES ('166', '3', '10', '2018-07-09 17:53:54', '1');
INSERT INTO `chatinfo` VALUES ('167', '3', '11', '2018-07-09 17:54:16', '1');
INSERT INTO `chatinfo` VALUES ('168', '3', '12', '2018-07-09 17:54:24', '1');
INSERT INTO `chatinfo` VALUES ('169', '3', '13', '2018-07-09 17:54:56', '1');
INSERT INTO `chatinfo` VALUES ('170', '3', '14', '2018-07-09 17:55:02', '1');
INSERT INTO `chatinfo` VALUES ('171', '3', '15', '2018-07-09 17:56:40', '1');
INSERT INTO `chatinfo` VALUES ('172', '3', '16', '2018-07-09 17:56:52', '1');
INSERT INTO `chatinfo` VALUES ('173', '3', '17', '2018-07-09 17:57:04', '1');
INSERT INTO `chatinfo` VALUES ('174', '3', '18', '2018-07-09 17:57:15', '1');
INSERT INTO `chatinfo` VALUES ('175', '1', '19', '2018-07-09 17:57:43', '3');
INSERT INTO `chatinfo` VALUES ('176', '1', '20', '2018-07-09 17:57:51', '3');
INSERT INTO `chatinfo` VALUES ('177', '3', '21', '2018-07-09 17:58:03', '1');
INSERT INTO `chatinfo` VALUES ('178', '1', '22', '2018-07-09 17:58:13', '3');
INSERT INTO `chatinfo` VALUES ('179', '1', '23', '2018-07-09 17:58:37', '3');
INSERT INTO `chatinfo` VALUES ('180', '1', '23', '2018-07-09 17:58:42', '3');
INSERT INTO `chatinfo` VALUES ('181', '1', '24', '2018-07-09 17:58:49', '3');
INSERT INTO `chatinfo` VALUES ('182', '1', '30', '2018-07-09 17:59:17', '3');
INSERT INTO `chatinfo` VALUES ('183', '1', '31', '2018-07-09 17:59:47', '3');
INSERT INTO `chatinfo` VALUES ('184', '1', '33', '2018-07-09 18:00:53', '3');
INSERT INTO `chatinfo` VALUES ('185', '1', '35', '2018-07-09 18:01:20', '3');
INSERT INTO `chatinfo` VALUES ('186', '1', '37', '2018-07-09 18:01:34', '3');
INSERT INTO `chatinfo` VALUES ('187', '1', '38', '2018-07-09 18:01:52', '3');
INSERT INTO `chatinfo` VALUES ('188', '3', '40', '2018-07-09 18:02:05', '1');
INSERT INTO `chatinfo` VALUES ('189', '1', '3', '2018-07-09 18:02:38', '3');
INSERT INTO `chatinfo` VALUES ('190', '3', '5', '2018-07-09 18:02:52', '1');
INSERT INTO `chatinfo` VALUES ('191', '1', '哦哦哦', '2018-07-09 18:22:12', '3');
INSERT INTO `chatinfo` VALUES ('192', '3', 'lll', '2018-07-10 10:05:58', '1');
INSERT INTO `chatinfo` VALUES ('193', '1', 'ooo', '2018-07-10 10:06:14', '3');
INSERT INTO `chatinfo` VALUES ('194', '3', '1', '2018-07-10 10:19:51', '1');
INSERT INTO `chatinfo` VALUES ('195', '1', '2', '2018-07-10 10:20:20', '3');
INSERT INTO `chatinfo` VALUES ('196', '3', '3', '2018-07-10 10:20:29', '1');
INSERT INTO `chatinfo` VALUES ('197', '3', '5', '2018-07-10 10:20:36', '1');
INSERT INTO `chatinfo` VALUES ('198', '3', '6', '2018-07-10 10:28:06', '1');
INSERT INTO `chatinfo` VALUES ('199', '3', '7', '2018-07-10 10:28:13', '1');
INSERT INTO `chatinfo` VALUES ('200', '3', 'dsadadaddsa<div>dsadsadsa</div><div><br></div>', '2018-07-10 10:30:40', '1');
INSERT INTO `chatinfo` VALUES ('201', '1', '1', '2018-07-10 11:05:11', '3');
INSERT INTO `chatinfo` VALUES ('202', '1', '2', '2018-07-10 11:06:07', '3');
INSERT INTO `chatinfo` VALUES ('203', '3', '1', '2018-07-10 13:53:17', '1');
INSERT INTO `chatinfo` VALUES ('204', '3', '1', '2018-07-10 13:54:00', '1');
INSERT INTO `chatinfo` VALUES ('205', '3', '2', '2018-07-10 13:55:00', '1');
INSERT INTO `chatinfo` VALUES ('206', '3', '你们', '2018-07-10 13:58:53', '1');
INSERT INTO `chatinfo` VALUES ('207', '2', '10', '2018-07-10 13:59:08', '1');
INSERT INTO `chatinfo` VALUES ('208', '2', '11', '2018-07-10 14:03:10', '1');
INSERT INTO `chatinfo` VALUES ('209', '2', '12', '2018-07-10 14:03:56', '1');
INSERT INTO `chatinfo` VALUES ('210', '2', '13', '2018-07-10 14:04:02', '1');
INSERT INTO `chatinfo` VALUES ('211', '2', '14', '2018-07-10 14:23:51', '1');
INSERT INTO `chatinfo` VALUES ('212', '2', '15', '2018-07-10 14:29:09', '1');
INSERT INTO `chatinfo` VALUES ('213', '2', '16', '2018-07-10 14:29:35', '1');
INSERT INTO `chatinfo` VALUES ('214', '3', '好', '2018-07-10 14:31:14', '1');
INSERT INTO `chatinfo` VALUES ('215', '1', '19', '2018-07-10 14:32:13', '2');
INSERT INTO `chatinfo` VALUES ('216', '1', '20', '2018-07-10 14:32:24', '2');
INSERT INTO `chatinfo` VALUES ('217', '1', '21', '2018-07-10 14:35:45', '2');
INSERT INTO `chatinfo` VALUES ('218', '1', '22', '2018-07-10 14:36:18', '2');
INSERT INTO `chatinfo` VALUES ('219', '1', '<div>30<br></div>', '2018-07-10 14:37:20', '2');
INSERT INTO `chatinfo` VALUES ('220', '1', '<div>dsada</div><div><br></div><div><br></div><div>dsadsa</div>', '2018-07-10 14:39:43', '2');
INSERT INTO `chatinfo` VALUES ('221', '1', '99', '2018-07-10 14:40:51', '2');
INSERT INTO `chatinfo` VALUES ('222', '1', '100', '2018-07-10 14:42:09', '2');
INSERT INTO `chatinfo` VALUES ('223', '1', '101', '2018-07-10 14:42:27', '2');
INSERT INTO `chatinfo` VALUES ('224', '1', '99', '2018-07-10 14:42:34', '2');
INSERT INTO `chatinfo` VALUES ('225', '1', 'o', '2018-07-10 14:42:50', '2');
INSERT INTO `chatinfo` VALUES ('226', '3', '1', '2018-07-10 14:42:58', '1');
INSERT INTO `chatinfo` VALUES ('227', '1', '1', '2018-07-10 14:43:05', '2');
INSERT INTO `chatinfo` VALUES ('228', '1', 'l', '2018-07-10 14:44:24', '2');
INSERT INTO `chatinfo` VALUES ('229', '1', '11', '2018-07-10 14:57:52', '2');
INSERT INTO `chatinfo` VALUES ('230', '3', '1', '2018-07-10 14:58:04', '1');
INSERT INTO `chatinfo` VALUES ('231', '1', '111', '2018-07-10 14:58:16', '2');
INSERT INTO `chatinfo` VALUES ('232', '1', '111', '2018-07-10 14:58:24', '2');
INSERT INTO `chatinfo` VALUES ('233', '1', '11', '2018-07-10 14:58:44', '2');
INSERT INTO `chatinfo` VALUES ('234', '1', '12', '2018-07-10 14:58:55', '2');
INSERT INTO `chatinfo` VALUES ('235', '3', '1', '2018-07-10 14:59:03', '1');
INSERT INTO `chatinfo` VALUES ('236', '1', '12', '2018-07-10 14:59:09', '2');
INSERT INTO `chatinfo` VALUES ('237', '1', '13', '2018-07-10 14:59:21', '2');
INSERT INTO `chatinfo` VALUES ('238', '1', '1', '2018-07-10 15:00:19', '2');
INSERT INTO `chatinfo` VALUES ('239', '3', '1', '2018-07-10 15:00:24', '1');
INSERT INTO `chatinfo` VALUES ('240', '1', '1', '2018-07-10 15:00:38', '2');
INSERT INTO `chatinfo` VALUES ('241', '3', '2', '2018-07-10 15:02:17', '1');
INSERT INTO `chatinfo` VALUES ('242', '1', '2', '2018-07-10 15:02:25', '2');
INSERT INTO `chatinfo` VALUES ('243', '3', '1', '2018-07-10 15:03:13', '1');
INSERT INTO `chatinfo` VALUES ('244', '1', '1', '2018-07-10 15:03:22', '2');
INSERT INTO `chatinfo` VALUES ('245', '1', '你好', '2018-07-10 15:27:14', '2');
INSERT INTO `chatinfo` VALUES ('246', '1', '呸呸呸', '2018-07-10 15:28:42', '2');
INSERT INTO `chatinfo` VALUES ('247', '1', '啦啦啦', '2018-07-10 15:29:34', '2');
INSERT INTO `chatinfo` VALUES ('248', '1', '111', '2018-07-10 15:31:17', '2');
INSERT INTO `chatinfo` VALUES ('249', '1', '<div>我</div><div>们呢</div>', '2018-07-10 15:34:31', '2');
INSERT INTO `chatinfo` VALUES ('250', '1', '<div>哦</div><div>哦</div><div>哦</div>', '2018-07-10 15:56:53', '2');
INSERT INTO `chatinfo` VALUES ('251', '1', '<div>22</div><div>22</div><div>2</div><div>2</div>', '2018-07-10 15:57:35', '2');
INSERT INTO `chatinfo` VALUES ('252', '2', '1', '2018-07-10 15:58:50', '1');
INSERT INTO `chatinfo` VALUES ('253', '2', '2<div>2<div>2</div></div>', '2018-07-10 15:58:59', '1');
INSERT INTO `chatinfo` VALUES ('254', '1', '<div>oo</div><div>o</div>', '2018-07-10 16:02:54', '2');
INSERT INTO `chatinfo` VALUES ('255', '1', '<div>哦哦</div><div>哦</div>', '2018-07-10 16:03:23', '2');
INSERT INTO `chatinfo` VALUES ('256', '1', '1', '2018-07-10 16:03:30', '2');
INSERT INTO `chatinfo` VALUES ('257', '1', '111', '2018-07-10 16:03:57', '2');
INSERT INTO `chatinfo` VALUES ('258', '1', '2', '2018-07-10 16:04:07', '2');
INSERT INTO `chatinfo` VALUES ('259', '1', '2', '2018-07-10 16:05:06', '2');
INSERT INTO `chatinfo` VALUES ('260', '2', '1', '2018-07-10 16:05:55', '1');
INSERT INTO `chatinfo` VALUES ('261', '1', '2', '2018-07-10 16:06:21', '2');
INSERT INTO `chatinfo` VALUES ('262', '1', '<div>哦哦</div><div>哦</div>', '2018-07-10 16:06:27', '2');
INSERT INTO `chatinfo` VALUES ('263', '1', '的萨满打卡NSA可能的撒旦没看到什么撒门口的撒啊的马克思的阿瑟东马卡萨的ask麦达克斯的看来没打算库某的凯撒吗', '2018-07-10 16:06:41', '2');
INSERT INTO `chatinfo` VALUES ('264', '2', '老子没看见', '2018-07-10 16:15:52', '1');
INSERT INTO `chatinfo` VALUES ('265', '1', '没看见就没看见把', '2018-07-10 16:16:04', '2');
INSERT INTO `chatinfo` VALUES ('266', '3', 'e', '2018-07-10 16:18:55', '1');
INSERT INTO `chatinfo` VALUES ('267', '2', 'e', '2018-07-10 16:19:22', '1');
INSERT INTO `chatinfo` VALUES ('268', '2', '4', '2018-07-10 16:19:33', '1');
INSERT INTO `friends` VALUES ('4', '2', '宋', '1', '2', '20180707104234', '0', '4', '1533889173595');
INSERT INTO `friends` VALUES ('5', '1', 'pan', '2', '2', '20180707104234', '0', '4', '1533889173595');
INSERT INTO `friends` VALUES ('9', '3', 'zhi', '1', '2', '20180709152348', '0', 'e', '1533889135984');
INSERT INTO `friends` VALUES ('10', '1', 'pan', '3', '2', '20180709152348', '0', 'e', '1533889135984');
INSERT INTO `userinfo` VALUES ('1', 'pjb123', '13220289300', 'pjb123', '0', 'http://localhost:1701/userlogo-1516156209645.png', 'pan', null, 'jiTXSoBItWSK1hYjAAA1');
INSERT INTO `userinfo` VALUES ('2', 'slr123', '13111111111', 'slr123', '1', 'http://localhost:1701/avatar.jpg', 'song', null, 'LxHdRjJhIa1ye8XGAAAl');
INSERT INTO `userinfo` VALUES ('3', 'zxd123', '13220289333', 'zxd123', '0', 'http://localhost:1701/avatar.jpg', 'zhi', null, 'JdFOvUTHnwyv9SfzAAA0');
