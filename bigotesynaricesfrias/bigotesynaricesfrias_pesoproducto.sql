CREATE DATABASE  IF NOT EXISTS `bigotesynaricesfrias` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bigotesynaricesfrias`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: bigotesynaricesfrias
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `pesoproducto`
--

DROP TABLE IF EXISTS `pesoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesoproducto` (
  `idPeso` int NOT NULL AUTO_INCREMENT,
  `peso` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idPeso`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesoproducto`
--

LOCK TABLES `pesoproducto` WRITE;
/*!40000 ALTER TABLE `pesoproducto` DISABLE KEYS */;
INSERT INTO `pesoproducto` VALUES (1,'10 grs'),(2,'15,7 grs'),(3,'20 grs'),(4,'27,7 grs'),(5,'38 grs'),(6,'40 grs'),(7,'47,1 grs'),(8,'70 grs'),(9,'77,1 grs'),(10,'80 grs'),(11,'85 grs'),(12,'100 grs'),(13,'109,9 grs'),(14,'115 grs'),(15,'150 grs'),(16,'179,9 grs'),(17,'195 grs'),(18,'270 grs'),(19,'340 grs'),(20,'400 grs'),(21,'500 grs'),(22,'750 grs'),(23,'1 kg'),(24,'1,5 kg'),(25,'2 kg'),(26,'2,2 kg'),(27,'2,5 kg'),(28,'3 kg'),(29,'3,3 kg'),(30,'3,6 kg'),(31,'4 kg'),(32,'-4 kg'),(33,'+4 kg'),(34,'5 kg'),(35,'+5 kg'),(36,'7 kg'),(37,'7,5 kg'),(38,'10 kg'),(39,'peso animal 10 kg'),(40,'12 kg'),(41,'15 kg'),(42,'16 kg'),(43,'20 kg'),(44,'peso animal 20 kg'),(45,'21 kg'),(46,'22 kg'),(47,'24 kg'),(48,'25 kg'),(49,'30 kg'),(50,'40 kg'),(51,'peso animal 40 kg'),(52,'peso animal 60 kg'),(53,'peso animal 1 a 2 kg'),(54,'peso animal 2 a 4 kg'),(55,'peso animal 2 a 3 kg'),(56,'peso animal 2 a 3,5 kg'),(57,'peso animal 2 a 5 kg'),(58,'peso animal 3 a 6 kg'),(59,'peso animal 3,6 a 7,5 kg'),(60,'peso animal 4 a 9 kg'),(61,'peso animal 4 a 10 kg'),(62,'peso animal 4,5 kg'),(63,'peso animal 4,5 a 10 kg'),(64,'peso animal 5 a 10 kg'),(65,'peso animal 6 a 12 kg'),(66,'peso animal 7,6 a 15 kg'),(67,'peso animal 9 a 18 kg'),(68,'peso animal 10 a 20 kg'),(69,'peso animal 10 a 25 kg'),(70,'peso animal 11 a 20 kg'),(71,'peso animal 15,1 a 30 kg'),(72,'peso animal 18 a 36 kg'),(73,'peso animal 20 a 30 kg'),(74,'peso animal 20 a 32 kg'),(75,'peso animal 20 a 40 kg'),(76,'peso animal 21 a 40 kg'),(77,'peso animal 25 a 50 kg'),(78,'peso animal 30 a 40 kg'),(79,'peso animal 30,1 a 60 kg'),(80,'peso animal 32 a 64 kg'),(81,'peso animal 36 a 70 kg'),(82,'peso animal 40 a 56 kg'),(83,'peso animal 40 a 60 kg'),(84,'peso animal 41 a 60 kg'),(85,'8 kg'),(86,'5,3 Kg'),(87,'200 grs'),(88,'60 kg'),(89,'200 grs'),(90,'6 grs'),(91,'50 grs'),(92,'250 grs');
/*!40000 ALTER TABLE `pesoproducto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-22 20:10:00
