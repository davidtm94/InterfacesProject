CREATE DATABASE  IF NOT EXISTS `A13DavidTM` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `A13DavidTM`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: dbalumnos    Database: A13DavidTM
-- ------------------------------------------------------
-- Server version	5.5.41-0+wheezy1-log

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
-- Table structure for table `AlmacenDeComponentes`
--

DROP TABLE IF EXISTS `AlmacenDeComponentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlmacenDeComponentes` (
  `idAlmacenDeComponentes` int(11) NOT NULL,
  `Stock` varchar(45) DEFAULT NULL,
  `StockMinimo` varchar(45) DEFAULT NULL,
  `StockReposicion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAlmacenDeComponentes`),
  UNIQUE KEY `idAlmacenDeComponentes_UNIQUE` (`idAlmacenDeComponentes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlmacenDeComponentes`
--

LOCK TABLES `AlmacenDeComponentes` WRITE;
/*!40000 ALTER TABLE `AlmacenDeComponentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `AlmacenDeComponentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clientes` (
  `DNI` varchar(9) NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Apellidos` varchar(120) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Ciudad` varchar(60) DEFAULT NULL,
  `Región` varchar(45) DEFAULT NULL,
  `CodigoPostal` int(11) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Componente`
--

DROP TABLE IF EXISTS `Componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Componente` (
  `idComponente` int(11) NOT NULL,
  `PrecioUnitario` int(11) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `OrdenDeMontaje_idOrdenDeMontaje` int(11) NOT NULL,
  `AlmacenDeComponentes_idAlmacenDeComponentes` int(11) NOT NULL,
  PRIMARY KEY (`idComponente`),
  UNIQUE KEY `idComponente_UNIQUE` (`idComponente`),
  KEY `fk_Componente_OrdenDeMontaje1_idx` (`OrdenDeMontaje_idOrdenDeMontaje`),
  KEY `fk_Componente_AlmacenDeComponentes1_idx` (`AlmacenDeComponentes_idAlmacenDeComponentes`),
  CONSTRAINT `fk_Componente_OrdenDeMontaje1` FOREIGN KEY (`OrdenDeMontaje_idOrdenDeMontaje`) REFERENCES `OrdenDeMontaje` (`idOrdenDeMontaje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Componente_AlmacenDeComponentes1` FOREIGN KEY (`AlmacenDeComponentes_idAlmacenDeComponentes`) REFERENCES `AlmacenDeComponentes` (`idAlmacenDeComponentes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Componente`
--

LOCK TABLES `Componente` WRITE;
/*!40000 ALTER TABLE `Componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdenDeMontaje`
--

DROP TABLE IF EXISTS `OrdenDeMontaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrdenDeMontaje` (
  `idOrdenDeMontaje` int(11) NOT NULL,
  `Pedido_idPedido` int(11) NOT NULL,
  PRIMARY KEY (`idOrdenDeMontaje`),
  UNIQUE KEY `idOrdenDeMontaje_UNIQUE` (`idOrdenDeMontaje`),
  KEY `fk_OrdenDeMontaje_Pedido1_idx` (`Pedido_idPedido`),
  CONSTRAINT `fk_OrdenDeMontaje_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdenDeMontaje`
--

LOCK TABLES `OrdenDeMontaje` WRITE;
/*!40000 ALTER TABLE `OrdenDeMontaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrdenDeMontaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pedido` (
  `idPedido` int(11) NOT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `FechaDePedido` date DEFAULT NULL,
  `FechaDeEnvio` date DEFAULT NULL,
  `Precio` int(11) DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `Region` varchar(45) DEFAULT NULL,
  `Clientes_DNI` varchar(9) NOT NULL,
  PRIMARY KEY (`idPedido`),
  UNIQUE KEY `idPedido_UNIQUE` (`idPedido`),
  KEY `fk_Pedido_Clientes_idx` (`Clientes_DNI`),
  CONSTRAINT `fk_Pedido_Clientes` FOREIGN KEY (`Clientes_DNI`) REFERENCES `Clientes` (`DNI`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductosTerminados`
--

DROP TABLE IF EXISTS `ProductosTerminados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductosTerminados` (
  `idProductosTerminados` int(11) NOT NULL,
  `OrdenDeMontaje_idOrdenDeMontaje` int(11) NOT NULL,
  PRIMARY KEY (`idProductosTerminados`),
  UNIQUE KEY `idProductosTerminados_UNIQUE` (`idProductosTerminados`),
  KEY `fk_ProductosTerminados_OrdenDeMontaje1_idx` (`OrdenDeMontaje_idOrdenDeMontaje`),
  CONSTRAINT `fk_ProductosTerminados_OrdenDeMontaje1` FOREIGN KEY (`OrdenDeMontaje_idOrdenDeMontaje`) REFERENCES `OrdenDeMontaje` (`idOrdenDeMontaje`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductosTerminados`
--

LOCK TABLES `ProductosTerminados` WRITE;
/*!40000 ALTER TABLE `ProductosTerminados` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductosTerminados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proveedores` (
  `idProveedores` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Direccion` varchar(125) DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `Region` varchar(45) DEFAULT NULL,
  `CodigoPostal` int(11) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `AlmacenDeComponentes_idAlmacenDeComponentes` int(11) NOT NULL,
  PRIMARY KEY (`idProveedores`),
  UNIQUE KEY `idProveedores_UNIQUE` (`idProveedores`),
  KEY `fk_Proveedores_AlmacenDeComponentes1_idx` (`AlmacenDeComponentes_idAlmacenDeComponentes`),
  CONSTRAINT `fk_Proveedores_AlmacenDeComponentes1` FOREIGN KEY (`AlmacenDeComponentes_idAlmacenDeComponentes`) REFERENCES `AlmacenDeComponentes` (`idAlmacenDeComponentes`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-10  9:27:09
