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
-- Table structure for table `CategoriaComponente`
--

DROP TABLE IF EXISTS `CategoriaComponente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoriaComponente` (
  `IdCategoría` int(10) NOT NULL AUTO_INCREMENT,
  `NombreCategoría` varchar(15) DEFAULT NULL,
  `Descripción` longtext,
  PRIMARY KEY (`IdCategoría`),
  UNIQUE KEY `NombreCategoría` (`NombreCategoría`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaComponente`
--

LOCK TABLES `CategoriaComponente` WRITE;
/*!40000 ALTER TABLE `CategoriaComponente` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriaComponente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `IdCliente` varchar(5) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Dirección` varchar(60) DEFAULT NULL,
  `Ciudad` varchar(15) DEFAULT NULL,
  `Región` varchar(15) DEFAULT NULL,
  `CódPostal` varchar(10) DEFAULT NULL,
  `País` varchar(15) DEFAULT NULL,
  `Teléfono` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`),
  KEY `Ciudad` (`Ciudad`),
  KEY `CódPostal` (`CódPostal`),
  KEY `Región` (`Región`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Componente`
--

DROP TABLE IF EXISTS `Componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Componente` (
  `IdProducto` int(10) NOT NULL AUTO_INCREMENT,
  `NombreProducto` varchar(40) DEFAULT NULL,
  `IdProveedor` int(10) DEFAULT NULL,
  `IdCategoría` int(10) DEFAULT NULL,
  `PrecioUnidad` decimal(19,4) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `StockEnPedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `CategoríasProductos` (`IdCategoría`),
  KEY `IdCategoría` (`IdCategoría`),
  KEY `IdProveedor` (`IdProveedor`),
  KEY `NombreProducto` (`NombreProducto`),
  KEY `ProveedoresProductos` (`IdProveedor`),
  CONSTRAINT `CategoríasProductos` FOREIGN KEY (`IdCategoría`) REFERENCES `CategoriaComponente` (`IdCategoría`),
  CONSTRAINT `ProveedoresProductos` FOREIGN KEY (`IdProveedor`) REFERENCES `Proveedores` (`IdProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Componente`
--

LOCK TABLES `Componente` WRITE;
/*!40000 ALTER TABLE `Componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetallePedido`
--

DROP TABLE IF EXISTS `DetallePedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DetallePedido` (
  `IdPedido` int(10) NOT NULL,
  `IdProducto` int(10) NOT NULL,
  `PrecioUnitario` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdPedido`,`IdProducto`),
  KEY `IdPedido` (`IdPedido`),
  KEY `IdProducto` (`IdProducto`),
  KEY `PedidosDetalles de pedidos` (`IdPedido`),
  KEY `ProductosDetalles de pedidos` (`IdProducto`),
  CONSTRAINT `PedidosDetalles de pedidos` FOREIGN KEY (`IdPedido`) REFERENCES `Pedido` (`IdPedido`) ON DELETE CASCADE,
  CONSTRAINT `ProductosDetalles de pedidos` FOREIGN KEY (`IdProducto`) REFERENCES `Componente` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetallePedido`
--

LOCK TABLES `DetallePedido` WRITE;
/*!40000 ALTER TABLE `DetallePedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `DetallePedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pedido` (
  `IdPedido` int(10) NOT NULL AUTO_INCREMENT,
  `IdCliente` varchar(5) DEFAULT NULL,
  `FechaPedido` datetime DEFAULT NULL,
  `FechaEntrega` datetime DEFAULT NULL,
  `FechaEnvío` datetime DEFAULT NULL,
  `Cargo` decimal(19,4) DEFAULT NULL,
  `Estado` enum('REGISTRADO','MONTADO','SERVIDO','CANCELADO') NOT NULL,
  PRIMARY KEY (`IdPedido`),
  KEY `ClientesPedidos` (`IdCliente`),
  KEY `FechaEnvío` (`FechaEnvío`),
  KEY `FechaPedido` (`FechaPedido`),
  KEY `IdCliente` (`IdCliente`),
  CONSTRAINT `ClientesPedidos` FOREIGN KEY (`IdCliente`) REFERENCES `Cliente` (`IdCliente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11078 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proveedores` (
  `IdProveedor` int(10) NOT NULL AUTO_INCREMENT,
  `NombreCompañía` varchar(40) DEFAULT NULL,
  `Dirección` varchar(60) DEFAULT NULL,
  `Ciudad` varchar(15) DEFAULT NULL,
  `Región` varchar(15) DEFAULT NULL,
  `CódPostal` varchar(10) DEFAULT NULL,
  `País` varchar(15) DEFAULT NULL,
  `Teléfono` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`IdProveedor`),
  KEY `CódPostal` (`CódPostal`),
  KEY `NombreCompañía` (`NombreCompañía`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
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

-- Dump completed on 2015-03-10 11:07:00
