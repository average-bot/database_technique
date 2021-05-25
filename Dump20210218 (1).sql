-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: retirement_home
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `floor` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Svalan',1),(2,'Slandan',1),(3,'Solrosen',2),(4,'Jasmin',2),(5,'Dahlia',3),(6,'Smalen',3);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elder`
--

DROP TABLE IF EXISTS `elder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elder` (
  `ssn` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `moveInDate` date NOT NULL,
  `room_number` int NOT NULL,
  `room_department_id` int unsigned NOT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `ssn_UNIQUE` (`ssn`),
  KEY `fk_elder_room1_idx` (`room_number`,`room_department_id`),
  CONSTRAINT `fk_elder_room1` FOREIGN KEY (`room_number`, `room_department_id`) REFERENCES `room` (`number`, `department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder`
--

LOCK TABLES `elder` WRITE;
/*!40000 ALTER TABLE `elder` DISABLE KEYS */;
INSERT INTO `elder` VALUES (190924,'Maria','2021-02-12',4,2),(200102,'Malin','1963-12-31',3,6),(211212,'Sebastian','2004-06-10',1,1),(290319,'Julia','2017-12-12',1,2),(320417,'Kalle','2010-01-01',1,3),(360412,'Birgit','2012-02-29',3,6),(391010,'Kevin','2020-04-02',1,5),(420601,'Martin','2009-11-23',1,6),(540101,'Josef','2000-04-11',2,6);
/*!40000 ALTER TABLE `elder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `number` int NOT NULL AUTO_INCREMENT,
  `size` int unsigned NOT NULL,
  `view` varchar(45) NOT NULL,
  `department_id` int unsigned NOT NULL,
  PRIMARY KEY (`number`,`department_id`),
  KEY `fk_room_department1_idx` (`department_id`),
  CONSTRAINT `fk_room_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,22,'north',1),(1,22,'north',2),(1,22,'west',3),(1,22,'south',4),(1,22,'east',5),(1,22,'north',6),(2,22,'south',1),(2,22,'east',2),(2,25,'west',3),(2,30,'northeast',4),(2,21,'west',5),(2,22,'south',6),(3,22,'north',1),(3,22,'north',2),(3,25,'west',3),(3,30,'west',4),(3,22,'east',6),(4,22,'east',1),(4,22,'south',2);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-18  9:58:05
