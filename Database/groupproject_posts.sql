-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: groupproject
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(100) NOT NULL,
  `pContent` varchar(1000) NOT NULL,
  `pCode` varchar(45) DEFAULT NULL,
  `pPic` varchar(45) DEFAULT NULL,
  `pDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `catId` int DEFAULT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'aaaa','aaaaaaaaaaaaaa',NULL,NULL,'2021-06-26 23:00:10',0,1),(2,'aaaa','aaaaaaaaaaaaaaaaa',NULL,NULL,'2021-06-27 00:28:36',0,1),(3,'AAAAA','AAAAAAAAAAAAAAAAAAAAAA',NULL,NULL,'2021-06-27 03:01:08',0,1),(4,'aaaa','a',NULL,NULL,'2021-06-27 19:56:56',0,1),(5,'Test','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',NULL,NULL,'2021-06-28 13:04:20',0,1),(7,'Another account test','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',NULL,NULL,'2021-06-28 13:16:19',0,2),(8,'Another account test 2','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa',NULL,NULL,'2021-06-28 13:22:15',0,2),(9,'a','a',NULL,NULL,'2021-06-28 13:24:37',0,1),(10,'Try again...','a',NULL,NULL,'2021-06-28 13:28:51',0,1),(11,'a','a',NULL,NULL,'2021-06-28 13:32:29',0,1),(12,'t','t',NULL,NULL,'2021-06-28 13:34:48',0,1),(13,'Account email and password','aaa@aaa.aaa: Aaaaa1, AAAA@aaa.aaa: AAAAa1, (Admin) aaa@aaa.aaa : Aaaaa1',NULL,NULL,'2021-06-28 14:45:25',0,1),(14,'qww','dcfvv',NULL,NULL,'2021-07-08 22:28:31',0,3);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-08 23:33:57
