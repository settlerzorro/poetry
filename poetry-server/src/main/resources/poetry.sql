/*
 Navicat Premium Data Transfer

 Source Server         : goout
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : poetry

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 10/02/2022 14:38:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_member
-- ----------------------------
DROP TABLE IF EXISTS `base_member`;
CREATE TABLE `base_member`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_member
-- ----------------------------
INSERT INTO `base_member` VALUES (66, 'o1HEb0bbQgdd1aPNyr2ZXvutSU8U', '清风', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK3JVibuZg8wiaKG9ExyVJJT2R4s398eropw2qU7GhJEwgwNB8Y56GWh4dDHPSYTNcJXgmkvz4809SA/132', '1', '李正乐', '18112907714', 'test', '123456', '2021-04-07 11:36:47');
INSERT INTO `base_member` VALUES (69, NULL, '测试', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK3JVibuZg8wiaKG9ExyVJJT2R4s398eropw2qU7GhJEwgwNB8Y56GWh4dDHPSYTNcJXgmkvz4809SA/132', '1', '测试', '18112907714', 'wfuhui', '123456', '2021-04-09 13:44:17');
INSERT INTO `base_member` VALUES (70, NULL, 'zhang', NULL, NULL, 'zhang', '111', 'zhang', 'zhang', '2022-01-27 16:13:46');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `member_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单详情' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES (12, 7, 'android代做', 'http://localhost:10001/img/goods-5.jpg', NULL);
INSERT INTO `collection` VALUES (13, 8, 'springcloud代做', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (14, 8, 'springcloud代做', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (15, 8, 'springcloud代做', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (16, 8, 'springcloud代做', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (17, 8, '精品炒菜', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (18, 8, '精品炒菜', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (23, 7, '家常小炒', 'http://localhost:10001/img/goods-5.jpg', NULL);
INSERT INTO `collection` VALUES (24, 8, '精品炒菜', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (25, 8, '精品炒菜', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (26, 8, '精品炒菜', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (27, 3, '超值炸鸡', 'http://localhost:10001/img/goods-2.jpg', NULL);
INSERT INTO `collection` VALUES (28, 8, '精品炒菜', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (29, 4, '超值炸鸡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (30, 3, '超值炸鸡', 'http://localhost:10001/img/goods-2.jpg', NULL);
INSERT INTO `collection` VALUES (31, 4, '超值炸鸡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (32, 3, '超值炸鸡', 'http://localhost:10001/img/goods-2.jpg', NULL);
INSERT INTO `collection` VALUES (33, 4, '超值炸鸡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (34, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (35, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (36, 4, '超值炸鸡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (37, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (38, 4, '超值炸鸡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (39, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (40, 4, '超值炸鸡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (41, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (42, 4, '超值炸鸡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (43, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (44, 4, '超值炸鸡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (45, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (46, 4, '超值炸鸡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (47, 3, '超值炸鸡', 'http://localhost:10001/img/goods-2.jpg', NULL);
INSERT INTO `collection` VALUES (48, 8, '精品炒菜', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (49, 8, '精品炒菜', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (50, 7, '家常小炒', 'http://localhost:10001/img/goods-5.jpg', NULL);
INSERT INTO `collection` VALUES (51, 6, '汉堡', 'http://localhost:10001/img/goods-4.jpg', NULL);
INSERT INTO `collection` VALUES (52, 7, '家常小炒', 'http://localhost:10001/img/goods-5.jpg', NULL);
INSERT INTO `collection` VALUES (58, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (59, 2, '《赠汪伦》', 'http://localhost:10001/img/goods-1.jpg', NULL);
INSERT INTO `collection` VALUES (60, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (61, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (62, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (63, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', NULL);
INSERT INTO `collection` VALUES (65, 27, '单独', 'http://localhost:10001/fileupload/20220207/efb32584-ff19-4d40-bf83-202245873435.jpg', 66);
INSERT INTO `collection` VALUES (66, 27, '单独', 'http://localhost:10001/fileupload/20220207/efb32584-ff19-4d40-bf83-202245873435.jpg', 66);
INSERT INTO `collection` VALUES (67, 27, '单独', 'http://localhost:10001/fileupload/20220207/efb32584-ff19-4d40-bf83-202245873435.jpg', 66);
INSERT INTO `collection` VALUES (68, 27, '单独', 'http://localhost:10001/fileupload/20220207/efb32584-ff19-4d40-bf83-202245873435.jpg', 66);
INSERT INTO `collection` VALUES (69, 25, '诗', 'D:\\file\\fileupload\\20220128\\eff48542-be30-4cdc-8976-c0ad33c7c26b.jpg', 66);
INSERT INTO `collection` VALUES (70, 2, '《赠汪伦》', 'http://localhost:10001/img/goods-1.jpg', 66);
INSERT INTO `collection` VALUES (71, 8, '可乐汉堡', 'http://localhost:10001/img/goods-3.jpg', 66);
INSERT INTO `collection` VALUES (72, 27, '单独', 'http://localhost:10001/fileupload/20220207/efb32584-ff19-4d40-bf83-202245873435.jpg', 66);
INSERT INTO `collection` VALUES (73, 23, '测试张', 'http://localhost:10001/fileupload/20220128/a543b5a1-2f4d-4dab-951e-1de64cfdff50.jpg', 66);
INSERT INTO `collection` VALUES (74, 29, 'fffff', NULL, 66);
INSERT INTO `collection` VALUES (75, 29, 'fffff', NULL, 66);
INSERT INTO `collection` VALUES (76, 29, 'fffff', NULL, 66);
INSERT INTO `collection` VALUES (77, 29, 'fffff', NULL, 66);
INSERT INTO `collection` VALUES (78, 29, 'fffff', NULL, 66);
INSERT INTO `collection` VALUES (79, 29, 'fffff', NULL, 66);
INSERT INTO `collection` VALUES (80, 2, '《赠汪伦》', 'http://localhost:10001/img/goods-1.jpg', 66);
INSERT INTO `collection` VALUES (81, 30, '测试张', 'http://localhost:10001/fileupload/20220128/a543b5a1-2f4d-4dab-951e-1de64cfdff50.jpg', 70);

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` int NULL DEFAULT NULL COMMENT '用户id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `star` int NULL DEFAULT NULL,
  `goods_id` int NULL DEFAULT NULL COMMENT '商品id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单评价' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES (5, 66, '味道不错，下次还来', NULL, 4, '2021-03-24 08:35:45');
INSERT INTO `evaluation` VALUES (7, 66, '很好吃', NULL, 8, '2021-04-24 05:37:54');
INSERT INTO `evaluation` VALUES (9, 66, '哈哈', NULL, 8, '2021-05-04 07:11:10');
INSERT INTO `evaluation` VALUES (10, 66, '好诗', NULL, 2, '2021-05-04 07:11:10');
INSERT INTO `evaluation` VALUES (11, 66, 'ddddd', NULL, 2, '2022-02-08 16:26:23');
INSERT INTO `evaluation` VALUES (12, 70, '666', NULL, NULL, '2022-02-09 16:40:45');
INSERT INTO `evaluation` VALUES (13, 70, '666', NULL, NULL, '2022-02-09 16:41:45');
INSERT INTO `evaluation` VALUES (14, 70, '666', NULL, 8, '2022-02-09 16:42:21');

-- ----------------------------
-- Table structure for order_advert
-- ----------------------------
DROP TABLE IF EXISTS `order_advert`;
CREATE TABLE `order_advert`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `enable` tinyint NULL DEFAULT NULL COMMENT '是否启用，0：禁用，1：启用',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_advert
-- ----------------------------
INSERT INTO `order_advert` VALUES (1, 'http://localhost:10001/img/banner-1.jpg', 1, NULL, 1, '2021-04-08 13:44:57');
INSERT INTO `order_advert` VALUES (2, 'http://localhost:10001/img/banner-2.jpg', 1, NULL, 2, '2021-04-08 13:45:13');
INSERT INTO `order_advert` VALUES (6, 'http://localhost:10001/fileupload/20220128/4f9d822b-0d2d-4372-b28f-38081ed68ca3.jpg', 0, NULL, 1, '2022-01-28 13:47:04');
INSERT INTO `order_advert` VALUES (7, NULL, NULL, NULL, NULL, '2022-02-08 16:37:50');

-- ----------------------------
-- Table structure for order_category
-- ----------------------------
DROP TABLE IF EXISTS `order_category`;
CREATE TABLE `order_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_category
-- ----------------------------
INSERT INTO `order_category` VALUES (1, '送别诗', 'http://localhost:10001/img/icon-1.png', 1, '2021-04-09 19:33:12');
INSERT INTO `order_category` VALUES (2, '田园诗', 'http://localhost:10001/img/icon-2.png', 2, '2021-04-08 19:35:03');
INSERT INTO `order_category` VALUES (3, '山水诗', 'http://localhost:10001/img/icon-3.png', 3, '2021-04-10 19:35:23');
INSERT INTO `order_category` VALUES (6, '爱情诗', '', 1222, '2022-01-28 13:54:08');
INSERT INTO `order_category` VALUES (7, '励志诗', '', 122, '2022-01-28 14:01:09');

-- ----------------------------
-- Table structure for order_goods_pic
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_pic`;
CREATE TABLE `order_goods_pic`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_id` int NULL DEFAULT NULL COMMENT '商品ID',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `order_goods_pic` VALUES (8, 23, 'http://localhost:10001/fileupload/20220128/a543b5a1-2f4d-4dab-951e-1de64cfdff50.jpg');
INSERT INTO `order_goods_pic` VALUES (9, 23, 'http://localhost:10001/fileupload/20220128/2f160c72-ecd6-44b0-99bf-4c701a951002.jpg');
INSERT INTO `order_goods_pic` VALUES (10, 24, 'http://localhost:10001/fileupload/20220128/a543b5a1-2f4d-4dab-951e-1de64cfdff50.jpg');
INSERT INTO `order_goods_pic` VALUES (11, 24, 'http://localhost:10001/fileupload/20220128/2f160c72-ecd6-44b0-99bf-4c701a951002.jpg');
INSERT INTO `order_goods_pic` VALUES (12, 25, 'http://localhost:10001/fileupload/20220207/4e3aa0ef-bb63-482f-ac00-a943a65309b5.jpg');
INSERT INTO `order_goods_pic` VALUES (13, 26, 'http://localhost:10001/fileupload/20220207/ca555f84-ce41-479e-afea-fa34b7ceecfc.jpg');
INSERT INTO `order_goods_pic` VALUES (14, 27, 'http://localhost:10001/fileupload/20220207/efb32584-ff19-4d40-bf83-202245873435.jpg');
INSERT INTO `order_goods_pic` VALUES (15, 30, 'http://localhost:10001/fileupload/20220128/a543b5a1-2f4d-4dab-951e-1de64cfdff50.jpg');
INSERT INTO `order_goods_pic` VALUES (16, 30, 'http://localhost:10001/fileupload/20220128/2f160c72-ecd6-44b0-99bf-4c701a951002.jpg');

-- ----------------------------
-- Table structure for poetry
-- ----------------------------
DROP TABLE IF EXISTS `poetry`;
CREATE TABLE `poetry`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品名称',
  `category_id` int NULL DEFAULT NULL COMMENT '分类ID',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '诗词内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `dynasty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '朝代',
  `explain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诗词解释',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of poetry
-- ----------------------------
INSERT INTO `poetry` VALUES (2, '《赠汪伦》', 1, 'http://localhost:10001/img/goods-1.jpg', '李白乘舟将欲行，忽闻岸上踏歌声。\r\n桃花潭水深千尺，不及汪伦送我情。', '2021-04-09 22:10:38', '李白', '唐', NULL);
INSERT INTO `poetry` VALUES (3, '超值炸鸡', 2, 'http://localhost:10001/img/goods-2.jpg', NULL, '2021-04-09 22:12:05', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (4, '超值炸鸡', 3, 'http://localhost:10001/img/goods-3.jpg', NULL, '2021-04-09 22:13:47', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (5, '精品炒菜', 1, 'http://localhost:10001/img/goods-4.jpg', NULL, '2021-04-09 22:39:37', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (6, '汉堡', 1, 'http://localhost:10001/img/goods-4.jpg', NULL, '2021-04-09 22:39:40', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (7, '家常小炒', 1, 'http://localhost:10001/img/goods-5.jpg', NULL, '2021-04-10 22:39:43', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (8, '可乐汉堡', 3, 'http://localhost:10001/img/goods-3.jpg', '<p><img src=\"http://localhost:10001/img/goods-3.jpg\" title=\"\" alt=\"\"/></p>', '2021-04-10 22:39:46', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (23, '测试张', 7, 'http://localhost:10001/fileupload/20220128/a543b5a1-2f4d-4dab-951e-1de64cfdff50.jpg', '<p>顶顶顶顶顶顶顶顶顶顶顶</p>', '2022-01-28 14:08:01', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (25, '诗', 1, 'D:\\file\\fileupload\\20220128\\eff48542-be30-4cdc-8976-c0ad33c7c26b.jpg', '', '2022-02-07 18:02:11', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (27, '单独', NULL, 'http://localhost:10001/fileupload/20220207/efb32584-ff19-4d40-bf83-202245873435.jpg', '', '2022-02-07 18:42:00', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (28, 'gggg', NULL, NULL, '', '2022-02-08 15:38:58', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (29, 'fffff', NULL, NULL, '', '2022-02-08 15:40:24', NULL, NULL, NULL);
INSERT INTO `poetry` VALUES (30, '测试张', 7, 'http://localhost:10001/fileupload/20220128/a543b5a1-2f4d-4dab-951e-1de64cfdff50.jpg', '<p>顶顶顶顶顶顶顶顶顶顶顶dddasdasdasdasdasd</p>', '2022-02-08 16:39:25', '张大爷', '新中国', '这是一首诗');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `writer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '发帖人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发帖时间',
  `member_id` int NULL DEFAULT NULL COMMENT '发帖人Id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '帖子名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '帖子' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, '哈哈哈', '2022-02-09 16:46:51', 66, '帖子');
INSERT INTO `posts` VALUES (3, '哈哈哈2', '2022-02-10 09:34:49', 66, '帖子2');

-- ----------------------------
-- Table structure for posts_reply
-- ----------------------------
DROP TABLE IF EXISTS `posts_reply`;
CREATE TABLE `posts_reply`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NULL DEFAULT NULL,
  `member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `posts_id` int NULL DEFAULT NULL,
  `reply_member_id` int NULL DEFAULT NULL COMMENT '被回复者Id',
  `reply_member_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '被回复者名称',
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of posts_reply
-- ----------------------------
INSERT INTO `posts_reply` VALUES (2, 66, 'name', 'content', 1, 66, 'replyMemberName', '2022-02-10 09:34:30');
INSERT INTO `posts_reply` VALUES (3, 66, 'name', 'content', 1, 66, 'replyMemberName', '2022-02-10 09:34:32');
INSERT INTO `posts_reply` VALUES (5, 66, 'name', 'content', 2, 66, 'replyMemberName', '2022-02-10 09:34:57');

-- ----------------------------
-- Table structure for sys_store
-- ----------------------------
DROP TABLE IF EXISTS `sys_store`;
CREATE TABLE `sys_store`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '店铺名称',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '联系电话',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'LOGO',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '地址',
  `lng` double(11, 0) NULL DEFAULT NULL COMMENT '经度',
  `lat` double(11, 0) NULL DEFAULT NULL COMMENT '纬度',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '店铺' ROW_FORMAT = DYNAMIC;

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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'YzcmCZNvbXocrsz9dm8e', '2803180149@qq.com', '18021418906', 1, '2021-04-09 11:11:11');

SET FOREIGN_KEY_CHECKS = 1;
