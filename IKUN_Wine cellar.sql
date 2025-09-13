/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50517
 Source Host           : localhost:3306
 Source Schema         : IKUN_library

 Target Server Type    : MySQL
 Target Server Version : 50517
 File Encoding         : 65001

 Date: 17/09/2022 13:35:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_book
-- ----------------------------
DROP TABLE IF EXISTS `tbl_book`;
CREATE TABLE `tbl_book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `publication_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last` int(11) NULL DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `isbn`(`isbn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_book
-- ----------------------------
INSERT INTO `tbl_book` VALUES (1, '9787229042066', '五粮春', '2018', '系五粮浓香战略品牌', '宜宾五粮液', '18', 28, NULL);
INSERT INTO `tbl_book` VALUES (2, '9787108009821', '1618五粮液', '2018', '入口甘美/香味谐调', '宜宾五粮液', '16', 32, '见微知著');
INSERT INTO `tbl_book` VALUES (3, '9787200065039', '五粮特曲', '2021', '系五粮浓香战略品牌', '宜宾五粮液', '17', 15, NULL);
INSERT INTO `tbl_book` VALUES (4, '9787506365437', '五粮醇·臻选10', '2022', '系五粮浓香战略品牌', '宜宾五粮液', '10', 26, NULL);
INSERT INTO `tbl_book` VALUES (5, '9787544253994', '501五粮液·明池酿造', '2010', '限定窖池/限定匠人/限定车间', '宜宾五粮液', '15', 42, '来自五粮液501车间明清古窖池');
INSERT INTO `tbl_book` VALUES (6, '9787020008728', '经典五粮液', '2014', '天地精酿/十年精陈', '宜宾五粮液', '25', 53, '经典');
INSERT INTO `tbl_book` VALUES (7, '9787020042494', '五粮液·缘定晶生', '2022', '浪漫限定', '宜宾五粮液', '24', 8, NULL);
INSERT INTO `tbl_book` VALUES (8, '9787537823425', '五粮液·九龙坛', '2014', '由五粮液携手故宫博物馆共同打造', '宜宾五粮液', '12', 5, '文化性白酒收藏品');
INSERT INTO `tbl_book` VALUES (10, '9787229042066', '五粮液·封坛藏酒', '2021', '明代古窖酿造', '宜宾五粮液', '18', 2, '青花坛');
INSERT INTO `tbl_book` VALUES (12, '9787200065039', '新时代·国运昌', '2018', '祝福祖国', '宜宾五粮液', '18', 5, '致敬时代');
INSERT INTO `tbl_book` VALUES (16, '9787020008728', '五粮液·十二生肖', '2012', '中国十二生肖文化设计', '宜宾五粮液', '19', 24, '纪念版');
INSERT INTO `tbl_book` VALUES (17, '9787020042498', '五粮液·万店浓香', '2018', '纪念俄罗斯世界杯', '宜宾五粮液', '20', 8, '足球文化纪念酒');
INSERT INTO `tbl_book` VALUES (18, '9787537823425', '百年世博·世纪荣耀', '2015', '纪念米兰世博会', '宜宾五粮液', '12', 5, '收藏纪念酒');
INSERT INTO `tbl_book` VALUES (52, '9887557843225', '千红葡萄酒', '2015', '特选赤霞珠', '宜宾春秋酒业', '8', 75, NULL);
INSERT INTO `tbl_book` VALUES (53, '9897537823455', '柏漠庄园', '2022', '紫秋红葡萄酒', '宜宾仙林果酒', '12', 25, NULL);
INSERT INTO `tbl_book` VALUES (78, '9937537823125', '亚洲红石榴', '2020', '新鲜红石榴酿造', '宜宾仙林果酒', '12', 43, NULL);
INSERT INTO `tbl_book` VALUES (82, '9957535323425', '熊猫红酒', '2019', '设计独特', '宜宾五粮液', '16', 15, NULL);
INSERT INTO `tbl_book` VALUES (96, '9997537862425', '宜东方', '2015', '酱香型', '宜宾春秋酒业', '12', 35, NULL);


-- ----------------------------
-- Table structure for tbl_borrow
-- ----------------------------
DROP TABLE IF EXISTS `tbl_borrow`;
CREATE TABLE `tbl_borrow`  (
  `isbn_log` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bookname_log` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `readerid_log` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `readername_log` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cardid_log` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(15) NOT NULL DEFAULT 1,
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `isbn_log`(`isbn_log`) USING BTREE,
  INDEX `readerid_log`(`readerid_log`) USING BTREE,
  CONSTRAINT `isbn_log` FOREIGN KEY (`isbn_log`) REFERENCES `tbl_book` (`isbn`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tbl_borrow_ibfk_1` FOREIGN KEY (`readerid_log`) REFERENCES `tbl_reader` (`reader_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_borrow
-- ----------------------------
INSERT INTO `tbl_borrow` VALUES ('9787229042066', '五粮春', '202005003', '苏珊', '301002', 4, 2);
INSERT INTO `tbl_borrow` VALUES ('9787229042066', '五粮春', '202005003', '苏珊', '301002', 1, 3);
INSERT INTO `tbl_borrow` VALUES ('9787229042066', '五粮春', '202005003', '苏珊', '301002', 1, 4);
INSERT INTO `tbl_borrow` VALUES ('9787108009821', '1618五粮液', '202005008', '沙石给', '201001', 8, 5);
INSERT INTO `tbl_borrow` VALUES ('9787200065039', '五粮特曲', '202005008', '沙石给', '201001', 1, 18);
INSERT INTO `tbl_borrow` VALUES ('9787200065039', '五粮特曲', '202005003', '苏珊', '301002', 1, 19);
INSERT INTO `tbl_borrow` VALUES ('9787200065039', '五粮特曲', '202005003', '苏珊', '301002', 1, 20);
INSERT INTO `tbl_borrow` VALUES ('9787200065039', '五粮特曲', '202005001', '那撸多', '1010026',1, 21);
INSERT INTO `tbl_borrow` VALUES ('9787200065039', '五粮特曲', '203652606', '马西西', '260355551', 1, 22);
INSERT INTO `tbl_borrow` VALUES ('9787544253994', '501五粮液·明池酿造', '202005002', '蔡徐坤', '202032', 1, 23);
INSERT INTO `tbl_borrow` VALUES ('9787544253994', '501五粮液·明池酿造', '202005002', '蔡徐坤', '202032', 1, 24);
INSERT INTO `tbl_borrow` VALUES ('9787544253994', '501五粮液·明池酿造', '202005008', '沙石给', '201001', 1, 25);
INSERT INTO `tbl_borrow` VALUES ('9787544253994', '501五粮液·明池酿造', '203652606', '马西西', '260355551', 1, 26);
INSERT INTO `tbl_borrow` VALUES ('9787544253994', '501五粮液·明池酿造', '203652606', '马西西', '260355551', 1, 27);
INSERT INTO `tbl_borrow` VALUES ('9937537823125', '亚洲红石榴', '202005003', '苏珊', '301002', 1, 28);
INSERT INTO `tbl_borrow` VALUES ('9937537823125', '亚洲红石榴', '202005003', '苏珊', '301002', 1, 29);
INSERT INTO `tbl_borrow` VALUES ('9937537823125', '亚洲红石榴', '202005008', '沙石给', '201001', 1, 30);
INSERT INTO `tbl_borrow` VALUES ('9937537823125', '亚洲红石榴', '202005003', '苏珊', '301002', 1, 31);
INSERT INTO `tbl_borrow` VALUES ('9937537823125', '亚洲红石榴', '202005008', '沙石给', '201001', 1, 32);
INSERT INTO `tbl_borrow` VALUES ('9937537823125', '亚洲红石榴', '202005001', '那撸多', '1010026', 1, 33);
INSERT INTO `tbl_borrow` VALUES ('9937537823125', '亚洲红石榴', '202005003', '苏珊', '301002', 1, 34);
INSERT INTO `tbl_borrow` VALUES ('9937537823125', '亚洲红石榴', '202005003', '苏珊', '301002', 1, 35);
INSERT INTO `tbl_borrow` VALUES ('9937537823125', '亚洲红石榴', '202005008', '沙石给', '201001', 1, 36);
INSERT INTO `tbl_borrow` VALUES ('9937537823125', '亚洲红石榴', '202005001', '那撸多', '1010026', 1, 37);
INSERT INTO `tbl_borrow` VALUES ('9997537862425', '宜东方', '202005003', '苏珊', '301002', 1, 38);
INSERT INTO `tbl_borrow` VALUES ('9997537862425', '宜东方', '203652606', '马西西', '260355551', 1, 39);
INSERT INTO `tbl_borrow` VALUES ('9997537862425', '宜东方', '203652606', '马西西', '260355551', 1, 40);
INSERT INTO `tbl_borrow` VALUES ('9997537862425', '宜东方', '202005003', '苏珊', '301002', 1, 41);
INSERT INTO `tbl_borrow` VALUES ('9997537862425', '宜东方', '202005001', '那撸多', '1010026', 1, 42);
INSERT INTO `tbl_borrow` VALUES ('9787020042494', '五粮液·缘定晶生', '203652606', '马西西', '260355551', 1, 43);
INSERT INTO `tbl_borrow` VALUES ('9787020042494', '五粮液·缘定晶生', '202005002', '蔡徐坤', '202032', 1, 44);
INSERT INTO `tbl_borrow` VALUES ('9787020042494', '五粮液·缘定晶生', '202005002', '蔡徐坤', '202032', 1, 45);
INSERT INTO `tbl_borrow` VALUES ('9787020042494', '五粮液·缘定晶生', '202005001', '那撸多', '1010026', 1, 46);
INSERT INTO `tbl_borrow` VALUES ('9787020042494', '五粮液·缘定晶生', '203652606', '马西西', '260355551', 1, 47);
INSERT INTO `tbl_borrow` VALUES ('9787229042066', '五粮液·封坛藏酒', '203652606', '马西西', '260355551', 1, 48);
INSERT INTO `tbl_borrow` VALUES ('9787229042066', '五粮液·封坛藏酒', '202005002', '蔡徐坤', '202032',1, 49);
INSERT INTO `tbl_borrow` VALUES ('9787200065039', '新时代·国运昌', '202005001', '那撸多', '1010026', 1, 50);
INSERT INTO `tbl_borrow` VALUES ('9787200065039', '新时代·国运昌', '202005003', '苏珊', '301002', 1, 51);
INSERT INTO `tbl_borrow` VALUES ('9787200065039', '新时代·国运昌', '202005002', '蔡徐坤', '202032', 1, 52);
INSERT INTO `tbl_borrow` VALUES ('9787537823425', '百年世博·世纪荣耀', '202005008', '沙石给', '201001', 1, 53);
INSERT INTO `tbl_borrow` VALUES ('9787537823425', '百年世博·世纪荣耀', '202005001', '那撸多', '1010026', 1, 54);
INSERT INTO `tbl_borrow` VALUES ('9787537823425', '百年世博·世纪荣耀', '203652606', '马西西', '260355551', 1, 55);
INSERT INTO `tbl_borrow` VALUES ('9787537823425', '百年世博·世纪荣耀', '202005002', '蔡徐坤', '202032', 1, 56);
INSERT INTO `tbl_borrow` VALUES ('9787537823425', '百年世博·世纪荣耀','202005002', '蔡徐坤', '202032', 1, 57);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '经典五粮液', '202005008', '沙石给', '201001', 1, 58);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '经典五粮液', '203652606', '马西西', '260355551', 1, 59);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '经典五粮液', '203652606', '马西西', '260355551', 1, 60);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '经典五粮液', '202005001', '那撸多', '1010026', 1, 61);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '经典五粮液', '202005001', '那撸多', '1010026', 1, 62);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '经典五粮液', '202005008', '沙石给', '201001', 1, 63);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '经典五粮液', '202005008', '沙石给', '201001', 1, 64);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '经典五粮液', '202005003', '苏珊', '301002', 1, 65);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '经典五粮液', '202005003', '苏珊', '301002', 1, 66);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '经典五粮液', '202005003', '苏珊', '301002', 1, 67);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '五粮液·十二生肖', '202005002', '蔡徐坤', '202032', 1, 68);
INSERT INTO `tbl_borrow` VALUES ('9787020008728', '五粮液·十二生肖', '203652606', '马西西', '260355551', 1, 69);
INSERT INTO `tbl_borrow` VALUES ('9957535323425', '熊猫红酒', '202005001', '那撸多', '1010026', 1, 70);
INSERT INTO `tbl_borrow` VALUES ('9957535323425', '熊猫红酒', '202005008', '沙石给', '201001', 1, 71);
INSERT INTO `tbl_borrow` VALUES ('9957535323425', '熊猫红酒', '202005003', '苏珊', '301002', 1, 72);
INSERT INTO `tbl_borrow` VALUES ('9787020042498', '五粮液·万店浓香', '202005002', '蔡徐坤', '202032', 1, 73);
INSERT INTO `tbl_borrow` VALUES ('9787020042498', '五粮液·万店浓香', '202005002', '蔡徐坤', '202032', 1, 74);
INSERT INTO `tbl_borrow` VALUES ('9787020042498', '五粮液·万店浓香', '202005003', '苏珊', '301002', 1, 75);
INSERT INTO `tbl_borrow` VALUES ('9887557843225', '千红葡萄酒', '203652606', '马西西', '260355551', 1, 76);
INSERT INTO `tbl_borrow` VALUES ('9887557843225', '千红葡萄酒', '202005008', '沙石给', '201001', 1, 77);
INSERT INTO `tbl_borrow` VALUES ('9887557843225', '千红葡萄酒', '202005008', '沙石给', '201001', 1, 78);
INSERT INTO `tbl_borrow` VALUES ('9887557843225', '千红葡萄酒', '202005003', '202005003', '苏珊', '301002', 1, 79);
INSERT INTO `tbl_borrow` VALUES ('9787537823425', '五粮液·九龙坛', '202005002', '蔡徐坤', '202032', 1, 80);
INSERT INTO `tbl_borrow` VALUES ('9787537823425', '五粮液·九龙坛', '202005002', '蔡徐坤', '202032', 1, 81);
INSERT INTO `tbl_borrow` VALUES ('9787537823425', '五粮液·九龙坛', '202005002', '蔡徐坤', '202032', 1, 82);
INSERT INTO `tbl_borrow` VALUES ('9787229042066', '五粮春', '202005002', '蔡徐坤', '202032', 1, 83);



-- ----------------------------
-- Table structure for tbl_reader
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reader`;
CREATE TABLE `tbl_reader`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `reader_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reader_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_id` int(32) NULL DEFAULT NULL,
  `education` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reader_id`(`reader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_reader
-- ----------------------------
INSERT INTO `tbl_reader` VALUES (2, '202005002', '蔡徐坤', 202032, '一级酒窖管理员', '2020-06-09');
INSERT INTO `tbl_reader` VALUES (3, '202005003', '苏珊', 301002, '三级酒窖管理员', '2020-06-09');
INSERT INTO `tbl_reader` VALUES (5, '202005008', '沙石给', 201001, '三级酒窖管理员', '2020-06-09');
INSERT INTO `tbl_reader` VALUES (6, '202005001', '那撸多', 1010026, '三级酒窖管理员', '2020-06-09');
INSERT INTO `tbl_reader` VALUES (7, '203652606', '马西西', 260355551, '二级酒窖管理员', '2022-09-07');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, '0001', 'admin', '超级管理员', '123456', '1', '2020-06-08');

SET FOREIGN_KEY_CHECKS = 1;
