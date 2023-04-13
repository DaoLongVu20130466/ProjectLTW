/*
 Navicat Premium Data Transfer

 Source Server         : shopdoan2
 Source Server Type    : MySQL
 Source Server Version : 100427 (10.4.27-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : shopdoan

 Target Server Type    : MySQL
 Target Server Version : 100427 (10.4.27-MariaDB)
 File Encoding         : 65001

 Date: 08/03/2023 00:21:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USERS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PASS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ID_USER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STATUSS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_BLOCK` bit(1) NULL DEFAULT NULL,
  `EMAIL` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AVATAR` char(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ACCOUNT`, `ID_USER`) USING BTREE,
  INDEX `ID_USER`(`ID_USER` ASC) USING BTREE,
  INDEX `ID_ACCOUNT`(`ID_ACCOUNT` ASC) USING BTREE,
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `user_information` (`ID_USER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('ACC1', 'THOAIHUU', '123456', 'USER1', 'HOẠT ĐỘNG', b'0', 'THOAIHUU291@GMAIL.COM', 'img/avt1.jpg');
INSERT INTO `accounts` VALUES ('ACC2', 'QUANGVU', '123456', 'USER2', 'HOẠT ĐỘNG', b'0', 'QUANGVU@GMAIL.COM', 'img/avt1.jpg');
INSERT INTO `accounts` VALUES ('ACC3', 'LONGVU', '123456', 'USER3', 'HOẠT ĐỘNG', b'0', 'LONGVU@GMAIL.COM', 'img/avt1.jpg');
INSERT INTO `accounts` VALUES ('ACC4', 'LongVu123', '123456', 'USER4', 'HOẠT ĐỘNG', b'0', 'daolongvu86@gmail.com', 'img/cupvangWC.jpg');

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `ID_ADDRESS` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `COMMUNE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISTRICT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDRESS_DETAILS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ADDRESS`) USING BTREE,
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`ID_ADDRESS`) REFERENCES `user_information` (`ID_ADDRESS`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('ADD1', 'CẨM SƠN', 'MỎ CÀY NAM', 'BẾN TRE', 'ẤP 10');
INSERT INTO `addresses` VALUES ('ADD2', 'XXX', 'XXX', 'ĐỒNG NAI', 'ẤP 6');
INSERT INTO `addresses` VALUES ('ADD3', 'XXX', 'XXX', 'BÌNH PHƯỚC', 'ẤP 7');
INSERT INTO `addresses` VALUES ('ADD4', '', '', '', '');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `ID` int NOT NULL,
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEXT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `ID_ACCOUNT`(`ID_ACCOUNT` ASC) USING BTREE,
  INDEX `ID_FOOD`(`ID_FOOD` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`ID_ACCOUNT`) REFERENCES `accounts` (`ID_ACCOUNT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`ID_FOOD`) REFERENCES `food` (`ID_FOOD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 'CG1', NULL, NULL);

-- ----------------------------
-- Table structure for favourites
-- ----------------------------
DROP TABLE IF EXISTS `favourites`;
CREATE TABLE `favourites`  (
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_FOOD`, `ID_ACCOUNT`) USING BTREE,
  INDEX `ID_ACCOUNT`(`ID_ACCOUNT` ASC) USING BTREE,
  CONSTRAINT `favourites_ibfk_1` FOREIGN KEY (`ID_ACCOUNT`) REFERENCES `accounts` (`ID_ACCOUNT`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of favourites
-- ----------------------------
INSERT INTO `favourites` VALUES ('6CG', 'ACC1');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FOOD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUSS` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_COMBO` bit(1) NULL DEFAULT NULL,
  `IS_HOT` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IVENTORY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ID_TYPE` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_FOOD`) USING BTREE,
  INDEX `ID_TYPE`(`ID_TYPE` ASC) USING BTREE,
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`ID_FOOD`) REFERENCES `price` (`ID_FOOD`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `food_ibfk_2` FOREIGN KEY (`ID_TYPE`) REFERENCES `type_food` (`ID_TYPE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `food_ibfk_3` FOREIGN KEY (`ID_FOOD`) REFERENCES `price` (`ID_FOOD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('CG1', 'Cơm gà A Quảng', 'CÒN HÀNG', b'1', 'HOT', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG10', 'Cơm gà xối mỡ T99', 'CÒN HÀNG', b'0', 'NORMAL', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG11', 'Cơm gà xối mỡ TC', 'CÒN HÀNG', b'0', 'NORMAL', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG12', 'Cơm gà chiên nước mắm', 'CÒN HÀNG', b'0', 'NORMAL', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG2', 'Cơm gà da giòn', 'CÒN HÀNG', b'0', 'NORMAL', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG3', 'Cơm gà Đệ Nhất', 'CÒN HÀNG', b'0', 'NORMAL', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG4', 'Cơm gà rán', 'CÒN HÀNG', b'0', 'NORMAL', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG5', 'Cơm gà mắm tỏi', 'CÒN HÀNG', b'0', 'NORMAL', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG6', 'Cơm gà ngon', 'CÒN HÀNG', b'0', 'NORMAL', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG7', 'Cơm gà nương tiêu xanh', 'CÒN HÀNG', b'0', 'NORMAL', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG8', 'Cơm gà xói mỡ', 'CÒN HÀNG', b'0', 'NORMAL', NULL, 'NGON', 'CG');
INSERT INTO `food` VALUES ('CG9', NULL, 'CÒN HÀNG', b'1', 'HOT', NULL, 'NGON', 'CG');

-- ----------------------------
-- Table structure for i_transdetail
-- ----------------------------
DROP TABLE IF EXISTS `i_transdetail`;
CREATE TABLE `i_transdetail`  (
  `ID_Trans` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Size` double NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Trans`) USING BTREE,
  INDEX `ID_FOOD`(`ID_FOOD` ASC) USING BTREE,
  CONSTRAINT `i_transdetail_ibfk_1` FOREIGN KEY (`ID_FOOD`) REFERENCES `food` (`ID_FOOD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of i_transdetail
-- ----------------------------

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `ID_IMG` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SRC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_IMG`) USING BTREE,
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`ID_IMG`) REFERENCES `image_detail` (`ID_IMG`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `image_ibfk_2` FOREIGN KEY (`ID_IMG`) REFERENCES `pageimg` (`ID_IMG`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for image_detail
-- ----------------------------
DROP TABLE IF EXISTS `image_detail`;
CREATE TABLE `image_detail`  (
  `ID_IMG` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_IMG`, `ID_FOOD`) USING BTREE,
  INDEX `ID_IMG`(`ID_IMG` ASC) USING BTREE,
  INDEX `ID_FOOD`(`ID_FOOD` ASC) USING BTREE,
  CONSTRAINT `image_detail_ibfk_1` FOREIGN KEY (`ID_FOOD`) REFERENCES `food` (`ID_FOOD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image_detail
-- ----------------------------
INSERT INTO `image_detail` VALUES ('IMG1', 'CG1');

-- ----------------------------
-- Table structure for import_trans
-- ----------------------------
DROP TABLE IF EXISTS `import_trans`;
CREATE TABLE `import_trans`  (
  `ID_TranS` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Place_Prod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Tax_ID` int NULL DEFAULT NULL,
  INDEX `ID_TranS`(`ID_TranS` ASC) USING BTREE,
  CONSTRAINT `import_trans_ibfk_1` FOREIGN KEY (`ID_TranS`) REFERENCES `i_transdetail` (`ID_Trans`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of import_trans
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `ID_LOG` int NOT NULL,
  `LEVEL_LOG` int NULL DEFAULT NULL,
  `ID_USER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SRC_LOG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATE_AT` datetime NULL DEFAULT NULL,
  `STATUS_LOG` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for login_detail
-- ----------------------------
DROP TABLE IF EXISTS `login_detail`;
CREATE TABLE `login_detail`  (
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_Type_Login` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KeyId` int NULL DEFAULT NULL,
  INDEX `ID_ACCOUNT`(`ID_ACCOUNT` ASC) USING BTREE,
  INDEX `ID_Type_Login`(`ID_Type_Login` ASC) USING BTREE,
  CONSTRAINT `login_detail_ibfk_1` FOREIGN KEY (`ID_ACCOUNT`) REFERENCES `accounts` (`ID_ACCOUNT`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_detail
-- ----------------------------

-- ----------------------------
-- Table structure for order_account_details
-- ----------------------------
DROP TABLE IF EXISTS `order_account_details`;
CREATE TABLE `order_account_details`  (
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_ORDER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_ACCOUNT`, `ID_ORDER`) USING BTREE,
  INDEX `ID_ACCOUNT`(`ID_ACCOUNT` ASC) USING BTREE,
  INDEX `ID_ORDER`(`ID_ORDER` ASC) USING BTREE,
  CONSTRAINT `order_account_details_ibfk_1` FOREIGN KEY (`ID_ACCOUNT`) REFERENCES `accounts` (`ID_ACCOUNT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_account_details_ibfk_2` FOREIGN KEY (`ID_ORDER`) REFERENCES `orders` (`ID_ORDER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  PRIMARY KEY (`ID_ORDER`, `ID_FOOD`) USING BTREE,
  INDEX `ID_FOOD`(`ID_FOOD` ASC) USING BTREE,
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`ID_ORDER`) REFERENCES `orders` (`ID_ORDER`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`ID_FOOD`) REFERENCES `food` (`ID_FOOD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES ('OD1', 'CG1', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD10', 'CG10', 'SIZE1', 2);
INSERT INTO `order_details` VALUES ('OD11', 'CG11', 'SIZE1', 3);
INSERT INTO `order_details` VALUES ('OD12', 'CG12', 'SIZE1', 2);
INSERT INTO `order_details` VALUES ('OD2', 'CG2', 'SIZE1', 1);
INSERT INTO `order_details` VALUES ('OD3', 'CG3', 'SIZE1', 2);
INSERT INTO `order_details` VALUES ('OD4', 'CG4', 'SIZE1', 3);
INSERT INTO `order_details` VALUES ('OD5', 'CG5', 'SIZE1', 3);
INSERT INTO `order_details` VALUES ('OD6', 'CG6', 'SIZE1', 2);
INSERT INTO `order_details` VALUES ('OD7', 'CG7', 'SIZE1', 2);
INSERT INTO `order_details` VALUES ('OD8', 'CG8', 'SIZE1', 2);
INSERT INTO `order_details` VALUES ('OD9', 'CG9', 'SIZE1', 2);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page`  (
  `ID_PAGE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TILE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PAGE`) USING BTREE,
  CONSTRAINT `page_ibfk_1` FOREIGN KEY (`ID_PAGE`) REFERENCES `pageimg` (`ID_PAGE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of page
-- ----------------------------

-- ----------------------------
-- Table structure for page_infor
-- ----------------------------
DROP TABLE IF EXISTS `page_infor`;
CREATE TABLE `page_infor`  (
  `PHONE_NUMBER` int NULL DEFAULT NULL,
  `LOCATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPEN_TIME` datetime NULL DEFAULT NULL,
  `EMAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHOP_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of page_infor
-- ----------------------------

-- ----------------------------
-- Table structure for page_text_infor
-- ----------------------------
DROP TABLE IF EXISTS `page_text_infor`;
CREATE TABLE `page_text_infor`  (
  `ID_PAGE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_DESCRIPTION` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_PAGE`, `ID_DESCRIPTION`) USING BTREE,
  INDEX `ID_DESCRIPTION`(`ID_DESCRIPTION` ASC) USING BTREE,
  CONSTRAINT `page_text_infor_ibfk_1` FOREIGN KEY (`ID_PAGE`) REFERENCES `page` (`ID_PAGE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of page_text_infor
-- ----------------------------

-- ----------------------------
-- Table structure for pageimg
-- ----------------------------
DROP TABLE IF EXISTS `pageimg`;
CREATE TABLE `pageimg`  (
  `ID_IMG` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_PAGE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE_IMG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_IMG`, `ID_PAGE`) USING BTREE,
  INDEX `ID_IMG`(`ID_IMG` ASC) USING BTREE,
  INDEX `ID_PAGE`(`ID_PAGE` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pageimg
-- ----------------------------

-- ----------------------------
-- Table structure for price
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price`  (
  `ID_PRICE` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LISTED_PRICE` int NULL DEFAULT NULL,
  `PRICE` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PRICE`, `ID_FOOD`) USING BTREE,
  INDEX `ID_FOOD`(`ID_FOOD` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO `price` VALUES ('PR1', 'CG1', 40000, 60000);
INSERT INTO `price` VALUES ('PR10', 'CG10', 40000, 50000);
INSERT INTO `price` VALUES ('PR11', 'CG11', 40000, 55000);
INSERT INTO `price` VALUES ('PR12', 'CG12', 40000, 56000);
INSERT INTO `price` VALUES ('PR2', 'CG2', 40000, 60000);
INSERT INTO `price` VALUES ('PR3', 'CG3', 40000, 60000);
INSERT INTO `price` VALUES ('PR4', 'CG4', 40000, 70000);
INSERT INTO `price` VALUES ('PR5', 'CG5', 40000, 50000);
INSERT INTO `price` VALUES ('PR6', 'CG6', 40000, 50000);
INSERT INTO `price` VALUES ('PR7', 'CG7', 40000, 55000);
INSERT INTO `price` VALUES ('PR8', 'CG8', 40000, 50000);
INSERT INTO `price` VALUES ('PR9', 'CG9', 40000, 50000);

-- ----------------------------
-- Table structure for reset_password
-- ----------------------------
DROP TABLE IF EXISTS `reset_password`;
CREATE TABLE `reset_password`  (
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Hash_Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Exptime` datetime NULL DEFAULT NULL,
  `Datetime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`Hash_Code`) USING BTREE,
  INDEX `ID_ACCOUNT`(`ID_ACCOUNT` ASC) USING BTREE,
  CONSTRAINT `reset_password_ibfk_1` FOREIGN KEY (`ID_ACCOUNT`) REFERENCES `accounts` (`ID_ACCOUNT`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reset_password
-- ----------------------------
INSERT INTO `reset_password` VALUES ('ACC1', '', NULL, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `ID_USER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ROLE` int NULL DEFAULT NULL,
  `ROLE_NAME` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER`) USING BTREE,
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`ID_USER`) REFERENCES `accounts` (`ID_USER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_food
-- ----------------------------

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale`  (
  `ID_SALE` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE_SALE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALUESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_SALE`) USING BTREE,
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`ID_SALE`) REFERENCES `sale_detail` (`ID_SALE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale
-- ----------------------------

-- ----------------------------
-- Table structure for sale_detail
-- ----------------------------
DROP TABLE IF EXISTS `sale_detail`;
CREATE TABLE `sale_detail`  (
  `ID_SALE` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_SALE`, `ID_FOOD`) USING BTREE,
  INDEX `ID_FOOD`(`ID_FOOD` ASC) USING BTREE,
  INDEX `ID_SALE`(`ID_SALE` ASC) USING BTREE,
  CONSTRAINT `sale_detail_ibfk_1` FOREIGN KEY (`ID_FOOD`) REFERENCES `food` (`ID_FOOD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sale_detail
-- ----------------------------
INSERT INTO `sale_detail` VALUES ('SALE1', 'CG1');
INSERT INTO `sale_detail` VALUES ('SALE2', 'CG1');

-- ----------------------------
-- Table structure for size
-- ----------------------------
DROP TABLE IF EXISTS `size`;
CREATE TABLE `size`  (
  `ID_SIZE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME__SIZE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALLUES` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_SIZE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of size
-- ----------------------------
INSERT INTO `size` VALUES ('SIZE1', 'THƯỜNG', NULL);
INSERT INTO `size` VALUES ('SIZE2', 'ĐẶC BIỆT', NULL);

-- ----------------------------
-- Table structure for size_details
-- ----------------------------
DROP TABLE IF EXISTS `size_details`;
CREATE TABLE `size_details`  (
  `ID_FOOD` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_SIZE` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_FOOD`, `ID_SIZE`) USING BTREE,
  INDEX `ID_SIZE`(`ID_SIZE` ASC) USING BTREE,
  INDEX `ID_FOOD`(`ID_FOOD` ASC) USING BTREE,
  CONSTRAINT `size_details_ibfk_1` FOREIGN KEY (`ID_SIZE`) REFERENCES `size` (`ID_SIZE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `size_details_ibfk_2` FOREIGN KEY (`ID_FOOD`) REFERENCES `food` (`ID_FOOD`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of size_details
-- ----------------------------
INSERT INTO `size_details` VALUES ('CG1', 'SIZE1');

-- ----------------------------
-- Table structure for text
-- ----------------------------
DROP TABLE IF EXISTS `text`;
CREATE TABLE `text`  (
  `ID_DESCRIPTION` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TEXT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TITLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DESCRIPTION`) USING BTREE,
  CONSTRAINT `text_ibfk_1` FOREIGN KEY (`ID_DESCRIPTION`) REFERENCES `page_text_infor` (`ID_DESCRIPTION`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of text
-- ----------------------------

-- ----------------------------
-- Table structure for type_food
-- ----------------------------
DROP TABLE IF EXISTS `type_food`;
CREATE TABLE `type_food`  (
  `ID_TYPE` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE_FOOD` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type_food
-- ----------------------------
INSERT INTO `type_food` VALUES ('CB', 'CƠM BÒ');
INSERT INTO `type_food` VALUES ('CC', 'CƠM CHIÊN');
INSERT INTO `type_food` VALUES ('CG', 'CƠM GÀ');
INSERT INTO `type_food` VALUES ('CM', 'CƠM MÓN');
INSERT INTO `type_food` VALUES ('HS', 'HẢI SẢN');
INSERT INTO `type_food` VALUES ('MC', 'MÓN CANH');
INSERT INTO `type_food` VALUES ('TU', 'THỨC UỐNG');

-- ----------------------------
-- Table structure for type_login
-- ----------------------------
DROP TABLE IF EXISTS `type_login`;
CREATE TABLE `type_login`  (
  `ID_Type_Login` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Decriptions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Type_Login`) USING BTREE,
  CONSTRAINT `type_login_ibfk_1` FOREIGN KEY (`ID_Type_Login`) REFERENCES `login_detail` (`ID_Type_Login`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type_login
-- ----------------------------

-- ----------------------------
-- Table structure for user_information
-- ----------------------------
DROP TABLE IF EXISTS `user_information`;
CREATE TABLE `user_information`  (
  `ID_USER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USER_NAMES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONE_NUMBER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_ADDRESS` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER`) USING BTREE,
  INDEX `ID_ADDRESS`(`ID_ADDRESS` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
  `ID_TYPE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VALUESS` int NULL DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NAMES` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_VOUCHER`) USING BTREE,
  INDEX `ID_TYPE`(`ID_TYPE` ASC) USING BTREE,
  CONSTRAINT `voucher_ibfk_1` FOREIGN KEY (`ID_VOUCHER`) REFERENCES `voucher_list` (`ID_VOUCHER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of voucher
-- ----------------------------
INSERT INTO `voucher` VALUES ('GS2003', 'GS2003', '1', 20, NULL, 'An gisng dinh');

-- ----------------------------
-- Table structure for voucher_list
-- ----------------------------
DROP TABLE IF EXISTS `voucher_list`;
CREATE TABLE `voucher_list`  (
  `ID_ACCOUNT` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ID_VOUCHER` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `START_DAY` date NULL DEFAULT NULL,
  `FINISH_DAY` date NULL DEFAULT NULL,
  PRIMARY KEY (`ID_ACCOUNT`, `ID_VOUCHER`) USING BTREE,
  INDEX `ID_VOUCHER`(`ID_VOUCHER` ASC) USING BTREE,
  INDEX `ID_ACCOUNT`(`ID_ACCOUNT` ASC) USING BTREE,
  CONSTRAINT `voucher_list_ibfk_1` FOREIGN KEY (`ID_ACCOUNT`) REFERENCES `accounts` (`ID_ACCOUNT`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of voucher_list
-- ----------------------------
INSERT INTO `voucher_list` VALUES ('ACC1', 'GS2003', '2023-01-01', '2023-01-01');

-- ----------------------------
-- Table structure for voucher_type
-- ----------------------------
DROP TABLE IF EXISTS `voucher_type`;
CREATE TABLE `voucher_type`  (
  `ID_TYPE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desciption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `ID_TYPE`(`ID_TYPE` ASC) USING BTREE,
  CONSTRAINT `voucher_type_ibfk_1` FOREIGN KEY (`ID_TYPE`) REFERENCES `voucher` (`ID_TYPE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of voucher_type
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
