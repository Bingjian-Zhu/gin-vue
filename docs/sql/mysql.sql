SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned DEFAULT '0' COMMENT '标签ID',
  `title` varchar(100) DEFAULT '' COMMENT '文章标题',
  `desc` varchar(255) DEFAULT '' COMMENT '简述',
  `content` text COMMENT '内容',
  `cover_image_url` varchar(255) DEFAULT '' COMMENT '封面图片地址',
  `created_on` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(100) DEFAULT '' COMMENT '创建人',
  `modified_on` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_by` varchar(255) DEFAULT '' COMMENT '修改人',
  `deleted_on` int(10) unsigned DEFAULT '0' COMMENT '删除时间',
  `state` tinyint(3) unsigned DEFAULT '1' COMMENT '状态 0为草稿、1为已发布、2为删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章管理';

-- ----------------------------
-- Table structure for blog_auth
-- ----------------------------
DROP TABLE IF EXISTS `blog_auth`;
CREATE TABLE `blog_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '账号',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '标签名称',
  `created_on` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_by` varchar(100) DEFAULT '' COMMENT '创建人',
  `modified_on` datetime  DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_by` varchar(100) DEFAULT '' COMMENT '修改人',
  `deleted_on` int(10) unsigned DEFAULT '0' COMMENT '删除时间',
  `state` tinyint(3) unsigned DEFAULT '1' COMMENT '状态 0为禁用、1为启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章标签管理';


-- ----------------------------
-- Table structure for blog_claims
-- ----------------------------
DROP TABLE IF EXISTS `blog_claims`;
CREATE TABLE `blog_claims` (
  `claim_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`auth_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `type` varchar(50) DEFAULT '' COMMENT 'claim类型',
  `value` varchar(50) DEFAULT '' COMMENT 'claim值',
  PRIMARY KEY (`claim_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `blog_auth`(`id`, `username`, `password`, `avatar`) VALUES (1, 'admin', '111111', 'https://zbj-bucket1.oss-cn-shenzhen.aliyuncs.com/avatar.JPG');
INSERT INTO `blog_auth`(`id`, `username`, `password`, `avatar`) VALUES (2, 'test', '111111', 'https://zbj-bucket1.oss-cn-shenzhen.aliyuncs.com/avatar.JPG');

INSERT INTO `blog_tag`(`id`, `name`, `created_on`, `created_by`, `modified_on`, `modified_by`, `deleted_on`, `state`) VALUES (1, '1', '2019-08-18 18:56:01', 'test', NULL, '', 0, 1);
INSERT INTO `blog_tag`(`id`, `name`, `created_on`, `created_by`, `modified_on`, `modified_by`, `deleted_on`, `state`) VALUES (2, '2', '2019-08-16 18:56:06', 'test', NULL, '', 0, 1);
INSERT INTO `blog_tag`(`id`, `name`, `created_on`, `created_by`, `modified_on`, `modified_by`, `deleted_on`, `state`) VALUES (3, '3', '2019-08-18 18:56:09', 'test', NULL, '', 0, 1);

INSERT INTO `blog_article`(`id`, `tag_id`, `title`, `desc`, `content`, `cover_image_url`, `created_on`, `created_by`, `modified_on`, `modified_by`, `deleted_on`, `state`) VALUES (1, 1, 'test1', 'test-desc', 'test-content', '', '2019-08-19 21:00:39', 'test-created', '2019-08-19 21:00:39', '', 0, 0);
INSERT INTO `blog_article`(`id`, `tag_id`, `title`, `desc`, `content`, `cover_image_url`, `created_on`, `created_by`, `modified_on`, `modified_by`, `deleted_on`, `state`) VALUES (2, 1, 'test2', 'test-desc', 'test-content', '', '2019-08-19 21:00:48', 'test-created', '2019-08-19 21:00:48', '', 0, 2);
INSERT INTO `blog_article`(`id`, `tag_id`, `title`, `desc`, `content`, `cover_image_url`, `created_on`, `created_by`, `modified_on`, `modified_by`, `deleted_on`, `state`) VALUES (3, 1, 'test3', 'test-desc', 'test-content', '', '2019-08-19 21:00:49', 'test-created', '2019-08-19 21:00:49', '', 0, 1);

INSERT INTO `blog_claims`(`claim_id`, `auth_id`, `type`, `value`) VALUES (1, 1, 'role', 'admin');
INSERT INTO `blog_claims`(`claim_id`, `auth_id`, `type`, `value`) VALUES (2, 1, 'role', 'test');
INSERT INTO `blog_claims`(`claim_id`, `auth_id`, `type`, `value`) VALUES (3, 2, 'role', 'test');


-- -- ----------------------------
-- -- comdb：Table structure for com_system
-- -- ----------------------------
-- DROP TABLE IF EXISTS `com_system`;
-- CREATE TABLE `com_system` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
-- 	`sys_name` varchar(50) NOT NULL DEFAULT '' COMMENT '系统名称',
--   `sys_password` varchar(50) NOT NULL DEFAULT '' COMMENT '系统密码',
--   `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱地址',
--   `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0为禁用、1为启用',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -- ----------------------------
-- -- comdb_sysid：Table structure for sysid_comment
-- -- ----------------------------
-- DROP TABLE IF EXISTS `sysid_comment`;
-- CREATE TABLE `sysid_comment` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
-- 	`target_id` varchar(50) NOT NULL DEFAULT '' COMMENT '评论主题的id，可根据需要修改为article_id、course_id等等',
--   `com_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的评论id，主评论为0',
--   `user_id` varchar(50) NOT NULL DEFAULT '' COMMENT '发表评论的用户id',
--   `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '发表评论的用户名称（冗余设计）',
--   `avatar_url` varchar(255) NOT NULL DEFAULT '' COMMENT '发表评论的用户头像（冗余设计）',
--   `reply_name` varchar(50) NOT NULL DEFAULT '' COMMENT '回复人的名称',
--   `content` varchar(800) NOT NULL DEFAULT '' COMMENT '评论内容',
--   `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
--   `support` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数（出于善良，不设计反对数）',
--   `satisfaction` int(10) NOT NULL DEFAULT '0' COMMENT '满意度（为0时，忽略满意度）',
--   `photo` varchar(800) NOT NULL DEFAULT '' COMMENT '图片地址',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -- ----------------------------
-- -- comdb_sysid：Table structure for sysid_comment
-- -- ----------------------------
-- DROP TABLE IF EXISTS `sysid_support`;
-- CREATE TABLE `sysid_support` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `com_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被点赞的评论id',
--   `user_id` varchar(50) NOT NULL DEFAULT '' COMMENT '点赞的用户ID',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;