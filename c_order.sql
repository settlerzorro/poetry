/*
 Navicat MySQL Data Transfer

 Source Server         : taobishe
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : 119.45.4.12:3306
 Source Schema         : c_order

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 22/05/2021 22:21:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_member
-- ----------------------------
DROP TABLE IF EXISTS `base_member`;
CREATE TABLE `base_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_member
-- ----------------------------
INSERT INTO `base_member` VALUES (66, 'o1HEb0bbQgdd1aPNyr2ZXvutSU8U', '清风', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK3JVibuZg8wiaKG9ExyVJJT2R4s398eropw2qU7GhJEwgwNB8Y56GWh4dDHPSYTNcJXgmkvz4809SA/132', '1', '李正乐', '18112907714', 'test', '123456', '2021-04-07 11:36:47');
INSERT INTO `base_member` VALUES (69, NULL, '测试', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK3JVibuZg8wiaKG9ExyVJJT2R4s398eropw2qU7GhJEwgwNB8Y56GWh4dDHPSYTNcJXgmkvz4809SA/132', '1', '测试', '18112907714', 'wfuhui', '123456', '2021-04-09 13:44:17');

-- ----------------------------
-- Table structure for base_member_address
-- ----------------------------
DROP TABLE IF EXISTS `base_member_address`;
CREATE TABLE `base_member_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `contacts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省',
  `province_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_id` int(11) NULL DEFAULT NULL COMMENT '市',
  `city_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `district_id` int(11) NULL DEFAULT NULL COMMENT '区',
  `district_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `zipcode` int(11) NULL DEFAULT NULL COMMENT '邮编',
  `dft` tinyint(1) NULL DEFAULT NULL COMMENT '默认地址',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_member_address
-- ----------------------------
INSERT INTO `base_member_address` VALUES (9, 66, '李正乐', '18112907714', NULL, '北京市', NULL, '北京市', NULL, '东城区', '测试001', NULL, 1, '2021-04-05 09:29:23');

-- ----------------------------
-- Table structure for order_advert
-- ----------------------------
DROP TABLE IF EXISTS `order_advert`;
CREATE TABLE `order_advert`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `enable` tinyint(4) NULL DEFAULT NULL COMMENT '是否启用，0：禁用，1：启用',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_advert
-- ----------------------------
INSERT INTO `order_advert` VALUES (1, 'http://localhost:10001/img/banner-1.jpg', 1, NULL, 1, '2021-04-08 13:44:57');
INSERT INTO `order_advert` VALUES (2, 'http://localhost:10001/img/banner-2.jpg', 1, NULL, 2, '2021-04-08 13:45:13');

-- ----------------------------
-- Table structure for order_category
-- ----------------------------
DROP TABLE IF EXISTS `order_category`;
CREATE TABLE `order_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_category
-- ----------------------------
INSERT INTO `order_category` VALUES (1, '主食', 'http://localhost:10001/img/icon-1.png', 1, '2021-04-09 19:33:12');
INSERT INTO `order_category` VALUES (2, '汉堡', 'http://localhost:10001/img/icon-2.png', 2, '2021-04-08 19:35:03');
INSERT INTO `order_category` VALUES (3, '套餐', 'http://localhost:10001/img/icon-3.png', 3, '2021-04-10 19:35:23');

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品名称',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '上下架',
  `stock` int(11) NULL DEFAULT 1 COMMENT '库存',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES (2, '汉堡套餐', 1, 18.00, 'http://localhost:10001/img/goods-1.jpg', 1, 2, NULL, '2021-04-09 22:10:38');
INSERT INTO `order_goods` VALUES (3, '超值炸鸡', 2, 10.00, 'http://localhost:10001/img/goods-2.jpg', 1, 2, NULL, '2021-04-09 22:12:05');
INSERT INTO `order_goods` VALUES (4, '超值炸鸡', 3, 10.00, 'http://localhost:10001/img/goods-3.jpg', 1, 3, NULL, '2021-04-09 22:13:47');
INSERT INTO `order_goods` VALUES (5, '精品炒菜', 1, 20.00, 'http://localhost:10001/img/goods-4.jpg', 1, 4, NULL, '2021-04-09 22:39:37');
INSERT INTO `order_goods` VALUES (6, '汉堡', 1, 20.00, 'http://localhost:10001/img/goods-4.jpg', 1, 3, NULL, '2021-04-09 22:39:40');
INSERT INTO `order_goods` VALUES (7, '家常小炒', 1, 30.00, 'http://localhost:10001/img/goods-5.jpg', 1, 2, NULL, '2021-04-10 22:39:43');
INSERT INTO `order_goods` VALUES (8, '可乐汉堡', 3, 50.00, 'http://localhost:10001/img/goods-3.jpg', 1, 3, '<p><img src=\"http://localhost:10001/img/goods-3.jpg\" title=\"\" alt=\"\"/></p>', '2021-04-10 22:39:46');

-- ----------------------------
-- Table structure for order_goods_pic
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_pic`;
CREATE TABLE `order_goods_pic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_goods_pic
-- ----------------------------
INSERT INTO `order_goods_pic` VALUES (1, 2, 'http://localhost:10001/img/goods-1.jpg');
INSERT INTO `order_goods_pic` VALUES (2, 3, 'http://localhost:10001/img/goods-2.jpg');
INSERT INTO `order_goods_pic` VALUES (3, 4, 'http://localhost:10001/img/goods-3.jpg');
INSERT INTO `order_goods_pic` VALUES (4, 5, 'http://localhost:10001/img/goods-3.jpg');
INSERT INTO `order_goods_pic` VALUES (5, 6, 'http://localhost:10001/img/goods-3.jpg');
INSERT INTO `order_goods_pic` VALUES (6, 7, 'http://localhost:10001/img/goods-3.jpg');
INSERT INTO `order_goods_pic` VALUES (7, 8, 'http://localhost:10001/img/goods-3.jpg');

-- ----------------------------
-- Table structure for order_history
-- ----------------------------
DROP TABLE IF EXISTS `order_history`;
CREATE TABLE `order_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '浏览记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_history
-- ----------------------------
INSERT INTO `order_history` VALUES (1, 2, 66, '2021-02-23 11:01:13');
INSERT INTO `order_history` VALUES (2, 2, 69, '2021-02-23 11:01:25');
INSERT INTO `order_history` VALUES (3, 3, 69, '2021-02-23 11:01:43');

-- ----------------------------
-- Table structure for order_order
-- ----------------------------
DROP TABLE IF EXISTS `order_order`;
CREATE TABLE `order_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `order_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `order_status` tinyint(3) NULL DEFAULT NULL COMMENT '订单状态，0：已取消，1：待付款，2：代发货，3：代收货，4：已完成',
  `courier_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `distribution_type` tinyint(2) NULL DEFAULT NULL COMMENT '配送方式',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_order
-- ----------------------------
INSERT INTO `order_order` VALUES (12, 66, '20210112371745', 300.00, 1, NULL, '', 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (13, 66, '20210113128992', 500.00, 1, NULL, NULL, 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (14, 66, '20210114402619', 500.00, 1, NULL, NULL, 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (15, 66, '20210120108511', 500.00, 1, NULL, NULL, 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (16, 66, '20210120867487', 500.00, 2, NULL, NULL, 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (19, 66, '20210202216078', 50.00, 1, NULL, '', 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (20, 66, '20210212353169', 50.00, 1, NULL, NULL, 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (25, 66, '20210212674691', 30.00, 2, NULL, NULL, 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (26, 66, '20210212460294', 50.00, 2, NULL, NULL, 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (27, 66, '20210214395263', 50.00, 2, NULL, NULL, 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (28, 66, '20210214542003', 50.00, 2, NULL, NULL, 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (29, 66, '20210220664138', 120.00, 1, NULL, '', 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (30, 66, '20210220100878', 20.00, 2, NULL, '', 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (31, 66, '20210220260031', 90.00, 2, NULL, '', 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (32, 66, '20210304138870', 60.00, 1, NULL, '', 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (33, 66, '20210304459544', 60.00, 5, '1000001', '', 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (34, 66, '20210405660203', 60.00, 2, NULL, '', 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (35, 66, '20210405616137', 60.00, 2, NULL, '', 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (36, 66, '20210405131031', 60.00, 2, NULL, '1234', 1, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (37, 66, '20210405760483', 60.00, 2, NULL, '', 2, '2021-04-10 09:10:10');
INSERT INTO `order_order` VALUES (38, 66, '20210411344877', 60.00, 2, NULL, '', 2, '2021-04-11 23:28:24');
INSERT INTO `order_order` VALUES (39, 66, '20210507123483', 100.00, 1, NULL, NULL, 1, '2021-05-07 00:14:48');
INSERT INTO `order_order` VALUES (40, 66, '20210507981735', 30.00, 2, NULL, NULL, 1, '2021-05-07 00:14:59');

-- ----------------------------
-- Table structure for order_order_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `order_order_evaluation`;
CREATE TABLE `order_order_evaluation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单id',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `star` int(11) NULL DEFAULT NULL,
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_order_evaluation
-- ----------------------------
INSERT INTO `order_order_evaluation` VALUES (5, 33, 66, '味道不错，下次还来', NULL, 4, '2021-03-24 08:35:45');
INSERT INTO `order_order_evaluation` VALUES (6, 33, 66, '味道不错，下次还来', NULL, 8, '2021-03-24 08:35:45');
INSERT INTO `order_order_evaluation` VALUES (7, 32, 66, '很好吃', NULL, 8, '2021-04-24 05:37:54');
INSERT INTO `order_order_evaluation` VALUES (9, 32, 66, '哈哈', NULL, 8, '2021-05-04 07:11:10');

-- ----------------------------
-- Table structure for order_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_order_goods`;
CREATE TABLE `order_order_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单ID',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_order_goods
-- ----------------------------
INSERT INTO `order_order_goods` VALUES (12, 12, 7, 'android代做', 1, 'http://localhost:10001/img/goods-5.jpg', 300.00);
INSERT INTO `order_order_goods` VALUES (13, 13, 8, 'springcloud代做', 1, 'http://localhost:10001/img/goods-3.jpg', 500.00);
INSERT INTO `order_order_goods` VALUES (14, 14, 8, 'springcloud代做', 1, 'http://localhost:10001/img/goods-3.jpg', 500.00);
INSERT INTO `order_order_goods` VALUES (15, 15, 8, 'springcloud代做', 1, 'http://localhost:10001/img/goods-3.jpg', 500.00);
INSERT INTO `order_order_goods` VALUES (16, 16, 8, 'springcloud代做', 1, 'http://localhost:10001/img/goods-3.jpg', 500.00);
INSERT INTO `order_order_goods` VALUES (17, 19, 8, '精品炒菜', NULL, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (18, 20, 8, '精品炒菜', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (23, 25, 7, '家常小炒', 1, 'http://localhost:10001/img/goods-5.jpg', 30.00);
INSERT INTO `order_order_goods` VALUES (24, 26, 8, '精品炒菜', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (25, 27, 8, '精品炒菜', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (26, 28, 8, '精品炒菜', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (27, 29, 3, '超值炸鸡', 1, 'http://localhost:10001/img/goods-2.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (28, 29, 8, '精品炒菜', 2, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (29, 29, 4, '超值炸鸡', 1, 'http://localhost:10001/img/goods-3.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (30, 30, 3, '超值炸鸡', 1, 'http://localhost:10001/img/goods-2.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (31, 30, 4, '超值炸鸡', 1, 'http://localhost:10001/img/goods-3.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (32, 31, 3, '超值炸鸡', 1, 'http://localhost:10001/img/goods-2.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (33, 31, 4, '超值炸鸡', 3, 'http://localhost:10001/img/goods-3.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (34, 31, 8, '可乐汉堡', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (35, 32, 8, '可乐汉堡', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (36, 32, 4, '超值炸鸡', 1, 'http://localhost:10001/img/goods-3.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (37, 33, 8, '可乐汉堡', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (38, 33, 4, '超值炸鸡', 1, 'http://localhost:10001/img/goods-3.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (39, 34, 8, '可乐汉堡', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (40, 34, 4, '超值炸鸡', 1, 'http://localhost:10001/img/goods-3.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (41, 35, 8, '可乐汉堡', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (42, 35, 4, '超值炸鸡', 1, 'http://localhost:10001/img/goods-3.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (43, 36, 8, '可乐汉堡', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (44, 36, 4, '超值炸鸡', 1, 'http://localhost:10001/img/goods-3.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (45, 37, 8, '可乐汉堡', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (46, 37, 4, '超值炸鸡', 1, 'http://localhost:10001/img/goods-3.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (47, 38, 3, '超值炸鸡', 1, 'http://localhost:10001/img/goods-2.jpg', 10.00);
INSERT INTO `order_order_goods` VALUES (48, 38, 8, '精品炒菜', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (49, 39, 8, '精品炒菜', 1, 'http://localhost:10001/img/goods-3.jpg', 50.00);
INSERT INTO `order_order_goods` VALUES (50, 39, 7, '家常小炒', 1, 'http://localhost:10001/img/goods-5.jpg', 30.00);
INSERT INTO `order_order_goods` VALUES (51, 39, 6, '汉堡', 1, 'http://localhost:10001/img/goods-4.jpg', 20.00);
INSERT INTO `order_order_goods` VALUES (52, 40, 7, '家常小炒', 1, 'http://localhost:10001/img/goods-5.jpg', 30.00);

-- ----------------------------
-- Table structure for order_order_shipment
-- ----------------------------
DROP TABLE IF EXISTS `order_order_shipment`;
CREATE TABLE `order_order_shipment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单ID',
  `contacts` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `province_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省名称',
  `city_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名称',
  `district_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单配送' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_order_shipment
-- ----------------------------
INSERT INTO `order_order_shipment` VALUES (1, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_order_shipment` VALUES (2, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_order_shipment` VALUES (3, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_order_shipment` VALUES (4, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `order_order_shipment` VALUES (5, 37, '李正乐', '18112907714', '北京市', '北京市', '东城区', '1', NULL);
INSERT INTO `order_order_shipment` VALUES (6, 38, '李正乐', '18112907714', '北京市', '北京市', '东城区', '测试001', NULL);
INSERT INTO `order_order_shipment` VALUES (7, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_store
-- ----------------------------
DROP TABLE IF EXISTS `sys_store`;
CREATE TABLE `sys_store`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '店铺名称',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'LOGO',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '地址',
  `lng` double(11, 0) NULL DEFAULT NULL COMMENT '经度',
  `lat` double(11, 0) NULL DEFAULT NULL COMMENT '纬度',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '店铺' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_store
-- ----------------------------
INSERT INTO `sys_store` VALUES (2, '肯德基', '18021418906', 1, 'http://localhost:10001/img/store-1.jpg', 1, '南京', NULL, NULL, '2021-04-09 12:22:01');
INSERT INTO `sys_store` VALUES (3, '麦当劳', '18112907714', 1, 'http://localhost:10001/img/store-2.jpg', 1, '上海', NULL, NULL, '2021-04-09 12:22:18');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', '2803180149@qq.com', '18021418906', 1, '2021-04-09 11:11:11');

SET FOREIGN_KEY_CHECKS = 1;
