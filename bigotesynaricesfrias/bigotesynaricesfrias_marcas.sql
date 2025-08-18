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
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `idMarca` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'9 Lives'),(2,'Agility'),(3,'Advanced'),(4,'Biomax'),(5,'Biopet'),(6,'Canopus'),(7,'CatPro'),(8,'Dog/Pro'),(9,'Coopetacion'),(10,'Crianza'),(11,'Dogma (25 % de Proteina)'),(12,'Dog/Cat Seleccion'),(13,'Dr. Perrot'),(14,'Estampa'),(15,'Eukanuba'),(16,'Evolution'),(17,'Ganacan'),(18,'Gandum'),(19,'Gaucho'),(20,'Gran Campeon Maintenance'),(21,'Iams'),(22,'Infinity'),(23,'Ken-L'),(24,'Kume (A Pedido)'),(25,'Matute'),(26,'Nutribon'),(27,'Protemix'),(28,'Raza'),(29,'Sabrositos'),(30,'Sieger'),(31,'Smarty'),(32,'Tiernitos'),(33,'Top Nutrition'),(34,'Ultra Pro (25 % de Proteina)'),(35,'Vagoneta'),(36,'Valiant'),(37,'Zimpi'),(38,'Baires'),(39,'Company'),(40,'Kongo'),(41,'Maintenaince'),(42,'Natural Meat'),(43,'Old Prince'),(44,'Origen'),(45,'Voraz'),(46,'Pedigree'),(47,'Maintenaince'),(48,'Whiscas'),(49,'Purina'),(50,'Excellent'),(51,'Pro Plan'),(52,'Mv. Holliday (Alimento Medicado)'),(53,'Royal Canin'),(54,'Vital Can/Cat'),(55,'Belcan/Belcat'),(56,'Hop!'),(57,'Shulet (Alimento para peses)'),(58,'Piedras Sanitarias'),(59,'Cereales y Granos (Sujeto a Cambios Sin Previo Aviso)'),(60,'Snacks'),(61,'Jueguetes'),(62,'Accesorios'),(63,'Ropa y Frisa Termica'),(64,'Pipetas'),(65,'Antiparasitarios'),(66,'Shampoo Osspret'),(67,'Fungicidas e Insectividas'),(68,'Big Love'),(69,'Farmacia');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-02  0:18:33
