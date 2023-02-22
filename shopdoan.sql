/*
 Navicat Premium Data Transfer

 Source Server         : db
 Source Server Type    : MySQL
 Source Server Version : 100427 (10.4.27-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : shopdoan

 Target Server Type    : MySQL
 Target Server Version : 100427 (10.4.27-MariaDB)
 File Encoding         : 65001

 Date: 15/02/2023 10:16:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USERS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PASS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ID_USER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STATUSS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_BLOCK` bit(1) NULL DEFAULT NULL,
  `EMAIL` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AVATAR` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ACCOUNT`, `ID_USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('ACC1', 'THOAIHUU', '123456', 'USER1', 'HOẠT ĐỘNG', b'0', 'THOAIHUU291@GMAIL.COM', 'img/avt1.jpg');
INSERT INTO `account` VALUES ('ACC2', 'QUANGVU', '123456', 'USER2', 'HOẠT ĐỘNG', b'0', 'QUANGVU@GMAIL.COM', 'img/avt1.jpg');
INSERT INTO `account` VALUES ('ACC3', 'LONGVU', '123456', 'USER3', 'HOẠT ĐỘNG', b'0', 'LONGVU@GMAIL.COM', 'img/avt1.jpg');
INSERT INTO `account` VALUES ('ACC4', 'LongVu123', '123456', 'USER4', 'HOẠT ĐỘNG', b'0', 'daolongvu86@gmail.com', 'img/cupvangWC.jpg');

-- ----------------------------
-- Table structure for addresss
-- ----------------------------
DROP TABLE IF EXISTS `addresss`;
CREATE TABLE `addresss`  (
  `ID_ADDRESS` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `COMMUNE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISTRICT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDRESS_DETAILS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ADDRESS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of addresss
-- ----------------------------
INSERT INTO `addresss` VALUES ('ADD1', 'CẨM SƠN', 'MỎ CÀY NAM', 'BẾN TRE', 'ẤP 10');
INSERT INTO `addresss` VALUES ('ADD2', 'XXX', 'XXX', 'ĐỒNG NAI', 'ẤP 6');
INSERT INTO `addresss` VALUES ('ADD3', 'XXX', 'XXX', 'BÌNH PHƯỚC', 'ẤP 7');
INSERT INTO `addresss` VALUES ('ADD4', '', '', '', '');

-- ----------------------------
-- Table structure for assessment
-- ----------------------------
DROP TABLE IF EXISTS `assessment`;
CREATE TABLE `assessment`  (
  `ID_ASSESSMENT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TYPE_EVALUATE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_FOOD` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ASSESSMENT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assessment
-- ----------------------------
INSERT INTO `assessment` VALUES ('ASS1', 'MÓN CƠM NÀY NGON CỰC', 'TOT', 'CƠM GÀ1');

-- ----------------------------
-- Table structure for assessment_detail
-- ----------------------------
DROP TABLE IF EXISTS `assessment_detail`;
CREATE TABLE `assessment_detail`  (
  `ID_ASSESSMENT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSESSMENT_TIME` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assessment_detail
-- ----------------------------
INSERT INTO `assessment_detail` VALUES ('ASS1', 'ACC1', '0000-00-00');

-- ----------------------------
-- Table structure for favourite
-- ----------------------------
DROP TABLE IF EXISTS `favourite`;
CREATE TABLE `favourite`  (
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_FOOD`, `ID_ACCOUNT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favourite
-- ----------------------------
INSERT INTO `favourite` VALUES ('CƠM GÀ6', 'ACC1');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FOOD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_SIZE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LISTED_PRICE` int NULL DEFAULT NULL,
  `TYPE_FOOD` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `QUANTITY` int NULL DEFAULT NULL,
  `STATUSS` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_COMBO` bit(1) NULL DEFAULT NULL,
  `ID_SALE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_HOT` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `L_IMG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `BASE_PRICE` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_FOOD`, `ID_SIZE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('CƠM BÒ1', 'Cơm bò nướng đậu que', 'SIZE2', 57000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/1combo_nuongdauque-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ10', 'Cơm bò ngũ vị sốt kem', 'SIZE1', 60000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/10combo_nguvisotkem-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ10', 'Cơm bò ngũ vị sốt kem', 'SIZE2', 60000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/10combo_nguvisotkem-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ11', 'Cơm bò kim chi pho mai', 'SIZE1', 60000, 'CƠM BÒ', 48, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/11combo_kimchiphomai-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ11', 'Cơm bò kim chi pho mai', 'SIZE2', 60000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/11combo_kimchiphomai-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ12', 'Cơm bò bông cải', 'SIZE1', 60000, 'CƠM BÒ', 48, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/12combo_bongcai-min.jpg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ12', 'Cơm bò bông cải', 'SIZE2', 60000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/12combo_bongcai-min.jpg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ2', 'Cơm bò hầm trứng lòng đào', 'SIZE1', 58000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/2combo_bohamtrunglongdao-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ2', 'Cơm bò hầm trứng lòng đào', 'SIZE2', 58000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/2combo_bohamtrunglongdao-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ3', 'Cơm bò hầm', 'SIZE1', 55000, 'CƠM BÒ', 48, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm n	gon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/3combo_boham-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ3', 'Cơm bò hầm', 'SIZE2', 55000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm n	gon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/3combo_boham-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ4', 'Cơm bò nướng trứng lòng đào', 'SIZE1', 62000, 'CƠM BÒ', 49, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/4combo_bonuongtrunglongdao-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ4', 'Cơm bò nướng trứng lòng đào', 'SIZE2', 62000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/4combo_bonuongtrunglongdao-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ5', 'Cơm bò nướng Osaka', 'SIZE1', 59000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/5combo_bonuongOsaka-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ5', 'Cơm bò nướng Osaka', 'SIZE2', 59000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/5combo_bonuongOsaka-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ6', 'Cơm bò lươn nướng', 'SIZE1', 74000, 'CƠM BÒ', 49, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/6combo_luonnuong-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ6', 'Cơm bò lươn nướng', 'SIZE2', 74000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/6combo_luonnuong-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ7', 'Cơm bò lươn nướng phô mai', 'SIZE1', 80000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'1', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/7combo_luongnuong_phomai-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ7', 'Cơm bò lươn nướng phô mai', 'SIZE2', 80000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/7combo_luongnuong_phomai-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ8', 'Cơm bò Bulgogi nhỏ', 'SIZE1', 50000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/8combo_bulgogi_nho-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ8', 'Cơm bò Bulgogi nhỏ', 'SIZE2', 50000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/8combo_bulgogi_nho-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ9', 'Cơm bò Bulgogi', 'SIZE1', 60000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/9combo_bulgogi_lon-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM BÒ9', 'Cơm bò Bulgogi', 'SIZE2', 60000, 'CƠM BÒ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComBo/9combo_bulgogi_lon-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM CHIÊN1', 'Cơm Chiên', 'SIZE1', 40000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/1comchien-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN1', 'Cơm Chiên', 'SIZE2', 40000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/1comchien-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN10', 'Cơm chiên dương châu', 'SIZE1', 52000, 'CƠM CHIÊN', 49, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/10comchine_duongchau-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN10', 'Cơm chiên dương châu', 'SIZE2', 52000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/10comchine_duongchau-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN11', 'Cơm chiên đùi gà', 'SIZE1', 55000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'1', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/11comchien_duiga-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN11', 'Cơm chiên đùi gà', 'SIZE2', 55000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/11comchien_duiga-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN12', 'Cơm chiên bò xào dưa ', 'SIZE1', 55000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/12comchien_duabo-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN12', 'Cơm chiên bò xào dưa ', 'SIZE2', 55000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/12comchien_duabo-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN2', 'Cơm chiên thịt', 'SIZE1', 45000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'1', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/2comchien_thit-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN2', 'Cơm chiên thịt', 'SIZE2', 45000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/2comchien_thit-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN3', 'Cơm chiên thập cẩm', 'SIZE1', 49000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/3comchien_thapcam-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN3', 'Cơm chiên thập cẩm', 'SIZE2', 49000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/3comchien_thapcam-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN4', 'Mì trộn', 'SIZE1', 45000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/4cowmchine_mitron-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN4', 'Mì trộn', 'SIZE2', 45000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Comchien/4cowmchine_mitron-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN5', 'Cơm chiên bò lúc lắc', 'SIZE1', 69000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/5comchien_boluclac-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN5', 'Cơm chiên bò lúc lắc', 'SIZE2', 69000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/5comchien_boluclac-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN6', 'Cơm chiên da gà', 'SIZE1', 55000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/6comchien_daga-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN6', 'Cơm chiên da gà', 'SIZE2', 55000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/6comchien_daga-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN7', 'Cơm chiên Linh Động', 'SIZE1', 55000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/7comchien_lindong-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN7', 'Cơm chiên Linh Động', 'SIZE2', 55000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/7comchien_lindong-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN8', 'Cơm chiên hải sản', 'SIZE1', 59000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/8comchien_haisan-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN8', 'Cơm chiên hải sản', 'SIZE2', 59000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/8comchien_haisan-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN9', 'Cơm chiên cá mặn', 'SIZE1', 49000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'1', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/9comchien_caman-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM CHIÊN9', 'Cơm chiên cá mặn', 'SIZE2', 49000, 'CƠM CHIÊN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComChien/9comchien_caman-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ1', 'Cơm gà A Quảng', 'SIZE1', 60000, 'CƠM GÀ', 46, 'CÒN HÀNG', b'0', 'SALE1', 'HOT', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/GiamGia/1comga_aquang-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM GÀ1', 'Cơm gà A Quảng', 'SIZE2', 60000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE1', 'HOT', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/GiamGia/1comga_aquang-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM GÀ10', 'Cơm gà xối mỡ T99', 'SIZE1', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/10Comga_xoimoT99-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ10', 'Cơm gà xối mỡ T99', 'SIZE2', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/10Comga_xoimoT99-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ11', 'Cơm gà xối mỡ TC', 'SIZE1', 48000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/11Comga_xoimoTC-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ11', 'Cơm gà xối mỡ TC', 'SIZE2', 48000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/11Comga_xoimoTC-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ12', 'Cơm gà chiên nước mắm', 'SIZE1', 47000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/12comga_chiennuocmam-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ12', 'Cơm gà chiên nước mắm', 'SIZE2', 47000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/12comga_chiennuocmam-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ2', 'Cơm gà da giòn', 'SIZE1', 60000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE1', 'HOT', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/GiamGia/2comga_dagion-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM GÀ2', 'Cơm gà da giòn', 'SIZE2', 60000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE1', 'HOT', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/GiamGia/2comga_dagion-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM GÀ3', 'Cơm gà Đệ Nhất', 'SIZE1', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/3comga_denhat-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ3', 'Cơm gà Đệ Nhất', 'SIZE2', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/3comga_denhat-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ4', 'Cơm gà rán', 'SIZE1', 60000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE1', 'HOT', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/4comga_garanjpeg-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM GÀ4', 'Cơm gà rán', 'SIZE2', 60000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE1', 'HOT', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/4comga_garanjpeg-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM GÀ5', 'Cơm gà mắm tỏi', 'SIZE1', 60000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE1', 'HOT', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/5comga_mamtoi-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM GÀ5', 'Cơm gà mắm tỏi', 'SIZE2', 60000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE1', 'HOT', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/5comga_mamtoi-min.jpeg', 40000);
INSERT INTO `food` VALUES ('CƠM GÀ6', 'Cơm gà ngon', 'SIZE1', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/6comga_ngon-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ6', 'Cơm gà ngon', 'SIZE2', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/6comga_ngon-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ7', 'Cơm gà nương tiêu xanh', 'SIZE1', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/7comga_nuongtieuxanh-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ7', 'Cơm gà nương tiêu xanh', 'SIZE2', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/7comga_nuongtieuxanh-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ8', 'Cơm gà xói mỡ', 'SIZE1', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/8Comga_xoimo142-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ8', 'Cơm gà xói mỡ', 'SIZE2', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/8Comga_xoimo142-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ9', 'Cơm gà xói mỡ Ông địa', 'SIZE1', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/9comga_xoimoongdia-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM GÀ9', 'Cơm gà xói mỡ Ông địa', 'SIZE2', 45000, 'CƠM GÀ', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComGa/9comga_xoimoongdia-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM MÓN2', 'Tonkatsudon', 'SIZE1', 55000, 'CƠM MÓN', 49, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComMon/2Common_tonkatsudon-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM MÓN2', 'Thịt heo chiên xù', 'SIZE2', 55000, 'CƠM MÓN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComMon/1Common_thitheochienxu-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM MÓN3', 'Cà ri bò', 'SIZE2', 55000, 'CƠM MÓN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComMon/3Common_caribo-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM MÓN4', 'Beefsteak', 'SIZE2', 45000, 'CƠM MÓN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComMon/4Common_beefsteak-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM MÓN5', 'Bắp bò hấp', 'SIZE2', 55000, 'CƠM MÓN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComMon/5Common_combapbohap-min.jpg', 30000);
INSERT INTO `food` VALUES ('CƠM MÓN6', 'Oyakodon', 'SIZE2', 60000, 'CƠM MÓN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComMon/6Common_oyakodon-min.jpeg', 30000);
INSERT INTO `food` VALUES ('CƠM MÓN7', 'Trứng sốt demi', 'SIZE2', 70000, 'CƠM MÓN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComMon/7Common_trungsotdemi-min.jpg', 30000);
INSERT INTO `food` VALUES ('HẢI SẢN1', 'Gỏi cá cầu quản', 'SIZE1', 55000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/1haisan_goicacauquan-min.jpg', 40000);
INSERT INTO `food` VALUES ('HẢI SẢN1', 'Gỏi cá cầu quản', 'SIZE2', 55000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/1haisan_goicacauquan-min.jpg', 40000);
INSERT INTO `food` VALUES ('HẢI SẢN10', 'Gỏi khô cá sặc', 'SIZE1', 152000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/10haisan_goikhocasac-min.jpg', 100000);
INSERT INTO `food` VALUES ('HẢI SẢN10', 'Gỏi khô cá sặc', 'SIZE2', 152000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/10haisan_goikhocasac-min.jpg', 100000);
INSERT INTO `food` VALUES ('HẢI SẢN11', 'Mực chiên nước mắm', 'SIZE1', 125000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/11haisan_mucchiennuocmam-min.jpg', 80000);
INSERT INTO `food` VALUES ('HẢI SẢN11', 'Mực chiên nước mắm', 'SIZE2', 125000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/11haisan_mucchiennuocmam-min.jpg', 80000);
INSERT INTO `food` VALUES ('HẢI SẢN12', 'Tôm chiên giòn', 'SIZE1', 75000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/12haisan_tomchiengion-min.jpg', 50000);
INSERT INTO `food` VALUES ('HẢI SẢN12', 'Tôm chiên giòn', 'SIZE2', 75000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/12haisan_tomchiengion-min.jpg', 40000);
INSERT INTO `food` VALUES ('HẢI SẢN2', 'Mực ống hấp', 'SIZE1', 55000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/2haisan_muconghap-min.jpg', 40000);
INSERT INTO `food` VALUES ('HẢI SẢN2', 'Mực ống hấp', 'SIZE2', 55000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/2haisan_muconghap-min.jpg', 40000);
INSERT INTO `food` VALUES ('HẢI SẢN3', 'Tôm lạnh wasabi', 'SIZE1', 90000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/3haisan_tomlanhoWasabi-min.jpg', 60000);
INSERT INTO `food` VALUES ('HẢI SẢN3', 'Tôm lạnh wasabi', 'SIZE2', 90000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/3haisan_tomlanhoWasabi-min.jpg', 60000);
INSERT INTO `food` VALUES ('HẢI SẢN4', 'Cá ngừ đại dương', 'SIZE2', 70000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'1', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/4haisan_cangudaiduong-min.jpg', 50000);
INSERT INTO `food` VALUES ('HẢI SẢN5', 'Gỏi cuốn cá trích', 'SIZE2', 120000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE1', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/5haisan_chacuongcatrich-min.jpg', 80000);
INSERT INTO `food` VALUES ('HẢI SẢN6', 'Cháo Hào Sữa', 'SIZE2', 120000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/6haisan_chaohaosua-min.jpg', 80000);
INSERT INTO `food` VALUES ('HẢI SẢN7', 'Hào nướng phô mai', 'SIZE1', 120000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/7haisan_haunuongphomai-min.jpg', 80000);
INSERT INTO `food` VALUES ('HẢI SẢN7', 'Hào nướng phô mai', 'SIZE2', 120000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/7haisan_haunuongphomai-min.jpg', 80000);
INSERT INTO `food` VALUES ('HẢI SẢN8', 'Hải Sản khói lửa', 'SIZE1', 170000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/8haisan_haisankhoilua-min.jpg', 130000);
INSERT INTO `food` VALUES ('HẢI SẢN8', 'Hải Sản khói lửa', 'SIZE2', 170000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/8haisan_haisankhoilua-min.jpg', 130000);
INSERT INTO `food` VALUES ('HẢI SẢN9', 'Chả tôm', 'SIZE1', 120000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/9haisan_charamtondat-min.jpg', 80000);
INSERT INTO `food` VALUES ('HẢI SẢN9', 'Chả tôm', 'SIZE2', 120000, 'HẢI SẢN', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/ComHaiSan/9haisan_charamtondat-min.jpg', 80000);
INSERT INTO `food` VALUES ('MÓN CANH1', 'Canh rong biển thịt băm', 'SIZE1', 25000, 'MÓN CANH', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/1canh_rongbienthitnam-min.jpeg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH10', 'Canh rong biển thịt bầm 2', 'SIZE1', 20000, 'MÓN CANH', 49, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/10canh_rongbienthitbam2-min.jpeg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH11', 'Canh chua 2', 'SIZE1', 20000, 'MÓN CANH', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/11canh_chua2-min.jpg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH12', 'Canh xương hầm', 'SIZE1', 20000, 'MÓN CANH', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/12canh_xuongham-min.jpeg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH2', 'Canh cải chua thịt băm', 'SIZE1', 20000, 'MÓN CANH', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/2canh_caichuathitbam-min.jpeg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH3', 'Canh rong biển', 'SIZE1', 24000, 'MÓN CANH', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/3canh_rongbien-min.jpeg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH4', 'Canh chua', 'SIZE1', 25000, 'MÓN CANH', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/4canh_chua-min.jpeg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH5', 'Canh rong biển 2', 'SIZE1', 25000, 'MÓN CANH', 49, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/5canh_rongbien2-min.jpeg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH6', 'Canh chua cá hú', 'SIZE1', 30000, 'MÓN CANH', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/6canh_chuacahu-min.jpeg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH7', 'Canh khổ qua', 'SIZE1', 20000, 'MÓN CANH', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/7canh_khoqua-min.jpeg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH8', 'Canh cải ngọt', 'SIZE1', 20000, 'MÓN CANH', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/8canh_caingot-min.jpg', 15000);
INSERT INTO `food` VALUES ('MÓN CANH9', 'Canh cải chua thịt băm', 'SIZE1', 20000, 'MÓN CANH', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/MonCanh/9canh_caichuathitbam-min.jpeg', 15000);
INSERT INTO `food` VALUES ('THỨC UỐNG1', 'Trà đào', 'SIZE1', 10000, 'THỨC UỐNG', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/1thucuong_tradao-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG10', 'Sting', 'SIZE1', 10000, 'THỨC UỐNG', 49, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/10thucuong_string-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG11', 'Trà Ôlong', 'SIZE1', 10000, 'THỨC UỐNG', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/11thucuong_olong-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG12', 'Nước suối Aquafina', 'SIZE1', 10000, 'THỨC UỐNG', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/12thucuong_aquafina-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG2', 'Trà vải', 'SIZE1', 10000, 'THỨC UỐNG', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/2thucuong_travai-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG3', 'Trà đào hạt chia', 'SIZE1', 10000, 'THỨC UỐNG', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/3thucuong_tradaohatchia-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG4', 'Nước suối', 'SIZE1', 10000, 'THỨC UỐNG', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/4thucuong_nuocsuoi-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG5', 'Sprite', 'SIZE1', 10000, 'THỨC UỐNG', 49, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/5thucuong_sprite-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG6', 'Coca Cola', 'SIZE1', 10000, 'THỨC UỐNG', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/6thucuong_cocacola-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG7', 'Fanta cam', 'SIZE1', 10000, 'THỨC UỐNG', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/7thucuong_fanta-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG8', 'Pepsi', 'SIZE1', 10000, 'THỨC UỐNG', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/8thucuong_pepsi-min.jpeg', 8000);
INSERT INTO `food` VALUES ('THỨC UỐNG9', '7Up', 'SIZE1', 10000, 'THỨC UỐNG', 50, 'CÒN HÀNG', b'0', 'SALE2', 'NORMAL', 'Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \nCơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền', 'img/Data/Thucuong/9thucuong_7up-min.jpeg', 8000);

-- ----------------------------
-- Table structure for loaivoucher
-- ----------------------------
DROP TABLE IF EXISTS `loaivoucher`;
CREATE TABLE `loaivoucher`  (
  `TYPE_Voucher` int NULL DEFAULT NULL,
  `LoaiVoucher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loaivoucher
-- ----------------------------
INSERT INTO `loaivoucher` VALUES (1, 'Giảm Tiền');
INSERT INTO `loaivoucher` VALUES (2, 'Giảm Phần Trăm');
INSERT INTO `loaivoucher` VALUES (3, 'Free Ship');

-- ----------------------------
-- Table structure for order_account_details
-- ----------------------------
DROP TABLE IF EXISTS `order_account_details`;
CREATE TABLE `order_account_details`  (
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_ORDER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_ACCOUNT`, `ID_ORDER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_account_details
-- ----------------------------
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD1');
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD10');
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD11');
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD12');
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD2');
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD4');
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD5');
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD6');
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD7');
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD8');
INSERT INTO `order_account_details` VALUES ('ACC1', 'OD9');
INSERT INTO `order_account_details` VALUES ('ACC4', 'OD13');
INSERT INTO `order_account_details` VALUES ('ACC4', 'OD14');

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `ID_ORDER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_SIZE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `QUANTITY` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ORDER`, `ID_FOOD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES ('OD1', 'CƠM GÀ1', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD10', 'MÓN CANH10', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD10', 'MÓN CANH5', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD11', 'CƠM CHIÊN10', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD11', 'CƠM MÓN2', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD12', 'CƠM BÒ11', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD12', 'CƠM GÀ1', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD13', 'CƠM BÒ11', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD14', 'CƠM BÒ12', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD14', 'CƠM BÒ3', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD2', '', NULL, NULL);
INSERT INTO `order_details` VALUES ('OD2', 'CƠM GÀ 6', 'SIZE1', 3);
INSERT INTO `order_details` VALUES ('OD3', 'CƠM GÀ 6', 'SIZE1', 3);
INSERT INTO `order_details` VALUES ('OD4', '', NULL, NULL);
INSERT INTO `order_details` VALUES ('OD5', 'CƠM GÀ1', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD6', '', NULL, NULL);
INSERT INTO `order_details` VALUES ('OD7', 'CƠM GÀ1', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD8', 'CƠM BÒ12', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD8', 'CƠM BÒ3', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD8', 'CƠM BÒ4', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD8', 'CƠM BÒ6', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD9', 'THỨC UỐNG10', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD9', 'THỨC UỐNG5', 'SIZE1', 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `ID_ORDER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ORDER_DATE` date NULL DEFAULT NULL,
  `PHONE_NUMBER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NAMEUSER` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NOTE` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_VOUCHER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_ADDRESS` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUSS` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELIVERY_CHARGES` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ORDER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('OD1', '2023-01-18', '0337376582', 'THOAI', '   ', 'VOUCHER1', 'ADD1', 'Đã hủy', 20000);
INSERT INTO `orders` VALUES ('OD10', '2023-01-11', '033775682', 'HUU THOAI', 'Đầy đủ', 'null', 'ADD1', 'Đang Giao', 20000);
INSERT INTO `orders` VALUES ('OD11', '2023-01-11', '033775682', 'HUU THOAI', 'Đầy đủ', 'null', 'ADD1', 'Đang Giao', 20000);
INSERT INTO `orders` VALUES ('OD12', '2023-01-11', '033775682', 'HUU THOAI', 'Đầy đủ', 'null', 'ADD1', 'Đang Giao', 20000);
INSERT INTO `orders` VALUES ('OD13', '2023-01-11', '0985034347', 'LongVu123', 'Đầy đủ', 'null', 'ADD4', 'Đang Giao', 20000);
INSERT INTO `orders` VALUES ('OD14', '2023-01-11', '0985034347', 'LongVu123', 'Đầy đủ', 'null', 'ADD4', 'Đang Giao', 20000);
INSERT INTO `orders` VALUES ('OD2', '2023-01-11', '0337376582', 'THOAI', '   ', 'VOUCHER1', 'ADD1', 'đã hủy', 20000);
INSERT INTO `orders` VALUES ('OD3', '2022-12-09', '0337376582', 'THOAI', '   ', 'VOUCHER1', 'ADD1', 'đã giao', 20000);
INSERT INTO `orders` VALUES ('OD4', '2023-01-11', '033775682', 'HUU THOAI', 'Đầy đủ', 'NOELVV', 'ADD1', 'Đang Giao', 20000);
INSERT INTO `orders` VALUES ('OD5', '2023-01-11', '033775682', 'HUU THOAI', 'Đầy đủ', 'NAMMOI', 'ADD1', 'Đang Giao', 20000);
INSERT INTO `orders` VALUES ('OD6', '2023-01-11', '033775682', 'HUU THOAI', 'Đầy đủ', 'NAMMOI', 'ADD1', 'Đang Giao', 20000);
INSERT INTO `orders` VALUES ('OD7', '2023-01-11', '033775682', 'HUU THOAI', 'Đầy đủ', 'NAMMOI', 'ADD1', 'Đang Giao', 20000);
INSERT INTO `orders` VALUES ('OD8', '2023-01-11', '033775682', 'HUU THOAI', 'Đầy đủ', 'null', 'ADD1', 'Đang Giao', 20000);
INSERT INTO `orders` VALUES ('OD9', '2023-01-11', '033775682', 'HUU THOAI', 'Đầy đủ', 'null', 'ADD1', 'Đang Giao', 20000);

-- ----------------------------
-- Table structure for reset_password
-- ----------------------------
DROP TABLE IF EXISTS `reset_password`;
CREATE TABLE `reset_password`  (
  `ID_ACCOUNT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Hash_Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Exptime` datetime NULL DEFAULT NULL,
  `Datetime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ACCOUNT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reset_password
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `ID_USER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ROLE` int NULL DEFAULT NULL,
  `ROLE_NAME` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('USER1', 2, 'ADMIN');
INSERT INTO `role` VALUES ('USER2', 0, 'USER');
INSERT INTO `role` VALUES ('USER4', 0, 'USER');

-- ----------------------------
-- Table structure for role_food
-- ----------------------------
DROP TABLE IF EXISTS `role_food`;
CREATE TABLE `role_food`  (
  `ID_STATUS` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE_R` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_STATUS`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_food
-- ----------------------------

-- ----------------------------
-- Table structure for sale_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_detail`;
CREATE TABLE `sale_detail`  (
  `ID_SALE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE_SALE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALUESS` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_SALE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_detail
-- ----------------------------
INSERT INTO `sale_detail` VALUES ('SALE1', 'GIAMGIA', 20);
INSERT INTO `sale_detail` VALUES ('SALE2', 'KHONGGIA', 0);

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size`  (
  `ID_SIZE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE_SIZE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_SIZE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES ('SIZE1', 'THƯỜNG');
INSERT INTO `size` VALUES ('SIZE2', 'ĐẶC BIỆT');

-- ----------------------------
-- Table structure for size_details
-- ----------------------------
DROP TABLE IF EXISTS `size_details`;
CREATE TABLE `size_details`  (
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MONNEY` int NULL DEFAULT NULL,
  `ID_SIZE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_FOOD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of size_details
-- ----------------------------
INSERT INTO `size_details` VALUES ('CƠM GÀ1', 0, 'SIZE1');

-- ----------------------------
-- Table structure for type_food
-- ----------------------------
DROP TABLE IF EXISTS `type_food`;
CREATE TABLE `type_food`  (
  `ID_TYPE` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE_FOOD` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_TYPE`, `TYPE_FOOD`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_food
-- ----------------------------
INSERT INTO `type_food` VALUES ('TYPE1', 'CƠM GÀ');
INSERT INTO `type_food` VALUES ('TYPE2', 'CƠM BÒ');
INSERT INTO `type_food` VALUES ('TYPE3', 'CƠM MÓN');
INSERT INTO `type_food` VALUES ('TYPE4', 'CƠM CHIÊN');
INSERT INTO `type_food` VALUES ('TYPE5', 'HẢI SẢN');
INSERT INTO `type_food` VALUES ('TYPE6', 'MÓN CANH');
INSERT INTO `type_food` VALUES ('TYPE7', 'BÚN PHỞ');
INSERT INTO `type_food` VALUES ('TYPE8', 'THỨC UỐNG');
INSERT INTO `type_food` VALUES ('TYPE9', 'CƠM SƯỜN');

-- ----------------------------
-- Table structure for user_information
-- ----------------------------
DROP TABLE IF EXISTS `user_information`;
CREATE TABLE `user_information`  (
  `ID_USER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USER_NAMES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONE_NUMBER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_ADDRESS` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_information
-- ----------------------------
INSERT INTO `user_information` VALUES ('USER1', 'HUU THOAI', '033775682', 'ADD1');
INSERT INTO `user_information` VALUES ('USER2', 'QUANG VU TRAN', '0784736553', 'ADD2');
INSERT INTO `user_information` VALUES ('USER3', 'LONG VU DAO', '0736452734', 'ADD3');
INSERT INTO `user_information` VALUES ('USER4', 'LongVu123', '0985034347', 'ADD4');

-- ----------------------------
-- Table structure for voucher
-- ----------------------------
DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher`  (
  `ID_VOUCHER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CODE_VOUCHER` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE_VOUCHER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALUESS` int NULL DEFAULT NULL,
  `NAMES` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_VOUCHER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voucher
-- ----------------------------
INSERT INTO `voucher` VALUES ('GS2003', 'GS2003', '1', 20, 'An gisng dinh');

-- ----------------------------
-- Table structure for voucher_list
-- ----------------------------
DROP TABLE IF EXISTS `voucher_list`;
CREATE TABLE `voucher_list`  (
  `ID` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_VOUCHER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `START_DAY` date NULL DEFAULT NULL,
  `FINISH_DAY` date NULL DEFAULT NULL,
  `VOUCHER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voucher_list
-- ----------------------------
INSERT INTO `voucher_list` VALUES ('GS2003', 'GS2003', '2023-01-01', '2023-01-01', NULL);

SET FOREIGN_KEY_CHECKS = 1;
