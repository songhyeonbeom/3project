-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: project_django
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'veritas104@naver.com',1,1,1),(2,'erekude@naver.com',0,0,2);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add site',7,'add_site'),(26,'Can change site',7,'change_site'),(27,'Can delete site',7,'delete_site'),(28,'Can view site',7,'view_site'),(29,'Can add email address',8,'add_emailaddress'),(30,'Can change email address',8,'change_emailaddress'),(31,'Can delete email address',8,'delete_emailaddress'),(32,'Can view email address',8,'view_emailaddress'),(33,'Can add email confirmation',9,'add_emailconfirmation'),(34,'Can change email confirmation',9,'change_emailconfirmation'),(35,'Can delete email confirmation',9,'delete_emailconfirmation'),(36,'Can view email confirmation',9,'view_emailconfirmation'),(37,'Can add social account',10,'add_socialaccount'),(38,'Can change social account',10,'change_socialaccount'),(39,'Can delete social account',10,'delete_socialaccount'),(40,'Can view social account',10,'view_socialaccount'),(41,'Can add social application',11,'add_socialapp'),(42,'Can change social application',11,'change_socialapp'),(43,'Can delete social application',11,'delete_socialapp'),(44,'Can view social application',11,'view_socialapp'),(45,'Can add social application token',12,'add_socialtoken'),(46,'Can change social application token',12,'change_socialtoken'),(47,'Can delete social application token',12,'delete_socialtoken'),(48,'Can view social application token',12,'view_socialtoken'),(49,'Can add category',13,'add_category'),(50,'Can change category',13,'change_category'),(51,'Can delete category',13,'delete_category'),(52,'Can view category',13,'view_category'),(53,'Can add tag',14,'add_tag'),(54,'Can change tag',14,'change_tag'),(55,'Can delete tag',14,'delete_tag'),(56,'Can view tag',14,'view_tag'),(57,'Can add post',15,'add_post'),(58,'Can change post',15,'change_post'),(59,'Can delete post',15,'delete_post'),(60,'Can view post',15,'view_post'),(61,'Can add comment',16,'add_comment'),(62,'Can change comment',16,'change_comment'),(63,'Can delete comment',16,'delete_comment'),(64,'Can view comment',16,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'!XgXUCXyYSIBY59xzhFTLAgU5l0IEklS5UnXmbAzN','2022-06-02 15:28:15.077156',0,'seondeok2','선덕이','SeonDeok2','veritas104@naver.com',0,1,'2022-05-28 17:38:59.499499'),(2,'pbkdf2_sha256$260000$BLlDVL7ABhuUUyqaEs2lz7$MOwm2VbxaOdmJ+k4Q71dAsZp/3pobFvbUqi8ycqpGLg=','2022-06-04 15:32:52.120709',1,'song','','','erekude@naver.com',1,1,'2022-05-28 17:49:45.460024');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `blog_category_author_id_d8e39456_fk_auth_user_id` (`author_id`),
  CONSTRAINT `blog_category_author_id_d8e39456_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_author_id_4f11e2e0_fk_auth_user_id` (`author_id`),
  KEY `blog_comment_post_id_580e96ef_fk_blog_post_id` (`post_id`),
  CONSTRAINT `blog_comment_author_id_4f11e2e0_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_comment_post_id_580e96ef_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
INSERT INTO `blog_comment` VALUES (2,'댓글 작정 되나요?','2022-05-31 11:35:34.740217','2022-05-31 11:35:34.740237',2,47),(3,'댓글이 잘 달리는지 확인해봅시다\r\n내려쓰기는 되나요?','2022-05-31 14:56:50.461328','2022-05-31 14:56:50.461359',1,48),(4,'오!! 내려쓰기도 잘 되고 \r\n수정 삭제 기능도 잘 들어가 있군요 \r\n좋아용','2022-05-31 14:57:26.131454','2022-05-31 14:57:26.131473',1,48),(5,'마크다운 다른건 다 먹고 엔터만\r\n안먹음\r\n엔터 지금도\r\n치고있음 근데 안먹음','2022-06-02 16:47:05.819721','2022-06-02 16:47:05.819750',1,51),(6,'댓글창은 먹는데 희한하게\r\n콘텐츠 창엔 안먹네 왜글지?','2022-06-02 16:47:38.556581','2022-06-02 16:47:38.556617',1,51),(7,'아니 왜 내려쓰기가 안되냐고 미쳤나 진짜??\r\n또 댓글은 내려쓰기 된다니까???\r\n아니 왜???????????????','2022-06-02 16:50:37.701860','2022-06-02 16:50:37.701881',1,52),(8,'마크다운 먹고있네?\r\n그냥 자동으로 먹어지는구만 근데 내려쓰기 안되네\r\n댓글은 또 된다?? 신기하네 거참\r\n찾아낸다 슈바...ㅠㅠㅠ','2022-06-02 16:55:38.213199','2022-06-02 16:55:38.213220',1,53);
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `hook_text` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `file_upload` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` int DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`),
  KEY `blog_post_category_id_c326dbf8_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_post_category_id_c326dbf8_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (31,'','','1','blog/images/2022/05/29/03.18049821.1.jpg','','2022-05-29 14:46:00.895838','2022-05-29 14:46:00.895856',2,NULL),(32,'','','2','blog/images/2022/05/29/2020061812568291962_1.jpg','','2022-05-29 14:46:16.141994','2022-05-29 14:46:16.142022',2,NULL),(33,'','','3','blog/images/2022/05/29/보나_04.jpg','','2022-05-29 14:46:22.870811','2022-05-29 14:46:22.870858',2,NULL),(34,'','','4','blog/images/2022/05/29/보나_05.jpg','','2022-05-29 14:46:28.839916','2022-05-29 14:46:28.839944',2,NULL),(35,'','','5','blog/images/2022/05/29/아이유01.jpg','','2022-05-29 14:46:44.643808','2022-05-29 14:46:44.643832',2,NULL),(36,'','','6','blog/images/2022/05/29/아이유02.jpg','','2022-05-29 14:46:49.614689','2022-05-29 14:46:49.614717',2,NULL),(37,'','','7','blog/images/2022/05/29/아이유03.jpeg','','2022-05-29 14:46:57.523029','2022-05-29 14:46:57.523061',2,NULL),(38,'','','8','blog/images/2022/05/29/아이유04.jpeg','','2022-05-29 14:47:01.849167','2022-05-29 14:47:01.849209',2,NULL),(39,'','','9','blog/images/2022/05/29/아이유05.jpeg','','2022-05-29 14:47:07.727860','2022-05-29 14:47:07.727893',2,NULL),(40,'','','10','blog/images/2022/05/29/아이유06.jpeg','','2022-05-29 14:47:17.032929','2022-05-29 14:47:17.032969',2,NULL),(41,'','','11','blog/images/2022/05/29/279938919_1375127226334432_4185790696621384054_n.jpg','','2022-05-29 14:47:34.081728','2022-05-29 14:47:34.081760',2,NULL),(42,'','','12','blog/images/2022/05/29/280065859_117382897460467_4335479116100075780_n.jpg','','2022-05-29 14:47:39.728976','2022-05-29 14:47:39.729010',2,NULL),(43,'','','13','blog/images/2022/05/29/280548183_565188208377182_4402066753064106099_n.jpg','','2022-05-29 14:47:55.366356','2022-05-29 14:47:55.366402',2,NULL),(44,'','','14','blog/images/2022/05/29/280749707_675018043565286_3691611423060191253_n.jpg','','2022-05-29 14:48:04.428215','2022-05-29 14:48:04.428259',2,NULL),(45,'','','15','blog/images/2022/05/29/281862766_687939142415440_2214786831777444254_n.jpg','','2022-05-29 14:48:12.502262','2022-05-29 14:48:12.502298',2,NULL),(46,'','','16','blog/images/2022/05/29/283090363_523727872637116_6575636242772883084_n.jpg','','2022-05-29 14:48:17.995786','2022-05-29 14:48:17.995821',2,NULL),(47,'','','17','blog/images/2022/05/29/283694014_305867285086006_9093810053097365628_n.jpg','','2022-05-29 14:48:24.491369','2022-05-29 14:48:24.491390',2,NULL),(48,'','','테스트 사진을 올려봅시다 1번','blog/images/2022/05/31/김지원_01.jpeg','','2022-05-31 14:51:53.992285','2022-05-31 14:51:53.992316',1,NULL),(50,'','','123123132\r\n마크다운 왜 적용안됌??\r\n내려쓰기 안써지는중','blog/images/2022/06/02/김지원_02.jpg','','2022-06-02 15:28:42.881412','2022-06-02 15:28:42.881431',1,NULL),(51,'','','# 제목 1\r\n## 제목 2\r\n- 리스트\r\n- 호호\r\n\r\n내려쓰기 됩니까\r\n마크다운 적용되는거같은데\r\n왜 내려쓰기가 안됩니까\r\n이상합니다','blog/images/2022/06/02/김지원_03.jpg','','2022-06-02 15:59:42.013708','2022-06-02 16:46:25.133206',1,NULL),(52,'','','왠지 이제 내려쓰기 될꺼같은데\r\n안그랭?\r\n안되나 제발 되라 좀\r\n아니 이게 왜 안돼??ㅠㅠ\r\n장난똥때리나 진짜 아니 이거 왜안되냐고\r\n내려쓰기 그게 어렵나???\r\n미쳤나 진짜\r\n다때리뿌사삐고싶다 하...','blog/images/2022/06/02/김지원_04.jpg','','2022-06-02 16:50:11.051987','2022-06-02 16:50:11.052017',1,NULL),(53,'','','# 제목 1\r\n## 제목 2\r\n- 리스트\r\n- 호호\r\n내려쓰기 안되니\r\n모델 콘텐트 마크다운x 로 적어야 되는데\r\n안적어서 긍갑다\r\n그래도 확인해보자','blog/images/2022/06/02/김지원_05.jpg','','2022-06-02 16:54:27.046629','2022-06-02 16:54:27.046646',1,NULL),(54,'','','dtdtdtdtd','blog/images/2022/06/02/i16313635069.jpg','','2022-06-02 18:15:50.803017','2022-06-02 18:15:50.803052',2,NULL);
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post_tags`
--

DROP TABLE IF EXISTS `blog_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_post_tags_post_id_tag_id_4925ec37_uniq` (`post_id`,`tag_id`),
  KEY `blog_post_tags_tag_id_0875c551_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_post_tags_post_id_a1c71c8a_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`),
  CONSTRAINT `blog_post_tags_tag_id_0875c551_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_tags`
--

LOCK TABLES `blog_post_tags` WRITE;
/*!40000 ALTER TABLE `blog_post_tags` DISABLE KEYS */;
INSERT INTO `blog_post_tags` VALUES (1,48,1),(2,48,2),(3,48,3),(4,48,4),(5,50,1),(6,50,2),(7,50,3),(8,50,4),(10,52,1),(11,52,5),(12,52,6),(15,53,1),(16,53,4),(13,53,7),(14,53,8),(17,54,9);
/*!40000 ALTER TABLE `blog_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'김지원','김지원'),(2,'배우','배우'),(3,'연기자','연기자'),(4,'존예','존예'),(5,'존예네','존예네'),(6,'미쳤다','미쳤다'),(7,'핑크','핑크'),(8,'티셔츠','티셔츠'),(9,'스파이더맨','스파이더맨');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-05-29 14:43:59.089314','30','[30] :: seondeok2',3,'',15,2),(2,'2022-05-29 14:43:59.095644','29','[29] :: seondeok2',3,'',15,2),(3,'2022-05-29 14:43:59.099581','28','[28] :: seondeok2',3,'',15,2),(4,'2022-05-29 14:43:59.102314','27','[27] :: seondeok2',3,'',15,2),(5,'2022-05-29 14:43:59.105240','26','[26] :: seondeok2',3,'',15,2),(6,'2022-05-29 14:43:59.108021','25','[25] :: seondeok2',3,'',15,2),(7,'2022-05-29 14:43:59.111879','24','[24] :: seondeok2',3,'',15,2),(8,'2022-05-29 14:43:59.116671','23','[23] :: seondeok2',3,'',15,2),(9,'2022-05-29 14:43:59.121258','22','[22] :: seondeok2',3,'',15,2),(10,'2022-05-29 14:43:59.125745','21','[21] :: seondeok2',3,'',15,2),(11,'2022-05-29 14:43:59.130263','20','[20] :: seondeok2',3,'',15,2),(12,'2022-05-29 14:43:59.135020','19','[19] :: seondeok2',3,'',15,2),(13,'2022-05-29 14:43:59.140186','18','[18] :: seondeok2',3,'',15,2),(14,'2022-05-29 14:43:59.145066','17','[17] :: seondeok2',3,'',15,2),(15,'2022-05-29 14:43:59.149945','16','[16] :: seondeok2',3,'',15,2),(16,'2022-05-29 14:43:59.154669','15','[15] :: seondeok2',3,'',15,2),(17,'2022-05-29 14:43:59.159742','14','[14] :: seondeok2',3,'',15,2),(18,'2022-05-29 14:43:59.165135','13','[13] :: seondeok2',3,'',15,2),(19,'2022-05-29 14:43:59.170009','12','[12] :: seondeok2',3,'',15,2),(20,'2022-05-29 14:43:59.174843','11','[11] :: seondeok2',3,'',15,2),(21,'2022-05-29 14:43:59.180732','10','[10] :: seondeok2',3,'',15,2),(22,'2022-05-29 14:43:59.185102','9','[9] :: seondeok2',3,'',15,2),(23,'2022-05-29 14:43:59.190408','8','[8] :: seondeok2',3,'',15,2),(24,'2022-05-29 14:43:59.195053','7','[7] :: seondeok2',3,'',15,2),(25,'2022-05-29 14:43:59.200947','6','[6] :: seondeok2',3,'',15,2),(26,'2022-05-29 14:43:59.205844','5','[5] :: seondeok2',3,'',15,2),(27,'2022-05-29 14:43:59.209522','4','[4] :: seondeok2',3,'',15,2),(28,'2022-05-29 14:43:59.212778','3','[3] :: seondeok2',3,'',15,2),(29,'2022-05-29 14:43:59.216115','2','[2] :: seondeok2',3,'',15,2),(30,'2022-05-29 14:43:59.219685','1','[1] :: seondeok2',3,'',15,2),(31,'2022-06-02 15:27:52.666211','49','[49] :: seondeok2',3,'',15,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','emailaddress'),(9,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'blog','category'),(16,'blog','comment'),(15,'blog','post'),(14,'blog','tag'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'sites','site'),(10,'socialaccount','socialaccount'),(11,'socialaccount','socialapp'),(12,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-28 17:38:37.017420'),(2,'auth','0001_initial','2022-05-28 17:38:37.655942'),(3,'account','0001_initial','2022-05-28 17:38:37.880196'),(4,'account','0002_email_max_length','2022-05-28 17:38:37.912414'),(5,'admin','0001_initial','2022-05-28 17:38:38.088301'),(6,'admin','0002_logentry_remove_auto_add','2022-05-28 17:38:38.117916'),(7,'admin','0003_logentry_add_action_flag_choices','2022-05-28 17:38:38.135590'),(8,'contenttypes','0002_remove_content_type_name','2022-05-28 17:38:38.198804'),(9,'auth','0002_alter_permission_name_max_length','2022-05-28 17:38:38.269336'),(10,'auth','0003_alter_user_email_max_length','2022-05-28 17:38:38.305764'),(11,'auth','0004_alter_user_username_opts','2022-05-28 17:38:38.325440'),(12,'auth','0005_alter_user_last_login_null','2022-05-28 17:38:38.378160'),(13,'auth','0006_require_contenttypes_0002','2022-05-28 17:38:38.387006'),(14,'auth','0007_alter_validators_add_error_messages','2022-05-28 17:38:38.412622'),(15,'auth','0008_alter_user_username_max_length','2022-05-28 17:38:38.465559'),(16,'auth','0009_alter_user_last_name_max_length','2022-05-28 17:38:38.521940'),(17,'auth','0010_alter_group_name_max_length','2022-05-28 17:38:38.548176'),(18,'auth','0011_update_proxy_permissions','2022-05-28 17:38:38.561299'),(19,'auth','0012_alter_user_first_name_max_length','2022-05-28 17:38:38.634380'),(20,'blog','0001_initial','2022-05-28 17:38:39.232627'),(21,'sessions','0001_initial','2022-05-28 17:38:39.285532'),(22,'sites','0001_initial','2022-05-28 17:38:39.308959'),(23,'sites','0002_alter_domain_unique','2022-05-28 17:38:39.327345'),(24,'socialaccount','0001_initial','2022-05-28 17:38:39.743229'),(25,'socialaccount','0002_token_max_lengths','2022-05-28 17:38:39.821667'),(26,'socialaccount','0003_extra_data_default_dict','2022-05-28 17:38:39.836065'),(27,'blog','0002_category_author','2022-05-31 14:15:02.901396'),(28,'blog','0003_alter_category_author','2022-05-31 14:16:24.198940'),(29,'blog','0004_alter_post_content','2022-06-02 16:51:14.626547');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('411eqi0rerqhgm5tkfw4ccthhevrgn35','.eJxVjMsOwiAQRf-FtSEgj4Eu3fsNhClTixpoSptojP-uTbrQ7T3nnhcLcV3GsDaaQ06sY0d2-N0w9jcqG0jXWC6V97Usc0a-KXynjZ9rovtpd_8CY2zj922c8dCTlhCNFIoSWIvGDei8T05qMIgCtRTaWA_Wi2Sssl5FNUgggC3aqLVcS6DHlOcn68T7A0RyPbc:1nus8u:2uFAr8MrHSU9HfiKVxv89Hp17o2P2zhqmF1NIRe4PJY','2022-06-11 17:49:52.208004'),('5mq7wknow9gvlv1psdrwfzlds8q9lsp6','.eJxVjMsOwiAURP-FtWm4PMWd_RFyudBAbGgisDL-u63pQpdzZua8mMfRsx8tPX2J7MaAXX5ZQHqkehS4rgeekGgbtU_fzVm36b6nVHsh7GWr8_n6U2VsefeEKEziWlGwESygwUUqVOi4lCCUJkiB5JWTNUK5mIAMWBP5opy2gQN7fwC10TvL:1nweJZ:jQ-TyoVklZmekZlc3lkX3uXidzrapKS8iBS5hVlAhe0','2022-06-16 15:28:13.229366'),('5p3o7kphod9t1a0811z5sgrde6j2aimz','.eJxVjMsOwiAQRf-FtSEgj4Eu3fsNhClTixpoSptojP-uTbrQ7T3nnhcLcV3GsDaaQ06sY0d2-N0w9jcqG0jXWC6V97Usc0a-KXynjZ9rovtpd_8CY2zj922c8dCTlhCNFIoSWIvGDei8T05qMIgCtRTaWA_Wi2Sssl5FNUgggC3aqLVcS6DHlOcn68T7A0RyPbc:1nvqgM:u9GpUWjTfd7nNx7E_aiyGq6VNYctKhu0vohYMujCNsY','2022-06-14 10:28:26.240953'),('anl5kvawc8xpvbjvl35wz4u55fuwhtb3','eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIlNKOGoxMG9tb2swUiJdfQ:1nwdoF:0AWFKAg1IZEFNdPVv7yUWoLHkz-Z0Q5_RUm4FFuyLkQ','2022-06-16 14:55:51.880117'),('bwmmbg1qedzt1crk343a5gi6k95kveeh','eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIkZEd3FTVDFjWHlaQSJdfQ:1nvaLW:OEwdO5hbFaw1idRVKNX6IfSf28cC3D5X0UjeX1N5tnA','2022-06-13 17:01:50.916179'),('f7lbsca4r666s7dakkn1q0fo4myj7o4m','.eJxVjEEOwiAQRe_C2hAQhmFcuu8ZCANUqoYmpV0Z765NutDtf-_9lwhxW2vYelnClMVFnMXpd-OYHqXtIN9ju80yzW1dJpa7Ig_a5TDn8rwe7t9Bjb1-a_BAmIrVGEErUzI6x-BH9kTZa4vArNhqZcEROlIZnHFkohk1FkTx_gC4lDZ6:1nxNLA:-x16aR-plwPDuPCSa267uyWGjAFbVrf0q6VlEsNxS6w','2022-06-18 15:32:52.128955'),('ofre1bping3epwlb7xoycgxjkzduf109','.eJxVjMsOwiAURP-FtWm4PMWd_RFyudBAbGgisDL-u63pQpdzZua8mMfRsx8tPX2J7MaAXX5ZQHqkehS4rgeekGgbtU_fzVm36b6nVHsh7GWr8_n6U2VsefeEKEziWlGwESygwUUqVOi4lCCUJkiB5JWTNUK5mIAMWBP5opy2gQN7fwC10TvL:1nweJa:V-DYVVV4pY6jKCrnGbw1vmu7dfgLhSxHay4BGF5Zci8','2022-06-16 15:28:14.182072'),('oqncg5p6u6hemswg1b66n1sp5ycorqzj','eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIjhwZ092VWNhT205OSJdfQ:1nvuW6:a2i7VX-7F14xrAfFm0cwjtuesuka3W9ENnnNpL6UimE','2022-06-14 14:34:06.305088'),('qynxyibtraltvp21n2rwp8dbdo0xlvz1','.eJxVjMsOwiAURP-FtWm4PMWd_RFyudBAbGgisDL-u63pQpdzZua8mMfRsx8tPX2J7MaAXX5ZQHqkehS4rgeekGgbtU_fzVm36b6nVHsh7GWr8_n6U2VsefeEKEziWlGwESygwUUqVOi4lCCUJkiB5JWTNUK5mIAMWBP5opy2gQN7fwC10TvL:1nvuxU:jXIld5V0xJ01xLkDMmUeEak0yVB-VEHagvxr9LhGtWg','2022-06-14 15:02:24.642845'),('s2mjra8us4xmeilykxhbtcwpsoz7qs0w','eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sImc1VUNjZE5YVzgzVSJdfQ:1nweJY:dSjhaSfmHc_RNhZsorbEswlVtNiPlhFaUXEqVkf2R0E','2022-06-16 15:28:12.199298'),('tdz69l22e9dp58t6cqu5fvzsp8upj1q2','.eJxVjMsOwiAURP-FtWm4PMWd_RFyudBAbGgisDL-u63pQpdzZua8mMfRsx8tPX2J7MaAXX5ZQHqkehS4rgeekGgbtU_fzVm36b6nVHsh7GWr8_n6U2VsefeEKEziWlGwESygwUUqVOi4lCCUJkiB5JWTNUK5mIAMWBP5opy2gQN7fwC10TvL:1nvuyx:ybpqiblf9p8tIdFfFcHd6fzx7s15TmAtMTOHS68BiKc','2022-06-14 15:03:55.388592'),('wshq3thiexbigkcerzlysgijiit4vn8h','.eJxVjMsOwiAURP-FtWm4PMWd_RFyudBAbGgisDL-u63pQpdzZua8mMfRsx8tPX2J7MaAXX5ZQHqkehS4rgeekGgbtU_fzVm36b6nVHsh7GWr8_n6U2VsefeEKEziWlGwESygwUUqVOi4lCCUJkiB5JWTNUK5mIAMWBP5opy2gQN7fwC10TvL:1nvuV8:o1I2ZdVYv38M_9SoGBxupXtxiOteiqYLrKV4JN3xunY','2022-06-14 14:33:06.789389'),('xd3xgnjsdi2nay5a4j0n849hwci43eso','.eJxVjMsOwiAQRf-FtSEgj4Eu3fsNhClTixpoSptojP-uTbrQ7T3nnhcLcV3GsDaaQ06sY0d2-N0w9jcqG0jXWC6V97Usc0a-KXynjZ9rovtpd_8CY2zj922c8dCTlhCNFIoSWIvGDei8T05qMIgCtRTaWA_Wi2Sssl5FNUgggC3aqLVcS6DHlOcn68T7A0RyPbc:1nvq2L:vageTAb_0LF3FIYnEGk40uvCs3Hhu83nNmpZ2Unxhv4','2022-06-14 09:47:05.508667'),('z963j0ifdvbtjbqjzlig4f9mrn3yovpx','.eJxVjMsOwiAQRf-FtSEgj4Eu3fsNhClTixpoSptojP-uTbrQ7T3nnhcLcV3GsDaaQ06sY0d2-N0w9jcqG0jXWC6V97Usc0a-KXynjZ9rovtpd_8CY2zj922c8dCTlhCNFIoSWIvGDei8T05qMIgCtRTaWA_Wi2Sssl5FNUgggC3aqLVcS6DHlOcn68T7A0RyPbc:1nwgvM:VTWh-ETzMCzAkD0TObjmTFueF0azwrww35UzYr-B704','2022-06-16 18:15:24.510457'),('ztszttwfuay2cg92pgu9kv19mlgzlrzw','.eJxVjMsOwiAURP-FtWm4PMWd_RFyudBAbGgisDL-u63pQpdzZua8mMfRsx8tPX2J7MaAXX5ZQHqkehS4rgeekGgbtU_fzVm36b6nVHsh7GWr8_n6U2VsefeEKEziWlGwESygwUUqVOi4lCCUJkiB5JWTNUK5mIAMWBP5opy2gQN7fwC10TvL:1nvuyw:txZaOeQM6LrJ5-MvCRSPkxQ8bewjSCjGH9vy_cQ_dSg','2022-06-14 15:03:54.302004');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `uid` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (1,'google','106955828705900150574','2022-06-02 15:28:15.020837','2022-05-28 17:38:59.565698','{\"id\": \"106955828705900150574\", \"email\": \"veritas104@naver.com\", \"verified_email\": true, \"name\": \"SeonDeok2\\uc120\\ub355\\uc774\", \"given_name\": \"\\uc120\\ub355\\uc774\", \"family_name\": \"SeonDeok2\", \"picture\": \"https://lh3.googleusercontent.com/a-/AOh14Ghb4eUd7hVmMr6njILL4p--s64ZGzhoqVabgAFd=s96-c\", \"locale\": \"ko\"}',1);
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `client_id` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `token_secret` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project_django'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-04 15:58:11
