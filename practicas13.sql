CREATE DATABASE  IF NOT EXISTS `practicas13` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `practicas13`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: practicas13
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `abonos`
--

DROP TABLE IF EXISTS `abonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abonos` (
  `Id_Abono` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id_Compra` bigint(20) NOT NULL,
  `Monto` decimal(18,2) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Abono`),
  KEY `FK_Abonos_Principal` (`Id_Compra`),
  CONSTRAINT `FK_Abonos_Principal` FOREIGN KEY (`Id_Compra`) REFERENCES `principal` (`Id_Compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abonos`
--

LOCK TABLES `abonos` WRITE;
/*!40000 ALTER TABLE `abonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `abonos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `principal`
--

DROP TABLE IF EXISTS `principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `principal` (
  `Id_Compra` bigint(20) NOT NULL AUTO_INCREMENT,
  `Precio` decimal(18,2) DEFAULT NULL,
  `Saldo` decimal(18,2) DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  `Estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Compra`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `principal`
--

LOCK TABLES `principal` WRITE;
/*!40000 ALTER TABLE `principal` DISABLE KEYS */;
INSERT INTO `principal` VALUES (1,50000.00,50000.00,'Producto 1','Pendiente'),(2,13500.00,13500.00,'Producto 2','Pendiente'),(3,83600.00,83600.00,'Producto 3','Pendiente'),(4,1220.00,1220.00,'Producto 4','Pendiente'),(5,480.00,480.00,'Producto 5','Pendiente');
/*!40000 ALTER TABLE `principal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'practicas13'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_ConsultarComprasPendientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ConsultarComprasPendientes`()
BEGIN
    SELECT Id_Compra, Descripcion, Saldo
    FROM principal
    WHERE Estado = 'Pendiente';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ConsultarPrincipal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ConsultarPrincipal`()
BEGIN
    SELECT Id_Compra,
           Precio,
           Saldo,
           Descripcion,
           Estado
    FROM principal
    ORDER BY 
        CASE 
            WHEN Estado = 'Pendiente' THEN 0 
            ELSE 1 
        END,
        Estado ASC; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RegistrarAbono` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RegistrarAbono`(
    IN pId_Compra BIGINT,
    IN pMonto DECIMAL(18,2),
    IN pFecha DATETIME
)
BEGIN
    INSERT INTO abonos (Id_Compra, Monto, Fecha)
    VALUES (pId_Compra, pMonto, pFecha);

    UPDATE principal
    SET Saldo = Saldo - pMonto
    WHERE Id_Compra = pId_Compra;

    UPDATE principal
    SET Estado = 'Cancelado'
    WHERE Id_Compra = pId_Compra AND Saldo <= 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-12  9:32:36
