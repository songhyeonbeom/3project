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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'erekude@naver.coer.com',0,0,1),(3,'veritas104@naver.com',1,1,3);
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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add category',7,'add_category'),(26,'Can change category',7,'change_category'),(27,'Can delete category',7,'delete_category'),(28,'Can view category',7,'view_category'),(29,'Can add tag',8,'add_tag'),(30,'Can change tag',8,'change_tag'),(31,'Can delete tag',8,'delete_tag'),(32,'Can view tag',8,'view_tag'),(33,'Can add post',9,'add_post'),(34,'Can change post',9,'change_post'),(35,'Can delete post',9,'delete_post'),(36,'Can view post',9,'view_post'),(37,'Can add site',10,'add_site'),(38,'Can change site',10,'change_site'),(39,'Can delete site',10,'delete_site'),(40,'Can view site',10,'view_site'),(41,'Can add email address',11,'add_emailaddress'),(42,'Can change email address',11,'change_emailaddress'),(43,'Can delete email address',11,'delete_emailaddress'),(44,'Can view email address',11,'view_emailaddress'),(45,'Can add email confirmation',12,'add_emailconfirmation'),(46,'Can change email confirmation',12,'change_emailconfirmation'),(47,'Can delete email confirmation',12,'delete_emailconfirmation'),(48,'Can view email confirmation',12,'view_emailconfirmation'),(49,'Can add social account',13,'add_socialaccount'),(50,'Can change social account',13,'change_socialaccount'),(51,'Can delete social account',13,'delete_socialaccount'),(52,'Can view social account',13,'view_socialaccount'),(53,'Can add social application',14,'add_socialapp'),(54,'Can change social application',14,'change_socialapp'),(55,'Can delete social application',14,'delete_socialapp'),(56,'Can view social application',14,'view_socialapp'),(57,'Can add social application token',15,'add_socialtoken'),(58,'Can change social application token',15,'change_socialtoken'),(59,'Can delete social application token',15,'delete_socialtoken'),(60,'Can view social application token',15,'view_socialtoken'),(61,'Can add comment',16,'add_comment'),(62,'Can change comment',16,'change_comment'),(63,'Can delete comment',16,'delete_comment'),(64,'Can view comment',16,'view_comment');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$6qlWXMmLCoXAjEvJUTTkfE$w+l6eEG/GVAwjBMxXPj8NLTiAQ4HgbL2JhOX6gg5fhw=','2022-05-23 16:30:08.820115',1,'song','','','erekude@naver.coer.com',1,1,'2022-05-19 11:15:44.148579'),(3,'!43YvhU7sSI4sQRuefHNjHApAq5X2r4uB73D2NQkp','2022-05-23 18:49:11.356104',0,'seondeok2','선덕이','SeonDeok2','veritas104@naver.com',0,1,'2022-05-23 15:49:06.964324');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
INSERT INTO `blog_comment` VALUES (10,'댓글이 달리고','2022-05-23 15:05:22.158620','2022-05-23 15:05:22.158648',1,10),(11,'댓글을 씁시다','2022-05-23 15:53:43.841113','2022-05-23 15:53:43.841170',1,10),(12,'댓글이 달리나요','2022-05-23 15:54:03.327414','2022-05-23 15:54:03.327470',3,10),(13,'요호호~~','2022-05-23 15:54:07.132593','2022-05-23 15:54:07.132648',3,10),(15,'댓글 테스트 중입니다 1번','2022-05-23 18:38:52.193857','2022-05-23 18:38:52.193893',1,12),(16,'댓글 써봅니다 2번','2022-05-23 18:39:03.218576','2022-05-23 18:39:03.218634',1,12),(17,'댓글 3번입니다.','2022-05-23 18:39:09.854096','2022-05-23 18:39:09.854113',1,12),(18,'댓글 씁니다 아바타 확인영','2022-05-23 18:49:23.669270','2022-05-23 18:49:23.669293',3,12),(19,'올,, 아바타 그러니까 프로필 사진이 잘 보이는군요?\r\n대박이네영^^','2022-05-23 18:49:50.810639','2022-05-23 18:49:50.810696',3,12),(20,'님들~ 구글 프로필사진은 잘 나와영^^ ㅎㅎ','2022-05-23 18:51:38.530560','2022-05-23 18:51:38.530588',3,12);
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
  `head_image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (1,'첫 포스트 입니다','태그','태그를 확인하세요','','','2022-05-19 11:16:24.528810','2022-05-19 11:16:24.528840',1,NULL),(2,'두번째 포스트 입니다.','ㅇㅇㅇ','될까...','','','2022-05-19 11:16:55.110331','2022-05-19 11:16:55.110354',1,NULL),(3,'3번째 포스트 입니다.','과연??','음...??\r\n일단 중복은 바로 넘어가지고\r\n뒤에 쉼표를 제거 함으로써 이제 공백은 생겨나지 않습니다.','','','2022-05-19 11:18:09.824494','2022-05-19 11:18:09.824521',1,NULL),(4,'ㄹㄹㄹ','ㅇㅇㅇ','ㄴㄴㄴ','','','2022-05-19 11:19:11.856559','2022-05-19 14:04:13.996850',1,NULL),(5,'끝자리 쉼표 두개 확인해보자','쉼표두개 찍기','태그, 태그, 태그, 태그,,\r\n\r\n예상 - 최 우측 쉼표 하나 삭제 하고 하나 남았기 때문에\r\n그로인하여 오른쪽 (공백태그)가 생길까 하는 의문,','','','2022-05-19 14:05:38.092538','2022-05-19 14:05:38.092600',1,NULL),(6,'쉼표 두개 다 없애주는데?? 뭐지??','쉼표테스트','뭐지 이런건가 원래 신기하니까\r\n3개 찍어봅니다.\r\n태그, 태그, 태그, 태그,,,\r\n이렇게','','','2022-05-19 14:07:01.592736','2022-05-19 14:07:01.592793',1,NULL),(7,'제목','훅텍스트','콘텐트 정리 해봅니다\r\n내려쓰기 됩니까\r\n되었으면 ㅎㅏ는디','','','2022-05-19 17:36:59.628264','2022-05-19 17:36:59.628306',1,NULL),(8,'ff','ddd','ffffffffffffffffffffffff\r\nasdfasdfasdf\r\n\r\nfeeeeeeeeeeee\r\n\r\nxxxxx','','','2022-05-19 17:42:44.938058','2022-05-19 17:42:44.938077',1,NULL),(9,'dd','dd','이제 될껄?\r\n\r\n내려쓰기\r\n쌉가능?\r\nㅁㄴㅇㅅㅁㅇ?','','','2022-05-19 17:43:53.537544','2022-05-19 17:43:53.537574',1,NULL),(10,'제목입니다.','훅텍스트','콘텐트 적는곳\r\n#제목 1\r\n##제목 2\r\n### 제목3\r\n---\r\n    dtddd  ffff\r\n    tdt								\r\n가나다라마바사 아자차카 타파하\r\n글을 적어봅시다\r\n엔터는 왜 안먹지 장난치나\r\n왜 계속 옆으로 나오냐 하...\r\n일단 이게 마크다운X 테스트 페이지임.','','','2022-05-20 09:15:53.503108','2022-05-20 09:55:02.271995',1,NULL),(11,'11번째 포스트 이시다.','11번','안녕 11번 내용물이야\r\n2번째 줄 ㄳㄳ\r\n3번째 줄 띄우기 가 잘 되는군\r\n좋다.','','','2022-05-23 16:31:52.528798','2022-05-23 16:31:52.528817',1,NULL),(12,'12번째입니다','12','뭐지?\r\n내려쓰기 안되나\r\n아니 안되나?????????\r\n갑자기 왜?','','','2022-05-23 16:33:09.143132','2022-05-23 16:33:09.143164',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post_tags`
--

LOCK TABLES `blog_post_tags` WRITE;
/*!40000 ALTER TABLE `blog_post_tags` DISABLE KEYS */;
INSERT INTO `blog_post_tags` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,2,3),(6,3,4),(7,3,5),(8,3,6),(9,3,7),(14,4,4),(15,4,7),(16,4,8),(17,4,9),(18,5,10),(19,5,11),(20,5,12),(21,5,13),(22,6,14),(23,6,15),(24,6,16),(25,7,17),(26,7,18),(27,7,19),(28,8,20),(29,8,21),(30,8,22),(31,9,23),(32,9,24),(33,9,25),(43,10,26),(44,10,27),(45,10,28),(46,10,29),(47,11,1),(48,11,2),(49,11,17),(50,11,18),(51,11,23),(52,11,29);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'블루','블루'),(2,'파랑','파랑'),(3,'파랑새','파랑새'),(4,'고양이','고양이'),(5,'강아지','강아지'),(6,'멍멍이','멍멍이'),(7,'토끼','토끼'),(8,'개','개'),(9,'멍뭉이','멍뭉이'),(10,'갈치','갈치'),(11,'고등어','고등어'),(12,'연어','연어'),(13,'고래','고래'),(14,'제주도','제주도'),(15,'한라산','한라산'),(16,'블랙스톤','블랙스톤'),(17,'내려쓰기','내려쓰기'),(18,'테스트','테스트'),(19,'중입니다','중입니다'),(20,'dfasdf','dfasdf'),(21,'dsfsd','dsfsd'),(22,'aa','aa'),(23,'가능가능','가능가능'),(24,'쌉가능','쌉가능'),(25,'간지','간지'),(26,'마크다운','마크다운'),(27,'마크다운X','마크다운x'),(28,'Markdownx','markdownx'),(29,'test','test');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-05-20 09:55:02.275709','10','[10]제목입니다. :: song',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',9,1),(2,'2022-05-20 10:34:08.876201','1','127.0.0.1:8000',2,'[{\"changed\": {\"fields\": [\"Domain name\", \"Display name\"]}}]',10,1),(3,'2022-05-20 10:46:54.038872','1','google',1,'[{\"added\": {}}]',14,1),(4,'2022-05-20 11:49:17.024594','1','seondeok2::댓글 테스트 입니다.\r\n\r\n줄바꿈은 되었으면 합니다.',1,'[{\"added\": {}}]',16,1),(5,'2022-05-23 11:01:29.967305','1','google',2,'[{\"changed\": {\"fields\": [\"Client id\", \"Secret key\"]}}]',14,1),(6,'2022-05-23 11:10:42.437511','1','127.0.0.1:8000',2,'[]',10,1),(7,'2022-05-23 11:17:02.373667','1','google',2,'[]',14,1),(8,'2022-05-23 11:39:59.710108','1','127.0.0.1:8000',2,'[]',10,1),(9,'2022-05-23 11:41:30.181304','1','google',2,'[]',14,1),(10,'2022-05-23 11:57:38.405305','1','localhost:8000',2,'[{\"changed\": {\"fields\": [\"Domain name\"]}}]',10,1),(11,'2022-05-23 11:57:41.851871','1','localhost:8000',2,'[]',10,1),(12,'2022-05-23 12:19:04.665483','1','127.0.0.1:8000',2,'[{\"changed\": {\"fields\": [\"Domain name\"]}}]',10,1),(13,'2022-05-23 12:19:41.631111','1','google',2,'[]',14,1),(14,'2022-05-23 12:23:04.850201','1','127.0.0.1:8000/',2,'[{\"changed\": {\"fields\": [\"Domain name\"]}}]',10,1),(15,'2022-05-23 12:23:23.549980','1','127.0.0.1:8000',2,'[{\"changed\": {\"fields\": [\"Domain name\"]}}]',10,1),(16,'2022-05-23 15:27:42.790604','1','google',2,'[]',14,1),(17,'2022-05-23 15:35:11.566097','1','google',2,'[{\"changed\": {\"fields\": [\"Client id\", \"Secret key\"]}}]',14,1),(18,'2022-05-23 15:37:55.613886','2','example.com',1,'[{\"added\": {}}]',10,1),(19,'2022-05-23 15:38:21.366031','1','google',2,'[{\"changed\": {\"fields\": [\"Sites\"]}}]',14,1),(20,'2022-05-23 15:48:41.377110','2','seondeok2',3,'',4,1),(21,'2022-05-23 16:31:52.532133','11','[11]11번째 포스트 이시다. :: song',1,'[{\"added\": {}}]',9,1);
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
INSERT INTO `django_content_type` VALUES (11,'account','emailaddress'),(12,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','category'),(16,'blog','comment'),(9,'blog','post'),(8,'blog','tag'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(10,'sites','site'),(13,'socialaccount','socialaccount'),(14,'socialaccount','socialapp'),(15,'socialaccount','socialtoken');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-19 11:15:06.031474'),(2,'auth','0001_initial','2022-05-19 11:15:06.694776'),(3,'admin','0001_initial','2022-05-19 11:15:06.860911'),(4,'admin','0002_logentry_remove_auto_add','2022-05-19 11:15:06.888711'),(5,'admin','0003_logentry_add_action_flag_choices','2022-05-19 11:15:06.904309'),(6,'contenttypes','0002_remove_content_type_name','2022-05-19 11:15:06.977856'),(7,'auth','0002_alter_permission_name_max_length','2022-05-19 11:15:07.028450'),(8,'auth','0003_alter_user_email_max_length','2022-05-19 11:15:07.052426'),(9,'auth','0004_alter_user_username_opts','2022-05-19 11:15:07.061455'),(10,'auth','0005_alter_user_last_login_null','2022-05-19 11:15:07.104499'),(11,'auth','0006_require_contenttypes_0002','2022-05-19 11:15:07.108994'),(12,'auth','0007_alter_validators_add_error_messages','2022-05-19 11:15:07.118226'),(13,'auth','0008_alter_user_username_max_length','2022-05-19 11:15:07.170593'),(14,'auth','0009_alter_user_last_name_max_length','2022-05-19 11:15:07.219537'),(15,'auth','0010_alter_group_name_max_length','2022-05-19 11:15:07.245150'),(16,'auth','0011_update_proxy_permissions','2022-05-19 11:15:07.255173'),(17,'auth','0012_alter_user_first_name_max_length','2022-05-19 11:15:07.308393'),(18,'blog','0001_initial','2022-05-19 11:15:07.718870'),(19,'sessions','0001_initial','2022-05-19 11:15:07.771453'),(20,'blog','0002_alter_post_content','2022-05-19 17:43:24.309456'),(21,'account','0001_initial','2022-05-20 10:12:33.922810'),(22,'account','0002_email_max_length','2022-05-20 10:12:33.979737'),(23,'sites','0001_initial','2022-05-20 10:12:34.002208'),(24,'sites','0002_alter_domain_unique','2022-05-20 10:12:34.021109'),(25,'socialaccount','0001_initial','2022-05-20 10:12:34.533271'),(26,'socialaccount','0002_token_max_lengths','2022-05-20 10:12:34.616072'),(27,'socialaccount','0003_extra_data_default_dict','2022-05-20 10:12:34.628085'),(28,'blog','0003_comment','2022-05-20 11:45:30.519727');
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
INSERT INTO `django_session` VALUES ('c9p9t13hnd9r2yc3uucouhwx9r1uvqcn','eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sInBMZGg0bldjb3I2QyJdfQ:1nt1TC:y6ex0qSPTU7swNqSgAE3J1qEhUFVapZZk9ODgs7Bn4s','2022-06-06 15:23:10.627327'),('h5moazbuepn4po7xsemnj11du3werurg','eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIlY5TGltMkNiQlFyaSJdfQ:1nt1NE:mieLfBvds8TN54idP6e6Dh-R590Fd4c61rF_qAWWgDY','2022-06-06 15:17:00.439935'),('qut85qbtlt7axz3psuadd41b53au1yh0','.eJxVjEEOgjAQRe_StWkYCu3UpXvP0AwzU4saSCisjHdXEha6_e-9_zKJtrWkreqSRjFnA-b0uw3ED512IHeabrPleVqXcbC7Yg9a7XUWfV4O9--gUC3fGjU37DqKPXgAcZydxoZFQs8Z0QckhCwtkmYH0QO36LITVIkhdGjeH-x5N_c:1nrVhq:ACjwHF8GOhxmn9BE3_BCREEhfLTnK2dYiU2k0rEVRHA','2022-06-02 11:16:02.075824');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'127.0.0.1:8000','lacal development'),(2,'example.com','example.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (2,'google','106955828705900150574','2022-05-23 18:49:11.280661','2022-05-23 15:49:07.027729','{\"id\": \"106955828705900150574\", \"email\": \"veritas104@naver.com\", \"verified_email\": true, \"name\": \"SeonDeok2\\uc120\\ub355\\uc774\", \"given_name\": \"\\uc120\\ub355\\uc774\", \"family_name\": \"SeonDeok2\", \"picture\": \"https://lh3.googleusercontent.com/a-/AOh14Gh3k5QRxDhiiGjMxVdRGzgLvMKrybkPT08Q7pbf=s96-c\", \"locale\": \"ko\"}',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'google','google','296024127664-43br420usk0euh739p6spnk9k5bh2gnd.apps.googleusercontent.com','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','');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,1),(2,1,2);
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

-- Dump completed on 2022-05-23 19:55:49
