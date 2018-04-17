/*
Navicat MySQL Data Transfer

Source Server         : futautr
Source Server Version : 50173
Source Host           : bdm257941196.my3w.com:3306
Source Database       : bdm257941196_db

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-01-04 19:14:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ftyr_ad
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_ad`;
CREATE TABLE `ftyr_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ftyr_ad
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_asset
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_asset`;
CREATE TABLE `ftyr_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of ftyr_asset
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_auth_access`;
CREATE TABLE `ftyr_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of ftyr_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_auth_rule`;
CREATE TABLE `ftyr_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of ftyr_auth_rule
-- ----------------------------
INSERT INTO `ftyr_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '新闻中心', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '资讯排序', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '资讯置顶', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '资讯推荐', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '资讯审核', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除资讯', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑资讯', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加资讯', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '单页管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '注册邮件模板', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('162', 'Demo', 'admin_url', 'demo/adminindex/index', null, '', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('163', 'Demo', 'admin_url', 'demo/adminindex/last', null, '', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('166', 'Admin', 'admin_url', 'admin/mailer/test', null, '测试邮件', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('167', 'Admin', 'admin_url', 'admin/setting/upload', null, '上传设置', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('168', 'Admin', 'admin_url', 'admin/setting/upload_post', null, '上传设置提交', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('169', 'Portal', 'admin_url', 'portal/adminpost/copy', null, '资讯批量复制', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('170', 'Admin', 'admin_url', 'admin/menu/backup_menu', null, '备份菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('171', 'Admin', 'admin_url', 'admin/menu/export_menu_lang', null, '导出后台菜单多语言包', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('172', 'Admin', 'admin_url', 'admin/menu/restore_menu', null, '还原菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('173', 'Admin', 'admin_url', 'admin/menu/getactions', null, '导入新菜单', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('174', 'Admin', 'admin_url', 'admin/variable/index', null, '变量管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('175', 'Portal', 'admin_url', 'portal/adminproduct/index', null, '产品管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('176', 'Portal', 'admin_url', 'portal/admincase/index', null, '案例管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('177', 'Portal', 'admin_url', 'portal/adminservice/index', null, '问答管理', '1', '');
INSERT INTO `ftyr_auth_rule` VALUES ('178', 'Portal', 'admin_url', 'portal/admindownload/index', null, '下载中心', '1', '');

-- ----------------------------
-- Table structure for ftyr_comments
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_comments`;
CREATE TABLE `ftyr_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of ftyr_comments
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_common_action_log
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_common_action_log`;
CREATE TABLE `ftyr_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of ftyr_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_guestbook`;
CREATE TABLE `ftyr_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of ftyr_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_links
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_links`;
CREATE TABLE `ftyr_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of ftyr_links
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_menu
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_menu`;
CREATE TABLE `ftyr_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of ftyr_menu
-- ----------------------------
INSERT INTO `ftyr_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `ftyr_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '0', '所有留言', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '0', '评论管理', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '新闻中心', '', '', '1');
INSERT INTO `ftyr_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '资讯排序', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '资讯置顶', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '资讯推荐', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '资讯审核', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除资讯', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑资讯', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加资讯', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `ftyr_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '单页管理', '', '', '3');
INSERT INTO `ftyr_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `ftyr_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `ftyr_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `ftyr_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '0', '插件管理', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `ftyr_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '0', '网站广告', '', '', '2');
INSERT INTO `ftyr_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '0', '友情链接', '', '', '3');
INSERT INTO `ftyr_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '0', '第三方登陆', 'leaf', '', '4');
INSERT INTO `ftyr_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `ftyr_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `ftyr_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '0', '邮箱配置', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '注册邮件模板', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `ftyr_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `ftyr_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '0', '用户组', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `ftyr_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `ftyr_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `ftyr_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('156', '109', 'Admin', 'Storage', 'index', '', '1', '0', '文件存储', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('166', '127', 'Admin', 'Mailer', 'test', '', '1', '0', '测试邮件', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('167', '109', 'Admin', 'Setting', 'upload', '', '1', '1', '上传设置', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('168', '167', 'Admin', 'Setting', 'upload_post', '', '1', '0', '上传设置提交', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('169', '7', 'Portal', 'AdminPost', 'copy', '', '1', '0', '资讯批量复制', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('174', '100', 'Admin', 'Menu', 'backup_menu', '', '1', '0', '备份菜单', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('175', '100', 'Admin', 'Menu', 'export_menu_lang', '', '1', '0', '导出后台菜单多语言包', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('176', '100', 'Admin', 'Menu', 'restore_menu', '', '1', '0', '还原菜单', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('177', '100', 'Admin', 'Menu', 'getactions', '', '1', '0', '导入新菜单', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('187', '1', 'Admin', 'Variable', 'index', '', '1', '1', '变量管理', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('188', '1', 'Portal', 'AdminProduct', 'index', '', '1', '1', '产品管理', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('189', '1', 'Portal', 'AdminCase', 'index', '', '1', '1', '案例管理', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('190', '1', 'Portal', 'AdminService', 'index', '', '1', '1', '问答管理', '', '', '0');
INSERT INTO `ftyr_menu` VALUES ('191', '1', 'Portal', 'AdminDownload', 'index', '', '1', '1', '下载中心', '', '', '0');

-- ----------------------------
-- Table structure for ftyr_nav
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_nav`;
CREATE TABLE `ftyr_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of ftyr_nav
-- ----------------------------
INSERT INTO `ftyr_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `ftyr_nav` VALUES ('2', '1', '0', '关于百合金', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `ftyr_nav` VALUES ('3', '1', '0', '产品展示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-3');
INSERT INTO `ftyr_nav` VALUES ('4', '1', '2', '公司简介', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2-4');
INSERT INTO `ftyr_nav` VALUES ('5', '1', '2', '组织机构', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-2-5');
INSERT INTO `ftyr_nav` VALUES ('6', '1', '2', '资格证书', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '0', '0-2-6');
INSERT INTO `ftyr_nav` VALUES ('7', '1', '2', '企业文化', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}', '', '1', '0', '0-2-7');
INSERT INTO `ftyr_nav` VALUES ('8', '1', '2', '发展历程', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}', '', '1', '0', '0-2-8');
INSERT INTO `ftyr_nav` VALUES ('9', '1', '2', '企业愿景', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"6\";}}', '', '1', '0', '0-2-9');
INSERT INTO `ftyr_nav` VALUES ('10', '1', '3', '工业水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}', '', '1', '0', '0-3-10');
INSERT INTO `ftyr_nav` VALUES ('11', '1', '3', '工程水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"6\";}}', '', '1', '0', '0-3-11');
INSERT INTO `ftyr_nav` VALUES ('12', '1', '11', '外墙水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"7\";}}', '', '1', '0', '0-3-11-12');
INSERT INTO `ftyr_nav` VALUES ('13', '1', '11', '艺术水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"8\";}}', '', '1', '0', '0-3-11-13');
INSERT INTO `ftyr_nav` VALUES ('14', '1', '3', '家装水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"9\";}}', '', '1', '0', '0-3-14');
INSERT INTO `ftyr_nav` VALUES ('15', '1', '14', '内墙水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"10\";}}', '', '1', '0', '0-3-14-15');
INSERT INTO `ftyr_nav` VALUES ('16', '1', '14', '木器水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"11\";}}', '', '1', '0', '0-3-14-16');
INSERT INTO `ftyr_nav` VALUES ('17', '1', '14', '多功能水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"12\";}}', '', '1', '0', '0-3-14-17');
INSERT INTO `ftyr_nav` VALUES ('18', '1', '0', '工业案例', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-18');
INSERT INTO `ftyr_nav` VALUES ('19', '1', '0', '招商加盟', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"11\";}}', '', '1', '0', '0-19');
INSERT INTO `ftyr_nav` VALUES ('20', '1', '19', '加盟优势', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"11\";}}', '', '1', '0', '0-19-20');
INSERT INTO `ftyr_nav` VALUES ('21', '1', '19', '加盟支持', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"12\";}}', '', '1', '0', '0-19-21');
INSERT INTO `ftyr_nav` VALUES ('22', '1', '19', '加盟条件', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"13\";}}', '', '1', '0', '0-19-22');
INSERT INTO `ftyr_nav` VALUES ('23', '1', '19', '店面形象', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"20\";}}', '', '1', '0', '0-19-23');
INSERT INTO `ftyr_nav` VALUES ('24', '1', '19', '加盟流程', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}', '', '1', '0', '0-19-24');
INSERT INTO `ftyr_nav` VALUES ('25', '1', '0', '服务与支持', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"16\";}}', '', '1', '0', '0-25');
INSERT INTO `ftyr_nav` VALUES ('26', '1', '25', '技术实力', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"16\";}}', '', '1', '0', '0-25-26');
INSERT INTO `ftyr_nav` VALUES ('27', '1', '25', '疑问解答', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}', '', '1', '0', '0-25-27');
INSERT INTO `ftyr_nav` VALUES ('28', '1', '25', '下载中心', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"21\";}}', '', '1', '0', '0-25-28');
INSERT INTO `ftyr_nav` VALUES ('29', '1', '0', '新闻中心', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}', '', '1', '0', '0-29');
INSERT INTO `ftyr_nav` VALUES ('30', '1', '29', '公司新闻', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"16\";}}', '', '1', '0', '0-29-30');
INSERT INTO `ftyr_nav` VALUES ('31', '1', '29', '行业动态', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"17\";}}', '', '1', '0', '0-29-31');
INSERT INTO `ftyr_nav` VALUES ('32', '1', '29', '视频中心', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"18\";}}', '', '1', '0', '0-29-32');
INSERT INTO `ftyr_nav` VALUES ('33', '1', '0', '联系我们', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"21\";}}', '', '1', '0', '0-33');
INSERT INTO `ftyr_nav` VALUES ('34', '1', '33', '联系方式', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"21\";}}', '', '1', '0', '0-33-34');
INSERT INTO `ftyr_nav` VALUES ('35', '1', '33', '加入我们', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"20\";}}', '', '1', '0', '0-33-35');
INSERT INTO `ftyr_nav` VALUES ('36', '2', '0', '产品展示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-36');
INSERT INTO `ftyr_nav` VALUES ('37', '2', '36', '工业水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"5\";}}', '', '1', '0', '0-36-37');
INSERT INTO `ftyr_nav` VALUES ('38', '2', '36', '工程水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"6\";}}', '', '1', '0', '0-36-38');
INSERT INTO `ftyr_nav` VALUES ('39', '2', '36', '家装水漆', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"9\";}}', '', '1', '0', '0-36-39');
INSERT INTO `ftyr_nav` VALUES ('40', '2', '0', '服务与支持', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}', '', '1', '0', '0-40');
INSERT INTO `ftyr_nav` VALUES ('41', '2', '40', '技术实力', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"13\";}}', '', '1', '0', '0-40-41');
INSERT INTO `ftyr_nav` VALUES ('42', '2', '40', '疑问解答', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}', '', '1', '0', '0-40-42');
INSERT INTO `ftyr_nav` VALUES ('43', '2', '40', '下载中心', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"15\";}}', '', '1', '0', '0-40-43');
INSERT INTO `ftyr_nav` VALUES ('44', '3', '0', '加盟优势', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"11\";}}', '', '1', '0', '0-44');
INSERT INTO `ftyr_nav` VALUES ('45', '3', '0', '加盟支持', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"12\";}}', '', '1', '0', '0-45');
INSERT INTO `ftyr_nav` VALUES ('46', '3', '0', '加盟条件', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"13\";}}', '', '1', '0', '0-46');
INSERT INTO `ftyr_nav` VALUES ('47', '3', '0', '店面形象', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"20\";}}', '', '1', '0', '0-47');
INSERT INTO `ftyr_nav` VALUES ('48', '3', '0', '加盟流程', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}', '', '1', '0', '0-48');
INSERT INTO `ftyr_nav` VALUES ('49', '4', '0', '技术实力', '', 'a:2:{s:6:\"action\";s:17:\"Portal/Page/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"16\";}}', '', '1', '0', '0-49');
INSERT INTO `ftyr_nav` VALUES ('50', '4', '0', '疑问解答', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"14\";}}', '', '1', '0', '0-50');
INSERT INTO `ftyr_nav` VALUES ('51', '4', '0', '下载中心', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:2:\"21\";}}', '', '1', '0', '0-51');

-- ----------------------------
-- Table structure for ftyr_nav_cat
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_nav_cat`;
CREATE TABLE `ftyr_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of ftyr_nav_cat
-- ----------------------------
INSERT INTO `ftyr_nav_cat` VALUES ('1', '主导航', '1', '主导航');
INSERT INTO `ftyr_nav_cat` VALUES ('2', '底部导航', '0', '底部导航');
INSERT INTO `ftyr_nav_cat` VALUES ('3', '招商加盟左侧导航', '0', '招商加盟左侧导航');
INSERT INTO `ftyr_nav_cat` VALUES ('4', '服务与支持左侧菜单', '0', '服务与支持左侧菜单');

-- ----------------------------
-- Table structure for ftyr_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_oauth_user`;
CREATE TABLE `ftyr_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of ftyr_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_options
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_options`;
CREATE TABLE `ftyr_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of ftyr_options
-- ----------------------------
INSERT INTO `ftyr_options` VALUES ('1', 'member_email_active', '{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `ftyr_options` VALUES ('6', 'site_options', '{\"site_name\":\"\\u798f\\u6cf0\\u5370\\u67d3\",\"site_host\":\"http:\\/\\/www.futaiyr.com\",\"site_logo\":\"admin\\/20170101\\/586860090da5a.png\",\"site_erweima\":\"admin\\/20170102\\/586a2cc6ba337.png\",\"site_admin_url_password\":\"\",\"site_tpl\":\"futaiyr\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\",\"site_admin_email\":\"admin@futaiyr.com\",\"site_tongji\":\"\",\"site_copyright\":\"Copyright \\u00a9 2015 \\u7248\\u6743\\u6240\\u6709\\uff1a\\u5e7f\\u5dde\\u5e02\\u91d1\\u767e\\u5408\\u6c34\\u6f06\\u6709\\u9650\\u516c\\u53f8  All Rights Reserved.\",\"site_seo_title\":\"\\u798f\\u6cf0\\u5370\\u67d3\",\"site_seo_keywords\":\"\\u798f\\u6cf0\\u5370\\u67d3\",\"site_seo_description\":\"\\u798f\\u6cf0\\u5370\\u67d3\",\"urlmode\":\"2\",\"html_suffix\":\"html\",\"comment_time_interval\":\"60\"}', '1');
INSERT INTO `ftyr_options` VALUES ('7', 'cmf_settings', '{\"banned_usernames\":\"\"}', '1');
INSERT INTO `ftyr_options` VALUES ('8', 'cdn_settings', '{\"cdn_static_root\":\"\"}', '1');

-- ----------------------------
-- Table structure for ftyr_plugins
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_plugins`;
CREATE TABLE `ftyr_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of ftyr_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_posts
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_posts`;
CREATE TABLE `ftyr_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of ftyr_posts
-- ----------------------------
INSERT INTO `ftyr_posts` VALUES ('1', '1', '公司简介', null, '2017-01-01 11:49:28', '<p>&nbsp; &nbsp; &nbsp; &nbsp; 广州金百合水漆有限公司成立于1998年，位于广东省广州市，是集水漆生产、建材贸易、工程施工等为一体的现代化公司。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 自建厂以来，集团一直专注于水漆的研发、生产与销售，现年产具有国际领先水平的百余种环保节能水漆12.5万吨，是全水漆生产企业。旗下产品被广泛应用到建筑、装饰、家具、家装、家电、汽车、船舶、交通、轻工、电力等多个行业。我公司注重产品质量和品牌价值引领。旗下产品覆盖家装水漆、工程水漆、工业水漆等几大系列上百个品种，并相继通过ISO9000国际质量体系认证、欧盟SGS环保检测认证及德国TUV环保检测认证，具备与国际品牌比肩竞争实力。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 我公司始终遵循“创新、拼搏、团结、务实”的企业精神，永无止境追求“质量第一、顾客至上、持续改进、精益求精”为公司宗旨。公司原则：对客户负责、对社会负责、对员工负责。不断自我完善和持续改革，一丝不苟为客户提供优质服务，不断满足用户需求，持续提升服务品质，创造出良好的商业和社会价值。热情欢迎各界人士与我们携手共进，创造更美好、更灿烂的明天！</p><p style=\"text-align: center;\"><img src=\"/data/upload/ueditor/20170101/586881b9d53a8.jpg\" title=\"8149a83c-0dca-4bfd-8a09-967711cf6c95.jpg\" alt=\"8149a83c-0dca-4bfd-8a09-967711cf6c95.jpg\"/></p>', '公司简介', '公司简介', '1', '1', '2017-01-01 11:49:11', null, '0', '2', '', '0', '{\"template\":\"about\",\"thumb\":\"portal\\/20170104\\/586c578583409.jpg\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('2', '1', '组织机构', null, '2017-01-01 12:22:30', '<p style=\"text-align: center;\"><img src=\"/data/upload/ueditor/20170101/58688402bd7dd.jpg\" title=\"47995734-4458-432b-8aa4-e4b398849a60.jpg\" alt=\"47995734-4458-432b-8aa4-e4b398849a60.jpg\"/></p>', '组织机构', '组织机构', '1', '1', '2017-01-01 12:22:06', null, '0', '2', '', '0', '{\"template\":\"about\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('3', '1', '资格证书', null, '2017-01-01 12:30:38', '', '资格证书', '资格证书', '1', '1', '2017-01-01 12:30:25', null, '0', '2', '', '0', '{\"template\":\"zigezhengshu\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('4', '1', '企业文化', null, '2017-01-01 12:30:54', '<h5>\n	核心价值观</h5><p>\n	“团队”文化，“员工”、“客户”、“公司”三位一体<br/>\n	&nbsp;</p><h5><span style=\"font-size: 1.6rem; line-height: 1.6em;\">经营理念</span></h5><p>\n	资源有限 循环无限 以人为本 科学发展<br/>\n	&nbsp;</p><h5>\n	管理方针</h5><p>\n	以人为本 守法合规 精益求精 持续改进<br/>\n	&nbsp;</p><h5>\n	企业精神</h5><p>\n	交往要“坦诚”、“友善”</p><p>\n	行事要“规范”、“透明”</p><p>\n	做人要“三心”：同心、用心、交心</p><p>\n	“三型”企业和员工：“挑战型”、“学习型”、“前进型”<br/>\n	&nbsp;</p><h5>\n	工作标准</h5><p>\n	合理、经济、效率</p><p>\n	“文化统一、职责明确、流程清晰”的规范化管理目标<br/>\n	&nbsp;</p><h5>\n	管理目标</h5><p>\n	“文化统一、职责明确、流程清晰”</p><p>\n	&nbsp;</p><p style=\"text-align: center;\"><img title=\"6749e4a5-031c-475b-8c0c-51f21b9db8d6.jpg\" alt=\"6749e4a5-031c-475b-8c0c-51f21b9db8d6.jpg\" src=\"/data/upload/ueditor/20170101/5868883a40d0a.jpg\"/>\n	&nbsp;</p>', '企业文化', '企业文化', '1', '1', '2017-01-01 12:30:40', null, '0', '2', '', '0', '{\"template\":\"about\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('5', '1', '发展历程', null, '2017-01-01 12:31:06', '<p>\r\n	1998年8月，金百合成立</p><p>\r\n	1999年12月，我公司成功研制出丙烯酸系列内墙乳胶漆。</p><p>\r\n	2000年1月，金百合通过ISO9000国际质量体系认证证书。</p><p>\r\n	2003年1月，我公司荣获“二00二年度广东省市场民用品生产企业产品质量、售后服务双满意单位”称号。</p><p>\r\n	2005年7月，为杜绝城区小广告的污染，解决全国城市面临的顽症，金百合在全国涂料行业率先推出抗涂鸦漆，用该漆美化街道，因为它的高科技含量和致密性同玻璃相媲美，使小广告不再有滋生的可能。</p><p>\r\n	2006年4月，金百合系列产品通过欧盟SGS环保检测认证。</p><p>\r\n	2007年3月，我公司被评为“国家优质工程百佳品牌材料供应商”。</p><p>\r\n	2008年4月，我公司投资3.1亿立项年产3.5万吨水性涂料项目。</p><p>\r\n	2010年7月，我公司申报的河北省水性涂料工程技术研究中心顺利通过了河北省科技厅、省财政厅、省发改委组织的专家论证，被纳入省级工程技术研究中心管理序列。</p><p>\r\n	2014年11月，金百合水漆入选2013年度中国建筑装饰百强推荐品牌企业</p><p>\r\n	2012年8月，广州天河水漆专卖店重装开业！</p>', '发展历程', '发展历程', '1', '1', '2017-01-01 12:30:55', null, '0', '2', '', '0', '{\"template\":\"about\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('6', '1', '企业愿景', null, '2017-01-01 12:31:19', '<h5 style=\"text-align: center;\">\r\n	企业愿景---致力于成为世界一流的涂料供应商和应用技术的引领者</h5><p>\r\n	&nbsp;</p><p><strong>在战略定位上</strong></p><p>\r\n	公司致力于成为具有世界水平的皮化供应商，整合公司营销、技术、服务、管理及文化的综合资源与优势，构建以客户服务——产品研发——提供系统解决方案为核心的组织机构，实施以满足个性化服务为基础的竞争战略，实现公司成为国内行业第一品牌，占有国内最高市场份额并具有较强国际竞争力的战略目标。</p><p><strong>在员工培养上</strong></p><p>\r\n	公司坚持“以德为先，人尽其才”的用人原则和管理理念； “认同公司、认同自我、和谐共进”作为员工共同的行为准则，形成了以“平等、公正、创新、民主”为基本内涵的组织伦理，“敬业、沟通、自律”为基本内涵的主导舆论，提升员工的责任意识、沟通能力与协作技巧，促进团队合作精神，以实现“发展企业发展人”的人力资源管理目标。</p><p><strong style=\"line-height: 1.8;\">我们的梦想是</strong></p><p>\r\n	以“为行业为人带来进步”和 “携手创造、共享成果”的为核心，打造合作的企业、科技的企业、创新的企业。强化组织建设，提高组织效率，激活组织，激活员工。生产一流的产品，提供一流的服务，铸就一流的品牌，培养一流的人才，打造一流的企业，作出一流的贡献。</p><p><strong>我们的指导原则是</strong></p><p><span style=\"line-height: 1.8;\">“以人为本，以诚为本”的企业道德与“科技领先”的科研精神，谋求行业的进步，为社会创造价值，为民族做贡献，为员工的发展和幸福而努力，为客户提供优质的技术服务和高科技产品，促进客户发展。</span></p><p>\r\n	&nbsp;</p><p style=\"text-align: center;\"><img alt=\"fbe9d3fd-2a93-4c73-b363-5fc8ac416c0d.jpg\" src=\"/data/upload/ueditor/20170101/5868875986fab.jpg\" style=\"width: 758px; height: 153px;\" title=\"fbe9d3fd-2a93-4c73-b363-5fc8ac416c0d.jpg\"/></p>', '企业愿景', '企业愿景', '1', '1', '2017-01-01 12:31:07', null, '0', '2', '', '0', '{\"template\":\"about\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('7', '1', '测试产品', '测试产品', '2017-01-02 13:26:30', '<p>测试产品</p>', '测试产品', '测试产品', '1', '1', '2017-01-04 15:35:46', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170102\\/5869e54daa600.png\",\"template\":\"product\"}', '10', '0', '0', '1');
INSERT INTO `ftyr_posts` VALUES ('8', '1', '测试产品2', '测试产品2', '2017-01-02 13:30:31', '<p>测试产品2</p>', '测试产品2', '测试产品2', '1', '1', '2017-01-04 15:26:24', null, '0', '1', '', '0', '{\"thumb\":\"portal\\/20170102\\/5869e58c7e0fe.jpg\",\"template\":\"product\"}', '94', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('9', '1', '脚手架', '脚手架', '2017-01-03 10:25:09', '<p style=\"text-align: center;\"><img src=\"/data/upload/ueditor/20170103/586b0b9eac017.jpg\" title=\"67646585-6f24-4e36-90f7-c24c35389618_400_300_UniformFill.jpg\" alt=\"67646585-6f24-4e36-90f7-c24c35389618_400_300_UniformFill.jpg\"/></p>', '脚手架', '脚手架', '1', '1', '2017-01-03 11:25:46', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170103\\/586b0bac78642.jpg\",\"template\":\"case\"}', '1', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('10', '1', '大型机械', '大型机械', '2017-01-03 10:26:15', '<p style=\"text-align: center;\"><img src=\"/data/upload/ueditor/20170103/586b0bd10825c.jpg\" title=\"58ece6e7-c427-4589-9f11-f10f8c4837d3_400_300_UniformFill.jpg\" alt=\"58ece6e7-c427-4589-9f11-f10f8c4837d3_400_300_UniformFill.jpg\" width=\"700\" height=\"464\" border=\"0\" vspace=\"0\" style=\"width: 700px; height: 464px;\"/></p>', '大型机械', '大型机械', '1', '1', '2017-01-03 11:46:40', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170103\\/586b0bd86d7f0.jpg\",\"template\":\"case\"}', '12', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('11', '1', '加盟优势', null, '2017-01-03 13:31:02', '<ul class=\" list-paddingleft-2\"><li><p>\r\n		中国水漆领导品牌</p></li><li><p>\r\n		水性涂装的发起者与探索者</p></li><li><p>\r\n		中国工业水漆领军品牌</p></li><li><p>\r\n		中国木器水漆领导品牌</p></li><li><p>\r\n		中国墙面水漆领导品牌</p></li></ul><p>\r\n	&nbsp;</p><h5>\r\n	行业最全的产品线：</h5><p>\r\n	无论是墙面环保装饰水漆，还是金属防护装饰水漆，亦或是木器家具保护木器水漆，又或者是三者都能用的多功能水漆，总能找到专属于自己的那一款。</p><h5>\r\n	稳定的产品品质：</h5><p>\r\n	从原材料采购，到制造生产，再到质检包装，我们严格把控每一个环节，确保品质稳定，不让一桶不合格产品流入市场。</p><h5>\r\n	专业的施工服务：</h5><p>\r\n	五星级技术施工服务团队，为产品施工服务保驾护航</p><p>\r\n	&nbsp;</p><p><img alt=\"9f698058-1219-41aa-8815-f8909e2befd4.jpg\" src=\"/data/upload/ueditor/20170103/586b370659388.jpg\" style=\"width: 445px; height: 483px;\" title=\"9f698058-1219-41aa-8815-f8909e2befd4.jpg\"/></p>', '加盟优势', '中国水漆领导品牌\r\n水性涂装的发起者与探索者\r\n中国工业水漆领军品牌\r\n中国木器水漆领导品牌\r\n中国墙面水漆领导品牌', '1', '1', '2017-01-03 13:29:22', null, '0', '2', '', '0', '{\"template\":\"zhaoshangjiameng\",\"thumb\":\"portal\\/20170104\\/586cb36eecd40.jpg\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('12', '1', '加盟支持', null, '2017-01-03 13:35:20', '<p>\r\n	1、全年12个月无间断培训，手把手教会你卖水漆，店面盈利率超90%</p><p>\r\n	2、提供店铺选址、手续办理、店面设计装修、日常营运等方面进行专项咨询和指导。</p><p>\r\n	3、开业整体策划，专人协助开业，复制成功模式。</p><p>\r\n	4、开业后持续运营维护，提供完善的管理体制及专业知识，定期到访，探讨问题并协助解决。&nbsp;</p><p>\r\n	&nbsp;</p><p><img alt=\"2aff1f99-ccd0-4321-afe5-0d6b27b56f25.jpg\" src=\"/data/upload/ueditor/20170103/586b3803efd34.jpg\" style=\"width: 443px; height: 174px;\" title=\"2aff1f99-ccd0-4321-afe5-0d6b27b56f25.jpg\"/></p>', '加盟支持', '1、全年12个月无间断培训，手把手教会你卖水漆，店面盈利率超90%\r\n2、提供店铺选址、手续办理、店面设计装修、日常营运等方面进行专项咨询和指导。\r\n3、开业整体策划，专人协助开业，复制成功模式。\r\n4、开业后持续运营维护，提供完善的管理体制及专业知识，定期到访，探讨问题并协助解决。', '1', '1', '2017-01-03 13:34:33', null, '0', '2', '', '0', '{\"template\":\"zhaoshangjiameng\",\"thumb\":\"portal\\/20170104\\/586cb3849914d.jpg\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('13', '1', '加盟条件', null, '2017-01-03 13:36:12', '<ul class=\"iconlist iconlist-check list-paddingleft-2\"><li><p>\r\n		认同金百合水漆的品牌理念，对水漆环保涂装行业充满激情</p></li><li><p>\r\n		诚信、远见，有持续发展的战略胸怀</p></li><li><p>\r\n		具备一定的营销管理思维，有成为大老板的潜力</p></li><li><p>\r\n		接受金百合水漆培训学院的系统培训，同成长、共前行</p></li></ul>', '加盟条件', '认同金百合水漆的品牌理念，对水漆环保涂装行业充满激情\r\n诚信、远见，有持续发展的战略胸怀\r\n具备一定的营销管理思维，有成为大老板的潜力\r\n接受金百合水漆培训学院的系统培训，同成长、共前行', '1', '1', '2017-01-03 13:35:35', null, '0', '2', '', '0', '{\"template\":\"zhaoshangjiameng\",\"thumb\":\"portal\\/20170104\\/586cb3a7e5279.jpg\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('14', '1', '加盟流程', null, '2017-01-03 13:37:29', '<p><strong>客户前期咨询（020-1234 5678）</strong><br/>\r\n	1、初步接洽，了解项目情况，达成加盟意向（电话或面谈）。</p><p><strong>资格审核</strong><br/>\r\n	1、提交加盟要求，填写《加盟申请表》，并提供加盟城市以及意向铺位的有关情况；<br/>\r\n	2、法人身份证等有效证件复印件；<br/>\r\n	3、签订意向书，加盟商负担总部的前期考察费（含考察人员往返路费、食宿费）。</p><p><strong>实地商圈调查</strong><br/>\r\n	1、对城市与铺位商圈进行实地调查，并提供项目评估报告供参考；<br/>\r\n	2、与加盟商讨论落实铺位是否合适。</p><p><strong>签订正式合同</strong><br/>\r\n	1、与加盟商签订特许经营协议，并按协议缴纳各项费用（加盟金、保证金）；<br/>\r\n	2、商定开业事宜，总部制定开业进度总表。</p><p><strong>店面装修及前期筹备</strong><br/>\r\n	1、总部帮助审阅设计方案；<br/>\r\n	2、装修同时总部安排管理人员进行员工招聘和培训；<br/>\r\n	3、总部协助加盟店制订开业推广方案。</p><p><strong>装修验收及证照办理</strong><br/>\r\n	1、按图纸对装修工程进行验收；<br/>\r\n	2、装修同时开始办理营业执照等开业相关手续。</p><p><strong>人员培训</strong><br/>\r\n	1、总部安排人员下店培训新员工；<br/>\r\n	2、加盟店员工到总部实习培训。</p><p><strong>开店前筹备</strong><br/>\r\n	1、有关设备确定到位，技术设备进行周密调试；<br/>\r\n	2、人员配备到位，并向总部订购首批物料。</p><p><strong>开业</strong><br/>\r\n	1、加盟商向总部提交开业所需的营业证照及有关批文；<br/>\r\n	2、加盟管理部交接有关资料，对加盟店进行指导管理；<br/>\r\n	3、剪彩开业。</p>', '加盟流程', '加盟流程', '1', '1', '2017-01-03 13:36:58', null, '0', '2', '', '0', '{\"template\":\"zhaoshangjiameng\",\"thumb\":\"portal\\/20170104\\/586cb3b88b466.jpg\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('15', '1', '广州白云5号停机坪专卖店', '广州白云5号停机坪专卖店', '2017-01-03 14:20:36', '', '广州白云5号停机坪专卖店', '广州白云5号停机坪专卖店', '1', '1', '2017-01-03 14:22:10', null, '0', '3', '', '0', '{\"thumb\":\"portal\\/20170103\\/586b42f9e767f.jpg\",\"photo\":[{\"url\":\"portal\\/20170103\\/586b4301a64a8.jpg\",\"alt\":\"0ce3637e-8ed8-40c8-a1df-0f60fc53fab4_1000_700_UniformFill.jpg\"},{\"url\":\"portal\\/20170103\\/586b4307d7451.jpg\",\"alt\":\"abbe855a-ecc3-494a-9ab3-885dba17a79e_1000_700_UniformFill.jpg\"},{\"url\":\"portal\\/20170103\\/586b430d4131e.jpg\",\"alt\":\"18735581-8c5d-4432-94e2-e9a065537a39_1000_700_UniformFill.jpg\"}]}', '50', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('16', '1', '技术实力', null, '2017-01-03 16:39:56', '<div class=\"typo\"><a href=\"#\"><img class=\"typo_img\" src=\"http://cdnhimgs.srxsfjy.com/portals/758/staticfile/default/916db622-0589-4cf9-9b64-164d36cc1d7e.jpg\" style=\"width: 262px; height: 237px;\"/></a><div class=\"typo_text\"><h5>\r\n			我们的团队</h5><p>\r\n			技术中心现拥有科研人员近200名，此外，还建有企业技术中心、广东省水性涂料工程技术研究中心、广东省企业技术中心两个科研中心，并设立技术委员会作为中心的决策、督导、顾问、管理机构。中心包括创新决策、创新管理、创新研发及创新支撑四大体系。技术中心现有建筑面积2000平方米，投资1500余万元，公司设有专门的检测中心，拥有检测全系列水性漆产品所需的各种仪器设备。除可独立检测粘度、硬度、耐盐雾性等20余项水性漆常规指标外，还可检测产品中各种有害重金属（铅、镉、铬、汞等）和有机物（苯类、醛类等）的含量等指标。 公司还建成了模拟实验室。</p></div></div><p>\r\n	&nbsp;</p><div class=\"typo\"><a href=\"#\"><img class=\"typo_img\" src=\"http://cdnhimgs.srxsfjy.com/portals/758/staticfile/default/c6f4abac-4983-440e-96dc-c5f3cb847331.jpg\" style=\"width: 262px; height: 237px;\"/></a><div class=\"typo_text\"><h5>\r\n			研发科技项目和申报专利</h5><p>\r\n			至今，技术中心共研发完成科技项目30余项，承担省部级以上项目8项，市级科研任务4项，其中“新型水性节能建筑漆项目”列为河北省重点产业振兴和技术改造项目。</p><p>\r\n			申报专利《一种风电叶片用腻子及其制备方法》、《一种风电叶片用水性氟碳面漆及其制备方法》、《一种防潮防霉涂料及其制备方法》、《一种防盗门用水性丙烯酸氨基面漆及其制备方法》、《一种防盗门用水性醇酸氨基底漆及其制备方法》、《一种工程履带用水性浸漆及其制备方法》、《一种释放负离子水性环氧地坪涂料及其制备方法》、《一种彩色透明玻璃漆及其制备方法》、《一种水性丙烯酸聚氨酯面漆及其制备方法》、《一种水性环氧富锌底漆及其制备方法》、《一种水性环氧厚浆中涂漆及其制备方法》等50项。</p></div></div><p>\r\n	&nbsp;</p><div class=\"typo\"><a href=\"#\"><img class=\"typo_img\" src=\"http://cdnhimgs.srxsfjy.com/portals/758/staticfile/default/fcde8005-01ba-47d2-b719-2fa885a5e347.jpg\" style=\"width: 262px; height: 237px;\"/></a><div class=\"typo_text\"><h5>\r\n			产品为国内外首创，技术为国际先进</h5><p>\r\n			获得省部科技成果鉴定“防潮防霉涂料”、“工程履带用水性浸漆”、“沙发件专用水性浸漆”、“建筑用反射隔热涂料”“室内薄型钢结构防火涂料”“水性环氧地坪涂料”“外墙无机建筑涂料”“水包水多彩涂料”“水性聚醚改性醇酸树脂”“风电塔架水性防腐涂料研究与应用”等17项，均达到国内领先水平。其中“水溶性醇酸树脂”、 “防潮防霉涂料”、“室内薄型钢结构防火涂料”、“建筑用反射隔热涂料”研究成果获保定市科技进步二等奖；“水性金属防护漆”、“水性柳编漆”、“水性环氧防腐涂料”“水性环氧地坪涂料”、“工程履带用水性浸漆”获得广州市科技进步一等奖；“水性金属防护漆”获广东省科技进步三等奖，获2012年度国家重点新产品；“风电塔架水性防腐涂料研究与应用”通过了中国石油和化学工业联合会专家组评定，产品为国内外首创，技术为国际先进。</p></div></div>', '技术实力', '技术实力', '1', '1', '2017-01-03 16:39:10', null, '0', '2', '', '0', '{\"template\":\"jssl\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('17', '1', '环氧烤漆在高温烘烤浸涂上要注意什么？', '', '2017-01-03 19:09:11', '<p>\r\n	1.漆罐必须盖紧并置于小孩触不着的地方。</p><p>\r\n	2.当在通风不足的情况下进行喷涂时应配有适当的呼吸设备。</p><p>\r\n	3.所有的呼吸设备必须符合经（NOISH/MSHA）认可的标准。</p><p>\r\n	4.如不慎溅入眼睛，马上用大量清水冲洗并到医院就诊。</p>', '环氧烤漆在高温烘烤浸涂上要注意什么？', '环氧烤漆在高温烘烤浸涂上要注意什么？', '1', '1', '2017-01-03 19:22:48', null, '0', '5', '', '0', '{\"thumb\":\"\",\"template\":\"yinanjieda\"}', '6', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('18', '1', '学习ISO管理体系，构造企业文化', '', '2017-01-04 19:54:00', '<p>\r\n	5月28.29.30日，我司举行ISO培训课程的学习，各大部门主管、组长及少数公司普通成员参加了该项目的培训学习。公司长久以来坚持培养员工学习的氛围，多次举行各类技能、思想、营销方面的学习，构建以价值观为本的企业文化。</p><p>\r\n	ISO管理体系的制定与执行是一个公司可持续发展以及生存的一大关键，本次培训学习由陈奇老师主讲，向大家系统的介绍了ISO管理体例过程、模式以及各方面的制定与实行的关键点，让大家充分了解ISO对于公司的重要性。</p><p>\r\n	ISO管理体系是一个公司管理的最有效的框架，可根据每个公司的性质、特点、发展方向、人员、部门职能、个人技能等进行有效的规范以及梳理。</p><p>\r\n	通过了ISO9001质量体系认证，有着深厚的文化底蕴;自实行ISO管理体系以来，不论是公司的发展还是员工的积极性、价值观等都得到了充分的规范以及发展，是公司立足现在、客户信赖、展望未来的强有力支持。</p><p>\r\n	公司的ISO管理体系分为一、二、三、四一共四阶，主要包括质量管理、人力管理、工程变更、研发创新、生产计划控制、生产过程管控、业务作业控制、管理评审程序、内部审核程序、订单评审程序、客户投诉及退货处理程序、纠正与预防措施控制程序、数据分析与改正程序、顾客满意度调查程序等方面。</p><p>\r\n	为期三天的ISO管理体系培训学习将会为大家系统全面的讲解这套体系的整体流程，让大家更加深刻的了解这套体系的深刻意义，更好的规范广大员工生活上、工作上的行为准则。</p><p>\r\n	古语云：无规矩不成方圆，如果一个公司、一个企业的制度是松垮的、懒散的，那么这个公司的未来堪忧，势必没落走向灭亡，国有国法，家有家规，真正的以人为本，真正的自由是建立在完善的管理体系下的，只有在完善的ISO管理体系下，才能创造价值，达成目标，实现理想，构造企业优良的文化氛围。</p>', '学习ISO管理体系，构造企业文化', '5月28.29.30日，我司举行ISO培训课程的学习，各大部门主管、组长及少数公司普通成员参加了该项目的培训学习。公司长久以来坚持培养员工学习的氛围，多次举行各类技能、思想、营销方面的学习，构建以价值观为本的企业文化。', '1', '1', '2017-01-04 16:24:20', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170104\\/586caf4a716ad.jpg\",\"template\":\"\"}', '5', '0', '1', '1');
INSERT INTO `ftyr_posts` VALUES ('19', '1', '视频名称 2', '视频名称 2', '2017-01-03 20:00:58', '<p><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://7xj90f.com1.z0.glb.clouddn.com/mp4-02.mp4\" width=\"420\" height=\"280\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p>', '视频名称 2', '视频名称 2', '1', '1', '2017-01-03 20:01:57', null, '0', '4', '', '0', '{\"thumb\":\"portal\\/20170103\\/586b92b243e1a.jpg\",\"template\":\"\"}', '5', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('20', '1', '加入我们', null, '2017-01-03 20:23:41', '<h5>\r\n	一、IPQC</h5><p><strong>要求：</strong><br/>\r\n	1.18-32周岁；<br/>\r\n	2.初中及初中以上文化；<br/>\r\n	3.熟悉QC七大手法及抽样检验流程，能对异常进行处理；<br/>\r\n	4.熟练操作Word、Excell等办公软件；<br/>\r\n	5.有责任心，能完成上级安排任务。</p><p>\r\n	&nbsp;</p><h5><span style=\"line-height: 1.8;\">二、保安</span></h5><p><span style=\"line-height: 1.8;\"><strong>要求：</strong><br/>\r\n	1、男，25-50周岁，初中及以上学历；<br/>\r\n	2、负责公司门禁管理及上级指派的其他任务；</span><br/><span style=\"line-height: 1.8;\">3、能吃苦耐劳，执行力强，服从安排。&nbsp;</span></p><p>\r\n	&nbsp;</p><h5><span style=\"line-height: 1.8;\">三、电子商务</span></h5><p><span style=\"line-height: 1.8;\">女&nbsp; 23岁以上 </span></p><p><span style=\"line-height: 1.8;\"><strong>任职要求：</strong><br/>\r\n	1、英语口语表达能力强；&nbsp;<br/>\r\n	2、熟悉基本商务接待礼仪；<br/>\r\n	3、善于沟通，执行能力强，学习接受能力强；</span></p><p><strong>职位描述：</strong><br/>\r\n	1、业务部对外邮件翻译及传达；<br/>\r\n	2、协助总经理、业务经理做好外宾来访的接待工作，公司基本介绍、产品介绍、技术专利介绍；<br/>\r\n	3、电子商务平台的使用及管理（可参加电商的专业培训，学习合格后上岗）；&nbsp;<br/>\r\n	4、上级安排的其它临时事项；</p>', '加入我们', '加入我们', '1', '1', '2017-01-03 20:22:38', null, '0', '2', '', '0', '{\"template\":\"joinus\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('21', '1', '联系方式', null, '2017-01-03 20:25:15', '<h4>\r\n	广州金百合水漆有限公司<br/>\r\n	&nbsp;</h4><p><span style=\"line-height: 1.8;\">电话：020-1234 5678</span></p><p>\r\n	传真：020-1234 5678</p><p>\r\n	邮箱： demo@126.com</p><p>\r\n	地址：广州市越秀区广卫路二号之一广卫商务大厦</p>', '联系方式', '联系方式', '1', '1', '2017-01-03 20:24:01', null, '0', '2', '', '0', '{\"template\":\"contact\",\"thumb\":\"\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('22', '1', 'layer', 'layer', '2017-01-04 09:14:49', '<p>layer</p>', 'layer', 'layer', '3', '1', '2017-01-04 09:15:10', null, '0', '6', '', '0', '{\"file\":\"portal\\/20170104\\/586c4c928d770.zip\",\"thumb\":\"\",\"template\":\"download_list\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('23', '1', '家装漆施工指南（详细）', '', '2017-01-04 09:35:29', '<p><a class=\"article-title\" href=\"http://industrialcoatingl.81yk.com/Portals/758/Images/Article/53efcfb6-2dad-468f-bfc0-9f33b25aeb7e.rar\" target=\"_blank\" style=\"color: rgb(51, 51, 51); text-decoration: none; padding-left: 15px; display: inline-block; line-height: 20px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, Arial, sans-serif; font-size: 14px; white-space: normal; background: url(&quot;../images/style-blue/icon-dot.gif&quot;) 0px 8px no-repeat rgb(255, 255, 255);\">家装漆施工指南（详细）</a></p>', '家装漆施工指南（详细）', '家装漆施工指南（详细）', '1', '1', '2017-01-04 09:36:33', null, '0', '6', '', '0', '{\"file\":\"portal\\/20170104\\/586c519762c76.rar\",\"thumb\":\"\",\"template\":\"download_list\"}', '0', '0', '0', '0');
INSERT INTO `ftyr_posts` VALUES ('24', '1', '硅胶销售技巧分享', '硅胶销售技巧分享', '2017-01-04 15:57:43', '<p>\r\n	&nbsp;今天早会上，外贸部门的销售能手上台分享了硅胶销售经验，虽然其内容大都讲的是整个销售过程，表面上看是针对于公司的外贸销售部门，可整个案例给整个公司的员工也都带来了启发，让我们学会了该如何成功的做好一件事情。</p><p>\r\n	会上分享了两个案例，分别是一个交易过程相对顺畅的客户和一个比较棘手的客户。对交易过程相对顺畅的客户，该业务员表示仅用了6个工作日就达成了交易，期间是因为自己提供高出客户期望的服务和真诚打动了客户，赢得信任，所以整个过程都非常理想。而对于另外一个客户，从今年6月份开始到前不久才算真正完成了这一笔硅胶交易，中间还少不了各种问题的调节，俗话说好事多磨，耐得住客户的刁钻，解决得了客户的各种问题才可以取得客户的高度信任。不过他表示，无论是哪一个客户，都少不了团队的帮助，是同事的共同协作，才有了这么好的业绩。让我们再次感受到了团队的力量。</p><p>\r\n	销售部门是一个公司的经济命脉，公司的收入来源主要靠销售部门的业绩，所以在公司一般都会受到重视。但我们都知道，一个公司就是一个志同道合的团队，是一个不可分割的整体，没有其他部门的支持与配合无法达到最好的状态，自然不能产生最大的效益。因为产品销量好，除了拥有优秀的销售团队外，还需要有高质量的产品和最优秀的幕后团队。</p>', '硅胶销售技巧分享', '硅胶销售技巧分享', '1', '1', '2017-01-04 16:31:58', null, '0', '4', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '1', '0', '0', '1');
INSERT INTO `ftyr_posts` VALUES ('25', '1', '适应文化 转换角色--入职新员工进行培训', '适应文化 转换角色--入职新员工进行培训', '2017-01-04 15:58:18', '<p>\r\n	7月9日至14日，我司对25名新入职名员工进行入职培训和拓展训练。</p><p>\r\n	入职培训在我司会议室举行，培训内容包括：“安全教育”、“公司简介”、“员工职业生涯规划”、“规章制度”、“产品及市场”、“公司生产情况”、“财务知识”，由公司部门领导主讲。</p><p>\r\n	最后公司董事长与新员工见了面，并且对新员工提出了5点建议和期望，他希望新员工能尽快融入到华大这个大家庭，华大也将为新员工提供良好的发展平台。</p><p>\r\n	期间，新入职员工在养马岛进行为期一天的拓展训练。</p><p style=\"text-align: center;\"><img alt=\"671c579d-3932-4a5f-be1a-ccfb627c6ce0.jpg\" src=\"/data/upload/ueditor/20170104/586cab50b7a70.jpg\" style=\"width: 480px; height: 319px;\" title=\"671c579d-3932-4a5f-be1a-ccfb627c6ce0.jpg\"/></p>', '适应文化 转换角色--入职新员工进行培训', '适应文化 转换角色--入职新员工进行培训', '1', '1', '2017-01-04 16:06:52', null, '0', '4', '', '0', '{\"thumb\":\"\",\"template\":\"\"}', '1', '0', '0', '1');

-- ----------------------------
-- Table structure for ftyr_role
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_role`;
CREATE TABLE `ftyr_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of ftyr_role
-- ----------------------------
INSERT INTO `ftyr_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for ftyr_role_user
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_role_user`;
CREATE TABLE `ftyr_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of ftyr_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_route
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_route`;
CREATE TABLE `ftyr_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of ftyr_route
-- ----------------------------
INSERT INTO `ftyr_route` VALUES ('1', 'portal/page/index?id=21', 'contact', '0', '1');
INSERT INTO `ftyr_route` VALUES ('2', 'portal/page/index?id=20', 'joinus', '0', '1');
INSERT INTO `ftyr_route` VALUES ('3', 'portal/page/index?id=1', 'briefing', '0', '1');
INSERT INTO `ftyr_route` VALUES ('4', 'portal/page/index?id=2', 'organizations', '0', '1');
INSERT INTO `ftyr_route` VALUES ('5', 'portal/page/index?id=3', 'qualifications', '0', '1');
INSERT INTO `ftyr_route` VALUES ('6', 'portal/page/index?id=4', 'culture', '0', '1');
INSERT INTO `ftyr_route` VALUES ('7', 'portal/page/index?id=5', 'process', '0', '1');
INSERT INTO `ftyr_route` VALUES ('8', 'portal/page/index?id=6', 'vision', '0', '1');
INSERT INTO `ftyr_route` VALUES ('9', 'portal/list/index?id=1', 'product', '0', '1');
INSERT INTO `ftyr_route` VALUES ('10', 'portal/list/index?id=2', 'case', '0', '1');
INSERT INTO `ftyr_route` VALUES ('11', 'portal/page/index?id=11', 'business', '0', '1');
INSERT INTO `ftyr_route` VALUES ('12', 'portal/page/index?id=16', 'service', '0', '1');
INSERT INTO `ftyr_route` VALUES ('13', 'portal/list/index?id=4', 'news', '0', '1');

-- ----------------------------
-- Table structure for ftyr_slide
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_slide`;
CREATE TABLE `ftyr_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of ftyr_slide
-- ----------------------------
INSERT INTO `ftyr_slide` VALUES ('1', '1', '1', 'admin/20170101/58686e2b46de1.jpg', '#', '#', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('2', '1', '2', 'admin/20170101/58686e8f2b4ff.jpg', '#', '#', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('3', '2', '资格证书1', 'admin/20170101/58688fae335c2.jpg', '', '', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('4', '2', '资格证书2', 'admin/20170101/58688fc195347.jpg', '', '', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('5', '2', '资格证书3', 'admin/20170101/58688fd2ba587.jpg', '', '', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('6', '2', '资格证书4', 'admin/20170101/58688fea71524.jpg', '', '', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('7', '2', '资格证书5', 'admin/20170101/5868900684991.jpg', '', '', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('8', '2', '资格证书6', 'admin/20170101/5868901a70c4d.jpg', '', '', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('9', '3', '工业案例', 'admin/20170103/586b1f4707c58.jpg', '', '', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('10', '4', '招商加盟', 'admin/20170103/586b375307be8.jpg', '', '', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('11', '6', '服务与支持', 'admin/20170103/586b93b86ce63.jpg', '', '', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('12', '7', '新闻中心', 'admin/20170103/586b93ca45b20.jpg', '', '', '', '1', '0');
INSERT INTO `ftyr_slide` VALUES ('13', '8', '联系我们', 'admin/20170103/586b93e24b348.jpg', '', '', '', '1', '0');

-- ----------------------------
-- Table structure for ftyr_slide_cat
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_slide_cat`;
CREATE TABLE `ftyr_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of ftyr_slide_cat
-- ----------------------------
INSERT INTO `ftyr_slide_cat` VALUES ('1', '首页轮播图', 'index_slider', '首页轮播图', '1');
INSERT INTO `ftyr_slide_cat` VALUES ('2', '资格证书', 'zgzs', '资格证书集合', '1');
INSERT INTO `ftyr_slide_cat` VALUES ('3', '工业案例幻灯片', 'gyalslider', '工业案例幻灯片', '1');
INSERT INTO `ftyr_slide_cat` VALUES ('4', '招商加盟幻灯片', 'zsjmslider', '招商加盟幻灯片', '1');
INSERT INTO `ftyr_slide_cat` VALUES ('6', '服务与支持幻灯片', 'serviceslider', '服务与支持幻灯片', '1');
INSERT INTO `ftyr_slide_cat` VALUES ('7', '新闻中心幻灯片', 'newslider', '新闻中心幻灯片', '1');
INSERT INTO `ftyr_slide_cat` VALUES ('8', '联系我们幻灯片', 'contactslider', '联系我们幻灯片', '1');

-- ----------------------------
-- Table structure for ftyr_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_term_relationships`;
CREATE TABLE `ftyr_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of ftyr_term_relationships
-- ----------------------------
INSERT INTO `ftyr_term_relationships` VALUES ('1', '7', '5', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('5', '8', '7', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('7', '9', '19', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('6', '10', '19', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('8', '15', '20', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('9', '17', '14', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('10', '18', '16', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('11', '19', '18', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('12', '22', '21', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('13', '23', '21', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('14', '24', '17', '0', '1');
INSERT INTO `ftyr_term_relationships` VALUES ('15', '25', '16', '0', '1');

-- ----------------------------
-- Table structure for ftyr_terms
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_terms`;
CREATE TABLE `ftyr_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of ftyr_terms
-- ----------------------------
INSERT INTO `ftyr_terms` VALUES ('1', '产品展示', '', 'product', '', '0', '0', '0-1', '', '', '', 'product_list', 'product', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('2', '工业案例', '', 'picture', '', '0', '0', '0-2', '', '', '', 'case_list', 'case', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('3', '服务与支持', '', 'service', '', '0', '0', '0-3', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('4', '新闻中心', '', 'article', '', '0', '0', '0-4', '', '', '', 'news_list', 'article', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('5', '工业水漆', '', 'product', '', '1', '0', '0-1-5', '', '', '', 'product_list', 'product', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('6', '工程水漆', '', 'product', '', '1', '0', '0-1-6', '', '', '', 'product_list', 'product', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('7', '外墙水漆', '', 'product', '', '6', '0', '0-1-6-7', '', '', '', 'product_list', 'product', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('8', '艺术水漆', '', 'product', '', '6', '0', '0-1-6-8', '', '', '', 'product_list', 'product', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('9', '家装水漆', '', 'product', '', '1', '0', '0-1-9', '', '', '', 'product_list', 'product', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('10', '内墙水漆', '', 'product', '', '9', '0', '0-1-9-10', '', '', '', 'product_list', 'product', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('11', '木器水漆', '', 'product', '', '9', '0', '0-1-9-11', '', '', '', 'product_list', 'product', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('12', '多功能水漆', '', 'product', '', '9', '0', '0-1-9-12', '', '', '', 'product_list', 'product', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('21', '下载中心', '', 'download', '下载中心', '0', '0', '0-21', '', '', '', 'download_list', 'article', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('14', '疑问解答', '', 'service', '', '3', '0', '0-3-14', '', '', '', 'yinanjieda_list', 'yinanjieda', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('16', '公司新闻', '', 'article', '', '4', '0', '0-4-16', '', '', '', 'news_list', 'article', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('17', '行业动态', '', 'article', '', '4', '0', '0-4-17', '', '', '', 'news_list', 'article', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('18', '视频中心', '', 'article', '', '4', '0', '0-4-18', '', '', '', 'video_list', 'article', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('19', '工业案例', '', 'picture', '', '2', '0', '0-2-19', '', '', '', 'case_list', 'case', '0', '1');
INSERT INTO `ftyr_terms` VALUES ('20', '店面形象', '', 'picture', '店面形象', '0', '0', '0-20', '', '', '', 'dpxx_list', 'dmxx', '0', '1');

-- ----------------------------
-- Table structure for ftyr_user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_user_favorites`;
CREATE TABLE `ftyr_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of ftyr_user_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for ftyr_users
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_users`;
CREATE TABLE `ftyr_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of ftyr_users
-- ----------------------------
INSERT INTO `ftyr_users` VALUES ('1', 'futaiyr', '###c4cec8c138cecea93c806b020ad726a1', 'admin', 'admin@futaiyr.com', 'http://www.futaiyr.com', null, '0', '2000-01-01', '', '222.77.44.4', '2017-01-04 18:10:21', '2016-12-15 10:33:24', '', '1', '0', '1', '0', '');

-- ----------------------------
-- Table structure for ftyr_variable
-- ----------------------------
DROP TABLE IF EXISTS `ftyr_variable`;
CREATE TABLE `ftyr_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '变量ID',
  `variableName` varchar(255) NOT NULL COMMENT '变量名',
  `variableValue` varchar(255) DEFAULT NULL COMMENT '变量值',
  `beizhu` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `listorder` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `variableName` (`variableName`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ftyr_variable
-- ----------------------------
INSERT INTO `ftyr_variable` VALUES ('6', 'service_tel', '400-123-0000', '全国服务电话', '0');
INSERT INTO `ftyr_variable` VALUES ('7', 'tellphone', '020-1234 5678', '电话', '0');
INSERT INTO `ftyr_variable` VALUES ('8', 'tax', '020-1234 5678', '传真', '0');
INSERT INTO `ftyr_variable` VALUES ('9', 'email', 'demo@126.com', '邮箱', '0');
INSERT INTO `ftyr_variable` VALUES ('10', 'address', '广州市越秀区广卫路二号之一广卫商务大厦', '地址', '0');
INSERT INTO `ftyr_variable` VALUES ('14', 'gongsimingcheng', '广州金百合水漆有限公司', '公司名称', '0');
INSERT INTO `ftyr_variable` VALUES ('12', 'jingdu', '113.274618', '定位精度', '0');
INSERT INTO `ftyr_variable` VALUES ('13', 'weidu', '23.13385', '定位纬度', '0');
