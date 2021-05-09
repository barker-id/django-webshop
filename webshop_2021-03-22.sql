# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 8.0.21)
# Database: webshop
# Generation Time: 2021-03-22 15:24:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can view log entry',1,'view_logentry'),
	(5,'Can add permission',2,'add_permission'),
	(6,'Can change permission',2,'change_permission'),
	(7,'Can delete permission',2,'delete_permission'),
	(8,'Can view permission',2,'view_permission'),
	(9,'Can add group',3,'add_group'),
	(10,'Can change group',3,'change_group'),
	(11,'Can delete group',3,'delete_group'),
	(12,'Can view group',3,'view_group'),
	(13,'Can add user',4,'add_user'),
	(14,'Can change user',4,'change_user'),
	(15,'Can delete user',4,'delete_user'),
	(16,'Can view user',4,'view_user'),
	(17,'Can add content type',5,'add_contenttype'),
	(18,'Can change content type',5,'change_contenttype'),
	(19,'Can delete content type',5,'delete_contenttype'),
	(20,'Can view content type',5,'view_contenttype'),
	(21,'Can add session',6,'add_session'),
	(22,'Can change session',6,'change_session'),
	(23,'Can delete session',6,'delete_session'),
	(24,'Can view session',6,'view_session'),
	(25,'Can add product',7,'add_product'),
	(26,'Can change product',7,'change_product'),
	(27,'Can delete product',7,'delete_product'),
	(28,'Can view product',7,'view_product');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_swedish_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_swedish_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_swedish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$216000$KYwCT46qAoJI$Br0XpD/EyqYBRyrOMLuXsiEEcW8/zT62CVdjWRXOo5A=','2021-03-19 11:53:30.181888',1,'admin','','','',1,1,'2021-03-19 11:53:05.338272');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;



# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_swedish_ci,
  `object_repr` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_swedish_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2021-03-19 13:37:28.221962','1','Test product',1,'[{\"added\": {}}]',7,1),
	(2,'2021-03-19 14:06:54.742885','1','Test product',2,'[{\"changed\": {\"fields\": [\"Product image\"]}}]',7,1),
	(3,'2021-03-19 14:22:00.374697','2','Newcar',1,'[{\"added\": {}}]',7,1),
	(4,'2021-03-20 07:00:10.480354','1','Test product',2,'[{\"changed\": {\"fields\": [\"Product image\"]}}]',7,1),
	(5,'2021-03-20 07:00:57.798062','2','Newcar',2,'[{\"changed\": {\"fields\": [\"Product image\"]}}]',7,1),
	(6,'2021-03-20 08:02:43.019295','1','Test product',2,'[{\"changed\": {\"fields\": [\"Product image\"]}}]',7,1),
	(7,'2021-03-20 08:34:06.121579','2','Newcar',2,'[{\"changed\": {\"fields\": [\"Product image\"]}}]',7,1),
	(8,'2021-03-20 08:34:29.861899','1','Test product',2,'[{\"changed\": {\"fields\": [\"Product image\"]}}]',7,1),
	(9,'2021-03-20 12:03:24.482363','1','Test product car',2,'[{\"changed\": {\"fields\": [\"Product name\"]}}]',7,1),
	(10,'2021-03-20 12:04:09.859352','3','second',1,'[{\"added\": {}}]',7,1),
	(11,'2021-03-21 18:16:20.847087','3','second',2,'[{\"changed\": {\"fields\": [\"Product price\"]}}]',7,1),
	(12,'2021-03-21 18:18:11.232461','3','second',2,'[]',7,1),
	(13,'2021-03-21 18:18:20.513611','2','Newcar',2,'[{\"changed\": {\"fields\": [\"Product price\"]}}]',7,1),
	(14,'2021-03-21 18:18:30.401964','1','Test product car',2,'[{\"changed\": {\"fields\": [\"Product price\"]}}]',7,1),
	(15,'2021-03-21 18:19:15.940384','2','aNewcar',2,'[{\"changed\": {\"fields\": [\"Product name\"]}}]',7,1),
	(16,'2021-03-21 18:19:51.646528','3','zsecond',2,'[{\"changed\": {\"fields\": [\"Product name\"]}}]',7,1),
	(17,'2021-03-21 18:20:31.863215','3','zsecond',2,'[{\"changed\": {\"fields\": [\"Product price\"]}}]',7,1),
	(18,'2021-03-22 07:34:55.632327','2','uaNewcar',2,'[{\"changed\": {\"fields\": [\"Product name\"]}}]',7,1),
	(19,'2021-03-22 09:50:38.711462','1','Test product car',2,'[{\"changed\": {\"fields\": [\"Product description\"]}}]',7,1),
	(20,'2021-03-22 09:50:48.165555','2','uaNewcar',2,'[{\"changed\": {\"fields\": [\"Product description\"]}}]',7,1),
	(21,'2021-03-22 09:50:52.703746','3','zsecond',2,'[{\"changed\": {\"fields\": [\"Product description\"]}}]',7,1),
	(22,'2021-03-22 10:45:24.637361','2','uaNewcar',2,'[{\"changed\": {\"fields\": [\"Product image\"]}}]',7,1),
	(23,'2021-03-22 10:52:31.659771','3','Excepteur sint occaecat',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Product image\", \"Product price\"]}}]',7,1),
	(24,'2021-03-22 10:53:18.925250','2','Culpa qui officia',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Product image\", \"Product price\"]}}]',7,1),
	(25,'2021-03-22 10:53:41.429248','1','Duis aute irure',2,'[{\"changed\": {\"fields\": [\"Product name\", \"Product image\", \"Product price\"]}}]',7,1),
	(26,'2021-03-22 10:54:58.319403','1','Duis aute irure',2,'[{\"changed\": {\"fields\": [\"Product image\"]}}]',7,1),
	(27,'2021-03-22 14:36:33.633614','4','Eu fugiat nulla',1,'[{\"added\": {}}]',7,1),
	(28,'2021-03-22 14:37:32.183763','5','Qui officia deserunt',1,'[{\"added\": {}}]',7,1);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(5,'contenttypes','contenttype'),
	(6,'sessions','session'),
	(7,'webshop','product');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2021-03-19 10:38:24.336154'),
	(2,'auth','0001_initial','2021-03-19 10:38:24.390486'),
	(3,'admin','0001_initial','2021-03-19 10:38:24.499077'),
	(4,'admin','0002_logentry_remove_auto_add','2021-03-19 10:38:24.545988'),
	(5,'admin','0003_logentry_add_action_flag_choices','2021-03-19 10:38:24.552032'),
	(6,'contenttypes','0002_remove_content_type_name','2021-03-19 10:38:24.590150'),
	(7,'auth','0002_alter_permission_name_max_length','2021-03-19 10:38:24.613014'),
	(8,'auth','0003_alter_user_email_max_length','2021-03-19 10:38:24.637942'),
	(9,'auth','0004_alter_user_username_opts','2021-03-19 10:38:24.644096'),
	(10,'auth','0005_alter_user_last_login_null','2021-03-19 10:38:24.664305'),
	(11,'auth','0006_require_contenttypes_0002','2021-03-19 10:38:24.665940'),
	(12,'auth','0007_alter_validators_add_error_messages','2021-03-19 10:38:24.673076'),
	(13,'auth','0008_alter_user_username_max_length','2021-03-19 10:38:24.697993'),
	(14,'auth','0009_alter_user_last_name_max_length','2021-03-19 10:38:24.720701'),
	(15,'auth','0010_alter_group_name_max_length','2021-03-19 10:38:24.741797'),
	(16,'auth','0011_update_proxy_permissions','2021-03-19 10:38:24.747658'),
	(17,'auth','0012_alter_user_first_name_max_length','2021-03-19 10:38:24.777860'),
	(18,'sessions','0001_initial','2021-03-19 10:38:24.786150'),
	(19,'webshop','0001_initial','2021-03-19 13:28:05.072728'),
	(20,'webshop','0002_auto_20210319_1547','2021-03-19 13:47:11.405535'),
	(21,'webshop','0003_auto_20210320_0859','2021-03-20 06:59:26.347494'),
	(22,'webshop','0004_product_product_quantity','2021-03-21 07:17:33.064866');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_swedish_ci NOT NULL,
  `session_data` longtext COLLATE utf8_swedish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('cdmrio0k0y4fa0nlne0eiv09htip6tj6','.eJxVjEEOwiAQRe_C2hBggKpL956hmWEYqRpISrsy3l2bdKHb_977LzXiupRx7XkeJ1ZnZdXhdyNMj1w3wHest6ZTq8s8kd4UvdOur43z87K7fwcFe_nWkKOgzdE4AhI8WhuDFwPMRJbFWRQcjPeELD4OjpLhZEKAFE8QANT7A_3fODo:1lNDh4:ToDwBXyNmE4h3LX_eKRiS2mO7WjDoDxEkKY0juoDdDA','2021-04-02 11:53:30.183382');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table webshop_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `webshop_product`;

CREATE TABLE `webshop_product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_code` int NOT NULL,
  `product_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `product_image` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `product_price` int NOT NULL,
  `product_description` longtext COLLATE utf8_swedish_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `shop_name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `product_quantity` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

LOCK TABLES `webshop_product` WRITE;
/*!40000 ALTER TABLE `webshop_product` DISABLE KEYS */;

INSERT INTO `webshop_product` (`product_id`, `product_code`, `product_name`, `product_image`, `product_price`, `product_description`, `category`, `shop_name`, `created_at`, `updated_at`, `product_quantity`)
VALUES
	(1,2342246,'Duis aute irure','shop/images/auto3_L6qqILT.jpg',67000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','auto','Alfa','2021-03-19 13:37:28.221177','2021-03-19 13:37:28.221204',1),
	(2,544324,'Culpa qui officia','shop/images/auto2.jpg',88000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Car','Alfa','2021-03-19 14:22:00.373677','2021-03-19 14:22:00.373710',1),
	(3,234234234,'Excepteur sint occaecat','shop/images/auto1.jpg',54000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Car','Alfa','2021-03-20 12:04:09.826167','2021-03-20 12:04:09.826213',1),
	(4,56664333,'Eu fugiat nulla','shop/images/auto2_h1hnGkc.jpg',36000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Car','Alfa','2021-03-22 14:36:33.632718','2021-03-22 14:36:33.632745',1),
	(5,1224544,'Qui officia deserunt','shop/images/auto3_L6qqILT_43aUqMK.jpg',45000,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Car','Alfa','2021-03-22 14:37:32.183130','2021-03-22 14:37:32.183161',1);

/*!40000 ALTER TABLE `webshop_product` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
