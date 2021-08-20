/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL TSES
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : ci_shop

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 20/08/2021 13:13:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_product` int NOT NULL,
  `qty` int NOT NULL,
  `subtotal` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 4, 2, 1, 500000);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (7, 'desktop', 'Desktop');
INSERT INTO `category` VALUES (8, 'tablet', 'Tablet');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_orders` int NOT NULL,
  `id_product` int NOT NULL,
  `qty` int NOT NULL,
  `subtotal` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 1, 4, 6, 30000000);
INSERT INTO `order_detail` VALUES (2, 1, 3, 2, 6000000);
INSERT INTO `order_detail` VALUES (3, 2, 2, 1, 500000);
INSERT INTO `order_detail` VALUES (4, 3, 3, 1, 3000000);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `date` date NOT NULL,
  `invoice` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('waiting','paid','delivered','cancel') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 5, '2020-03-18', '520200318210456', 36000000, 'Hakim', 'Kampung Malang Kulon 1/38-A', '087855777360', 'paid');
INSERT INTO `orders` VALUES (2, 5, '2020-03-19', '520200319181238', 500000, 'Jotaro Kujo', 'Western', '218838383', 'delivered');
INSERT INTO `orders` VALUES (3, 5, '2020-03-24', '520200324223408', 3000000, 'Amir Muhammad Hakim', 'Kampung Malang Kulon 1/38-A', '087855777360', 'waiting');

-- ----------------------------
-- Table structure for orders_confirm
-- ----------------------------
DROP TABLE IF EXISTS `orders_confirm`;
CREATE TABLE `orders_confirm`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_orders` int NOT NULL,
  `account_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nominal` int NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders_confirm
-- ----------------------------
INSERT INTO `orders_confirm` VALUES (1, 1, 'Amir', '42424123333', 36000000, '-', '520200318210456-20200319173859.jpg');
INSERT INTO `orders_confirm` VALUES (2, 2, 'Dio Brando', '344312321', 500000, 'Mantap kang', '520200319181238-20200319181447.jpg');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (5, 8, 'majoo-pro-advanced', 'Majoo Pro Advanced', 'Tablet dan printer', 2750000, 1, 'majoo-pro-advanced-20210820091628.png');
INSERT INTO `product` VALUES (6, 8, 'majoo-pro', 'Majoo Pro', 'Tablet Kasir', 2750000, 1, 'majoo-pro-20210820091717.png');
INSERT INTO `product` VALUES (7, 7, 'majoo-desktop', 'Majoo Desktop', 'Komputer Kasir', 2750000, 1, 'majoo-desktop-20210820092451.png');
INSERT INTO `product` VALUES (8, 7, 'majoo-life-style', 'Majoo Life Style', 'Paket Komputer Kasir', 2750000, 1, 'majoo-life-style-20210820092526.png');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` enum('admin','member') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'Admin', 'admin@admin.com', '$2y$10$mLyToNOtVeLG.ziTUFPpCOOGD1P8cXZJj6ufU7J74TB63qVs2JjqK', 'admin', 1, 'admin-20200315212825.png');
INSERT INTO `user` VALUES (5, 'Member', 'member@member.com', '$2y$10$ghbQkKwENFZnOxWAwtgSaeDV2gcI63ZorQEQkSxqlaUlrFUMNnLpy', 'member', 1, 'member-20200315232137.png');
INSERT INTO `user` VALUES (6, 'Achmad Dary Kurnia', 'aikkurnia@gmail.com', '$2y$10$GDsVBiC7V2GPNrHceTTeUuxRb/EZEcyei0uyBA9IOyoNAY5VWIrI2', 'admin', 1, 'achmad-dary-kurnia-20210820092658.png');

SET FOREIGN_KEY_CHECKS = 1;
