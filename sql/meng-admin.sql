/*
 Navicat Premium Data Transfer

 Source Server         : 本机mysql
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 127.0.0.1:3306
 Source Schema         : meng-admin

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 27/11/2024 23:48:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ptype` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v0` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v1` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v2` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v3` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v4` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v5` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_casbin_rule` (`ptype`,`v0`,`v1`,`v2`,`v3`,`v4`,`v5`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
BEGIN;
INSERT INTO `casbin_rule` VALUES (41, 'p', 'common', '/api/v1/dept', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (42, 'p', 'common', '/api/v1/dept/:id', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (43, 'p', 'common', '/api/v1/dept/tree', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (47, 'p', 'common', '/api/v1/menu', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (48, 'p', 'common', '/api/v1/menu/:menuId', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (49, 'p', 'common', '/api/v1/role', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (50, 'p', 'common', '/api/v1/role/:id', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (46, 'p', 'common', '/api/v1/sys-api', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (51, 'p', 'common', '/api/v1/sys-user', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (44, 'p', 'common', '/api/v1/sys-user/:id', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (45, 'p', 'common', '/api/v1/user/pwd/reset', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (26, 'p', 'developer', '/api/v/menu', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (19, 'p', 'developer', '/api/v1/dept', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (18, 'p', 'developer', '/api/v1/dept', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (16, 'p', 'developer', '/api/v1/dept', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (20, 'p', 'developer', '/api/v1/dept/:id', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (17, 'p', 'developer', '/api/v1/dept/:id', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (21, 'p', 'developer', '/api/v1/dept/tree', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (23, 'p', 'developer', '/api/v1/menu', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (22, 'p', 'developer', '/api/v1/menu', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (25, 'p', 'developer', '/api/v1/menu/:menuId', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (24, 'p', 'developer', '/api/v1/menu/:menuId', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (30, 'p', 'developer', '/api/v1/role', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (29, 'p', 'developer', '/api/v1/role', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (27, 'p', 'developer', '/api/v1/role', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (31, 'p', 'developer', '/api/v1/role/:id', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (28, 'p', 'developer', '/api/v1/role/:id', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (33, 'p', 'developer', '/api/v1/role/auth/menu', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (32, 'p', 'developer', '/api/v1/role/status/change', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (15, 'p', 'developer', '/api/v1/sys-api', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (14, 'p', 'developer', '/api/v1/sys-api', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (12, 'p', 'developer', '/api/v1/sys-api', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (13, 'p', 'developer', '/api/v1/sys-api', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (37, 'p', 'developer', '/api/v1/sys-user', 'DELETE', '', '', '');
INSERT INTO `casbin_rule` VALUES (36, 'p', 'developer', '/api/v1/sys-user', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (34, 'p', 'developer', '/api/v1/sys-user', 'POST', '', '', '');
INSERT INTO `casbin_rule` VALUES (35, 'p', 'developer', '/api/v1/sys-user', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (38, 'p', 'developer', '/api/v1/sys-user/:id', 'GET', '', '', '');
INSERT INTO `casbin_rule` VALUES (39, 'p', 'developer', '/api/v1/sys-user/status/change', 'PUT', '', '', '');
INSERT INTO `casbin_rule` VALUES (40, 'p', 'developer', '/api/v1/user/pwd/reset', 'PUT', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for form_generate
-- ----------------------------
DROP TABLE IF EXISTS `form_generate`;
CREATE TABLE `form_generate` (
  `form_id` bigint NOT NULL AUTO_INCREMENT,
  `form_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `json_schema` text COLLATE utf8mb4_general_ci,
  `sort` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT '1' COMMENT '状态 1:正常 0 停用',
  `is_model` tinyint(1) DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`form_id`),
  KEY `idx_form_generate_update_by` (`update_by`),
  KEY `idx_form_generate_deleted_at` (`deleted_at`),
  KEY `idx_form_generate_create_by` (`create_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of form_generate
-- ----------------------------
BEGIN;
INSERT INTO `form_generate` VALUES (1, '部门-编辑表单', '{\"form\":{},\"schema\":{\"type\":\"object\",\"properties\":{\"usdwksmcz85\":{\"type\":\"string\",\"title\":\"Input\",\"x-decorator\":\"FormItem\",\"x-component\":\"Input\",\"x-designable-id\":\"usdwksmcz85\",\"x-index\":0},\"hz4ml3551v2\":{\"type\":\"string\",\"title\":\"TextArea\",\"x-decorator\":\"FormItem\",\"x-component\":\"Input.TextArea\",\"x-designable-id\":\"hz4ml3551v2\",\"x-index\":1}},\"x-designable-id\":\"op7m5wdmf68\"}}', 1, 1, 0, 0, 1, '2024-11-25 23:14:23.159', '2024-11-26 00:25:25.026', NULL);
INSERT INTO `form_generate` VALUES (2, '部门-编辑表单', '{\"form\":{},\"schema\":{\"type\":\"object\",\"properties\":{\"usdwksmcz85\":{\"type\":\"string\",\"title\":\"Input\",\"x-decorator\":\"FormItem\",\"x-component\":\"Input\",\"x-designable-id\":\"usdwksmcz85\",\"x-index\":0},\"hz4ml3551v2\":{\"type\":\"string\",\"title\":\"TextArea\",\"x-decorator\":\"FormItem\",\"x-component\":\"Input.TextArea\",\"x-designable-id\":\"hz4ml3551v2\",\"x-index\":1}},\"x-designable-id\":\"q7wlz2rpdnn\"}}', 1, 1, 1, 0, 1, '2024-11-26 00:25:29.866', '2024-11-26 00:26:08.267', NULL);
INSERT INTO `form_generate` VALUES (3, '部门-编辑表单00234456', '{\"form\":{\"labelCol\":6,\"wrapperCol\":12},\"schema\":{\"type\":\"object\",\"properties\":{\"usdwksmcz85\":{\"type\":\"string\",\"title\":\"Input\",\"x-decorator\":\"FormItem\",\"x-component\":\"Input\",\"x-designable-id\":\"usdwksmcz85\",\"x-index\":0},\"hz4ml3551v2\":{\"type\":\"string\",\"title\":\"TextArea\",\"x-decorator\":\"FormItem\",\"x-component\":\"Input.TextArea\",\"x-designable-id\":\"hz4ml3551v2\",\"x-index\":1}},\"x-designable-id\":\"12z0dzj2xha\"}}', 1, 1, 1, 0, 1, '2024-11-26 00:26:42.553', '2024-11-27 20:40:17.353', NULL);
COMMIT;

-- ----------------------------
-- Table structure for form_tools
-- ----------------------------
DROP TABLE IF EXISTS `form_tools`;
CREATE TABLE `form_tools` (
  `form_id` bigint NOT NULL AUTO_INCREMENT,
  `form_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `json_schema` text COLLATE utf8mb4_general_ci,
  `sort` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT '1' COMMENT '状态 1:正常 0 停用',
  `is_model` tinyint(1) DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`form_id`),
  KEY `idx_form_tools_deleted_at` (`deleted_at`),
  KEY `idx_form_tools_create_by` (`create_by`),
  KEY `idx_form_tools_update_by` (`update_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of form_tools
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE `sys_api` (
  `handle` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'handle',
  `title` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '标题',
  `path` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'api路径',
  `action` varchar(16) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '请求类型',
  `type` varchar(16) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '接口类型',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `api_group` varchar(191) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'api组',
  `method` varchar(16) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '接口类型POST|PUT|DELETE|GET',
  `api_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `remark` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  PRIMARY KEY (`api_id`),
  KEY `idx_sys_api_create_by` (`create_by`),
  KEY `idx_sys_api_update_by` (`update_by`),
  KEY `idx_sys_api_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_api
-- ----------------------------
BEGIN;
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/sys-api', NULL, NULL, '2024-05-25 19:18:10.335', '2024-05-25 21:30:36.831', NULL, 0, 1, 'api管理', 'POST', 1, '新增api');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/sys-api', NULL, NULL, '2024-05-25 21:18:47.839', '2024-05-25 21:18:47.839', NULL, 1, 0, 'api管理', 'PUT', 2, '修改api');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/sys-api', NULL, NULL, '2024-05-25 21:19:50.632', '2024-05-25 21:19:50.632', NULL, 1, 0, 'api管理', 'GET', 3, 'api分页列表');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/sys-api', NULL, NULL, '2024-05-25 21:20:34.105', '2024-05-25 21:46:27.829', NULL, 1, 1, 'api管理', 'DELETE', 4, '删除api');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/dept', NULL, NULL, '2024-05-25 21:42:51.694', '2024-05-25 21:42:51.694', NULL, 1, 0, '部门管理', 'POST', 5, '新增部门');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/dept/:id', NULL, NULL, '2024-05-25 21:43:44.100', '2024-05-25 21:43:44.100', NULL, 1, 0, '部门管理', 'PUT', 6, '修改部门');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/dept', NULL, NULL, '2024-05-25 21:44:42.743', '2024-05-25 21:44:42.743', NULL, 1, 0, '部门管理', 'GET', 7, '部门分页列表');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/dept', NULL, NULL, '2024-05-25 21:45:25.207', '2024-05-25 21:45:25.207', NULL, 1, 0, '部门管理', 'DELETE', 8, '删除部门');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/dept/:id', NULL, NULL, '2024-05-25 21:46:12.399', '2024-05-25 21:46:12.399', NULL, 1, 0, '部门管理', 'GET', 9, '查询部门详细');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/dept/tree', NULL, NULL, '2024-05-25 21:47:35.945', '2024-05-25 21:47:35.945', NULL, 1, 0, '部门管理', 'GET', 10, '查询部门树结构数据');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/menu', NULL, NULL, '2024-05-25 21:48:49.052', '2024-05-25 21:48:49.052', NULL, 1, 0, '菜单管理', 'POST', 11, '创建菜单');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/menu', NULL, NULL, '2024-05-25 21:49:44.425', '2024-05-25 21:49:44.425', NULL, 1, 0, '菜单管理', 'GET', 12, '菜单分页列表');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/menu/:menuId', NULL, NULL, '2024-05-25 21:52:22.848', '2024-05-25 21:52:22.848', NULL, 1, 0, '菜单管理', 'PUT', 13, '修改菜单');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/menu/:menuId', NULL, NULL, '2024-05-25 21:53:18.480', '2024-05-25 21:53:18.480', NULL, 1, 0, '菜单管理', 'GET', 14, '查询菜单详细');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v/menu', NULL, NULL, '2024-05-25 21:53:51.963', '2024-05-25 21:53:51.963', NULL, 1, 0, '菜单管理', 'DELETE', 15, '删除菜单');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/role', NULL, NULL, '2024-05-25 22:28:44.637', '2024-05-25 22:28:44.637', NULL, 1, 0, '角色管理', 'POST', 16, '新建角色');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/role/:id', NULL, NULL, '2024-05-25 22:29:45.243', '2024-05-25 22:29:45.243', NULL, 1, 0, '角色管理', 'PUT', 17, '修改角色');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/role', NULL, NULL, '2024-05-25 22:30:13.726', '2024-05-25 22:30:13.726', NULL, 1, 0, '角色管理', 'GET', 18, '角色分页列表');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/role', NULL, NULL, '2024-05-25 22:30:44.589', '2024-05-25 22:30:44.589', NULL, 1, 0, '角色管理', 'DELETE', 19, '删除角色');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/role/:id', NULL, NULL, '2024-05-25 22:31:30.864', '2024-05-25 22:31:30.864', NULL, 1, 0, '角色管理', 'GET', 20, '查询角色详细信息');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/role/status/change', NULL, NULL, '2024-05-25 22:33:04.858', '2024-05-25 22:33:04.858', NULL, 1, 0, '角色管理', 'PUT', 21, '修改角色状态');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/role/auth/menu', NULL, NULL, '2024-05-25 22:41:34.147', '2024-05-25 22:41:34.147', NULL, 1, 0, '角色管理', 'PUT', 22, '修改角色的菜单权限');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/sys-user', NULL, NULL, '2024-05-25 22:44:59.763', '2024-05-25 22:44:59.763', NULL, 1, 0, '用户管理', 'POST', 23, '新建用户');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/sys-user', NULL, NULL, '2024-05-25 22:45:36.371', '2024-05-25 22:45:36.371', NULL, 1, 0, '用户管理', 'PUT', 24, '修改用户信息');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/sys-user', NULL, NULL, '2024-05-25 22:46:07.034', '2024-05-25 22:46:07.034', NULL, 1, 0, '用户管理', 'GET', 25, '用户分页列表');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/sys-user', NULL, NULL, '2024-05-25 23:07:02.736', '2024-05-25 23:07:02.736', NULL, 1, 0, '用户管理', 'DELETE', 26, '删除用户');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/sys-user/:id', NULL, NULL, '2024-05-25 23:07:33.999', '2024-05-25 23:07:33.999', NULL, 1, 0, '用户管理', 'GET', 27, '用户详细');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/sys-user/status/change', NULL, NULL, '2024-05-25 23:08:12.706', '2024-05-25 23:08:12.706', NULL, 1, 0, '用户管理', 'PUT', 28, '修改用户状态');
INSERT INTO `sys_api` VALUES (NULL, NULL, '/api/v1/user/pwd/reset', NULL, NULL, '2024-05-25 23:08:51.334', '2024-05-25 23:08:51.334', NULL, 1, 0, '用户管理', 'PUT', 29, '重置密码');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL,
  `dept_path` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `dept_name` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL,
  `sort` tinyint DEFAULT NULL,
  `leader` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4  DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4  DEFAULT NULL,
  `status` tinyint DEFAULT NULL COMMENT '状态 1:正常 0 停用',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`),
  KEY `idx_sys_dept_create_by` (`create_by`),
  KEY `idx_sys_dept_update_by` (`update_by`),
  KEY `idx_sys_dept_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, 0, '/0/1/', '组织机构', 1, '', '', '', 1, 0, 1, '2024-05-14 00:03:10.208', '2024-05-28 22:47:15.630', NULL);
INSERT INTO `sys_dept` VALUES (2, 1, '', '北京分公司', 1, '', '', '', 1, 0, 1, '2024-05-14 21:55:27.390', '2024-05-14 22:50:36.471', '2024-05-14 22:54:42.301');
INSERT INTO `sys_dept` VALUES (3, 1, '/0/1/3/', '武汉分公司', 2, '', '', '', 1, 0, 1, '2024-05-14 21:56:20.846', '2024-05-28 22:47:50.221', NULL);
INSERT INTO `sys_dept` VALUES (4, 1, '/0/1/4/', '成都分公司', 5, '', '', '', 1, 0, 1, '2024-05-14 22:04:18.174', '2024-05-28 22:48:04.582', NULL);
INSERT INTO `sys_dept` VALUES (5, 1, '/0/1/5/', '深圳分公司', 4, '', '', '', 1, 0, 1, '2024-05-14 22:07:25.836', '2024-05-28 22:48:02.075', NULL);
INSERT INTO `sys_dept` VALUES (6, 1, '/0/1/6/', '北京总公司', 1, '', '', '', 1, 0, 1, '2024-05-14 22:51:20.561', '2024-05-28 22:47:19.540', NULL);
INSERT INTO `sys_dept` VALUES (7, 1, '/0/1/7/', '上海分公司', 3, '', '', '', 1, 0, 1, '2024-05-14 22:52:20.446', '2024-05-28 22:47:57.857', NULL);
INSERT INTO `sys_dept` VALUES (8, 6, '/0/1/6/8/', '研发部', 3, '', '', '', 1, 0, 1, '2024-05-14 23:01:41.475', '2024-06-03 23:39:55.461', NULL);
INSERT INTO `sys_dept` VALUES (9, 6, '/0/1/6/9/', '市场部', 4, '', '', '', 1, 0, 1, '2024-05-14 23:01:54.538', '2024-06-03 23:39:55.461', NULL);
INSERT INTO `sys_dept` VALUES (10, 6, '/0/1/6/10/', '财务部', 2, '', '', '', 1, 0, 1, '2024-05-14 23:02:14.266', '2024-05-28 22:47:35.710', NULL);
INSERT INTO `sys_dept` VALUES (11, 6, '/0/1/6/11/', '运营部', 6, '', '', '', 1, 0, 1, '2024-05-14 23:02:22.820', '2024-05-28 22:47:44.663', NULL);
INSERT INTO `sys_dept` VALUES (12, 3, '/0/1/3/12/', '研发部', 1, '', '', '', 1, 0, 1, '2024-05-15 20:50:17.423', '2024-05-28 22:47:53.898', NULL);
INSERT INTO `sys_dept` VALUES (13, 6, '/0/1/6/13/', '人力资源', 5, '', '', '', 1, 0, 1, '2024-05-15 20:50:32.452', '2024-05-28 22:47:42.163', NULL);
INSERT INTO `sys_dept` VALUES (14, 6, '/0/1/6/14/', '销售部', 1, '张三', '', '', 1, 0, 1, '2024-05-15 20:50:54.289', '2024-05-28 22:47:33.293', NULL);
INSERT INTO `sys_dept` VALUES (15, 7, '/0/1/7/15/', '人力资源', 1, '', '', '', 1, 0, 1, '2024-05-15 20:52:31.008', '2024-05-28 22:47:59.982', NULL);
INSERT INTO `sys_dept` VALUES (16, 5, '/0/1/5/16/', '人力资源', 1, '', '', '', 1, 0, 1, '2024-05-15 20:52:39.253', '2024-05-28 22:48:08.312', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '菜单名称',
  `title` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL,
  `icon` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL,
  `paths` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL,
  `menu_type` varchar(1) CHARACTER SET utf8mb4 DEFAULT NULL,
  `action` varchar(16) CHARACTER SET utf8mb4  DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `parent_id` smallint DEFAULT NULL,
  `no_cache` tinyint(1) DEFAULT '1' COMMENT '是否禁用页面缓存',
  `breadcrumb` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `sort` tinyint DEFAULT NULL COMMENT '显示排序',
  `visible` varchar(1) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '菜单状态，1:显示 0:隐藏',
  `is_frame` varchar(1) CHARACTER SET utf8mb4  DEFAULT '0',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `status` varchar(1) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '菜单状态，1:正常 0:停用',
  `view_type` varchar(1) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '试图类型，1:普通页面 2:外链页面 3:内嵌页面',
  `is_internally` varchar(1) CHARACTER SET utf8mb4  DEFAULT '0' COMMENT '是否是系统内置数据，内置数据不可删除',
  `link_url` varchar(255)  DEFAULT NULL COMMENT '内嵌、外链地址',
  `has_layout` varchar(1)  DEFAULT '1' COMMENT '是否使用layout',
  PRIMARY KEY (`menu_id`),
  KEY `idx_sys_menu_create_by` (`create_by`),
  KEY `idx_sys_menu_update_by` (`update_by`),
  KEY `idx_sys_menu_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (18, '系统管理', '', 'icon-park-outline:config', 'system', '/0/18', 'M', '', '', 0, 1, '', '', 2, '1', '0', 0, 1, '2024-05-05 16:02:46.396', '2024-06-04 20:20:26.292', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (19, '菜单嵌套', '', 'icon-park-outline:application-menu', 'menu', '/0/19', 'M', '', '', 0, 1, '', '', 3, '1', '0', 0, 1, '2024-05-05 16:03:11.659', '2024-05-29 23:30:10.037', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (20, '用户管理', '', 'icon-park-outline:every-user', 'user', '/0/18/20', 'C', '', '', 18, 1, '', '/views/system/user/index', 1, '1', '0', 0, 1, '2024-05-05 16:03:44.708', '2024-06-04 20:20:26.292', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (21, '角色管理', '', 'icon-park-outline:permissions', 'role', '/0/18/21', 'C', '', '', 18, 1, '', '/views/system/role/index', 2, '1', '0', 0, 1, '2024-05-05 16:04:10.925', '2024-06-04 20:20:26.292', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (22, '部门管理', '', 'icon-park-outline:network-tree', 'dept', '/0/18/22', 'C', '', '', 18, 1, '', '/views/system/dept/index', 4, '1', '0', 0, 1, '2024-05-05 16:04:26.806', '2024-06-04 20:20:26.292', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (23, '菜单管理', '', 'ant-design:menu-unfold-outlined', 'menu', '/0/18/23', 'C', '', '', 18, 1, '', '/views/system/menu/index', 3, '1', '0', 0, 1, '2024-05-05 16:04:36.635', '2024-06-04 20:20:26.292', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (24, 'menu-1', '', '', 'menu1', '/0/19/24', 'M', '', '', 19, 1, '', '', 0, '1', '0', 0, 1, '2024-05-05 16:23:24.700', '2024-05-29 23:30:10.037', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (25, 'menu-1-1', '', '', 'menu11', '/0/19/24/25', 'C', '', '', 24, 1, '', '/views/menu/menu1/menu11/index', 0, '1', '0', 1, 0, '2024-05-05 16:24:35.741', '2024-06-03 23:54:29.711', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (26, 'menu-1-2', '', '', 'menu12', '/0/19/24/26', 'M', '', '', 24, 1, '', '', 0, '1', '0', 1, 0, '2024-05-05 16:25:07.413', '2024-05-29 23:30:10.037', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (27, 'menu-1-3', '', '', 'menu13', '/0/19/24/27', 'C', '', '', 24, 1, '', '/views/menu/menu1/menu13/index', 0, '1', '0', 1, 0, '2024-05-05 16:25:46.664', '2024-06-03 23:54:29.711', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (28, 'menu-1-2-1', '', '', 'menu121', '/0/19/24/26/28', 'C', '', '', 26, 1, '', '/views/menu/menu1/menu12/menu121/index', 0, '1', '0', 1, 0, '2024-05-05 16:26:44.619', '2024-06-03 23:54:29.711', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (29, 'menu-1-2-2', '', '', 'menu122', '/0/19/24/26/29', 'C', '', '', 26, 1, '', '/views/menu/menu1/menu12/menu122/index', 0, '1', '0', 1, 0, '2024-05-05 16:27:28.544', '2024-06-03 23:54:29.711', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (31, '首页', '', 'ant-design:home-outlined', 'home', '/0/31', 'C', '', '', 0, 1, '', '/views/home/index', 1, '1', '0', 0, 1, '2024-05-08 20:07:13.291', '2024-06-05 20:50:22.893', NULL, '1', '1', '0', '', '1');
INSERT INTO `sys_menu` VALUES (32, '详情', '', '', '', '/0/18/23/32', 'F', '', 'system:menu:query', 23, 1, '', '', 1, '', '0', 0, 1, '2024-05-09 21:41:03.705', '2024-06-04 20:20:26.292', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (33, '新增', '', '', '', '/0/18/23/33', 'F', '', 'system:menu:add', 23, 1, '', '', 2, '', '0', 0, 1, '2024-05-09 21:53:03.048', '2024-06-03 23:54:29.711', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (34, '修改', '', '', '', '/0/18/23/34', 'F', '', 'system:menu:update', 23, 1, '', '', 3, '', '0', 0, 1, '2024-05-09 21:53:23.389', '2024-06-03 23:54:29.711', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (35, '删除', '', '', '', '/0/18/23/35', 'F', '', 'system:menu:delete', 23, 1, '', '', 4, '', '0', 0, 1, '2024-05-09 21:53:43.256', '2024-06-03 23:54:29.711', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (36, 'api管理', '', 'icon-park-outline:api', 'api', '/0/18/36', 'C', '', '', 18, 1, '', '/views/system/api/index', 5, '1', '0', 0, 1, '2024-05-24 21:07:39.431', '2024-06-04 20:20:26.292', NULL, '1', '1', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (37, '详情', '', '', '', '/0/18/20/37', 'F', '', 'system:user:query', 20, 1, '', '', 1, '', '0', 1, 0, '2024-06-04 08:28:19.715', '2024-06-04 20:20:26.292', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (38, '编辑', '', '', '', '/0/18/20/38', 'F', '', 'system:user:edit', 20, 1, '', '', 2, '', '0', 1, 0, '2024-06-04 08:28:43.684', '2024-06-04 08:28:43.685', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (39, '删除', '', '', '', '/0/18/20/39', 'F', '', 'system:user:delete', 20, 1, '', '', 3, '', '0', 1, 0, '2024-06-04 08:28:58.593', '2024-06-04 08:28:58.594', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (40, '新增', '', '', '', '/0/18/20/40', 'F', '', 'system:user:add', 20, 1, '', '', 4, '', '0', 1, 0, '2024-06-04 08:29:50.463', '2024-06-04 08:29:50.464', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (41, '重置密码', '', '', '', '/0/18/20/41', 'F', '', 'system:user:restpwd', 20, 1, '', '', 4, '', '0', 1, 0, '2024-06-04 08:30:24.477', '2024-06-04 20:20:26.292', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (42, '新增', '', '', '', '/0/18/21/42', 'F', '', 'system:role:add', 21, 1, '', '', 1, '', '0', 1, 0, '2024-06-04 08:32:10.227', '2024-06-04 08:32:10.234', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (43, '编辑', '', '', '', '/0/18/21/43', 'F', '', 'system:role:edit', 21, 1, '', '', 2, '', '0', 1, 0, '2024-06-04 08:32:40.226', '2024-06-04 08:32:40.227', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (44, '删除', '', '', '', '/0/18/21/44', 'F', '', 'system:role:delete', 21, 1, '', '', 3, '', '0', 1, 0, '2024-06-04 08:33:08.812', '2024-06-04 08:33:08.826', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (45, '详情', '', '', '', '/0/18/21/45', 'F', '', 'system:role:query', 21, 1, '', '', 4, '', '0', 1, 0, '2024-06-04 08:33:42.989', '2024-06-04 20:20:26.292', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (46, '权限分配', '', '', '', '/0/18/21/46', 'F', '', 'system:role:auth', 21, 1, '', '', 5, '', '0', 1, 0, '2024-06-04 08:34:20.320', '2024-06-04 08:34:20.323', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (47, '新增', '', '', '', '/0/18/22/47', 'F', '', 'system:dept:add', 22, 1, '', '', 1, '', '0', 1, 0, '2024-06-04 20:14:11.538', '2024-06-04 20:14:11.541', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (48, '编辑', '', '', '', '/0/18/22/48', 'F', '', 'system:dept:edit', 22, 1, '', '', 2, '', '0', 1, 0, '2024-06-04 20:14:34.784', '2024-06-04 20:14:34.788', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (49, '删除', '', '', '', '/0/18/22/49', 'F', '', 'system:dept:delete', 22, 1, '', '', 3, '', '0', 1, 0, '2024-06-04 20:14:55.054', '2024-06-04 20:14:55.057', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (50, '详情', '', '', '', '/0/18/22/50', 'F', '', 'system:dept:query', 22, 1, '', '', 4, '', '0', 0, 1, '2024-06-04 20:15:13.984', '2024-06-04 20:20:26.292', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (51, '新增', '', '', '', '/0/18/36/51', 'F', '', 'system:api:add', 36, 1, '', '', 1, '', '0', 1, 0, '2024-06-04 20:18:27.446', '2024-06-04 20:18:27.451', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (52, '编辑', '', '', '', '/0/18/36/52', 'F', '', 'system:api:edit', 36, 1, '', '', 2, '', '0', 1, 0, '2024-06-04 20:18:49.751', '2024-06-04 20:18:49.752', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (53, '删除', '', '', '', '/0/18/36/53', 'F', '', 'system:api:delete', 36, 1, '', '', 3, '', '0', 1, 0, '2024-06-04 20:19:10.396', '2024-06-04 20:19:10.404', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (54, '详情', '', '', '', '/0/18/36/54', 'F', '', 'system:api:query', 36, 1, '', '', 4, '', '0', 1, 0, '2024-06-04 20:19:26.625', '2024-06-04 20:20:26.292', NULL, '1', '', '0', NULL, '1');
INSERT INTO `sys_menu` VALUES (55, '外链', '', 'ant-design:aim-outlined', 'http://www.baidu.com', '/0/55', 'C', '', '', 0, 1, '', '', 4, '1', '0', 0, 1, '2024-06-04 23:52:46.784', '2024-06-05 00:10:55.825', NULL, '1', '2', '0', 'http://www.baidu.com', '1');
INSERT INTO `sys_menu` VALUES (56, 'page1', '', 'ant-design:account-book-outlined', 'dataScreen', '/0/56', 'C', '', '', 58, 1, '', '/views/screen/page1/index', 5, '0', '0', 0, 1, '2024-06-05 20:35:44.349', '2024-06-07 20:04:50.201', NULL, '1', '1', '0', '', '0');
INSERT INTO `sys_menu` VALUES (57, '数据大屏', '', 'ant-design:fund-projection-screen-outlined', 'dataScreen', '/0/57', 'C', '', '', 0, 1, '', '', 6, '1', '0', 0, 1, '2024-06-05 21:10:53.941', '2024-06-07 20:59:06.205', NULL, '1', '2', '0', '/noLayout/dataScreen', '1');
INSERT INTO `sys_menu` VALUES (58, 'noLayout', '', '', 'noLayout', '/0/58', 'M', '', '', 0, 1, '', '', 6, '0', '0', 0, 1, '2024-06-05 23:09:07.262', '2024-06-05 23:09:58.049', NULL, '1', '1', '0', '', '0');
INSERT INTO `sys_menu` VALUES (59, '内嵌页面一', '', '', 'iframeOne', '/0/59', 'C', '', '', 0, 0, '', '', 6, '1', '0', 0, 1, '2024-06-07 20:57:39.621', '2024-06-07 21:45:50.490', NULL, '1', '3', '0', 'https://nodejs.org/zh-cn/', '1');
INSERT INTO `sys_menu` VALUES (60, '内嵌页面二', '', '', 'iframeTwo', '/0/60', 'C', '', '', 0, 0, '', '', 7, '1', '0', 0, 1, '2024-06-07 20:58:15.761', '2024-07-07 22:59:33.382', NULL, '1', '3', '0', 'system/dept', '1');
INSERT INTO `sys_menu` VALUES (61, '系统工具', '', 'icon-park-outline:toolkit', 'tool', '/0/61', 'M', '', '', 0, 1, '', '', 10, '1', '0', 0, 1, '2024-11-20 23:27:22.940', '2024-11-20 23:28:05.532', NULL, '1', '1', '0', '', '1');
INSERT INTO `sys_menu` VALUES (62, '表单生成器', '', 'icon-park-outline:form', 'form', '/0/61/62', 'M', '', '', 61, 1, '', '', 1, '1', '0', 0, 1, '2024-11-20 23:34:40.359', '2024-11-21 23:46:02.697', NULL, '1', '1', '0', '', '1');
INSERT INTO `sys_menu` VALUES (63, '创建表单', '', 'icon-park-outline:form-one', 'add', '/0/61/62/63', 'C', '', '', 62, 1, '', '/views/tool/form/views/edit/index', 3, '0', '0', 0, 1, '2024-11-21 00:51:24.701', '2024-11-27 20:02:58.251', NULL, '1', '1', '0', 'http://localhost:5174/tool/form/add', '0');
INSERT INTO `sys_menu` VALUES (64, '编辑表单', '', 'icon-park-outline:form-one', 'edit/:id', '/0/61/62/64', 'C', '', '', 62, 1, '', '/views/tool/form/views/edit/index', 2, '0', '0', 0, 1, '2024-11-21 00:54:02.886', '2024-11-27 20:28:28.023', NULL, '1', '1', '0', '', '0');
INSERT INTO `sys_menu` VALUES (65, '表单生成器', '', 'icon-park-outline:form', 'list', '/0/61/62/65', 'C', '', '', 62, 0, '', '/views/tool/form/index', 1, '0', '0', 0, 1, '2024-11-21 21:26:04.188', '2024-11-21 23:03:15.221', NULL, '1', '1', '0', '', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu_api_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_api_rule`;
CREATE TABLE `sys_menu_api_rule` (
  `sys_menu_menu_id` bigint NOT NULL,
  `sys_api_api_id` bigint unsigned NOT NULL COMMENT '主键编码',
  PRIMARY KEY (`sys_menu_menu_id`,`sys_api_api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_menu_api_rule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT,
  `post_name` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL,
  `post_code` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL,
  `sort` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`),
  KEY `idx_sys_post_create_by` (`create_by`),
  KEY `idx_sys_post_update_by` (`update_by`),
  KEY `idx_sys_post_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(191) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '角色名',
  `status` varchar(4) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '状态 0禁用 1正常',
  `remark` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `data_scope` varchar(128) CHARACTER SET utf8mb4  DEFAULT '1',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `role_code` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL,
  `sort` bigint DEFAULT NULL,
  `default_router` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `idx_sys_role_create_by` (`create_by`),
  KEY `idx_sys_role_update_by` (`update_by`),
  KEY `idx_sys_role_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '系统管理员', '1', '', 0, '1', 1, 0, '2024-05-17 23:05:13.672', '2024-05-17 23:05:13.672', NULL, 'admin', 1, '/home');
INSERT INTO `sys_role` VALUES (2, '普通用户', '1', '', 0, '1', 0, 1, '2024-05-17 23:33:35.387', '2024-06-04 20:21:27.999', NULL, 'common', 3, '/home');
INSERT INTO `sys_role` VALUES (3, '开发者', '1', '', 0, '1', 0, 1, '2024-05-17 23:35:35.162', '2024-06-03 23:54:29.710', NULL, 'developer', 4, '/home');
INSERT INTO `sys_role` VALUES (4, '安全管理员', '1', '', 0, '1', 0, 1, '2024-05-18 12:50:47.000', '2024-06-03 23:54:39.779', NULL, 'security', 2, '/system/role');
INSERT INTO `sys_role` VALUES (5, '测试员', '1', '', 0, '1', 1, 0, '2024-05-18 12:59:56.689', '2024-05-18 12:59:56.689', '2024-05-18 13:01:30.703', 'test', 1, NULL);
INSERT INTO `sys_role` VALUES (6, '测试员', '1', '', 0, '1', 0, 1, '2024-05-18 13:01:45.311', '2024-06-03 23:54:35.741', NULL, 'test', 6, '/home');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint unsigned NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint unsigned NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 18);
INSERT INTO `sys_role_menu` VALUES (2, 20);
INSERT INTO `sys_role_menu` VALUES (2, 21);
INSERT INTO `sys_role_menu` VALUES (2, 22);
INSERT INTO `sys_role_menu` VALUES (2, 23);
INSERT INTO `sys_role_menu` VALUES (2, 31);
INSERT INTO `sys_role_menu` VALUES (2, 32);
INSERT INTO `sys_role_menu` VALUES (2, 36);
INSERT INTO `sys_role_menu` VALUES (2, 37);
INSERT INTO `sys_role_menu` VALUES (2, 41);
INSERT INTO `sys_role_menu` VALUES (2, 45);
INSERT INTO `sys_role_menu` VALUES (2, 50);
INSERT INTO `sys_role_menu` VALUES (2, 54);
INSERT INTO `sys_role_menu` VALUES (3, 20);
INSERT INTO `sys_role_menu` VALUES (3, 21);
INSERT INTO `sys_role_menu` VALUES (3, 22);
INSERT INTO `sys_role_menu` VALUES (3, 25);
INSERT INTO `sys_role_menu` VALUES (3, 27);
INSERT INTO `sys_role_menu` VALUES (3, 28);
INSERT INTO `sys_role_menu` VALUES (3, 29);
INSERT INTO `sys_role_menu` VALUES (3, 31);
INSERT INTO `sys_role_menu` VALUES (3, 32);
INSERT INTO `sys_role_menu` VALUES (3, 33);
INSERT INTO `sys_role_menu` VALUES (3, 34);
INSERT INTO `sys_role_menu` VALUES (3, 35);
INSERT INTO `sys_role_menu` VALUES (3, 36);
INSERT INTO `sys_role_menu` VALUES (4, 21);
INSERT INTO `sys_role_menu` VALUES (6, 31);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编码',
  `password` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录密码',
  `salt` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '加盐',
  `nick_name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '系统用户' COMMENT '用户昵称',
  `sex` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `avatar` varchar(191) COLLATE utf8mb4_general_ci DEFAULT 'https://pic.qianxun.shop/i/2024/03/29/66059924431c9.webp' COMMENT '用户头像',
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `status` varchar(191) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '用户是否被冻结 1正常 0冻结',
  `role_id` mediumint DEFAULT NULL COMMENT '角色ID',
  `dept_id` mediumint DEFAULT NULL COMMENT '部门',
  `post_id` mediumint DEFAULT NULL COMMENT '岗位',
  `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  `user_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户登录名',
  `internal` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为系统内置数据',
  `editable` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否可编辑，为了保证系统安全，一些内置数据禁止编辑和删除',
  PRIMARY KEY (`user_id`),
  KEY `idx_sys_user_create_by` (`create_by`),
  KEY `idx_sys_user_update_by` (`update_by`),
  KEY `idx_sys_user_deleted_at` (`deleted_at`),
  KEY `idx_sys_user_user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, '$2a$10$0GXVLaqxyrzqMfjooIPaeuvHQX0A2TA5vwjUJRrsG0uJtsTSu8Ci.', '', '千寻', '', 'https://pic.qianxun.shop/i/2024/03/29/66059924431c9.webp', '15812341234', 'sql668@qianxun.com', '1', 1, 1, 0, '', 1, 0, '2024-05-19 15:26:48.881', '2024-05-19 15:26:48.881', NULL, 'admin', NULL, '0');
INSERT INTO `sys_user` VALUES (2, '$2a$10$5DuTJR8IKPHDT1SflJmpS.Y.OrncDype1u3/GtFPgf2WpS2JjMLri', '', '普通用户', '1', 'https://pic.qianxun.shop/i/2024/03/29/66059924431c9.webp', '15812341235', 'xxx@123.com', '1', 2, 1, 0, '', 1, 0, '2024-05-19 15:28:17.475', '2024-05-20 23:53:00.980', NULL, 'sql', NULL, NULL);
INSERT INTO `sys_user` VALUES (3, '$2a$10$LDlzEv/3Tg6qaVd2iG1m7uZ1hpmsYM9z.XTGfh29ANDWvuucr3ztO', '', '普通用户2', '1', 'https://pic.qianxun.shop/i/2024/03/29/66059924431c9.webp', '15912229876', '', '1', 2, 4, 0, '', 0, 1, '2024-05-20 21:58:49.233', '2024-07-07 23:13:29.798', NULL, 'user2', NULL, '');
INSERT INTO `sys_user` VALUES (4, '$2a$10$d1O1uNnVp3LyWj11MBK7lOCikZFCZA/T.8rWaBRN/0bj80DMFVJVq', '', '普通用户', '1', 'https://pic.qianxun.shop/i/2024/03/29/66059924431c9.webp', '', '', '1', 2, 6, 0, '', 1, 0, '2024-07-07 23:13:05.591', '2024-07-07 23:13:05.591', NULL, 'user1', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_users
-- ----------------------------
DROP TABLE IF EXISTS `sys_users`;
CREATE TABLE `sys_users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编码',
  `username` varchar(191) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '用户登录名',
  `password` varchar(191) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '用户登录密码',
  `salt` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '加盐',
  `nick_name` varchar(128) CHARACTER SET utf8mb4  DEFAULT '系统用户' COMMENT '用户昵称',
  `sex` varchar(10) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '性别',
  `avatar` varchar(191) CHARACTER SET utf8mb4  DEFAULT 'https://pic.qianxun.shop/i/2024/03/29/66059924431c9.webp' COMMENT '用户头像',
  `phone` varchar(11) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '用户手机号',
  `email` varchar(128) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '用户邮箱',
  `status` varchar(191) CHARACTER SET utf8mb4  DEFAULT '1' COMMENT '用户是否被冻结 1正常 0冻结',
  `role_id` mediumint DEFAULT NULL COMMENT '角色ID',
  `dept_id` mediumint DEFAULT NULL COMMENT '部门',
  `post_id` mediumint DEFAULT NULL COMMENT '岗位',
  `remark` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '备注',
  `create_by` bigint DEFAULT NULL COMMENT '创建者',
  `update_by` bigint DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`user_id`),
  KEY `idx_sys_users_username` (`username`),
  KEY `idx_sys_users_create_by` (`create_by`),
  KEY `idx_sys_users_update_by` (`update_by`),
  KEY `idx_sys_users_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sys_users
-- ----------------------------
BEGIN;
INSERT INTO `sys_users` VALUES (1, 'admin', '$2a$10$1q4t9Ooue.T1gH1PuQmx.etuwRLHfw4/yK/NQX7RsobA/.WyDeuBW', '', '系统管理员', '', 'https://pic.qianxun.shop/i/2024/03/29/66059924431c9.webp', '15888888888', 'admin@123.com', '1', 0, 1, 0, '', 1, 0, '2024-03-30 01:24:02.872', '2024-03-30 01:24:02.872', NULL);
INSERT INTO `sys_users` VALUES (2, 'user1', '$2a$10$ZQ72BwtxOLR12b.ybCF/LeUA.09p.eeMC0KwIesNXEd2P5gAShRQC', '', '普通用户', '', 'https://pic.qianxun.shop/i/2024/03/29/66059924431c9.webp', '15888888888', 'user@123.com', '0', 0, 1, 0, '', 1, 0, '2024-03-30 01:25:46.103', '2024-03-30 01:25:46.103', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
