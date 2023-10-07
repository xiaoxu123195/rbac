/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 07/10/2023 13:11:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add role', 2, 'add_role');
INSERT INTO `auth_permission` VALUES (6, 'Can change role', 2, 'change_role');
INSERT INTO `auth_permission` VALUES (7, 'Can delete role', 2, 'delete_role');
INSERT INTO `auth_permission` VALUES (8, 'Can view role', 2, 'view_role');
INSERT INTO `auth_permission` VALUES (9, 'Can add user info', 3, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (10, 'Can change user info', 3, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (11, 'Can delete user info', 3, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (12, 'Can view user info', 3, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (13, 'Can add log entry', 4, 'add_logentry');
INSERT INTO `auth_permission` VALUES (14, 'Can change log entry', 4, 'change_logentry');
INSERT INTO `auth_permission` VALUES (15, 'Can delete log entry', 4, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (16, 'Can view log entry', 4, 'view_logentry');
INSERT INTO `auth_permission` VALUES (17, 'Can add permission', 5, 'add_permission');
INSERT INTO `auth_permission` VALUES (18, 'Can change permission', 5, 'change_permission');
INSERT INTO `auth_permission` VALUES (19, 'Can delete permission', 5, 'delete_permission');
INSERT INTO `auth_permission` VALUES (20, 'Can view permission', 5, 'view_permission');
INSERT INTO `auth_permission` VALUES (21, 'Can add group', 6, 'add_group');
INSERT INTO `auth_permission` VALUES (22, 'Can change group', 6, 'change_group');
INSERT INTO `auth_permission` VALUES (23, 'Can delete group', 6, 'delete_group');
INSERT INTO `auth_permission` VALUES (24, 'Can view group', 6, 'view_group');
INSERT INTO `auth_permission` VALUES (25, 'Can add user', 7, 'add_user');
INSERT INTO `auth_permission` VALUES (26, 'Can change user', 7, 'change_user');
INSERT INTO `auth_permission` VALUES (27, 'Can delete user', 7, 'delete_user');
INSERT INTO `auth_permission` VALUES (28, 'Can view user', 7, 'view_user');
INSERT INTO `auth_permission` VALUES (29, 'Can add content type', 8, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (30, 'Can change content type', 8, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (31, 'Can delete content type', 8, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (32, 'Can view content type', 8, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (33, 'Can add session', 9, 'add_session');
INSERT INTO `auth_permission` VALUES (34, 'Can change session', 9, 'change_session');
INSERT INTO `auth_permission` VALUES (35, 'Can delete session', 9, 'delete_session');
INSERT INTO `auth_permission` VALUES (36, 'Can view session', 9, 'view_session');
INSERT INTO `auth_permission` VALUES (37, 'Can add payment', 10, 'add_payment');
INSERT INTO `auth_permission` VALUES (38, 'Can change payment', 10, 'change_payment');
INSERT INTO `auth_permission` VALUES (39, 'Can delete payment', 10, 'delete_payment');
INSERT INTO `auth_permission` VALUES (40, 'Can view payment', 10, 'view_payment');
INSERT INTO `auth_permission` VALUES (41, 'Can add customer', 11, 'add_customer');
INSERT INTO `auth_permission` VALUES (42, 'Can change customer', 11, 'change_customer');
INSERT INTO `auth_permission` VALUES (43, 'Can delete customer', 11, 'delete_customer');
INSERT INTO `auth_permission` VALUES (44, 'Can view customer', 11, 'view_customer');
INSERT INTO `auth_permission` VALUES (45, 'Can add menu', 12, 'add_menu');
INSERT INTO `auth_permission` VALUES (46, 'Can change menu', 12, 'change_menu');
INSERT INTO `auth_permission` VALUES (47, 'Can delete menu', 12, 'delete_menu');
INSERT INTO `auth_permission` VALUES (48, 'Can view menu', 12, 'view_menu');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$600000$LHNd8RWHSYxHzRH1tBvJ9k$QTcIKjEORF+FGgyKMcI3N7jL+CRlfYsSyqVWzDv/u68=', '2023-10-02 11:36:13.665711', 1, 'xiaoxu', '', '', '15083351324@163.com', 1, 1, '2023-09-25 02:52:36.002151');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2023-09-25 06:11:57.179376', '1', '客户列表', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (2, '2023-09-25 06:12:20.364045', '2', '添加客户', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (3, '2023-09-25 06:12:36.603698', '3', '删除客户', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (4, '2023-09-25 06:12:44.646000', '4', '修改客户', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (5, '2023-09-25 06:12:52.551454', '5', '批量导入', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (6, '2023-09-25 06:13:00.900860', '6', '下载模板', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (7, '2023-09-25 06:13:08.042997', '7', '账单列表', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (8, '2023-09-25 06:13:18.639837', '8', '添加账单', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (9, '2023-09-25 06:13:27.029534', '9', '删除账单', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (10, '2023-09-25 06:13:35.602924', '10', '修改账单', 1, '[{\"added\": {}}]', 1, 1);
INSERT INTO `django_admin_log` VALUES (11, '2023-09-25 06:14:28.049636', '1', 'CEO', 1, '[{\"added\": {}}]', 2, 1);
INSERT INTO `django_admin_log` VALUES (12, '2023-09-25 06:15:03.744781', '2', '总监', 1, '[{\"added\": {}}]', 2, 1);
INSERT INTO `django_admin_log` VALUES (13, '2023-09-25 06:15:29.998125', '3', '销售', 1, '[{\"added\": {}}]', 2, 1);
INSERT INTO `django_admin_log` VALUES (14, '2023-09-25 06:16:40.763082', '1', '韩超', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (15, '2023-09-25 06:17:13.067581', '2', '王亮', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (16, '2023-09-25 06:17:44.693800', '3', '张萌', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (17, '2023-09-25 12:39:37.322667', '4', 'yue', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (18, '2023-09-29 03:25:36.271188', '4', 'yue', 2, '[{\"changed\": {\"fields\": [\"\\u62e5\\u6709\\u7684\\u6240\\u6709\\u89d2\\u8272\"]}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (19, '2023-09-29 03:29:01.343328', '4', 'yue', 2, '[{\"changed\": {\"fields\": [\"\\u62e5\\u6709\\u7684\\u6240\\u6709\\u89d2\\u8272\"]}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (20, '2023-09-29 03:29:29.263216', '5', 'jie', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (21, '2023-09-29 03:29:58.175420', '6', 'yi', 1, '[{\"added\": {}}]', 3, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (4, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (6, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (5, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (7, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (8, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (12, 'rbac', 'menu');
INSERT INTO `django_content_type` VALUES (1, 'rbac', 'permission');
INSERT INTO `django_content_type` VALUES (2, 'rbac', 'role');
INSERT INTO `django_content_type` VALUES (3, 'rbac', 'userinfo');
INSERT INTO `django_content_type` VALUES (9, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (11, 'web', 'customer');
INSERT INTO `django_content_type` VALUES (10, 'web', 'payment');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-09-24 13:05:04.920247');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-09-24 13:05:05.499407');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2023-09-24 13:05:05.638307');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-09-24 13:05:05.648236');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-24 13:05:05.660492');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-09-24 13:05:05.790859');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-09-24 13:05:05.851483');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-09-24 13:05:05.920442');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-09-24 13:05:05.929248');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-09-24 13:05:05.981136');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-09-24 13:05:05.985679');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-09-24 13:05:05.992843');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-09-24 13:05:06.055813');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-09-24 13:05:06.119712');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-09-24 13:05:06.179852');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-09-24 13:05:06.190230');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-09-24 13:05:06.252046');
INSERT INTO `django_migrations` VALUES (18, 'rbac', '0001_initial', '2023-09-24 13:05:06.585863');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2023-09-24 13:05:06.625461');
INSERT INTO `django_migrations` VALUES (20, 'web', '0001_initial', '2023-09-25 02:41:00.855604');
INSERT INTO `django_migrations` VALUES (21, 'rbac', '0002_permission_is_menu', '2023-09-25 12:01:14.587043');
INSERT INTO `django_migrations` VALUES (22, 'rbac', '0003_permission_icon', '2023-09-25 12:04:07.867493');
INSERT INTO `django_migrations` VALUES (23, 'rbac', '0004_menu_remove_permission_icon_and_more', '2023-09-26 07:00:36.480184');
INSERT INTO `django_migrations` VALUES (24, 'rbac', '0005_permission_pid', '2023-09-26 08:25:10.675954');
INSERT INTO `django_migrations` VALUES (25, 'rbac', '0006_permission_name', '2023-09-29 03:53:45.539669');
INSERT INTO `django_migrations` VALUES (26, 'rbac', '0007_alter_menu_icon', '2023-10-01 12:52:20.085559');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('09vhghvja37u8mv6me3lk8xzlcpq5anv', '.eJyFkt1uhCAQhd-FqzZ1s4KC1mzaV-h93RhWMCXFnyBcGOO7d9yN1i1rejMh8J2TMzOMaHCy6KSpVd-rtimc0YVWvS2-5YCyzxEpgTIcILhHGTqWrrdtLc1xZo4oQN383jitp-DGEp_lQqwoXrhox_Pp_eNUKvGW5-Ll2ZfFvkwK9a-M-jJVd62xPsp81Hba55KV6_hQy8buzyT10O1IkgV79TAh9bWzzutsFeHQU10HctrINqpz8HfjIHG3bY8Iz8UqqyX45S6hJM0dI1EC5wvHUOOQgZkq2waIih9KDgPiByOtaeGh_FJaGNlsv86vH71wsvhRgqGmKUvR3u-azlOAyH2kuJIQg4Ws2o1UKSMfRUm2UVJBGISIKH0c5X6nkGSafgC6Lf7U:1ql3nX:pXMz3VhCffuEfWIp8Ejzjcvhrn5SaswcXSdomd6Q-FM', '2023-10-10 08:52:03.516124');
INSERT INTO `django_session` VALUES ('2yexylorh339ygl8arq2os8vw676bqxf', '.eJy9mF2PmzoQhv9Lrlqd3QQbbMPq6Byp95V6362QwaahS0LEh6JVlf_eMU1gnGD2i-QmSoC888z4Hdv49yKWbbOO21pXca4WDwuyuMPXEpk-6a25oX7J7c9ymZbbpsqTpXlkebxbL7-WShdfjs9aAmtZr-HfnlB-KqkIZEq05pyxNPFFEOmQRproKFJU0CBMqOChoEqKLBOSMxLRjNAk0iD63Op4p6tNXtd5uY3bqoiLvG7iJ_28ePi9SNu6KTcQ0Vw0F0w65G7R5E2hgeCxZYmkjy2nvoDvlMBnGPIQlEEKHlidFFZGYQXXd0Zi2xYFfI2POqef3X_Mj8PdEFoqdYpMcWSussTElB6mGIkMAn1ggqJO0R9ZLvgxGIzOCcy3SkIpIEWcBy-AgcDq0__f_k1z9d_jo_rn81Uwtcr7oQswZ5BpDarMj17gNAo3AM03u7LqUZk11lQAZETSzMTIUvgknI2g_tW4Cl6z64ebW2XUHvgwzIQCaUkJfAqRjbCBwJxgO_m80dvGak2BwUJFOcj5jI235lHgzZ15CowaM3Q15sBwGRf3pbDr4UTv62HDIyrUlZGrK6eoTk25u_D6fIy4JYnn6skpyr4lr4GZ6nqdkx7Qtwc3MG5PFCM91fH5-axdwRr4UJWFttcda0oIYXWDT1jhxt1tNFZG483-HqIjhxPutHgPMhbcWnzY2dC4UuhLc56ERWe5yOp8kRFupqSIvIQ3-OjpfGafFxa1JQmdfTnJ2nfm9VC73ZXlOWsOEYyGU5udTtZovM9zXXS83fFcnhtAxoJbnovs2jhTsGuDkrDosOcocXluGm_Cc_PCIs9R6vLcNKvbc_OiVrrWTbzbD2Nvzbqw81GmxFybCTWFQovQI2PAnRBM6XW9Lyt1bXZYN1qrX6i1wwx9lU7tQDpZo_G-fumi435hzjm6BxkLjvvFJGDNJa4U7NqgJCw6q1-4c46exHP3y8ywuF-Ec46eZHX2y3yotYbXZRVfDL5zDxroEEIJLcUE_V_VwQ8miS7Exf7qOplYRolcRnlzKrfwDk4DvxN7Lgu9OYsbuAodgiBT-cRlKi4C3-TDvDPuQaj3ES7QFe2EUsBu8qnLTa_J4RYGQuDYP85Dlddw38Aym7ZocnR6VvfkgevsggdmHQ8ylk5k0emiXOpbsFuVd5-9vGYULvmvOxjrptnVD6vVfr9fEu4v03Kz6lM5W3OZsT0nAM4i0wgRvHD3-KNCs71Vd3VX8KvKk7bRo8Y5W3U9Q0gCNVHsQXDUMS9upQ4XZ8DdNHU8_-0OAcY3iiKRZqcfeBxi5TDBwROZvE8lvMnL-0o3VQk30nVeqErDze8fPzw-_ABaaiPB-Jkh9XjmRMrySo-hfOCwrCMRNskwRE6StVL341X50NHG4W6Ol9WTyse28CeVGa0MxT4c_gANVeMR:1qoeWi:kYA8EV9XvUH-6yhd00eYoOp05Iv34MaQjMVWTnY54oY', '2023-10-20 06:41:32.067733');
INSERT INTO `django_session` VALUES ('hr6gif9tq521ac1ht4b6kzmr5wxy9ssc', '.eJy1lMlugzAQht_Fp1YlAgy2SVS1r9B7iZCDbdWqWWTMIYp49w7NBg1ppJReRl7___Mys0PbVma1tIVuGl2VWWtNZnTjsk-5Rav3HdICrUIPOe2MRCuUtmTDcdpSHDFo4xBiktAEeQi2wgI_bxtXFdL6vYwP43UvUbbGQDM76By733v6TuftrfDQigq16U14MLSdsOJCnJzCgc1vuAfzC-AjSTQ6NMbAsKQ0vkEipPEfXt-ecy1e0lQ8Pc7OFQ-5YiUlqJBoeYNLCu3-GYyMng4zQFqGueoVVQ4xpGQCTBd1Zd3sMHR0SzKAf5QoJkCL4xAiY2oCxtVmdhI2JEkEprA_ImQ6eWq-LWTp7sud5FrunF0vnYapw8ZHvgp7OvIYt1t7P8sJzLb7UrJDYR_O6ozg5HihbMPhUVgcUFDXeVXCCsUXOYfr5Asrna1gIv_QRlhZzlKXunXnITxGgmzq_0ZA1VUkpa2cQvnDKwNJ130BBYO5pQ:1qm4oG:L9NcCnXimbWXB1MtEcaoSiGHjjZuIR7vq3wABmaJnok', '2023-10-13 04:09:00.005948');

-- ----------------------------
-- Table structure for rbac_menu
-- ----------------------------
DROP TABLE IF EXISTS `rbac_menu`;
CREATE TABLE `rbac_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rbac_menu
-- ----------------------------
INSERT INTO `rbac_menu` VALUES (1, '用户管理', 'fa-camera-retro');
INSERT INTO `rbac_menu` VALUES (2, '信息管理', 'fa-fire');
INSERT INTO `rbac_menu` VALUES (7, '权限管理', 'fa-hdd-o');

-- ----------------------------
-- Table structure for rbac_permission
-- ----------------------------
DROP TABLE IF EXISTS `rbac_permission`;
CREATE TABLE `rbac_permission`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `menu_id` bigint NULL DEFAULT NULL,
  `pid_id` bigint NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rbac_permission_menu_id_3dcc68be_fk_rbac_menu_id`(`menu_id`) USING BTREE,
  INDEX `rbac_permission_pid_id_6939354d_fk_rbac_permission_id`(`pid_id`) USING BTREE,
  CONSTRAINT `rbac_permission_menu_id_3dcc68be_fk_rbac_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `rbac_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rbac_permission_pid_id_6939354d_fk_rbac_permission_id` FOREIGN KEY (`pid_id`) REFERENCES `rbac_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rbac_permission
-- ----------------------------
INSERT INTO `rbac_permission` VALUES (1, '客户列表', '/customer/list/', 1, NULL, 'customer_list');
INSERT INTO `rbac_permission` VALUES (2, '添加客户', '/customer/add/', NULL, 1, 'customer_add');
INSERT INTO `rbac_permission` VALUES (3, '删除客户', '/customer/del/(?P<cid>\\d+)/', NULL, 1, 'customer_del');
INSERT INTO `rbac_permission` VALUES (4, '修改客户', '/customer/edit/(?P<cid>\\d+)/', NULL, 1, 'customer_edit');
INSERT INTO `rbac_permission` VALUES (5, '批量导入', '/customer/import/', NULL, 1, 'customer_import');
INSERT INTO `rbac_permission` VALUES (6, '下载模板', '/customer/tpl/', NULL, 1, 'customer_tpl');
INSERT INTO `rbac_permission` VALUES (7, '账单列表', '/payment/list/', 2, NULL, 'payment_list');
INSERT INTO `rbac_permission` VALUES (8, '添加账单', '/payment/add/', NULL, 7, 'payment_add');
INSERT INTO `rbac_permission` VALUES (9, '删除账单', '/payment/del/(?P<pid>\\d+)/', NULL, 7, 'payment_del');
INSERT INTO `rbac_permission` VALUES (10, '修改账单', '/payment/edit/(?P<pid>\\d+)/', NULL, 7, 'payment_edit');
INSERT INTO `rbac_permission` VALUES (13, '测试1', 'ceshi1', NULL, 1, 'ceshi1');
INSERT INTO `rbac_permission` VALUES (15, '角色列表', '/rbac/role/list/', 7, NULL, 'rbac:role_list');
INSERT INTO `rbac_permission` VALUES (16, '添加角色', '/rbac/role/add/', NULL, 15, 'rbac:role_add');
INSERT INTO `rbac_permission` VALUES (17, '编辑角色', '/rbac/role/edit/(?P<pk>\\d+)/', NULL, 15, 'rbac:role_edit');
INSERT INTO `rbac_permission` VALUES (18, '删除角色', '/rbac/role/del/(?P<pk>\\d+)/', NULL, 15, 'rbac:role_del');
INSERT INTO `rbac_permission` VALUES (19, '用户列表', '/rbac/user/list/', 7, NULL, 'rbac:user_list');
INSERT INTO `rbac_permission` VALUES (20, '添加用户', '/rbac/user/add/', NULL, 19, 'rbac:user_add');
INSERT INTO `rbac_permission` VALUES (21, '编辑用户', '/rbac/user/edit/(?P<pk>\\d+)/', NULL, 19, 'rbac:user_edit');
INSERT INTO `rbac_permission` VALUES (22, '删除用户', '/rbac/user/del/(?P<pk>\\d+)/', NULL, 19, 'rbac:user_del');
INSERT INTO `rbac_permission` VALUES (23, '重置密码', '/rbac/user/reset/password/(?P<pk>\\d+)/', NULL, 19, 'rbac:user_reset_pwd');
INSERT INTO `rbac_permission` VALUES (24, '菜单列表', '/rbac/menu/list/', 7, NULL, 'rbac:menu_list');
INSERT INTO `rbac_permission` VALUES (25, '添加菜单', '/rbac/menu/add/', NULL, 24, 'rbac:menu_add');
INSERT INTO `rbac_permission` VALUES (26, '编辑菜单', '/rbac/menu/edit/(?P<pk>\\d+)/', NULL, 24, 'rbac:menu_edit');
INSERT INTO `rbac_permission` VALUES (27, '删除菜单', '/rbac/menu/del/(?P<pk>\\d+)/', NULL, 24, 'rbac:menu_del');
INSERT INTO `rbac_permission` VALUES (28, '添加二级菜单', '/rbac/second/menu/add/(?P<menu_id>\\d+)/', NULL, 24, 'rbac:second_menu_add');
INSERT INTO `rbac_permission` VALUES (29, '编辑二级菜单', '/rbac/second/menu/edit/(?P<pk>\\d+)/', NULL, 24, 'rbac:second_menu_edit');
INSERT INTO `rbac_permission` VALUES (30, '删除二级菜单', '/rbac/second/menu/del/(?P<pk>\\d+)/', NULL, 24, 'rbac:second_menu_del');
INSERT INTO `rbac_permission` VALUES (31, '添加权限', '/rbac/permission/add/(?P<second_menu_id>\\d+)/', NULL, 24, 'rbac:permission_add');
INSERT INTO `rbac_permission` VALUES (32, '编辑权限', '/rbac/permission/edit/(?P<pk>\\d+)/', NULL, 24, 'rbac:permission_edit');
INSERT INTO `rbac_permission` VALUES (33, '删除权限', '/rbac/permission/del/(?P<pk>\\d+)/', NULL, 24, 'rbac:permission_del');
INSERT INTO `rbac_permission` VALUES (34, '批量操作权限', '/rbac/multi/permissions/', NULL, 24, 'rbac:multi_permissions');
INSERT INTO `rbac_permission` VALUES (35, '批量删除权限', '/rbac/multi/permissions/del/(?P<pk>\\d+)/', NULL, 24, 'rbac:multi_permissions_del');
INSERT INTO `rbac_permission` VALUES (36, '网易外链', 'https://www.163.com/', NULL, 7, 'https://www.163.com/');
INSERT INTO `rbac_permission` VALUES (37, '分配权限', '/rbac/distribute/permissions/', 7, NULL, 'rbac:distribute_permissions');

-- ----------------------------
-- Table structure for rbac_role
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role`;
CREATE TABLE `rbac_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rbac_role
-- ----------------------------
INSERT INTO `rbac_role` VALUES (1, 'CEO');
INSERT INTO `rbac_role` VALUES (2, '总监');
INSERT INTO `rbac_role` VALUES (3, '销售');
INSERT INTO `rbac_role` VALUES (4, '销售经理');

-- ----------------------------
-- Table structure for rbac_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role_permissions`;
CREATE TABLE `rbac_role_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rbac_role_permissions_role_id_permission_id_d01303da_uniq`(`role_id`, `permission_id`) USING BTREE,
  INDEX `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `rbac_role_permission_permission_id_f5e1e866_fk_rbac_perm` FOREIGN KEY (`permission_id`) REFERENCES `rbac_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rbac_role_permissions_role_id_d10416cb_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rbac_role_permissions
-- ----------------------------
INSERT INTO `rbac_role_permissions` VALUES (1, 1, 1);
INSERT INTO `rbac_role_permissions` VALUES (2, 1, 2);
INSERT INTO `rbac_role_permissions` VALUES (3, 1, 3);
INSERT INTO `rbac_role_permissions` VALUES (4, 1, 4);
INSERT INTO `rbac_role_permissions` VALUES (5, 1, 5);
INSERT INTO `rbac_role_permissions` VALUES (6, 1, 6);
INSERT INTO `rbac_role_permissions` VALUES (7, 1, 7);
INSERT INTO `rbac_role_permissions` VALUES (8, 1, 8);
INSERT INTO `rbac_role_permissions` VALUES (9, 1, 9);
INSERT INTO `rbac_role_permissions` VALUES (10, 1, 10);
INSERT INTO `rbac_role_permissions` VALUES (29, 1, 13);
INSERT INTO `rbac_role_permissions` VALUES (30, 1, 15);
INSERT INTO `rbac_role_permissions` VALUES (31, 1, 16);
INSERT INTO `rbac_role_permissions` VALUES (32, 1, 17);
INSERT INTO `rbac_role_permissions` VALUES (33, 1, 18);
INSERT INTO `rbac_role_permissions` VALUES (34, 1, 19);
INSERT INTO `rbac_role_permissions` VALUES (35, 1, 20);
INSERT INTO `rbac_role_permissions` VALUES (36, 1, 21);
INSERT INTO `rbac_role_permissions` VALUES (37, 1, 22);
INSERT INTO `rbac_role_permissions` VALUES (38, 1, 23);
INSERT INTO `rbac_role_permissions` VALUES (39, 1, 24);
INSERT INTO `rbac_role_permissions` VALUES (40, 1, 25);
INSERT INTO `rbac_role_permissions` VALUES (41, 1, 26);
INSERT INTO `rbac_role_permissions` VALUES (42, 1, 27);
INSERT INTO `rbac_role_permissions` VALUES (43, 1, 28);
INSERT INTO `rbac_role_permissions` VALUES (44, 1, 29);
INSERT INTO `rbac_role_permissions` VALUES (45, 1, 30);
INSERT INTO `rbac_role_permissions` VALUES (46, 1, 31);
INSERT INTO `rbac_role_permissions` VALUES (47, 1, 32);
INSERT INTO `rbac_role_permissions` VALUES (48, 1, 33);
INSERT INTO `rbac_role_permissions` VALUES (49, 1, 34);
INSERT INTO `rbac_role_permissions` VALUES (50, 1, 35);
INSERT INTO `rbac_role_permissions` VALUES (51, 1, 36);
INSERT INTO `rbac_role_permissions` VALUES (52, 1, 37);
INSERT INTO `rbac_role_permissions` VALUES (11, 2, 1);
INSERT INTO `rbac_role_permissions` VALUES (12, 2, 2);
INSERT INTO `rbac_role_permissions` VALUES (13, 2, 3);
INSERT INTO `rbac_role_permissions` VALUES (14, 2, 4);
INSERT INTO `rbac_role_permissions` VALUES (15, 2, 5);
INSERT INTO `rbac_role_permissions` VALUES (16, 2, 6);
INSERT INTO `rbac_role_permissions` VALUES (17, 2, 7);
INSERT INTO `rbac_role_permissions` VALUES (18, 2, 8);
INSERT INTO `rbac_role_permissions` VALUES (27, 2, 10);
INSERT INTO `rbac_role_permissions` VALUES (19, 3, 1);
INSERT INTO `rbac_role_permissions` VALUES (20, 3, 2);
INSERT INTO `rbac_role_permissions` VALUES (28, 3, 4);
INSERT INTO `rbac_role_permissions` VALUES (21, 4, 2);
INSERT INTO `rbac_role_permissions` VALUES (22, 4, 3);
INSERT INTO `rbac_role_permissions` VALUES (23, 4, 4);
INSERT INTO `rbac_role_permissions` VALUES (24, 4, 5);
INSERT INTO `rbac_role_permissions` VALUES (25, 4, 6);
INSERT INTO `rbac_role_permissions` VALUES (26, 4, 8);

-- ----------------------------
-- Table structure for rbac_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `rbac_userinfo`;
CREATE TABLE `rbac_userinfo`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rbac_userinfo
-- ----------------------------
INSERT INTO `rbac_userinfo` VALUES (1, '韩超', '123', 'hanchao@gmail.com');
INSERT INTO `rbac_userinfo` VALUES (2, '王亮', '123', 'wangliang@gmail.com');
INSERT INTO `rbac_userinfo` VALUES (3, '张萌', '123', 'zhangmeng@gmail.com');
INSERT INTO `rbac_userinfo` VALUES (4, 'yue', '123', 'yue@gmail.com');
INSERT INTO `rbac_userinfo` VALUES (5, 'jie', '123', 'jie@gmail.com');
INSERT INTO `rbac_userinfo` VALUES (6, 'yi', '123', 'yi@gmail.com');
INSERT INTO `rbac_userinfo` VALUES (8, 'jiejie', '123', 'jiejie@gmail.com');

-- ----------------------------
-- Table structure for rbac_userinfo_roles
-- ----------------------------
DROP TABLE IF EXISTS `rbac_userinfo_roles`;
CREATE TABLE `rbac_userinfo_roles`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rbac_userinfo_roles_userinfo_id_role_id_aeda2126_uniq`(`userinfo_id`, `role_id`) USING BTREE,
  INDEX `rbac_userinfo_roles_role_id_7554e792_fk_rbac_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `rbac_userinfo_roles_role_id_7554e792_fk_rbac_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rbac_userinfo_roles_userinfo_id_2da02bea_fk_rbac_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `rbac_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rbac_userinfo_roles
-- ----------------------------
INSERT INTO `rbac_userinfo_roles` VALUES (1, 1, 1);
INSERT INTO `rbac_userinfo_roles` VALUES (2, 2, 2);
INSERT INTO `rbac_userinfo_roles` VALUES (3, 3, 3);
INSERT INTO `rbac_userinfo_roles` VALUES (4, 4, 1);
INSERT INTO `rbac_userinfo_roles` VALUES (7, 5, 2);
INSERT INTO `rbac_userinfo_roles` VALUES (8, 6, 3);
INSERT INTO `rbac_userinfo_roles` VALUES (9, 8, 4);

-- ----------------------------
-- Table structure for web_customer
-- ----------------------------
DROP TABLE IF EXISTS `web_customer`;
CREATE TABLE `web_customer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_customer
-- ----------------------------
INSERT INTO `web_customer` VALUES (2, '赵敏', '22', 'zhaomin@example.com', '蓝天科技有限公司');
INSERT INTO `web_customer` VALUES (3, '王磊', '12', 'wanglei@example.com', '宇宙集团');
INSERT INTO `web_customer` VALUES (4, '李明', '18', 'liming@example.com', '星球探索有限公司');
INSERT INTO `web_customer` VALUES (5, '周阳', '43', 'zhouyang@example.com', '极光股份');
INSERT INTO `web_customer` VALUES (6, '韩超', '18', 'jack@qq.com', '小白白');

-- ----------------------------
-- Table structure for web_payment
-- ----------------------------
DROP TABLE IF EXISTS `web_payment`;
CREATE TABLE `web_payment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `money` int NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_payment_customer_id_635a84ee_fk_web_customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `web_payment_customer_id_635a84ee_fk_web_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `web_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_payment
-- ----------------------------
INSERT INTO `web_payment` VALUES (2, 778, '2023-09-25 03:18:37.614574', 2);
INSERT INTO `web_payment` VALUES (4, 999, '2023-09-25 03:19:00.428069', 4);
INSERT INTO `web_payment` VALUES (8, 199, '2023-09-25 06:01:12.229222', 3);
INSERT INTO `web_payment` VALUES (10, 1200, '2023-09-25 07:36:22.428255', 5);

SET FOREIGN_KEY_CHECKS = 1;
