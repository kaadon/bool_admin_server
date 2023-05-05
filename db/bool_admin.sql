/*
 Navicat Premium Data Transfer

 Source Server         : bool_admin后台
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : 203.210.16.94:3306
 Source Schema         : bool_admin

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 05/05/2023 18:27:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qu_example_category
-- ----------------------------
DROP TABLE IF EXISTS `qu_example_category`;
CREATE TABLE `qu_example_category` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `weigh` int(9) DEFAULT '0' COMMENT '排序',
  `status` int(9) DEFAULT '0' COMMENT '状态值(select):0=禁用,1=正常',
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qu_example_category
-- ----------------------------
BEGIN;
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (1, '测试分类', '1', 0, 0, '这个是标题1');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (2, '分类2', '2', 0, 0, '测试标题612');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (3, '分类3', '3', 0, 0, '测试标题63');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (4, '分类4', '4', 0, 0, '测试标题64');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (5, '分类5', '5', 0, 0, '测试标题65');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (6, '测试分类6', '1', 0, 0, '测试标题65');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (7, '分类7', '2', 0, 0, '测试标题76');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (8, '分类8', '6', 0, 0, '测试标题87');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (9, '分类9', '7', 0, 0, '测试标题98');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (10, '分类10', '8', 0, 0, '测试标题10');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (11, '测试分类6', '1', 0, 0, '测试标题11');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (12, '分类7', '2', 0, 0, '测试标题12');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (13, '分类8', '9', 0, 0, '测试标题13');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (14, '分类9', '10', 0, 0, '测试标题14');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (15, '分类10', '11', 0, 0, '测试标题150');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (16, '测试分类6', '1', 0, 0, '测试标题16');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (17, '分类7', '2', 0, 0, '测试标题17');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (18, '分类8', '12', 0, 0, '测试标题18');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (19, '分类9', '13', 0, 0, '测试标题19');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (20, '分类10', '14', 0, 0, '测试标题20');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (21, '测试分类6', '1', 0, 0, '测试标题21');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (22, '分类7', '2', 0, 0, '测试标题22');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (23, '分类8', '15', 0, 0, '测试标题23');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (24, '分类9', '16', 0, 0, '测试标题24');
INSERT INTO `qu_example_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (25, '分类10', '17', 0, 0, '测试标题250');
COMMIT;

-- ----------------------------
-- Table structure for qu_example_demo
-- ----------------------------
DROP TABLE IF EXISTS `qu_example_demo`;
CREATE TABLE `qu_example_demo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `week` int(10) NOT NULL DEFAULT '3' COMMENT '星期(select单选):1=星期一,2=星期二,3=星期三',
  `flag` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标志(select多选):1=热门,2=最新,3=推荐',
  `genderdata` int(10) NOT NULL DEFAULT '3' COMMENT '性别(单选):1=男,2=女,3=未知',
  `actdata` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '活动(多选):1=徒步,2=读书会,3=自驾游',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `keywords` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '描述',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `images` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '附件',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省市',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `startdate` int(10) DEFAULT NULL COMMENT '开始日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关1开0：关',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常',
  `category_id` int(11) DEFAULT NULL COMMENT '分类',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '111',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='案例表';

-- ----------------------------
-- Records of qu_example_demo
-- ----------------------------
BEGIN;
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `create_time`, `update_time`, `weigh`, `switch`, `status`, `category_id`, `name`) VALUES (1, 1, '2,1,3', 1, '', '完整表单案例1', '<p>完整表单案例1</p>', '完整表单案例1', '完整表单案例1', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', '北京市,市辖区,东城区', 0.70, 1639642410, NULL, '2022-04-29 16:06:32', 3, 1, 1, 2, '111');
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `create_time`, `update_time`, `weigh`, `switch`, `status`, `category_id`, `name`) VALUES (8, 2, '3', 3, '1,3', '完整表单案例2', '<p>完整表单案例2</p>', '完整表单案例2', '完整表单案例2', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', 'http://api.njyyc.cn/storage/system/20210908/9e754e13af52a7f41ff98e1002258f5a.txt', '江苏省,南京市,市辖区', 0.10, 1640880000, NULL, '2022-04-29 16:07:54', 10, 1, 1, 3, '111');
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `create_time`, `update_time`, `weigh`, `switch`, `status`, `category_id`, `name`) VALUES (10, 3, '1,2', 2, '1', '完整表单案例3', '<p>完整表单案例3</p>', '完整表单案例3', '完整表单案例3', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', '山西省,大同市,新荣区', 0.00, 1650643200, NULL, '2022-05-05 15:48:24', 50, 1, 2, 3, '111');
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `create_time`, `update_time`, `weigh`, `switch`, `status`, `category_id`, `name`) VALUES (14, 4, '3', 1, '1,2', '完整表单案例4', '<p>完整表单案例4</p>', '完整表单案例4', '完整表单案例4', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', '', '江苏省,无锡市,锡山区', 0.00, 1643212800, NULL, '2022-05-02 14:41:52', 0, 0, 1, 4, '111');
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `create_time`, `update_time`, `weigh`, `switch`, `status`, `category_id`, `name`) VALUES (53, 5, NULL, 3, NULL, '完整表单案例5', '<p>完整表单案例5</p>', '完整表单案例5', '完整表单案例5', '', '', '', '北京市,市辖区,西城区', 0.20, 1649779200, '2022-02-25 17:30:31', '2022-04-29 16:14:40', 0, 0, 1, 5, '111');
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `create_time`, `update_time`, `weigh`, `switch`, `status`, `category_id`, `name`) VALUES (54, 3, NULL, 3, NULL, '234234324', '<p>234234234234234234234</p>', '111233', '', '', '', '', '山西省,阳泉市,城区', 0.00, NULL, '2022-04-12 11:10:10', '2022-04-29 10:18:57', 0, 0, 1, 6, '111');
COMMIT;

-- ----------------------------
-- Table structure for qu_example_orders
-- ----------------------------
DROP TABLE IF EXISTS `qu_example_orders`;
CREATE TABLE `qu_example_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '订单号',
  `total` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `remark` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单备注',
  `express_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '物流单号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态值(select):1=未付款,2=待发货,3待收货,4=已完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

-- ----------------------------
-- Records of qu_example_orders
-- ----------------------------
BEGIN;
INSERT INTO `qu_example_orders` (`id`, `order_no`, `total`, `remark`, `express_no`, `create_time`, `update_time`, `status`) VALUES (1, 'DD20220329', 500.00, '这是一个测试订单', 'YQ1235', '2022-04-20 12:01:40', '2022-04-29 16:18:55', 3);
INSERT INTO `qu_example_orders` (`id`, `order_no`, `total`, `remark`, `express_no`, `create_time`, `update_time`, `status`) VALUES (2, 'DD202204121255', 299.00, '这是一个测试的订单', 'SF12345678', '2022-04-20 12:02:33', '2022-04-20 19:16:00', 3);
INSERT INTO `qu_example_orders` (`id`, `order_no`, `total`, `remark`, `express_no`, `create_time`, `update_time`, `status`) VALUES (3, 'DD20220422', 366.00, '送到物业', '', '2022-04-20 12:03:22', '2022-04-29 16:18:38', 1);
INSERT INTO `qu_example_orders` (`id`, `order_no`, `total`, `remark`, `express_no`, `create_time`, `update_time`, `status`) VALUES (4, 'DD998888', 58.00, '尽快发货', 'ST0098787', '2022-04-20 12:03:46', '2022-05-13 10:03:01', 3);
COMMIT;

-- ----------------------------
-- Table structure for qu_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_admin`;
CREATE TABLE `qu_system_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `head_image` varchar(255) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `group_ids` varchar(255) DEFAULT NULL COMMENT '权限id(逗号隔开)',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `admin_id` int(10) DEFAULT NULL COMMENT '添加管理员id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of qu_system_admin
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_admin` (`id`, `username`, `phone`, `password`, `head_image`, `email`, `status`, `create_time`, `update_time`, `group_ids`, `nickname`, `admin_id`) VALUES (1, 'admin', '', 'e10adc3949ba59abbe56e057f20f883e', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', 1, NULL, '2022-05-05 14:58:45', '1,4', 'admin', 0);
COMMIT;

-- ----------------------------
-- Table structure for qu_system_category
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_category`;
CREATE TABLE `qu_system_category` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '分类描述',
  `weigh` int(9) DEFAULT '0' COMMENT '排序',
  `status` int(9) DEFAULT '0' COMMENT '状态值(select):0=禁用,1=正常',
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qu_system_category
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (1, '测试分类', '1', 0, 0, '这个是标题1');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (2, '分类2', '2', 0, 0, '测试标题612');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (3, '分类3', '3', 0, 0, '测试标题63');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (4, '分类4', '4', 0, 0, '测试标题64');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (5, '分类5', '5', 0, 0, '测试标题65');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (6, '测试分类6', '1', 0, 0, '测试标题65');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (7, '分类7', '2', 0, 0, '测试标题76');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (8, '分类8', '6', 0, 0, '测试标题87');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (9, '分类9', '7', 0, 0, '测试标题98');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (10, '分类10', '8', 0, 0, '测试标题10');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (11, '测试分类6', '1', 0, 0, '测试标题11');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (12, '分类7', '2', 0, 0, '测试标题12');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (13, '分类8', '9', 0, 0, '测试标题13');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (14, '分类9', '10', 0, 0, '测试标题14');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (15, '分类10', '11', 0, 0, '测试标题150');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (16, '测试分类6', '1', 0, 0, '测试标题16');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (17, '分类7', '2', 0, 0, '测试标题17');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (18, '分类8', '12', 0, 0, '测试标题18');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (19, '分类9', '13', 0, 0, '测试标题19');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (20, '分类10', '14', 0, 0, '测试标题20');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (21, '测试分类6', '1', 0, 0, '测试标题21');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (22, '分类7', '2', 0, 0, '测试标题22');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (23, '分类8', '15', 0, 0, '测试标题23');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (24, '分类9', '16', 0, 0, '测试标题24');
INSERT INTO `qu_system_category` (`id`, `name`, `desc`, `weigh`, `status`, `title`) VALUES (25, '分类10', '17', 0, 0, '测试标题250');
COMMIT;

-- ----------------------------
-- Table structure for qu_system_config
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_config`;
CREATE TABLE `qu_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '变量标题',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '标识',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型input,textarea,image,images,switch',
  `value` text NOT NULL COMMENT '变量值',
  `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
  `weigh` int(10) DEFAULT '0',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of qu_system_config
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (1, 'site_logo', '网站logo', 'site', 'logo', 'image', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '网站的logo', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (2, 'site_title', '网站标题', 'site', 'title', 'input', 'BoolAdmin', '网站的logo', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (3, 'site_copyright', '版权信息', 'site', 'copyright', 'input', 'CodeMiracle', '网站的版权', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (4, 'site_beian', '备案信息', 'site', 'beian', 'input', 'MIT Licensed | Copyright © 2021 BoolAdmin', '网站备案信息', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (5, 'upload_ext', '允许后缀', 'upload', 'ext', '', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg', '上传允许的后缀', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (6, 'upload_url', '图片路径', 'upload', 'url', '', '//demo.booladmin.com', '上传文件访问地址', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (7, 'site_switch', '网站开关', 'site', 'switch', '', 'site', '网站是否关闭', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (8, 'site_ip_blacklist', 'ip黑名单', 'site', 'ip_blacklist', '', 'site', 'ip黑名单用逗号隔开', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (9, 'site_open_time', '网站维护时间', 'site', 'open_time', '', 'site', '网站维护时间', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (10, 'site_isreg', '允许注册', 'site', 'isreg', '', 'site', '是否允许注册', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (11, 'upload_type', '上传方式', 'upload', 'type', '', 'local', '上传方式', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (12, 'site_back_image', '登录页背景图', 'site', 'back_image', 'image', 'https://static.boolcdn.net/git/images/banner/booladmin/banner01.jpg', '登录页背景', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (13, 'site_icon', 'icon', 'site', 'icon', 'image', 'site', '网站小icon', 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for qu_system_files
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_files`;
CREATE TABLE `qu_system_files` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `image_frames` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_ext` varchar(100) DEFAULT NULL COMMENT '文件后缀',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `file_type` varchar(100) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`id`),
  KEY `upload_type` (`upload_type`),
  KEY `original_name` (`original_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='上传文件表';

-- ----------------------------
-- Records of qu_system_files
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_files` (`id`, `upload_type`, `original_name`, `url`, `image_width`, `image_height`, `image_frames`, `mime_type`, `file_size`, `file_ext`, `sha1`, `create_time`, `update_time`, `file_type`) VALUES (1, 'local', 'logo.png', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', '', 0, 'image/png', 34091, 'png', '988e7e1504fb32f10505eb95681b1699f0554ca9', '2022-10-09 16:31:09', '2022-10-09 16:31:09', NULL);
COMMIT;

-- ----------------------------
-- Table structure for qu_system_group
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_group`;
CREATE TABLE `qu_system_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '状态',
  `weigh` int(10) DEFAULT '0' COMMENT '排序',
  `admin_id` int(10) DEFAULT '0' COMMENT '创建用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of qu_system_group
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_group` (`id`, `name`, `create_time`, `update_time`, `status`, `weigh`, `admin_id`) VALUES (1, '超级管理员', NULL, NULL, 1, 0, 0);
INSERT INTO `qu_system_group` (`id`, `name`, `create_time`, `update_time`, `status`, `weigh`, `admin_id`) VALUES (4, 'web管理员', NULL, '2022-05-10 16:54:55', 1, 3, 0);
COMMIT;

-- ----------------------------
-- Table structure for qu_system_group_admin
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_group_admin`;
CREATE TABLE `qu_system_group_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组id',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='用户-组关系表';

-- ----------------------------
-- Records of qu_system_group_admin
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_group_admin` (`id`, `group_id`, `admin_id`) VALUES (27, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for qu_system_group_menu
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_group_menu`;
CREATE TABLE `qu_system_group_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组id',
  `menu_id` text NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组菜单表';

-- ----------------------------
-- Records of qu_system_group_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qu_system_log
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_log`;
CREATE TABLE `qu_system_log` (
  `id` bigint(15) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表';

-- ----------------------------
-- Records of qu_system_log
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (1, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:49:57');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (2, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:49:57');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (3, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:50:02');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (4, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:50:03');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (5, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:51:25');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (6, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:52:07');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (7, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:52:08');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (8, 1, '/admin/passport/logout', 'post', '', '{\"s\":\"\\/admin\\/passport\\/logout\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:52:19');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (9, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:52:50');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (10, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:52:50');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (11, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:52:54');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (12, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:52:54');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (13, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:53:44');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (14, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:53:44');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (15, 1, '/admin/passport/logout', 'post', '', '{\"s\":\"\\/admin\\/passport\\/logout\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:53:53');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (16, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:54:21');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (17, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:54:21');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (18, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:55:37');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (19, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:55:38');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (20, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:56:35');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (21, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:56:35');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (22, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:58:31');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (23, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:58:31');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (24, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:58:35');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (25, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 02:58:36');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (26, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:08:37');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (27, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:08:37');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (28, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:09:34');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (29, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:09:35');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (30, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:14');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (31, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:14');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (32, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:16');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (33, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:16');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (34, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:16');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (35, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:17');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (36, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:19');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (37, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:20');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (38, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:21');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (39, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:21');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (40, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:30');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (41, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:10:30');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (42, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:21:48');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (43, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:21:48');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (44, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:21:50');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (45, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:21:50');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (46, 1, '/admin/ajax/upload', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/upload\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:22:16');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (47, 1, '/admin/ajax/upload', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/upload\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-05 03:23:39');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (48, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:39:16');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (49, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:39:16');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (50, 1, '/admin/system.role/find', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/find\",\"id\":4}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:44:42');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (51, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:45:55');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (52, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:45:56');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (53, 1, '/admin/system.config/index', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/index\",\"site_logo\":\"https:\\/\\/static.boolcdn.net\\/git\\/logo\\/boolcdn\\/logo.png\",\"site_title\":\"BoolAdmin\",\"site_copyright\":\"CodeMiracle\",\"site_beian\":\"MIT Licensed | Copyright © 2021 BoolAdmin\",\"site_switch\":\"site\",\"site_ip_blacklist\":\"site\",\"site_open_time\":\"site\",\"site_isreg\":\"site\",\"site_back_image\":\"https:\\/\\/static.boolcdn.net\\/git\\/images\\/banner\\/booladmin\\/banner01.jpg\",\"site_icon\":\"site\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:46:26');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (54, 1, '/admin/passport/logout', 'post', '', '{\"s\":\"\\/admin\\/passport\\/logout\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:46:33');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (55, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:51:20');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (56, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:51:20');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (57, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:51:22');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (58, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:51:22');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (59, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:51:49');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (60, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:51:49');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (61, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:53:10');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (62, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:53:11');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (63, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:54:06');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (64, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:54:07');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (65, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:54:09');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (66, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:54:09');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (67, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:56:57');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (68, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:56:57');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (69, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:57:36');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (70, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', '2023-03-06 00:57:36');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (71, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:06:10');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (72, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:06:10');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (73, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:16:15');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (74, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:16:16');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (75, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:18:10');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (76, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:18:11');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (77, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:25:10');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (78, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:25:10');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (79, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:25:47');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (80, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:25:48');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (81, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:43:28');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (82, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 16:43:28');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (83, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 17:06:38');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (84, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 17:06:39');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (85, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 17:06:39');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (86, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 17:06:40');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (87, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 17:06:40');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (88, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-13 17:06:41');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (89, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-24 16:40:05');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (90, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-24 16:40:05');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (91, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-24 16:42:55');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (92, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-24 16:42:55');
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`) VALUES (93, 1, '/admin/passport/logout', 'post', '', '{\"s\":\"\\/admin\\/passport\\/logout\"}', '27.102.115.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', '2023-04-24 16:45:08');
COMMIT;

-- ----------------------------
-- Table structure for qu_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_menu`;
CREATE TABLE `qu_system_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '1为目录,2菜单3按钮',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `path` varchar(50) DEFAULT '' COMMENT '地址名称',
  `component` varchar(255) DEFAULT NULL COMMENT '地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1:显示 0：隐藏',
  `permission` varchar(255) DEFAULT NULL COMMENT '后台接口地址',
  `tag_type` varchar(255) DEFAULT NULL,
  `tag_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 COMMENT='菜单节点表';

-- ----------------------------
-- Records of qu_system_menu
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (1, 1, 0, '系统管理', 'system', 'system', 'Layout', NULL, '2022-04-28 20:11:07', 0, 1, NULL, '', '');
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (2, 2, 1, '菜单管理', 'tree-table', 'menu', 'system/menu/index', NULL, NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (3, 3, 2, '列表', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.menu/index', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (4, 3, 2, '添加', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.menu/add', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (5, 3, 2, '查找', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.menu/find', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (6, 3, 2, '修改', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.menu/edit', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (7, 3, 2, '删除', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.menu/delete', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (8, 2, 1, '角色组管理', 'peoples', 'role', 'system/role/index', NULL, NULL, 3, 1, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (9, 3, 8, '获取授权', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.role/authData', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (10, 3, 8, '授权', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.role/authGroup', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (11, 3, 8, '列表', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.role/index', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (12, 3, 8, '添加', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.role/add', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (13, 3, 8, '查找', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.role/find', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (14, 3, 8, '修改', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.role/edit', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (15, 3, 8, '删除', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.role/delete', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (16, 2, 1, '系统配置', 'system', 'config', 'system/config/index', NULL, NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (17, 3, 16, '配置详情', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.config/index', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (18, 2, 1, '日志管理', 'log', 'log', 'system/log/index', NULL, NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (19, 2, 18, '列表', 'log', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.log/index', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (20, 2, 18, '删除', 'log', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.log/delete', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (21, 1, 0, '系统工具', 'tool', 'tool', 'Layout', NULL, NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (22, 2, 170, '表单测试案例', 'table', 'curd', 'example/curd/index', NULL, '2022-05-02 12:13:44', 0, 1, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (23, 3, 22, '列表', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/example.demo/index', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (24, 3, 22, '添加', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/example.demo/add', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (25, 3, 22, '查找', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/example.demo/find', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (26, 3, 22, '修改', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/example.demo/edit', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (27, 3, 22, '删除', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/example.demo/delete', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (28, 3, 22, '导出', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/example.demo/export', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (29, 2, 1, '管理员管理', 'user', 'staff', 'system/staff/index', NULL, NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (30, 3, 29, '列表', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.admin/index', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (31, 3, 29, '添加', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.admin/add', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (32, 3, 29, '查找', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.admin/find', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (33, 3, 29, '修改', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.admin/edit', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (34, 3, 29, '删除', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.admin/delete', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (35, 2, 21, '附件管理', 'zip', 'file', 'tool/file/index', NULL, NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (36, 3, 35, '列表', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.files/index', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (37, 3, 35, '删除', 'tree-table', NULL, NULL, NULL, NULL, 0, 1, '/admin/system.files/delete', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (38, 2, 171, 'Online表单开发', 'online', 'index', 'online/index', NULL, '2022-05-02 14:33:07', 1, 1, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (71, 2, 171, '插件市场', 'build', 'plugin', 'plugin/index', NULL, '2022-04-28 20:22:12', 0, 1, NULL, 'danger', '');
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (127, 1, 0, '官网', 'guide', 'http://www.quickadmin.icu', 'Layout', NULL, '2022-05-10 09:25:25', 0, 1, NULL, 'success', '');
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (149, 2, 170, 'tab状态检索案例', 'code', 'orders', 'example/orders/index', '2022-04-20 11:53:56', '2022-05-02 12:15:47', 0, 1, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (150, 3, 149, '列表', 'code', '', NULL, '2022-04-20 11:53:56', '2022-04-20 11:53:56', 0, 1, '/admin/example.orders/index', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (151, 3, 149, '添加', 'code', '', NULL, '2022-04-20 11:53:56', '2022-04-20 11:53:56', 0, 1, '/admin/example.orders/add', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (152, 3, 149, '查看', 'code', '', NULL, '2022-04-20 11:53:57', '2022-04-20 11:53:57', 0, 1, '/admin/example.orders/find', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (153, 3, 149, '编辑', 'code', '', NULL, '2022-04-20 11:53:57', '2022-04-20 11:53:57', 0, 1, '/admin/example.orders/edit', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (154, 3, 149, '删除', 'code', '', NULL, '2022-04-20 11:53:57', '2022-04-20 11:53:57', 0, 1, '/admin/example.orders/delete', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (155, 3, 149, '导出', 'code', '', NULL, '2022-04-20 11:53:57', '2022-04-20 11:53:57', 0, 1, '/admin/example.orders/export', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (170, 1, 0, '常用案例', 'example', 'example', 'Layout', '2022-04-28 20:07:30', '2022-04-28 20:07:30', 0, 1, NULL, 'warning', 'example');
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (171, 1, 0, '在线开发', 'form', 'online', 'Layout', '2022-04-28 20:08:25', '2022-04-28 20:08:25', 0, 1, NULL, 'danger', 'hot');
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (172, 3, 8, '授权菜单', '', '', NULL, '2022-07-02 23:37:40', '2022-07-03 17:30:37', 0, 1, '/admin/system.menu/adminIndex', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (174, 3, 149, '操作', '', '', NULL, '2022-07-03 16:44:59', '2022-07-03 16:44:59', 0, 1, '/admin/example.orders/op', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (175, 3, 38, '获取数据表', '', '', NULL, '2022-07-03 16:48:46', '2022-07-03 16:48:46', 0, 1, '/admin/onlinecurd.index/getTables', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (176, 3, 38, '列表', '', '', NULL, '2022-07-03 16:49:20', '2022-07-03 16:49:20', 0, 1, '/admin/onlinecurd.index/index', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (177, 3, 38, '主表信息', '', '', NULL, '2022-07-03 16:51:28', '2022-07-03 16:51:50', 0, 1, '/admin/onlinecurd.index/getMainTableRow', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (178, 3, 38, '从表信息', '', '', NULL, '2022-07-03 16:52:02', '2022-07-03 16:52:02', 0, 1, '/admin/onlinecurd.index/getSubTableRow', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (179, 3, 38, '表单生成', '', '', NULL, '2022-07-03 16:54:12', '2022-07-03 16:54:12', 0, 1, '/admin/onlinecurd.index/save', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (180, 3, 71, '列表', '', '', NULL, '2022-07-03 17:27:54', '2022-07-03 17:27:54', 0, 1, '/admin/plugins/list', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (181, 3, 71, '安装', '', '', NULL, '2022-07-03 17:28:43', '2022-07-03 17:28:43', 0, 1, '/admin/plugins/install', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (182, 3, 71, '卸载', '', '', NULL, '2022-07-03 17:28:56', '2022-07-03 17:28:56', 0, 1, '/admin/plugins/uninstall', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (183, 3, 71, '配置', '', '', NULL, '2022-07-03 17:29:54', '2022-07-03 17:29:54', 0, 1, '/admin/plugins/config', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `create_time`, `update_time`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`) VALUES (238, 1, 0, '接口权限', '', 'apiauth', 'apiauth', '2022-10-10 22:06:51', '2022-10-10 22:06:51', 0, 0, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for qu_system_onlinecurd
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_onlinecurd`;
CREATE TABLE `qu_system_onlinecurd` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `comment` varchar(255) DEFAULT NULL COMMENT '表备注',
  `relation_table` varchar(1000) DEFAULT NULL COMMENT '关联表',
  `filename` text COMMENT '文件夹路径',
  `params` text COMMENT '参数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:失败,1:成功,)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version` int(11) DEFAULT '0' COMMENT '版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线curd';

-- ----------------------------
-- Records of qu_system_onlinecurd
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qu_test
-- ----------------------------
DROP TABLE IF EXISTS `qu_test`;
CREATE TABLE `qu_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `week` int(10) NOT NULL DEFAULT '3' COMMENT '星期(select):1=星期一,2=星期二,3=星期三',
  `flag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标志(selects):1=热门,2=最新,3=推荐',
  `genderdata` int(10) NOT NULL DEFAULT '3' COMMENT '性别(radio):1=男,2=女,3=未知',
  `actdata` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '活动(checkbox):1=徒步,2=读书会,3=自驾游',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `keywords` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '描述',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `images` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '附件',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省市',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `startdate` int(10) DEFAULT NULL COMMENT '开始日期',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关(switch)',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态值(select):0=禁用,1=正常',
  `category_id` int(11) DEFAULT NULL COMMENT '分类',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '111',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='案例表';

-- ----------------------------
-- Records of qu_test
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
