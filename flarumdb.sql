-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: flarumdb
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_access_tokens`
--

DROP TABLE IF EXISTS `fl_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_access_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `last_activity_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fl_access_tokens_token_unique` (`token`),
  KEY `fl_access_tokens_user_id_foreign` (`user_id`),
  KEY `fl_access_tokens_type_index` (`type`),
  CONSTRAINT `fl_access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_access_tokens`
--

LOCK TABLES `fl_access_tokens` WRITE;
/*!40000 ALTER TABLE `fl_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_api_keys`
--

DROP TABLE IF EXISTS `fl_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_api_keys` (
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `allowed_ips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fl_api_keys_key_unique` (`key`),
  KEY `fl_api_keys_user_id_foreign` (`user_id`),
  CONSTRAINT `fl_api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_api_keys`
--

LOCK TABLES `fl_api_keys` WRITE;
/*!40000 ALTER TABLE `fl_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_blog_meta`
--

DROP TABLE IF EXISTS `fl_blog_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_blog_meta` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int unsigned NOT NULL,
  `featured_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint(1) DEFAULT '0',
  `is_sized` tinyint(1) DEFAULT '0',
  `is_pending_review` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fl_blog_meta_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `fl_blog_meta_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `fl_discussions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_blog_meta`
--

LOCK TABLES `fl_blog_meta` WRITE;
/*!40000 ALTER TABLE `fl_blog_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_blog_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_custom_emojis`
--

DROP TABLE IF EXISTS `fl_custom_emojis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_custom_emojis` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_to_replace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_custom_emojis`
--

LOCK TABLES `fl_custom_emojis` WRITE;
/*!40000 ALTER TABLE `fl_custom_emojis` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_custom_emojis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_discussion_tag`
--

DROP TABLE IF EXISTS `fl_discussion_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_discussion_tag` (
  `discussion_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`discussion_id`,`tag_id`),
  KEY `fl_discussion_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `fl_discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `fl_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `fl_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_discussion_tag`
--

LOCK TABLES `fl_discussion_tag` WRITE;
/*!40000 ALTER TABLE `fl_discussion_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_discussion_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_discussion_user`
--

DROP TABLE IF EXISTS `fl_discussion_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_discussion_user` (
  `user_id` int unsigned NOT NULL,
  `discussion_id` int unsigned NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int unsigned DEFAULT NULL,
  `subscription` enum('follow','ignore') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`,`discussion_id`),
  KEY `fl_discussion_user_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `fl_discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `fl_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_discussion_user`
--

LOCK TABLES `fl_discussion_user` WRITE;
/*!40000 ALTER TABLE `fl_discussion_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_discussion_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_discussions`
--

DROP TABLE IF EXISTS `fl_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_discussions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_count` int NOT NULL DEFAULT '1',
  `participant_count` int unsigned NOT NULL DEFAULT '0',
  `post_number_index` int unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `first_post_id` int unsigned DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int unsigned DEFAULT NULL,
  `last_post_id` int unsigned DEFAULT NULL,
  `last_post_number` int unsigned DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int unsigned DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0',
  `votes` int NOT NULL,
  `hotness` double(10,4) NOT NULL,
  `best_answer_post_id` int unsigned DEFAULT NULL,
  `best_answer_user_id` int unsigned DEFAULT NULL,
  `best_answer_notified` tinyint(1) NOT NULL,
  `best_answer_set_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fl_discussions_hidden_user_id_foreign` (`hidden_user_id`),
  KEY `fl_discussions_first_post_id_foreign` (`first_post_id`),
  KEY `fl_discussions_last_post_id_foreign` (`last_post_id`),
  KEY `fl_discussions_last_posted_at_index` (`last_posted_at`),
  KEY `fl_discussions_last_posted_user_id_index` (`last_posted_user_id`),
  KEY `fl_discussions_created_at_index` (`created_at`),
  KEY `fl_discussions_user_id_index` (`user_id`),
  KEY `fl_discussions_comment_count_index` (`comment_count`),
  KEY `fl_discussions_participant_count_index` (`participant_count`),
  KEY `fl_discussions_hidden_at_index` (`hidden_at`),
  KEY `fl_discussions_is_locked_index` (`is_locked`),
  KEY `fl_discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`),
  KEY `fl_discussions_is_sticky_last_posted_at_index` (`is_sticky`,`last_posted_at`),
  KEY `fl_discussions_votes_index` (`votes`),
  KEY `fl_discussions_best_answer_post_id_foreign` (`best_answer_post_id`),
  KEY `fl_discussions_best_answer_user_id_foreign` (`best_answer_user_id`),
  KEY `fl_discussions_best_answer_set_at_index` (`best_answer_set_at`),
  FULLTEXT KEY `title` (`title`),
  CONSTRAINT `fl_discussions_best_answer_post_id_foreign` FOREIGN KEY (`best_answer_post_id`) REFERENCES `fl_posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_discussions_best_answer_user_id_foreign` FOREIGN KEY (`best_answer_user_id`) REFERENCES `fl_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `fl_posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `fl_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `fl_posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `fl_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_discussions`
--

LOCK TABLES `fl_discussions` WRITE;
/*!40000 ALTER TABLE `fl_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_email_tokens`
--

DROP TABLE IF EXISTS `fl_email_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_email_tokens` (
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `fl_email_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `fl_email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_email_tokens`
--

LOCK TABLES `fl_email_tokens` WRITE;
/*!40000 ALTER TABLE `fl_email_tokens` DISABLE KEYS */;
INSERT INTO `fl_email_tokens` VALUES ('cL79eFzdUmDNuKbG8IjWNEvgzH57i1bKqlpIOeH4','hoangtutobe@gamil.com',3,'2022-09-29 14:40:03'),('LIAu5tEwoAwJBgpuDvZs6sEWTYthbS8CE8um1Hyy','hoangtutobe@gmail.com',4,'2022-09-29 14:40:19'),('MkDmURfLXdUSdXYDrD1g1oFxMWRTyrWjiKSlP765','hauhuynhcong96@gamil.com',2,'2022-09-29 14:39:32');
/*!40000 ALTER TABLE `fl_email_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_flags`
--

DROP TABLE IF EXISTS `fl_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_flags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fl_flags_post_id_foreign` (`post_id`),
  KEY `fl_flags_user_id_foreign` (`user_id`),
  KEY `fl_flags_created_at_index` (`created_at`),
  CONSTRAINT `fl_flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fl_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_flags`
--

LOCK TABLES `fl_flags` WRITE;
/*!40000 ALTER TABLE `fl_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_fof_upload_downloads`
--

DROP TABLE IF EXISTS `fl_fof_upload_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_fof_upload_downloads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned NOT NULL,
  `discussion_id` int unsigned DEFAULT NULL,
  `post_id` int unsigned DEFAULT NULL,
  `actor_id` int unsigned DEFAULT NULL,
  `downloaded_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fl_fof_upload_downloads_file_id_foreign` (`file_id`),
  KEY `fl_fof_upload_downloads_discussion_id_foreign` (`discussion_id`),
  KEY `fl_fof_upload_downloads_actor_id_foreign` (`actor_id`),
  KEY `fl_fof_upload_downloads_post_id_foreign` (`post_id`),
  CONSTRAINT `fl_fof_upload_downloads_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `fl_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_fof_upload_downloads_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `fl_discussions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_fof_upload_downloads_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `fl_fof_upload_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_fof_upload_downloads_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fl_posts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_fof_upload_downloads`
--

LOCK TABLES `fl_fof_upload_downloads` WRITE;
/*!40000 ALTER TABLE `fl_fof_upload_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_fof_upload_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_fof_upload_files`
--

DROP TABLE IF EXISTS `fl_fof_upload_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_fof_upload_files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` int unsigned DEFAULT NULL,
  `discussion_id` int unsigned DEFAULT NULL,
  `post_id` int unsigned DEFAULT NULL,
  `base_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `upload_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remote_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide_from_media_manager` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fl_fof_upload_files_actor_id_hide_from_media_manager_index` (`actor_id`,`hide_from_media_manager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_fof_upload_files`
--

LOCK TABLES `fl_fof_upload_files` WRITE;
/*!40000 ALTER TABLE `fl_fof_upload_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_fof_upload_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_group_permission`
--

DROP TABLE IF EXISTS `fl_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_group_permission` (
  `group_id` int unsigned NOT NULL,
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`,`permission`),
  CONSTRAINT `fl_group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `fl_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_group_permission`
--

LOCK TABLES `fl_group_permission` WRITE;
/*!40000 ALTER TABLE `fl_group_permission` DISABLE KEYS */;
INSERT INTO `fl_group_permission` VALUES (2,'discussion.canSeeVotes','2022-09-29 14:44:37'),(2,'fof-upload.download','2022-09-29 14:44:06'),(2,'fof.gamification.viewRankingPage','2022-09-29 14:25:16'),(2,'viewForum',NULL),(3,'blog.writeArticles','2022-09-29 14:38:22'),(3,'discussion.canSeeVoters','2022-09-29 14:44:28'),(3,'discussion.downvote_notifications','2022-09-29 14:25:16'),(3,'discussion.flagPosts','2022-09-29 14:20:02'),(3,'discussion.likePosts','2022-09-29 14:20:02'),(3,'discussion.reply',NULL),(3,'discussion.replyWithoutApproval','2022-09-29 14:20:02'),(3,'discussion.selectBestAnswerOwnDiscussion','2022-09-29 14:25:42'),(3,'discussion.startWithoutApproval','2022-09-29 14:20:02'),(3,'discussion.upvote_notifications','2022-09-29 14:25:16'),(3,'discussion.votePosts','2022-09-29 14:25:16'),(3,'fof-upload.upload','2022-09-29 14:46:06'),(3,'searchUsers',NULL),(3,'startDiscussion',NULL),(3,'user.editOwnNickname','2022-09-29 14:27:19'),(3,'user.viewLastSeenAt','2022-09-29 14:45:00'),(4,'blog.autoApprovePosts','2022-09-29 14:38:35'),(4,'blog.canApprovePosts','2022-09-29 14:38:39'),(4,'bypassTagCounts','2022-09-29 14:45:59'),(4,'discussion.approvePosts','2022-09-29 14:20:02'),(4,'discussion.editPosts',NULL),(4,'discussion.hide',NULL),(4,'discussion.hidePosts',NULL),(4,'discussion.lock','2022-09-29 14:20:02'),(4,'discussion.rename',NULL),(4,'discussion.selectBestAnswerNotOwnDiscussion','2022-09-29 14:47:01'),(4,'discussion.sticky','2022-09-29 14:20:03'),(4,'discussion.tag','2022-09-29 14:20:03'),(4,'discussion.viewFlags','2022-09-29 14:20:02'),(4,'discussion.viewIpsPosts',NULL),(4,'fof-upload.deleteUserUploads','2022-09-29 14:27:43'),(4,'fof-upload.viewUserUploads','2022-09-29 14:27:43'),(4,'user.suspend','2022-09-29 14:20:03');
/*!40000 ALTER TABLE `fl_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_group_user`
--

DROP TABLE IF EXISTS `fl_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_group_user` (
  `user_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `fl_group_user_group_id_foreign` (`group_id`),
  CONSTRAINT `fl_group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `fl_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_group_user`
--

LOCK TABLES `fl_group_user` WRITE;
/*!40000 ALTER TABLE `fl_group_user` DISABLE KEYS */;
INSERT INTO `fl_group_user` VALUES (1,1,'2022-09-29 14:20:02'),(1,4,'2022-09-29 14:22:37'),(2,5,'2022-09-29 14:48:04'),(3,5,'2022-09-29 14:48:09'),(4,5,'2022-09-29 14:48:12');
/*!40000 ALTER TABLE `fl_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_groups`
--

DROP TABLE IF EXISTS `fl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_singular` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_plural` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_groups`
--

LOCK TABLES `fl_groups` WRITE;
/*!40000 ALTER TABLE `fl_groups` DISABLE KEYS */;
INSERT INTO `fl_groups` VALUES (1,'Admin','Admins','#B72A2A','fas fa-wrench',0,NULL,NULL),(2,'Guest','Guests',NULL,NULL,0,NULL,NULL),(3,'Member','Members',NULL,NULL,0,NULL,NULL),(4,'Mod','Mods','#80349E','fas fa-bolt',0,NULL,NULL),(5,'user','normaluser','#990a','',0,'2022-09-29 14:43:35','2022-09-29 14:43:35');
/*!40000 ALTER TABLE `fl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_login_providers`
--

DROP TABLE IF EXISTS `fl_login_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_login_providers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `provider` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fl_login_providers_provider_identifier_unique` (`provider`,`identifier`),
  KEY `fl_login_providers_user_id_foreign` (`user_id`),
  CONSTRAINT `fl_login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_login_providers`
--

LOCK TABLES `fl_login_providers` WRITE;
/*!40000 ALTER TABLE `fl_login_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_login_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_migrations`
--

DROP TABLE IF EXISTS `fl_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_migrations`
--

LOCK TABLES `fl_migrations` WRITE;
/*!40000 ALTER TABLE `fl_migrations` DISABLE KEYS */;
INSERT INTO `fl_migrations` VALUES (1,'2015_02_24_000000_create_access_tokens_table',NULL),(2,'2015_02_24_000000_create_api_keys_table',NULL),(3,'2015_02_24_000000_create_config_table',NULL),(4,'2015_02_24_000000_create_discussions_table',NULL),(5,'2015_02_24_000000_create_email_tokens_table',NULL),(6,'2015_02_24_000000_create_groups_table',NULL),(7,'2015_02_24_000000_create_notifications_table',NULL),(8,'2015_02_24_000000_create_password_tokens_table',NULL),(9,'2015_02_24_000000_create_permissions_table',NULL),(10,'2015_02_24_000000_create_posts_table',NULL),(11,'2015_02_24_000000_create_users_discussions_table',NULL),(12,'2015_02_24_000000_create_users_groups_table',NULL),(13,'2015_02_24_000000_create_users_table',NULL),(14,'2015_09_15_000000_create_auth_tokens_table',NULL),(15,'2015_09_20_224327_add_hide_to_discussions',NULL),(16,'2015_09_22_030432_rename_notification_read_time',NULL),(17,'2015_10_07_130531_rename_config_to_settings',NULL),(18,'2015_10_24_194000_add_ip_address_to_posts',NULL),(19,'2015_12_05_042721_change_access_tokens_columns',NULL),(20,'2015_12_17_194247_change_settings_value_column_to_text',NULL),(21,'2016_02_04_095452_add_slug_to_discussions',NULL),(22,'2017_04_07_114138_add_is_private_to_discussions',NULL),(23,'2017_04_07_114138_add_is_private_to_posts',NULL),(24,'2018_01_11_093900_change_access_tokens_columns',NULL),(25,'2018_01_11_094000_change_access_tokens_add_foreign_keys',NULL),(26,'2018_01_11_095000_change_api_keys_columns',NULL),(27,'2018_01_11_101800_rename_auth_tokens_to_registration_tokens',NULL),(28,'2018_01_11_102000_change_registration_tokens_rename_id_to_token',NULL),(29,'2018_01_11_102100_change_registration_tokens_created_at_to_datetime',NULL),(30,'2018_01_11_120604_change_posts_table_to_innodb',NULL),(31,'2018_01_11_155200_change_discussions_rename_columns',NULL),(32,'2018_01_11_155300_change_discussions_add_foreign_keys',NULL),(33,'2018_01_15_071700_rename_users_discussions_to_discussion_user',NULL),(34,'2018_01_15_071800_change_discussion_user_rename_columns',NULL),(35,'2018_01_15_071900_change_discussion_user_add_foreign_keys',NULL),(36,'2018_01_15_072600_change_email_tokens_rename_id_to_token',NULL),(37,'2018_01_15_072700_change_email_tokens_add_foreign_keys',NULL),(38,'2018_01_15_072800_change_email_tokens_created_at_to_datetime',NULL),(39,'2018_01_18_130400_rename_permissions_to_group_permission',NULL),(40,'2018_01_18_130500_change_group_permission_add_foreign_keys',NULL),(41,'2018_01_18_130600_rename_users_groups_to_group_user',NULL),(42,'2018_01_18_130700_change_group_user_add_foreign_keys',NULL),(43,'2018_01_18_133000_change_notifications_columns',NULL),(44,'2018_01_18_133100_change_notifications_add_foreign_keys',NULL),(45,'2018_01_18_134400_change_password_tokens_rename_id_to_token',NULL),(46,'2018_01_18_134500_change_password_tokens_add_foreign_keys',NULL),(47,'2018_01_18_134600_change_password_tokens_created_at_to_datetime',NULL),(48,'2018_01_18_135000_change_posts_rename_columns',NULL),(49,'2018_01_18_135100_change_posts_add_foreign_keys',NULL),(50,'2018_01_30_112238_add_fulltext_index_to_discussions_title',NULL),(51,'2018_01_30_220100_create_post_user_table',NULL),(52,'2018_01_30_222900_change_users_rename_columns',NULL),(55,'2018_09_15_041340_add_users_indicies',NULL),(56,'2018_09_15_041828_add_discussions_indicies',NULL),(57,'2018_09_15_043337_add_notifications_indices',NULL),(58,'2018_09_15_043621_add_posts_indices',NULL),(59,'2018_09_22_004100_change_registration_tokens_columns',NULL),(60,'2018_09_22_004200_create_login_providers_table',NULL),(61,'2018_10_08_144700_add_shim_prefix_to_group_icons',NULL),(62,'2019_10_12_195349_change_posts_add_discussion_foreign_key',NULL),(63,'2020_03_19_134512_change_discussions_default_comment_count',NULL),(64,'2020_04_21_130500_change_permission_groups_add_is_hidden',NULL),(65,'2021_03_02_040000_change_access_tokens_add_type',NULL),(66,'2021_03_02_040500_change_access_tokens_add_id',NULL),(67,'2021_03_02_041000_change_access_tokens_add_title_ip_agent',NULL),(68,'2021_04_18_040500_change_migrations_add_id_primary_key',NULL),(69,'2021_04_18_145100_change_posts_content_column_to_mediumtext',NULL),(70,'2018_07_21_000000_seed_default_groups',NULL),(71,'2018_07_21_000100_seed_default_group_permissions',NULL),(72,'2021_05_10_000000_rename_permissions',NULL),(73,'2022_05_20_000000_add_timestamps_to_groups_table',NULL),(74,'2022_05_20_000001_add_created_at_to_group_user_table',NULL),(75,'2022_05_20_000002_add_created_at_to_group_permission_table',NULL),(76,'2022_07_14_000000_add_type_index_to_posts',NULL),(77,'2022_07_14_000001_add_type_created_at_composite_index_to_posts',NULL),(78,'2015_09_21_011527_add_is_approved_to_discussions','flarum-approval'),(79,'2015_09_21_011706_add_is_approved_to_posts','flarum-approval'),(80,'2017_07_22_000000_add_default_permissions','flarum-approval'),(81,'2018_09_29_060444_replace_emoji_shorcuts_with_unicode','flarum-emoji'),(82,'2015_09_02_000000_add_flags_read_time_to_users_table','flarum-flags'),(83,'2015_09_02_000000_create_flags_table','flarum-flags'),(84,'2017_07_22_000000_add_default_permissions','flarum-flags'),(85,'2018_06_27_101500_change_flags_rename_time_to_created_at','flarum-flags'),(86,'2018_06_27_101600_change_flags_add_foreign_keys','flarum-flags'),(87,'2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at','flarum-flags'),(88,'2018_09_15_043621_add_flags_indices','flarum-flags'),(89,'2019_10_22_000000_change_reason_text_col_type','flarum-flags'),(90,'2015_05_11_000000_create_posts_likes_table','flarum-likes'),(91,'2015_09_04_000000_add_default_like_permissions','flarum-likes'),(92,'2018_06_27_100600_rename_posts_likes_to_post_likes','flarum-likes'),(93,'2018_06_27_100700_change_post_likes_add_foreign_keys','flarum-likes'),(94,'2021_05_10_094200_add_created_at_to_post_likes_table','flarum-likes'),(95,'2015_02_24_000000_add_locked_to_discussions','flarum-lock'),(96,'2017_07_22_000000_add_default_permissions','flarum-lock'),(97,'2018_09_15_043621_add_discussions_indices','flarum-lock'),(98,'2021_03_25_000000_default_settings','flarum-markdown'),(99,'2015_05_11_000000_create_mentions_posts_table','flarum-mentions'),(100,'2015_05_11_000000_create_mentions_users_table','flarum-mentions'),(101,'2018_06_27_102000_rename_mentions_posts_to_post_mentions_post','flarum-mentions'),(102,'2018_06_27_102100_rename_mentions_users_to_post_mentions_user','flarum-mentions'),(103,'2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id','flarum-mentions'),(104,'2018_06_27_102300_change_post_mentions_post_add_foreign_keys','flarum-mentions'),(105,'2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id','flarum-mentions'),(106,'2018_06_27_102500_change_post_mentions_user_add_foreign_keys','flarum-mentions'),(107,'2021_04_19_000000_set_default_settings','flarum-mentions'),(108,'2022_05_20_000005_add_created_at_to_post_mentions_post_table','flarum-mentions'),(109,'2022_05_20_000006_add_created_at_to_post_mentions_user_table','flarum-mentions'),(110,'2015_02_24_000000_add_sticky_to_discussions','flarum-sticky'),(111,'2017_07_22_000000_add_default_permissions','flarum-sticky'),(112,'2018_09_15_043621_add_discussions_indices','flarum-sticky'),(113,'2021_01_13_000000_add_discussion_last_posted_at_indices','flarum-sticky'),(114,'2015_05_11_000000_add_subscription_to_users_discussions_table','flarum-subscriptions'),(115,'2015_05_11_000000_add_suspended_until_to_users_table','flarum-suspend'),(116,'2015_09_14_000000_rename_suspended_until_column','flarum-suspend'),(117,'2017_07_22_000000_add_default_permissions','flarum-suspend'),(118,'2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until','flarum-suspend'),(119,'2021_10_27_000000_add_suspend_reason_and_message','flarum-suspend'),(120,'2015_02_24_000000_create_discussions_tags_table','flarum-tags'),(121,'2015_02_24_000000_create_tags_table','flarum-tags'),(122,'2015_02_24_000000_create_users_tags_table','flarum-tags'),(123,'2015_02_24_000000_set_default_settings','flarum-tags'),(124,'2015_10_19_061223_make_slug_unique','flarum-tags'),(125,'2017_07_22_000000_add_default_permissions','flarum-tags'),(126,'2018_06_27_085200_change_tags_columns','flarum-tags'),(127,'2018_06_27_085300_change_tags_add_foreign_keys','flarum-tags'),(128,'2018_06_27_090400_rename_users_tags_to_tag_user','flarum-tags'),(129,'2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at','flarum-tags'),(130,'2018_06_27_100200_change_tag_user_add_foreign_keys','flarum-tags'),(131,'2018_06_27_103000_rename_discussions_tags_to_discussion_tag','flarum-tags'),(132,'2018_06_27_103100_add_discussion_tag_foreign_keys','flarum-tags'),(133,'2019_04_21_000000_add_icon_to_tags_table','flarum-tags'),(134,'2022_05_20_000003_add_timestamps_to_tags_table','flarum-tags'),(135,'2022_05_20_000004_add_created_at_to_discussion_tag_table','flarum-tags'),(136,'2020_06_18_000000_migrate_extension_settings','fof-analytics'),(137,'2019_07_09_000000_create_post_votes_table','fof-gamification'),(138,'2019_07_09_000001_add_attributes_to_users','fof-gamification'),(139,'2019_07_09_000002_add_votes_and_hotness_to_discussions','fof-gamification'),(140,'2019_07_09_000003_add_default_permissions','fof-gamification'),(141,'2019_07_09_000004_create_rank_users_table','fof-gamification'),(142,'2019_07_09_000005_migrate_extension_settings','fof-gamification'),(143,'2019_07_10_000000_create_ranks_table','fof-gamification'),(144,'2019_08_09_000000_add_votes_foreign_keys','fof-gamification'),(145,'2020_07_07_000000_add_prefix_to_all_settings','fof-gamification'),(146,'2020_07_09_000000_change_post_votes_type_column','fof-gamification'),(147,'2020_07_11_000000_change_permission_name','fof-gamification'),(148,'2020_08_25_000000_update_tag_permission_names','fof-gamification'),(149,'2021_10_27_000000_add_index_to_votes_column','fof-gamification'),(150,'2021_10_28_000000_create_alternate_post_voting_ui_setting','fof-gamification'),(151,'2022_02_04_000000_add_timestamps_to_post_votes_table','fof-gamification'),(152,'2022_02_06_000000_add_default_notification_permissions','fof-gamification'),(153,'2019_11_04_000001_add_columns_to_discussions_table','fof-best-answer'),(154,'2019_11_04_000002_add_foreign_keys_to_best_anwer_columns','fof-best-answer'),(155,'2019_11_04_000003_migrate_extension_settings','fof-best-answer'),(156,'2020_02_04_205300_add_best_answer_set_timestamp','fof-best-answer'),(157,'2021_08_09_add_qna_column_to_tags_table','fof-best-answer'),(158,'2021_08_10_add_reminders_column_to_tags_table','fof-best-answer'),(159,'2021_08_15_migrate_reminder_settings','fof-best-answer'),(160,'2021_09_10_add_default_filter_option_setting','fof-best-answer'),(161,'2022_05_19_000000_add_best_answer_count_to_users_table','fof-best-answer'),(162,'2021_07_06_000000_set_default_settings','the-turk-flamoji'),(163,'2021_07_08_000000_create_custom_emojis_table','the-turk-flamoji'),(164,'2020_11_23_000000_add_nickname_column','flarum-nicknames'),(165,'2020_12_02_000001_set_default_permissions','flarum-nicknames'),(166,'2021_11_16_000000_nickname_column_nullable','flarum-nicknames'),(167,'2020_02_06_01_rename_flagrow_permissions','fof-upload'),(168,'2020_02_06_02_rename_flagrow_settings','fof-upload'),(169,'2020_02_06_03_rename_flagrow_tables','fof-upload'),(170,'2020_02_06_04_remove_flagrow_migrations','fof-upload'),(171,'2020_02_06_05_create_files_table','fof-upload'),(172,'2020_02_06_06_create_downloads_table','fof-upload'),(173,'2020_02_06_07_alter_downloads_add_post_constraint','fof-upload'),(174,'2021_02_11_01_add_uploads_view_and_delete_permissions','fof-upload'),(175,'2021_03_13_000000_alter_upload_files_add_hidden_from_media_manager','fof-upload'),(176,'2021_03_13_set_created_at_to_default_as_current_timestamp','fof-upload'),(177,'2021_09_30_000000_add_index_actor_id_and_hide_media','fof-upload'),(178,'2019_06_11_000000_add_subscription_to_users_tags_table','fof-follow-tags'),(179,'2019_06_28_000000_add_hide_subscription_option','fof-follow-tags'),(180,'2021_01_22_000000_add_indicies','fof-follow-tags'),(181,'2022_05_20_000000_add_timestamps_to_tag_user_table','fof-follow-tags'),(182,'2020_10_17_16_34_create_blog_meta_table','v17development-blog'),(183,'2020_10_17_16_50_add_default_permissions','v17development-blog');
/*!40000 ALTER TABLE `fl_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_notifications`
--

DROP TABLE IF EXISTS `fl_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `from_user_id` int unsigned DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int unsigned DEFAULT NULL,
  `data` blob,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `read_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fl_notifications_from_user_id_foreign` (`from_user_id`),
  KEY `fl_notifications_user_id_index` (`user_id`),
  CONSTRAINT `fl_notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `fl_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_notifications`
--

LOCK TABLES `fl_notifications` WRITE;
/*!40000 ALTER TABLE `fl_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_password_tokens`
--

DROP TABLE IF EXISTS `fl_password_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_password_tokens` (
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `fl_password_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `fl_password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_password_tokens`
--

LOCK TABLES `fl_password_tokens` WRITE;
/*!40000 ALTER TABLE `fl_password_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_password_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_post_likes`
--

DROP TABLE IF EXISTS `fl_post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_post_likes` (
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `fl_post_likes_user_id_foreign` (`user_id`),
  CONSTRAINT `fl_post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fl_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_post_likes`
--

LOCK TABLES `fl_post_likes` WRITE;
/*!40000 ALTER TABLE `fl_post_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_post_mentions_post`
--

DROP TABLE IF EXISTS `fl_post_mentions_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_post_mentions_post` (
  `post_id` int unsigned NOT NULL,
  `mentions_post_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`,`mentions_post_id`),
  KEY `fl_post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`),
  CONSTRAINT `fl_post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `fl_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fl_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_post_mentions_post`
--

LOCK TABLES `fl_post_mentions_post` WRITE;
/*!40000 ALTER TABLE `fl_post_mentions_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_post_mentions_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_post_mentions_user`
--

DROP TABLE IF EXISTS `fl_post_mentions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_post_mentions_user` (
  `post_id` int unsigned NOT NULL,
  `mentions_user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`,`mentions_user_id`),
  KEY `fl_post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`),
  CONSTRAINT `fl_post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fl_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_post_mentions_user`
--

LOCK TABLES `fl_post_mentions_user` WRITE;
/*!40000 ALTER TABLE `fl_post_mentions_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_post_mentions_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_post_user`
--

DROP TABLE IF EXISTS `fl_post_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_post_user` (
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `fl_post_user_user_id_foreign` (`user_id`),
  CONSTRAINT `fl_post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fl_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_post_user`
--

LOCK TABLES `fl_post_user` WRITE;
/*!40000 ALTER TABLE `fl_post_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_post_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_post_votes`
--

DROP TABLE IF EXISTS `fl_post_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_post_votes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `value` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fl_post_votes_post_id_foreign` (`post_id`),
  CONSTRAINT `fl_post_votes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fl_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_post_votes`
--

LOCK TABLES `fl_post_votes` WRITE;
/*!40000 ALTER TABLE `fl_post_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_post_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_posts`
--

DROP TABLE IF EXISTS `fl_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int unsigned NOT NULL,
  `number` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int unsigned DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fl_posts_discussion_id_number_unique` (`discussion_id`,`number`),
  KEY `fl_posts_edited_user_id_foreign` (`edited_user_id`),
  KEY `fl_posts_hidden_user_id_foreign` (`hidden_user_id`),
  KEY `fl_posts_discussion_id_number_index` (`discussion_id`,`number`),
  KEY `fl_posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  KEY `fl_posts_user_id_created_at_index` (`user_id`,`created_at`),
  KEY `fl_posts_type_index` (`type`),
  KEY `fl_posts_type_created_at_index` (`type`,`created_at`),
  FULLTEXT KEY `content` (`content`),
  CONSTRAINT `fl_posts_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `fl_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `fl_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `fl_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_posts`
--

LOCK TABLES `fl_posts` WRITE;
/*!40000 ALTER TABLE `fl_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_rank_users`
--

DROP TABLE IF EXISTS `fl_rank_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_rank_users` (
  `rank_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_rank_users`
--

LOCK TABLES `fl_rank_users` WRITE;
/*!40000 ALTER TABLE `fl_rank_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_rank_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_ranks`
--

DROP TABLE IF EXISTS `fl_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_ranks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `points` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_ranks`
--

LOCK TABLES `fl_ranks` WRITE;
/*!40000 ALTER TABLE `fl_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_registration_tokens`
--

DROP TABLE IF EXISTS `fl_registration_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_registration_tokens` (
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_registration_tokens`
--

LOCK TABLES `fl_registration_tokens` WRITE;
/*!40000 ALTER TABLE `fl_registration_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_registration_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_settings`
--

DROP TABLE IF EXISTS `fl_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_settings` (
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_settings`
--

LOCK TABLES `fl_settings` WRITE;
/*!40000 ALTER TABLE `fl_settings` DISABLE KEYS */;
INSERT INTO `fl_settings` VALUES ('afrux-forum-widgets-core.config',''),('afrux-forum-widgets-core.prefer_data_with_initial_load','1'),('afrux-theme-base.footer_bottom_line',''),('afrux-theme-base.footer_description',''),('afrux-theme-base.hero_banner','afrux_banner-uxucjies.png'),('afrux-theme-base.hero_banner_position',''),('afrux-theme-base.illuminateVersion','{\"value\":\"v8.83.24\",\"lastComposerUpdate\":1664462089}'),('allow_post_editing','reply'),('allow_renaming','10'),('allow_sign_up','1'),('blog_add_hero','1'),('blog_add_sidebar_nav','1'),('blog_allow_comments','1'),('blog_category_hierarchy','1'),('blog_default_image_path','blog-default-rijabbdq.png'),('blog_featured_count','3'),('blog_filter_discussion_list','0'),('blog_hide_tags','1'),('blog_redirects_enabled','both'),('blog_requires_review','1'),('blog_tags','1'),('custom_less',''),('default_locale','en'),('default_route','/tags'),('display_name_driver','nickname'),('extensions_enabled','[\"flarum-subscriptions\",\"flarum-tags\",\"flarum-flags\",\"flarum-lock\",\"fof-follow-tags\",\"flarum-approval\",\"v17development-seo\",\"v17development-blog\",\"the-turk-flamoji\",\"justoverclock-flachat\",\"fof-upload\",\"fof-gamification\",\"fof-best-answer\",\"fof-analytics\",\"flarum-suspend\",\"flarum-sticky\",\"flarum-statistics\",\"flarum-pusher\",\"flarum-nicknames\",\"flarum-mentions\",\"flarum-markdown\",\"flarum-likes\",\"flarum-lang-vietnamese\",\"flarum-emoji\",\"flarum-bbcode\",\"blomstra-usercard-stats\",\"antoinefr-online\",\"afrux-forum-widgets-core\",\"afrux-asirem\"]'),('flarum-markdown.mdarea','1'),('flarum-mentions.allow_username_format','1'),('flarum-nicknames.random_username','1'),('flarum-nicknames.regex',''),('flarum-nicknames.unique','1'),('flarum-tags.max_primary_tags','1'),('flarum-tags.max_secondary_tags','3'),('flarum-tags.min_primary_tags','1'),('flarum-tags.min_secondary_tags','0'),('fof-best-answer.show_filter_dropdown','1'),('fof-follow-tags.following_page_default','tags'),('fof-gamification.altPostVotingUi','0'),('forum_description',''),('forum_title','Wibu VietNam'),('mail_driver','mail'),('mail_from','noreply@192.168.159.134'),('show_language_selector','1'),('slug_driver_Flarum\\Discussion\\Discussion','utf8'),('slug_driver_Flarum\\User\\User','default'),('the-turk-flamoji.auto_hide','1'),('the-turk-flamoji.emoji_data','en'),('the-turk-flamoji.emoji_style','twemoji'),('the-turk-flamoji.emoji_version','12.1'),('the-turk-flamoji.initial_category','smileys'),('the-turk-flamoji.recents_count','50'),('the-turk-flamoji.show_category_buttons','1'),('the-turk-flamoji.show_preview','1'),('the-turk-flamoji.show_recents','1'),('the-turk-flamoji.show_search','1'),('the-turk-flamoji.show_variants','1'),('the-turk-flamoji.specify_categories','[\"smileys\",\"people\",\"animals\",\"food\",\"activities\",\"travel\",\"objects\",\"symbols\",\"flags\"]'),('theme_colored_header','0'),('theme_dark_mode','0'),('theme_primary_color','#4D698E'),('theme_secondary_color','#4D698E'),('version','1.5.0'),('welcome_message','Enjoy your new forum! Hop over to discuss.flarum.org if you have any questions, or to join our community!'),('welcome_title','Welcome to Wibu VietNam');
/*!40000 ALTER TABLE `fl_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_tag_user`
--

DROP TABLE IF EXISTS `fl_tag_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_tag_user` (
  `user_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `subscription` enum('follow','lurk','ignore','hide') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`tag_id`),
  KEY `fl_tag_user_tag_id_foreign` (`tag_id`),
  KEY `fl_tag_user_user_id_subscription_index` (`user_id`,`subscription`),
  KEY `fl_tag_user_subscription_index` (`subscription`),
  CONSTRAINT `fl_tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `fl_tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fl_tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `fl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_tag_user`
--

LOCK TABLES `fl_tag_user` WRITE;
/*!40000 ALTER TABLE `fl_tag_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `fl_tag_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_tags`
--

DROP TABLE IF EXISTS `fl_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_mode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `default_sort` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `discussion_count` int unsigned NOT NULL DEFAULT '0',
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int unsigned DEFAULT NULL,
  `last_posted_user_id` int unsigned DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_qna` tinyint(1) NOT NULL DEFAULT '0',
  `qna_reminders` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fl_tags_slug_unique` (`slug`),
  KEY `fl_tags_parent_id_foreign` (`parent_id`),
  KEY `fl_tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  KEY `fl_tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`),
  CONSTRAINT `fl_tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `fl_discussions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `fl_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fl_tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `fl_tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_tags`
--

LOCK TABLES `fl_tags` WRITE;
/*!40000 ALTER TABLE `fl_tags` DISABLE KEYS */;
INSERT INTO `fl_tags` VALUES (1,'General','general',NULL,'#888',NULL,NULL,0,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,'2022-09-29 14:45:27',0,0);
/*!40000 ALTER TABLE `fl_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fl_users`
--

DROP TABLE IF EXISTS `fl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fl_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` blob,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int unsigned NOT NULL DEFAULT '0',
  `comment_count` int unsigned NOT NULL DEFAULT '0',
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `suspend_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `suspend_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `votes` int NOT NULL,
  `rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_vote_time` datetime DEFAULT NULL,
  `best_answer_count` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fl_users_username_unique` (`username`),
  UNIQUE KEY `fl_users_email_unique` (`email`),
  KEY `fl_users_joined_at_index` (`joined_at`),
  KEY `fl_users_last_seen_at_index` (`last_seen_at`),
  KEY `fl_users_discussion_count_index` (`discussion_count`),
  KEY `fl_users_comment_count_index` (`comment_count`),
  KEY `fl_users_nickname_index` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fl_users`
--

LOCK TABLES `fl_users` WRITE;
/*!40000 ALTER TABLE `fl_users` DISABLE KEYS */;
INSERT INTO `fl_users` VALUES (1,'conghauo',NULL,'hauhuynhcong96@gmail.com',1,'$2y$10$R3w8kJMB.ZpUInvBw5IcsOetLA4Xmk7OftBys3uhm6yjgiZ6m24Tq',NULL,_binary '{\"followAfterReply\":false,\"flarum-subscriptions.notify_for_all_posts\":false,\"followTagsPageDefault\":null,\"notify_discussionRenamed_alert\":true,\"notify_newPost_alert\":true,\"notify_newPost_email\":true,\"notify_discussionLocked_alert\":true,\"notify_newDiscussionInTag_alert\":true,\"notify_newDiscussionInTag_email\":true,\"notify_newPostInTag_alert\":true,\"notify_newPostInTag_email\":true,\"notify_newDiscussionTag_alert\":true,\"notify_newDiscussionTag_email\":true,\"notify_vote_alert\":true,\"notify_vote_email\":false,\"notify_selectBestAnswer_alert\":true,\"notify_selectBestAnswer_email\":true,\"notify_awardedBestAnswer_alert\":true,\"notify_awardedBestAnswer_email\":false,\"notify_bestAnswerInDiscussion_alert\":false,\"notify_bestAnswerInDiscussion_email\":false,\"notify_userSuspended_alert\":true,\"notify_userSuspended_email\":true,\"notify_userUnsuspended_alert\":true,\"notify_userUnsuspended_email\":true,\"notify_postMentioned_alert\":true,\"notify_postMentioned_email\":false,\"notify_userMentioned_alert\":true,\"notify_userMentioned_email\":false,\"notify_postLiked_alert\":true,\"discloseOnline\":true,\"indexProfile\":true,\"locale\":\"vi\"}','2022-09-29 14:20:02','2022-09-29 14:52:46',NULL,NULL,0,0,'2022-09-29 14:22:40',NULL,NULL,NULL,0,NULL,NULL,0),(2,'31034105853517400657','haudeptrai','hauhuynhcong96@gamil.com',1,'$2y$10$RFITXcrzLabF6LrVYEXPz.6JCyWq4SiNNhyyLU74K16NZ5rT9j.zW',NULL,NULL,'2022-09-29 14:39:32',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0),(3,'9630943222391071810','haubeo','hoangtutobe@gamil.com',1,'$2y$10$oChlwx7m7dAqpczRq0B1GO.2o6i8lK2jglnLG6x7y/cDgEAM.3WFK',NULL,NULL,'2022-09-29 14:40:03',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0),(4,'33206775571187422176','123121','hoangtutobe@gmail.com',1,'$2y$10$/.F5NPFzHBcr8h1vVm0AseiMGA8dqqi7AyMkVs03CnNnjC61cdFJa',NULL,NULL,'2022-09-29 14:40:19',NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0);
/*!40000 ALTER TABLE `fl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_payments`
--

DROP TABLE IF EXISTS `history_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history_payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_at` datetime NOT NULL,
  `quantity` int NOT NULL,
  `amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_payments`
--

LOCK TABLES `history_payments` WRITE;
/*!40000 ALTER TABLE `history_payments` DISABLE KEYS */;
INSERT INTO `history_payments` VALUES (2,'haubeo','2022-11-20 15:42:11',15,30000,NULL,NULL);
/*!40000 ALTER TABLE `history_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (19,'2014_10_12_000000_create_users_table',1),(20,'2014_10_12_100000_create_password_resets_table',1),(21,'2019_08_19_000000_create_failed_jobs_table',1),(22,'2019_12_14_000001_create_personal_access_tokens_table',1),(23,'2022_10_30_074742_create_images_table',1),(24,'2022_11_14_133837_create_history_payments_table',1),(25,'2022_11_14_135043_create_user_times_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_access_tokens`
--

DROP TABLE IF EXISTS `ts_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_access_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `last_activity_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ts_access_tokens_token_unique` (`token`),
  KEY `ts_access_tokens_user_id_foreign` (`user_id`),
  KEY `ts_access_tokens_type_index` (`type`),
  CONSTRAINT `ts_access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_access_tokens`
--

LOCK TABLES `ts_access_tokens` WRITE;
/*!40000 ALTER TABLE `ts_access_tokens` DISABLE KEYS */;
INSERT INTO `ts_access_tokens` VALUES (23,'PZO7lUCyfbAQpxH4TfqsnWCfNL9SR3TO9QPPNHjP',2,'2022-11-13 02:58:20','2022-11-13 02:41:50','session',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 10; Redmi 8A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'),(24,'AqlrrBTRKYbO02P7CDbr0HNY0iSXtwhNCbqnGgsk',2,'2022-11-13 03:00:08','2022-11-13 03:00:08','session',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 10; Redmi 8A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.126 Mobile Safari/537.36 OPR/72.2.3767.68393'),(25,'COmOTDsUxkjDyjETHobZ1LL5kyK5UDHhRvX9Sb9J',2,'2022-11-13 05:23:57','2022-11-13 03:07:13','session',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(29,'X0HH4dupxi3NkUZ3yCx8FcsnlwwQyxcjsU75AsEH',2,'2022-11-13 16:15:49','2022-11-13 16:15:49','session',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(32,'QHF2mbz2SzWMMMaHaCkz90oaScpoN7bKbnVu6657',2,'2022-11-19 05:02:51','2022-11-19 05:02:51','session',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36'),(33,'9FqWC6LbRItPYj8j7G6KN7ta1d7U6SznkDC8m30S',2,'2022-11-19 05:06:57','2022-11-19 05:06:57','session',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 10; Redmi 8A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'),(34,'d60ekAMFGQDvXj1gbjuK5ZQRdOTxmON975Qo16q1',2,'2022-11-19 05:11:45','2022-11-19 05:11:45','session',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 10; Redmi 8A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.126 Mobile Safari/537.36 OPR/72.3.3767.68685'),(35,'y2hfRkQi5E3mCiSmnGYBh5ibreIRHiO1oziJB1PS',2,'2022-11-19 05:13:56','2022-11-19 05:13:56','session',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 10; Redmi 8A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'),(36,'PVmE8IEKDLnc328StzQvC15ge8nI9kcfI9mcvue9',2,'2022-11-19 05:15:39','2022-11-19 05:15:39','session',NULL,'127.0.0.1','Mozilla/5.0 (Android 10; Mobile; rv:107.0) Gecko/107.0 Firefox/107.0'),(38,'eEpPhKdAEa57XxN4nSN7baHrD2q3IJU4g9P1Ncdd',2,'2022-11-19 09:05:43','2022-11-19 09:05:43','session',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 10; Redmi 8A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36'),(39,'XuQdfONgdBvqFjXuY6JuycWhjokX4YX553nCO9j3',2,'2022-11-19 15:21:56','2022-11-19 15:15:34','session',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0'),(40,'jCPIbliPr2oMjp8fTtXy8WTHDpuOctTVmAhlcNOa',2,'2022-11-20 08:33:29','2022-11-20 08:33:29','session',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0'),(42,'n7R5qhOMsswpavNQMXpXoqTD8QvPUYercbAUFk2L',2,'2022-11-20 13:54:19','2022-11-20 13:54:19','session',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0'),(43,'rKjp8KrPihqlCW6yrShEWBzxlB1Xt3IYiljJ2PEm',2,'2022-11-20 16:57:39','2022-11-20 16:05:43','session',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0');
/*!40000 ALTER TABLE `ts_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_api_keys`
--

DROP TABLE IF EXISTS `ts_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_api_keys` (
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `allowed_ips` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ts_api_keys_key_unique` (`key`),
  KEY `ts_api_keys_user_id_foreign` (`user_id`),
  CONSTRAINT `ts_api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_api_keys`
--

LOCK TABLES `ts_api_keys` WRITE;
/*!40000 ALTER TABLE `ts_api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_blog_meta`
--

DROP TABLE IF EXISTS `ts_blog_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_blog_meta` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int unsigned NOT NULL,
  `featured_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_featured` tinyint(1) DEFAULT '0',
  `is_sized` tinyint(1) DEFAULT '0',
  `is_pending_review` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ts_blog_meta_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `ts_blog_meta_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `ts_discussions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_blog_meta`
--

LOCK TABLES `ts_blog_meta` WRITE;
/*!40000 ALTER TABLE `ts_blog_meta` DISABLE KEYS */;
INSERT INTO `ts_blog_meta` VALUES (1,1,'','dsafdfdsfds',NULL,1,0),(2,2,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `ts_blog_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_discussion_tag`
--

DROP TABLE IF EXISTS `ts_discussion_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_discussion_tag` (
  `discussion_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`discussion_id`,`tag_id`),
  KEY `ts_discussion_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `ts_discussion_tag_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `ts_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_discussion_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `ts_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_discussion_tag`
--

LOCK TABLES `ts_discussion_tag` WRITE;
/*!40000 ALTER TABLE `ts_discussion_tag` DISABLE KEYS */;
INSERT INTO `ts_discussion_tag` VALUES (1,1,'2022-09-29 15:50:03'),(2,2,'2022-09-29 15:53:50');
/*!40000 ALTER TABLE `ts_discussion_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_discussion_user`
--

DROP TABLE IF EXISTS `ts_discussion_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_discussion_user` (
  `user_id` int unsigned NOT NULL,
  `discussion_id` int unsigned NOT NULL,
  `last_read_at` datetime DEFAULT NULL,
  `last_read_post_number` int unsigned DEFAULT NULL,
  `subscription` enum('follow','ignore') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`,`discussion_id`),
  KEY `ts_discussion_user_discussion_id_foreign` (`discussion_id`),
  CONSTRAINT `ts_discussion_user_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `ts_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_discussion_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_discussion_user`
--

LOCK TABLES `ts_discussion_user` WRITE;
/*!40000 ALTER TABLE `ts_discussion_user` DISABLE KEYS */;
INSERT INTO `ts_discussion_user` VALUES (1,1,'2022-09-29 15:50:03',1,NULL),(1,2,'2022-10-01 14:13:35',2,NULL),(2,1,'2022-09-29 16:32:58',1,NULL),(2,2,'2022-09-29 16:32:56',1,NULL);
/*!40000 ALTER TABLE `ts_discussion_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_discussions`
--

DROP TABLE IF EXISTS `ts_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_discussions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_count` int NOT NULL DEFAULT '1',
  `participant_count` int unsigned NOT NULL DEFAULT '0',
  `post_number_index` int unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `first_post_id` int unsigned DEFAULT NULL,
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_user_id` int unsigned DEFAULT NULL,
  `last_post_id` int unsigned DEFAULT NULL,
  `last_post_number` int unsigned DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int unsigned DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ts_discussions_hidden_user_id_foreign` (`hidden_user_id`),
  KEY `ts_discussions_first_post_id_foreign` (`first_post_id`),
  KEY `ts_discussions_last_post_id_foreign` (`last_post_id`),
  KEY `ts_discussions_last_posted_at_index` (`last_posted_at`),
  KEY `ts_discussions_last_posted_user_id_index` (`last_posted_user_id`),
  KEY `ts_discussions_created_at_index` (`created_at`),
  KEY `ts_discussions_user_id_index` (`user_id`),
  KEY `ts_discussions_comment_count_index` (`comment_count`),
  KEY `ts_discussions_participant_count_index` (`participant_count`),
  KEY `ts_discussions_hidden_at_index` (`hidden_at`),
  KEY `ts_discussions_is_locked_index` (`is_locked`),
  KEY `ts_discussions_is_sticky_created_at_index` (`is_sticky`,`created_at`),
  KEY `ts_discussions_is_sticky_last_posted_at_index` (`is_sticky`,`last_posted_at`),
  FULLTEXT KEY `title` (`title`),
  CONSTRAINT `ts_discussions_first_post_id_foreign` FOREIGN KEY (`first_post_id`) REFERENCES `ts_posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ts_discussions_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `ts_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ts_discussions_last_post_id_foreign` FOREIGN KEY (`last_post_id`) REFERENCES `ts_posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ts_discussions_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `ts_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ts_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_discussions`
--

LOCK TABLES `ts_discussions` WRITE;
/*!40000 ALTER TABLE `ts_discussions` DISABLE KEYS */;
INSERT INTO `ts_discussions` VALUES (1,'TEST DJKNJKANK',1,1,0,'2022-09-29 15:50:03',1,1,'2022-09-29 15:50:03',1,1,1,NULL,NULL,'test-djknjkank',0,1,0,0),(2,'TestBolg1',1,1,0,'2022-09-29 15:53:50',1,2,'2022-09-29 15:53:50',1,2,1,NULL,NULL,'testbolg1',0,1,0,0);
/*!40000 ALTER TABLE `ts_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_email_tokens`
--

DROP TABLE IF EXISTS `ts_email_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_email_tokens` (
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `ts_email_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `ts_email_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_email_tokens`
--

LOCK TABLES `ts_email_tokens` WRITE;
/*!40000 ALTER TABLE `ts_email_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_email_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_flags`
--

DROP TABLE IF EXISTS `ts_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_flags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ts_flags_post_id_foreign` (`post_id`),
  KEY `ts_flags_user_id_foreign` (`user_id`),
  KEY `ts_flags_created_at_index` (`created_at`),
  CONSTRAINT `ts_flags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `ts_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_flags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_flags`
--

LOCK TABLES `ts_flags` WRITE;
/*!40000 ALTER TABLE `ts_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_fof_terms_policies`
--

DROP TABLE IF EXISTS `ts_fof_terms_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_fof_terms_policies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sort` int unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `terms_updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ts_fof_terms_policies_sort_index` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_fof_terms_policies`
--

LOCK TABLES `ts_fof_terms_policies` WRITE;
/*!40000 ALTER TABLE `ts_fof_terms_policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_fof_terms_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_fof_terms_policy_user`
--

DROP TABLE IF EXISTS `ts_fof_terms_policy_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_fof_terms_policy_user` (
  `policy_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `accepted_at` timestamp NOT NULL,
  PRIMARY KEY (`policy_id`,`user_id`),
  KEY `ts_fof_terms_policy_user_user_id_foreign` (`user_id`),
  KEY `ts_fof_terms_policy_user_accepted_at_index` (`accepted_at`),
  CONSTRAINT `ts_fof_terms_policy_user_policy_id_foreign` FOREIGN KEY (`policy_id`) REFERENCES `ts_fof_terms_policies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_fof_terms_policy_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_fof_terms_policy_user`
--

LOCK TABLES `ts_fof_terms_policy_user` WRITE;
/*!40000 ALTER TABLE `ts_fof_terms_policy_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_fof_terms_policy_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_group_permission`
--

DROP TABLE IF EXISTS `ts_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_group_permission` (
  `group_id` int unsigned NOT NULL,
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`,`permission`),
  CONSTRAINT `ts_group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `ts_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_group_permission`
--

LOCK TABLES `ts_group_permission` WRITE;
/*!40000 ALTER TABLE `ts_group_permission` DISABLE KEYS */;
INSERT INTO `ts_group_permission` VALUES (2,'viewForum','2022-10-01 14:12:53'),(3,'discussion.flagPosts','2022-09-29 15:19:02'),(3,'discussion.likePosts','2022-09-29 15:19:02'),(3,'discussion.reply',NULL),(3,'discussion.replyWithoutApproval','2022-09-29 15:19:02'),(3,'discussion.startWithoutApproval','2022-09-29 15:19:02'),(3,'user.editOwnNickname','2022-09-29 15:20:24'),(4,'blog.autoApprovePosts','2022-09-29 15:23:44'),(4,'blog.canApprovePosts','2022-09-29 15:23:44'),(4,'blog.writeArticles','2022-09-29 15:23:44'),(4,'discussion.approvePosts','2022-09-29 15:19:02'),(4,'discussion.editPosts',NULL),(4,'discussion.hide',NULL),(4,'discussion.hidePosts',NULL),(4,'discussion.lock','2022-09-29 15:19:02'),(4,'discussion.rename',NULL),(4,'discussion.sticky','2022-09-29 15:19:03'),(4,'discussion.tag','2022-09-29 15:19:03'),(4,'discussion.viewFlags','2022-09-29 15:19:02'),(4,'discussion.viewIpsPosts',NULL),(4,'user.suspend','2022-09-29 15:19:03'),(4,'user.viewLastSeenAt',NULL);
/*!40000 ALTER TABLE `ts_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_group_user`
--

DROP TABLE IF EXISTS `ts_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_group_user` (
  `user_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `ts_group_user_group_id_foreign` (`group_id`),
  CONSTRAINT `ts_group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `ts_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_group_user`
--

LOCK TABLES `ts_group_user` WRITE;
/*!40000 ALTER TABLE `ts_group_user` DISABLE KEYS */;
INSERT INTO `ts_group_user` VALUES (1,1,'2022-09-29 15:19:02');
/*!40000 ALTER TABLE `ts_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_groups`
--

DROP TABLE IF EXISTS `ts_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name_singular` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_plural` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_groups`
--

LOCK TABLES `ts_groups` WRITE;
/*!40000 ALTER TABLE `ts_groups` DISABLE KEYS */;
INSERT INTO `ts_groups` VALUES (1,'Admin','Admins','#B72A2A','fas fa-wrench',0,NULL,NULL),(2,'Guest','Guests',NULL,NULL,0,NULL,NULL),(3,'Member','Members',NULL,NULL,0,NULL,NULL),(4,'Mod','Mods','#80349E','fas fa-bolt',0,NULL,NULL);
/*!40000 ALTER TABLE `ts_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_login_providers`
--

DROP TABLE IF EXISTS `ts_login_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_login_providers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `provider` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ts_login_providers_provider_identifier_unique` (`provider`,`identifier`),
  KEY `ts_login_providers_user_id_foreign` (`user_id`),
  CONSTRAINT `ts_login_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_login_providers`
--

LOCK TABLES `ts_login_providers` WRITE;
/*!40000 ALTER TABLE `ts_login_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_login_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_migrations`
--

DROP TABLE IF EXISTS `ts_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_migrations`
--

LOCK TABLES `ts_migrations` WRITE;
/*!40000 ALTER TABLE `ts_migrations` DISABLE KEYS */;
INSERT INTO `ts_migrations` VALUES (1,'2015_02_24_000000_create_access_tokens_table',NULL),(2,'2015_02_24_000000_create_api_keys_table',NULL),(3,'2015_02_24_000000_create_config_table',NULL),(4,'2015_02_24_000000_create_discussions_table',NULL),(5,'2015_02_24_000000_create_email_tokens_table',NULL),(6,'2015_02_24_000000_create_groups_table',NULL),(7,'2015_02_24_000000_create_notifications_table',NULL),(8,'2015_02_24_000000_create_password_tokens_table',NULL),(9,'2015_02_24_000000_create_permissions_table',NULL),(10,'2015_02_24_000000_create_posts_table',NULL),(11,'2015_02_24_000000_create_users_discussions_table',NULL),(12,'2015_02_24_000000_create_users_groups_table',NULL),(13,'2015_02_24_000000_create_users_table',NULL),(14,'2015_09_15_000000_create_auth_tokens_table',NULL),(15,'2015_09_20_224327_add_hide_to_discussions',NULL),(16,'2015_09_22_030432_rename_notification_read_time',NULL),(17,'2015_10_07_130531_rename_config_to_settings',NULL),(18,'2015_10_24_194000_add_ip_address_to_posts',NULL),(19,'2015_12_05_042721_change_access_tokens_columns',NULL),(20,'2015_12_17_194247_change_settings_value_column_to_text',NULL),(21,'2016_02_04_095452_add_slug_to_discussions',NULL),(22,'2017_04_07_114138_add_is_private_to_discussions',NULL),(23,'2017_04_07_114138_add_is_private_to_posts',NULL),(24,'2018_01_11_093900_change_access_tokens_columns',NULL),(25,'2018_01_11_094000_change_access_tokens_add_foreign_keys',NULL),(26,'2018_01_11_095000_change_api_keys_columns',NULL),(27,'2018_01_11_101800_rename_auth_tokens_to_registration_tokens',NULL),(28,'2018_01_11_102000_change_registration_tokens_rename_id_to_token',NULL),(29,'2018_01_11_102100_change_registration_tokens_created_at_to_datetime',NULL),(30,'2018_01_11_120604_change_posts_table_to_innodb',NULL),(31,'2018_01_11_155200_change_discussions_rename_columns',NULL),(32,'2018_01_11_155300_change_discussions_add_foreign_keys',NULL),(33,'2018_01_15_071700_rename_users_discussions_to_discussion_user',NULL),(34,'2018_01_15_071800_change_discussion_user_rename_columns',NULL),(35,'2018_01_15_071900_change_discussion_user_add_foreign_keys',NULL),(36,'2018_01_15_072600_change_email_tokens_rename_id_to_token',NULL),(37,'2018_01_15_072700_change_email_tokens_add_foreign_keys',NULL),(38,'2018_01_15_072800_change_email_tokens_created_at_to_datetime',NULL),(39,'2018_01_18_130400_rename_permissions_to_group_permission',NULL),(40,'2018_01_18_130500_change_group_permission_add_foreign_keys',NULL),(41,'2018_01_18_130600_rename_users_groups_to_group_user',NULL),(42,'2018_01_18_130700_change_group_user_add_foreign_keys',NULL),(43,'2018_01_18_133000_change_notifications_columns',NULL),(44,'2018_01_18_133100_change_notifications_add_foreign_keys',NULL),(45,'2018_01_18_134400_change_password_tokens_rename_id_to_token',NULL),(46,'2018_01_18_134500_change_password_tokens_add_foreign_keys',NULL),(47,'2018_01_18_134600_change_password_tokens_created_at_to_datetime',NULL),(48,'2018_01_18_135000_change_posts_rename_columns',NULL),(49,'2018_01_18_135100_change_posts_add_foreign_keys',NULL),(50,'2018_01_30_112238_add_fulltext_index_to_discussions_title',NULL),(51,'2018_01_30_220100_create_post_user_table',NULL),(52,'2018_01_30_222900_change_users_rename_columns',NULL),(55,'2018_09_15_041340_add_users_indicies',NULL),(56,'2018_09_15_041828_add_discussions_indicies',NULL),(57,'2018_09_15_043337_add_notifications_indices',NULL),(58,'2018_09_15_043621_add_posts_indices',NULL),(59,'2018_09_22_004100_change_registration_tokens_columns',NULL),(60,'2018_09_22_004200_create_login_providers_table',NULL),(61,'2018_10_08_144700_add_shim_prefix_to_group_icons',NULL),(62,'2019_10_12_195349_change_posts_add_discussion_foreign_key',NULL),(63,'2020_03_19_134512_change_discussions_default_comment_count',NULL),(64,'2020_04_21_130500_change_permission_groups_add_is_hidden',NULL),(65,'2021_03_02_040000_change_access_tokens_add_type',NULL),(66,'2021_03_02_040500_change_access_tokens_add_id',NULL),(67,'2021_03_02_041000_change_access_tokens_add_title_ip_agent',NULL),(68,'2021_04_18_040500_change_migrations_add_id_primary_key',NULL),(69,'2021_04_18_145100_change_posts_content_column_to_mediumtext',NULL),(70,'2018_07_21_000000_seed_default_groups',NULL),(71,'2018_07_21_000100_seed_default_group_permissions',NULL),(72,'2021_05_10_000000_rename_permissions',NULL),(73,'2022_05_20_000000_add_timestamps_to_groups_table',NULL),(74,'2022_05_20_000001_add_created_at_to_group_user_table',NULL),(75,'2022_05_20_000002_add_created_at_to_group_permission_table',NULL),(76,'2022_07_14_000000_add_type_index_to_posts',NULL),(77,'2022_07_14_000001_add_type_created_at_composite_index_to_posts',NULL),(78,'2015_09_21_011527_add_is_approved_to_discussions','flarum-approval'),(79,'2015_09_21_011706_add_is_approved_to_posts','flarum-approval'),(80,'2017_07_22_000000_add_default_permissions','flarum-approval'),(81,'2018_09_29_060444_replace_emoji_shorcuts_with_unicode','flarum-emoji'),(82,'2015_09_02_000000_add_flags_read_time_to_users_table','flarum-flags'),(83,'2015_09_02_000000_create_flags_table','flarum-flags'),(84,'2017_07_22_000000_add_default_permissions','flarum-flags'),(85,'2018_06_27_101500_change_flags_rename_time_to_created_at','flarum-flags'),(86,'2018_06_27_101600_change_flags_add_foreign_keys','flarum-flags'),(87,'2018_06_27_105100_change_users_rename_flags_read_time_to_read_flags_at','flarum-flags'),(88,'2018_09_15_043621_add_flags_indices','flarum-flags'),(89,'2019_10_22_000000_change_reason_text_col_type','flarum-flags'),(90,'2015_05_11_000000_create_posts_likes_table','flarum-likes'),(91,'2015_09_04_000000_add_default_like_permissions','flarum-likes'),(92,'2018_06_27_100600_rename_posts_likes_to_post_likes','flarum-likes'),(93,'2018_06_27_100700_change_post_likes_add_foreign_keys','flarum-likes'),(94,'2021_05_10_094200_add_created_at_to_post_likes_table','flarum-likes'),(95,'2015_02_24_000000_add_locked_to_discussions','flarum-lock'),(96,'2017_07_22_000000_add_default_permissions','flarum-lock'),(97,'2018_09_15_043621_add_discussions_indices','flarum-lock'),(98,'2021_03_25_000000_default_settings','flarum-markdown'),(99,'2015_05_11_000000_create_mentions_posts_table','flarum-mentions'),(100,'2015_05_11_000000_create_mentions_users_table','flarum-mentions'),(101,'2018_06_27_102000_rename_mentions_posts_to_post_mentions_post','flarum-mentions'),(102,'2018_06_27_102100_rename_mentions_users_to_post_mentions_user','flarum-mentions'),(103,'2018_06_27_102200_change_post_mentions_post_rename_mentions_id_to_mentions_post_id','flarum-mentions'),(104,'2018_06_27_102300_change_post_mentions_post_add_foreign_keys','flarum-mentions'),(105,'2018_06_27_102400_change_post_mentions_user_rename_mentions_id_to_mentions_user_id','flarum-mentions'),(106,'2018_06_27_102500_change_post_mentions_user_add_foreign_keys','flarum-mentions'),(107,'2021_04_19_000000_set_default_settings','flarum-mentions'),(108,'2022_05_20_000005_add_created_at_to_post_mentions_post_table','flarum-mentions'),(109,'2022_05_20_000006_add_created_at_to_post_mentions_user_table','flarum-mentions'),(110,'2015_02_24_000000_add_sticky_to_discussions','flarum-sticky'),(111,'2017_07_22_000000_add_default_permissions','flarum-sticky'),(112,'2018_09_15_043621_add_discussions_indices','flarum-sticky'),(113,'2021_01_13_000000_add_discussion_last_posted_at_indices','flarum-sticky'),(114,'2015_05_11_000000_add_subscription_to_users_discussions_table','flarum-subscriptions'),(115,'2015_05_11_000000_add_suspended_until_to_users_table','flarum-suspend'),(116,'2015_09_14_000000_rename_suspended_until_column','flarum-suspend'),(117,'2017_07_22_000000_add_default_permissions','flarum-suspend'),(118,'2018_06_27_111400_change_users_rename_suspend_until_to_suspended_until','flarum-suspend'),(119,'2021_10_27_000000_add_suspend_reason_and_message','flarum-suspend'),(120,'2015_02_24_000000_create_discussions_tags_table','flarum-tags'),(121,'2015_02_24_000000_create_tags_table','flarum-tags'),(122,'2015_02_24_000000_create_users_tags_table','flarum-tags'),(123,'2015_02_24_000000_set_default_settings','flarum-tags'),(124,'2015_10_19_061223_make_slug_unique','flarum-tags'),(125,'2017_07_22_000000_add_default_permissions','flarum-tags'),(126,'2018_06_27_085200_change_tags_columns','flarum-tags'),(127,'2018_06_27_085300_change_tags_add_foreign_keys','flarum-tags'),(128,'2018_06_27_090400_rename_users_tags_to_tag_user','flarum-tags'),(129,'2018_06_27_100100_change_tag_user_rename_read_time_to_marked_as_read_at','flarum-tags'),(130,'2018_06_27_100200_change_tag_user_add_foreign_keys','flarum-tags'),(131,'2018_06_27_103000_rename_discussions_tags_to_discussion_tag','flarum-tags'),(132,'2018_06_27_103100_add_discussion_tag_foreign_keys','flarum-tags'),(133,'2019_04_21_000000_add_icon_to_tags_table','flarum-tags'),(134,'2022_05_20_000003_add_timestamps_to_tags_table','flarum-tags'),(135,'2022_05_20_000004_add_created_at_to_discussion_tag_table','flarum-tags'),(136,'2020_11_23_000000_add_nickname_column','flarum-nicknames'),(137,'2020_12_02_000001_set_default_permissions','flarum-nicknames'),(138,'2021_11_16_000000_nickname_column_nullable','flarum-nicknames'),(139,'2020_10_17_16_34_create_blog_meta_table','v17development-blog'),(140,'2020_10_17_16_50_add_default_permissions','v17development-blog'),(141,'2019_10_22_01_rename_permissions','fof-terms'),(142,'2019_10_22_02_rename_settings','fof-terms'),(143,'2019_10_22_03_rename_flagrow_tables','fof-terms'),(144,'2019_10_22_04_remove_flagrow_migrations','fof-terms'),(145,'2019_10_22_05_create_terms_policies','fof-terms'),(146,'2019_10_22_06_create_terms_policy_user','fof-terms'),(147,'2022_01_30_000000_add_columns_to_settings','datlechin-landing-page');
/*!40000 ALTER TABLE `ts_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_notifications`
--

DROP TABLE IF EXISTS `ts_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `from_user_id` int unsigned DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int unsigned DEFAULT NULL,
  `data` blob,
  `created_at` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `read_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ts_notifications_from_user_id_foreign` (`from_user_id`),
  KEY `ts_notifications_user_id_index` (`user_id`),
  CONSTRAINT `ts_notifications_from_user_id_foreign` FOREIGN KEY (`from_user_id`) REFERENCES `ts_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ts_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_notifications`
--

LOCK TABLES `ts_notifications` WRITE;
/*!40000 ALTER TABLE `ts_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_password_tokens`
--

DROP TABLE IF EXISTS `ts_password_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_password_tokens` (
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `ts_password_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `ts_password_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_password_tokens`
--

LOCK TABLES `ts_password_tokens` WRITE;
/*!40000 ALTER TABLE `ts_password_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_password_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_post_likes`
--

DROP TABLE IF EXISTS `ts_post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_post_likes` (
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `ts_post_likes_user_id_foreign` (`user_id`),
  CONSTRAINT `ts_post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `ts_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_post_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_post_likes`
--

LOCK TABLES `ts_post_likes` WRITE;
/*!40000 ALTER TABLE `ts_post_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_post_mentions_post`
--

DROP TABLE IF EXISTS `ts_post_mentions_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_post_mentions_post` (
  `post_id` int unsigned NOT NULL,
  `mentions_post_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`,`mentions_post_id`),
  KEY `ts_post_mentions_post_mentions_post_id_foreign` (`mentions_post_id`),
  CONSTRAINT `ts_post_mentions_post_mentions_post_id_foreign` FOREIGN KEY (`mentions_post_id`) REFERENCES `ts_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_post_mentions_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `ts_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_post_mentions_post`
--

LOCK TABLES `ts_post_mentions_post` WRITE;
/*!40000 ALTER TABLE `ts_post_mentions_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_post_mentions_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_post_mentions_user`
--

DROP TABLE IF EXISTS `ts_post_mentions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_post_mentions_user` (
  `post_id` int unsigned NOT NULL,
  `mentions_user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`,`mentions_user_id`),
  KEY `ts_post_mentions_user_mentions_user_id_foreign` (`mentions_user_id`),
  CONSTRAINT `ts_post_mentions_user_mentions_user_id_foreign` FOREIGN KEY (`mentions_user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_post_mentions_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `ts_posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_post_mentions_user`
--

LOCK TABLES `ts_post_mentions_user` WRITE;
/*!40000 ALTER TABLE `ts_post_mentions_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_post_mentions_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_post_user`
--

DROP TABLE IF EXISTS `ts_post_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_post_user` (
  `post_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `ts_post_user_user_id_foreign` (`user_id`),
  CONSTRAINT `ts_post_user_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `ts_posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_post_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_post_user`
--

LOCK TABLES `ts_post_user` WRITE;
/*!40000 ALTER TABLE `ts_post_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_post_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_posts`
--

DROP TABLE IF EXISTS `ts_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int unsigned NOT NULL,
  `number` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT ' ',
  `edited_at` datetime DEFAULT NULL,
  `edited_user_id` int unsigned DEFAULT NULL,
  `hidden_at` datetime DEFAULT NULL,
  `hidden_user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ts_posts_discussion_id_number_unique` (`discussion_id`,`number`),
  KEY `ts_posts_edited_user_id_foreign` (`edited_user_id`),
  KEY `ts_posts_hidden_user_id_foreign` (`hidden_user_id`),
  KEY `ts_posts_discussion_id_number_index` (`discussion_id`,`number`),
  KEY `ts_posts_discussion_id_created_at_index` (`discussion_id`,`created_at`),
  KEY `ts_posts_user_id_created_at_index` (`user_id`,`created_at`),
  KEY `ts_posts_type_index` (`type`),
  KEY `ts_posts_type_created_at_index` (`type`,`created_at`),
  FULLTEXT KEY `content` (`content`),
  CONSTRAINT `ts_posts_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `ts_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_posts_edited_user_id_foreign` FOREIGN KEY (`edited_user_id`) REFERENCES `ts_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ts_posts_hidden_user_id_foreign` FOREIGN KEY (`hidden_user_id`) REFERENCES `ts_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ts_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_posts`
--

LOCK TABLES `ts_posts` WRITE;
/*!40000 ALTER TABLE `ts_posts` DISABLE KEYS */;
INSERT INTO `ts_posts` VALUES (1,1,1,'2022-09-29 15:50:03',1,'comment','<t><p>Tesjlkdsnklfndslkfndlkfnlaskdnflkdsfnlkdnsflknkldafnlkdsnfklandflasndflknslkadf</p></t>',NULL,NULL,NULL,NULL,'192.168.159.1',0,1),(2,2,1,'2022-09-29 15:53:50',1,'comment','<t><p>sadsadsadasd</p></t>',NULL,NULL,NULL,NULL,'192.168.159.1',0,1),(3,2,2,'2022-10-01 14:13:28',1,'discussionRenamed','[\"asdasdsad\",\"TestBolg1\"]',NULL,NULL,NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `ts_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_registration_tokens`
--

DROP TABLE IF EXISTS `ts_registration_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_registration_tokens` (
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_registration_tokens`
--

LOCK TABLES `ts_registration_tokens` WRITE;
/*!40000 ALTER TABLE `ts_registration_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_registration_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_settings`
--

DROP TABLE IF EXISTS `ts_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_settings` (
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_settings`
--

LOCK TABLES `ts_settings` WRITE;
/*!40000 ALTER TABLE `ts_settings` DISABLE KEYS */;
INSERT INTO `ts_settings` VALUES ('afrux-forum-widgets-core.config','{\"instances\":[{\"id\":\"justoverclock-custom-html-widget:CustomHtml\",\"extension\":\"justoverclock-custom-html-widget\",\"key\":\"CustomHtml\",\"placement\":\"top\",\"position\":0}]}'),('afrux-forum-widgets-core.prefer_data_with_initial_load','1'),('allow_post_editing','reply'),('allow_renaming','10'),('allow_sign_up','1'),('blog_default_image_path','blog-default-pmkszbyc.png'),('blog_tags','1|2'),('custom_less','body {\n color:#9357d5;\n background-color: #f03396;\n}\nheader#header{\nbackground: #f03396;\n}'),('datlechin-landing-page.body_html',NULL),('datlechin-landing-page.header_html',NULL),('default_locale','vi'),('default_route','/blog'),('display_name_driver','username'),('extensions_enabled','[\"flarum-tags\",\"flarum-lock\",\"afrux-forum-widgets-core\",\"v17development-blog\",\"justoverclock-header-slideshow\",\"justoverclock-first-visit-popup\",\"justoverclock-custom-html-widget\",\"flarum-suspend\",\"flarum-subscriptions\",\"flarum-sticky\",\"flarum-statistics\",\"flarum-nicknames\",\"flarum-mentions\",\"flarum-markdown\",\"flarum-likes\",\"flarum-lang-vietnamese\",\"flarum-lang-english\",\"flarum-flags\",\"flarum-emoji\",\"flarum-bbcode\"]'),('flarum-markdown.mdarea','1'),('flarum-mentions.allow_username_format','1'),('flarum-tags.max_primary_tags','1'),('flarum-tags.max_secondary_tags','3'),('flarum-tags.min_primary_tags','1'),('flarum-tags.min_secondary_tags','0'),('fof-terms.date-format',''),('fof-terms.hide-updated-at','1'),('fof-terms.signup-legal-text','<img src=\"https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.searchenginejournal.com%2Fwp-content%2Fuploads%2F2019%2F12%2Fhow-to-execute-a-link-conversion-strategy-5df792498b991-760x400.png&imgrefurl=https%3A%2F%2Fwww.searchenginejournal.com%2Flink-conversion-strategy%2F339913%2F&tbnid=Ggt_Qy8BDONHqM&vet=12ahUKEwiM-IHKqbr6AhVZTPUHHexBAQkQMygGegUIARDsAQ..i&docid=gldV5_ureldXTM&w=760&h=400&q=image%20link&ved=2ahUKEwiM-IHKqbr6AhVZTPUHHexBAQkQMygGegUIARDsAQ\" >'),('forum_description',''),('forum_title','hunbae'),('justoverclock-custom-header.button2Text','Shop'),('justoverclock-custom-header.buttonText','GAME'),('justoverclock-custom-header.facebookIcon',''),('justoverclock-custom-header.githubIcon',''),('justoverclock-custom-header.headerBackgroundImage','https://ohcbrands.com/wp-content/uploads/2018/04/69648590-header-wallpapers.jpg'),('justoverclock-custom-header.headerTagline',''),('justoverclock-custom-header.headerTitle','trjvjhvhjbkhbjkbkjbjkbkjbjkbkj'),('justoverclock-custom-header.LinkButtonOne','https://vi.piliapp.com/random/wheel/'),('justoverclock-custom-header.LinkButtonTwo','https://shopee.vn/'),('justoverclock-custom-header.twitterIcon',''),('justoverclock-custom-header.youtubeIcon',''),('justoverclock-custom-html-widget.customCode','<style>\n.item-newDiscussion\n{\n  visibility: hidden;\n}\n.item-allDiscussions\n{\n  visibility: hidden;\n}\n.button {\n margin-top 2.5em;\n  display: inline-block;\n  padding: 8px  80px;\n  font-size: 15px;\n  cursor: pointer;\n  text-align: center;\n  text-decoration: none;\n  outline: none;\n  color: #fff;\n  background-color: #30303b;\n  border: none;\n  border-radius: 15px;\n}\n.button3:hover {\n  background-color: #4CAF50;\n  color: white;\n}\n</style>\n<a style=\"margin:5px;\" class=\"button button3 \" href=\"/welcome\">Game</a>\n'),('justoverclock-first-visit-popup.exptime',''),('justoverclock-first-visit-popup.modalContent','<style>\n.offerBtn {\n  background-color: rgb(56, 154, 220);\n  box-shadow: inset 0px 5px 0px 0px rgba(255, 255, 255, 0.15);\n  width: 420px;\n  height: 100px;\n  z-index: 82;\n  display: block;\n  position: relative;\n  overflow: hidden;\n  font-family: \'Raleway\', sans;\n  cursor: pointer;\n  transition: all .2s;\n}\n\n.offerBtn:hover {\n  background: #3CBD45;\n}\n.offerBtn:active {\n  -webkit-box-shadow: 0px 0px 15px 0px rgba(27,199,0,1);\n-moz-box-shadow: 0px 0px 15px 0px rgba(27,199,0,1);\nbox-shadow: 0px 0px 15px 0px rgba(27,199,0,1);\n}\n.offerBtn img {\n  height: 80px;\n  top: 10px;\n  position: absolute;\n  left: -5px;\n  opacity: .15;\n}\n\n.offerBtn span {\n  position: absolute;\n}\n\n.btnIcon {\n  top: 24px;\n  left: 50px;\n}\n\n.st0 {\n  fill: #FFFFFF;\n}\n\n.st1 {\n  fill: #FFFFFF;\n  fill-opacity: 0.5;\n}\n\n.text1,\n.text2,\n.text3 {\n  color: #FFF;\n  font-weight: 800;\n}\n\n.offerBtn:before {\n  content: \'\';\n  display: block;\n  height: 500px;\n  width: 500px;\n  position: absolute;\n  background-color: rgba(255, 255, 255, .15);\n  transform: rotate(-45deg);\n  top: -200px;\n  left: -330px;\n  transition: all .2s;\n}\n\n.offerBtn:hover:before {\n  left: -300px;\n}\n\n.text1 {\n  font-size: 36px;\n  line-height: 1em;\n  left: 25px;\n  top: 13px;\n}\n\n.text2 {\n  font-weight: 300;\n  right: 42px;\n  bottom: 10px;\n}\n\n.text3 {\n  top: -5px;\n  right: 40px;\n  font-size: 70px;\n  font-family: \'Open Sans\', sans;\n  font-weight: 400;\n  letter-spacing: -4px;\n}\n\n.text4 {\n  transform: rotate(-90deg);\n  right: -39px;\n  top: 37px;\n  background: yellow;\n  padding: 7px 10px;\n  font-size: 11px;\n  text-transform: uppercase;\n}\n.maindiv {\ndisplay:flex;\njustify-content: center;\nalign-items: center;\nmargin-bottom: 2rem;\n}\n</style>\n<div class=\"maindiv\">\n<a class=\"offerBtn\">\n  <img src=\"https://www.lawgeex.com/wp-content/themes/Lawgeex2015-child/images/contracticon.svg\" alt=\"icon\">\n  <span class=\"text1\">Are you 18+<br/>Next</span>\n  <span class=\"text2\">Play</span>\n  <span class=\"text3\">Learn</span>\n  <span class=\"text4\"></span>\n</a>\n</div>\n'),('justoverclock-first-visit-popup.modalTitle','Wellcome'),('justoverclock-header-slideshow.BtnSlide1','Click To Play Game'),('justoverclock-header-slideshow.BtnSlide2','Click To Buy'),('justoverclock-header-slideshow.BtnSlide3',' '),('justoverclock-header-slideshow.ImageOne','data:image/jpeg;base64,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'),('justoverclock-header-slideshow.ImageThree','data:image/jpeg;base64,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'),('justoverclock-header-slideshow.ImageTwo','data:image/jpeg;base64,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'),('justoverclock-header-slideshow.LinkOne','https://gamevui.vn/'),('justoverclock-header-slideshow.LinkThree',' '),('justoverclock-header-slideshow.LinkTwo','https://shopee.vn/'),('justoverclock-header-slideshow.TextSlide1','  '),('justoverclock-header-slideshow.TextSlide2','Shopping'),('justoverclock-header-slideshow.TextSlide3',' '),('justoverclock-header-slideshow.TitleSlide1','Play Game'),('justoverclock-header-slideshow.TitleSlide2','Shopping'),('justoverclock-header-slideshow.TitleSlide3',' Learn'),('justoverclock-header-slideshow.TransitionTime','5'),('logo_path','logo-euvhdhxb.png'),('mail_driver','mail'),('mail_from','noreply@192.168.159.134'),('show_language_selector','1'),('slug_driver_Flarum\\Discussion\\Discussion',''),('slug_driver_Flarum\\User\\User','default'),('theme_colored_header','0'),('theme_dark_mode','0'),('theme_primary_color','#db0089'),('theme_secondary_color','#4D698E'),('version','1.5.0'),('welcome_message',''),('welcome_title','');
/*!40000 ALTER TABLE `ts_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_tag_user`
--

DROP TABLE IF EXISTS `ts_tag_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_tag_user` (
  `user_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  `marked_as_read_at` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`tag_id`),
  KEY `ts_tag_user_tag_id_foreign` (`tag_id`),
  CONSTRAINT `ts_tag_user_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `ts_tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ts_tag_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `ts_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_tag_user`
--

LOCK TABLES `ts_tag_user` WRITE;
/*!40000 ALTER TABLE `ts_tag_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `ts_tag_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_tags`
--

DROP TABLE IF EXISTS `ts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_mode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `default_sort` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `discussion_count` int unsigned NOT NULL DEFAULT '0',
  `last_posted_at` datetime DEFAULT NULL,
  `last_posted_discussion_id` int unsigned DEFAULT NULL,
  `last_posted_user_id` int unsigned DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ts_tags_slug_unique` (`slug`),
  KEY `ts_tags_parent_id_foreign` (`parent_id`),
  KEY `ts_tags_last_posted_user_id_foreign` (`last_posted_user_id`),
  KEY `ts_tags_last_posted_discussion_id_foreign` (`last_posted_discussion_id`),
  CONSTRAINT `ts_tags_last_posted_discussion_id_foreign` FOREIGN KEY (`last_posted_discussion_id`) REFERENCES `ts_discussions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ts_tags_last_posted_user_id_foreign` FOREIGN KEY (`last_posted_user_id`) REFERENCES `ts_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ts_tags_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `ts_tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_tags`
--

LOCK TABLES `ts_tags` WRITE;
/*!40000 ALTER TABLE `ts_tags` DISABLE KEYS */;
INSERT INTO `ts_tags` VALUES (1,'General','general',NULL,'#888',NULL,NULL,0,NULL,NULL,0,0,1,'2022-09-29 15:50:03',1,1,NULL,NULL,'2022-09-29 15:50:03'),(2,'TETSS catast','tetss-catast','','',NULL,NULL,1,NULL,NULL,0,0,1,'2022-09-29 15:53:50',2,1,'','2022-09-29 15:52:02','2022-09-29 15:53:50');
/*!40000 ALTER TABLE `ts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ts_users`
--

DROP TABLE IF EXISTS `ts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ts_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` blob,
  `joined_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `marked_all_as_read_at` datetime DEFAULT NULL,
  `read_notifications_at` datetime DEFAULT NULL,
  `discussion_count` int unsigned NOT NULL DEFAULT '0',
  `comment_count` int unsigned NOT NULL DEFAULT '0',
  `read_flags_at` datetime DEFAULT NULL,
  `suspended_until` datetime DEFAULT NULL,
  `suspend_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `suspend_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ts_users_username_unique` (`username`),
  UNIQUE KEY `ts_users_email_unique` (`email`),
  KEY `ts_users_joined_at_index` (`joined_at`),
  KEY `ts_users_last_seen_at_index` (`last_seen_at`),
  KEY `ts_users_discussion_count_index` (`discussion_count`),
  KEY `ts_users_comment_count_index` (`comment_count`),
  KEY `ts_users_nickname_index` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ts_users`
--

LOCK TABLES `ts_users` WRITE;
/*!40000 ALTER TABLE `ts_users` DISABLE KEYS */;
INSERT INTO `ts_users` VALUES (1,'conghauAdmin',NULL,'hauhuynhcong96@gmail.com',1,'$2y$10$TL.IHQOKF8kY7EXOuF3ajeI5eWW5hp3O9.r1D/BV1zfRIyoP4H6gi',NULL,NULL,'2022-09-29 15:19:02','2022-11-20 13:54:04',NULL,NULL,2,2,NULL,NULL,NULL,NULL),(2,'haubeo',NULL,'hoangtutobe@gmail.com',1,'$2y$10$rvMlJCWI6nA4zpicD7hS0uUxaHT04N75/.raQrQ3s.M0GTRHHslXe',NULL,NULL,'2022-09-29 16:30:54','2022-11-20 16:57:39',NULL,'2022-11-13 02:42:07',0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ts_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_times`
--

DROP TABLE IF EXISTS `user_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_times` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mins` int NOT NULL,
  `seconds` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_times`
--

LOCK TABLES `user_times` WRITE;
/*!40000 ALTER TABLE `user_times` DISABLE KEYS */;
INSERT INTO `user_times` VALUES (1,1,'haubeo',20,0,'2022-11-20 16:38:27','2022-11-20 16:38:27');
/*!40000 ALTER TABLE `user_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `flarum_id` bigint unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,2,'haubeo','hoangtutobe@gmail.com',NULL,'$2y$10$4GO64cd/roNm2xcC4/qDUOxRFnv.2ieB9hru9jIklUXW31UJCCfz6','5rmlyG8Hz2ABdoUbPaJMPpYReHqwKIzn2fR9jW3m6xYm1fsjKfbOHQSPZVXA','2022-11-20 16:38:27','2022-11-20 16:38:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-21 14:30:24
