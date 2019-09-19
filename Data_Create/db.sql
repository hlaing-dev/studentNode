CREATE DATABASE  IF NOT EXISTS `acbel_api_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `acbel_api_db`;
-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: acbel_api_db
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.19.04.1

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
-- Table structure for table `DaySiteData`
--

DROP TABLE IF EXISTS `DaySiteData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DaySiteData` (
  `siteId` int(11) NOT NULL,
  `temperature` double DEFAULT NULL,
  `humidity` double DEFAULT NULL,
  `wind` double DEFAULT NULL,
  `powerOutput` double DEFAULT NULL,
  `radiation` double DEFAULT NULL,
  `startTs` datetime DEFAULT NULL,
  `endTs` datetime DEFAULT NULL,
  `monthRevenue` double DEFAULT NULL,
  `yearRevenue` double DEFAULT NULL,
  `weekRevenue` double DEFAULT NULL,
  `avgYearRevenue` double DEFAULT NULL,
  `totalRevenue` double DEFAULT NULL,
  `setupPrice` double DEFAULT NULL,
  `totalNoMaintenance` int(11) DEFAULT NULL,
  `totalCostMaintenance` double DEFAULT NULL,
  PRIMARY KEY (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DaySiteData`
--

LOCK TABLES `DaySiteData` WRITE;
/*!40000 ALTER TABLE `DaySiteData` DISABLE KEYS */;
/*!40000 ALTER TABLE `DaySiteData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HourSiteData`
--

DROP TABLE IF EXISTS `HourSiteData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HourSiteData` (
  `siteId` int(11) NOT NULL,
  `accRevenue` double DEFAULT NULL,
  `startTs` datetime DEFAULT NULL,
  `endTs` varchar(45) DEFAULT NULL,
  `revenue` double DEFAULT NULL,
  PRIMARY KEY (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HourSiteData`
--

LOCK TABLES `HourSiteData` WRITE;
/*!40000 ALTER TABLE `HourSiteData` DISABLE KEYS */;
/*!40000 ALTER TABLE `HourSiteData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MinuteSiteData`
--

DROP TABLE IF EXISTS `MinuteSiteData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MinuteSiteData` (
  `siteId` int(11) NOT NULL,
  `powerOutput` varchar(45) DEFAULT NULL,
  `accPower` double DEFAULT NULL,
  `efficiency` double DEFAULT NULL,
  `dataConnectivity` int(11) DEFAULT NULL,
  `alertId` int(11) DEFAULT NULL,
  `siteStatus` varchar(45) DEFAULT NULL,
  `startTs` datetime DEFAULT NULL,
  `endTs` datetime DEFAULT NULL,
  PRIMARY KEY (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MinuteSiteData`
--

LOCK TABLES `MinuteSiteData` WRITE;
/*!40000 ALTER TABLE `MinuteSiteData` DISABLE KEYS */;
/*!40000 ALTER TABLE `MinuteSiteData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inverter`
--

DROP TABLE IF EXISTS `inverter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inverter` (
  `inverterId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `spec` varchar(45) NOT NULL,
  `dcInputWatt` double NOT NULL,
  `efficiency` double NOT NULL,
  `capacity` double NOT NULL,
  `temperature` double NOT NULL,
  PRIMARY KEY (`inverterId`,`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inverter`
--

LOCK TABLES `inverter` WRITE;
/*!40000 ALTER TABLE `inverter` DISABLE KEYS */;
/*!40000 ALTER TABLE `inverter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance` (
  `siteId` int(11) NOT NULL,
  `dateFor` datetime DEFAULT NULL,
  `maintenanceType` varchar(45) DEFAULT NULL,
  `maintenanceDesc` varchar(45) DEFAULT NULL,
  `supplier` varchar(45) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `isDone` tinyint(2) DEFAULT NULL,
  `ts` datetime DEFAULT NULL,
  PRIMARY KEY (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panel`
--

DROP TABLE IF EXISTS `panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panel` (
  `panelId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `spec` varchar(45) NOT NULL,
  `powerOutput` double NOT NULL,
  `efficiency` double NOT NULL,
  `capacity` double NOT NULL,
  `ts` datetime NOT NULL,
  `temperature` double DEFAULT NULL,
  PRIMARY KEY (`panelId`,`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panel`
--

LOCK TABLES `panel` WRITE;
/*!40000 ALTER TABLE `panel` DISABLE KEYS */;
/*!40000 ALTER TABLE `panel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteInfo`
--

DROP TABLE IF EXISTS `siteInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `siteInfo` (
  `siteId` int(11) NOT NULL,
  `startDate` datetime NOT NULL,
  `capacity` double NOT NULL,
  `setupPrice` double NOT NULL,
  `siteName` varchar(45) NOT NULL,
  `cityName` varchar(45) NOT NULL,
  `countryName` varchar(45) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `ts` datetime NOT NULL,
  PRIMARY KEY (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteInfo`
--

LOCK TABLES `siteInfo` WRITE;
/*!40000 ALTER TABLE `siteInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `siteInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-09 10:26:42
