-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: biblio
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `author` varchar(100) NOT NULL,
  `book_id` int(5) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Kennedy, John F. (John Fitzgerald)',44,'2018-11-25 16:39:38','2018-11-25 16:39:38'),(2,'Kennedy, John F. (John Fitzgerald)',46,'2018-11-25 17:34:44','2018-11-25 17:34:44'),(3,'Kennedy, John F. (John Fitzgerald)',47,'2018-11-25 17:36:15','2018-11-25 17:36:15');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `publication` date NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `publisher` varchar(10) NOT NULL DEFAULT 'Gutenberg',
  `language` varchar(20) NOT NULL DEFAULT 'en',
  `license_rights` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (29,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:01:50','2018-11-25 15:01:50','Gutenberg','en',NULL),(30,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:03:56','2018-11-25 15:03:56','Gutenberg','\"en\"','[\"Public domain in the USA.\"]'),(31,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:12:53','2018-11-25 15:12:53','Gutenberg','\"en\"','Public domain in the USA.'),(32,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:15:04','2018-11-25 15:15:04','Gutenberg','\"en\"','Public domain in the USA.'),(33,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:23:11','2018-11-25 15:23:11','Gutenberg','\"en\"','Public domain in the USA.'),(34,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:27:34','2018-11-25 15:27:34','Gutenberg','\"en\"','Public domain in the USA.'),(35,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:28:24','2018-11-25 15:28:24','Gutenberg','\"en\"','Public domain in the USA.'),(36,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:29:22','2018-11-25 15:29:22','Gutenberg','\"en\"','Public domain in the USA.'),(37,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:39:26','2018-11-25 15:39:26','Gutenberg','\"en\"','Public domain in the USA.'),(38,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:45:47','2018-11-25 15:45:47','Gutenberg','\"en\"','Public domain in the USA.'),(39,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 15:47:13','2018-11-25 15:47:13','Gutenberg','\"en\"','Public domain in the USA.'),(40,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 16:08:08','2018-11-25 16:08:08','Gutenberg','\"en\"','Public domain in the USA.'),(41,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 16:30:25','2018-11-25 16:30:25','Gutenberg','\"en\"','Public domain in the USA.'),(42,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 16:36:12','2018-11-25 16:36:12','Gutenberg','\"en\"','Public domain in the USA.'),(43,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 16:37:59','2018-11-25 16:37:59','Gutenberg','\"en\"','Public domain in the USA.'),(44,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 16:39:38','2018-11-25 16:39:38','Gutenberg','\"en\"','Public domain in the USA.'),(45,'Some name','1973-11-01','2018-11-25 16:41:00','2018-11-25 16:41:00','Gutenberg','en',NULL),(46,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 17:34:44','2018-11-25 17:34:44','Gutenberg','\"en\"','Public domain in the USA.'),(47,'John F. Kennedys Inaugural Address','1973-11-01','2018-11-25 17:36:15','2018-11-25 17:36:15','Gutenberg','\"en\"','Public domain in the USA.');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `book_id` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'test','2018-11-25 15:47:13','2018-11-25 15:47:13',39),(2,'Presidents -- United States -- Inaugural addresses','2018-11-25 16:08:08','2018-11-25 16:08:08',40),(3,'E838','2018-11-25 16:08:08','2018-11-25 16:08:08',40),(4,'United States -- Foreign relations -- 1961-1963','2018-11-25 16:08:08','2018-11-25 16:08:08',40),(5,'Presidents -- United States -- Inaugural addresses','2018-11-25 16:30:25','2018-11-25 16:30:25',41),(6,'E838','2018-11-25 16:30:25','2018-11-25 16:30:25',41),(7,'United States -- Foreign relations -- 1961-1963','2018-11-25 16:30:25','2018-11-25 16:30:25',41),(8,'Presidents -- United States -- Inaugural addresses','2018-11-25 16:36:12','2018-11-25 16:36:12',42),(9,'United States -- Foreign relations -- 1961-1963','2018-11-25 16:36:12','2018-11-25 16:36:12',42),(10,'E838','2018-11-25 16:36:12','2018-11-25 16:36:12',42),(11,'Presidents -- United States -- Inaugural addresses','2018-11-25 16:37:59','2018-11-25 16:37:59',43),(12,'E838','2018-11-25 16:37:59','2018-11-25 16:37:59',43),(13,'United States -- Foreign relations -- 1961-1963','2018-11-25 16:37:59','2018-11-25 16:37:59',43),(14,'Presidents -- United States -- Inaugural addresses','2018-11-25 16:39:38','2018-11-25 16:39:38',44),(15,'E838','2018-11-25 16:39:38','2018-11-25 16:39:38',44),(16,'United States -- Foreign relations -- 1961-1963','2018-11-25 16:39:38','2018-11-25 16:39:38',44),(17,'Presidents -- United States -- Inaugural addresses','2018-11-25 17:34:44','2018-11-25 17:34:44',46),(18,'E838','2018-11-25 17:34:44','2018-11-25 17:34:44',46),(19,'United States -- Foreign relations -- 1961-1963','2018-11-25 17:34:44','2018-11-25 17:34:44',46),(20,'Presidents -- United States -- Inaugural addresses','2018-11-25 17:36:15','2018-11-25 17:36:15',47),(21,'E838','2018-11-25 17:36:15','2018-11-25 17:36:15',47),(22,'United States -- Foreign relations -- 1961-1963','2018-11-25 17:36:15','2018-11-25 17:36:15',47);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-25 11:12:09
