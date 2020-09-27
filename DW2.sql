CREATE DATABASE  IF NOT EXISTS `DW` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `DW`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: DW
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `TBL_COMBOS`
--

DROP TABLE IF EXISTS `TBL_COMBOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_COMBOS` (
  `ID_COMBO` mediumint NOT NULL AUTO_INCREMENT,
  `NOMBRE_COMBO` varchar(255) NOT NULL,
  `PRECIO` decimal(9,2) NOT NULL,
  `ID_PRODUCTO` mediumint NOT NULL,
  `ACTIVADO` tinyint(1) DEFAULT NULL,
  `FECHA` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_COMBO`),
  KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  CONSTRAINT `TBL_COMBOS_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `TBL_PRODUCTO` (`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_COMBOS`
--

LOCK TABLES `TBL_COMBOS` WRITE;
/*!40000 ALTER TABLE `TBL_COMBOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_COMBOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_INFORMACION_PAGO`
--

DROP TABLE IF EXISTS `TBL_INFORMACION_PAGO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_INFORMACION_PAGO` (
  `ID_INFO_TARJETA` mediumint NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` mediumint NOT NULL,
  `NUMERO_TARJETA` varchar(22) NOT NULL,
  `MES_VENCIMIENTO` varchar(2) NOT NULL,
  `ANIO_VENCIMIENTO` varchar(2) NOT NULL,
  PRIMARY KEY (`ID_INFO_TARJETA`),
  UNIQUE KEY `NUMERO_TARJETA` (`NUMERO_TARJETA`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  KEY `NUMERO_TARJETA_2` (`NUMERO_TARJETA`),
  CONSTRAINT `TBL_INFORMACION_PAGO_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `TBL_USUARIO` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_INFORMACION_PAGO`
--

LOCK TABLES `TBL_INFORMACION_PAGO` WRITE;
/*!40000 ALTER TABLE `TBL_INFORMACION_PAGO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_INFORMACION_PAGO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_INGREDIENTE`
--

DROP TABLE IF EXISTS `TBL_INGREDIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_INGREDIENTE` (
  `ID_INGREDIENTE` mediumint NOT NULL AUTO_INCREMENT,
  `ID_TIPO_INGREDIENTE` mediumint NOT NULL,
  `NOMBRE_INGREDIENTE` varchar(152) NOT NULL,
  `COSTO` decimal(9,2) NOT NULL,
  `IMAGEN` varchar(128) NOT NULL,
  PRIMARY KEY (`ID_INGREDIENTE`),
  KEY `ID_TIPO_INGREDIENTE` (`ID_TIPO_INGREDIENTE`),
  CONSTRAINT `TBL_INGREDIENTE_ibfk_1` FOREIGN KEY (`ID_TIPO_INGREDIENTE`) REFERENCES `TBL_TIPO_INGREDIENTE` (`ID_TIPO_INGREDIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_INGREDIENTE`
--

LOCK TABLES `TBL_INGREDIENTE` WRITE;
/*!40000 ALTER TABLE `TBL_INGREDIENTE` DISABLE KEYS */;
INSERT INTO `TBL_INGREDIENTE` VALUES (1,2,'Jamon',4.50,''),(2,2,'Pepperoni',4.50,''),(3,2,'Queso',10.50,''),(4,2,'Tomate',3.50,''),(5,2,'Aceituna',0.50,''),(6,2,'Pimentón rojo',1.25,''),(7,2,'Champiñón',0.20,''),(8,2,'Orégano',1.00,''),(9,2,'Piña',1.00,'');
/*!40000 ALTER TABLE `TBL_INGREDIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_INTER`
--

DROP TABLE IF EXISTS `TBL_INTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_INTER` (
  `ID_INTER` mediumint NOT NULL AUTO_INCREMENT,
  `ID_PRODUCTO` mediumint NOT NULL,
  `ID_MENU` mediumint NOT NULL,
  PRIMARY KEY (`ID_INTER`),
  KEY `ID_MENU` (`ID_MENU`),
  KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  CONSTRAINT `TBL_INTER_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `TBL_PRODUCTO` (`ID_PRODUCTO`),
  CONSTRAINT `TBL_INTER_ibfk_2` FOREIGN KEY (`ID_MENU`) REFERENCES `TBL_MENU` (`ID_MENU`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_INTER`
--

LOCK TABLES `TBL_INTER` WRITE;
/*!40000 ALTER TABLE `TBL_INTER` DISABLE KEYS */;
INSERT INTO `TBL_INTER` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(9,9,3),(10,10,3),(11,11,3);
/*!40000 ALTER TABLE `TBL_INTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_MENU`
--

DROP TABLE IF EXISTS `TBL_MENU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_MENU` (
  `ID_MENU` mediumint NOT NULL AUTO_INCREMENT,
  `NOMBRE_MENU` varchar(128) NOT NULL,
  `DESCRIPCION` varchar(128) DEFAULT NULL,
  `IMAGEN` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID_MENU`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_MENU`
--

LOCK TABLES `TBL_MENU` WRITE;
/*!40000 ALTER TABLE `TBL_MENU` DISABLE KEYS */;
INSERT INTO `TBL_MENU` VALUES (1,'Pizza','listado de pizzas','https://www.paulinacocina.net/wp-content/uploads/2017/04/5.jpg'),(2,'Bebidas','Listado de Bebidas','https://elsancarlistau.files.wordpress.com/2018/09/gaseosas_restaurante-webgeek.jpg?w=775'),(3,'Postres','Listado de Postres','https://dam.cocinafacil.com.mx/wp-content/uploads/2019/06/postres-faciles.jpg');
/*!40000 ALTER TABLE `TBL_MENU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PEDIDO`
--

DROP TABLE IF EXISTS `TBL_PEDIDO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_PEDIDO` (
  `ID_PEDIDO` mediumint NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` mediumint NOT NULL,
  `DIRECCION_ENTREGA` varchar(255) DEFAULT NULL,
  `FECHA_INGRESO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_PEDIDO`),
  KEY `ID_USUARIO` (`ID_USUARIO`),
  CONSTRAINT `TBL_PEDIDO_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `TBL_USUARIO` (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PEDIDO`
--

LOCK TABLES `TBL_PEDIDO` WRITE;
/*!40000 ALTER TABLE `TBL_PEDIDO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_PEDIDO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PEDIDO_PRODUCTO`
--

DROP TABLE IF EXISTS `TBL_PEDIDO_PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_PEDIDO_PRODUCTO` (
  `ID_PEDIDO` mediumint NOT NULL AUTO_INCREMENT,
  `ID_PRODUCTO` mediumint NOT NULL,
  `CANTIDAD` int DEFAULT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  CONSTRAINT `TBL_PEDIDO_PRODUCTO_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `TBL_PRODUCTO` (`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PEDIDO_PRODUCTO`
--

LOCK TABLES `TBL_PEDIDO_PRODUCTO` WRITE;
/*!40000 ALTER TABLE `TBL_PEDIDO_PRODUCTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBL_PEDIDO_PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PRODUCTO`
--

DROP TABLE IF EXISTS `TBL_PRODUCTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_PRODUCTO` (
  `ID_PRODUCTO` mediumint NOT NULL AUTO_INCREMENT,
  `NOMBRE_PRODUCTO` varchar(128) NOT NULL,
  `TIPO_PRODUCTO` varchar(128) NOT NULL,
  `PRECIO` decimal(9,2) NOT NULL,
  `IMAGEN` varchar(128) DEFAULT NULL,
  `DESCRIPCION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTO`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PRODUCTO`
--

LOCK TABLES `TBL_PRODUCTO` WRITE;
/*!40000 ALTER TABLE `TBL_PRODUCTO` DISABLE KEYS */;
INSERT INTO `TBL_PRODUCTO` VALUES (1,'Pizza jamon y queso','',100.50,'https://media-cdn.tripadvisor.com/media/photo-s/10/1d/12/b7/pizza-de-jamon-con-queso.jpg','Deliciosa pizza de jamon y queso'),(2,'Pizza pepperoni y queso','',100.50,'https://placeralplato.com/files/2016/01/Pizza-con-pepperoni.jpg','Deliciosa pizza de jamon y pepperoni'),(3,'Pizza Mix','',150.50,'https://previews.123rf.com/images/nakedking/nakedking1805/nakedking180503109/101531453-mix-pizza.jpg','Deliciosa pizza Mix con muchos ingredientes'),(4,'Pizza 4 estaciones','',100.00,'https://crujienteyaldente.com/wp-content/uploads/2018/12/Pizza-4-estaciones.jpg','Deliciosa pizza de 4 estaciones a tu eleccion'),(5,'Coca-Cola','',18.00,'https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/media/image/2020/02/coca-cola-portada-1877741.jpg','El auténtico sabor de la bebida Coca Cola'),(6,'Fanta Naranja','',7.00,NULL,'Exuberante diversión tropical para liberarte de tu vida rutinaria.'),(7,'Sprite','',7.00,NULL,'Sabor a lima-limón, claro, transparente y refrescante'),(8,'Agua Pura','',5.00,NULL,'la mas confiable y segura'),(9,'Brownies','',25.00,NULL,'Deliciosos Brownies de chocolate'),(10,'Pastel de Fresa','',15.00,NULL,'Deliciosa porcion de pastel de fresa '),(11,'Galletas','',15.00,NULL,'Deliciosas galletas con chispas de chocolate');
/*!40000 ALTER TABLE `TBL_PRODUCTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PRODUCTO_INGREDIENTE`
--

DROP TABLE IF EXISTS `TBL_PRODUCTO_INGREDIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_PRODUCTO_INGREDIENTE` (
  `ID_PRODUCTO_INGREDIENTE` mediumint NOT NULL AUTO_INCREMENT,
  `ID_PRODUCTO` mediumint NOT NULL,
  `ID_INGREDIENTE` mediumint NOT NULL,
  `INGREDIENTE_GESTION` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTO_INGREDIENTE`),
  KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  KEY `ID_INGREDIENTE` (`ID_INGREDIENTE`),
  CONSTRAINT `TBL_PRODUCTO_INGREDIENTE_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `TBL_PRODUCTO` (`ID_PRODUCTO`),
  CONSTRAINT `TBL_PRODUCTO_INGREDIENTE_ibfk_2` FOREIGN KEY (`ID_INGREDIENTE`) REFERENCES `TBL_INGREDIENTE` (`ID_INGREDIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PRODUCTO_INGREDIENTE`
--

LOCK TABLES `TBL_PRODUCTO_INGREDIENTE` WRITE;
/*!40000 ALTER TABLE `TBL_PRODUCTO_INGREDIENTE` DISABLE KEYS */;
INSERT INTO `TBL_PRODUCTO_INGREDIENTE` VALUES (1,4,2,1),(2,4,3,1),(3,4,4,1),(5,1,2,1),(6,1,3,1),(7,1,4,1),(8,2,2,1),(9,2,3,1),(10,2,4,1);
/*!40000 ALTER TABLE `TBL_PRODUCTO_INGREDIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_TIPO_INGREDIENTE`
--

DROP TABLE IF EXISTS `TBL_TIPO_INGREDIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_TIPO_INGREDIENTE` (
  `ID_TIPO_INGREDIENTE` mediumint NOT NULL AUTO_INCREMENT,
  `NOMBRE_TIPO_INGREDIENTE` varchar(128) NOT NULL,
  `FECHA_INGRESO` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_TIPO_INGREDIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_TIPO_INGREDIENTE`
--

LOCK TABLES `TBL_TIPO_INGREDIENTE` WRITE;
/*!40000 ALTER TABLE `TBL_TIPO_INGREDIENTE` DISABLE KEYS */;
INSERT INTO `TBL_TIPO_INGREDIENTE` VALUES (1,'BEBIDAS','2020-08-11 05:12:19'),(2,'INGREDIENTES','2020-08-11 05:12:21'),(3,'CONDIMENTOS','2020-08-11 05:12:23');
/*!40000 ALTER TABLE `TBL_TIPO_INGREDIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_USUARIO`
--

DROP TABLE IF EXISTS `TBL_USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TBL_USUARIO` (
  `ID_USUARIO` mediumint NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(128) NOT NULL,
  `NIT` varchar(17) NOT NULL,
  `CORREO` varchar(128) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `DIRECCION` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  KEY `NIT` (`NIT`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_USUARIO`
--

LOCK TABLES `TBL_USUARIO` WRITE;
/*!40000 ALTER TABLE `TBL_USUARIO` DISABLE KEYS */;
INSERT INTO `TBL_USUARIO` VALUES (1,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(2,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(3,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(4,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(5,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(6,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(7,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(8,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(9,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(10,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(11,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(12,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(13,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(14,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(15,'Silvia','789446','test@jljl.com','986465465465','11 calle 11av esquina puerto barrios'),(16,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(17,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(18,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(19,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(20,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(21,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(22,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(23,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(24,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(25,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(26,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(27,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(28,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(29,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(30,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(31,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(32,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(33,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(34,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(35,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(36,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(37,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(38,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(39,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(40,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(41,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(42,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(43,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(44,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(45,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(46,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(47,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(48,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(49,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(50,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(51,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(52,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(53,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(54,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(55,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(56,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(57,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(58,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(59,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(60,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(61,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(62,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(63,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(64,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(65,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(66,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(67,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(68,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(69,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(70,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(71,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(72,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(73,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(74,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(75,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(76,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(77,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(78,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(79,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(80,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(81,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(82,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(83,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(84,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(85,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(86,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(87,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(88,'Jose','789446','test@jljl.com','986465465465','zona 1111111111'),(89,'Jose','789446','test@jljl.com','986465465465','zona 1111111111');
/*!40000 ALTER TABLE `TBL_USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'DW'
--
/*!50003 DROP PROCEDURE IF EXISTS `cursorTest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `cursorTest`(
)
BEGIN
-- Variables donde almacenar lo que nos traemos desde el SELECT
  DECLARE v_entrada BIGINT;
  DECLARE v_salida BIGINT;
  DECLARE V_CONTADORUNO BIGINT DEFAULT 0;
  DECLARE V_CONTADORDOS BIGINT DEFAULT 0;
#DECLARE v_penalty1 BIGINT;
#DECLARE v_penalty2 BIGINT;
-- Variable para controlar el fin del bucle
  DECLARE fin INTEGER DEFAULT 0;

-- El SELECT que vamos a ejecutar
  DECLARE runners_cursor CURSOR FOR
    SELECT HOUR(ENTRADA), HOUR(SALIDA_NUEVA) FROM TBL_ANALISIS;

-- Condición de salida
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;

  OPEN runners_cursor;
  get_runners: LOOP
    FETCH runners_cursor INTO v_entrada, v_salida;
    IF 1 BETWEEN v_entrada AND v_salida THEN
		SET V_CONTADORUNO = V_CONTADORUNO+1;
    END IF;
    IF 2 BETWEEN v_entrada AND v_salida THEN
		SET V_CONTADORDOS = V_CONTADORDOS+1;
    END IF;
    
    IF fin = 1 THEN
       LEAVE get_runners;
    END IF;

  END LOOP get_runners;
SELECT v_entrada, v_salida, V_CONTADORUNO, V_CONTADORDOS;
  CLOSE runners_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_CREATE_CLI` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PRC_CREATE_CLI`(IN P_NOMBRE VARCHAR(255), IN P_NIT VARCHAR(15), IN P_CORREO VARCHAR(64), IN P_PASSWORD VARCHAR(124), IN P_DIRECCION VARCHAR(255))
BEGIN
    INSERT INTO TBL_USUARIO(NOMBRE, NIT, CORREO, PASSWORD, DIRECCION)VALUES(P_NOMBRE, P_NIT, P_CORREO, P_PASSWORD, P_DIRECCION);
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_INGREDIENTES_REST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PRC_INGREDIENTES_REST`(IN P_ID_PRODUCTO MEDIUMINT(9))
BEGIN
SELECT 
    *
FROM
    TBL_INGREDIENTE SUPPER
WHERE 1=1 AND
    NOT EXISTS( SELECT 
            123
        FROM
            TBL_INGREDIENTE A
                JOIN
            TBL_PRODUCTO_INGREDIENTE B ON A.ID_INGREDIENTE = B.ID_INGREDIENTE
                JOIN
            TBL_PRODUCTO C ON B.ID_PRODUCTO = C.ID_PRODUCTO
        WHERE 1=1 
        AND C.ID_PRODUCTO = P_ID_PRODUCTO
            AND SUPPER.ID_INGREDIENTE = A.ID_INGREDIENTE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_LIST_INGREDIENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PRC_LIST_INGREDIENTES`(IN P_ID_PRODUCTO INT(9))
BEGIN

SELECT 
    A.NOMBRE_PRODUCTO, PRECIO, C.NOMBRE_INGREDIENTE, C.COSTO, A.ID_PRODUCTO, A.DESCRIPCION, A.IMAGEN, C.ID_INGREDIENTE
FROM
    TBL_PRODUCTO A
        INNER JOIN
    TBL_PRODUCTO_INGREDIENTE B ON A.ID_PRODUCTO = B.ID_PRODUCTO
    INNER JOIN TBL_INGREDIENTE C ON B.ID_INGREDIENTE = C.ID_INGREDIENTE
    WHERE A.ID_PRODUCTO = P_ID_PRODUCTO;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_MENU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PRC_MENU`()
BEGIN
SELECT *
FROM 
    TBL_MENU M;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_PRODUCTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PRC_PRODUCTOS`(IN P_PRODUCTO VARCHAR(255))
BEGIN
if P_PRODUCTO <> '' THEN
    SELECT * 
    FROM TBL_PRODUCTO
    WHERE NOMBRE_PRODUCTO like  concat('%',P_PRODUCTO,'%');
ELSE 
    SELECT * 
    FROM TBL_PRODUCTO;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PRC_SUB_MENU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `PRC_SUB_MENU`(IN P_ID_MENU MEDIUMINT(9))
BEGIN
SELECT 
    A.ID_PRODUCTO,A.NOMBRE_PRODUCTO, A.DESCRIPCION, A.PRECIO, A.IMAGEN
FROM
    TBL_INTER I
        INNER JOIN
    TBL_MENU M ON I.ID_MENU = M.ID_MENU
        INNER JOIN
    TBL_PRODUCTO A ON I.ID_PRODUCTO = A.ID_PRODUCTO
WHERE
    I.ID_MENU = P_ID_MENU;
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

-- Dump completed on 2020-09-27 12:17:59
