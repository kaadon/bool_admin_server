/*
 Navicat Premium Data Transfer

 Source Server         : bool_admin_local
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : 127.0.0.1:3306
 Source Schema         : bool_admin

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 03/02/2024 10:46:59
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
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关1开0：关',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常',
  `category_id` int(11) DEFAULT NULL COMMENT '分类',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '111',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='案例表';

-- ----------------------------
-- Records of qu_example_demo
-- ----------------------------
BEGIN;
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `weigh`, `switch`, `status`, `category_id`, `name`, `create_time`, `update_time`) VALUES (1, 1, '2,1,3', 1, '', '完整表单案例1', '<p>完整表单案例1</p>', '完整表单案例1', '完整表单案例1', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', '北京市,市辖区,东城区', 0.70, 1639642410, 3, 1, 1, 2, '111', NULL, NULL);
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `weigh`, `switch`, `status`, `category_id`, `name`, `create_time`, `update_time`) VALUES (8, 2, '3', 3, '1,3', '完整表单案例2', '<p>完整表单案例2</p>', '完整表单案例2', '完整表单案例2', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', 'http://api.njyyc.cn/storage/system/20210908/9e754e13af52a7f41ff98e1002258f5a.txt', '江苏省,南京市,市辖区', 0.10, 1640880000, 10, 1, 1, 3, '111', NULL, NULL);
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `weigh`, `switch`, `status`, `category_id`, `name`, `create_time`, `update_time`) VALUES (10, 3, '1,2', 2, '1', '完整表单案例3', '<p>完整表单案例3</p>', '完整表单案例3', '完整表单案例3', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', '山西省,大同市,新荣区', 0.00, 1650643200, 50, 1, 2, 3, '111', NULL, NULL);
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `weigh`, `switch`, `status`, `category_id`, `name`, `create_time`, `update_time`) VALUES (14, 4, '3', 1, '1,2', '完整表单案例4', '<p>完整表单案例4</p>', '完整表单案例4', '完整表单案例4', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', '', '江苏省,无锡市,锡山区', 0.00, 1643212800, 0, 0, 1, 4, '111', NULL, NULL);
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `weigh`, `switch`, `status`, `category_id`, `name`, `create_time`, `update_time`) VALUES (53, 5, NULL, 3, NULL, '完整表单案例5', '<p>完整表单案例5</p>', '完整表单案例5', '完整表单案例5', '', '', '', '北京市,市辖区,西城区', 0.20, 1649779200, 0, 0, 1, 5, '111', NULL, NULL);
INSERT INTO `qu_example_demo` (`id`, `week`, `flag`, `genderdata`, `actdata`, `title`, `content`, `keywords`, `description`, `image`, `images`, `attachfile`, `city`, `price`, `startdate`, `weigh`, `switch`, `status`, `category_id`, `name`, `create_time`, `update_time`) VALUES (54, 3, NULL, 3, NULL, '234234324', '<p>234234234234234234234</p>', '111233', '', '', '', '', '山西省,阳泉市,城区', 0.00, NULL, 0, 0, 1, 6, '111', NULL, NULL);
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
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态值(select):1=未付款,2=待发货,3待收货,4=已完成',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

-- ----------------------------
-- Records of qu_example_orders
-- ----------------------------
BEGIN;
INSERT INTO `qu_example_orders` (`id`, `order_no`, `total`, `remark`, `express_no`, `status`, `create_time`, `update_time`) VALUES (1, 'DD20220329', 500.00, '这是一个测试订单', 'YQ1235', 3, NULL, NULL);
INSERT INTO `qu_example_orders` (`id`, `order_no`, `total`, `remark`, `express_no`, `status`, `create_time`, `update_time`) VALUES (2, 'DD202204121255', 299.00, '这是一个测试的订单', 'SF12345678', 3, NULL, NULL);
INSERT INTO `qu_example_orders` (`id`, `order_no`, `total`, `remark`, `express_no`, `status`, `create_time`, `update_time`) VALUES (3, 'DD20220422', 366.00, '送到物业', '', 1, NULL, NULL);
INSERT INTO `qu_example_orders` (`id`, `order_no`, `total`, `remark`, `express_no`, `status`, `create_time`, `update_time`) VALUES (4, 'DD998888', 58.00, '尽快发货', 'ST0098787', 3, NULL, NULL);
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
  `group_ids` varchar(255) DEFAULT NULL COMMENT '权限id(逗号隔开)',
  `nickname` varchar(100) DEFAULT NULL COMMENT '昵称',
  `admin_id` int(10) DEFAULT NULL COMMENT '添加管理员id',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of qu_system_admin
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_admin` (`id`, `username`, `phone`, `password`, `head_image`, `email`, `status`, `group_ids`, `nickname`, `admin_id`, `create_time`, `update_time`) VALUES (1, 'admin', '13572008888', 'e10adc3949ba59abbe56e057f20f883e', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', 'usdtcloud@gmail.com', 1, '1,4', 'admin', 0, NULL, 1706927689);
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
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of qu_system_config
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (1, 'site_logo', '网站logo', 'site', 'logo', 'image', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '网站的logo', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (2, 'site_title', '网站标题', 'site', 'title', 'input', 'Kaadon Admin', '网站的logo', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (3, 'site_copyright', '版权信息', 'site', 'copyright', 'input', 'KaadonAdmin', '网站的版权', 0, NULL, NULL);
INSERT INTO `qu_system_config` (`id`, `name`, `title`, `group`, `sign`, `type`, `value`, `remark`, `weigh`, `create_time`, `update_time`) VALUES (4, 'site_beian', '备案信息', 'site', 'beian', 'input', 'Copyright © 2024', '网站备案信息', 0, NULL, NULL);
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
  `file_type` varchar(100) DEFAULT NULL COMMENT '文件类型',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `upload_type` (`upload_type`),
  KEY `original_name` (`original_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='上传文件表';

-- ----------------------------
-- Records of qu_system_files
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_files` (`id`, `upload_type`, `original_name`, `url`, `image_width`, `image_height`, `image_frames`, `mime_type`, `file_size`, `file_ext`, `sha1`, `file_type`, `create_time`, `update_time`) VALUES (1, 'local', 'logo.png', 'https://static.boolcdn.net/git/logo/boolcdn/logo.png', '', '', 0, 'image/png', 34091, 'png', '988e7e1504fb32f10505eb95681b1699f0554ca9', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for qu_system_group
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_group`;
CREATE TABLE `qu_system_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '状态',
  `weigh` int(10) DEFAULT '0' COMMENT '排序',
  `admin_id` int(10) DEFAULT '0' COMMENT '创建用户id',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of qu_system_group
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_group` (`id`, `name`, `status`, `weigh`, `admin_id`, `create_time`, `update_time`) VALUES (1, '超级管理员', 1, 0, 0, NULL, NULL);
INSERT INTO `qu_system_group` (`id`, `name`, `status`, `weigh`, `admin_id`, `create_time`, `update_time`) VALUES (4, 'web管理员', 1, 3, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for qu_system_group_admin
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_group_admin`;
CREATE TABLE `qu_system_group_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组id',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='用户-组关系表';

-- ----------------------------
-- Records of qu_system_group_admin
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_group_admin` (`id`, `group_id`, `admin_id`, `create_time`, `update_time`) VALUES (30, 1, 1, 1706927689, 1706927689);
COMMIT;

-- ----------------------------
-- Table structure for qu_system_group_menu
-- ----------------------------
DROP TABLE IF EXISTS `qu_system_group_menu`;
CREATE TABLE `qu_system_group_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组id',
  `menu_id` text NOT NULL COMMENT '菜单id',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户组菜单表';

-- ----------------------------
-- Records of qu_system_group_menu
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_group_menu` (`id`, `group_id`, `menu_id`, `create_time`, `update_time`) VALUES (1, 4, '1', NULL, NULL);
INSERT INTO `qu_system_group_menu` (`id`, `group_id`, `menu_id`, `create_time`, `update_time`) VALUES (2, 4, '16', NULL, NULL);
INSERT INTO `qu_system_group_menu` (`id`, `group_id`, `menu_id`, `create_time`, `update_time`) VALUES (3, 4, '17', NULL, NULL);
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
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表';

-- ----------------------------
-- Records of qu_system_log
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (475, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401875, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (476, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401875, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (477, 1, '/admin/system.role/index?pageNum=1&pageSize=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/index\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401897, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (478, 1, '/admin/system.admin/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401899, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (479, 1, '/admin/system.admin/find', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/find\",\"id\":1}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401902, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (480, 1, '/admin/system.role/selectList', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/selectList\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401902, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (481, 1, '/admin/system.admin/edit', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/edit\",\"id\":1,\"username\":\"admin\",\"phone\":\"13572008888\",\"password\":\"123456\",\"head_image\":\"https:\\/\\/static.boolcdn.net\\/git\\/logo\\/boolcdn\\/logo.png\",\"email\":\"usdtcloud@gmail.com\",\"status\":1,\"group_ids\":[1],\"nickname\":\"admin\",\"admin_id\":0,\"create_time\":null,\"update_time\":\"2023-12-01 11:26:52\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401908, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (482, 1, '/admin/system.admin/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401908, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (483, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401912, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (484, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401914, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (485, 1, '/admin/system.menu/find', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/find\",\"id\":1}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401914, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (486, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401914, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (487, 1, '/admin/system.menu/edit', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/edit\",\"id\":1,\"type\":1,\"pid\":0,\"title\":\"系统管理\",\"icon\":\"system\",\"path\":\"system\",\"component\":\"Layout\",\"weigh\":1,\"status\":1,\"permission\":null,\"tag_type\":\"\",\"tag_value\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401918, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (488, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401918, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (489, 1, '/admin/system.config/index', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401920, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (490, 1, '/admin/system.config/update', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/update\",\"site_logo\":\"https:\\/\\/static.boolcdn.net\\/git\\/logo\\/boolcdn\\/logo.png\",\"site_title\":\"BoolAdmin\",\"site_copyright\":\"CodeMiracles\",\"site_beian\":\"MIT Licensed | Copyright © 2021 BoolAdmin\",\"site_switch\":\"site\",\"site_ip_blacklist\":\"site\",\"site_open_time\":\"site\",\"site_isreg\":\"site\",\"site_back_image\":\"https:\\/\\/static.boolcdn.net\\/git\\/images\\/banner\\/booladmin\\/banner01.jpg\",\"site_icon\":\"site\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401923, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (491, 1, '/admin/system.config/update', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/update\",\"upload_ext\":\"doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg\",\"upload_url\":\"\\/\\/demo.booladmin.com\",\"upload_type\":\"local\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401926, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (492, 1, '/admin/system.log/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.log\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401928, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (493, 1, '/admin/system.files/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.files\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401938, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (494, 1, '/admin/onlinecurd.index/getTables', 'post', '', '{\"s\":\"\\/admin\\/onlinecurd.index\\/getTables\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401959, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (495, 1, '/admin/onlinecurd.index/index', 'post', '', '{\"s\":\"\\/admin\\/onlinecurd.index\\/index\",\"page\":1,\"limit\":10,\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401959, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (496, 1, '/admin/plugins/categoryList', 'post', '', '{\"s\":\"\\/admin\\/plugins\\/categoryList\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401959, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (497, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401976, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (498, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401976, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (499, 1, '/admin/system.admin/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401976, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (500, 1, '/admin/system.role/index?pageNum=1&pageSize=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/index\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401986, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (501, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401987, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (502, 1, '/admin/system.config/index', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401988, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (503, 1, '/admin/system.log/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.log\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401989, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (504, 1, '/admin/system.files/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.files\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401991, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (505, 1, '/admin/onlinecurd.index/getTables', 'post', '', '{\"s\":\"\\/admin\\/onlinecurd.index\\/getTables\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401995, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (506, 1, '/admin/onlinecurd.index/index', 'post', '', '{\"s\":\"\\/admin\\/onlinecurd.index\\/index\",\"page\":1,\"limit\":10,\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401995, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (507, 1, '/admin/plugins/categoryList', 'post', '', '{\"s\":\"\\/admin\\/plugins\\/categoryList\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701401996, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (508, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402016, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (509, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402016, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (510, 1, '/admin/system.log/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.log\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402017, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (511, 1, '/admin/system.config/index', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402019, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (512, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402019, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (513, 1, '/admin/system.role/index?pageNum=1&pageSize=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/index\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402023, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (514, 1, '/admin/system.files/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.files\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402026, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (515, 1, '/admin/onlinecurd.index/getTables', 'post', '', '{\"s\":\"\\/admin\\/onlinecurd.index\\/getTables\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402037, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (516, 1, '/admin/onlinecurd.index/index', 'post', '', '{\"s\":\"\\/admin\\/onlinecurd.index\\/index\",\"page\":1,\"limit\":10,\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402037, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (517, 1, '/admin/plugins/categoryList', 'post', '', '{\"s\":\"\\/admin\\/plugins\\/categoryList\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402038, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (518, 1, '/admin/system.admin/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1701402046, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (519, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924502, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (520, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924502, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (521, 1, '/admin/onlinecurd.index/getTables', 'post', '', '{\"s\":\"\\/admin\\/onlinecurd.index\\/getTables\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924507, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (522, 1, '/admin/onlinecurd.index/index', 'post', '', '{\"s\":\"\\/admin\\/onlinecurd.index\\/index\",\"page\":1,\"limit\":10,\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924507, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (523, 1, '/admin/system.role/index?pageNum=1&pageSize=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/index\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924510, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (524, 1, '/admin/system.role/find', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/find\",\"id\":4}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924512, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (525, 1, '/admin/system.role/edit', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/edit\",\"id\":4,\"name\":\"web管理员\",\"status\":1,\"weigh\":3,\"admin_id\":0,\"create_time\":null,\"update_time\":null}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924514, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (526, 1, '/admin/system.role/index?pageNum=1&pageSize=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/index\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924514, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (527, 1, '/admin/system.admin/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924516, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (528, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924517, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (529, 1, '/admin/system.config/index', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924518, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (530, 1, '/admin/system.config/update', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/update\",\"site_logo\":\"https:\\/\\/static.boolcdn.net\\/git\\/logo\\/boolcdn\\/logo.png\",\"site_title\":\"BoolAdmin\",\"site_copyright\":\"CodeMiracles\",\"site_beian\":\"Copyright © 2024 KaadonAdmin\",\"site_switch\":\"site\",\"site_ip_blacklist\":\"site\",\"site_open_time\":\"site\",\"site_isreg\":\"site\",\"site_back_image\":\"https:\\/\\/static.boolcdn.net\\/git\\/images\\/banner\\/booladmin\\/banner01.jpg\",\"site_icon\":\"site\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924560, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (531, 1, '/admin/system.config/update', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/update\",\"site_logo\":\"https:\\/\\/static.boolcdn.net\\/git\\/logo\\/boolcdn\\/logo.png\",\"site_title\":\"Kaadon Admin\",\"site_copyright\":\"KaadonAdmin\",\"site_beian\":\"Copyright © 2024\",\"site_switch\":\"site\",\"site_ip_blacklist\":\"site\",\"site_open_time\":\"site\",\"site_isreg\":\"site\",\"site_back_image\":\"https:\\/\\/static.boolcdn.net\\/git\\/images\\/banner\\/booladmin\\/banner01.jpg\",\"site_icon\":\"site\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924592, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (532, 1, '/admin/system.config/update', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/update\",\"upload_ext\":\"doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg\",\"upload_url\":\"\\/\\/demo.booladmin.com\",\"upload_type\":\"local\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706924596, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (533, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706925075, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (534, 1, '/admin/passport/logout', 'post', '', '{\"s\":\"\\/admin\\/passport\\/logout\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706925075, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (535, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 1706925083, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (536, 1, '/admin/passport/logout', 'post', '', '{\"s\":\"\\/admin\\/passport\\/logout\"}', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 1706925084, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (537, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 1706925892, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (538, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 1706925892, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (539, 1, '/admin/system.role/index?pageNum=1&pageSize=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/index\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36', 1706925892, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (540, 1, '/admin/system.admin/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706925898, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (541, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706925899, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (542, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706925901, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (543, 1, '/admin/system.menu/find', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/find\",\"id\":170}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706925901, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (544, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706925901, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (545, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706925910, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (546, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706925910, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (547, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706925910, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (548, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926566, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (549, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926569, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (550, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926569, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (551, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926570, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (552, 1, '/admin/system.config/index', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926573, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (553, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926739, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (554, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926741, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (555, 1, '/admin/system.menu/index?menu_type=2', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926742, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (556, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926743, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (557, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926799, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (558, 1, '/admin/system.menu/index?menu_type=2', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926801, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (559, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926802, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (560, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926809, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (561, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926809, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (562, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926809, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (563, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926816, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (564, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926818, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (565, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926845, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (566, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926863, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (567, 1, '/admin/system.menu/add', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/add\",\"pid\":171,\"title\":\"测试\",\"icon\":\"cascader\",\"type\":2,\"weigh\":0,\"status\":1,\"path\":\"test\",\"component\":\"online\\/test\\/index\",\"tag_type\":\"danger\",\"routes\":\"admin\\/online.test\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926898, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (568, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926898, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (569, 1, '/admin/system.menu/delete', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/delete\",\"id\":184}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926907, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (570, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926907, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (571, 1, '/admin/system.menu/add', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/add\",\"pid\":171,\"title\":\"测试\",\"icon\":\"cascader\",\"type\":2,\"weigh\":0,\"status\":1,\"path\":\"test\",\"component\":\"online\\/test\\/index\",\"tag_type\":\"danger\",\"routes\":\"admin\\/online.test\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926949, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (572, 1, '/admin/system.menu/delete', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/delete\",\"id\":183}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926969, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (573, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926969, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (574, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706926999, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (575, 1, '/admin/system.menu/delete', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/delete\",\"id\":194}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927002, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (576, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927002, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (577, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927458, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (578, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927458, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (579, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927459, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (580, 1, '/admin/system.admin/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927461, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (581, 1, '/admin/system.role/index?pageNum=1&pageSize=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/index\",\"pageNum\":\"1\",\"pageSize\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927462, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (582, 1, '/admin/system.admin/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927521, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (583, 1, '/admin/passport/userinfo', 'post', '', '{\"s\":\"\\/admin\\/passport\\/userinfo\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927685, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (584, 1, '/admin/ajax/initIndex', 'post', '', '{\"s\":\"\\/admin\\/ajax\\/initIndex\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927685, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (585, 1, '/admin/system.admin/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927686, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (586, 1, '/admin/system.admin/find', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/find\",\"id\":1}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927688, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (587, 1, '/admin/system.role/selectList', 'post', '', '{\"s\":\"\\/admin\\/system.role\\/selectList\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927688, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (588, 1, '/admin/system.admin/edit', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/edit\",\"id\":1,\"username\":\"admin\",\"phone\":\"13572008888\",\"password\":\"\",\"head_image\":\"https:\\/\\/static.boolcdn.net\\/git\\/logo\\/boolcdn\\/logo.png\",\"email\":\"usdtcloud@gmail.com\",\"status\":1,\"group_ids\":[1],\"nickname\":\"admin\",\"admin_id\":0,\"create_time\":null,\"update_time\":\"2023-12-01 11:38:28\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927689, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (589, 1, '/admin/system.admin/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.admin\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927689, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (590, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927691, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (591, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927693, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (592, 1, '/admin/system.menu/find', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/find\",\"id\":1}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927693, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (593, 1, '/admin/system.menu/index?menu_type=1', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\",\"menu_type\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927693, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (594, 1, '/admin/system.menu/edit', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/edit\",\"id\":1,\"type\":1,\"pid\":0,\"title\":\"系统管理\",\"icon\":\"system\",\"path\":\"system\",\"component\":\"Layout\",\"weigh\":1,\"status\":1,\"permission\":null,\"tag_type\":\"\",\"tag_value\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927695, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (595, 1, '/admin/system.menu/index', 'post', '', '{\"s\":\"\\/admin\\/system.menu\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927695, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (596, 1, '/admin/system.config/index', 'post', '', '{\"s\":\"\\/admin\\/system.config\\/index\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927697, NULL);
INSERT INTO `qu_system_log` (`id`, `admin_id`, `url`, `method`, `title`, `content`, `ip`, `useragent`, `create_time`, `update_time`) VALUES (597, 1, '/admin/system.log/index?page=1&limit=10&filter=%7B%7D&op=%7B%7D', 'post', '', '{\"s\":\"\\/admin\\/system.log\\/index\",\"page\":\"1\",\"limit\":\"10\",\"filter\":\"{}\",\"op\":\"{}\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', 1706927699, NULL);
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
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1:显示 0：隐藏',
  `permission` varchar(255) DEFAULT NULL COMMENT '后台接口地址',
  `tag_type` varchar(255) DEFAULT NULL,
  `tag_value` varchar(255) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COMMENT='菜单节点表';

-- ----------------------------
-- Records of qu_system_menu
-- ----------------------------
BEGIN;
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (1, 1, 0, '系统管理', 'system', 'system', 'Layout', 1, 1, NULL, '', '', NULL, 1701401918);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (2, 2, 1, '菜单管理', 'tree-table', 'menu', 'system/menu/index', 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (3, 3, 2, '列表', 'tree-table', NULL, NULL, 0, 1, '/admin/system.menu/index', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (4, 3, 2, '添加', 'tree-table', NULL, NULL, 0, 1, '/admin/system.menu/add', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (5, 3, 2, '查找', 'tree-table', NULL, NULL, 0, 1, '/admin/system.menu/find', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (6, 3, 2, '修改', 'tree-table', NULL, NULL, 0, 1, '/admin/system.menu/edit', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (7, 3, 2, '删除', 'tree-table', NULL, NULL, 0, 1, '/admin/system.menu/delete', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (8, 2, 1, '角色组管理', 'peoples', 'role', 'system/role/index', 3, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (9, 3, 8, '获取授权', 'tree-table', NULL, NULL, 0, 1, '/admin/system.role/authData', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (10, 3, 8, '授权', 'tree-table', NULL, NULL, 0, 1, '/admin/system.role/authGroup', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (11, 3, 8, '列表', 'tree-table', NULL, NULL, 0, 1, '/admin/system.role/index', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (12, 3, 8, '添加', 'tree-table', NULL, NULL, 0, 1, '/admin/system.role/add', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (13, 3, 8, '查找', 'tree-table', NULL, NULL, 0, 1, '/admin/system.role/find', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (14, 3, 8, '修改', 'tree-table', NULL, NULL, 0, 1, '/admin/system.role/edit', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (15, 3, 8, '删除', 'tree-table', NULL, NULL, 0, 1, '/admin/system.role/delete', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (16, 2, 1, '系统配置', 'system', 'config', 'system/config/index', 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (17, 3, 16, '配置详情', 'tree-table', NULL, NULL, 0, 1, '/admin/system.config/index', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (18, 2, 1, '日志管理', 'log', 'log', 'system/log/index', 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (19, 2, 18, '列表', 'log', NULL, NULL, 0, 1, '/admin/system.log/index', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (20, 2, 18, '删除', 'log', NULL, NULL, 0, 1, '/admin/system.log/delete', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (21, 1, 0, '系统工具', 'tool', 'tool', 'Layout', 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (22, 2, 170, '表单测试案例', 'table', 'curd', 'example/curd/index', 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (23, 3, 22, '列表', 'tree-table', NULL, NULL, 0, 1, '/admin/example.demo/index', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (24, 3, 22, '添加', 'tree-table', NULL, NULL, 0, 1, '/admin/example.demo/add', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (25, 3, 22, '查找', 'tree-table', NULL, NULL, 0, 1, '/admin/example.demo/find', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (26, 3, 22, '修改', 'tree-table', NULL, NULL, 0, 1, '/admin/example.demo/edit', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (27, 3, 22, '删除', 'tree-table', NULL, NULL, 0, 1, '/admin/example.demo/delete', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (28, 3, 22, '导出', 'tree-table', NULL, NULL, 0, 1, '/admin/example.demo/export', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (29, 2, 1, '管理员管理', 'user', 'staff', 'system/staff/index', 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (30, 3, 29, '列表', 'tree-table', NULL, NULL, 0, 1, '/admin/system.admin/index', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (31, 3, 29, '添加', 'tree-table', NULL, NULL, 0, 1, '/admin/system.admin/add', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (32, 3, 29, '查找', 'tree-table', NULL, NULL, 0, 1, '/admin/system.admin/find', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (33, 3, 29, '修改', 'tree-table', NULL, NULL, 0, 1, '/admin/system.admin/edit', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (34, 3, 29, '删除', 'tree-table', NULL, NULL, 0, 1, '/admin/system.admin/delete', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (35, 2, 21, '附件管理', 'zip', 'file', 'tool/file/index', 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (36, 3, 35, '列表', 'tree-table', NULL, NULL, 0, 1, '/admin/system.files/index', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (37, 3, 35, '删除', 'tree-table', NULL, NULL, 0, 1, '/admin/system.files/delete', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (38, 2, 171, 'Online表单开发', 'online', 'index', 'online/index', 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (71, 2, 171, '插件市场', 'build', 'plugin', 'plugin/index', 0, 1, NULL, 'danger', '', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (149, 2, 170, 'tab状态检索案例', 'code', 'orders', 'example/orders/index', 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (150, 3, 149, '列表', 'code', '', NULL, 0, 1, '/admin/example.orders/index', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (151, 3, 149, '添加', 'code', '', NULL, 0, 1, '/admin/example.orders/add', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (152, 3, 149, '查看', 'code', '', NULL, 0, 1, '/admin/example.orders/find', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (153, 3, 149, '编辑', 'code', '', NULL, 0, 1, '/admin/example.orders/edit', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (154, 3, 149, '删除', 'code', '', NULL, 0, 1, '/admin/example.orders/delete', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (155, 3, 149, '导出', 'code', '', NULL, 0, 1, '/admin/example.orders/export', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (170, 1, 0, '常用案例', 'example', 'example', 'Layout', 0, 1, NULL, 'warning', 'example', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (171, 1, 0, '在线开发', 'form', 'online', 'Layout', 0, 1, NULL, 'danger', 'hot', NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (172, 3, 8, '授权菜单', '', '', NULL, 0, 1, '/admin/system.menu/adminIndex', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (174, 3, 149, '操作', '', '', NULL, 0, 1, '/admin/example.orders/op', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (175, 3, 38, '获取数据表', '', '', NULL, 0, 1, '/admin/onlinecurd.index/getTables', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (176, 3, 38, '列表', '', '', NULL, 0, 1, '/admin/onlinecurd.index/index', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (177, 3, 38, '主表信息', '', '', NULL, 0, 1, '/admin/onlinecurd.index/getMainTableRow', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (178, 3, 38, '从表信息', '', '', NULL, 0, 1, '/admin/onlinecurd.index/getSubTableRow', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (179, 3, 38, '表单生成', '', '', NULL, 0, 1, '/admin/onlinecurd.index/save', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (180, 3, 71, '列表', '', '', NULL, 0, 1, '/admin/plugins/list', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (181, 3, 71, '安装', '', '', NULL, 0, 1, '/admin/plugins/install', NULL, NULL, NULL, NULL);
INSERT INTO `qu_system_menu` (`id`, `type`, `pid`, `title`, `icon`, `path`, `component`, `weigh`, `status`, `permission`, `tag_type`, `tag_value`, `create_time`, `update_time`) VALUES (182, 3, 71, '卸载', '', '', NULL, 0, 1, '/admin/plugins/uninstall', NULL, NULL, NULL, NULL);
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
  `version` int(11) DEFAULT '0' COMMENT '版本',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
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
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关(switch)',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '状态值(select):0=禁用,1=正常',
  `category_id` int(11) DEFAULT NULL COMMENT '分类',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '111',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='案例表';

-- ----------------------------
-- Records of qu_test
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
