CREATE DATABASE  IF NOT EXISTS `bloodbank` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bloodbank`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: 127.0.0.1    Database: bloodbank
-- ------------------------------------------------------
-- Server version	5.5.8

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
-- Table structure for table `hosorder`
--

DROP TABLE IF EXISTS `hosorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosorder` (
  `ORDERID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ORDERDATE` varchar(40) DEFAULT NULL,
  `ORDERSTATUS` varchar(45) DEFAULT NULL,
  `HOSPITALNAME` varchar(45) DEFAULT NULL,
  `BLOODBANKNAME` varchar(45) DEFAULT NULL,
  `AMOUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDERID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosorder`
--

LOCK TABLES `hosorder` WRITE;
/*!40000 ALTER TABLE `hosorder` DISABLE KEYS */;
INSERT INTO `hosorder` VALUES (3,'2011-04-29 05:03:36','Completed','Newark','Boston',15);
/*!40000 ALTER TABLE `hosorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `SCHEDULEID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SCHEDULEDATE` date NOT NULL,
  `SCHEDULETIME` varchar(20) NOT NULL,
  `DONOR` bigint(20) unsigned NOT NULL,
  `ORG` bigint(20) unsigned NOT NULL,
  `STATUS` varchar(45) DEFAULT 'Active',
  `ASSIGNEDSTATUS` varchar(45) DEFAULT 'Pending',
  PRIMARY KEY (`SCHEDULEID`),
  KEY `FK_SCHEDULE_DONOR` (`DONOR`),
  KEY `FK_SCHEDULE_ORG` (`ORG`),
  CONSTRAINT `FK_SCHEDULE_DONOR` FOREIGN KEY (`DONOR`) REFERENCES `donor` (`DONORID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SCHEDULE_ORG` FOREIGN KEY (`ORG`) REFERENCES `organization` (`ORGID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (4,'2014-08-04','10-11 am',3,5,'Active','Assigned'),(5,'2011-09-04','2-3 pm',3,5,'Active','Assigned'),(6,'2011-09-04','2-3 pm',4,5,'Active','Pending');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosrequest`
--

DROP TABLE IF EXISTS `hosrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hosrequest` (
  `REQID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BLOODGROUP` varchar(45) NOT NULL,
  `PRODUCTTYPE` varchar(45) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `HOSORDER` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`REQID`),
  UNIQUE KEY `REQID_UNIQUE` (`REQID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosrequest`
--

LOCK TABLES `hosrequest` WRITE;
/*!40000 ALTER TABLE `hosrequest` DISABLE KEYS */;
INSERT INTO `hosrequest` VALUES (3,'A+','WBC',1,3);
/*!40000 ALTER TABLE `hosrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donationdetails`
--

DROP TABLE IF EXISTS `donationdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donationdetails` (
  `DONATIONID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `EXTRACTEDBY` varchar(45) NOT NULL,
  `DONATIONDATE` date NOT NULL,
  `BLOODPRODUCT` varchar(45) DEFAULT NULL,
  `DONATIONSTATUS` varchar(45) NOT NULL DEFAULT 'Pending',
  `BARCODE` varchar(45) DEFAULT NULL,
  `SCHEDULE` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`DONATIONID`),
  UNIQUE KEY `BARCODE_UNIQUE` (`BARCODE`),
  KEY `FK_DONATIONDETAILS_SCHEDULE` (`SCHEDULE`),
  CONSTRAINT `FK_DONATIONDETAILS_SCHEDULE` FOREIGN KEY (`SCHEDULE`) REFERENCES `schedule` (`SCHEDULEID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donationdetails`
--

LOCK TABLES `donationdetails` WRITE;
/*!40000 ALTER TABLE `donationdetails` DISABLE KEYS */;
INSERT INTO `donationdetails` VALUES (4,'nurse1','2014-08-04','WBC','Completed','1',4),(6,'nurse1','2011-09-04','','Pending','122',5);
/*!40000 ALTER TABLE `donationdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ROLEID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ROLE` varchar(45) NOT NULL,
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'superadmin'),(2,'bbadmin'),(3,'donor'),(4,'receptionist'),(5,'nurse'),(6,'labtechnician'),(7,'inventorymanager'),(8,'hadmin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `INVENTORYID` bigint(20) unsigned NOT NULL,
  `BLOODGRP` varchar(45) NOT NULL,
  `WBCQUANTITY` int(11) DEFAULT '0',
  `RBCQUANTITY` int(11) DEFAULT '0',
  `PLATELETSQUANTITY` int(11) DEFAULT '0',
  `WHOLEBLOODQUANTITY` int(11) DEFAULT '0',
  PRIMARY KEY (`INVENTORYID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'A+',2,0,0,0),(2,'A-',0,0,0,0),(3,'B+',0,0,0,0),(4,'B-',0,0,0,0),(5,'O+',0,0,0,0),(6,'O-',0,0,0,0),(7,'AB+',0,0,0,0),(8,'AB-',0,0,0,0);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor` (
  `DONORID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(45) NOT NULL,
  `LASTNAME` varchar(45) DEFAULT NULL,
  `SSN` bigint(20) unsigned DEFAULT NULL,
  `ORG` bigint(20) unsigned NOT NULL,
  `ADDRESSLINE1` varchar(45) DEFAULT NULL,
  `ADDRESSLINE2` varchar(45) DEFAULT NULL,
  `CITY` varchar(45) DEFAULT NULL,
  `STATE` varchar(45) DEFAULT NULL,
  `ZIPCODE` int(11) DEFAULT NULL,
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `DOB` date DEFAULT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `PHNO` bigint(20) unsigned DEFAULT NULL,
  `BLOODGRP` varchar(45) NOT NULL,
  PRIMARY KEY (`DONORID`),
  UNIQUE KEY `ZIPCODE_UNIQUE` (`ZIPCODE`),
  KEY `FK_DONOR_ORG` (`ORG`),
  CONSTRAINT `FK_DONOR_ORG` FOREIGN KEY (`ORG`) REFERENCES `organization` (`ORGID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (3,'donor1','d',987,5,'d','d','d','d',776,'donor1','pwd1','2011-12-04','mahesh.karthikd@gmail.com',982,'A+'),(4,'donor2','d',7676,6,'d','d','d','d',67766567,'donor2','pwd1','2012-02-04','mahesh.karthikd@gmail.com',8987,'A+');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `ORGID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ORGNAME` varchar(45) NOT NULL,
  `ZIPCODE` int(11) NOT NULL,
  PRIMARY KEY (`ORGID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (5,'Boston',111),(6,'Newyork',222),(7,'Newark',333),(8,'California',444);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdetails`
--

DROP TABLE IF EXISTS `testdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdetails` (
  `TESTID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TESTEDBY` varchar(45) DEFAULT NULL,
  `TESTDATE` varchar(40) DEFAULT NULL,
  `TESTRESULT` varchar(45) DEFAULT NULL,
  `DONATIONDETAILS` bigint(20) unsigned NOT NULL,
  `ADDEDTOINVENTORY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TESTID`),
  KEY `FK_TD_DD` (`DONATIONDETAILS`),
  CONSTRAINT `FK_TD_DD` FOREIGN KEY (`DONATIONDETAILS`) REFERENCES `donationdetails` (`DONATIONID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdetails`
--

LOCK TABLES `testdetails` WRITE;
/*!40000 ALTER TABLE `testdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `testdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `EMPID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FIRSTNAME` varchar(45) NOT NULL,
  `LASTNAME` varchar(45) NOT NULL,
  `SSN` bigint(20) unsigned NOT NULL,
  `ORG` bigint(20) unsigned NOT NULL,
  `ADDRESSLINE1` varchar(45) DEFAULT NULL,
  `ADDRESSLINE2` varchar(45) DEFAULT NULL,
  `CITY` varchar(45) DEFAULT NULL,
  `STATE` varchar(45) DEFAULT NULL,
  `ZIPCODE` int(10) unsigned NOT NULL,
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `ROLE` bigint(20) unsigned NOT NULL,
  `STATUS` varchar(45) NOT NULL DEFAULT 'Active',
  `PHNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMPID`),
  KEY `FK_USER_ROLE` (`ROLE`),
  KEY `FK_USER_ORG` (`ORG`),
  CONSTRAINT `FK_USER_ORG` FOREIGN KEY (`ORG`) REFERENCES `organization` (`ORGID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_USER_ROLE` FOREIGN KEY (`ROLE`) REFERENCES `role` (`ROLEID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'Mahesh','Karthik',1,5,'xyz','xyz','Boston','MA',1112,'master','pwd1',1,'Active',988293),(9,'bbadmin','bb',98,5,'xyz','xyz','boston','MA',9212,'bbadmin1','pwd1',2,'Active',3893),(10,'bbadmin2','bb',3382,6,'xyz','xyz','newyork','NY',928,'bbadmin2','pwd1',2,'Active',93873),(11,'recep1','r',987,5,'r','rr','r','r',877,'recep1','pwd1',4,'Active',987),(12,'nurse1','n',97,5,'n','n','n','n',98765,'nurse1','pwd1',5,'Active',93736),(13,'lab1','l',9,5,'l','l','l','l',998,'lab1','pwd1',6,'Active',863),(15,'inv1','i',876554,5,'i','i','i','i',876,'inv1','pwd1',7,'Active',972),(18,'hosp1','h',9878,7,'h','h','h','h',876,'hosp1','pwd1',8,'Active',87),(19,'recep2','r',8787,6,'r','r','r','r',6776,'recep2','pwd2',4,'Active',7887),(20,'nurse2','n',8787,6,'n','n','n','n',7676,'nurse2','pwd1',5,'Active',8778),(21,'lab2','l',88,6,'l','l','l','l',8787,'lab2','pwd2',6,'Active',88),(22,'inv','i',9898,6,'i','i','i','i',9878676,'inv2','pwd1',7,'Active',98755);
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

-- Dump completed on 2011-04-29 11:21:46
