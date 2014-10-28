/*
SQLyog Ultimate - MySQL GUI v8.21 
MySQL - 5.5.8 : Database - txweb_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`txweb_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `txweb_db`;

/*Table structure for table `bbs_forum` */

DROP TABLE IF EXISTS `bbs_forum`;

CREATE TABLE `bbs_forum` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `name` char(30) NOT NULL COMMENT '板块名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0-关闭;1-开放',
  `disp_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `post_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子数',
  `today_post_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '今日发贴数',
  `last_post_name` char(18) DEFAULT NULL COMMENT '最后发帖人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bbs_forum` */

/*Table structure for table `bbs_post` */

DROP TABLE IF EXISTS `bbs_post`;

CREATE TABLE `bbs_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `subject_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `content` mediumtext COMMENT '帖子内容',
  `is_first` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为主贴.0-否;1-是',
  `post_name` char(18) DEFAULT NULL COMMENT '发帖者名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bbs_post` */

/*Table structure for table `bbs_subject` */

DROP TABLE IF EXISTS `bbs_subject`;

CREATE TABLE `bbs_subject` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `forum_id` bigint(20) unsigned NOT NULL COMMENT '板块ID',
  `subject` char(50) NOT NULL COMMENT '帖子标题',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '帖子状态,0-正常.1-置顶.2-待审核.3-未通过.4-已禁止',
  `subject_color` char(12) NOT NULL DEFAULT '' COMMENT '标题颜色. vip使用.',
  `author_name` char(18) NOT NULL COMMENT '作者名称',
  `author_id` bigint(20) NOT NULL COMMENT '作者ID',
  `view_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '查看次数',
  `post_num` bigint(20) NOT NULL DEFAULT '0' COMMENT '回复次数',
  `create_time` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) unsigned DEFAULT NULL COMMENT '作者更新时间',
  `last_post_name` char(18) DEFAULT NULL COMMENT '最后回复者名称',
  `last_post_time` bigint(20) unsigned DEFAULT NULL COMMENT '最后回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bbs_subject` */

/*Table structure for table `function_cfg` */

DROP TABLE IF EXISTS `function_cfg`;

CREATE TABLE `function_cfg` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `name` varchar(100) NOT NULL COMMENT '功能名称',
  `func_val` varchar(1000) NOT NULL COMMENT '功能值, 如com.uuola.action.InfoAction.show()',
  `func_url` varchar(1000) DEFAULT NULL COMMENT '访问路径,如http://www.uuola.com/info/{id}',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `function_cfg` */

/*Table structure for table `info_base` */

DROP TABLE IF EXISTS `info_base`;

CREATE TABLE `info_base` (
  `id` bigint(20) unsigned NOT NULL COMMENT '唯一ID',
  `cat_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `title` varchar(200) NOT NULL COMMENT '信息标题',
  `summary` varchar(1000) DEFAULT NULL COMMENT '信息摘要',
  `author_id` bigint(20) NOT NULL COMMENT '发布者用户ID',
  `create_time` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) unsigned DEFAULT NULL COMMENT '更新时间',
  `last_operator_id` bigint(20) unsigned DEFAULT NULL COMMENT '操作人ID',
  `info_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '信息类型: 0-文本资讯; 1-超链接跳转; ',
  `is_pic` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有图片：0-无; 1-有',
  `is_video` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有视频：0-无; 1-有',
  `pic_url` varchar(1000) DEFAULT NULL COMMENT '主图地址; ',
  `info_state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '信息状态; 0-未审核; 1-通过 ; 2- 未通过; ',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除；0-未删除 ； 1-标记删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `info_base` */

/*Table structure for table `info_content` */

DROP TABLE IF EXISTS `info_content`;

CREATE TABLE `info_content` (
  `info_id` bigint(20) NOT NULL COMMENT 'info_base.id',
  `content` mediumtext COMMENT '文本内容',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `info_content` */

/*Table structure for table `info_tag_relation` */

DROP TABLE IF EXISTS `info_tag_relation`;

CREATE TABLE `info_tag_relation` (
  `tag_id` bigint(20) unsigned NOT NULL COMMENT '标签ID',
  `info_id` bigint(20) unsigned NOT NULL COMMENT '信息ID',
  `create_time` bigint(20) unsigned NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `info_tag_relation` */

/*Table structure for table `info_tags` */

DROP TABLE IF EXISTS `info_tags`;

CREATE TABLE `info_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) NOT NULL COMMENT '标签名',
  `info_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联信息条数',
  `create_time` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `tag_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '标签状态，0-无效 1-生效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `info_tags` */

/*Table structure for table `role_cfg` */

DROP TABLE IF EXISTS `role_cfg`;

CREATE TABLE `role_cfg` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `func_keys` varchar(1000) DEFAULT NULL COMMENT '功能健值。如121,122,123,124',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注说明',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '角色状态;0-未使用,1-启用,2-废除',
  `create_time` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) unsigned NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_cfg` */

/*Table structure for table `site_cat` */

DROP TABLE IF EXISTS `site_cat`;

CREATE TABLE `site_cat` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `name` char(18) NOT NULL COMMENT '分类名称',
  `rid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父类ID',
  `cat_path` char(50) NOT NULL DEFAULT '0' COMMENT '分类路径',
  `disp_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0-关闭；1-启用',
  `node_num` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '下级节点个数',
  `site_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '站点类型;0-资讯;1-供求;2-商铺;3-站点推广;4-友情链接;5-其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `site_cat` */

insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (1,'母婴',0,'1-',1,1,3,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (3,'备孕',1,'1-3-',2,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (4,'母婴知识',1,'1-4-',3,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (6,'培育学习',0,'6-',2,1,8,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (7,'孕期胎教',6,'6-7-',3,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (9,'家庭教育',6,'6-9-',4,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (10,'父母课堂',6,'6-10-',5,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (11,'儿童行为',6,'6-11-',6,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (12,'才艺培养',6,'6-12-',7,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (13,'性教育',6,'6-13-',8,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (14,'幼儿园',6,'6-14-',9,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (15,'性格培养',6,'6-15-',9,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (16,'孕产知识',1,'1-16-',2,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (18,'亲子生活',0,'18-',3,1,2,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (19,'美食DIY',18,'18-19-',1,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (20,'亲子游玩',18,'18-20-',4,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (21,'亲子阅读',0,'21-',4,1,3,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (22,'儿童心理',21,'21-22-',1,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (23,'关系处理',21,'21-23-',2,1,0,1);
insert  into `site_cat`(`id`,`name`,`rid`,`cat_path`,`disp_order`,`status`,`node_num`,`site_type`) values (24,'好书推荐',21,'21-24-',3,1,0,1);

/*Table structure for table `site_cat_level` */

DROP TABLE IF EXISTS `site_cat_level`;

CREATE TABLE `site_cat_level` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` bigint(20) unsigned NOT NULL COMMENT '类目ID',
  `c1` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '第1级类目ID',
  `c2` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '第2级类目ID',
  `c3` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '第3级类目ID',
  `c4` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '第4级类目ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `site_cat_level` */

/*Table structure for table `sup_req_info` */

DROP TABLE IF EXISTS `sup_req_info`;

CREATE TABLE `sup_req_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `title` varchar(50) NOT NULL COMMENT '信息标题',
  `cat_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '信息分类Id',
  `create_time` bigint(20) unsigned NOT NULL COMMENT '发布时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `expire_time` bigint(20) unsigned DEFAULT NULL COMMENT '信息过期时间',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `view_num` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `info_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '信息类型:0-供应;1-需求;',
  `contact_tel` varchar(18) NOT NULL COMMENT '联系电话',
  `contact_mail` varchar(50) DEFAULT NULL COMMENT '联系邮箱',
  `contact_addr` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `contact_qq` varchar(12) DEFAULT NULL COMMENT '联系QQ',
  `contact_website` varchar(100) DEFAULT NULL COMMENT '联系站点',
  `contact_name` varchar(18) NOT NULL COMMENT '联系人',
  `org_name` varchar(32) DEFAULT NULL COMMENT '组织名称',
  `info_tag` varchar(18) DEFAULT NULL COMMENT '信息推广TAG，如 收购苹果|供应鸡蛋',
  `message` varchar(1000) NOT NULL COMMENT '留言内容',
  `publish_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '发布类型;0-个人;1-终端销售商;2-合作社;3-生产商;4-其他;',
  `has_image` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有图0-无；1-有',
  `has_video` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有视频0-无;1-有',
  `image_urls` varchar(1000) DEFAULT NULL COMMENT '信息图片,可放多个:image-1.jpg|image-2.jpg',
  `video_url` varchar(1000) DEFAULT NULL COMMENT '视频地址，只能放一个;如youku, tudou',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '信息状态. 0-审核中;1-正常;2-未通过；3-删除',
  `disp_order` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '显示顺序;',
  `province` varchar(10) NOT NULL COMMENT '省，直辖市',
  `city` varchar(30) DEFAULT NULL COMMENT '市区',
  `area` varchar(30) DEFAULT NULL COMMENT '县区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供求信息';

/*Data for the table `sup_req_info` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(1) NOT NULL COMMENT '配置属性名',
  `config_value` varchar(2000) NOT NULL COMMENT '配置值',
  `config_type` varchar(30) NOT NULL COMMENT '配置值类型：string,number,list,array,json',
  `general_class` varchar(100) DEFAULT NULL COMMENT '配置值通用class名称,针对 list, array, json',
  `update_time` bigint(20) NOT NULL COMMENT '创建，更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_config` */

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `name` char(18) DEFAULT NULL COMMENT '用户名',
  `pass_key` varchar(128) NOT NULL COMMENT '用户密码',
  `tel` char(12) DEFAULT NULL COMMENT '手机号码',
  `qq` varchar(12) DEFAULT NULL COMMENT 'qq号码',
  `email` char(42) DEFAULT NULL COMMENT '邮箱',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `city_code` varchar(32) DEFAULT NULL COMMENT '所在省市',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户状态:0-未激活,1-正常可用,2-禁用,3-删除',
  `admin_flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '管理员标识. 0普通会员.1-超级管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_info` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `user_id` bigint(20) unsigned NOT NULL COMMENT '会员ID',
  `role_id` bigint(20) unsigned NOT NULL COMMENT '角色ID',
  `create_time` bigint(20) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
