-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: vleague
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `goal_type` enum('A','B','C') COLLATE utf8mb4_unicode_ci NOT NULL,
  `thoi_diem` datetime NOT NULL,
  `match_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `goal_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
  CONSTRAINT `goal_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
INSERT INTO `goal` VALUES (12,3,'B','2020-12-02 18:09:00',1),(13,6,'B','2020-12-02 19:18:00',1),(14,4,'A','2020-12-02 19:28:00',1),(15,6,'A','2020-12-04 18:21:00',2),(16,8,'C','2020-12-04 19:17:00',2),(17,7,'B','2020-12-05 18:12:00',3),(18,1,'B','2020-12-05 19:10:00',3),(19,8,'A','2020-12-05 19:19:00',3),(20,8,'C','2020-12-05 19:29:00',3),(21,1,'C','2020-12-12 18:11:00',4),(22,5,'A','2020-12-12 19:25:00',4);
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_id` int NOT NULL,
  `away_id` int NOT NULL,
  `MatchTime` datetime NOT NULL,
  `stadium` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `round_id` int NOT NULL,
  `home_goals` int DEFAULT NULL,
  `away_goals` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_id` (`home_id`),
  KEY `away_id` (`away_id`),
  KEY `round_id` (`round_id`),
  CONSTRAINT `match_ibfk_1` FOREIGN KEY (`home_id`) REFERENCES `team` (`id`),
  CONSTRAINT `match_ibfk_2` FOREIGN KEY (`away_id`) REFERENCES `team` (`id`),
  CONSTRAINT `match_ibfk_3` FOREIGN KEY (`round_id`) REFERENCES `round` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES (1,1,2,'2020-12-02 18:00:00','Mỹ Đình',1,2,1),(2,2,4,'2020-12-04 18:00:00','Nghệ An',1,1,1),(3,4,3,'2020-12-05 18:00:00','Hòa Bình AG',1,3,1),(4,2,3,'2020-12-12 18:00:00','Nghệ An',1,1,1);
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_player`
--

DROP TABLE IF EXISTS `match_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_player` (
  `match_id` int NOT NULL,
  `player_id` int NOT NULL,
  PRIMARY KEY (`match_id`,`player_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `match_player_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`),
  CONSTRAINT `match_player_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_player`
--

LOCK TABLES `match_player` WRITE;
/*!40000 ALTER TABLE `match_player` DISABLE KEYS */;
INSERT INTO `match_player` VALUES (3,1),(4,1),(3,2),(4,2),(1,3),(1,4),(1,5),(2,5),(4,5),(1,6),(2,6),(4,6),(2,7),(3,7),(2,8),(3,8);
/*!40000 ALTER TABLE `match_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `position` enum('HLV','GK','LF','RF','CF','SW','ST','CB','LB','RB','RS','LS','LM','RM') COLLATE utf8mb4_unicode_ci NOT NULL,
  `player_type` enum('local','foreign') COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_goals` int DEFAULT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Quế Ngọc Hải','1993-03-15','LB','local',0,3),(2,'Nguyễn Trọng Hoàng','1989-04-14','RM','local',0,3),(3,'Nguyễn Văn Quyết','1991-07-01','ST','local',0,1),(4,'Phạm Thành Lương','1988-09-10','LM','local',0,1),(5,'Bùi Đình Châu','1996-02-06','LM','local',0,2),(6,'Hồ Phúc Tịnh','1994-08-28','ST','local',0,2),(7,'Nguyễn Văn Trọng','1996-01-15','RB','local',0,4),(8,'Võ Đình Lâm','2000-01-20','SW','local',0,4);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `round`
--

DROP TABLE IF EXISTS `round`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `round` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `season_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `season_id` (`season_id`),
  CONSTRAINT `round_ibfk_1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `round`
--

LOCK TABLES `round` WRITE;
/*!40000 ALTER TABLE `round` DISABLE KEYS */;
INSERT INTO `round` VALUES (1,'Round 1',1);
/*!40000 ALTER TABLE `round` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `min_age` int NOT NULL,
  `max_age` int NOT NULL,
  `min_total_player` int NOT NULL,
  `max_total_player` int NOT NULL,
  `max_total_foreigner` int NOT NULL,
  `max_time_score` int NOT NULL,
  `win_score` int NOT NULL,
  `tie_score` int NOT NULL,
  `lose_score` int NOT NULL,
  `priority` enum('Diem','HieuSo','SoBanThang','DoiKhang') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES (1,16,40,15,22,3,96,3,1,0,'Diem');
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `number_of_team` int NOT NULL,
  `rule_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rule_id` (`rule_id`),
  CONSTRAINT `season_ibfk_1` FOREIGN KEY (`rule_id`) REFERENCES `rule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,'Season 1','2020-12-01','2021-01-31',4,1);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season_team`
--

DROP TABLE IF EXISTS `season_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season_team` (
  `season_id` int NOT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`season_id`,`team_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `season_team_ibfk_1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`),
  CONSTRAINT `season_team_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season_team`
--

LOCK TABLES `season_team` WRITE;
/*!40000 ALTER TABLE `season_team` DISABLE KEYS */;
INSERT INTO `season_team` VALUES (1,1),(1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `season_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stadium` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `win` int DEFAULT NULL,
  `tie` int DEFAULT NULL,
  `lose` int DEFAULT NULL,
  `win_goals` int DEFAULT NULL,
  `lose_goals` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Hà Nội FC','Mỹ Đình',0,0,0,0,0,0),(2,'SL Nghệ An','Nghệ An',0,0,0,0,0,0),(3,'Viettel','Thống Nhất',0,0,0,0,0,0),(4,'An Giang','Hòa Bình AG',0,0,0,0,0,0);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin',1,'admin','1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-22 16:49:37
