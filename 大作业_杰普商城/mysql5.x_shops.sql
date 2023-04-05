/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : shops

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 19/02/2022 23:47:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
);
-- ----------------------------
-- Records of t_category
-- ----------------------------
BEGIN;
INSERT INTO `t_category` VALUES (17, '家电', NULL);
INSERT INTO `t_category` VALUES (18, '数码', NULL);
INSERT INTO `t_category` VALUES (19, '手机', NULL);
INSERT INTO `t_category` VALUES (20, '生活电器', 17);
INSERT INTO `t_category` VALUES (21, '厨房电器', 17);
INSERT INTO `t_category` VALUES (22, '扫地机器人', 17);
INSERT INTO `t_category` VALUES (23, '吸尘器', 17);
INSERT INTO `t_category` VALUES (24, '取暖器', 17);
INSERT INTO `t_category` VALUES (25, '豆浆机', 17);
INSERT INTO `t_category` VALUES (26, '暖风机', 17);
INSERT INTO `t_category` VALUES (27, '加湿器', 17);
INSERT INTO `t_category` VALUES (28, '蓝牙音箱', 17);
INSERT INTO `t_category` VALUES (29, '烤箱', 17);
INSERT INTO `t_category` VALUES (30, '卷发器', 17);
INSERT INTO `t_category` VALUES (31, '空气净化器', 17);
INSERT INTO `t_category` VALUES (32, '游戏主机', 18);
INSERT INTO `t_category` VALUES (33, '数码精选', 18);
INSERT INTO `t_category` VALUES (34, '平板电脑', 18);
INSERT INTO `t_category` VALUES (35, '苹果 Apple', 18);
INSERT INTO `t_category` VALUES (36, '电脑主机', 18);
INSERT INTO `t_category` VALUES (37, '数码相机', 18);
INSERT INTO `t_category` VALUES (38, '电玩动漫', 18);
INSERT INTO `t_category` VALUES (39, '单反相机', 18);
INSERT INTO `t_category` VALUES (40, '键盘鼠标', 18);
INSERT INTO `t_category` VALUES (41, '无人机', 18);
INSERT INTO `t_category` VALUES (42, '笔记本电脑', 18);
INSERT INTO `t_category` VALUES (44, 'iPhone 11', 19);
INSERT INTO `t_category` VALUES (45, '荣耀手机', 19);
INSERT INTO `t_category` VALUES (46, '华为手机', 19);
INSERT INTO `t_category` VALUES (47, 'iPhone', 19);
INSERT INTO `t_category` VALUES (48, '华为 Mate 20', 19);
INSERT INTO `t_category` VALUES (49, '华为 P30', 19);
INSERT INTO `t_category` VALUES (50, '华为 P30 Pro', 19);
INSERT INTO `t_category` VALUES (51, '小米手机', 19);
INSERT INTO `t_category` VALUES (52, '红米', 19);
INSERT INTO `t_category` VALUES (53, 'OPPO', 19);
INSERT INTO `t_category` VALUES (54, '一加', 19);
INSERT INTO `t_category` VALUES (55, '小米 MIX', 19);
INSERT INTO `t_category` VALUES (56, 'Reno', 19);
INSERT INTO `t_category` VALUES (57, 'vivo', 19);
INSERT INTO `t_category` VALUES (58, '手机以旧换新', 19);
INSERT INTO `t_category` VALUES (67, '女装', NULL);
INSERT INTO `t_category` VALUES (68, '男装', NULL);
INSERT INTO `t_category` VALUES (69, '穿搭', NULL);
INSERT INTO `t_category` VALUES (83, '美妆', NULL);
INSERT INTO `t_category` VALUES (86, '口红', 83);
INSERT INTO `t_category` VALUES (99, '气垫', 83);
INSERT INTO `t_category` VALUES (100, '美白', 83);
INSERT INTO `t_category` VALUES (101, '隔离霜', 83);
INSERT INTO `t_category` VALUES (102, '粉底', 83);
INSERT INTO `t_category` VALUES (103, '腮红', 83);
INSERT INTO `t_category` VALUES (104, '睫毛膏', 83);
INSERT INTO `t_category` VALUES (105, '香水', 83);
INSERT INTO `t_category` VALUES (106, '面膜', 83);
INSERT INTO `t_category` VALUES (107, '化妆水', 83);
INSERT INTO `t_category` VALUES (109, '耳机', 18);
INSERT INTO `t_category` VALUES (110, '乳液', 83);
COMMIT;

-- ----------------------------
-- Table structure for t_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_collect`;
CREATE TABLE `t_collect` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY(`shop_id`) REFERENCES `t_shop` (`id`),
  FOREIGN KEY(`user_id`) REFERENCES `t_user` (`id`)
) 
-- ----------------------------
-- Records of t_collect
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(255)  NOT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `shop_num` int NOT NULL,
  `sum_price` decimal(19,2) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`shipping_address_id`) REFERENCES `t_shipping_address` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) 

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `num` int NOT NULL,
  `order_id` varchar(255)  DEFAULT NULL,
  `shop_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`order_id`) REFERENCES `t_order` (`id`),
  FOREIGN KEY (`shop_id`) REFERENCES `t_shop` (`id`)
) ;

-- ----------------------------
-- Records of t_order_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_recommend_shop
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend_shop`;
CREATE TABLE `t_recommend_shop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shops` varchar(255)  DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `recommand_value` double DEFAULT NULL,
  `shops_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  FOREIGN KEY (`shops_id`) REFERENCES `t_shop` (`id`)
) ;

-- ----------------------------
-- Records of t_recommend_shop
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_shipping_address
-- ----------------------------
DROP TABLE IF EXISTS `t_shipping_address`;
CREATE TABLE `t_shipping_address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255)  DEFAULT NULL,
  `phone_num` varchar(255)  DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `default_value` bit(1) NOT NULL,
  `name` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ;

-- ----------------------------
-- Records of t_shipping_address
-- ----------------------------
BEGIN;
INSERT INTO `t_shipping_address` VALUES (1, '江苏省苏州市昆山市巴城镇学院路浦东软件园四号楼', '18899990000', 3, b'1', '薛渊朕');
INSERT INTO `t_shipping_address` VALUES (2, '江苏省苏州市昆山市巴城镇学院路浦东软件园四号楼', '18899990000', 3, b'0', 'adam');
INSERT INTO `t_shipping_address` VALUES (3, '江苏省苏州市昆山市巴城镇学院路浦东软件园四号楼', '18899990000', 3, b'0', '阿达米');
COMMIT;

-- ----------------------------
-- Table structure for t_shop
-- ----------------------------
DROP TABLE IF EXISTS `t_shop`;
CREATE TABLE `t_shop` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `discount` bit(1) NOT NULL,
  `discount_price` decimal(19,2) DEFAULT NULL,
  `img` varchar(255)  DEFAULT NULL,
  `info` text ,
  `name` varchar(255)  DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `selling_price` decimal(19,2) DEFAULT NULL,
  `stat` bit(1) NOT NULL,
  `stock_num` int NOT NULL,
  `store` varchar(255)  DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `sales_volume` bigint NOT NULL,
  `visit_volume` bigint NOT NULL,
  `intro` text ,
  `tags` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`)
) ;

-- ----------------------------
-- Records of t_shop
-- ----------------------------
BEGIN;
INSERT INTO `t_shop` VALUES (10003, b'1', 80.00, '/images/shops/87446ec4-e534-4b49-9f7d-9bea34665284.jpg', '滋润型 400ml', '无印良品 MUJI 基础润肤化妆水', 80.00, 100.00, b'1', 1000, '杰普官方直营', 107, 10003, 20006, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10005, b'1', 66.40, '/images/shops/7614ce78-0ebc-4275-a7cc-d16ad5f5f6ed.jpg', '高保湿型 200ml', '无印良品 MUJI 基础润肤乳液', 66.40, 83.00, b'1', 998, '杰普官方直营', 110, 10005, 20010, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10006, b'1', 80.00, '/images/shops/ef75879d-3d3e-4bab-888d-1e4036491e11.jpg', '滋润型 400ml', '无印良品 MUJI 基础润肤乳液', 80.00, 100.00, b'1', 1000, '杰普官方直营', 110, 10006, 20012, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10007, b'1', 101.60, '/images/shops/558422d1-640e-442d-a073-2b2bdd95c4ed.jpg', '高保湿型 400ml', '无印良品 MUJI 基础润肤化妆水', 101.60, 127.00, b'1', 1000, '杰普官方直营', 107, 10007, 20014, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10008, b'1', 56.00, '/images/shops/89660409-78b7-4d47-ae12-f94b3ce9664b.png', '清爽型 200ml', '无印良品 MUJI 基础润肤化妆水', 56.00, 70.00, b'1', 1000, '杰普官方直营', 107, 10008, 20016, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10011, b'1', 52.00, '/images/shops/16230038-bf86-4d4e-a11f-954b9ee4bab2.jpg', '杰普精选', '无印良品 MUJI 平衡高保湿化妆水', 52.00, 65.00, b'1', 1000, '杰普官方直营', 107, 10011, 20022, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10014, b'0', NULL, '/images/shops/d66b6e0e-48d4-4503-8dd6-43b3c71f52a4.png', '清爽型 200ml', '无印良品 MUJI 基础润肤乳液', 56.00, 70.00, b'1', 1000, '杰普官方直营', 110, 10014, 20028, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10016, b'0', NULL, '/images/shops/e553f566-5dc4-4648-be58-fd7112a47b10.jpg', '滋润型 200ml', '无印良品 MUJI 基础润肤乳液', 48.80, 61.00, b'1', 1000, '杰普官方直营', 110, 10016, 20032, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10023, b'0', NULL, '/images/shops/ea92b50a-67ba-4279-a71a-4e52e6a3219c.jpg', '400ml', '无印良品 MUJI 大容量基础乳液/高保湿型', 112.00, 140.00, b'1', 1000, '杰普官方直营', 110, 10023, 20046, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10024, b'0', NULL, '/images/shops/beb26b1b-7a73-48c2-a9f7-727ad92401f6.jpg', '滋润型 400ml', '无印良品 MUJI 基础润肤化妆水', 80.00, 100.00, b'1', 1000, '杰普官方直营', 107, 10024, 20048, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10026, b'0', NULL, '/images/shops/4059caa9-e0b3-4ac3-a494-b9e4c47e0185.jpg', '高保湿型 200ml', '无印良品 MUJI 基础润肤乳液', 66.40, 83.00, b'1', 1000, '杰普官方直营', 110, 10026, 20052, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10027, b'0', NULL, '/images/shops/a4a4c981-da0f-4228-bcc7-97d970dc619c.jpg', '滋润型 400ml', '无印良品 MUJI 基础润肤乳液', 80.00, 100.00, b'1', 1000, '杰普官方直营', 110, 10027, 20054, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10028, b'0', NULL, '/images/shops/98b5c5b5-cc75-4dfb-8ec4-0a7f42af6183.jpg', '高保湿型 400ml', '无印良品 MUJI 基础润肤化妆水', 101.60, 127.00, b'1', 1000, '杰普官方直营', 107, 10028, 20056, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10029, b'0', NULL, '/images/shops/71d1f469-b77b-473a-a31a-78fc97859b3a.png', '清爽型 200ml', '无印良品 MUJI 基础润肤化妆水', 56.00, 70.00, b'1', 1000, '杰普官方直营', 107, 10029, 20058, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10032, b'0', NULL, '/images/shops/eb13afc6-8898-4a50-9f93-06dd2593c313.jpg', '杰普精选', '无印良品 MUJI 平衡高保湿化妆水', 52.00, 65.00, b'1', 1000, '杰普官方直营', 107, 10032, 20064, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10035, b'0', NULL, '/images/shops/1e09e1ed-435b-4f08-84d0-d88308a315ee.png', '清爽型 200ml', '无印良品 MUJI 基础润肤乳液', 56.00, 70.00, b'1', 1000, '杰普官方直营', 110, 10035, 20070, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10037, b'0', NULL, '/images/shops/9389914c-2860-4a75-b603-53ed5a4e0509.jpg', '滋润型 200ml', '无印良品 MUJI 基础润肤乳液', 48.80, 61.00, b'1', 1000, '杰普官方直营', 110, 10037, 20074, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10044, b'0', NULL, '/images/shops/69d55773-1b43-497b-af18-90f2cec7c93a.jpg', '400ml', '无印良品 MUJI 大容量基础乳液/高保湿型', 112.00, 140.00, b'1', 1000, '杰普官方直营', 110, 10044, 20088, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10058, b'0', NULL, '/images/shops/af7f9b21-d782-4bad-8b1a-d86bbc4d224e.png', '清爽型 50ml', '无印良品 MUJI 基础润肤化妆水', 17.60, 22.00, b'1', 1000, '杰普官方直营', 107, 10058, 20116, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10063, b'0', NULL, '/images/shops/7577f3e0-f48b-47a9-96b7-de405a6aaf95.png', '滋润型 200ml', '无印良品 MUJI 基础润肤化妆水', 56.00, 70.00, b'1', 1000, '杰普官方直营', 107, 10063, 20126, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10080, b'0', NULL, '/images/shops/9b4af7cf-235a-4742-bdc3-9e8e656f245c.png', '清爽型 50ml', '无印良品 MUJI 基础润肤化妆水', 17.60, 22.00, b'1', 1000, '杰普官方直营', 107, 10080, 20160, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10085, b'0', NULL, '/images/shops/954da201-0cbb-45d1-9cd1-17ce4d24cfb4.png', '滋润型 200ml', '无印良品 MUJI 基础润肤化妆水', 56.00, 70.00, b'1', 1000, '杰普官方直营', 107, 10085, 20170, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10098, b'0', NULL, '/images/shops/4eed1033-7728-477c-a29d-589bfd3ae3ce.jpg', '50ml', '无印良品 MUJI 乳液', 21.60, 27.00, b'1', 1000, '杰普官方直营', 110, 10098, 20196, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10116, b'0', NULL, '/images/shops/cd6d91b0-69b2-4415-8560-4cbd2690cb50.jpg', '50ml', '无印良品 MUJI 乳液', 21.60, 27.00, b'1', 1000, '杰普官方直营', 110, 10116, 20232, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10129, b'0', NULL, '/images/shops/01514263-83b4-4ac7-aee3-5e5a2448414f.jpg', '高保湿型 50ml', '无印良品 MUJI 基础润肤乳液', 23.20, 29.00, b'1', 1000, '杰普官方直营', 110, 10129, 20258, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10139, b'0', NULL, '/images/shops/b8978340-ff72-4b5a-a9d3-4b5610982764.jpg', '滋润型', '无印良品 MUJI 基础润肤乳液', 17.60, 22.00, b'1', 1000, '杰普官方直营', 110, 10139, 20278, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10146, b'0', NULL, '/images/shops/a12dcb9c-bb36-4df9-b517-1578a03fe062.jpg', '高保湿型 50ml', '无印良品 MUJI 基础润肤乳液', 23.20, 29.00, b'1', 1000, '杰普官方直营', 110, 10146, 20292, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10156, b'0', NULL, '/images/shops/f65ef709-8fa8-4a3f-8abd-75a9b0492b14.jpg', '滋润型', '无印良品 MUJI 基础润肤乳液', 17.60, 22.00, b'1', 1000, '杰普官方直营', 110, 10156, 20312, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10158, b'0', NULL, '/images/shops/5488564b-8335-4b0c-a5a4-52f3f03ee728.jpg', '黑*横条 L', '无印良品 女式粗棉线条纹长袖T恤', 56.00, 70.00, b'1', 985, '杰普官方直营', 20, 10158, 20316, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10159, b'0', NULL, '/images/shops/53c9f268-7cd4-4fac-909c-2dc066625655.jpg', '苹果蓝牙耳机', 'Apple AirPods 配充电盒', 996.80, 1246.00, b'1', 987, '杰普官方直营', 109, 10159, 20318, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10160, b'0', NULL, '/images/shops/c47403f1-b706-453b-88d8-2bfdee0316be.jpg', '真无线蓝牙耳机|分体式耳机 |收纳充电盒 |蓝牙5.0 |按键防触控操作', '小米 Redmi AirDots', 103.20, 129.00, b'1', 998, '杰普官方直营', 109, 10160, 20320, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10161, b'0', NULL, '/images/shops/183481c3-47ff-4b2e-926f-b02b926ac02c.jpg', '杰普精选', '荣耀原装三键线控带麦半入耳式耳机AM116(尊爵版)适用于华为荣耀手机', 39.20, 49.00, b'1', 1000, '杰普官方直营', 109, 10161, 20322, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10162, b'0', NULL, '/images/shops/5e0d089b-fa91-410d-8ff2-9534eb6f627f.jpg', '杰普精选', '诺基亚（NOKIA）BH-705 银白色 5.0真无线蓝牙耳机迷你运动跑步音乐商务入耳式安卓苹果手机蓝牙耳机', 399.20, 499.00, b'1', 1000, '杰普官方直营', 109, 10162, 20324, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10163, b'0', NULL, '/images/shops/79e2b467-a075-46ef-ab43-aa0535f8e4c9.jpg', '杰普精选', '华为耳机原装半入耳式有线mate9p10plus8x荣耀v20v10nova2s9iv9p9play 【标准版】华为AM115 白色-热卖款', 31.20, 39.00, b'1', 999, '杰普官方直营', 109, 10163, 20326, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10164, b'0', NULL, '/images/shops/911531a4-39a6-4771-b26e-2ba4db1ebcda.jpg', '入耳式耳机 带麦可通话 -桀骜黑红（十周年版） MRQA2PA/A', 'Beats X 蓝牙无线', 639.20, 799.00, b'1', 1000, '杰普官方直营', 109, 10164, 20328, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10165, b'0', NULL, '/images/shops/e70a4f29-2269-466a-984e-01e018206c2e.jpg', '真无线蓝牙耳机 双耳蓝牙音乐耳机 Freebuds 2 无线耳机 陶瓷白', '华为（ HUAWEI） 华为无线耳机', 639.20, 799.00, b'1', 1000, '杰普官方直营', 109, 10165, 20330, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10166, b'0', NULL, '/images/shops/70dc1586-13bd-4b4c-92a9-fe20aa1d531f.jpg', '杰普精选', '【自营仓次日达】moloke真无线蓝牙耳机双耳适用于苹果华为小米 运动跑步入耳式oppo迷你商务耳机 【1:1尊享版】自动弹窗+无线充电+可触控（热卖）', 159.20, 199.00, b'1', 1000, '杰普官方直营', 109, 10166, 20332, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10167, b'0', NULL, '/images/shops/04441cd4-81c8-4ad9-a067-9d15422e508f.jpg', '完全无线高性能耳机 真无线蓝牙运动耳机 象牙白', 'Beats Powerbeats Pro', 1510.40, 1888.00, b'1', 1000, '杰普官方直营', 109, 10167, 20334, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10168, b'0', NULL, '/images/shops/ad53ea23-6974-4e44-b62d-eab498ce1d63.jpg', '杰普精选', '纽曼（Newmine）NM-LK06 全兼容线控音乐手机耳机 白色', 7.20, 9.00, b'1', 1000, '杰普官方直营', 109, 10168, 20336, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10169, b'0', NULL, '/images/shops/01e1998d-f183-4e99-b8ba-7715727cf90b.jpg', '杰普精选', '索尼（SONY）重低音立体声耳机MDR-XB55AP 黑色', 148.00, 185.00, b'1', 1000, '杰普官方直营', 109, 10169, 20338, '*黑色实物偏灰，请以实物为准 Bass Booster低音增强器技术可呈现紧实深邃低频。 12 毫米驱动单元和110dB/mW 的高灵敏度，呈现高质感音效。 人体工学设计的倾斜入耳方式，让耳塞能够深入耳朵内部，呈现出色的隔音效果，同时带来舒适的佩戴感和高音质的享受。 耳塞能够深入耳朵内部，呈现出色的隔音效果，同时为您带来舒适的佩戴感和高音质的享受。 采用混合两种硬度硅胶的耳塞套： 核心部分使用硬质材料保持音质，减少因耳塞变形导致的声音失真； 外围部分柔软材料提高了耳塞密闭性，让您能长时间舒适佩戴。 *线控的可用性及操作因智能手机而异 耳机线表面细小沟壑，减少容易引起缠绕的摩擦，使导线不容易纠结在一起，方便欣赏音乐和携带。 防缠绕耳机线 盲点设计 便携袋 防尘滤网 导线滑块 4种尺寸耳塞套 摘下耳机的耳塞套，可见保护单元的网罩，用来防止异物和灰尘堵塞单元，使耳机经久耐听。 在左耳外壳和耳机线的连接处设有浮点，凭手指触摸就能判别左右耳，方便操作。 随机附赠收纳袋一只，保护你心爱的耳机。 利用导线滑块来调整左右耳机线的长度，也能够减少收纳耳机时容易出现的缠线现象 提供4对不同尺寸（SS、S、M、L）的耳塞套（M号出厂时已安装至耳机上），根据你的耳洞大小自由更换，获得良好的隔音效果，佩戴舒适。 ● 立体声耳机 ● 混合硅胶耳塞（SS/S/M/L 每种尺寸2个) *M号出厂时安装至本耳机。 ● 便携袋(×1) *EXTRA BASS 和 EXTRABASS 是索尼公司的商标', NULL);
INSERT INTO `t_shop` VALUES (10170, b'0', NULL, '/images/shops/1631a30b-287c-41da-bbbe-1a9b1b8d1552.jpg', '无线蓝牙耳机 高音质降噪耳机 手机通话 黑色', '索尼（SONY）WI-1000X Hi-Res颈挂式 入耳式', 1199.20, 1499.00, b'1', 1000, '杰普官方直营', 109, 10170, 20340, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10171, b'0', NULL, '/images/shops/f3d269a4-5317-4b30-b164-1311f6c1f058.jpg', '杰普精选', '小米耳机 圈铁Pro 入耳式有线运动音乐耳机耳麦', 119.20, 149.00, b'1', 1000, '杰普官方直营', 109, 10171, 20342, '使用双动圈 + 动铁 三单元发声 ／ 均衡自然声音 高保真石墨烯振膜 ／ 25 道工序打磨 ／ 弹力磨砂线材 Pro 小米圈铁耳机 孕育万物的天空和大地，时刻传达着声音的释放与组合，更是寻找灵感的源头，鸟鸣、流水、雷响、风啸不同的声音互相交融，共同演奏出自然的本真。 小米圈铁耳机 Pro 使用双“动圈”单元+“动铁”单元，将三个单元共同融入到同一个耳机中，双“动圈”的醇厚低音，让声音更加扎实稳重，石墨烯材料的加入，则让声音的细节更为丰富。“动铁”的高音透亮，稳定自然，感受三频均衡的本色声音。随着声音的流淌，仿佛置身自然，听见这些细节，让声音一开始就感动内心。 双动圈+动铁，三单元发声，听见更多细节 为了可以真正实现高、中、低三频均衡，小米圈铁耳机 Pro  加入了双“动圈”单元，大动圈负责中低频，小动圈负责高频。在“动铁”单元的配合下，耳机的低频下潜深，中频声音扎实，而高频的细节展现更为丰富。那些刚刚好的声音，听在耳里，都在心里。 三频更均衡，声音更自然 我们听到的绝大多数乐器、人声，都在中低频段。为了让这部分声音更均衡、有感染力，我们都交由采用了石墨烯振膜的双动圈单元来负责，中低频更扎实，兼具丰富细节表现力。 石墨烯是目前自然界已知材料中轻薄、强度更高的材料，对声音的传导速度快，将它用作振膜材质，高频延展性能更好，细节丰富，声音清澈自然，更富穿透力。同时强度又是钢铁的100倍， 可以尽可能还原出电流信号， 真正发出高保真的好声音。 石墨烯振膜，让双动圈更有实力 小米圈铁耳机 Pro 的“动铁”单元依然采用自主研发的 \"衔铁＋驱动杆\" 结构，让声音细腻真实，更为稳定，在电容分频器的作用下，让高中低音衔接更好，失真更少。不论当你听何种音乐，细腻的感情都会被准确还原，听每首歌就像读每个故事，时刻感动自己。 动铁单元设计，高频解析好，细节不失真 好的音乐人将情感与生活用真实的方式，转化为音乐传递给每个人，每首歌都是一个故事，铭刻在各自的记忆中，为了让故事更好的表达，小米圈铁耳机 Pro 在科学客观调音的基础上，再次邀请到荣获 4 次格莱美大奖的 Luca Bignardi，为小米圈铁耳机 Pro 进行主观调音，为的就是让每个喜爱音乐的人能够真切的感受到每一个故事，跟随内心，娓娓道来... 多种科学调音，让声音更鲜活，更温暖 当耳机真正为声音服务时，设计将不再只是修饰耳机外观的道具，它将会成为辅助声音的一部分，小米圈铁耳机 Pro 采用圆润的设计风格，45° 斜角入耳设计，在满足舒适的同时更保证了声音的完整呈现。精密金属音腔设计，让音乐沉于耳畔，更有声音质感，弹力 TPE 磨砂线材的选用，让耳机线更为坚固耐用，确保耳机长久使用。一副好耳机，让声音和外表一起美好。 全新的外观设计，和声音一起美好 好的设计需要灵感，而灵感源于生活，为了锁住声音的灵感，小米圈铁耳机 Pro 将耳塞设计成45°斜角式入耳，贴合耳道，满足佩戴舒适感的同时尽可能减少外界声音干扰，毫无保留地听自己爱的音乐。 45°斜角入耳，舒适佩戴 小米圈铁耳机 Pro 的线控麦克风从耳机整体设计风格出发，金属磨砂弹头造型，精致小巧，指压按键圆润舒适，听歌的同时，更能感知指尖上的金属质感。 小米圈铁耳机 Pro 的耳机线材选取 TPE 材质，作为一种具有橡胶的高弹性材质， 触感柔软、耐温等特性，用它做成耳机线，将更为抗拉、耐用并且不易缠绕。让好音乐的陪伴更长久。 小米圈铁耳机 Pro 的耳塞选取奶嘴级硅胶材质，触感柔软顺滑，减少了耳塞对皮肤的刺激，让肌肤倍感亲密，同时提供四对不同尺寸的耳塞套，让佩戴者根据不同需求选择，带上它，向自己喜爱的音乐问好！ 用匠心打磨每一件产品，即使过程艰难复杂，也依然充满斗志，小米圈铁耳机 Pro 的诞生过程就是这样。25 道工序打造的金属音腔，每一处细节都精心打磨，一体成型钻石切割、细密 CD 纹雕刻、锆石喷砂、阳极氧化，千锤百炼，不放过每个细节，将金属打磨成入耳的艺术品，这就是小米圈铁耳机 Pro 对音乐执着，对好产品更要执着。 小米圈铁耳机 Pro 是铝合金音腔，采用了 CNC 钻石切割一刀成型工艺，加工精度高达0.01mm，这种工艺在对铝合金加工前都要进行工艺分析，选择合适的刀具及切削用量，将打磨成型，让耳机具有更细腻润泽的手感。 小米圈铁耳机 Pro 运用精密的 CD 纹处理，纹理细至 0.14mm，散发金属光泽，就像耳机的指纹一样。如此的精密打磨，只为让小米圈铁耳机 Pro 更具质感，让金属更光辉熠熠。 选用精细锆石喷砂，赋予小米圈铁耳机 Pro 细致均匀的外观，有效保证了耳机表面硬度，不易刮伤。出厂时，会在小米圈铁耳机 Pro 表层增加阳极处理，保证了美观程度和耐磨性，6μ的阳极厚度，坚固、耐磨，做传达好声音的艺术品。 拥有超过 700 项高于行业标准的苛刻测试，每一种测试都见证了小米圈铁耳机 Pro 的高品质， 从音乐品质到设计创新，再到匠心工艺，集合好耳机的所有亮点，都只为带给用户更好的音乐体验和使用感受，好的声音，一定需要千锤百炼 。', NULL);
INSERT INTO `t_shop` VALUES (10172, b'0', NULL, '/images/shops/966a8b32-f547-457c-9161-009d3113d584.jpg', '无线耳机 QC30耳塞式蓝牙降噪耳麦', 'Bose QuietControl 30', 1998.40, 2498.00, b'1', 1000, '杰普官方直营', 109, 10172, 20344, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10173, b'0', NULL, '/images/shops/72218e28-fc58-4aa0-b3cd-c1f2c764d25e.jpg', '头戴式 蓝牙无线耳机 手机耳机 游戏耳机 - 桀骜黑红（十周年版） MRQC2PA/A', 'Beats Solo3 Wireless', 1358.40, 1698.00, b'1', 1000, '杰普官方直营', 109, 10173, 20346, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10174, b'0', NULL, '/images/shops/4cc6c606-4d69-4f49-b10c-01cedeef813f.jpg', '智能降噪 长久续航）黑色', '索尼（SONY）WH-1000XM3 高解析度无线蓝牙降噪 头戴式耳机（触控面板', 2079.20, 2599.00, b'1', 1000, '杰普官方直营', 109, 10174, 20348, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10175, b'0', NULL, '/images/shops/7345c467-6c2d-4f30-a73d-83d675d5208c.jpg', '北海巨妖标准版升级款 头戴式游戏耳机 电竞耳麦 7.1 电脑手机耳机 黑色', '雷蛇 Razer 北海巨妖标准版X', 239.20, 299.00, b'1', 1000, '杰普官方直营', 109, 10175, 20350, '产品信息Product Information 产品规格Product Specifications 品牌介绍Brand Introduction 注意事项Warning & Caution 雷蛇产品在出厂时会进行检测，脚贴及USB接口处如有轻微划痕属于正常测试痕迹。 RAZER关于划痕的注意事项： 以上数据图片均为官方测试环境下结果，因使用环境/设备不同会存在一定的差异，仅供参考，数据请以实际为准！  1. 产品实物与外包装上的SN（序列号）必须一致； 2. 产品外包装不能严重破损，盒内的相关配件要齐全，不能有缺失； 3. 不能有明显的人为破损（表面有明显的人为划痕，使用及存在拆卸的痕迹）； 4. 防伪标签不得撕开或损毁。 RAZER关于7天无理由退换货的注意事项： ', NULL);
INSERT INTO `t_shop` VALUES (10176, b'0', NULL, '/images/shops/efea018e-8ab0-47f9-a3d4-260c8cd2de5f.jpg', '黑色', '森海塞尔（Sennheiser）MomentumTrueWireless 真无线蓝牙hifi发烧入耳式耳机 蓝牙5.0', 1919.20, 2399.00, b'1', 1000, '杰普官方直营', 109, 10176, 20352, '聆听带来改变 真     无     线     蓝     牙     HiFi     耳     机 MOMENTUM 真无线 懂你所需 全新的 MOMENTUM 真无线耳机，高品质的声音质量传承 MOMENTUM 品质，成为一款具有重要技术成就的新产品。 这款性能优异的蓝牙耳机融合音频质量、佩戴舒适性和精致设计及工艺。 全新的 MOMENTUM 透明聆听功能 防水防泼溅 电池使用时长 （4+8小时） 精雕细琢 经典优雅 高品质声音质量 智能降噪 智能触控操作 支持蓝牙5.0技术 智能触控操作 支持蓝牙 5.0技术 MOMENTUM真无线耳机采用Sennheiser发烧级别7毫米动圈驱动单元，可确保饱满的立体声效果，带来高保真音质，为苛刻的听者带来出色的高保真度。 高品质声音质量 两侧触摸区域都有单独的控制功能，您可以轻松使用右耳耳机语音访问智能助手（如苹果 Siri或Google智能助手）。 轻轻点击或滑动触摸界面，使用自然语音命令即可播放音乐、接听电话。 支持蓝牙5.0技术及编解码技术（包括AAC、Qualcomm apt-XTM和apt-X低延迟），这款耳机带来出众的连接稳定性和音频流畅性。 真正的无线体验 轻松适配周围环境 MOMENTUM 真无线耳机让你更好地感知外部环境，透明聆听让你能听到周围的环境声，从而更好地感知周围的环境，不需要摘掉耳机就能融入到自然的交谈之中。甚至在嘈杂的环境中，电话呼叫和语音交互也能够通过双话筒波束成形技术得以实现。 智能交互 通过自动开启/关闭和智能暂停功能，可以检测到耳机何时被收起来或者不使用，从而节约能源。 你的世界由你把控 通过双击右耳耳机开/关透明聆听功能 打开透明聆听=接收周围环境音 关闭透明聆听=物理降噪模式，不接收周围音 不需要摘掉耳机就可轻松地与周围人进行交谈。 4种尺寸的耳垫可选，均符合人体工程学设计，防水防泼溅，能够满足用户舒适佩戴的需求。 个性定制舒适体验 MOMENTUM真无线拥有4小时电池续航时间，可通过其带有集成电源的小巧耳机盒进行充电，从而享受长达12（4+8）小时的全天聆听乐趣，并满足未来所需。 镀金充电接触点 可磁性吸附到充电盒上 高保真7毫米动圈驱动单元 带来出色的声音重放 金属镭射表面 具有触控功能 多色 LED指示灯 用于语音信号拾取和透明聆听功能的话筒 舒适的入耳式 硅胶耳垫 便捷充电盒持久续航 注重细节、富于美感，这款小巧、 靓丽而轻盈的耳机是技术与艺术的 结合。它既是声音重放技术的成就，更是你耳畔精美的配饰。 质感黑色外壳，闪烁的金属镭射表面，镀金的充电接触点——时尚与功能融合于标志性的设计之中，带来优雅和实用感。 Sennheiser智能控制 MOMENTUM 真无线耳机提供了更为智能和个性化的体验，可以通过新款Sennheiser智能控制应用进行优化，根据个人喜好，利用内置音频EQ对声音进行微调。免费下载，兼容iOS 版本 11.0 及以上版本和Android 版本 7.0 及以上版本 ，简便直观的控制界面，为您的耳机提供个性化的配置和升级等功能。 APP 下载方法 Android 版本 7.0 及以上版本 打开链接下载APP https://share.weiyun.com/54byqjn iOS 版本 11.0 及以上版本 打开APP Store搜索 Sennheiser smart control 下载APP', NULL);
INSERT INTO `t_shop` VALUES (10177, b'0', NULL, '/images/shops/b3de8a39-e33c-432f-872f-46f4a1662498.jpg', '真无线蓝牙耳机--黑色 运动耳机 防掉落耳塞', 'Bose SoundSport Free', 1359.20, 1699.00, b'1', 1000, '杰普官方直营', 109, 10177, 20354, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10178, b'0', NULL, '/images/shops/d6565a7e-473b-4933-93c5-e646495c8c4c.jpg', '杰普精选', '华为原装降噪有线手机耳机Mate9 10P9P10Plus荣耀V9V10PlayNova2s9i8x 【送耳机收纳包】AM115半入耳式耳机-经典热卖款', 31.20, 39.00, b'1', 1000, '杰普官方直营', 109, 10178, 20356, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10179, b'0', NULL, '/images/shops/bf6ccbc4-d0d0-4fbb-b975-4becb9cb38f4.jpg', '耳机', 'Apple 采用Lightning/闪电接头的 EarPods', 178.40, 223.00, b'1', 1000, '杰普官方直营', 109, 10179, 20358, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10180, b'0', NULL, '/images/shops/64768a8d-0664-4b29-88c9-2626578ffbd1.jpg', '苹果蓝牙耳机', 'Apple AirPods 配充电盒', 996.80, 1246.00, b'1', 995, '杰普官方直营', 109, 10180, 20360, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10181, b'0', NULL, '/images/shops/36d0fe8f-aa28-423c-81e7-82cab31b7598.jpg', '真无线蓝牙耳机|分体式耳机 |收纳充电盒 |蓝牙5.0 |按键防触控操作', '小米 Redmi AirDots', 103.20, 129.00, b'1', 1000, '杰普官方直营', 109, 10181, 20362, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10182, b'0', NULL, '/images/shops/6113a562-f3f1-408c-9b0d-78a84407caf7.jpg', '杰普精选', '荣耀原装三键线控带麦半入耳式耳机AM116(尊爵版)适用于华为荣耀手机', 39.20, 49.00, b'1', 1000, '杰普官方直营', 109, 10182, 20364, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10183, b'0', NULL, '/images/shops/abb13d3a-3445-4b26-b8e9-44cbec227b5d.jpg', '杰普精选', '诺基亚（NOKIA）BH-705 银白色 5.0真无线蓝牙耳机迷你运动跑步音乐商务入耳式安卓苹果手机蓝牙耳机', 399.20, 499.00, b'1', 1000, '杰普官方直营', 109, 10183, 20366, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10184, b'0', NULL, '/images/shops/fac9c3e9-4843-46d1-8668-7e2eac17ccf2.jpg', '杰普精选', '华为耳机原装半入耳式有线mate9p10plus8x荣耀v20v10nova2s9iv9p9play 【标准版】华为AM115 白色-热卖款', 31.20, 39.00, b'1', 1000, '杰普官方直营', 109, 10184, 20368, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10185, b'0', NULL, '/images/shops/25910a34-e026-4954-87b0-c379999e1dd0.jpg', '入耳式耳机 带麦可通话 -桀骜黑红（十周年版） MRQA2PA/A', 'Beats X 蓝牙无线', 639.20, 799.00, b'1', 1000, '杰普官方直营', 109, 10185, 20370, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10186, b'0', NULL, '/images/shops/adf8cbc2-ccb9-408a-96d0-553848e111e9.jpg', '真无线蓝牙耳机 双耳蓝牙音乐耳机 Freebuds 2 无线耳机 陶瓷白', '华为（ HUAWEI） 华为无线耳机', 639.20, 799.00, b'1', 1000, '杰普官方直营', 109, 10186, 20372, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10187, b'0', NULL, '/images/shops/1e5645d1-24cb-48eb-9aaa-f729fa0db195.jpg', '杰普精选', '【自营仓次日达】moloke真无线蓝牙耳机双耳适用于苹果华为小米 运动跑步入耳式oppo迷你商务耳机 【1:1尊享版】自动弹窗+无线充电+可触控（热卖）', 159.20, 199.00, b'1', 1000, '杰普官方直营', 109, 10187, 20374, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10188, b'0', NULL, '/images/shops/e028c016-6793-49a3-8b0f-d0102a415d21.jpg', '完全无线高性能耳机 真无线蓝牙运动耳机 象牙白', 'Beats Powerbeats Pro', 1510.40, 1888.00, b'1', 1000, '杰普官方直营', 109, 10188, 20376, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10189, b'0', NULL, '/images/shops/0b02244f-6908-4ccb-a9d2-ccb5a462e30e.jpg', '杰普精选', '纽曼（Newmine）NM-LK06 全兼容线控音乐手机耳机 白色', 7.20, 9.00, b'1', 1000, '杰普官方直营', 109, 10189, 20378, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10190, b'0', NULL, '/images/shops/eec7b009-a9ff-45cd-a7be-4051eb7b3c22.jpg', '杰普精选', '索尼（SONY）重低音立体声耳机MDR-XB55AP 黑色', 148.00, 185.00, b'1', 1000, '杰普官方直营', 109, 10190, 20380, '*黑色实物偏灰，请以实物为准 Bass Booster低音增强器技术可呈现紧实深邃低频。 12 毫米驱动单元和110dB/mW 的高灵敏度，呈现高质感音效。 人体工学设计的倾斜入耳方式，让耳塞能够深入耳朵内部，呈现出色的隔音效果，同时带来舒适的佩戴感和高音质的享受。 耳塞能够深入耳朵内部，呈现出色的隔音效果，同时为您带来舒适的佩戴感和高音质的享受。 采用混合两种硬度硅胶的耳塞套： 核心部分使用硬质材料保持音质，减少因耳塞变形导致的声音失真； 外围部分柔软材料提高了耳塞密闭性，让您能长时间舒适佩戴。 *线控的可用性及操作因智能手机而异 耳机线表面细小沟壑，减少容易引起缠绕的摩擦，使导线不容易纠结在一起，方便欣赏音乐和携带。 防缠绕耳机线 盲点设计 便携袋 防尘滤网 导线滑块 4种尺寸耳塞套 摘下耳机的耳塞套，可见保护单元的网罩，用来防止异物和灰尘堵塞单元，使耳机经久耐听。 在左耳外壳和耳机线的连接处设有浮点，凭手指触摸就能判别左右耳，方便操作。 随机附赠收纳袋一只，保护你心爱的耳机。 利用导线滑块来调整左右耳机线的长度，也能够减少收纳耳机时容易出现的缠线现象 提供4对不同尺寸（SS、S、M、L）的耳塞套（M号出厂时已安装至耳机上），根据你的耳洞大小自由更换，获得良好的隔音效果，佩戴舒适。 ● 立体声耳机 ● 混合硅胶耳塞（SS/S/M/L 每种尺寸2个) *M号出厂时安装至本耳机。 ● 便携袋(×1) *EXTRA BASS 和 EXTRABASS 是索尼公司的商标', NULL);
INSERT INTO `t_shop` VALUES (10191, b'0', NULL, '/images/shops/1c4adfba-f2f4-4ab3-8520-c28b0a437b7b.jpg', '无线蓝牙耳机 高音质降噪耳机 手机通话 黑色', '索尼（SONY）WI-1000X Hi-Res颈挂式 入耳式', 1199.20, 1499.00, b'1', 1000, '杰普官方直营', 109, 10191, 20382, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10192, b'0', NULL, '/images/shops/b1530f7f-d286-4eb1-8d2b-3c2a74fa9f06.jpg', '杰普精选', '小米耳机 圈铁Pro 入耳式有线运动音乐耳机耳麦', 119.20, 149.00, b'1', 1000, '杰普官方直营', 109, 10192, 20384, '使用双动圈 + 动铁 三单元发声 ／ 均衡自然声音 高保真石墨烯振膜 ／ 25 道工序打磨 ／ 弹力磨砂线材 Pro 小米圈铁耳机 孕育万物的天空和大地，时刻传达着声音的释放与组合，更是寻找灵感的源头，鸟鸣、流水、雷响、风啸不同的声音互相交融，共同演奏出自然的本真。 小米圈铁耳机 Pro 使用双“动圈”单元+“动铁”单元，将三个单元共同融入到同一个耳机中，双“动圈”的醇厚低音，让声音更加扎实稳重，石墨烯材料的加入，则让声音的细节更为丰富。“动铁”的高音透亮，稳定自然，感受三频均衡的本色声音。随着声音的流淌，仿佛置身自然，听见这些细节，让声音一开始就感动内心。 双动圈+动铁，三单元发声，听见更多细节 为了可以真正实现高、中、低三频均衡，小米圈铁耳机 Pro  加入了双“动圈”单元，大动圈负责中低频，小动圈负责高频。在“动铁”单元的配合下，耳机的低频下潜深，中频声音扎实，而高频的细节展现更为丰富。那些刚刚好的声音，听在耳里，都在心里。 三频更均衡，声音更自然 我们听到的绝大多数乐器、人声，都在中低频段。为了让这部分声音更均衡、有感染力，我们都交由采用了石墨烯振膜的双动圈单元来负责，中低频更扎实，兼具丰富细节表现力。 石墨烯是目前自然界已知材料中轻薄、强度更高的材料，对声音的传导速度快，将它用作振膜材质，高频延展性能更好，细节丰富，声音清澈自然，更富穿透力。同时强度又是钢铁的100倍， 可以尽可能还原出电流信号， 真正发出高保真的好声音。 石墨烯振膜，让双动圈更有实力 小米圈铁耳机 Pro 的“动铁”单元依然采用自主研发的 \"衔铁＋驱动杆\" 结构，让声音细腻真实，更为稳定，在电容分频器的作用下，让高中低音衔接更好，失真更少。不论当你听何种音乐，细腻的感情都会被准确还原，听每首歌就像读每个故事，时刻感动自己。 动铁单元设计，高频解析好，细节不失真 好的音乐人将情感与生活用真实的方式，转化为音乐传递给每个人，每首歌都是一个故事，铭刻在各自的记忆中，为了让故事更好的表达，小米圈铁耳机 Pro 在科学客观调音的基础上，再次邀请到荣获 4 次格莱美大奖的 Luca Bignardi，为小米圈铁耳机 Pro 进行主观调音，为的就是让每个喜爱音乐的人能够真切的感受到每一个故事，跟随内心，娓娓道来... 多种科学调音，让声音更鲜活，更温暖 当耳机真正为声音服务时，设计将不再只是修饰耳机外观的道具，它将会成为辅助声音的一部分，小米圈铁耳机 Pro 采用圆润的设计风格，45° 斜角入耳设计，在满足舒适的同时更保证了声音的完整呈现。精密金属音腔设计，让音乐沉于耳畔，更有声音质感，弹力 TPE 磨砂线材的选用，让耳机线更为坚固耐用，确保耳机长久使用。一副好耳机，让声音和外表一起美好。 全新的外观设计，和声音一起美好 好的设计需要灵感，而灵感源于生活，为了锁住声音的灵感，小米圈铁耳机 Pro 将耳塞设计成45°斜角式入耳，贴合耳道，满足佩戴舒适感的同时尽可能减少外界声音干扰，毫无保留地听自己爱的音乐。 45°斜角入耳，舒适佩戴 小米圈铁耳机 Pro 的线控麦克风从耳机整体设计风格出发，金属磨砂弹头造型，精致小巧，指压按键圆润舒适，听歌的同时，更能感知指尖上的金属质感。 小米圈铁耳机 Pro 的耳机线材选取 TPE 材质，作为一种具有橡胶的高弹性材质， 触感柔软、耐温等特性，用它做成耳机线，将更为抗拉、耐用并且不易缠绕。让好音乐的陪伴更长久。 小米圈铁耳机 Pro 的耳塞选取奶嘴级硅胶材质，触感柔软顺滑，减少了耳塞对皮肤的刺激，让肌肤倍感亲密，同时提供四对不同尺寸的耳塞套，让佩戴者根据不同需求选择，带上它，向自己喜爱的音乐问好！ 用匠心打磨每一件产品，即使过程艰难复杂，也依然充满斗志，小米圈铁耳机 Pro 的诞生过程就是这样。25 道工序打造的金属音腔，每一处细节都精心打磨，一体成型钻石切割、细密 CD 纹雕刻、锆石喷砂、阳极氧化，千锤百炼，不放过每个细节，将金属打磨成入耳的艺术品，这就是小米圈铁耳机 Pro 对音乐执着，对好产品更要执着。 小米圈铁耳机 Pro 是铝合金音腔，采用了 CNC 钻石切割一刀成型工艺，加工精度高达0.01mm，这种工艺在对铝合金加工前都要进行工艺分析，选择合适的刀具及切削用量，将打磨成型，让耳机具有更细腻润泽的手感。 小米圈铁耳机 Pro 运用精密的 CD 纹处理，纹理细至 0.14mm，散发金属光泽，就像耳机的指纹一样。如此的精密打磨，只为让小米圈铁耳机 Pro 更具质感，让金属更光辉熠熠。 选用精细锆石喷砂，赋予小米圈铁耳机 Pro 细致均匀的外观，有效保证了耳机表面硬度，不易刮伤。出厂时，会在小米圈铁耳机 Pro 表层增加阳极处理，保证了美观程度和耐磨性，6μ的阳极厚度，坚固、耐磨，做传达好声音的艺术品。 拥有超过 700 项高于行业标准的苛刻测试，每一种测试都见证了小米圈铁耳机 Pro 的高品质， 从音乐品质到设计创新，再到匠心工艺，集合好耳机的所有亮点，都只为带给用户更好的音乐体验和使用感受，好的声音，一定需要千锤百炼 。', NULL);
INSERT INTO `t_shop` VALUES (10193, b'0', NULL, '/images/shops/02cf272e-9062-4d4b-8b7f-7058f0472efa.jpg', '无线耳机 QC30耳塞式蓝牙降噪耳麦', 'Bose QuietControl 30', 1998.40, 2498.00, b'1', 1000, '杰普官方直营', 109, 10193, 20386, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10194, b'0', NULL, '/images/shops/af77eaba-fd00-4ec8-b0e6-928372a0741d.jpg', '头戴式 蓝牙无线耳机 手机耳机 游戏耳机 - 桀骜黑红（十周年版） MRQC2PA/A', 'Beats Solo3 Wireless', 1358.40, 1698.00, b'1', 1000, '杰普官方直营', 109, 10194, 20388, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10195, b'0', NULL, '/images/shops/0dc503b2-90a2-4971-9723-c085a1844b76.jpg', '高解析度无线蓝牙降噪（触控面板 智能降噪 长久续航）黑色', '索尼 WH-1000XM3 头戴式耳机', 2079.20, 2599.00, b'1', 987, '杰普官方直营', 109, 10195, 20390, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10196, b'0', NULL, '/images/shops/0cc81546-1408-4140-af95-0341a7778b6c.jpg', '北海巨妖标准版升级款 头戴式游戏耳机 电竞耳麦 7.1 电脑手机耳机 黑色', '雷蛇 Razer 北海巨妖标准版X', 239.20, 299.00, b'1', 1000, '杰普官方直营', 109, 10196, 20392, '产品信息Product Information 产品规格Product Specifications 品牌介绍Brand Introduction 注意事项Warning & Caution 雷蛇产品在出厂时会进行检测，脚贴及USB接口处如有轻微划痕属于正常测试痕迹。 RAZER关于划痕的注意事项： 以上数据图片均为官方测试环境下结果，因使用环境/设备不同会存在一定的差异，仅供参考，数据请以实际为准！  1. 产品实物与外包装上的SN（序列号）必须一致； 2. 产品外包装不能严重破损，盒内的相关配件要齐全，不能有缺失； 3. 不能有明显的人为破损（表面有明显的人为划痕，使用及存在拆卸的痕迹）； 4. 防伪标签不得撕开或损毁。 RAZER关于7天无理由退换货的注意事项： ', NULL);
INSERT INTO `t_shop` VALUES (10197, b'0', NULL, '/images/shops/768e79e1-e875-4691-855d-262346451d22.jpg', '黑色', '森海塞尔（Sennheiser）MomentumTrueWireless 真无线蓝牙hifi发烧入耳式耳机 蓝牙5.0', 1919.20, 2399.00, b'1', 1000, '杰普官方直营', 109, 10197, 20394, '聆听带来改变 真     无     线     蓝     牙     HiFi     耳     机 MOMENTUM 真无线 懂你所需 全新的 MOMENTUM 真无线耳机，高品质的声音质量传承 MOMENTUM 品质，成为一款具有重要技术成就的新产品。 这款性能优异的蓝牙耳机融合音频质量、佩戴舒适性和精致设计及工艺。 全新的 MOMENTUM 透明聆听功能 防水防泼溅 电池使用时长 （4+8小时） 精雕细琢 经典优雅 高品质声音质量 智能降噪 智能触控操作 支持蓝牙5.0技术 智能触控操作 支持蓝牙 5.0技术 MOMENTUM真无线耳机采用Sennheiser发烧级别7毫米动圈驱动单元，可确保饱满的立体声效果，带来高保真音质，为苛刻的听者带来出色的高保真度。 高品质声音质量 两侧触摸区域都有单独的控制功能，您可以轻松使用右耳耳机语音访问智能助手（如苹果 Siri或Google智能助手）。 轻轻点击或滑动触摸界面，使用自然语音命令即可播放音乐、接听电话。 支持蓝牙5.0技术及编解码技术（包括AAC、Qualcomm apt-XTM和apt-X低延迟），这款耳机带来出众的连接稳定性和音频流畅性。 真正的无线体验 轻松适配周围环境 MOMENTUM 真无线耳机让你更好地感知外部环境，透明聆听让你能听到周围的环境声，从而更好地感知周围的环境，不需要摘掉耳机就能融入到自然的交谈之中。甚至在嘈杂的环境中，电话呼叫和语音交互也能够通过双话筒波束成形技术得以实现。 智能交互 通过自动开启/关闭和智能暂停功能，可以检测到耳机何时被收起来或者不使用，从而节约能源。 你的世界由你把控 通过双击右耳耳机开/关透明聆听功能 打开透明聆听=接收周围环境音 关闭透明聆听=物理降噪模式，不接收周围音 不需要摘掉耳机就可轻松地与周围人进行交谈。 4种尺寸的耳垫可选，均符合人体工程学设计，防水防泼溅，能够满足用户舒适佩戴的需求。 个性定制舒适体验 MOMENTUM真无线拥有4小时电池续航时间，可通过其带有集成电源的小巧耳机盒进行充电，从而享受长达12（4+8）小时的全天聆听乐趣，并满足未来所需。 镀金充电接触点 可磁性吸附到充电盒上 高保真7毫米动圈驱动单元 带来出色的声音重放 金属镭射表面 具有触控功能 多色 LED指示灯 用于语音信号拾取和透明聆听功能的话筒 舒适的入耳式 硅胶耳垫 便捷充电盒持久续航 注重细节、富于美感，这款小巧、 靓丽而轻盈的耳机是技术与艺术的 结合。它既是声音重放技术的成就，更是你耳畔精美的配饰。 质感黑色外壳，闪烁的金属镭射表面，镀金的充电接触点——时尚与功能融合于标志性的设计之中，带来优雅和实用感。 Sennheiser智能控制 MOMENTUM 真无线耳机提供了更为智能和个性化的体验，可以通过新款Sennheiser智能控制应用进行优化，根据个人喜好，利用内置音频EQ对声音进行微调。免费下载，兼容iOS 版本 11.0 及以上版本和Android 版本 7.0 及以上版本 ，简便直观的控制界面，为您的耳机提供个性化的配置和升级等功能。 APP 下载方法 Android 版本 7.0 及以上版本 打开链接下载APP https://share.weiyun.com/54byqjn iOS 版本 11.0 及以上版本 打开APP Store搜索 Sennheiser smart control 下载APP', NULL);
INSERT INTO `t_shop` VALUES (10198, b'0', NULL, '/images/shops/d3370c50-e853-4546-a032-35073eb192ff.jpg', '真无线蓝牙耳机--黑色 运动耳机 防掉落耳塞', 'Bose SoundSport Free', 1359.20, 1699.00, b'1', 1000, '杰普官方直营', 109, 10198, 20396, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10199, b'0', NULL, '/images/shops/0cff5ace-7ab9-43a7-91fe-fb3550829577.jpg', '杰普精选', '华为原装降噪有线手机耳机Mate9 10P9P10Plus荣耀V9V10PlayNova2s9i8x 【送耳机收纳包】AM115半入耳式耳机-经典热卖款', 31.20, 39.00, b'1', 1000, '杰普官方直营', 109, 10199, 20398, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10200, b'0', NULL, '/images/shops/7b8bcf01-0abe-4155-b1f4-e57a6b8fc36a.jpg', '耳机', 'Apple 采用Lightning/闪电接头的 EarPods', 178.40, 223.00, b'1', 1000, '杰普官方直营', 109, 10200, 20400, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10201, b'0', NULL, '/images/shops/6b0bd268-40b1-4abf-a19b-95df7cb4d722.jpg', '(口红 保湿滋润 气质显白 不挑皮) （新老包装随机）', '迪奥（Dior）烈艳蓝金唇膏滋润999# 3.5g 经典正红色', 252.00, 315.00, b'1', 1000, '杰普官方直营', 86, 10201, 20402, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10202, b'0', NULL, '/images/shops/d8d4ac7e-7189-459a-aef2-7116f723cb0b.jpg', '雾面质地 显色持久 显白 正红色 李佳琦推荐）', '迪奥（Dior）烈艳蓝金唇膏-哑光999# 3.5g 传奇红（口红', 252.00, 315.00, b'1', 1000, '杰普官方直营', 86, 10202, 20404, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10203, b'0', NULL, '/images/shops/18aca3b8-d024-47d3-a971-fb51d374b1ae.jpg', 'Chili 秀智色/小辣椒色', '海囤全球 魅可（MAC)经典唇膏 子弹头口红3g', 124.00, 155.00, b'1', 1000, '杰普官方直营', 86, 10203, 20406, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10204, b'0', NULL, '/images/shops/44c8198e-f63a-45e0-8eff-789338de65f8.jpg', '19#欲望 唇盒 口红 七夕礼物 情人节礼物)', '卡姿兰（Carslan）轻甜唇爱随心盒1.4g*4(13#暧昧 16#炽烈 18#嫉妒', 71.20, 89.00, b'1', 1000, '杰普官方直营', 86, 10204, 20408, '关联销售入口 1 (1) 商品介绍加载中...', NULL);
INSERT INTO `t_shop` VALUES (10205, b'0', NULL, '/images/shops/c081314e-8f67-44f9-a27e-aad6c3f29343.jpg', '杰普精选', '【联名限量版】MANSLY口红套装中国风口红情人节女朋友生日礼物唇釉彩妆女磁扣锦绣红妆口红礼盒彩妆 锦绣红妆口红礼盒（6支）', 236.00, 295.00, b'1', 995, '杰普官方直营', 86, 10205, 20410, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10207, b'0', NULL, '/images/shops/b4335e82-c9e1-4264-92e4-e324a601fedb.jpg', '杰普精选', '圣罗兰（YSL）莹亮纯魅唇膏12#（圆管口红）4.5g 斩男色', 256.00, 320.00, b'1', 1000, '杰普官方直营', 86, 10207, 20414, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10208, b'0', NULL, '/images/shops/57d0bf26-0a0c-4027-8a2b-deeaa29905ee.jpg', '杰普精选', '圣罗兰（YSL）纯口红1#（正红色）3.8g', 256.00, 320.00, b'1', 1000, '杰普官方直营', 86, 10208, 20416, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10209, b'0', NULL, '/images/shops/f30bd8cb-aadd-43aa-8615-2c4795ee7f5f.jpg', '持久锁色）新老包装随机发货', '纪梵希高定香榭天鹅绒唇膏306#(小羊皮口红 法式红 雾面哑光', 284.00, 355.00, b'1', 1000, '杰普官方直营', 86, 10209, 20418, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10210, b'0', NULL, '/images/shops/f128ad98-fe4d-4264-96e3-6393b6cc98f1.jpg', '杰普精选', '【联名款】MANSLY口红套装红鸾心动口红礼盒中国风开运红情人节女朋友生日礼物唇釉颐和园同款彩妆口红 红鸾心动口红礼盒（6支）', 156.00, 195.00, b'1', 1000, '杰普官方直营', 86, 10210, 20420, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10211, b'0', NULL, '/images/shops/8fcdb86b-e826-4c1b-af3c-33a9d590c4b0.jpg', '3.5g 999号 正红色', '海囤全球 迪奥（Dior）烈艳蓝金唇膏 口红', 206.40, 258.00, b'1', 1000, '杰普官方直营', 86, 10211, 20422, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10212, b'0', NULL, '/images/shops/53a4a428-8ca2-4d19-937d-15d18f324237.jpg', '杰普精选', '圣罗兰（YSL）纯口红13#（正橘色）3.8g', 256.00, 320.00, b'1', 1000, '杰普官方直营', 86, 10212, 20424, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10213, b'0', NULL, '/images/shops/2da55bd1-046f-4ac2-b1b9-56ab00bb9db1.jpg', '3g 316 devoted to chili 泫雅色', '海囤全球 魅可（MAC)磨砂系列 雾面丝绒哑光子弹头口红', 132.00, 165.00, b'1', 1000, '杰普官方直营', 86, 10213, 20426, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10214, b'0', NULL, '/images/shops/247722ea-c87a-4283-806c-bc9fe57f2253.jpg', '43#斩男色', '【情人礼物】香奈儿Chanel 口红/唇膏可可小姐水亮/丝绒系列润唇保湿口红配玫瑰花礼盒 丝绒系列', 238.40, 298.00, b'1', 1000, '杰普官方直营', 86, 10214, 20428, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10215, b'0', NULL, '/images/shops/ab1a0ced-954c-4857-92f4-f7c833d9d54a.jpg', '杰普精选', '迪奥（Dior）口红礼盒套装（烈艳蓝金唇膏哑光#999 3.5g正红色+香氛小样1ml*3随机+随机礼盒样式）', 303.20, 379.00, b'1', 1000, '杰普官方直营', 86, 10215, 20430, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10216, b'0', NULL, '/images/shops/1eefadae-5f62-4abd-b283-077e7b6d9193.jpg', '杰普精选', '圣罗兰（YSL）纯口红52# 3.8g', 256.00, 320.00, b'1', 1000, '杰普官方直营', 86, 10216, 20432, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10217, b'0', NULL, '/images/shops/da12f5cf-2728-446a-a3bd-b78baf7056ff.jpg', 'FORD TF口红 经典黑金唇膏 3g 16 SCARLET ROUGE 复古番茄红', '海囤全球 汤姆福特 TOM', 300.00, 375.00, b'1', 1000, '杰普官方直营', 86, 10217, 20434, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10218, b'0', NULL, '/images/shops/7030b9b6-b650-4d9d-9446-e27dab8afa1f.jpg', '珊瑚红 (滋润保湿 持久显色 粉嫩少女 摩洛哥王妃 幸运色)', '迪奥（Dior）烈艳蓝金口红唇膏 028# 3.5g', 252.00, 315.00, b'1', 1000, '杰普官方直营', 86, 10218, 20436, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10219, b'0', NULL, '/images/shops/96a91f11-e634-4e28-be13-db8b4732463e.jpg', '缎光 滋润保湿 长效持妆 玫红色 斩男色 告白色 粉红色)', '迪奥（Dior）烈艳蓝金唇膏520# 3.5g 玫瑰红(口红', 252.00, 315.00, b'1', 1000, '杰普官方直营', 86, 10219, 20438, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10220, b'0', NULL, '/images/shops/fe048831-384d-46b2-beec-5549f7902c11.jpg', '3.5g 999号 哑光-经典正红', '海囤全球 迪奥（Dior）烈艳蓝金唇膏 口红', 204.00, 255.00, b'1', 1000, '杰普官方直营', 86, 10220, 20440, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10221, b'0', NULL, '/images/shops/b7495e02-fc4c-417a-8101-ccfc75a5a475.jpg', '杰普精选', '欧莱雅（LOREAL）纷泽滋润唇膏RC301复古魅红3.7g（金管 口红女 滋润显色）', 79.20, 99.00, b'1', 1000, '杰普官方直营', 86, 10221, 20442, '品牌介绍Brand Description         巴黎欧莱雅通过将科技和美丽的结合，不断谋求创新、研发新的产品配方，以合理的价格，为消费者提供品质的产品和服务。自1907年安全合成染发剂的诞生，如今巴黎欧莱雅的产品已从染发剂扩展到了护肤、彩妆等诸多领域，在中国，巴黎欧莱雅的五大产品线为护肤系列、彩妆系列、家用染发系列、洗护发系列及男士护肤系列。为了将美的产品融于美的文化、艺术、理念，将“从指尖到发梢”的美丽带给全世界的人们，巴黎欧莱雅在全世界范围精心选择各行业明星，组成“梦之队”来见证巴黎欧莱雅的实力，从各个不同的角度来讲述巴黎欧莱雅美丽无疆界的气势，并使“巴黎欧莱雅，你值得拥有！”“Because you are worth it！”的美丽概念成为一种文化！', NULL);
INSERT INTO `t_shop` VALUES (10222, b'0', NULL, '/images/shops/75fdac25-1cfa-4a9b-957d-805ac706f32c.jpg', '红管#405番茄红 【李佳琪推荐omg】', '阿玛尼(Armani) 口红女士唇釉 生日礼物/表白礼物', 228.00, 285.00, b'1', 1000, '杰普官方直营', 86, 10222, 20444, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10223, b'0', NULL, '/images/shops/1055e30e-3d98-4dca-8b79-8d0b5a09a37b.jpg', '杰普精选', '美宝莲（MAYBELLINE）绝色持久唇膏雾感哑光系列R09PM 3.9g（女皇色口红新老包装）', 84.80, 106.00, b'1', 1000, '杰普官方直营', 86, 10223, 20446, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10224, b'0', NULL, '/images/shops/7b52a7bc-0ecf-41c4-b079-d162511c9530.jpg', '844#橘红色赠礼盒礼袋', '【专柜正品】迪奥999Dior口红唇膏烈艳蓝金 哑光滋润520/888/999送礼礼品套装 烈艳蓝金', 208.00, 260.00, b'1', 1000, '杰普官方直营', 86, 10224, 20448, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10225, b'0', NULL, '/images/shops/bb05b83f-bb91-4300-b78f-23986ba8c0dd.jpg', '(口红 保湿滋润 气质显白 不挑皮) （新老包装随机）', '迪奥（Dior）烈艳蓝金唇膏滋润999# 3.5g 经典正红色', 252.00, 315.00, b'1', 1000, '杰普官方直营', 86, 10225, 20450, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10226, b'0', NULL, '/images/shops/67280dcf-bf32-49c1-b99b-9d86bb2ffaac.jpg', '雾面质地 显色持久 显白 正红色 李佳琦推荐）', '迪奥（Dior）烈艳蓝金唇膏-哑光999# 3.5g 传奇红（口红', 252.00, 315.00, b'1', 1000, '杰普官方直营', 86, 10226, 20452, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10227, b'0', NULL, '/images/shops/2b678c5d-820c-4174-bc0c-5a65ff9501b6.jpg', 'Chili 秀智色/小辣椒色', '海囤全球 魅可（MAC)经典唇膏 子弹头口红3g', 124.00, 155.00, b'1', 1000, '杰普官方直营', 86, 10227, 20454, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10228, b'0', NULL, '/images/shops/3f513cd6-bb5f-407d-8550-24550873d83b.jpg', '19#欲望 唇盒 口红 七夕礼物 情人节礼物)', '卡姿兰（Carslan）轻甜唇爱随心盒1.4g*4(13#暧昧 16#炽烈 18#嫉妒', 71.20, 89.00, b'1', 1000, '杰普官方直营', 86, 10228, 20456, '关联销售入口 1 (1) 商品介绍加载中...', NULL);
INSERT INTO `t_shop` VALUES (10229, b'0', NULL, '/images/shops/d82ba7f0-6c92-4254-bfb2-71b3f8b1dfda.jpg', '杰普精选', '【联名限量版】MANSLY口红套装中国风口红情人节女朋友生日礼物唇釉彩妆女磁扣锦绣红妆口红礼盒彩妆 锦绣红妆口红礼盒（6支）', 236.00, 295.00, b'1', 1000, '杰普官方直营', 86, 10229, 20458, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10231, b'0', NULL, '/images/shops/359bb052-5fea-4390-bbe6-4cb9e1c19273.jpg', '杰普精选', '圣罗兰（YSL）莹亮纯魅唇膏12#（圆管口红）4.5g 斩男色', 256.00, 320.00, b'1', 1000, '杰普官方直营', 86, 10231, 20462, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10232, b'0', NULL, '/images/shops/a42498e5-d912-447b-9360-0659d2d55c42.jpg', '杰普精选', '圣罗兰（YSL）纯口红1#（正红色）3.8g', 256.00, 320.00, b'1', 1000, '杰普官方直营', 86, 10232, 20464, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10233, b'0', NULL, '/images/shops/04949c0e-87df-445b-96dd-29e7fc69f734.jpg', '(小羊皮口红 法式红 雾面哑光 持久锁色）新老包装随机发货', '纪梵希高定香榭天鹅绒唇膏306#', 284.00, 355.00, b'1', 998, '杰普官方直营', 86, 10233, 20466, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10234, b'0', NULL, '/images/shops/a9cd71ad-2db0-4876-9ead-c51233040220.jpg', '杰普精选', '【联名款】MANSLY口红套装红鸾心动口红礼盒中国风开运红情人节女朋友生日礼物唇釉颐和园同款彩妆口红 红鸾心动口红礼盒（6支）', 156.00, 195.00, b'1', 1000, '杰普官方直营', 86, 10234, 20468, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10235, b'0', NULL, '/images/shops/49d2acf7-55e5-4293-a7da-5929740e1168.jpg', '3.5g 999号 正红色', '海囤全球 迪奥（Dior）烈艳蓝金唇膏 口红', 206.40, 258.00, b'1', 1000, '杰普官方直营', 86, 10235, 20470, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10236, b'0', NULL, '/images/shops/b0142d40-6adb-4d64-b5b2-6e4a34656990.jpg', '杰普精选', '圣罗兰（YSL）纯口红13#（正橘色）3.8g', 256.00, 320.00, b'1', 1000, '杰普官方直营', 86, 10236, 20472, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10237, b'0', NULL, '/images/shops/1930d79b-88bd-4c5c-8510-0697c9ad2578.jpg', '磨砂系列 3g 316 devoted to chili 泫雅色', 'MAC 雾面丝绒哑光子弹头口红', 132.00, 165.00, b'1', 993, '杰普官方直营', 86, 10237, 20474, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10238, b'0', NULL, '/images/shops/70219912-838c-487b-8c3c-761b00de80e9.jpg', '43#斩男色', '【情人礼物】香奈儿Chanel 口红/唇膏可可小姐水亮/丝绒系列润唇保湿口红配玫瑰花礼盒 丝绒系列', 238.40, 298.00, b'1', 1000, '杰普官方直营', 86, 10238, 20476, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10239, b'0', NULL, '/images/shops/cbce65ee-28b3-4822-895a-38243ee506e7.jpg', '杰普精选', '迪奥（Dior）口红礼盒套装（烈艳蓝金唇膏哑光#999 3.5g正红色+香氛小样1ml*3随机+随机礼盒样式）', 303.20, 379.00, b'1', 1000, '杰普官方直营', 86, 10239, 20478, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10240, b'0', NULL, '/images/shops/abff57bf-247b-4881-9589-e1336049c3ba.jpg', '杰普精选', '圣罗兰（YSL）纯口红52# 3.8g', 256.00, 320.00, b'1', 1000, '杰普官方直营', 86, 10240, 20480, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10241, b'0', NULL, '/images/shops/ba0cd1e9-cded-427b-8692-e8e2a0d00e9f.jpg', 'FORD TF口红 经典黑金唇膏 3g 16 SCARLET ROUGE 复古番茄红', '海囤全球 汤姆福特 TOM', 300.00, 375.00, b'1', 1000, '杰普官方直营', 86, 10241, 20482, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10242, b'0', NULL, '/images/shops/ea87e780-ed4c-447d-bd22-e88e4742721e.jpg', '珊瑚红 (滋润保湿 持久显色 粉嫩少女 摩洛哥王妃 幸运色)', '迪奥（Dior）烈艳蓝金口红唇膏 028# 3.5g', 252.00, 315.00, b'1', 1000, '杰普官方直营', 86, 10242, 20484, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10243, b'0', NULL, '/images/shops/dde0b711-58b0-49fb-972c-7a71d6ec30f1.jpg', '缎光 滋润保湿 长效持妆 玫红色 斩男色 告白色 粉红色)', '迪奥（Dior）烈艳蓝金唇膏520# 3.5g 玫瑰红(口红', 252.00, 315.00, b'1', 1000, '杰普官方直营', 86, 10243, 20486, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10244, b'0', NULL, '/images/shops/79247aeb-2903-47b0-a711-ac94e22ddd54.jpg', '3.5g 999号 哑光-经典正红', '海囤全球 迪奥（Dior）烈艳蓝金唇膏 口红', 204.00, 255.00, b'1', 997, '杰普官方直营', 86, 10244, 20488, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10245, b'0', NULL, '/images/shops/3b420562-b449-448d-ae50-e20aab136e1b.jpg', '杰普精选', '欧莱雅（LOREAL）纷泽滋润唇膏RC301复古魅红3.7g（金管 口红女 滋润显色）', 79.20, 99.00, b'1', 1000, '杰普官方直营', 86, 10245, 20490, '品牌介绍Brand Description         巴黎欧莱雅通过将科技和美丽的结合，不断谋求创新、研发新的产品配方，以合理的价格，为消费者提供品质的产品和服务。自1907年安全合成染发剂的诞生，如今巴黎欧莱雅的产品已从染发剂扩展到了护肤、彩妆等诸多领域，在中国，巴黎欧莱雅的五大产品线为护肤系列、彩妆系列、家用染发系列、洗护发系列及男士护肤系列。为了将美的产品融于美的文化、艺术、理念，将“从指尖到发梢”的美丽带给全世界的人们，巴黎欧莱雅在全世界范围精心选择各行业明星，组成“梦之队”来见证巴黎欧莱雅的实力，从各个不同的角度来讲述巴黎欧莱雅美丽无疆界的气势，并使“巴黎欧莱雅，你值得拥有！”“Because you are worth it！”的美丽概念成为一种文化！', NULL);
INSERT INTO `t_shop` VALUES (10246, b'0', NULL, '/images/shops/db866c68-e526-42cf-a0b5-520254f30b76.jpg', '红管#405番茄红 【李佳琪推荐omg】', '阿玛尼(Armani) 口红女士唇釉 生日礼物/表白礼物', 228.00, 285.00, b'1', 1000, '杰普官方直营', 86, 10246, 20492, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10247, b'0', NULL, '/images/shops/63d0a187-627d-4edb-870e-717969ad2bd0.jpg', '杰普精选', '美宝莲（MAYBELLINE）绝色持久唇膏雾感哑光系列R09PM 3.9g（女皇色口红新老包装）', 84.80, 106.00, b'1', 1000, '杰普官方直营', 86, 10247, 20494, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10248, b'0', NULL, '/images/shops/9822b4a5-9fd2-435b-bdd1-5bbcdc6fdfdf.jpg', '844#橘红色赠礼盒礼袋', '【专柜正品】迪奥999Dior口红唇膏烈艳蓝金 哑光滋润520/888/999送礼礼品套装 烈艳蓝金', 208.00, 260.00, b'1', 1000, '杰普官方直营', 86, 10248, 20496, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10249, b'0', NULL, '/images/shops/2d827a7e-fb30-493d-840a-cb21766814fd.jpg', 'Core i5 8G 128G SSD 笔记本电脑 轻薄本 银色 MQD32CH/A', 'Apple Macbook Air 13.3 ', 4799.20, 5999.00, b'1', 1000, '杰普官方直营', 35, 10249, 20498, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10250, b'0', NULL, '/images/shops/465936e0-40ad-4968-b868-4bea20c7beec.jpg', '【带触控栏】八代i5 8G 256G RP645显卡 银色 苹果笔记本电脑 MUHR2CH/A', 'Apple 2019款 Macbook Pro 13.3', 8559.20, 10699.00, b'1', 1000, '杰普官方直营', 35, 10250, 20500, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10251, b'0', NULL, '/images/shops/a4132109-8f18-4399-affd-a81fad6902c8.jpg', 'Core i5 8G 256G SSD 银色 笔记本电脑 轻薄本 Z0UU00056原MQD42CH/A', 'Apple MacBook Air 13.3 ', 5734.40, 7168.00, b'1', 1000, '杰普官方直营', 35, 10251, 20502, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10252, b'0', NULL, '/images/shops/65b62668-3be5-48b0-a40c-bd05826a38c2.jpg', 'Retina屏 八代i5 8G 256G SSD 银色 笔记本电脑 轻薄本 MVFL2CH/A', 'Apple 2019款 MacBook Air 13.3 ', 7839.20, 9799.00, b'1', 1000, '杰普官方直营', 35, 10252, 20504, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10253, b'0', NULL, '/images/shops/cb899039-a705-473d-9785-f245a6ed4d89.jpg', 'Retina屏 八代i5 8G 128G SSD 深空灰 笔记本电脑 轻薄本 MVFH2CH/A', 'Apple 2019款 MacBook Air 13.3 ', 6799.20, 8499.00, b'1', 1000, '杰普官方直营', 35, 10253, 20506, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10254, b'0', NULL, '/images/shops/7810bc9d-236f-4386-a0ef-45a831b49bf2.jpg', 'Retina屏 八代i5 8G 128G SSD 银色 笔记本电脑 轻薄本 MVFK2CH/A', 'Apple 2019款 MacBook Air 13.3 ', 6799.20, 8499.00, b'1', 992, '杰普官方直营', 35, 10254, 20508, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10255, b'0', NULL, '/images/shops/53019ece-5e61-4de9-8eac-e1f00a4ef7e3.jpg', '| 定制升级 Core i7 8G 128G SSD硬盘 银色 笔记本电脑 轻薄本 Z0UU00022', 'Apple MacBook Air 13.3 ', 5574.40, 6968.00, b'1', 1000, '杰普官方直营', 35, 10255, 20510, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10256, b'0', NULL, '/images/shops/f08404a7-0459-4289-aa60-dd1735c95bbe.jpg', '【带触控栏】八代i5 8G 256G RP645显卡 深空灰 苹果笔记本电脑 MUHP2CH/A', 'Apple 2019款 Macbook Pro 13.3', 8559.20, 10699.00, b'1', 1000, '杰普官方直营', 35, 10256, 20512, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10257, b'0', NULL, '/images/shops/83740c28-473c-4954-b0dc-3cadab5a87d1.jpg', '苹果笔记本电脑 13.3英寸轻薄本 购买套餐更实惠 2017款/i5/8GB/128GB/D32', '苹果（Apple） MacBook Air', 4390.40, 5488.00, b'1', 1000, '杰普官方直营', 35, 10257, 20514, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10258, b'0', NULL, '/images/shops/78957148-4c0c-4194-bc46-7360d7b1aa65.jpg', 'Retina屏 八代i5 8G 256G SSD 深空灰 笔记本电脑 轻薄本 MVFJ2CH/A', 'Apple 2019款 MacBook Air 13.3 ', 7839.20, 9799.00, b'1', 983, '杰普官方直营', 35, 10258, 20516, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10259, b'0', NULL, '/images/shops/85787c16-8443-4db0-9cae-a811a20a0832.jpg', '【带触控栏】八代i5 8G 256G 深空灰 笔记本电脑 轻薄本 MV962CH/A', 'Apple 2019新品 Macbook Pro 13.3', 10399.20, 12999.00, b'1', 1000, '杰普官方直营', 35, 10259, 20518, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10260, b'0', NULL, '/images/shops/82bdafc6-5828-495e-b77c-21598938b896.jpg', 'Retina屏 八代i5 8G 256G SSD 金色 苹果笔记本电脑 轻薄本 MVFN2CH/A', 'Apple 2019款 MacBook Air 13.3 ', 7839.20, 9799.00, b'1', 1000, '杰普官方直营', 35, 10260, 20520, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10261, b'0', NULL, '/images/shops/270cdf75-8a7f-410e-8f2f-8eeba24f0503.jpg', '金色 i5/8GB内存/128GB闪存【19新款】', 'APPLE 苹果2018年19新款MacBook air笔记本电脑13.3英寸超薄笔记本', 6310.40, 7888.00, b'1', 1000, '杰普官方直营', 35, 10261, 20522, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10262, b'0', NULL, '/images/shops/7928eb46-9e1c-420e-a8ab-6c358d01891b.jpg', '【带触控栏】全新九代六核i7 16G 256G 深空灰 笔记本电脑轻薄本MV902CH/A', 'Apple 2019新品 Macbook Pro 15.4', 13679.20, 17099.00, b'1', 1000, '杰普官方直营', 35, 10262, 20524, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10263, b'0', NULL, '/images/shops/11968b35-9431-4b1c-a648-6ff46945ebf4.jpg', '标配+防水手提包+苹果原装鼠标版（下单送大礼包） i5+8GB内存+128GB闪存【D32】', 'APPLE 苹果MacBook air苹果笔记本电脑13.3英寸超薄笔记本', 4790.40, 5988.00, b'1', 1000, '杰普官方直营', 35, 10263, 20526, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10264, b'0', NULL, '/images/shops/fb08ec83-2960-47f7-8679-8b78896c30d5.jpg', '官方标配【购套餐版送大礼包】 i5+8GB内存+128GB闪存【D32】', 'APPLE苹果 MacBook Air13.3英寸轻薄笔记本电脑2017款', 4390.40, 5488.00, b'1', 1000, '杰普官方直营', 35, 10264, 20528, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10265, b'0', NULL, '/images/shops/50748763-c0d6-4e73-80e5-864818fa3246.jpg', 'Retina屏 八代i5 8G 128G SSD 金色 笔记本电脑 轻薄本 MVFM2CH/A', 'Apple 2019款 MacBook Air 13.3 ', 6799.20, 8499.00, b'1', 1000, '杰普官方直营', 35, 10265, 20530, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10266, b'0', NULL, '/images/shops/fe9e33a1-fbd0-4278-931f-825fef4ffb62.jpg', '【带触控栏】八代i5 8G 128G RP645显卡 深空灰 苹果笔记本电脑 MUHN2CH/A', 'Apple 2019款 Macbook Pro 13.3', 7599.20, 9499.00, b'1', 1000, '杰普官方直营', 35, 10266, 20532, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10267, b'0', NULL, '/images/shops/0340d6b2-54bf-42a2-96f4-f35c5f47bb2d.jpg', '定制升级 Core i7 8G 256G SSD硬盘 银色 笔记本电脑 轻薄本 Z0UU0004J', 'Apple MacBook Air 13.3 ', 6799.20, 8499.00, b'1', 1000, '杰普官方直营', 35, 10267, 20534, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10268, b'0', NULL, '/images/shops/33a29216-08d6-445b-b979-12d5de81d634.jpg', '【带触控栏】九代八核i9 16G 512G 深空灰 笔记本电脑 轻薄本 MV912CH/A', 'Apple 2019新品 Macbook Pro 15.4', 16319.20, 20399.00, b'1', 1000, '杰普官方直营', 35, 10268, 20536, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10269, b'0', NULL, '/images/shops/a2afdb6c-69a7-4081-bd09-62174f9f5624.jpg', '【带触控栏】八代i5 8G 256G 银色 笔记本电脑 轻薄本 MV992CH/A', 'Apple 2019新品 Macbook Pro 13.3', 10399.20, 12999.00, b'1', 982, '杰普官方直营', 35, 10269, 20538, '商品介紹頁面素材由Apple提供  ', NULL);
INSERT INTO `t_shop` VALUES (10270, b'0', NULL, '/images/shops/4da4fa5d-ee2d-4496-9950-e53b102f0e8e.jpg', '【带触控栏】Core i5 8G 512G SSD 银色 笔记本电脑 轻薄本 MR9V2CH/A', 'Apple Macbook Pro 13.3', 10454.40, 13068.00, b'1', 1000, '杰普官方直营', 35, 10270, 20540, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10271, b'0', NULL, '/images/shops/49c9f6f8-11c2-4f57-98b9-daf12715b938.jpg', '【带触控栏】全新九代六核i7 16G 256G 银色 笔记本电脑 轻薄本 MV922CH/A', 'Apple 2019新品 Macbook Pro 15.4', 13679.20, 17099.00, b'1', 1000, '杰普官方直营', 35, 10271, 20542, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10272, b'0', NULL, '/images/shops/9dd28614-7a17-4876-8cdd-232caf4154bc.jpg', '【带触控栏】八代i5 8G 512G 银色 笔记本电脑 轻薄本 MV9A2CH/A', 'Apple 2019新品 Macbook Pro 13.3', 11599.20, 14499.00, b'1', 1000, '杰普官方直营', 35, 10272, 20544, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10273, b'0', NULL, '/images/shops/2dcd61b8-f434-40ee-928f-c6e4ae934db8.jpg', '【带触控栏】九代八核i9 16G 512G 银色 笔记本电脑 轻薄本 MV932CH/A', 'Apple 2019新品 Macbook Pro 15.4', 16319.20, 20399.00, b'1', 1000, '杰普官方直营', 35, 10273, 20546, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10274, b'0', NULL, '/images/shops/4dbbfbf1-80c0-4389-a02e-ca19fbeb5340.jpg', '19款灰色/256G/带bar/MUHP2CH/A', '【新品首发】苹果Apple MacBook Pro13.3英寸2019新款18/17苹果笔记本电脑', 8390.40, 10488.00, b'1', 1000, '杰普官方直营', 35, 10274, 20548, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10275, b'0', NULL, '/images/shops/3b095a66-4001-4c69-9026-2e09139b5f11.jpg', '19款灰色/128G/带bar/MUHN2CH/A', '【新品首发】苹果Apple MacBook Pro13.3英寸2019新款18/17苹果笔记本电脑', 7270.40, 9088.00, b'1', 1000, '杰普官方直营', 35, 10275, 20550, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10276, b'0', NULL, '/images/shops/82fb6b31-1afe-4bcb-a243-5205ed32d3ee.jpg', '【带触控栏】八代i5 8G 512G 深空灰 苹果笔记本电脑 轻薄本 MV972CH/A', 'Apple 2019新品 Macbook Pro 13.3', 11599.20, 14499.00, b'1', 1000, '杰普官方直营', 35, 10276, 20552, '<p>商品介紹頁面素材由Apple提供...</p>', NULL);
INSERT INTO `t_shop` VALUES (10277, b'0', NULL, '/images/shops/73a8c7e9-40af-4e0a-9826-5f6374361e61.jpg', '【无触控栏】Core i5 8G 256G SSD 银色 笔记本电脑 轻薄本 MPXU2CH/A', 'Apple Macbook Pro 13.3', 8159.20, 10199.00, b'1', 1000, '杰普官方直营', 35, 10277, 20554, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10278, b'0', NULL, '/images/shops/4755f3e5-257c-424c-a5f4-63908061d6d9.jpg', '64GB 黑色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 (A2223)', 4399.20, 5499.00, b'1', 998, '杰普官方直营', 47, 10278, 20556, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10279, b'0', NULL, '/images/shops/a0d09f94-9c46-4ee1-aaef-dfd132e7543e.jpg', '128GB 白色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 (A2223)', 4799.20, 5999.00, b'1', 997, '杰普官方直营', 47, 10279, 20558, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10280, b'0', NULL, '/images/shops/8dfe8ea9-2279-4132-a72b-4f8a52d002a4.jpg', '128GB 紫色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 (A2223)', 4799.20, 5999.00, b'1', 1000, '杰普官方直营', 47, 10280, 20560, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10281, b'0', NULL, '/images/shops/7368f461-fd0a-4f37-bc8b-31d8ad3d6e95.jpg', '64GB 红色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 (A2223)', 4399.20, 5499.00, b'1', 1000, '杰普官方直营', 47, 10281, 20562, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10282, b'0', NULL, '/images/shops/cea55d85-b11e-4639-88ab-9403b05ce1e8.jpg', '64GB 黄色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 (A2223)', 4399.20, 5499.00, b'1', 1000, '杰普官方直营', 47, 10282, 20564, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10283, b'0', NULL, '/images/shops/075a188a-9045-45f0-9c67-1e42e0552aa2.jpg', '256GB 绿色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 (A2223)', 5439.20, 6799.00, b'1', 992, '杰普官方直营', 47, 10283, 20566, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10284, b'0', NULL, '/images/shops/23ac3107-6309-40c8-bd28-164eb1186b62.jpg', '128GB 黑色 移动联通电信4G手机 双卡双待', 'Apple iPhone XR (A2108)', 4079.20, 5099.00, b'1', 991, '杰普官方直营', 47, 10284, 20568, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10285, b'0', NULL, '/images/shops/3f47c376-c603-43fc-bfe5-2daa985ff423.jpg', '128GB 白色 移动联通电信4G手机 双卡双待', 'Apple iPhone XR (A2108)', 4079.20, 5099.00, b'1', 1000, '杰普官方直营', 47, 10285, 20570, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10286, b'0', NULL, '/images/shops/56cef3d7-41e6-4aad-825d-a3d423e74dfd.jpg', '128GB 红色 移动联通电信4G手机 双卡双待', 'Apple iPhone XR (A2108)', 4079.20, 5099.00, b'1', 1000, '杰普官方直营', 47, 10286, 20572, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10287, b'0', NULL, '/images/shops/c2e3b2e4-1fc8-43f3-b133-6f4eae7faa5d.jpg', '128GB 珊瑚色 移动联通电信4G手机 双卡双待', 'Apple iPhone XR (A2108)', 4159.20, 5199.00, b'1', 1000, '杰普官方直营', 47, 10287, 20574, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10288, b'0', NULL, '/images/shops/2f5079e9-57f3-490a-8d3d-5fd64207939d.jpg', '128GB 蓝色 移动联通电信4G手机 双卡双待', 'Apple iPhone XR (A2108)', 4159.20, 5199.00, b'1', 1000, '杰普官方直营', 47, 10288, 20576, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10289, b'0', NULL, '/images/shops/b1259d73-7c5a-4eca-81eb-53a4e9bcc77e.jpg', '128GB 黄色 移动联通电信4G手机 双卡双待', 'Apple iPhone XR (A2108)', 4159.20, 5199.00, b'1', 1000, '杰普官方直营', 47, 10289, 20578, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10290, b'0', NULL, '/images/shops/0656b280-66d9-430b-9d0d-e48bf379d89a.jpg', 'Max (A2220) 64GB 暗夜绿色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 Pro', 7679.20, 9599.00, b'1', 1000, '杰普官方直营', 47, 10290, 20580, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10291, b'0', NULL, '/images/shops/77ce1f09-3900-4eff-8d97-e67fa8193a84.jpg', 'Max (A2220) 256GB 深空灰色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 Pro', 8719.20, 10899.00, b'1', 1000, '杰普官方直营', 47, 10291, 20582, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10292, b'0', NULL, '/images/shops/e45be404-d582-4c1e-80e8-48073327551e.jpg', 'Max (A2220) 64GB 金色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 Pro', 7679.20, 9599.00, b'1', 1000, '杰普官方直营', 47, 10292, 20584, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10293, b'0', NULL, '/images/shops/76670f49-4556-40ae-b485-3b25dcdcb636.jpg', 'Max (A2220) 512GB 银色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 Pro', 10159.20, 12699.00, b'1', 1000, '杰普官方直营', 47, 10293, 20586, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10294, b'0', NULL, '/images/shops/101abd40-e9a2-4ab0-9f4e-16569c9dbf82.jpg', '128G 黑色 移动联通电信4G手机', 'Apple iPhone 7 (A1660)', 2359.20, 2949.00, b'1', 1000, '杰普官方直营', 47, 10294, 20588, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10295, b'0', NULL, '/images/shops/6229468b-bcb7-4415-880a-aea3eef4eea2.jpg', '128G 玫瑰金色 移动联通电信4G手机', 'Apple iPhone 7 (A1660)', 2343.20, 2929.00, b'1', 1000, '杰普官方直营', 47, 10295, 20590, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10296, b'0', NULL, '/images/shops/1f5bb955-fbe7-451a-b12c-3e2115c53020.jpg', '128G 金色 移动联通电信4G手机', 'Apple iPhone 7 (A1660)', 2343.20, 2929.00, b'1', 1000, '杰普官方直营', 47, 10296, 20592, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10297, b'0', NULL, '/images/shops/9fc3c48f-c8e2-426b-915a-c32b0e72998d.jpg', '128G 银色 移动联通电信4G手机', 'Apple iPhone 7 (A1660)', 2343.20, 2929.00, b'1', 1000, '杰普官方直营', 47, 10297, 20594, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10298, b'0', NULL, '/images/shops/ec4af4a5-0a53-4246-bd88-919b0541a55c.jpg', '(A2104) 256GB 深空灰色 移动联通电信4G手机 双卡双待', 'Apple iPhone XS Max', 7199.20, 8999.00, b'1', 1000, '杰普官方直营', 47, 10298, 20596, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10299, b'0', NULL, '/images/shops/b7d2373a-5a8c-4be5-a4ce-57b408c6d9f2.jpg', '(A2104) 256GB 金色 移动联通电信4G手机 双卡双待', 'Apple iPhone XS Max', 7199.20, 8999.00, b'1', 1000, '杰普官方直营', 47, 10299, 20598, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10300, b'0', NULL, '/images/shops/837aaf40-5797-4929-b162-a248bfe73b36.jpg', '(A2104) 256GB 银色 移动联通电信4G手机 双卡双待', 'Apple iPhone XS Max', 7199.20, 8999.00, b'1', 1000, '杰普官方直营', 47, 10300, 20600, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10301, b'0', NULL, '/images/shops/8ab049d8-5b2e-4b69-bef0-013bec414598.jpg', '64GB 深空灰色 移动联通电信4G手机', 'Apple iPhone 8 (A1863)', 2799.20, 3499.00, b'1', 1000, '杰普官方直营', 47, 10301, 20602, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10302, b'0', NULL, '/images/shops/eaeb6faf-2ead-4f5d-84d2-1629686a492c.jpg', '64GB 银色 移动联通电信4G手机', 'Apple iPhone 8 (A1863)', 2799.20, 3499.00, b'1', 1000, '杰普官方直营', 47, 10302, 20604, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10303, b'0', NULL, '/images/shops/0611528c-73c8-4114-a1d8-d9387e771284.jpg', '64GB 金色 移动联通电信4G手机', 'Apple iPhone 8 (A1863)', 2799.20, 3499.00, b'1', 1000, '杰普官方直营', 47, 10303, 20606, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10304, b'0', NULL, '/images/shops/dbafc182-23b7-442c-b9cb-0ea825a659a9.jpg', '(A1661) 128G 黑色 移动联通电信4G手机', 'Apple iPhone 7 Plus', 2959.20, 3699.00, b'1', 1000, '杰普官方直营', 47, 10304, 20608, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10305, b'0', NULL, '/images/shops/c227df08-9a26-430a-88a5-72c1e4da5b6e.jpg', '(A1661) 128G 玫瑰金色 移动联通电信4G手机', 'Apple iPhone 7 Plus', 2959.20, 3699.00, b'1', 1000, '杰普官方直营', 47, 10305, 20610, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10306, b'0', NULL, '/images/shops/bf58f29f-75ed-411e-8255-3b9f802634f2.jpg', '(A1661) 128G 金色 移动联通电信4G手机', 'Apple iPhone 7 Plus', 2959.20, 3699.00, b'1', 1000, '杰普官方直营', 47, 10306, 20612, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10307, b'0', NULL, '/images/shops/dfab7fee-e787-423d-9771-67e05b03b358.jpg', '(A1661) 128G 银色 移动联通电信4G手机', 'Apple iPhone 7 Plus', 2959.20, 3699.00, b'1', 1000, '杰普官方直营', 47, 10307, 20614, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10308, b'0', NULL, '/images/shops/b3ff5475-9519-4d94-8f07-5840bb796e60.jpg', '64GB 金色 移动联通4G手机', 'Apple iPhone XS (A2099)', 5039.20, 6299.00, b'1', 1000, '杰普官方直营', 47, 10308, 20616, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10309, b'0', NULL, '/images/shops/7cc8d012-cfaa-45c4-ba35-70ca46c8bd66.jpg', '64GB 深空灰色 移动联通4G手机', 'Apple iPhone XS (A2099)', 5039.20, 6299.00, b'1', 1000, '杰普官方直营', 47, 10309, 20618, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10310, b'0', NULL, '/images/shops/776b459b-e981-434f-bbf7-635cafab7418.jpg', '256GB 银色 移动联通4G手机', 'Apple iPhone XS (A2099)', 6159.20, 7699.00, b'1', 1000, '杰普官方直营', 47, 10310, 20620, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10311, b'0', NULL, '/images/shops/8eb2e38b-84e1-4f31-9dae-841800f68038.jpg', '(A1899) 64GB 深空灰色 移动联通4G手机', 'Apple iPhone 8 Plus', 3199.20, 3999.00, b'1', 1000, '杰普官方直营', 47, 10311, 20622, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10312, b'0', NULL, '/images/shops/58c6a2c3-d3f7-4b0a-b4ae-e649b1032087.jpg', '(A1864) 64GB 金色 移动联通电信4G手机', 'Apple iPhone 8 Plus', 3519.20, 4399.00, b'1', 1000, '杰普官方直营', 47, 10312, 20624, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10313, b'0', NULL, '/images/shops/2839c451-3eaf-4820-8a15-1858ce339407.jpg', '(A1864) 64GB 银色 移动联通电信4G手机', 'Apple iPhone 8 Plus', 3519.20, 4399.00, b'1', 1000, '杰普官方直营', 47, 10313, 20626, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10314, b'0', NULL, '/images/shops/35bbe123-c822-457c-aaf0-fdcd861bc06d.jpg', '手机 双卡双待 黑色 全网通64G', 'Apple 苹果 iPhone xr', 3678.40, 4598.00, b'1', 1000, '杰普官方直营', 47, 10314, 20628, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10315, b'0', NULL, '/images/shops/0e565b23-554e-45d3-ac62-a2fb25be7f2c.jpg', '手机 双卡双待 白色 全网通64G', 'Apple 苹果 iPhone xr', 3726.40, 4658.00, b'1', 1000, '杰普官方直营', 47, 10315, 20630, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10316, b'0', NULL, '/images/shops/c08b6ddc-735f-4d2c-b47f-1f0e7f62a9b1.jpg', '手机 双卡双待 蓝色 全网通64G', 'Apple 苹果 iPhone xr', 3758.40, 4698.00, b'1', 1000, '杰普官方直营', 47, 10316, 20632, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10317, b'0', NULL, '/images/shops/c09636de-93b1-444e-b00e-668506676443.jpg', '手机 双卡双待 黄色 全网通64G', 'Apple 苹果 iPhone xr', 3758.40, 4698.00, b'1', 1000, '杰普官方直营', 47, 10317, 20634, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10318, b'0', NULL, '/images/shops/b26d8460-7ab5-4006-ba5c-e212ee0f31bd.jpg', '手机 双卡双待 红色 全网通128G', 'Apple 苹果 iPhone xr', 4030.40, 5038.00, b'1', 1000, '杰普官方直营', 47, 10318, 20636, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10319, b'0', NULL, '/images/shops/fab7cf40-9b7d-4141-8227-9ce7e02e8330.jpg', '手机 双卡双待 珊瑚色 全网通64G', 'Apple 苹果 iPhone xr', 3758.40, 4698.00, b'1', 1000, '杰普官方直营', 47, 10319, 20638, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10320, b'0', NULL, '/images/shops/0025ad55-e260-4a00-be79-fa5b8c5ac0de.jpg', '(A2217) 256GB 暗夜绿色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 Pro', 7999.20, 9999.00, b'1', 996, '杰普官方直营', 47, 10320, 20640, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10321, b'0', NULL, '/images/shops/d0abbd2a-19ca-4ae7-9b3c-1eb4eb77c565.jpg', '(A2217) 64GB 深空灰色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 Pro', 6959.20, 8699.00, b'1', 1000, '杰普官方直营', 47, 10321, 20642, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10322, b'0', NULL, '/images/shops/7d192eff-938f-4e6d-8952-9d405707033e.jpg', '(A2217) 64GB 银色 移动联通电信4G手机 双卡双待', 'Apple iPhone 11 Pro', 6959.20, 8699.00, b'1', 1000, '杰普官方直营', 47, 10322, 20644, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10323, b'0', NULL, '/images/shops/38b3f3a9-7056-45a3-b183-ad46dc71f493.jpg', '(A2217) 512GB 金色 移动联通电信4G手机 双卡双待', '【换修无忧年付版】Apple iPhone 11 Pro', 10078.40, 12598.00, b'1', 1000, '杰普官方直营', 47, 10323, 20646, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-0.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-1.png\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-11-2.png\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10324, b'0', NULL, '/images/shops/22febff2-db52-4f7a-8d16-414e755e788b.jpg', 'Plus 4G手机 金色 全网通 128G', 'Apple 苹果 iPhone 6s', 2334.40, 2918.00, b'1', 1000, '杰普官方直营', 47, 10324, 20648, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10325, b'0', NULL, '/images/shops/dfb0d434-4d59-4fda-896a-1ebd9e4d9ece.jpg', 'Plus 4G手机 玫瑰金 全网通 128G', 'Apple 苹果 iPhone 6s', 2334.40, 2918.00, b'1', 1000, '杰普官方直营', 47, 10325, 20650, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10326, b'0', NULL, '/images/shops/d3a4b902-8010-4619-89e4-96cb88e6d4e4.jpg', 'Plus 4G手机 深空灰 全网通 128G', 'Apple 苹果 iPhone 6s', 2310.40, 2888.00, b'1', 1000, '杰普官方直营', 47, 10326, 20652, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10327, b'0', NULL, '/images/shops/b4b7e7d3-b7ba-4917-a1f9-70c52f28df9d.jpg', 'Plus 4G手机 银色 全网通 128G', 'Apple 苹果 iPhone 6s', 2390.40, 2988.00, b'1', 1000, '杰普官方直营', 47, 10327, 20654, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10328, b'0', NULL, '/images/shops/0514e529-6b3e-40d5-9183-84088ddb55e1.jpg', '国行二手手机 XS Max 深空灰 64G', '【二手9成新】Apple iPhone XSmax 苹果XSmax', 4870.40, 6088.00, b'1', 1000, '杰普官方直营', 47, 10328, 20656, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10329, b'0', NULL, '/images/shops/a0dfd1ad-61ed-43ee-add4-74bdfea1d6c1.jpg', '国行二手手机 XS Max 金色 64G', '【二手9成新】Apple iPhone XSmax 苹果XSmax', 4870.40, 6088.00, b'1', 1000, '杰普官方直营', 47, 10329, 20658, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10330, b'0', NULL, '/images/shops/87b66719-fc17-4c97-a954-de8a78b42a09.jpg', '国行二手手机 XS Max 银色 256G', '【二手9成新】Apple iPhone XSmax 苹果XSmax', 5550.40, 6938.00, b'1', 1000, '杰普官方直营', 47, 10330, 20660, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10331, b'0', NULL, '/images/shops/5b132b57-24e4-4d65-9cb8-3299dc0e9ed6.png', '苹果6sPlus 二手手机（送一年碎屏险） 玫瑰金色 64G 全网通', '【二手9成新】Apple iPhone 6s Plus', 1174.40, 1468.00, b'1', 1000, '杰普官方直营', 47, 10331, 20662, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10332, b'0', NULL, '/images/shops/f289ec14-e0e2-481e-a703-39eec00a1b15.png', '苹果6sPlus 二手手机（送一年碎屏险） 金色 64G 全网通', '【二手9成新】Apple iPhone 6s Plus', 1199.20, 1499.00, b'1', 1000, '杰普官方直营', 47, 10332, 20664, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10333, b'0', NULL, '/images/shops/084208d0-4dc2-4f1a-aff4-4114616dfae1.png', '苹果6sPlus 二手手机（送一年碎屏险） 银色 64G 全网通', '【二手9成新】Apple iPhone 6s Plus', 1279.20, 1599.00, b'1', 1000, '杰普官方直营', 47, 10333, 20666, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10334, b'0', NULL, '/images/shops/8a598420-0052-4551-b00a-b288b6c22a48.png', '苹果6sPlus 二手手机（送一年碎屏险） 深空灰色 64G 全网通', '【二手9成新】Apple iPhone 6s Plus', 1310.40, 1638.00, b'1', 1000, '杰普官方直营', 47, 10334, 20668, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10335, b'0', NULL, '/images/shops/6110a187-511f-45d0-8b59-ea2a75546a45.jpg', '手机 双卡双待 白色 全网通 64G', 'Apple 苹果 iPhone xr', 3759.20, 4699.00, b'1', 1000, '杰普官方直营', 47, 10335, 20670, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10336, b'0', NULL, '/images/shops/41b10e86-857c-435c-b86d-d822e35450ab.jpg', '手机 双卡双待 黑色 全网通 128G', 'Apple 苹果 iPhone xr', 4063.20, 5079.00, b'1', 1000, '杰普官方直营', 47, 10336, 20672, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10337, b'0', NULL, '/images/shops/d38bcaab-7a0a-4f86-ad75-60ac74a308e6.jpg', '手机 双卡双待 蓝色 全网通 64G', 'Apple 苹果 iPhone xr', 3759.20, 4699.00, b'1', 1000, '杰普官方直营', 47, 10337, 20674, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10338, b'0', NULL, '/images/shops/73fc7cb9-5b43-4bce-a2b3-a82516773de0.jpg', '手机 双卡双待 黄色 全网通 128G', 'Apple 苹果 iPhone xr', 4063.20, 5079.00, b'1', 1000, '杰普官方直营', 47, 10338, 20676, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10339, b'0', NULL, '/images/shops/00e53d76-db08-4ae2-864f-ca1cd7c8c32b.jpg', '手机 双卡双待 珊瑚色 全网通 64G', 'Apple 苹果 iPhone xr', 3759.20, 4699.00, b'1', 1000, '杰普官方直营', 47, 10339, 20678, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10340, b'0', NULL, '/images/shops/5b9acfd4-7808-4b3b-bf5c-4b367667418c.jpg', '国行 二手手机 XS max金色 64G 全网通', '【二手95新】Apple iPhonex XSmax苹果x xsmax', 4870.40, 6088.00, b'1', 1000, '杰普官方直营', 47, 10340, 20680, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10341, b'0', NULL, '/images/shops/cd2b481d-a4a2-4bc0-a4e1-784a28c37ef9.jpg', '国行 二手手机 XS 金色 64G 全网通', '【二手95新】Apple iPhonex XSmax苹果x xsmax', 4239.20, 5299.00, b'1', 1000, '杰普官方直营', 47, 10341, 20682, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10342, b'0', NULL, '/images/shops/1d866674-4e57-483a-955f-5fd1a4f5d921.jpg', '国行 二手手机 XS max灰色 256G 全网通', '【二手95新】Apple iPhonex XSmax苹果x xsmax', 5550.40, 6938.00, b'1', 1000, '杰普官方直营', 47, 10342, 20684, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10343, b'0', NULL, '/images/shops/3f3e086e-e4be-464f-9c20-760430cab2df.jpg', '国行 二手手机 XS max银色 64G 全网通', '【二手95新】Apple iPhonex XSmax苹果x xsmax', 4870.40, 6088.00, b'1', 1000, '杰普官方直营', 47, 10343, 20686, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10344, b'0', NULL, '/images/shops/4a4a0820-aad5-47d4-a926-f040fd090c96.jpg', '国行 二手手机 XS 灰色 64G 全网通', '【二手95新】Apple iPhonex XSmax苹果x xsmax', 4239.20, 5299.00, b'1', 1000, '杰普官方直营', 47, 10344, 20688, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10345, b'0', NULL, '/images/shops/a6b87d83-5ba7-4683-be17-43ab9aa043e3.jpg', '国行 二手手机 XS 银色 64G 全网通', '【二手95新】Apple iPhonex XSmax苹果x xsmax', 4239.20, 5299.00, b'1', 1000, '杰普官方直营', 47, 10345, 20690, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10346, b'0', NULL, '/images/shops/3cd13e20-2a00-4049-8768-0ba662df7e40.jpg', '二手手机 深空灰色 64G 全网通', '【二手9成新】Apple iPhone X 苹果X', 3191.20, 3989.00, b'1', 1000, '杰普官方直营', 47, 10346, 20692, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10347, b'0', NULL, '/images/shops/fc3db752-e0dc-4ae7-bac3-fd60ab8a1e17.jpg', '二手手机 银色 64G 全网通', '【二手9成新】Apple iPhone X 苹果X', 3206.40, 4008.00, b'1', 1000, '杰普官方直营', 47, 10347, 20694, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10348, b'0', NULL, '/images/shops/24b442e2-1bdd-4350-bbab-4e4d3d3445f1.jpg', '二手手机 磨砂黑 128G 全网通', '【二手9成新】苹果7Plus手机 Apple iPhone7Plus 苹果7P', 1919.20, 2399.00, b'1', 1000, '杰普官方直营', 47, 10348, 20696, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10349, b'0', NULL, '/images/shops/7601e13f-de8e-449c-84be-65fbc7280cfc.png', '二手手机 亮黑色 128G 全网通', '【二手9成新】苹果7Plus手机 Apple iPhone7Plus 苹果7P', 1919.20, 2399.00, b'1', 1000, '杰普官方直营', 47, 10349, 20698, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10350, b'0', NULL, '/images/shops/771bc653-485b-4c5d-bca3-c84d3e90020d.jpg', '二手手机 玫瑰金 128G 全网通', '【二手9成新】苹果7Plus手机 Apple iPhone7Plus 苹果7P', 1919.20, 2399.00, b'1', 1000, '杰普官方直营', 47, 10350, 20700, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10351, b'0', NULL, '/images/shops/5a170339-acb4-4890-bd08-bb109864e853.jpg', '二手手机 金色 128G 全网通', '【二手9成新】苹果7Plus手机 Apple iPhone7Plus 苹果7P', 1919.20, 2399.00, b'1', 1000, '杰普官方直营', 47, 10351, 20702, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10352, b'0', NULL, '/images/shops/a419ebb4-18a5-4295-9404-0593dd215ad0.jpg', '二手手机 银色 128G 全网通', '【二手9成新】苹果7Plus手机 Apple iPhone7Plus 苹果7P', 1972.80, 2466.00, b'1', 1000, '杰普官方直营', 47, 10352, 20704, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10353, b'0', NULL, '/images/shops/4f666eee-c2c7-459c-934e-b32714d1e1c4.png', '二手手机 全网通 深空灰 64G', '【二手9成新】Apple iPhone X 苹果X', 3164.80, 3956.00, b'1', 1000, '杰普官方直营', 47, 10353, 20706, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10354, b'0', NULL, '/images/shops/ada8e547-dca3-47fc-8aab-35884575090a.jpg', '苹果8P 二手手机 深空灰 64G 全网通', '【二手9成新】苹果8Plus手机 Apple iPhone 8Plus', 2559.20, 3199.00, b'1', 1000, '杰普官方直营', 47, 10354, 20708, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10355, b'0', NULL, '/images/shops/76a2e417-2f15-412f-ab73-3a5eb2a7d2d1.jpg', '苹果8P 二手手机 金色 64G 全网通', '【二手9成新】苹果8Plus手机 Apple iPhone 8Plus', 2559.20, 3199.00, b'1', 1000, '杰普官方直营', 47, 10355, 20710, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10356, b'0', NULL, '/images/shops/5bfb8955-0b1c-4652-b162-a9b91b71211a.jpg', '苹果8P 二手手机 银色 64G 全网通', '【二手9成新】苹果8Plus手机 Apple iPhone 8Plus', 2590.40, 3238.00, b'1', 1000, '杰普官方直营', 47, 10356, 20712, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10357, b'0', NULL, '/images/shops/d31193ee-04c1-4bac-8a91-1a4690a396be.jpg', '苹果8P 二手手机 中国红 64G 全网通', '【二手9成新】苹果8Plus手机 Apple iPhone 8Plus', 2639.20, 3299.00, b'1', 1000, '杰普官方直营', 47, 10357, 20714, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10358, b'0', NULL, '/images/shops/b9264842-cd50-4d6f-a4a5-e8cc9dd483a4.png', '深空灰 64G全网通', '【二手9成新】Apple iPhoneX 苹果X 二手苹果x手机', 3191.20, 3989.00, b'1', 1000, '杰普官方直营', 47, 10358, 20716, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10359, b'0', NULL, '/images/shops/58e9a125-61c1-416b-b17f-99cda431a202.png', '银色 64G全网通', '【二手9成新】Apple iPhoneX 苹果X 二手苹果x手机', 3212.80, 4016.00, b'1', 1000, '杰普官方直营', 47, 10359, 20718, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10360, b'0', NULL, '/images/shops/5a732ada-1fdb-48f1-b106-666159565a94.jpg', '国行全网通二手手机 银色 全网通 64G', '【二手95新】Apple iPhone XS 苹果xs', 4239.20, 5299.00, b'1', 1000, '杰普官方直营', 47, 10360, 20720, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10361, b'0', NULL, '/images/shops/f9e9b321-4b25-40c5-af6d-d9f3fe74a053.jpg', '国行全网通二手手机 金色 全网通 256G', '【二手95新】Apple iPhone XS 苹果xs', 4806.40, 6008.00, b'1', 1000, '杰普官方直营', 47, 10361, 20722, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10362, b'0', NULL, '/images/shops/8da60128-fcc7-46ed-98b6-0066c69624c0.png', '二手手机 X 银色 256G 全网通', '【二手9成新】Apple iPhone X 苹果x', 3711.20, 4639.00, b'1', 1000, '杰普官方直营', 47, 10362, 20724, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10363, b'0', NULL, '/images/shops/8aca87a3-65dd-4c42-91c7-bbbd10fcf7a6.jpg', '国行全网通二手手机 X 灰色 64G 全网通', '【二手9成新】Apple iPhone X 苹果x', 3199.20, 3999.00, b'1', 1000, '杰普官方直营', 47, 10363, 20726, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10364, b'0', NULL, '/images/shops/fdec1b37-9a2f-46ea-af03-5091d83e546a.jpg', '国行全网通二手手机 X 银色 64G 全网通', '【二手9成新】Apple iPhone X 苹果x', 3262.40, 4078.00, b'1', 1000, '杰普官方直营', 47, 10364, 20728, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10365, b'0', NULL, '/images/shops/9834bb8d-fe1c-4218-a624-4a25aecb0676.jpg', '二手手机双卡双待 白色 128G 全网通', '【二手9成新】Apple iPhone XR 苹果xr', 3439.20, 4299.00, b'1', 1000, '杰普官方直营', 47, 10365, 20730, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10366, b'0', NULL, '/images/shops/3993feaa-0365-4d7e-9cc5-dcf583243ca3.jpg', '二手手机双卡双待 蓝色 128G 全网通', '【二手9成新】Apple iPhone XR 苹果xr', 3519.20, 4399.00, b'1', 1000, '杰普官方直营', 47, 10366, 20732, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10367, b'0', NULL, '/images/shops/ba9cf789-60a8-48db-8329-97c3fc13a061.jpg', '二手手机双卡双待 黑色 64G 全网通', '【二手9成新】Apple iPhone XR 苹果xr', 3244.00, 4055.00, b'1', 1000, '杰普官方直营', 47, 10367, 20734, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10689, b'0', NULL, '/images/shops/9aa34959-cd60-418f-b42e-aa7243b6869c.jpg', '麒麟710F自研芯片 全网通4GB+64GB 幻夜黑', '荣耀Play3 6.39英寸魅眼全视屏 4000mAh大电池 真4800万AI三摄', 799.20, 999.00, b'1', 1000, '杰普官方直营', 45, 10689, 21378, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10690, b'0', NULL, '/images/shops/2613a582-460c-4c2b-bbc0-6c7dbf501bd2.jpg', '超高清全视屏前置悬浮式镜头4800万超广角AI三摄 4GB+128GB幻夜黑全网通双4G手机', '华为 HUAWEI 畅享10 Plus', 1199.20, 1499.00, b'1', 1000, '杰普官方直营', 46, 10690, 21380, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10691, b'0', NULL, '/images/shops/21b0751b-f6ae-4a57-8fb8-61e007395c43.jpg', '超高清全视屏前置悬浮式镜头4800万超广角AI三摄 4GB+128GB翡冷翠全网通双4G手机', '华为 HUAWEI 畅享10 Plus', 1199.20, 1499.00, b'1', 1000, '杰普官方直营', 46, 10691, 21382, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10692, b'0', NULL, '/images/shops/3f68538f-3b56-4e98-9676-99139857428c.jpg', '超高清全视屏前置悬浮式镜头4800万超广角AI三摄 6GB+128GB天空之境全网通双4G手机', '华为 HUAWEI 畅享10 Plus', 1439.20, 1799.00, b'1', 999, '杰普官方直营', 46, 10692, 21384, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10693, b'0', NULL, '/images/shops/f8ab28c3-8e04-49a0-ba05-2e6a3ae7211f.jpg', '渐变蓝 移动联通电信4G全面屏手机 双卡双待', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', 799.20, 999.00, b'1', 1000, '杰普官方直营', 45, 10693, 21386, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10694, b'0', NULL, '/images/shops/de654f42-d58d-4336-8edd-da01c3523449.jpg', '幻夜黑 移动联通电信4G全面屏手机 双卡双待', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', 799.20, 999.00, b'1', 999, '杰普官方直营', 45, 10694, 21388, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10695, b'0', NULL, '/images/shops/87254a42-9fdf-4e68-a11e-e8e2eef28d2c.jpg', '渐变红 移动联通电信4G全面屏手机 双卡双待', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', 799.20, 999.00, b'1', 997, '杰普官方直营', 45, 10695, 21390, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10696, b'0', NULL, '/images/shops/81b7060a-7274-4bff-86c0-72d5fc7ff383.jpg', '铃兰白 移动联通电信4G全面屏手机 双卡双待', '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4GB+64GB', 799.20, 999.00, b'1', 1000, '杰普官方直营', 45, 10696, 21392, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10697, b'0', NULL, '/images/shops/d7f74e8f-5c52-422b-ac99-a8d691830494.jpg', '4GB+64GB 幻夜黑 移动联通电信4G全面屏手机 双卡双待', '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄', 799.20, 999.00, b'1', 1000, '杰普官方直营', 45, 10697, 21394, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10698, b'0', NULL, '/images/shops/7031c07e-a70f-4f6d-9e2d-d0af31e3393a.jpg', '4GB+64GB 幻影蓝 移动联通电信4G全面屏手机 双卡双待', '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄', 799.20, 999.00, b'1', 1000, '杰普官方直营', 45, 10698, 21396, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10699, b'0', NULL, '/images/shops/b7bfcc28-98c2-4cb4-8ce3-afe4c482b674.jpg', '4GB+64GB 魅海蓝 移动联通电信4G全面屏手机 双卡双待', '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄', 799.20, 999.00, b'1', 1000, '杰普官方直营', 45, 10699, 21398, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10700, b'0', NULL, '/images/shops/6a160b96-9b4a-4844-b335-feb31b1f5d8c.jpg', '4GB+64GB 魅焰红 移动联通电信4G全面屏手机 双卡双待', '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄', 799.20, 999.00, b'1', 1000, '杰普官方直营', 45, 10700, 21400, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10701, b'0', NULL, '/images/shops/8ccc13ec-96fe-4488-a604-526601548c9e.jpg', '4GB+64GB 梦幻紫 移动联通电信4G全面屏手机 双卡双待', '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄', 799.20, 999.00, b'1', 1000, '杰普官方直营', 45, 10701, 21402, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10702, b'0', NULL, '/images/shops/edb7e8ef-7785-418b-a75e-dfed2aa74e39.jpg', '杰普精选', '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB天空之境全网通双4G手机', 3190.40, 3988.00, b'1', 1000, '杰普官方直营', 46, 10702, 21404, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10703, b'0', NULL, '/images/shops/e13294f7-9ab0-42dc-afb1-9f41c59436cf.jpg', '杰普精选', '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB亮黑色全网通双4G手机', 3190.40, 3988.00, b'1', 1000, '杰普官方直营', 46, 10703, 21406, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10704, b'0', NULL, '/images/shops/b9e6d770-06dd-40f4-9ae5-31103cec6e5f.jpg', '杰普精选', '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB珠光贝母全网通双4G手机', 3190.40, 3988.00, b'1', 998, '杰普官方直营', 46, 10704, 21408, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10705, b'0', NULL, '/images/shops/20312f4e-da4f-49b9-8150-ab54f0302915.jpg', '杰普精选', '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB极光色全网通双4G手机', 3190.40, 3988.00, b'1', 997, '杰普官方直营', 46, 10705, 21410, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10706, b'0', NULL, '/images/shops/192b1727-bcab-4bdf-8494-182f8ec5b2e6.jpg', '杰普精选', '华为 HUAWEI P30 超感光徕卡三摄麒麟980AI智能芯片全面屏屏内指纹版手机8GB+128GB赤茶橘全网通双4G手机', 3190.40, 3988.00, b'1', 987, '杰普官方直营', 46, 10706, 21412, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10707, b'0', NULL, '/images/shops/74146e03-42d1-453c-843d-b02d8bcc24f4.jpg', '渐变蓝 移动联通电信4G全面屏手机 双卡双待', '荣耀20i 3200万AI自拍 超广角三摄 全网通版6GB+64GB', 1039.20, 1299.00, b'1', 996, '杰普官方直营', 45, 10707, 21414, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10708, b'0', NULL, '/images/shops/4c066fc2-3a58-44df-9dc6-8465b25f92ef.jpg', '渐变红 移动联通电信4G全面屏手机 双卡双待', '荣耀20i 3200万AI自拍 超广角三摄 全网通版6GB+64GB', 1039.20, 1299.00, b'1', 1000, '杰普官方直营', 45, 10708, 21416, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10709, b'0', NULL, '/images/shops/525bdd6e-848b-4e02-b19f-1a08fdb87faa.jpg', '幻夜黑 移动联通电信4G全面屏手机 双卡双待', '荣耀20i 3200万AI自拍 超广角三摄 全网通版6GB+64GB', 1039.20, 1299.00, b'1', 1000, '杰普官方直营', 45, 10709, 21418, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10710, b'0', NULL, '/images/shops/7b8b7da7-f154-453e-a6a6-ea2f5e7d8b4a.jpg', '6.59英寸升降全面屏 全网通6GB+64GB 魅海蓝', '荣耀9X 麒麟810 4000mAh超强续航 4800万超清夜拍', 1279.20, 1599.00, b'1', 1000, '杰普官方直营', 45, 10710, 21420, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10711, b'0', NULL, '/images/shops/d30f7986-bc0f-4ea8-8fbb-94c6bae248f5.jpg', '6.59英寸升降全面屏 全网通6GB+64GB 幻夜黑', '荣耀9X 麒麟810 4000mAh超强续航 4800万超清夜拍', 1279.20, 1599.00, b'1', 975, '杰普官方直营', 45, 10711, 21422, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10712, b'0', NULL, '/images/shops/95b5df3b-cfec-40bb-8ead-35e0fe7fb7b2.jpg', '6.59英寸升降全面屏 全网通4GB+64GB 魅焰红', '荣耀9X 麒麟810 4000mAh超强续航 4800万超清夜拍', 1119.20, 1399.00, b'1', 1000, '杰普官方直营', 45, 10712, 21424, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10713, b'0', NULL, '/images/shops/2469b8fa-8117-4409-a8d6-3b52a33b3e51.jpg', '麒麟Kirin980全网通版8GB+128GB 蓝水翡翠 全面屏手机', '荣耀20 李现同款 4800万超广角AI四摄 3200W美颜自拍', 1999.20, 2499.00, b'1', 1000, '杰普官方直营', 45, 10713, 21426, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10714, b'0', NULL, '/images/shops/474e2ef0-2321-4363-ab31-7a838546f172.jpg', '麒麟Kirin980全网通版8GB+128GB 幻夜黑 全面屏手机', '荣耀20 李现同款 4800万超广角AI四摄 3200W美颜自拍', 1999.20, 2499.00, b'1', 1000, '杰普官方直营', 45, 10714, 21428, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10715, b'0', NULL, '/images/shops/77d87d20-4fc7-441c-82a8-baf9089fc3ad.jpg', '麒麟Kirin980全网通版8GB+128GB 冰岛白 全面屏手机', '荣耀20 李现同款 4800万超广角AI四摄 3200W美颜自拍', 1999.20, 2499.00, b'1', 994, '杰普官方直营', 45, 10715, 21430, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10716, b'0', NULL, '/images/shops/1a200710-8c41-4411-8edf-a49575807a08.jpg', '麒麟Kirin980全网通版8GB+128GB 幻影蓝 全面屏手机', '荣耀20 李现同款 4800万超广角AI四摄 3200W美颜自拍', 1999.20, 2499.00, b'1', 1000, '杰普官方直营', 45, 10716, 21432, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10717, b'0', NULL, '/images/shops/391cd4e6-6071-41ea-a6fc-d983b30a5470.jpg', '双光学防抖 麒麟980 全网通4G 8GB+128GB 冰岛幻境 拍照手机', '荣耀20 PRO 李现同款 4800万全焦段AI四摄', 2319.20, 2899.00, b'1', 1000, '杰普官方直营', 45, 10717, 21434, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10718, b'0', NULL, '/images/shops/5d7ee18f-ca20-4d72-a803-dc5b03bd80e2.jpg', '双光学防抖 麒麟980 全网通4G 8GB+128GB 蓝水翡翠 拍照手机', '荣耀20 PRO 李现同款 4800万全焦段AI四摄', 2319.20, 2899.00, b'1', 1000, '杰普官方直营', 45, 10718, 21436, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10719, b'0', NULL, '/images/shops/e1505375-d00d-4cd8-a090-a13490b430d5.jpg', '双光学防抖 麒麟980 全网通4G 8GB+128GB 幻夜星河 拍照手机', '荣耀20 PRO 李现同款 4800万全焦段AI四摄', 2319.20, 2899.00, b'1', 1000, '杰普官方直营', 45, 10719, 21438, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10720, b'0', NULL, '/images/shops/0ae89667-8a69-4efc-b8d8-c0ebaf56753a.jpg', '4800万全焦段AI四摄 双光学防抖 麒麟980 8GB+256GB 黑色', '荣耀20 PRO × MOSCHINO联名版', 3039.20, 3799.00, b'1', 997, '杰普官方直营', 45, 10720, 21440, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10721, b'0', NULL, '/images/shops/1b96ae9b-8c56-465e-9e82-ff712305e2d9.jpg', '6GB+64GB 幻夜黑 全网通 2400万超广角三摄珍珠屏大存储 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享 9S', 959.20, 1199.00, b'1', 989, '杰普官方直营', 46, 10721, 21442, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10722, b'0', NULL, '/images/shops/b49530f5-fe13-42b3-9ca9-6f1367e0f8f8.jpg', '6GB+64GB 极光蓝 全网通 2400万超广角三摄珍珠屏大存储 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享 9S', 959.20, 1199.00, b'1', 994, '杰普官方直营', 46, 10722, 21444, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10723, b'0', NULL, '/images/shops/84397a4c-ff06-4f08-bad5-bd4d5f8e23ff.jpg', '6GB+64GB 珊瑚红 全网通 2400万超广角三摄珍珠屏大存储 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享 9S', 959.20, 1199.00, b'1', 1000, '杰普官方直营', 46, 10723, 21446, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10724, b'0', NULL, '/images/shops/7a58b5b2-0101-4a55-9872-d7765f08cf19.jpg', '4800万深感相机 6GB+128GB 幻夜黑 移动联通电信4G全面屏手机', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏', 1679.20, 2099.00, b'1', 1000, '杰普官方直营', 45, 10724, 21448, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10725, b'0', NULL, '/images/shops/5dd6b4de-0b39-48fc-9285-7356c22edf7b.jpg', '4800万深感相机 6GB+128GB 魅海蓝 移动联通电信4G全面屏手机', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏', 1679.20, 2099.00, b'1', 1000, '杰普官方直营', 45, 10725, 21450, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10726, b'0', NULL, '/images/shops/c5a6593b-ef49-42fd-b330-0be8021362d8.jpg', '4800万深感相机 6GB+128GB 幻影蓝 移动联通电信4G全面屏手机', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏', 1679.20, 2099.00, b'1', 1000, '杰普官方直营', 45, 10726, 21452, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10727, b'0', NULL, '/images/shops/b57f705a-ef7f-4a9f-a244-3fc980e17555.jpg', '4800万深感相机 6GB+128GB 魅丽红 移动联通电信4G全面屏手机', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏', 1679.20, 2099.00, b'1', 1000, '杰普官方直营', 45, 10727, 21454, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10728, b'0', NULL, '/images/shops/3dd91f7d-8f89-4e8a-a808-fa556ee1ceb3.jpg', '4800万深感相机 6GB+128GB 幻影红 移动联通电信4G全面屏手机', '荣耀V20 游戏手机 麒麟980芯片 魅眼全视屏', 1679.20, 2099.00, b'1', 1000, '杰普官方直营', 45, 10728, 21456, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10729, b'0', NULL, '/images/shops/f8edc81a-8fbd-425b-8ed7-d6b4c14ec6a1.jpg', '6GB+128GB 亮黑色 全网通移动联通电信4G手机 双卡双待', '华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机', 2239.20, 2799.00, b'1', 1000, '杰普官方直营', 46, 10729, 21458, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10730, b'0', NULL, '/images/shops/c17c5292-2c20-4196-88e3-7ea813530db5.jpg', '6GB+64GB 极光色 全网通移动联通电信4G手机 双卡双待', '华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机', 2143.20, 2679.00, b'1', 997, '杰普官方直营', 46, 10730, 21460, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10731, b'0', NULL, '/images/shops/b43bcd55-3709-4c32-b3a2-5b59c80f3610.jpg', '6GB+64GB 宝石蓝 全网通移动联通电信4G手机 双卡双待', '华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机', 2159.20, 2699.00, b'1', 999, '杰普官方直营', 46, 10731, 21462, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10732, b'0', NULL, '/images/shops/3b183d9a-ac01-4bed-a7bb-1ddeba6ad416.jpg', '6GB+64GB 极光闪蝶色 全网通版 移动联通电信4G手机 双卡双待', '华为 HUAWEI P20 AI智慧全面屏', 2143.20, 2679.00, b'1', 998, '杰普官方直营', 46, 10732, 21464, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10733, b'0', NULL, '/images/shops/28e94d5d-9ccc-4843-a296-2747530037ce.jpg', '6GB+64GB 珠光贝母色 全网通版 移动联通电信4G手机 双卡双待', '华为 HUAWEI P20 AI智慧全面屏', 2390.40, 2988.00, b'1', 1000, '杰普官方直营', 46, 10733, 21466, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10734, b'0', NULL, '/images/shops/0b11241e-4d6b-44ea-afb0-e029d1b5a54d.jpg', '6GB+128GB 香槟金 全网通移动联通电信4G手机 双卡双待', '华为 HUAWEI P20 AI智慧徕卡双摄全面屏游戏手机', 3110.40, 3888.00, b'1', 1000, '杰普官方直营', 46, 10734, 21468, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10735, b'0', NULL, '/images/shops/8883043d-bef3-442c-9ccf-af9c03510c5d.jpg', '麒麟810旗舰级芯片 全网通版6GB+128GB 蝶羽蓝', '荣耀20S 李现同款 3200万人像超级夜景 4800万超广角AI三摄', 1519.20, 1899.00, b'1', 1000, '杰普官方直营', 45, 10735, 21470, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10736, b'0', NULL, '/images/shops/522ed5b9-bcae-401f-9933-d2e957bb3384.jpg', '幻夜黑 全网通版 珍珠屏杜比全景声大电池 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享MAX 4GB+64GB', 799.20, 999.00, b'1', 1000, '杰普官方直营', 46, 10736, 21472, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10737, b'0', NULL, '/images/shops/36bdfdb9-21b1-46d5-9534-8b3873c9b6d9.jpg', '琥珀棕 全网通版 珍珠屏杜比全景声大电池 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享MAX 4GB+64GB', 799.20, 999.00, b'1', 1000, '杰普官方直营', 46, 10737, 21474, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10738, b'0', NULL, '/images/shops/51fa04cf-1c05-49ee-8dea-0c1757ff32c4.jpg', '天际白 全网通版 珍珠屏杜比全景声大电池 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享MAX 4GB+128GB', 1119.20, 1399.00, b'1', 1000, '杰普官方直营', 46, 10738, 21476, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10739, b'0', NULL, '/images/shops/65c8e729-aeca-4780-977b-4d0d39d4aa2e.jpg', '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB极光色全网通版双4G手机', '华为 HUAWEI P30 Pro', 3990.40, 4988.00, b'1', 998, '杰普官方直营', 46, 10739, 21478, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10740, b'0', NULL, '/images/shops/bc90bb1e-494a-44d4-b180-42a994ec80fc.jpg', '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB亮黑色全网通版双4G手机', '华为 HUAWEI P30 Pro', 3990.40, 4988.00, b'1', 1000, '杰普官方直营', 46, 10740, 21480, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10741, b'0', NULL, '/images/shops/a6f309b7-765a-4407-be71-bbd5b764d448.jpg', '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB珠光贝母全网通版双4G手机', '华为 HUAWEI P30 Pro', 3990.40, 4988.00, b'1', 1000, '杰普官方直营', 46, 10741, 21482, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10742, b'0', NULL, '/images/shops/dda1d575-cdac-4eb4-a118-3834490166f7.jpg', '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+256GB天空之境全网通版双4G手机', '华为 HUAWEI P30 Pro', 4390.40, 5488.00, b'1', 961, '杰普官方直营', 46, 10742, 21484, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10743, b'0', NULL, '/images/shops/8755a735-baa1-4f17-a9bd-30c4f4f1451b.jpg', '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+256GB墨玉蓝全网通版双4G手机', '华为 HUAWEI P30 Pro', 4390.40, 5488.00, b'1', 1000, '杰普官方直营', 46, 10743, 21486, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10744, b'0', NULL, '/images/shops/44e78820-86f3-429d-94af-64f6af308846.jpg', '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB赤茶橘全网通版双4G手机', '华为 HUAWEI P30 Pro', 3990.40, 4988.00, b'1', 1000, '杰普官方直营', 46, 10744, 21488, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10745, b'0', NULL, '/images/shops/no-img.png', '超感光徕卡四摄10倍混合变焦麒麟980芯片屏内指纹 8GB+128GB嫣紫色全网通版双4G手机', '华为 HUAWEI P30 Pro', 3990.40, 4988.00, b'1', 1000, '杰普官方直营', 46, 10745, 21490, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10746, b'0', NULL, '/images/shops/2948815e-043a-4f47-896f-7f6ccf916369.jpg', 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片8GB+128GB绮境森林全网通双4G手机', '华为 HUAWEI nova 5', 2399.20, 2999.00, b'1', 1000, '杰普官方直营', 46, 10746, 21492, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10747, b'0', NULL, '/images/shops/df1bea42-9172-4cd5-9fc5-f35bb736108f.jpg', 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片8GB+128GB亮黑色全网通双4G手机', '华为 HUAWEI nova 5', 2399.20, 2999.00, b'1', 1000, '杰普官方直营', 46, 10747, 21494, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10748, b'0', NULL, '/images/shops/ab6f8463-794f-4f40-87b8-d01e6260ff1c.jpg', 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片 8GB+128GB仲夏紫全网通双4G手机', '华为 HUAWEI nova 5', 2399.20, 2999.00, b'1', 1000, '杰普官方直营', 46, 10748, 21496, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10749, b'0', NULL, '/images/shops/98e90b6e-2a5d-462d-8cd1-44699144a0b5.jpg', 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片8GB+128GB苏音蓝全网通双4G手机', '华为 HUAWEI nova 5', 2399.20, 2999.00, b'1', 1000, '杰普官方直营', 46, 10749, 21498, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10750, b'0', NULL, '/images/shops/ec0bafed-d651-4be7-b2aa-13e84248219a.jpg', 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片8GB+128GB珊瑚橙全网通双4G手机', '华为 HUAWEI nova 5', 2399.20, 2999.00, b'1', 1000, '杰普官方直营', 46, 10750, 21500, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10751, b'0', NULL, '/images/shops/83f39052-5a1c-4769-a7db-cf2bd53d2a29.jpg', 'Pro 前置3200万人像超级夜景4800万AI四摄麒麟980芯片8GB+256GB仲夏紫星耀礼盒版全网通', '华为 HUAWEI nova 5', 2879.20, 3599.00, b'1', 1000, '杰普官方直营', 46, 10751, 21502, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10752, b'0', NULL, '/images/shops/4b2bffff-ec0b-42e0-8152-ada9a121ad31.jpg', '后置AI四摄 极点全面屏 前置2400万高清摄像头 8GB+128GB 苏音蓝 全网通双卡双待', '华为 HUAWEI nova 5i', 1759.20, 2199.00, b'1', 1000, '杰普官方直营', 46, 10752, 21504, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10753, b'0', NULL, '/images/shops/04dce482-ff0e-483c-b324-dfc030b6cdd1.jpg', '后置AI四摄 极点全面屏 前置2400万高清摄像头 8GB+128GB 幻夜黑 全网通双卡双待', '华为 HUAWEI nova 5i', 1759.20, 2199.00, b'1', 1000, '杰普官方直营', 46, 10753, 21506, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10754, b'0', NULL, '/images/shops/b5e139d3-ea6b-4874-9ccc-c18aca44a8bc.jpg', '后置AI四摄 极点全面屏 前置2400万高清摄像头 8GB+128GB 蜜语红 全网通双卡双待', '华为 HUAWEI nova 5i', 1759.20, 2199.00, b'1', 996, '杰普官方直营', 46, 10754, 21508, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10755, b'0', NULL, '/images/shops/86bd80cd-140b-474c-8277-3747332f61b3.jpg', '4800万超广角夜拍三摄 6.59英寸全网通8GB+128GB 幻影紫', '荣耀9X PRO 麒麟810液冷散热 4000mAh超强续航', 1759.20, 2199.00, b'1', 1000, '杰普官方直营', 45, 10755, 21510, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10756, b'0', NULL, '/images/shops/3b008be9-e906-4364-8aa0-0df2e670dbd2.jpg', '4800万超广角夜拍三摄 6.59英寸全网通8GB+128GB 幻夜黑', '荣耀9X PRO 麒麟810液冷散热 4000mAh超强续航', 1759.20, 2199.00, b'1', 1000, '杰普官方直营', 45, 10756, 21512, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10757, b'0', NULL, '/images/shops/7f7d2343-6743-490b-baec-3e0a76d061e5.jpg', '极光蓝 移动联通电信4G全面屏手机 双卡双待', '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB', 639.20, 799.00, b'1', 1000, '杰普官方直营', 45, 10757, 21514, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10758, b'0', NULL, '/images/shops/b163ca1b-7deb-4b15-818a-dc765c852305.jpg', '铂光金 移动联通电信4G全面屏手机 双卡双待', '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB', 639.20, 799.00, b'1', 1000, '杰普官方直营', 45, 10758, 21516, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10759, b'0', NULL, '/images/shops/f949289a-4c51-4159-a754-871da347e1e5.jpg', '星云紫 移动联通电信4G全面屏手机 双卡双待', '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+32GB', 639.20, 799.00, b'1', 1000, '杰普官方直营', 45, 10759, 21518, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10760, b'0', NULL, '/images/shops/27c3c018-95c5-429f-9ad7-be0fedd78329.jpg', '幻夜黑 移动联通电信4G全面屏手机 双卡双待', '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+64GB', 879.20, 1099.00, b'1', 1000, '杰普官方直营', 45, 10760, 21520, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10761, b'0', NULL, '/images/shops/61224f59-e11a-4005-84dc-cadfdd4162f6.jpg', '幻影蓝 移动联通电信4G全面屏手机 双卡双待', '荣耀畅玩8C两天一充 莱茵护眼 刘海屏 全网通版4GB+64GB', 879.20, 1099.00, b'1', 1000, '杰普官方直营', 45, 10761, 21522, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10762, b'0', NULL, '/images/shops/af23223e-56fa-4aa7-b832-c55c713fa604.jpg', '2GB+32GB全面屏 金色 全网通版 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享8e 青春版', 439.20, 549.00, b'1', 1000, '杰普官方直营', 46, 10762, 21524, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10763, b'0', NULL, '/images/shops/bf64e22d-1cd3-40b0-9ce1-cc944e35d2d4.jpg', '黑色 全网通版 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享8e青春 2GB+32GB全面屏', 439.20, 549.00, b'1', 1000, '杰普官方直营', 46, 10763, 21526, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10764, b'0', NULL, '/images/shops/70f9ecf9-4859-45de-8f67-5afbdba6735c.jpg', '蓝色 全网通版 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享8e青春 2GB+32GB全面屏', 439.20, 549.00, b'1', 1000, '杰普官方直营', 46, 10764, 21528, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10765, b'0', NULL, '/images/shops/55b997f9-fa22-40b0-8b33-429760c2af49.jpg', '3200万立体美颜AI超广角三摄珍珠屏6GB+128GB雀翎蓝全网通版双4G手机', '华为 HUAWEI nova 4e', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 46, 10765, 21530, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10766, b'0', NULL, '/images/shops/8d675ec6-efe0-4ca6-8f83-193820b07256.jpg', '3200万立体美颜AI超广角三摄珍珠屏6GB+128GB幻夜黑全网通版双4G手机', '华为 HUAWEI nova 4e', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 46, 10766, 21532, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10767, b'0', NULL, '/images/shops/c8ce9a44-7b40-48b2-91cb-2a1607561b4a.jpg', '3200万立体美颜AI超广角三摄珍珠屏6GB+128GB珍珠白全网通版双4G手机', '华为 HUAWEI nova 4e', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 46, 10767, 21534, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10768, b'0', NULL, '/images/shops/5ea16713-f6ae-4fa7-a53d-1700c29cb3d3.jpg', '4GB+64GB 极光紫 全网通 四摄超清全面屏大电池 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享9 Plus', 959.20, 1199.00, b'1', 1000, '杰普官方直营', 46, 10768, 21536, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10769, b'0', NULL, '/images/shops/39e4b0c8-c4c5-4162-8a32-3bb9bb483503.jpg', '4GB+64GB 幻夜黑 全网通 四摄超清全面屏大电池 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享9 Plus', 959.20, 1199.00, b'1', 1000, '杰普官方直营', 46, 10769, 21538, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10770, b'0', NULL, '/images/shops/ca2bb115-c75e-475b-93ab-c2436f31aa16.jpg', '4GB+64GB 宝石蓝 全网通 四摄超清全面屏大电池 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享9 Plus', 959.20, 1199.00, b'1', 1000, '杰普官方直营', 46, 10770, 21540, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10771, b'0', NULL, '/images/shops/65e953c4-1d29-423a-b7d7-4276c4d42aaa.jpg', '4GB+64GB 樱语粉 全网通 四摄超清全面屏大电池 移动联通电信4G手机 双卡双待', '华为 HUAWEI 畅享9 Plus', 959.20, 1199.00, b'1', 1000, '杰普官方直营', 46, 10771, 21542, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10772, b'0', NULL, '/images/shops/2252c604-ced3-4e92-b58b-15402ae7be2c.jpg', '全面屏高清四摄游戏手机4GB+128GB 亮黑色 移动4G+ 移动联通电信4G手机双卡双待', '华为 HUAWEI nova 3i', 1039.20, 1299.00, b'1', 1000, '杰普官方直营', 46, 10772, 21544, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10773, b'0', NULL, '/images/shops/a17dc2b3-17dc-4be7-a04d-12a3fa62de31.jpg', '全面屏高清四摄游戏手机4GB+128GB 蓝楹紫 移动4G+ 移动联通电信4G手机双卡双待', '华为 HUAWEI nova 3i', 1039.20, 1299.00, b'1', 1000, '杰普官方直营', 46, 10773, 21546, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10774, b'0', NULL, '/images/shops/e3f32e21-1208-481d-bfcd-8447de78043b.jpg', 'Pro 前置3200万人像超级夜景4800万AI四摄极点全面屏6GB+128GB翡冷翠全网通双4G手机', '华为 HUAWEI nova 5i', 1719.20, 2149.00, b'1', 1000, '杰普官方直营', 46, 10774, 21548, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10775, b'0', NULL, '/images/shops/1eb1e40c-7f38-47ed-a839-d43c1d0b79a8.jpg', 'Pro 前置3200万人像超级夜景4800万AI四摄极点全面屏6GB+128GB幻夜黑全网通双4G手机', '华为 HUAWEI nova 5i', 1719.20, 2149.00, b'1', 1000, '杰普官方直营', 46, 10775, 21550, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10776, b'0', NULL, '/images/shops/80f05e0d-0d06-4aa8-bca5-0d39a2365b4b.jpg', 'Pro 前置3200万人像超级夜景4800万AI四摄极点全面屏6GB+128GB极光色全网通双4G手机', '华为 HUAWEI nova 5i', 1719.20, 2149.00, b'1', 1000, '杰普官方直营', 46, 10776, 21552, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10777, b'0', NULL, '/images/shops/9024ab8a-be67-4459-8414-8d84225851a7.jpg', '麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB亮黑色全网通版双4G手机', '华为 HUAWEI Mate 20', 2959.20, 3699.00, b'1', 1000, '杰普官方直营', 46, 10777, 21554, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10778, b'0', NULL, '/images/shops/940a6c56-9f7b-4008-8679-c7ef5a44d695.jpg', '麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB极光色全网通版双4G手机', '华为 HUAWEI Mate 20', 2959.20, 3699.00, b'1', 1000, '杰普官方直营', 46, 10778, 21556, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10779, b'0', NULL, '/images/shops/08f9a912-f049-4cf8-a839-115fc6582398.jpg', '麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+64GB翡冷翠全网通版双4G手机', '华为 HUAWEI Mate 20', 2559.20, 3199.00, b'1', 994, '杰普官方直营', 46, 10779, 21558, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10780, b'0', NULL, '/images/shops/5d57e0ba-1bc7-45a7-9677-f501e0384442.jpg', '麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄6GB+128GB宝石蓝全网通版双4G手机', '华为 HUAWEI Mate 20', 2959.20, 3699.00, b'1', 1000, '杰普官方直营', 46, 10780, 21560, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10781, b'0', NULL, '/images/shops/bde7fc16-fb6b-42b0-8950-13ff287c3cd3.jpg', '超广角AI三摄 高清珍珠屏 大存储 6GB+128GB 极光蓝 全网通双4G手机', '华为 HUAWEI 麦芒 8', 1359.20, 1699.00, b'1', 1000, '杰普官方直营', 46, 10781, 21562, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10782, b'0', NULL, '/images/shops/e299773e-14e4-4168-adab-514f6c6d35ed.jpg', '超广角AI三摄 高清珍珠屏 大存储 6GB+128GB 幻夜黑 全网通双4G手机', '华为 HUAWEI 麦芒 8', 1359.20, 1699.00, b'1', 1000, '杰普官方直营', 46, 10782, 21564, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10783, b'0', NULL, '/images/shops/2a3fb7d2-cb76-47b2-88c6-db0f869b5718.jpg', '超广角AI三摄 高清珍珠屏 大存储 6GB+128GB 宝石蓝 全网通双4G手机', '华为 HUAWEI 麦芒 8', 1359.20, 1699.00, b'1', 1000, '杰普官方直营', 46, 10783, 21566, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10784, b'0', NULL, '/images/shops/c0763005-4e67-4861-98f2-e6a550ec4d87.jpg', '6GB+64GB 魅海蓝 移动联通电信4G全面屏手机 双卡双待', '荣耀8X Max 骁龙660 7.12英寸90%屏占比珍珠屏', 959.20, 1199.00, b'1', 1000, '杰普官方直营', 45, 10784, 21568, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10785, b'0', NULL, '/images/shops/aea7760b-d950-4f64-8db9-ef055f15d234.jpg', '6GB+64GB 幻夜黑 移动联通电信4G全面屏手机 双卡双待', '荣耀8X Max 骁龙660 7.12英寸90%屏占比珍珠屏', 959.20, 1199.00, b'1', 1000, '杰普官方直营', 45, 10785, 21570, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10786, b'0', NULL, '/images/shops/f5e2d2e7-541a-44fa-ad5c-4f15f48ebfc9.jpg', '6GB+64GB 魅焰红 移动联通电信4G全面屏手机 双卡双待', '荣耀8X Max 骁龙660 7.12英寸90%屏占比珍珠屏', 959.20, 1199.00, b'1', 1000, '杰普官方直营', 45, 10786, 21572, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10787, b'0', NULL, '/images/shops/b67a4ac6-7766-4995-8110-1bd442ec0797.jpg', '4GB+64GB 亮黑色 移动4G+手机 双卡双待', '华为 HUAWEI Mate 10', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 46, 10787, 21574, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10788, b'0', NULL, '/images/shops/bd8b2d93-c251-46b8-9990-77baaf3075f3.jpg', '极光蓝 高清珍珠屏 AI长续航 全网通标配版 移动联通电信4G手机', '华为 HUAWEI 畅享9 3GB+32GB', 639.20, 799.00, b'1', 1000, '杰普官方直营', 46, 10788, 21576, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10789, b'0', NULL, '/images/shops/71ae1ce8-38e8-4da3-8fa1-5e8157a12685.jpg', '幻夜黑 高清珍珠屏 AI长续航 全网通标配版 移动联通电信4G手机', '华为 HUAWEI 畅享9 3GB+32GB', 639.20, 799.00, b'1', 1000, '杰普官方直营', 46, 10789, 21578, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10790, b'0', NULL, '/images/shops/371386b8-ddf4-4fc1-985e-ef0e1a076710.jpg', '极光紫 高清珍珠屏 AI长续航 全网通高配版 移动联通电信4G手机', '华为 HUAWEI 畅享9 4GB+64GB', 879.20, 1099.00, b'1', 1000, '杰普官方直营', 46, 10790, 21580, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10791, b'0', NULL, '/images/shops/60392ae1-d076-47b5-a00d-b2278e01ccb5.jpg', '珊瑚红 高清珍珠屏 AI长续航 全网通高配版 移动联通电信4G手机', '华为 HUAWEI 畅享9 4GB+64GB', 879.20, 1099.00, b'1', 1000, '杰普官方直营', 46, 10791, 21582, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10792, b'0', NULL, '/images/shops/0a592388-1535-4f9f-8201-ecb78c48bb3d.jpg', '幻夜黑 移动联通电信4G全面屏手机 双卡双待', '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB', 519.20, 649.00, b'1', 1000, '杰普官方直营', 45, 10792, 21584, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10793, b'0', NULL, '/images/shops/fd218943-8f6f-4fb8-91a4-d6216cc5afdc.jpg', '极光蓝 移动联通电信4G全面屏手机 双卡双待', '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB', 519.20, 649.00, b'1', 1000, '杰普官方直营', 45, 10793, 21586, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10794, b'0', NULL, '/images/shops/54641753-d8e7-45da-8c6c-81192552cf15.jpg', '魅焰红 移动联通电信4G全面屏手机 双卡双待', '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB', 519.20, 649.00, b'1', 1000, '杰普官方直营', 45, 10794, 21588, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10795, b'0', NULL, '/images/shops/7b65ad3d-74a4-4322-8653-6bda47a8b4eb.jpg', '铂光金 移动联通电信4G全面屏手机 双卡双待', '荣耀畅玩8A 6.09英寸珍珠全面屏 震撼大音量 3GB+32GB', 519.20, 649.00, b'1', 1000, '杰普官方直营', 45, 10795, 21590, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10796, b'0', NULL, '/images/shops/2a05cc6a-3eea-42f9-ab97-2e2529a72099.jpg', 'AMOLED弹出式全面屏 8GB+256GB 碳纤黑 游戏智能手机 小米 红米', 'Redmi K20Pro 骁龙855 索尼4800万超广角三摄', 2159.20, 2699.00, b'1', 1000, '杰普官方直营', 52, 10796, 21592, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10797, b'0', NULL, '/images/shops/d5fc8bec-0add-48d3-b73b-349a0375e8dc.jpg', '杰普精选', '小米9 Pro 5G 全面屏游戏拍照新品手机', 7999.20, 9999.00, b'1', 1000, '杰普官方直营', 51, 10797, 21594, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10798, b'0', NULL, '/images/shops/e4e4c543-6d9a-4b19-bedf-3f40024cb710.jpg', '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 梦幻蓝 游戏智能手机 小米 红米', '【新品抢购】Redmi Note8 4800万全场景四摄 4000mAh长续航', 799.20, 999.00, b'1', 1000, '杰普官方直营', 52, 10798, 21596, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10799, b'0', NULL, '/images/shops/87e0f6ab-45ef-4710-a5f4-e57a470b6b26.jpg', '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 皓月白 游戏智能手机 小米 红米', '【新品抢购】Redmi Note8 4800万全场景四摄 4000mAh长续航', 799.20, 999.00, b'1', 1000, '杰普官方直营', 52, 10799, 21598, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10800, b'0', NULL, '/images/shops/4a5c5b20-2dd3-4343-a6d1-31195c9edea4.jpg', '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 曜石黑 游戏智能手机 小米 红米', '【新品抢购】Redmi Note8 4800万全场景四摄 4000mAh长续航', 799.20, 999.00, b'1', 1000, '杰普官方直营', 52, 10800, 21600, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10801, b'0', NULL, '/images/shops/30ef1f51-f958-486f-8d79-f48f6d8293dd.jpg', '18个月超长质保 4000mAh超长续航 6GB+64GB 镜花水月 游戏智能手机 小米 红米', 'Redmi Note7 4800万双摄千元机 满血骁龙660', 879.20, 1099.00, b'1', 1000, '杰普官方直营', 52, 10801, 21602, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10802, b'0', NULL, '/images/shops/92beacb0-f692-42ff-a20f-8fecd2b0c046.jpg', '18个月超长质保 4000mAh超长续航 6GB+64GB 亮黑色 游戏智能手机 小米 红米', 'Redmi Note7 4800万双摄千元机 满血骁龙660', 879.20, 1099.00, b'1', 1000, '杰普官方直营', 52, 10802, 21604, '<p>*相机默认1200w，如何设置4800w？ 打开相机&nbsp;—&nbsp;右滑切换到“专业”模式&nbsp;—&nbsp;点击屏幕左上方的“48MP”，打开4800万超清。&nbsp;</p><p>*如何设置全面屏模式？ 点击设置&nbsp;—&nbsp;点击全面屏&nbsp;—&nbsp;进入全面屏设置会出现两个选项，可以选择经典导航也可以选择全面屏手势。选择全面屏手势，可进行手势学习，使用全面屏模式进行操作&nbsp;</p><p>*是否支持OTG功能？ 支持。&nbsp;</p><p>*红米Note7出厂预装版本是Andriod&nbsp;9.0吗？ 该商品首批出厂操作系统：MIUI&nbsp;10&nbsp;(Andriod&nbsp;9.0)。&nbsp;</p><p>*有呼吸灯吗？是否支持NFC？&nbsp;是否支持收音机？ 有呼吸灯，不支持NFC，支持收音机。</p><p>*4800万模式是否支持AI场景识别，能否有快速切换方式介绍？ 4800万模式下不支持AI场景识别，普通相机模式下可支持AI识别。</p><p><span style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 1rem;\">*是否支持王者荣耀Vulkan&nbsp;模式？ 目前暂不支持王者荣耀Vulkan模式。 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Redmi&nbsp;红米Note&nbsp;7&nbsp;常见问题</span></p>', NULL);
INSERT INTO `t_shop` VALUES (10803, b'0', NULL, '/images/shops/0cf95c37-2665-4894-bd42-5f8de06c6d94.jpg', '18个月超长质保 4000mAh超长续航 6GB+64GB 暮光金 游戏智能手机 小米 红米', 'Redmi Note7 4800万双摄千元机 满血骁龙660', 879.20, 1099.00, b'1', 1000, '杰普官方直营', 52, 10803, 21606, '<p>*相机默认1200w，如何设置4800w？ 打开相机&nbsp;—&nbsp;右滑切换到“专业”模式&nbsp;—&nbsp;点击屏幕左上方的“48MP”，打开4800万超清。&nbsp;</p><p>*如何设置全面屏模式？ 点击设置&nbsp;—&nbsp;点击全面屏&nbsp;—&nbsp;进入全面屏设置会出现两个选项，可以选择经典导航也可以选择全面屏手势。选择全面屏手势，可进行手势学习，使用全面屏模式进行操作&nbsp;</p><p>*是否支持OTG功能？ 支持。&nbsp;</p><p>*红米Note7出厂预装版本是Andriod&nbsp;9.0吗？ 该商品首批出厂操作系统：MIUI&nbsp;10&nbsp;(Andriod&nbsp;9.0)。&nbsp;</p><p>*有呼吸灯吗？是否支持NFC？&nbsp;是否支持收音机？ 有呼吸灯，不支持NFC，支持收音机。</p><p>*4800万模式是否支持AI场景识别，能否有快速切换方式介绍？ 4800万模式下不支持AI场景识别，普通相机模式下可支持AI识别。</p><p><span style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 1rem;\">*是否支持王者荣耀Vulkan&nbsp;模式？ 目前暂不支持王者荣耀Vulkan模式。 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Redmi&nbsp;红米Note&nbsp;7&nbsp;常见问题</span></p>', NULL);
INSERT INTO `t_shop` VALUES (10804, b'0', NULL, '/images/shops/f6c46245-b957-41ed-b235-133c17cba7f9.jpg', '4000mAh超长续航 6GB+64GB 梦幻蓝 游戏智能手机 小米 红米', 'Redmi Note7 4800万双摄千元机 满血骁龙660', 879.20, 1099.00, b'1', 1000, '杰普官方直营', 52, 10804, 21608, '<p>*相机默认1200w，如何设置4800w？ 打开相机&nbsp;—&nbsp;右滑切换到“专业”模式&nbsp;—&nbsp;点击屏幕左上方的“48MP”，打开4800万超清。&nbsp;</p><p>*如何设置全面屏模式？ 点击设置&nbsp;—&nbsp;点击全面屏&nbsp;—&nbsp;进入全面屏设置会出现两个选项，可以选择经典导航也可以选择全面屏手势。选择全面屏手势，可进行手势学习，使用全面屏模式进行操作&nbsp;</p><p>*是否支持OTG功能？ 支持。&nbsp;</p><p>*红米Note7出厂预装版本是Andriod&nbsp;9.0吗？ 该商品首批出厂操作系统：MIUI&nbsp;10&nbsp;(Andriod&nbsp;9.0)。&nbsp;</p><p>*有呼吸灯吗？是否支持NFC？&nbsp;是否支持收音机？ 有呼吸灯，不支持NFC，支持收音机。</p><p>*4800万模式是否支持AI场景识别，能否有快速切换方式介绍？ 4800万模式下不支持AI场景识别，普通相机模式下可支持AI识别。</p><p><span style=\"font-family: &quot;Source Sans Pro&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 1rem;\">*是否支持王者荣耀Vulkan&nbsp;模式？ 目前暂不支持王者荣耀Vulkan模式。 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Redmi&nbsp;红米Note&nbsp;7&nbsp;常见问题</span></p>', NULL);
INSERT INTO `t_shop` VALUES (10805, b'0', NULL, '/images/shops/54985ce7-1df6-442f-9a28-0ff0bab924bd.jpg', '4500mAh长续航 NFC 18W快充 红外遥控 6GB+64GB 贝母白 游戏智能手机 小米 红米', '【新品抢购】Redmi Note8Pro 6400万全场景四摄 液冷游戏芯', 1119.20, 1399.00, b'1', 1000, '杰普官方直营', 52, 10805, 21610, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10806, b'0', NULL, '/images/shops/e3de1717-e373-4544-9f1e-057a91fd2595.jpg', '4500mAh长续航 NFC 18W快充 红外遥控 6GB+128GB 冰翡翠 游戏智能手机 小米 红米', '【新品抢购】Redmi Note8Pro 6400万全场景四摄 液冷游戏芯', 1279.20, 1599.00, b'1', 1000, '杰普官方直营', 52, 10806, 21612, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10807, b'0', NULL, '/images/shops/a1552f03-58ab-4b05-91ec-7df52af18a66.jpg', '4500mAh长续航 NFC 18W快充 红外遥控 6GB+64GB 电光灰 游戏智能手机 小米 红米', '【新品抢购】Redmi Note8Pro 6400万全场景四摄 液冷游戏芯', 1119.20, 1399.00, b'1', 1000, '杰普官方直营', 52, 10807, 21614, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10808, b'0', NULL, '/images/shops/647470fa-85b1-4626-99d0-d5b7512c8f23.jpg', '18个月超长质保 4000mAh超长续航 6GB+128GB 亮黑色 游戏智能手机 小米 红米', 'Redmi Note7Pro 索尼4800万超清双摄 骁龙675', 1119.20, 1399.00, b'1', 1000, '杰普官方直营', 52, 10808, 21616, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10809, b'0', NULL, '/images/shops/edb8a694-84a5-47da-9bae-30f7a69d2c63.jpg', '18个月超长质保 4000mAh超长续航 6GB+128GB 镜花水月 游戏智能手机 小米 红米', 'Redmi Note7pro 索尼4800万超清双摄 骁龙675', 1119.20, 1399.00, b'1', 1000, '杰普官方直营', 52, 10809, 21618, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10810, b'0', NULL, '/images/shops/c76edfa6-c16e-45b9-9119-46d300739112.jpg', '18个月超长质保 4000mAh超长续航 6GB+128GB 梦幻蓝 游戏智能手机 小米 红米', 'Redmi Note7Pro 索尼4800万超清双摄 骁龙675', 1119.20, 1399.00, b'1', 1000, '杰普官方直营', 52, 10810, 21620, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10811, b'0', NULL, '/images/shops/bf0c2d17-3630-4709-af38-d7bd14a76f22.jpg', '18个月超长质保 4000mAh超长续航 6GB+128GB 暮光金 游戏智能手机 小米 红米', 'Redmi Note7Pro 索尼4800万超清双摄 骁龙675', 1119.20, 1399.00, b'1', 1000, '杰普官方直营', 52, 10811, 21622, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10812, b'0', NULL, '/images/shops/28c56015-cb20-44cb-86fb-246ad509e828.jpg', '骁龙8核 标配10W充电器 整机防泼溅 3GB+32GB 磨砂黑 游戏智能手机 小米 红米', 'Redmi 7A 4000mAh超长续航 AI人脸解锁', 479.20, 599.00, b'1', 1000, '杰普官方直营', 52, 10812, 21624, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10813, b'0', NULL, '/images/shops/d845c984-f749-4f22-86a5-558677b1322c.jpg', '骁龙8核 标配10W充电器 整机防泼溅 3GB+32GB 晨曦蓝 游戏智能手机 小米 红米', 'Redmi 7A 4000mAh超长续航 AI人脸解锁', 479.20, 599.00, b'1', 1000, '杰普官方直营', 52, 10813, 21626, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10814, b'0', NULL, '/images/shops/56ac4c58-8742-40c8-b130-83b4d2925a8c.jpg', '骁龙8核 标配10W充电器 整机防泼溅 3GB+32GB 雾光金 游戏智能手机 小米 红米', 'Redmi 7A 4000mAh超长续航 AI人脸解锁', 479.20, 599.00, b'1', 1000, '杰普官方直营', 52, 10814, 21628, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10815, b'0', NULL, '/images/shops/0647d1b4-d19a-4424-b6ac-68344addacb4.jpg', '1200万AI双摄 18个月超长质保 AI人脸解锁 3GB+32GB 亮黑色 游戏智能手机 小米 红米', 'Redmi 7 4000mAh超长续航 骁龙632', 559.20, 699.00, b'1', 1000, '杰普官方直营', 52, 10815, 21630, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10816, b'0', NULL, '/images/shops/711c54f0-f9d0-472e-b61b-94e25c628599.jpg', '1200万AI双摄 18个月超长质保 AI人脸解锁 3GB+32GB 魅夜红 游戏智能手机 小米 红米', 'Redmi 7 4000mAh超长续航 骁龙632', 559.20, 699.00, b'1', 1000, '杰普官方直营', 52, 10816, 21632, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10817, b'0', NULL, '/images/shops/c8c97b68-3ba6-4f97-8940-d04c9e7c7302.jpg', '1200万AI双摄 18个月超长质保 AI人脸解锁 3GB+32GB 梦幻蓝 游戏智能手机 小米 红米', 'Redmi 7 4000mAh超长续航 骁龙632', 559.20, 699.00, b'1', 1000, '杰普官方直营', 52, 10817, 21634, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10818, b'0', NULL, '/images/shops/d423bb5c-60c8-4b66-bd72-3490b5d6461b.jpg', '白色 多功能 NFC 6GB+128GB 游戏智能拍照手机', '小米MIX2S 骁龙845 AI感光双摄 四曲面陶瓷全面屏', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 51, 10818, 21636, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10819, b'0', NULL, '/images/shops/9a554cae-5bec-4964-992f-e2f4de192e2c.jpg', '黑色 多功能 NFC 6GB+128GB 游戏智能拍照手机', '小米MIX2S 骁龙845 AI感光双摄 四曲面陶瓷全面屏', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 51, 10819, 21638, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10820, b'0', NULL, '/images/shops/55a6dc67-1ed9-421a-9782-acdfa9c123e1.jpg', '全网通4G 双卡双待 水滴全面屏拍照智能游戏手机', '小米9 4800万超广角三摄 6GB+128GB全息幻彩蓝 骁龙855', 2079.20, 2599.00, b'1', 1000, '杰普官方直营', 51, 10820, 21640, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10821, b'0', NULL, '/images/shops/54249648-d37b-4b22-80dc-243e58ed56a1.jpg', '骁龙855 全网通4G 双卡双待 水滴全面屏拍照智能游戏手机', '小米9 4800万超广角三摄 8GB+256GB 透明版', 2959.20, 3699.00, b'1', 1000, '杰普官方直营', 51, 10821, 21642, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10822, b'0', NULL, '/images/shops/e8087861-89fd-43af-b64d-290864b0fe35.jpg', '骁龙855 全网通4G 双卡双待 水滴全面屏拍照智能游戏手机', '小米9 4800万超广角三摄 8GB+128GB 深空灰', 2239.20, 2799.00, b'1', 1000, '杰普官方直营', 51, 10822, 21644, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10823, b'0', NULL, '/images/shops/7a406989-061b-4f69-baa1-6fa499aa091d.jpg', '骁龙855 全网通4G 双卡双待 水滴全面屏拍照智能游戏手机', '小米9 4800万超广角三摄 8GB+128GB 全息幻彩紫', 2239.20, 2799.00, b'1', 1000, '杰普官方直营', 51, 10823, 21646, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10824, b'0', NULL, '/images/shops/8fc9776e-9393-421d-998c-e516b3877dba.jpg', '屏幕指纹 白色恋人 6GB+64GB 游戏智能拍照手机', '小米CC9e 索尼4800万旗舰相机 3200万美颜自拍 4030mAh', 1039.20, 1299.00, b'1', 1000, '杰普官方直营', 51, 10824, 21648, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10825, b'0', NULL, '/images/shops/033685d7-bf11-4389-9e52-ef5a51182306.jpg', '屏幕指纹 暗夜王子 6GB+64GB 游戏智能拍照手机', '小米CC9e 索尼4800万旗舰相机 3200万美颜自拍 4030mAh', 1039.20, 1299.00, b'1', 1000, '杰普官方直营', 51, 10825, 21650, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10826, b'0', NULL, '/images/shops/e8dba692-7fda-4f42-b0ee-6f51ca7dc77d.jpg', '屏幕指纹 深蓝星球 6GB+64GB 游戏智能拍照手机', '小米CC9e 索尼4800万旗舰相机 3200万美颜自拍 4030mAh', 1039.20, 1299.00, b'1', 1000, '杰普官方直营', 51, 10826, 21652, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10827, b'0', NULL, '/images/shops/387afca1-a14a-4ab8-9d99-120b7095029c.jpg', '4030mAh 深蓝星球 6GB+64GB 游戏智能拍照手机', '小米CC9 3200万美颜自拍 索尼4800万超清三摄 多功能NFC', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 51, 10827, 21654, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10828, b'0', NULL, '/images/shops/f96f376e-8341-4bad-ad2a-b3f12486958a.jpg', '4030mAh 白色恋人 6GB+64GB 游戏智能拍照手机', '小米CC9 3200万美颜自拍 索尼4800万超清三摄 多功能NFC', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 51, 10828, 21656, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10829, b'0', NULL, '/images/shops/4c148e8e-7e26-4c74-a3d3-f5f37ae9248d.jpg', '4030mAh 暗夜王子 6GB+128GB 游戏智能拍照手机', '小米CC9 3200万美颜自拍 索尼4800万超清三摄 多功能NFC', 1599.20, 1999.00, b'1', 1000, '杰普官方直营', 51, 10829, 21658, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10830, b'0', NULL, '/images/shops/92482741-3637-4cd3-91ff-cc5aeb0d3316.jpg', '多功能NFC 8GB+256GB 游戏智能拍照手机', '小米CC9美图定制版 索尼4800万AI三摄 3200万美颜自拍 全身美型', 2079.20, 2599.00, b'1', 1000, '杰普官方直营', 51, 10830, 21660, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10831, b'0', NULL, '/images/shops/f0b19f6c-6a8b-4128-8e5d-2e4953331c46.jpg', '移动4G+ 双卡双待 小水滴全面屏拍照游戏智能手机', '小米Play 流光渐变AI双摄 6GB+128GB 梦幻蓝', 799.20, 999.00, b'1', 1000, '杰普官方直营', 51, 10831, 21662, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10832, b'0', NULL, '/images/shops/e39da33d-1b55-4e97-b8e6-824ac2cd1062.jpg', '移动4G+ 双卡双待 小水滴全面屏拍照游戏智能手机', '小米Play 流光渐变AI双摄 6GB+128GB 黑色', 799.20, 999.00, b'1', 1000, '杰普官方直营', 51, 10832, 21664, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10833, b'0', NULL, '/images/shops/2a93185a-8d3b-4908-af8c-c17db78e2fb0.jpg', '全网通4G 双卡双待 小水滴全面屏拍照游戏智能手机', '小米Play 流光渐变AI双摄 6GB+64GB 暮光金', 719.20, 899.00, b'1', 1000, '杰普官方直营', 51, 10833, 21666, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10834, b'0', NULL, '/images/shops/b28f3eac-0091-442f-90f3-68914bf947c7.jpg', '全息幻彩蓝 8GB+128GB 游戏智能拍照手机', '小米9SE 骁龙712 索尼4800万超广角三摄 5.97英寸舒适握感', 1519.20, 1899.00, b'1', 1000, '杰普官方直营', 51, 10834, 21668, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10835, b'0', NULL, '/images/shops/ef8370c4-ed8e-497f-9e10-185de4d01fe9.jpg', '水滴全面屏 游戏智能拍照手机 6GB+64GB 深空灰 全网通4G 双卡双待', '小米9 SE 4800万超广角三摄 骁龙712', 1279.20, 1599.00, b'1', 1000, '杰普官方直营', 51, 10835, 21670, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10836, b'0', NULL, '/images/shops/f436d00b-2253-4dcc-8b4a-d82e99af275a.jpg', '全息幻彩紫 8GB+128GB 游戏智能拍照手机', '小米9SE 骁龙712 索尼4800万超广角三摄 5.97英寸舒适握感', 1599.20, 1999.00, b'1', 1000, '杰普官方直营', 51, 10836, 21672, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10837, b'0', NULL, '/images/shops/3bfc7c72-b56a-4088-8acf-e01e830ce72a.jpg', '磁动力滑盖全面屏 三星 AMOLED屏幕 黑色 8GB+128GB 游戏智能拍照手机', '小米MIX3 骁龙845AIE AI 双摄', 2079.20, 2599.00, b'1', 1000, '杰普官方直营', 51, 10837, 21674, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10838, b'0', NULL, '/images/shops/ed860c53-955b-4cfd-b605-a8b4bb959e2f.jpg', '第七代屏下指纹 6GB+128GB 冰川蓝 游戏智能手机 小米 红米', 'Redmi K20 索尼4800万超广角三摄 AMOLED弹出式全面屏', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 52, 10838, 21676, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10839, b'0', NULL, '/images/shops/8e64ea39-5477-482c-a200-2c12fdeff004.jpg', '第七代屏下指纹 6GB+128GB 火焰红 游戏智能手机 小米 红米', 'Redmi K20 索尼4800万超广角三摄 AMOLED弹出式全面屏', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 52, 10839, 21678, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10840, b'0', NULL, '/images/shops/38a69084-0bc4-479e-a5ba-aed135dee974.jpg', '第七代屏下指纹 6GB+128GB 碳纤黑 游戏智能手机 小米 红米', 'Redmi K20 索尼4800万超广角三摄 AMOLED弹出式全面屏', 1439.20, 1799.00, b'1', 1000, '杰普官方直营', 52, 10840, 21680, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10841, b'0', NULL, '/images/shops/6c77e8f9-11d8-42c3-925e-4396d0d3709f.jpg', '3GB+32GB 流沙金 游戏智能手机 小米', '红米6A 1300万高清相机 AI人脸解锁 12nm高性能处理器', 479.20, 599.00, b'1', 1000, '杰普官方直营', 52, 10841, 21682, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10842, b'0', NULL, '/images/shops/17b2eb9f-7289-45f8-b26a-114ec29ceb3c.jpg', '3GB+32GB 铂银灰 游戏智能手机 小米', '红米6A 1300万高清相机 AI人脸解锁 12nm高性能处理器', 479.20, 599.00, b'1', 1000, '杰普官方直营', 52, 10842, 21684, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10843, b'0', NULL, '/images/shops/1ba819c2-dc89-41d9-86a9-4649418972da.jpg', '樱花粉 16GB 移动联通电信4G手机 双卡双待', '小米 红米6A 全网通版 2GB内存', 439.20, 549.00, b'1', 1000, '杰普官方直营', 52, 10843, 21686, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10844, b'0', NULL, '/images/shops/1ef84d7e-d804-4064-9140-a53607aa8df2.jpg', '3GB+32GB 巴厘蓝 游戏智能手机 小米', '红米6A 1300万高清相机 AI人脸解锁 12nm高性能处理器', 479.20, 599.00, b'1', 1000, '杰普官方直营', 52, 10844, 21688, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10845, b'0', NULL, '/images/shops/b6c3eea7-9d34-4ac0-ba66-2fde6f26253b.jpg', '骁龙八核处理器 蓝色 6GB+128GB 游戏智能拍照手机', '小米Max3 5500mAh充电宝级电量 AI双摄 全金属机身', 1199.20, 1499.00, b'1', 1000, '杰普官方直营', 51, 10845, 21690, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10846, b'0', NULL, '/images/shops/30574476-f5bc-4f3c-80f6-4da22ea48f48.jpg', '骁龙八核处理器 黑色 6GB+128GB 游戏智能拍照手机', '小米Max3 5500mAh充电宝级电量 AI双摄 全金属机身', 1199.20, 1499.00, b'1', 1000, '杰普官方直营', 51, 10846, 21692, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10847, b'0', NULL, '/images/shops/114e92f8-bf78-481e-8d8a-9936d026d9d4.jpg', '骁龙八核处理器 金色 6GB+128GB 游戏智能拍照手机', '小米Max3 5500mAh充电宝级电量 AI双摄 全金属机身', 1199.20, 1499.00, b'1', 1000, '杰普官方直营', 51, 10847, 21694, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10848, b'0', NULL, '/images/shops/8d3ebf2d-8da7-478c-bd6c-e7a869fdde97.jpg', '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 梦幻蓝 游戏智能手机 小米 红米', 'Redmi Note8 4800万全场景四摄 4000mAh长续航', 799.20, 999.00, b'1', 1000, '杰普官方直营', 52, 10848, 21696, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10849, b'0', NULL, '/images/shops/b4ff98bc-ad00-48f7-ac64-0d52780d4c48.jpg', '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 皓月白 游戏智能手机 小米 红米', 'Redmi Note8 4800万全场景四摄 4000mAh长续航', 799.20, 999.00, b'1', 1000, '杰普官方直营', 52, 10849, 21698, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10850, b'0', NULL, '/images/shops/b82cc8fd-075b-44d3-b211-8ea633fe2ffe.jpg', '高通骁龙665 18W快充 小金刚品质保证 4GB+64GB 曜石黑 游戏智能手机 小米 红米', 'Redmi Note8 4800万全场景四摄 4000mAh长续航', 799.20, 999.00, b'1', 1000, '杰普官方直营', 52, 10850, 21700, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10851, b'0', NULL, '/images/shops/52425573-6311-4877-bad8-1c04bf01e9d3.jpg', '全网通 6G+128G', '小米（MI） 小米8青春版 手机 深空灰', 934.40, 1168.00, b'1', 1000, '杰普官方直营', 51, 10851, 21702, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10852, b'0', NULL, '/images/shops/8c1c9fb2-26aa-4fa0-b9ce-cf278d827fa6.jpg', '全网通 4G+128G', '小米（MI） 小米8青春版 手机 梦幻蓝', 1279.20, 1599.00, b'1', 1000, '杰普官方直营', 51, 10852, 21704, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10853, b'0', NULL, '/images/shops/bd94d7e0-f56f-4b7f-8653-b8a4e267bd15.jpg', '全网通 6G+64G', '小米（MI） 小米8青春版 手机 暮光金', 854.40, 1068.00, b'1', 1000, '杰普官方直营', 51, 10853, 21706, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10854, b'0', NULL, '/images/shops/42913aa4-4a49-4121-9c80-3434c12d0ac9.jpg', '液冷游戏芯】 冰翡翠 全网通6+128', '小米 红米Note8 pro 手机【6400万四摄', 1279.20, 1599.00, b'1', 1000, '杰普官方直营', 52, 10854, 21708, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10855, b'0', NULL, '/images/shops/777ebd38-965d-4c77-970e-f1e25022255f.jpg', '液冷游戏芯】 贝母白 全网通6+128', '小米 红米Note8 pro 手机【6400万四摄', 1279.20, 1599.00, b'1', 1000, '杰普官方直营', 52, 10855, 21710, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10856, b'0', NULL, '/images/shops/db21f41b-34ac-4bc7-a50f-1f812b1522d1.jpg', '液冷游戏芯】 电光灰 全网通6+128', '小米 红米Note8 pro 手机【6400万四摄', 1279.20, 1599.00, b'1', 1000, '杰普官方直营', 52, 10856, 21712, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10857, b'0', NULL, '/images/shops/63588dfb-f85f-41a2-8198-c7ae66aa0261.png', '6GB+64GB', '小米（MI） 小米8 游戏手机 黑', 1254.40, 1568.00, b'1', 1000, '杰普官方直营', 51, 10857, 21714, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10858, b'0', NULL, '/images/shops/d55d6e4a-99e7-4a3d-86a4-9b3899a63b42.png', '6GB+64GB', '小米（MI） 小米8 游戏手机 白', 1254.40, 1568.00, b'1', 1000, '杰普官方直营', 51, 10858, 21716, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10859, b'0', NULL, '/images/shops/5a2a90aa-fe2c-4bb0-8d8d-1ac1613f453a.png', '8GB+128GB', '小米（MI） 小米8 游戏手机 蓝', 1494.40, 1868.00, b'1', 1000, '杰普官方直营', 51, 10859, 21718, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10860, b'0', NULL, '/images/shops/c1cdb555-f605-4226-906a-022483612319.png', '6GB+128GB', '小米（MI） 小米8 游戏手机 金', 1470.40, 1838.00, b'1', 1000, '杰普官方直营', 51, 10860, 21720, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10861, b'0', NULL, '/images/shops/fafda3af-7741-47f2-936e-c0d9030fbf5b.png', '全网通(6G+128G)', '小米（MI） 小米8青春版 手机 深空灰', 950.40, 1188.00, b'1', 1000, '杰普官方直营', 51, 10861, 21722, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10862, b'0', NULL, '/images/shops/ef5ac8cb-5d4e-4dc6-bece-27c9ff5a2e1c.png', '全网通(6G+64G)', '小米（MI） 小米8青春版 手机 梦幻蓝', 1110.40, 1388.00, b'1', 1000, '杰普官方直营', 51, 10862, 21724, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10863, b'0', NULL, '/images/shops/d8b30b9f-faa4-4a0d-84bc-53b9c4745977.png', '全网通(6G+128G)', '小米（MI） 小米8青春版 手机 暮光金', 1262.40, 1578.00, b'1', 1000, '杰普官方直营', 51, 10863, 21726, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10864, b'0', NULL, '/images/shops/18ce5224-c98d-4a9c-a024-5ac5b6f9a2d7.jpg', '双卡双待 幻彩渐变AI双摄 水滴全面屏拍照游戏智能手机 梦幻蓝 4GB+64GB', '小米 红米Redmi 7 全网通4G', 646.40, 808.00, b'1', 1000, '杰普官方直营', 52, 10864, 21728, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10865, b'0', NULL, '/images/shops/f7a9a98d-9e3f-4443-b8a7-5612bcd7c1d0.jpg', '双卡双待 幻彩渐变AI双摄 水滴全面屏拍照游戏智能手机 亮黑色 4GB+64GB', '小米 红米Redmi 7 全网通4G', 654.40, 818.00, b'1', 1000, '杰普官方直营', 52, 10865, 21730, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10866, b'0', NULL, '/images/shops/02523f49-742b-4c45-b59b-f550fe5a60ae.jpg', '双卡双待 幻彩渐变AI双摄 水滴全面屏拍照游戏智能手机 魅夜红 4GB+64GB', '小米 红米Redmi 7 全网通4G', 654.40, 818.00, b'1', 1000, '杰普官方直营', 52, 10866, 21732, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10867, b'0', NULL, '/images/shops/35b9c185-2ca6-4052-af40-2abd2157f200.png', '全网通(6G + 128G )', '小米 小米8屏幕指纹版 手机 黑色', 1446.40, 1808.00, b'1', 1000, '杰普官方直营', 51, 10867, 21734, '产品信息Product Information', NULL);
INSERT INTO `t_shop` VALUES (10868, b'0', NULL, '/images/shops/fcd1faf9-10b5-4318-b92b-36105be8752f.png', '全网通(8G + 128G)', '小米 小米8屏幕指纹版 手机 透明版', 1622.40, 2028.00, b'1', 1000, '杰普官方直营', 51, 10868, 21736, '产品信息Product Information', NULL);
INSERT INTO `t_shop` VALUES (10869, b'0', NULL, '/images/shops/e9818435-c510-4042-91e1-734a818a2577.png', '全网通(6G + 128G )', '小米 小米8屏幕指纹版 手机 暮光金', 1679.20, 2099.00, b'1', 1000, '杰普官方直营', 51, 10869, 21738, '产品信息Product Information', NULL);
INSERT INTO `t_shop` VALUES (10870, b'0', NULL, '/images/shops/515706fb-a5f8-4d72-a08e-7523cf4ea113.jpg', '流沙金 32GB 移动联通电信4G手机 双卡双待', '小米 红米6 全网通版 3GB内存', 559.20, 699.00, b'1', 1000, '杰普官方直营', 52, 10870, 21740, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10871, b'0', NULL, '/images/shops/bcec0048-e992-4e57-9aaf-ddbd9fe852ce.jpg', '全网通4G手机 双卡双待 老人机 智能拍照手机', '小米 红米6 3GB+32GB 铂银灰', 559.20, 699.00, b'1', 1000, '杰普官方直营', 52, 10871, 21742, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10872, b'0', NULL, '/images/shops/e1c2b06f-fd06-4242-acb7-9ebd7179181b.png', '6G+128G', '小米（MI） 小米8屏幕指纹版 全面屏游戏手机 曜石黑（屏幕指纹版）', 1454.40, 1818.00, b'1', 1000, '杰普官方直营', 51, 10872, 21744, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10873, b'0', NULL, '/images/shops/314274fc-1ee0-474d-bbb5-b9c70a8a9573.png', '8G+128G', '小米（MI） 小米8屏幕指纹版 全面屏游戏手机 透明版(屏幕指纹版)', 1614.40, 2018.00, b'1', 1000, '杰普官方直营', 51, 10873, 21746, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10874, b'0', NULL, '/images/shops/c2905bd8-bd68-4672-bada-b8a202a9327e.png', '8G+128G', '小米（MI） 小米8屏幕指纹版 全面屏游戏手机 暮光金(屏幕指纹版)', 1646.40, 2058.00, b'1', 1000, '杰普官方直营', 51, 10874, 21748, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10875, b'0', NULL, '/images/shops/5afd1749-a3bc-41c2-90b2-928ede8aedda.jpg', '全网通(6G+64G)', '小米8 游戏手机 全面屏 黑色', 1246.40, 1558.00, b'1', 1000, '杰普官方直营', 51, 10875, 21750, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10876, b'0', NULL, '/images/shops/a96dd5bc-2d74-4d57-9336-45a8ac09a363.jpg', '全网通(6G+64G)', '小米8 游戏手机 全面屏 白色', 1240.00, 1550.00, b'1', 1000, '杰普官方直营', 51, 10876, 21752, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10877, b'0', NULL, '/images/shops/25e44283-a440-4e64-bb27-1887370c3d2e.jpg', '全网通(6G+128G)', '小米8 游戏手机 全面屏 白色', 1438.40, 1798.00, b'1', 1000, '杰普官方直营', 51, 10877, 21754, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10878, b'0', NULL, '/images/shops/6b5e5711-8ae6-4f66-bd22-30c9be85d3c6.jpg', '全网通(6G+128G)', '小米8 游戏手机 全面屏 金色', 1479.20, 1849.00, b'1', 1000, '杰普官方直营', 51, 10878, 21756, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10879, b'0', NULL, '/images/shops/040a3aa6-1699-4eca-ac67-5021cc419979.jpg', '全网通(6G+128G)', '小米8 游戏手机 全面屏 黑色', 1479.20, 1849.00, b'1', 1000, '杰普官方直营', 51, 10879, 21758, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10880, b'0', NULL, '/images/shops/47c28778-88a4-42fd-bb4d-c93fe8df36b5.jpg', '全网通(6G+64G)', '小米8 游戏手机 全面屏 金色', 1278.40, 1598.00, b'1', 1000, '杰普官方直营', 51, 10880, 21760, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10881, b'0', NULL, '/images/shops/no-img.png', '暮光金 全网通(8G+128G)', '小米8 游戏手机 全面屏 屏幕指纹版', 1759.20, 2199.00, b'1', 1000, '杰普官方直营', 51, 10881, 21762, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10882, b'0', NULL, '/images/shops/no-img.png', '全网通(6G+64G)', '小米8 游戏手机 全面屏 蓝色', 1278.40, 1598.00, b'1', 1000, '杰普官方直营', 51, 10882, 21764, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10883, b'0', NULL, '/images/shops/no-img.png', '全网通(6G+256G)', '小米8 游戏手机 全面屏 金色', 1726.40, 2158.00, b'1', 1000, '杰普官方直营', 51, 10883, 21766, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10884, b'0', NULL, '/images/shops/no-img.png', '全网通(6G+256G)', '小米8 游戏手机 全面屏 白色', 1726.40, 2158.00, b'1', 1000, '杰普官方直营', 51, 10884, 21768, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10885, b'0', NULL, '/images/shops/no-img.png', '全网通(6G+256G)', '小米8 游戏手机 全面屏 蓝色', 1726.40, 2158.00, b'1', 1000, '杰普官方直营', 51, 10885, 21770, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10886, b'0', NULL, '/images/shops/no-img.png', '全网通(6G+256G)', '小米8 游戏手机 全面屏 黑色', 2559.20, 3199.00, b'1', 1000, '杰普官方直营', 51, 10886, 21772, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10887, b'0', NULL, '/images/shops/no-img.png', '全网通(8G+128G)', '小米8 游戏手机 全面屏 透明探索版', 3439.20, 4299.00, b'1', 1000, '杰普官方直营', 51, 10887, 21774, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10888, b'0', NULL, '/images/shops/no-img.png', '暮光金 全网通(6G+128G)', '小米8 游戏手机 全面屏 屏幕指纹版', 2719.20, 3399.00, b'1', 1000, '杰普官方直营', 51, 10888, 21776, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10889, b'0', NULL, '/images/shops/no-img.png', '全网通(6G+128G)', '小米8 游戏手机 全面屏 蓝色', 1479.20, 1849.00, b'1', 1000, '杰普官方直营', 51, 10889, 21778, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10890, b'0', NULL, '/images/shops/b6084354-1841-4241-ba7b-7e97186a9076.jpg', 'AI双摄 拍照游戏手机 全网通双卡双待 亮黑色 4G+64G 全网通', '小米 红米7 手机 Redmi7', 646.40, 808.00, b'1', 1000, '杰普官方直营', 52, 10890, 21780, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10891, b'0', NULL, '/images/shops/7b4e03b1-eca7-42f5-8dda-14d02d3ab318.jpg', 'AI双摄 拍照游戏手机 全网通双卡双待 魅夜红 4G+64G 全网通', '小米 红米7 手机 Redmi7', 654.40, 818.00, b'1', 1000, '杰普官方直营', 52, 10891, 21782, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10892, b'0', NULL, '/images/shops/7bca8b59-35f3-480a-a95d-99efcbb8cfda.jpg', 'AI双摄 拍照游戏手机 全网通双卡双待 梦幻蓝 3G+32G 全网通', '小米 红米7 手机 Redmi7', 572.00, 715.00, b'1', 1000, '杰普官方直营', 52, 10892, 21784, '<p>商品介绍加载中...</p>', NULL);
INSERT INTO `t_shop` VALUES (10893, b'0', NULL, '/images/shops/mate30p2.png', '超曲面OLED环幕屏 8GB+256GB 全网通4G版（星河银）', 'HUAWEI Mate 30 Pro 双4000万徕卡电影四摄', 4319.20, 5399.00, b'1', 1000, '杰普官方直营', 46, 10893, 21786, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\r\n<div style=\"margin:0px;padding:0px;text-align:center;\">\r\n	<br />\r\n</div>\r\n	</div>\r\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\r\n	<div style=\"margin:0px auto;padding:0px;\">\r\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/huawei-1.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/huawei-3.jpg\" /> \r\n	</div>\r\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10894, b'0', NULL, '/images/shops/mate30p3.png', '超曲面OLED环幕屏 8GB+128GB 全网通4G版（翡冷翠）', 'HUAWEI Mate 30 Pro', 4319.20, 5399.00, b'1', 995, '杰普官方直营', 46, 10894, 21788, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\r\n<div style=\"margin:0px;padding:0px;text-align:center;\">\r\n	<br />\r\n</div>\r\n	</div>\r\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\r\n	<div style=\"margin:0px auto;padding:0px;\">\r\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/huawei-1.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/huawei-3.jpg\" /> \r\n	</div>\r\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10895, b'0', NULL, '/images/shops/mate30-3.png', 'OLED全面屏 8GB+128GB 全网通4G版 （罗兰紫）', 'HUAWEI Mate 30 4000万超感光徕卡影像', 3199.20, 3999.00, b'1', 964, '杰普官方直营', 46, 10895, 21790, '<div id=\"activity_header\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n<div style=\"margin:0px;padding:0px;text-align:center;\">\n	<br />\n</div>\n	</div>\n<div id=\"J-detail-content\" style=\"margin:0px;padding:0px;color:#666666;font-family:tahoma, arial, \" background-color:#ffffff;\"=\"\">\n	<div style=\"margin:0px auto;padding:0px;\">\n		<img class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/huawei-1.jpg\" /><img border=\"0\" class=\"\" src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/huawei-3.jpg\" /> \n	</div>\n</div>', NULL);
INSERT INTO `t_shop` VALUES (10903, b'0', NULL, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p40-silver.png', '麒麟990 5G SoC芯片 5000万超感知徕卡三摄 30倍数字变焦 6GB+128GB', '华为 HUAWEI P40 冰霜银 全网通5G手机', 3519.20, 4399.00, b'1', 1997, '杰普官方直营', 46, 10903, 21806, '<img src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p40-detail.jpg\" alt=\"\" />', NULL);
INSERT INTO `t_shop` VALUES (10905, b'0', NULL, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iPhone12-blue.png', 'A14仿生芯片，6.1英寸超视网膜XDR显示屏，超瓷晶面板，升维大提速，现实力登场！', 'Apple iPhone12 (A2404) 蓝色 支持移动联通电信5G 双卡双待手机', 5039.20, 6299.00, b'1', 1000, '杰普官方直营', 47, 10905, 21810, '<img src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone12-detail.jpg\" alt=\"\" />', NULL);
INSERT INTO `t_shop` VALUES (10906, b'0', NULL, 'https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone-12-pro-blue-hero.png', 'A14仿生芯片，6.1英寸超视网膜XDR显示屏，激光雷达扫描仪，超瓷晶面板，现实力登场！', 'Apple iPhone12 Pro (A2408) 128GB 海蓝色 支持移动联通电信5G 双卡双待手机', 6799.20, 8499.00, b'1', 2000, '杰普官方直营', 47, 10906, 21812, '<img src=\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/iphone12pro-detail.jpg\" alt=\"\" />', NULL);
COMMIT;

-- ----------------------------
-- Table structure for t_shop_car
-- ----------------------------
DROP TABLE IF EXISTS `t_shop_car`;
CREATE TABLE `t_shop_car` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `num` int NOT NULL DEFAULT '1',
  `shop_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  FOREIGN KEY (`shop_id`) REFERENCES `t_shop` (`id`)
) ;

-- ----------------------------
-- Records of t_shop_car
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`id`)
) 

-- ----------------------------
-- Records of t_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255)  DEFAULT NULL,
  `e_mail` varchar(255)  DEFAULT NULL,
  `is_lock` bit(1) NOT NULL,
  `login_name` varchar(255)  DEFAULT NULL,
  `nick_name` varchar(255)  DEFAULT NULL,
  `password_md5` varchar(255)  DEFAULT NULL,
  `phone` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES (3, '江苏省苏州市昆山市巴城镇', 'xyz199797@163.com', b'0', 'adam', '薛渊朕', '1d7c2923c1684726dc23d2901c4d8157', '18862207523');

COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
