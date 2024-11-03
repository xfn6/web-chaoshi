/*
 Navicat Premium Data Transfer

 Source Server         : local_host3306
 Source Server Type    : MySQL
 Source Server Version : 50713
 Source Host           : localhost:3306
 Source Schema         : chaoshi

 Target Server Type    : MySQL
 Target Server Version : 50713
 File Encoding         : 65001

 Date: 31/03/2024 12:39:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_goods
-- ----------------------------
DROP TABLE IF EXISTS `app_goods`;
CREATE TABLE `app_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `sale_price` double NOT NULL COMMENT '售价',
  `cost_price` double NOT NULL COMMENT '进价',
  `weight` double NOT NULL COMMENT '库存',
  `sort` int(11) NOT NULL COMMENT '类别',
  `produce_date` date NOT NULL COMMENT '生产日期',
  `limit_date` date NOT NULL COMMENT '过期日期',
  `isDelete` tinyint(1) NOT NULL,
  `provider_id` int(11) NOT NULL COMMENT '生产商ID',
  `lower` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_goods_provider_id_bc0ce48f_fk_app_provider_id`(`provider_id`) USING BTREE,
  CONSTRAINT `app_goods_provider_id_bc0ce48f_fk_app_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `app_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_goods
-- ----------------------------
INSERT INTO `app_goods` VALUES (7, '清脆小白菜', 5, 3, 3, 1, '2024-03-29', '2024-04-03', 0, 1, 1);
INSERT INTO `app_goods` VALUES (8, '上海青', 7, 3, 1, 1, '2024-03-06', '2024-03-10', 1, 1, 0);
INSERT INTO `app_goods` VALUES (9, '原味瑞士卷', 10, 5, 110, 0, '2024-03-01', '2025-01-06', 0, 4, 1);
INSERT INTO `app_goods` VALUES (10, '豌豆脆原味', 8, 4, 52, 0, '2024-03-06', '2025-07-03', 0, 4, 0);
INSERT INTO `app_goods` VALUES (11, '金龙鱼油', 38, 30, 1000, 2, '2024-03-03', '2025-06-06', 0, 5, 0);
INSERT INTO `app_goods` VALUES (12, '一品鲜酱油', 15, 10, 500, 2, '2024-03-02', '2025-06-04', 0, 5, 0);
INSERT INTO `app_goods` VALUES (13, '油污净化液', 11, 5, 500, 3, '2024-03-01', '2026-06-10', 0, 2, 0);
INSERT INTO `app_goods` VALUES (14, '柠檬洗洁精', 5, 2, 800, 3, '2024-03-01', '2027-06-16', 0, 2, 0);
INSERT INTO `app_goods` VALUES (15, '新品小米电视', 2399, 2000, 2000, 4, '2024-03-03', '2028-06-14', 0, 3, 0);
INSERT INTO `app_goods` VALUES (16, '电饭煲', 74, 60, 1000, 4, '2024-03-01', '2027-06-09', 0, 3, 0);
INSERT INTO `app_goods` VALUES (17, '山西陈醋', 16, 10, 500, 2, '2024-03-06', '2026-06-10', 0, 5, 0);
INSERT INTO `app_goods` VALUES (18, '大葱', 3, 1, 1, 1, '2024-03-29', '2024-03-31', 0, 1, 0);

-- ----------------------------
-- Table structure for app_manager
-- ----------------------------
DROP TABLE IF EXISTS `app_manager`;
CREATE TABLE `app_manager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `pwd` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `gender` int(11) NOT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `authority` int(11) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_manager
-- ----------------------------
INSERT INTO `app_manager` VALUES (1, 'admin', 'admin', '王涛', 1, '13508029834', 0, 0);
INSERT INTO `app_manager` VALUES (2, 'manager', '123456', '李经理', 1, '13085081034', 1, 0);
INSERT INTO `app_manager` VALUES (3, 'buyer', '123456', '王采购', 0, '13508180834', 2, 0);
INSERT INTO `app_manager` VALUES (4, 'seller', '123456', '张销售', 0, '13508120834', 3, 0);

-- ----------------------------
-- Table structure for app_message
-- ----------------------------
DROP TABLE IF EXISTS `app_message`;
CREATE TABLE `app_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `time` datetime(6) NOT NULL COMMENT '时间',
  `type` int(11) NOT NULL COMMENT '类型',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `isRead` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_message
-- ----------------------------
INSERT INTO `app_message` VALUES (1, '2024-01-01 00:35:03.000000', 0, '各位同仁，加倍努力，争取再创佳绩！', '13508029834', '王中涛', 1);
INSERT INTO `app_message` VALUES (2, '2024-02-28 13:52:46.228872', 1, '蔬菜很新鲜 配送很快', '12345678910', '张三', 1);
INSERT INTO `app_message` VALUES (3, '2024-03-29 05:35:06.580190', 1, '超市需要上新品！', '12345678910', '张先生', 0);
INSERT INTO `app_message` VALUES (4, '2024-03-29 05:46:20.687174', 0, '超市在线销售及分析系统正式上线啦！', '13508029834', '王涛', 0);

-- ----------------------------
-- Table structure for app_provider
-- ----------------------------
DROP TABLE IF EXISTS `app_provider`;
CREATE TABLE `app_provider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `isDelete` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_provider
-- ----------------------------
INSERT INTO `app_provider` VALUES (1, '天天生鲜厂家', '辽宁省大连市', '028-8294293', 0);
INSERT INTO `app_provider` VALUES (2, '清洁用品厂家', '辽宁省大连市', '028-8298293', 0);
INSERT INTO `app_provider` VALUES (3, '家电用器厂家', '辽宁省沈阳市', '028-8298293', 0);
INSERT INTO `app_provider` VALUES (4, '零食饮料厂家', '辽宁省丹东市', '028-8298293', 0);
INSERT INTO `app_provider` VALUES (5, '油盐酱醋厂家', '辽宁省大连市', '028-8298293', 0);

-- ----------------------------
-- Table structure for app_record
-- ----------------------------
DROP TABLE IF EXISTS `app_record`;
CREATE TABLE `app_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `location` int(11) NOT NULL COMMENT '超市分部',
  `sale_num` int(11) NULL DEFAULT NULL COMMENT '销售数量',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `date` date NOT NULL COMMENT '日期',
  `purchase_num` int(11) NULL DEFAULT NULL COMMENT '采购数量',
  `withdraw_num` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_record_goods_id_03d75759_fk_app_goods_id`(`goods_id`) USING BTREE,
  CONSTRAINT `app_record_goods_id_03d75759_fk_app_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `app_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_record
-- ----------------------------
INSERT INTO `app_record` VALUES (1, 1, NULL, 7, '2024-03-06', 10, NULL);
INSERT INTO `app_record` VALUES (2, 1, NULL, 8, '2024-03-06', 5, NULL);
INSERT INTO `app_record` VALUES (3, 1, NULL, 9, '2024-03-06', 100, NULL);
INSERT INTO `app_record` VALUES (4, 1, NULL, 10, '2024-03-06', 500, NULL);
INSERT INTO `app_record` VALUES (5, 1, NULL, 11, '2024-03-06', 50, NULL);
INSERT INTO `app_record` VALUES (6, 1, NULL, 12, '2024-03-06', 40, NULL);
INSERT INTO `app_record` VALUES (7, 1, NULL, 13, '2024-03-06', 100, NULL);
INSERT INTO `app_record` VALUES (8, 1, NULL, 14, '2024-03-06', 50, NULL);
INSERT INTO `app_record` VALUES (9, 1, NULL, 15, '2024-03-06', 5, NULL);
INSERT INTO `app_record` VALUES (10, 1, NULL, 16, '2024-03-06', 10, NULL);
INSERT INTO `app_record` VALUES (11, 1, 1, 7, '2024-03-06', NULL, NULL);
INSERT INTO `app_record` VALUES (12, 1, 1, 8, '2024-03-06', NULL, NULL);
INSERT INTO `app_record` VALUES (13, 1, 1, 9, '2024-03-06', NULL, NULL);
INSERT INTO `app_record` VALUES (14, 1, 1, 7, '2024-03-06', NULL, NULL);
INSERT INTO `app_record` VALUES (15, 1, 1, 8, '2024-03-06', NULL, NULL);
INSERT INTO `app_record` VALUES (16, 1, 1, 9, '2024-03-06', NULL, NULL);
INSERT INTO `app_record` VALUES (17, 1, NULL, 8, '2024-03-06', 4, NULL);
INSERT INTO `app_record` VALUES (18, 2, NULL, 17, '2024-03-06', 50, NULL);
INSERT INTO `app_record` VALUES (19, 1, 2, 7, '2024-03-15', NULL, NULL);
INSERT INTO `app_record` VALUES (20, 1, 8, 9, '2024-03-15', NULL, NULL);
INSERT INTO `app_record` VALUES (21, 1, 10, 10, '2024-03-15', NULL, NULL);
INSERT INTO `app_record` VALUES (22, 1, 16, 11, '2024-03-15', NULL, NULL);
INSERT INTO `app_record` VALUES (23, 1, 10, 12, '2024-03-15', NULL, NULL);
INSERT INTO `app_record` VALUES (24, 1, NULL, 9, '2024-03-29', 10, NULL);
INSERT INTO `app_record` VALUES (25, 1, NULL, 7, '2024-03-29', 4, NULL);
INSERT INTO `app_record` VALUES (26, 1, NULL, 18, '2024-03-29', 20, NULL);
INSERT INTO `app_record` VALUES (27, 1, 2, 7, '2024-03-29', NULL, NULL);
INSERT INTO `app_record` VALUES (28, 1, 3, 9, '2024-03-29', NULL, NULL);
INSERT INTO `app_record` VALUES (29, 1, 1, 10, '2024-03-29', NULL, NULL);

-- ----------------------------
-- Table structure for app_users
-- ----------------------------
DROP TABLE IF EXISTS `app_users`;
CREATE TABLE `app_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `account` int(11) NOT NULL COMMENT '余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of app_users
-- ----------------------------
INSERT INTO `app_users` VALUES (1, 'zhangsan', '123456', '张三', '20', '男', 7330);
INSERT INTO `app_users` VALUES (2, 'tom', '123456', '汤姆', '20', '男', 1702);
INSERT INTO `app_users` VALUES (3, 'zhaowu', '123456', '赵五', '20', '男', 9985);
INSERT INTO `app_users` VALUES (4, 'lisi', '123456', '李四', '20', '男', 10000);
INSERT INTO `app_users` VALUES (5, 'wangliu', '123456', '王六', '20', '男', 10000);
INSERT INTO `app_users` VALUES (7, 'zhaowu', '123456', '赵五', '20', '男', 10000);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add goods', 7, 'add_goods');
INSERT INTO `auth_permission` VALUES (26, 'Can change goods', 7, 'change_goods');
INSERT INTO `auth_permission` VALUES (27, 'Can delete goods', 7, 'delete_goods');
INSERT INTO `auth_permission` VALUES (28, 'Can view goods', 7, 'view_goods');
INSERT INTO `auth_permission` VALUES (29, 'Can add manager', 8, 'add_manager');
INSERT INTO `auth_permission` VALUES (30, 'Can change manager', 8, 'change_manager');
INSERT INTO `auth_permission` VALUES (31, 'Can delete manager', 8, 'delete_manager');
INSERT INTO `auth_permission` VALUES (32, 'Can view manager', 8, 'view_manager');
INSERT INTO `auth_permission` VALUES (33, 'Can add message', 9, 'add_message');
INSERT INTO `auth_permission` VALUES (34, 'Can change message', 9, 'change_message');
INSERT INTO `auth_permission` VALUES (35, 'Can delete message', 9, 'delete_message');
INSERT INTO `auth_permission` VALUES (36, 'Can view message', 9, 'view_message');
INSERT INTO `auth_permission` VALUES (37, 'Can add provider', 10, 'add_provider');
INSERT INTO `auth_permission` VALUES (38, 'Can change provider', 10, 'change_provider');
INSERT INTO `auth_permission` VALUES (39, 'Can delete provider', 10, 'delete_provider');
INSERT INTO `auth_permission` VALUES (40, 'Can view provider', 10, 'view_provider');
INSERT INTO `auth_permission` VALUES (41, 'Can add record', 11, 'add_record');
INSERT INTO `auth_permission` VALUES (42, 'Can change record', 11, 'change_record');
INSERT INTO `auth_permission` VALUES (43, 'Can delete record', 11, 'delete_record');
INSERT INTO `auth_permission` VALUES (44, 'Can view record', 11, 'view_record');
INSERT INTO `auth_permission` VALUES (45, 'Can add users', 12, 'add_users');
INSERT INTO `auth_permission` VALUES (46, 'Can change users', 12, 'change_users');
INSERT INTO `auth_permission` VALUES (47, 'Can delete users', 12, 'delete_users');
INSERT INTO `auth_permission` VALUES (48, 'Can view users', 12, 'view_users');
INSERT INTO `auth_permission` VALUES (49, 'Can add 商品销售分析', 13, 'add_goodssales');
INSERT INTO `auth_permission` VALUES (50, 'Can change 商品销售分析', 13, 'change_goodssales');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 商品销售分析', 13, 'delete_goodssales');
INSERT INTO `auth_permission` VALUES (52, 'Can view 商品销售分析', 13, 'view_goodssales');
INSERT INTO `auth_permission` VALUES (53, 'Can add 购物车', 14, 'add_shopcar');
INSERT INTO `auth_permission` VALUES (54, 'Can change 购物车', 14, 'change_shopcar');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 购物车', 14, 'delete_shopcar');
INSERT INTO `auth_permission` VALUES (56, 'Can view 购物车', 14, 'view_shopcar');
INSERT INTO `auth_permission` VALUES (57, 'Can add 订单', 15, 'add_payordermodel');
INSERT INTO `auth_permission` VALUES (58, 'Can change 订单', 15, 'change_payordermodel');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 订单', 15, 'delete_payordermodel');
INSERT INTO `auth_permission` VALUES (60, 'Can view 订单', 15, 'view_payordermodel');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'app', 'goods');
INSERT INTO `django_content_type` VALUES (8, 'app', 'manager');
INSERT INTO `django_content_type` VALUES (9, 'app', 'message');
INSERT INTO `django_content_type` VALUES (10, 'app', 'provider');
INSERT INTO `django_content_type` VALUES (11, 'app', 'record');
INSERT INTO `django_content_type` VALUES (12, 'app', 'users');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (13, 'pay', 'goodssales');
INSERT INTO `django_content_type` VALUES (15, 'pay', 'payordermodel');
INSERT INTO `django_content_type` VALUES (14, 'pay', 'shopcar');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-06-28 14:28:15.491149');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-06-28 14:28:16.255338');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-06-28 14:28:16.883978');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-06-28 14:28:17.035278');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-06-28 14:28:17.048811');
INSERT INTO `django_migrations` VALUES (6, 'app', '0001_initial', '2020-06-28 14:28:17.369267');
INSERT INTO `django_migrations` VALUES (7, 'app', '0002_auto_20190116_2010', '2020-06-28 14:28:17.669803');
INSERT INTO `django_migrations` VALUES (8, 'app', '0003_auto_20190117_0132', '2020-06-28 14:28:17.747782');
INSERT INTO `django_migrations` VALUES (9, 'app', '0004_auto_20190117_0147', '2020-06-28 14:28:18.552826');
INSERT INTO `django_migrations` VALUES (10, 'app', '0005_auto_20190117_1154', '2020-06-28 14:28:18.644683');
INSERT INTO `django_migrations` VALUES (11, 'app', '0006_auto_20190117_2127', '2020-06-28 14:28:18.666289');
INSERT INTO `django_migrations` VALUES (12, 'app', '0007_goods_preserve', '2020-06-28 14:28:18.754585');
INSERT INTO `django_migrations` VALUES (13, 'app', '0008_auto_20190119_2103', '2020-06-28 14:28:18.889952');
INSERT INTO `django_migrations` VALUES (14, 'app', '0009_auto_20190119_2136', '2020-06-28 14:28:19.020462');
INSERT INTO `django_migrations` VALUES (15, 'app', '0010_auto_20190121_0026', '2020-06-28 14:28:19.160825');
INSERT INTO `django_migrations` VALUES (16, 'app', '0011_message_isread', '2020-06-28 14:28:19.236089');
INSERT INTO `django_migrations` VALUES (17, 'contenttypes', '0002_remove_content_type_name', '2020-06-28 14:28:19.377388');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0002_alter_permission_name_max_length', '2020-06-28 14:28:19.492919');
INSERT INTO `django_migrations` VALUES (19, 'auth', '0003_alter_user_email_max_length', '2020-06-28 14:28:19.564837');
INSERT INTO `django_migrations` VALUES (20, 'auth', '0004_alter_user_username_opts', '2020-06-28 14:28:19.580413');
INSERT INTO `django_migrations` VALUES (21, 'auth', '0005_alter_user_last_login_null', '2020-06-28 14:28:19.656830');
INSERT INTO `django_migrations` VALUES (22, 'auth', '0006_require_contenttypes_0002', '2020-06-28 14:28:19.669256');
INSERT INTO `django_migrations` VALUES (23, 'auth', '0007_alter_validators_add_error_messages', '2020-06-28 14:28:19.687803');
INSERT INTO `django_migrations` VALUES (24, 'auth', '0008_alter_user_username_max_length', '2020-06-28 14:28:19.771183');
INSERT INTO `django_migrations` VALUES (25, 'auth', '0009_alter_user_last_name_max_length', '2020-06-28 14:28:19.851394');
INSERT INTO `django_migrations` VALUES (26, 'auth', '0010_alter_group_name_max_length', '2020-06-28 14:28:19.932173');
INSERT INTO `django_migrations` VALUES (27, 'auth', '0011_update_proxy_permissions', '2020-06-28 14:28:19.953732');
INSERT INTO `django_migrations` VALUES (28, 'sessions', '0001_initial', '2020-06-28 14:28:20.005549');
INSERT INTO `django_migrations` VALUES (29, 'app', '0012_users', '2024-03-06 23:02:41.860114');
INSERT INTO `django_migrations` VALUES (30, 'app', '0013_alter_users_account', '2024-03-12 11:00:07.328769');
INSERT INTO `django_migrations` VALUES (31, 'auth', '0012_alter_user_first_name_max_length', '2024-03-12 11:00:07.407872');
INSERT INTO `django_migrations` VALUES (32, 'pay', '0001_initial', '2024-03-12 11:16:33.998955');
INSERT INTO `django_migrations` VALUES (33, 'pay', '0002_shopcar_goods_name', '2024-03-13 10:56:01.857278');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0r0t9871qqtn0xwpzzlhedr83uo45ne4', '.eJwtiksOwjAMBe_iNYu0pIqas1SyomCCBTioJlJL1btjPrs3b2YDVrzVwgIROjhAU5qRTxC735Z0J1OvS5KiSawQzlf831Mbzr2bmic3mko51yZPiGPw3rB8mt6ZUVq-eRiOwRCVVLkK0vLgeYXo9jfNqSrw:1rkpgP:8CzHHR6GKcXzelrYmE6bDyz-WxxXKQvN5nwv7Ge-yXw', '2024-03-29 02:20:01.170168');
INSERT INTO `django_session` VALUES ('36ietnfeidqdl7cllz0xqh0edgiozvjr', 'eyJpc19sb2dpbiI6IjEiLCJ1c2VyX2lkIjo2LCJ1c2VybmFtZSI6ImthbmdydWkiLCJfc2Vzc2lvbl9leHBpcnkiOjB9:1rkK00:vtE_Hdu0mwjS9n2LZ7q9I8f3RTKlEKiPwZppfeimgHM', '2024-03-27 16:30:08.211025');
INSERT INTO `django_session` VALUES ('3zz2phx6qo853krdx4px9ouxgvleegh6', '.eJyrVsosjs_JT8_MU7JSMlTSUSotTi2Kz0xRsjKEsPMSc1OBUjGlpmlGBjGlJqkGlkBV8cWpxcWZ-XnxqRUFmUWVSlYGOkqJycn5pXklEM21AAwUHSY:1rkKhj:yjhGYIEOFAjhNMf3-zlgknYiOktBwRTLT5fc2bkSqww', '2024-03-27 17:15:19.422581');
INSERT INTO `django_session` VALUES ('4xnsllsqwjn26z68ngpe3faqfrey4e6m', 'ZWZmMGY3ZTMyZjQ5MzZkYmFiOWQ3YTk2MDY1NWYzNjY3NDQ3ODkyNjp7ImlzX2xvZ2luIjoiMSIsImFjY291bnRfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2024-03-12 13:46:47.075928');
INSERT INTO `django_session` VALUES ('5gt9ibz7dogj465e3yf0s1e7srpb8mfc', 'ZWZmMGY3ZTMyZjQ5MzZkYmFiOWQ3YTk2MDY1NWYzNjY3NDQ3ODkyNjp7ImlzX2xvZ2luIjoiMSIsImFjY291bnRfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2024-03-20 19:11:15.813265');
INSERT INTO `django_session` VALUES ('74ix8eas2ypmv82884wl2l6d9rtell7q', 'YzRlNjhiZDI2Y2UwMTg3NzM0YTQxNGVkMDUwZWUzNDAyZjU5YjQwMTp7ImlzX2xvZ2luIjoiMSIsInVzZXJfaWQiOjEsInVzZXJuYW1lIjoiXHU1ZjIwXHU0ZTA5IiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJhY2NvdW50X2lkIjoxfQ==', '2024-03-21 02:03:53.843385');
INSERT INTO `django_session` VALUES ('bht4ywdtx3wfv892c7puxojaes2hjtwk', 'ZWZmMGY3ZTMyZjQ5MzZkYmFiOWQ3YTk2MDY1NWYzNjY3NDQ3ODkyNjp7ImlzX2xvZ2luIjoiMSIsImFjY291bnRfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2024-03-20 18:28:23.154836');
INSERT INTO `django_session` VALUES ('c5hzkzmb6m2sm307awlcf4qzt2tgqsww', 'YzJlNGFhYjNhMTBmMGRhMDk4NzA3NDYzMGQxMTRjZjA5YzRjMWJkMzp7ImlzX2xvZ2luIjoiMSIsInVzZXJfaWQiOjEsInVzZXJuYW1lIjoiXHU1ZjIwXHU0ZTA5IiwiX3Nlc3Npb25fZXhwaXJ5IjowfQ==', '2024-03-26 07:34:17.174911');
INSERT INTO `django_session` VALUES ('f4sy1yws28gp9rk5zob0h8l2rm53lsbg', 'ZWZmMGY3ZTMyZjQ5MzZkYmFiOWQ3YTk2MDY1NWYzNjY3NDQ3ODkyNjp7ImlzX2xvZ2luIjoiMSIsImFjY291bnRfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2024-03-11 21:45:15.422970');
INSERT INTO `django_session` VALUES ('keof7g9o3zl9g2mczqhgo9e7k0p6rci8', '.eJw9jcsKAjEMRf8laxedRyn2WwZCqbEGNZWJhRnFfzc64i73nnPJE1jxUgsLROhgB01pRj5A7LZb0pUMPU5JiiYxQzif8VdPzR97N7WR3N5Qyrk2uUMMw-gtlo_TOyNKy1cPfggWUUmVqyAtN55XiO4_3p6_3nZxL98:1rkpvx:PSp5oenx18CcTCVYxXbhx_9JssgqIuXQSD1Z7QXWZJg', '2024-03-29 02:36:05.683674');
INSERT INTO `django_session` VALUES ('l0ijoz0e02bsqwshx3tiq8czdj10lr56', 'MWNlNWM1MjMwNzg1ZDNkOTY1ZDc4MWVjZjk0MGYwOWM3Mjc4M2VlZjp7ImlzX2xvZ2luIjoiMCIsImFjY291bnRfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2024-03-20 18:47:47.139668');
INSERT INTO `django_session` VALUES ('mq3unyq0rsw4jgsuvznb9wi86a1d7zpa', '.eJyrVsosjs_JT8_MU7JSMlTSUSotTi2Kz0xRsjKCsPMSc1OBUjGlZslmJjGlppbJZkBV8cWpxcWZ-XnxqRUFmUWVSlYGOkqJycn5pXklYM2GtQAN-B0y:1rkENh:MvGV4flKo37XGvdMRgledgSqBwLfSyQ1kE82uUacD00', '2024-03-27 10:30:13.271567');
INSERT INTO `django_session` VALUES ('mxorio7uxz20wr4rqgx5lsy7fcalypqv', 'ZWZmMGY3ZTMyZjQ5MzZkYmFiOWQ3YTk2MDY1NWYzNjY3NDQ3ODkyNjp7ImlzX2xvZ2luIjoiMSIsImFjY291bnRfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2024-03-13 13:52:57.002201');
INSERT INTO `django_session` VALUES ('poulim8z978fvtsrq7gms3qdm2dx6sn7', 'MWNlNWM1MjMwNzg1ZDNkOTY1ZDc4MWVjZjk0MGYwOWM3Mjc4M2VlZjp7ImlzX2xvZ2luIjoiMCIsImFjY291bnRfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2024-03-13 13:46:19.875534');
INSERT INTO `django_session` VALUES ('vkn7qbq4fvk64a6uigpcn2m5wrdvy0e1', 'ZWZmMGY3ZTMyZjQ5MzZkYmFiOWQ3YTk2MDY1NWYzNjY3NDQ3ODkyNjp7ImlzX2xvZ2luIjoiMSIsImFjY291bnRfaWQiOjEsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2024-03-11 18:33:51.789248');
INSERT INTO `django_session` VALUES ('xx0lfjjmx6otv4n7lmcz1e1be8y8xei1', '.eJyrVsosjs_JT8_MU7JSMlTSUSotTi2Kz0xRsjKCsPMSc1OBUjGlZslmJjGlppbJZkBV8cWpxcWZ-XnxqRUFmUWVSlYGOkqJycn5pXklYM2GtQAN-B0y:1rkJaF:IwIrDD65QQcCR8esPyqHFXMe_lzJR7pd5OJ9QO8V1cE', '2024-03-27 16:03:31.785175');
INSERT INTO `django_session` VALUES ('yoakib5hvfvphmu1t3ncpatxbzyi6dkl', 'ZGVhNmFkMDE4YjQ0NjI5ZWY2OWFjN2ZkMTI4OWYzYmVlOWEwMDM0OTp7ImlzX2xvZ2luIjoiMSIsImFjY291bnRfaWQiOjQsIl9zZXNzaW9uX2V4cGlyeSI6MH0=', '2023-12-29 01:13:14.000000');

-- ----------------------------
-- Table structure for pay_goods_sales
-- ----------------------------
DROP TABLE IF EXISTS `pay_goods_sales`;
CREATE TABLE `pay_goods_sales`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `volume` bigint(20) NOT NULL COMMENT '数量',
  `money` decimal(10, 2) NOT NULL COMMENT '金额',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类别',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '时间',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建者ID',
  `good_id` int(11) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pay_goods_sales_good_id_83208990_fk_app_goods_id`(`good_id`) USING BTREE,
  INDEX `pay_goods_sales_creator_id_720aedc0`(`creator_id`) USING BTREE,
  CONSTRAINT `pay_goods_sales_good_id_83208990_fk_app_goods_id` FOREIGN KEY (`good_id`) REFERENCES `app_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_goods_sales
-- ----------------------------
INSERT INTO `pay_goods_sales` VALUES (49, 1, 4.00, '1', '2024-03-13 16:55:50.472511', NULL, 7);
INSERT INTO `pay_goods_sales` VALUES (50, 1, 4.00, '1', '2024-03-13 16:55:53.956038', NULL, 7);
INSERT INTO `pay_goods_sales` VALUES (51, 1, 8.00, '0', '2024-03-13 16:56:01.080851', NULL, 10);
INSERT INTO `pay_goods_sales` VALUES (52, 1, 38.00, '2', '2024-03-13 18:28:33.551560', NULL, 11);
INSERT INTO `pay_goods_sales` VALUES (53, 3, 114.00, '2', '2024-03-13 18:28:36.701398', NULL, 11);
INSERT INTO `pay_goods_sales` VALUES (54, 4, 44.00, '3', '2024-03-13 18:28:46.086572', NULL, 13);
INSERT INTO `pay_goods_sales` VALUES (55, 1, 4.00, '1', '2024-03-15 01:24:17.753916', NULL, 7);
INSERT INTO `pay_goods_sales` VALUES (56, 2, 30.00, '2', '2024-03-15 01:27:02.505282', NULL, 12);
INSERT INTO `pay_goods_sales` VALUES (57, 1, 4.00, '1', '2024-03-15 02:03:47.007274', NULL, 7);
INSERT INTO `pay_goods_sales` VALUES (58, 1, 11.00, '3', '2024-03-15 02:10:12.656088', NULL, 13);
INSERT INTO `pay_goods_sales` VALUES (59, 1, 299.00, '4', '2024-03-15 02:32:18.797873', NULL, 15);
INSERT INTO `pay_goods_sales` VALUES (60, 1, 5.00, '3', '2024-03-29 05:28:01.618582', NULL, 14);
INSERT INTO `pay_goods_sales` VALUES (61, 1, 10.00, '0', '2024-03-29 05:30:12.317704', NULL, 9);

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `payment_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付状态',
  `amount` decimal(10, 2) NOT NULL COMMENT '余额',
  `order_status` int(11) NOT NULL COMMENT '订单状态',
  `out_trade_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `delivery_status` int(11) NOT NULL COMMENT '交付状态',
  `delivery_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交付地址',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '时间',
  `car_id` bigint(20) NULL DEFAULT NULL COMMENT '购物车ID',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建者ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `out_trade_no`(`out_trade_no`) USING BTREE,
  INDEX `pay_order_car_id_c6e866a8_fk_pay_shop_car_id`(`car_id`) USING BTREE,
  INDEX `pay_order_goods_id_7ae4df83_fk_app_goods_id`(`goods_id`) USING BTREE,
  INDEX `pay_order_user_id_4522f8ab_fk_app_users_id`(`user_id`) USING BTREE,
  INDEX `pay_order_creator_id_4f9f4f76`(`creator_id`) USING BTREE,
  CONSTRAINT `pay_order_car_id_c6e866a8_fk_pay_shop_car_id` FOREIGN KEY (`car_id`) REFERENCES `pay_shop_car` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pay_order_goods_id_7ae4df83_fk_app_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `app_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pay_order_user_id_4522f8ab_fk_app_users_id` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_order
-- ----------------------------
INSERT INTO `pay_order` VALUES (1, '清脆小白菜', 'local', 100.00, 1, '202403121513288176142', 0, '', '2024-03-12 15:13:28.176671', NULL, NULL, 7, 2);
INSERT INTO `pay_order` VALUES (2, '清脆小白菜', 'local', 100.00, 1, '202403121514126253972', 0, '', '2024-03-12 15:14:12.625397', NULL, NULL, 7, 2);
INSERT INTO `pay_order` VALUES (3, '清脆小白菜', 'local', 100.00, 1, '202403121515477057698', 0, '', '2024-03-12 15:15:47.706317', NULL, NULL, 7, 2);
INSERT INTO `pay_order` VALUES (4, '清脆小白菜', 'local', 100.00, 1, '202403121519023832662', 0, '', '2024-03-12 15:19:02.383266', NULL, NULL, 7, 2);
INSERT INTO `pay_order` VALUES (5, '清脆小白菜', 'local', 100.00, 1, '202403121520177420213', 0, '', '2024-03-12 15:20:17.742599', NULL, NULL, 7, 2);
INSERT INTO `pay_order` VALUES (6, '清脆小白菜', 'local', 100.00, 1, '202403121521011003239', 0, '', '2024-03-12 15:21:01.003760', NULL, NULL, 7, 2);
INSERT INTO `pay_order` VALUES (7, '清脆小白菜', 'local', 100.00, 1, '202403121522369782538', 0, '', '2024-03-12 15:22:36.978253', NULL, NULL, 7, 2);
INSERT INTO `pay_order` VALUES (8, '清脆小白菜', 'local', 100.00, 1, '202403121523209773722', 0, '', '2024-03-12 15:23:20.977940', NULL, NULL, 7, 2);
INSERT INTO `pay_order` VALUES (9, '金龙鱼油', 'local', 100.00, 1, '202403121603122385612', 2, '', '2024-03-12 16:03:12.386141', NULL, NULL, 11, 2);
INSERT INTO `pay_order` VALUES (10, '原味瑞士卷', 'local', 100.00, 1, '202403121703563646746', 0, '', '2024-03-12 17:03:56.468014', NULL, NULL, 9, 2);
INSERT INTO `pay_order` VALUES (11, '清脆小白菜', 'local', 100.00, 1, '202403121705341079195', 0, '', '2024-03-12 17:05:34.108440', NULL, NULL, 7, 2);
INSERT INTO `pay_order` VALUES (13, '原味瑞士卷', 'local', 100.00, 1, '202403121709011055963', 0, '', '2024-03-12 17:09:01.106130', 14, NULL, 9, 2);
INSERT INTO `pay_order` VALUES (14, '原味瑞士卷', 'local', 100.00, 1, '202403121712023477495', 0, '', '2024-03-12 17:12:02.347749', 14, NULL, 9, 2);
INSERT INTO `pay_order` VALUES (15, '原味瑞士卷', 'local', 100.00, 1, '202403121714422377858', 0, '', '2024-03-12 17:14:42.238307', 14, NULL, 9, 2);
INSERT INTO `pay_order` VALUES (16, '原味瑞士卷', 'local', 100.00, 1, '202403121715062569697', 0, '', '2024-03-12 17:15:06.257526', 14, NULL, 9, 2);
INSERT INTO `pay_order` VALUES (17, '原味瑞士卷', 'local', 100.00, 1, '202403121716013871388', 0, '', '2024-03-12 17:16:01.387670', 14, NULL, 9, 2);
INSERT INTO `pay_order` VALUES (25, '新品小米电视', 'local', 100.00, 1, '202403131111566038917', 0, '', '2024-03-13 11:11:56.039493', 25, NULL, 15, 2);
INSERT INTO `pay_order` VALUES (26, '清脆小白菜', 'local', 100.00, 1, '202403131128100762577', 0, '', '2024-03-13 11:28:10.763118', NULL, NULL, 7, 2);
INSERT INTO `pay_order` VALUES (27, '新品小米电视', 'local', 100.00, 1, '202403131129177227793', 0, '', '2024-03-13 11:29:17.228846', NULL, NULL, 15, 2);
INSERT INTO `pay_order` VALUES (28, '新品小米电视', 'local', 100.00, 1, '202403131131124671762', 0, '', '2024-03-13 11:31:12.467725', NULL, NULL, 15, 2);
INSERT INTO `pay_order` VALUES (29, '新品小米电视', 'local', 100.00, 1, '202403131132222667129', 0, '', '2024-03-13 11:32:22.667650', NULL, NULL, 15, 2);
INSERT INTO `pay_order` VALUES (30, '新品小米电视', 'local', 0.00, 1, '202403131302569261367', 0, '', '2024-03-13 13:02:56.926136', NULL, NULL, 15, 2);
INSERT INTO `pay_order` VALUES (31, '新品小米电视', 'local', 0.00, 1, '202403131310022972931', 0, '', '2024-03-13 13:10:02.973443', NULL, NULL, 15, 2);
INSERT INTO `pay_order` VALUES (32, '新品小米电视', 'local', 0.00, 1, '202403131310566567556', 0, '', '2024-03-13 13:10:56.755599', NULL, NULL, 15, 2);
INSERT INTO `pay_order` VALUES (33, '新品小米电视', 'local', 9596.00, 1, '202403131311385176954', 0, '', '2024-03-13 13:11:38.517695', NULL, NULL, 15, 2);
INSERT INTO `pay_order` VALUES (34, '新品小米电视', 'local', 4798.00, 1, '202403131311483700097', 0, '', '2024-03-13 13:11:48.370009', NULL, NULL, 15, 2);
INSERT INTO `pay_order` VALUES (35, '新品小米电视', 'local', 9596.00, 0, '202403131312414706562', 0, '', '2024-03-13 13:12:41.471186', NULL, NULL, 15, 2);
INSERT INTO `pay_order` VALUES (39, '原味瑞士卷', 'local', 10.00, 1, '202403131635599555137', 0, '', '2024-03-13 16:35:59.556135', NULL, NULL, 9, 1);
INSERT INTO `pay_order` VALUES (41, '清脆小白菜', 'local', 4.00, 1, '202403131655504751198', 0, '', '2024-03-13 16:55:50.475647', NULL, NULL, 7, 1);
INSERT INTO `pay_order` VALUES (42, '清脆小白菜', 'local', 4.00, 1, '202403131655539652538', 0, '', '2024-03-13 16:55:53.965812', NULL, NULL, 7, 1);
INSERT INTO `pay_order` VALUES (43, '豌豆脆原味', 'local', 8.00, 1, '202403131656010985878', 0, '', '2024-03-13 16:56:01.099174', NULL, NULL, 10, 1);
INSERT INTO `pay_order` VALUES (44, '金龙鱼油', 'local', 38.00, 1, '202403131828335555637', 0, '', '2024-03-13 18:28:33.556564', NULL, NULL, 11, 1);
INSERT INTO `pay_order` VALUES (45, '金龙鱼油', 'local', 114.00, 1, '202403131828367072635', 0, '', '2024-03-13 18:28:36.707768', NULL, NULL, 11, 1);
INSERT INTO `pay_order` VALUES (46, '油污净化液', 'local', 44.00, 1, '202403131828460915213', 1, '', '2024-03-13 18:28:46.092056', NULL, NULL, 13, 1);
INSERT INTO `pay_order` VALUES (47, '清脆小白菜', 'local', 4.00, 1, '202403150124177568748', 2, '', '2024-03-15 01:24:17.758867', NULL, NULL, 7, 1);
INSERT INTO `pay_order` VALUES (48, '一品鲜酱油', 'local', 30.00, 1, '202403150127025082738', 0, '', '2024-03-15 01:27:02.508274', 31, NULL, 12, 1);
INSERT INTO `pay_order` VALUES (49, '清脆小白菜', 'local', 4.00, 1, '202403150203470501552', 0, '', '2024-03-15 02:03:47.050155', NULL, NULL, 7, 3);
INSERT INTO `pay_order` VALUES (50, '油污净化液', 'local', 11.00, 1, '202403150210126789923', 0, '', '2024-03-15 02:10:12.678992', NULL, NULL, 13, 3);
INSERT INTO `pay_order` VALUES (51, '柠檬洗洁精', 'local', 5.00, 1, '202403290528011680417', 1, '', '2024-03-29 05:28:01.680417', NULL, NULL, 14, 1);
INSERT INTO `pay_order` VALUES (52, '原味瑞士卷', 'local', 10.00, 1, '202403290530123197355', 2, '', '2024-03-29 05:30:12.320733', 32, NULL, 9, 1);

-- ----------------------------
-- Table structure for pay_shop_car
-- ----------------------------
DROP TABLE IF EXISTS `pay_shop_car`;
CREATE TABLE `pay_shop_car`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `count` bigint(20) NOT NULL COMMENT '数量',
  `is_delete` tinyint(1) NOT NULL COMMENT '状态',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '时间',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建者ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pay_shop_car_creator_id_16bb7b6a`(`creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_shop_car
-- ----------------------------
INSERT INTO `pay_shop_car` VALUES (13, 7, 1, 1, '2024-03-12 16:14:10.336111', 2, NULL);
INSERT INTO `pay_shop_car` VALUES (14, 9, 1, 1, '2024-03-12 16:42:38.389740', 2, NULL);
INSERT INTO `pay_shop_car` VALUES (15, 7, 1, 1, '2024-03-12 17:20:42.797821', 2, NULL);
INSERT INTO `pay_shop_car` VALUES (16, 9, 1, 1, '2024-03-12 17:20:51.978574', 2, NULL);
INSERT INTO `pay_shop_car` VALUES (17, 7, 1, 1, '2024-03-12 17:25:58.129063', 2, NULL);
INSERT INTO `pay_shop_car` VALUES (25, 15, 1, 1, '2024-03-13 11:09:56.546699', 2, '新品小米电视');
INSERT INTO `pay_shop_car` VALUES (28, 7, 1, 1, '2024-03-13 16:32:09.961015', NULL, '清脆小白菜');
INSERT INTO `pay_shop_car` VALUES (29, 15, 1, 1, '2024-03-13 16:35:58.579762', NULL, '新品小米电视');
INSERT INTO `pay_shop_car` VALUES (30, 7, 1, 0, '2024-03-13 16:37:59.227179', 1, '清脆小白菜');
INSERT INTO `pay_shop_car` VALUES (31, 12, 2, 1, '2024-03-15 01:26:47.642205', 1, '一品鲜酱油');
INSERT INTO `pay_shop_car` VALUES (32, 9, 1, 1, '2024-03-29 05:29:44.609312', 1, '原味瑞士卷');

SET FOREIGN_KEY_CHECKS = 1;
