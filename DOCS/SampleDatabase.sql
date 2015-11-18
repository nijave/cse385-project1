-- MySQL dump 10.14  Distrib 10.0.4-MariaDB, for Win64 (x86)
--
-- Host: localhost    Database: password
-- ------------------------------------------------------
-- Server version	10.0.4-MariaDB-log

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
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `GID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(32) NOT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `ACTIVE` int(11) NOT NULL,
  PRIMARY KEY (`GID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Group 1','This is the first group',1),(2,'Group 2','This is the second group',1),(3,'Inactive Group','This group is inactive',0);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_history` (
  `UID` varchar(8) NOT NULL,
  `IP_ADDR` varchar(15) NOT NULL,
  `DATETIME` datetime NOT NULL,
  KEY `UID` (`UID`),
  CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_change_history`
--

DROP TABLE IF EXISTS `password_change_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_change_history` (
  `UID` varchar(8) NOT NULL,
  `PID` int(11) NOT NULL,
  `PREVIOUS_VALUE` varchar(32) DEFAULT NULL,
  `DATETIME` datetime NOT NULL,
  KEY `UID` (`UID`),
  KEY `PID` (`PID`),
  CONSTRAINT `password_change_history_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`),
  CONSTRAINT `password_change_history_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `passwords` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_change_history`
--

LOCK TABLES `password_change_history` WRITE;
/*!40000 ALTER TABLE `password_change_history` DISABLE KEYS */;
INSERT INTO `password_change_history` VALUES ('venengnj',1,'secret-password','2015-11-17 20:37:41'),('venengnj',1,'new-value2','2015-11-17 20:37:41'),('venengnj',2,'Shaiphi7ANg','2015-11-17 20:37:41'),('venengnj',2,'new-value1','2015-11-17 20:37:42'),('wilso199',3,'yu2Ver0bai','2015-11-17 20:37:42'),('wilso199',4,'Pah9ish3','2015-11-17 20:37:42'),('wilso199',5,'chaiphik1P','2015-11-17 20:37:42'),('wilso199',6,'ecaeBah0En','2015-11-17 20:37:42'),('wilso199',7,'Phoongai3ugh','2015-11-17 20:37:42');
/*!40000 ALTER TABLE `password_change_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_groups`
--

DROP TABLE IF EXISTS `password_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_groups` (
  `GID` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `DATE_ADDED` datetime NOT NULL,
  PRIMARY KEY (`GID`,`PID`),
  KEY `PID` (`PID`),
  CONSTRAINT `password_groups_ibfk_1` FOREIGN KEY (`GID`) REFERENCES `groups` (`GID`),
  CONSTRAINT `password_groups_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `passwords` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_groups`
--

LOCK TABLES `password_groups` WRITE;
/*!40000 ALTER TABLE `password_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwords`
--

DROP TABLE IF EXISTS `passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passwords` (
  `PID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(32) NOT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `USERNAME` varchar(32) NOT NULL,
  `PASSWORD` varchar(32) NOT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `DATE_UPDATED` datetime NOT NULL,
  `ACTIVE` int(11) NOT NULL,
  PRIMARY KEY (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwords`
--

LOCK TABLES `passwords` WRITE;
/*!40000 ALTER TABLE `passwords` DISABLE KEYS */;
INSERT INTO `passwords` VALUES (1,'Google.com','A test login for google.com','example@gmail.com','new-value3','2015-11-17 20:37:39','2015-11-17 20:37:39',1),(2,'LawsuitAid.com','Generated by http://www.fakenamegenerator.com/','Frintings','new-value2','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(3,'LawsuitAid.com','Generated by http://www.fakenamegenerator.com/','Usplany','new-value1','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(4,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Thicest','new-value1','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(5,'ConfidentialJournal.com','Generated by http://www.fakenamegenerator.com/','Halown','new-value1','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(6,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Mannever','new-value1','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(7,'PasswordPals.com','Generated by http://www.fakenamegenerator.com/','Sirstee','new-value1','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(8,'PaylessLimos.com','Generated by http://www.fakenamegenerator.com/','Conions59','ohShee2geX3','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(9,'SearchingPays.com','Generated by http://www.fakenamegenerator.com/','Ruchoculd','Hoa9johka4','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(10,'ProvidenceInsuranceAgents.com','Generated by http://www.fakenamegenerator.com/','Prost1963','am9ooPiey3','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(11,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Afrome','soWi2chae','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(12,'FindPolo.com','Generated by http://www.fakenamegenerator.com/','Hinsuff','chee7MeRa7','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(13,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Almomen','Za0vo0UPh','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(14,'PaylessLimos.com','Generated by http://www.fakenamegenerator.com/','Shistur1956','jeip2ahNg','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(15,'ConfidentialJournal.com','Generated by http://www.fakenamegenerator.com/','Therech1966','aezae3Pa','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(16,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Theagre','laeMaix0phae','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(17,'PaylessLimos.com','Generated by http://www.fakenamegenerator.com/','Nous1991','Xaemi0aiw','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(18,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Sooked','enoyae8pheC','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(19,'LawsuitAid.com','Generated by http://www.fakenamegenerator.com/','Didarculd','pe2EishahM','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(20,'LogTrades.com','Generated by http://www.fakenamegenerator.com/','Wourfact1983','gahRuop9Ph','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(21,'PaylessLimos.com','Generated by http://www.fakenamegenerator.com/','Thesseneated','Ien7doGh2','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(22,'PaylessLimos.com','Generated by http://www.fakenamegenerator.com/','Greptol','aht8uoZoo','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(23,'LawsuitAid.com','Generated by http://www.fakenamegenerator.com/','Plegelone','aiX5iimoh','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(24,'ProvidenceInsuranceAgents.com','Generated by http://www.fakenamegenerator.com/','Buiblemp82','ohwith9J','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(25,'ConfidentialJournal.com','Generated by http://www.fakenamegenerator.com/','Upwainuer','us5rieNg','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(26,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Causbas','udiSei7ph','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(27,'PasswordPals.com','Generated by http://www.fakenamegenerator.com/','Sasts1955','uub6Oshai','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(28,'SearchingPays.com','Generated by http://www.fakenamegenerator.com/','Folve1965','aroR5ieg','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(29,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Whopribed','saeka4ioYu7b','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(30,'PaylessLimos.com','Generated by http://www.fakenamegenerator.com/','Manoth','iPoh6wei','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(31,'CampMissions.com','Generated by http://www.fakenamegenerator.com/','Ondur1995','aiW4Boosu7sh','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(32,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Whaput','eQuah3Ei','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(33,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Hamelf','equ8aiki4Ui','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(34,'TypoFail.com','Generated by http://www.fakenamegenerator.com/','Wispeas81','Deej1Yah8cae','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(35,'LawsuitAid.com','Generated by http://www.fakenamegenerator.com/','Routimerend','Oongee9bu','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(36,'ProvidenceInsuranceAgents.com','Generated by http://www.fakenamegenerator.com/','Whyall','see0Pohrah5','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(37,'ProvidenceInsuranceAgents.com','Generated by http://www.fakenamegenerator.com/','Guesse85','fai2aa7Wei7','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(38,'LogTrades.com','Generated by http://www.fakenamegenerator.com/','Surney','eef8ahMoo','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(39,'LawsuitAid.com','Generated by http://www.fakenamegenerator.com/','Roughtne','ailaQu0cai6','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(40,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Weepted1934','Ohshie4jae6','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(41,'SearchingPays.com','Generated by http://www.fakenamegenerator.com/','Hises1977','ahQuoh7V','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(42,'ConfidentialJournal.com','Generated by http://www.fakenamegenerator.com/','Youlthalater','Xoh8fae3aen','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(43,'TypoFail.com','Generated by http://www.fakenamegenerator.com/','Lusand','aeFahGh8Mu','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(44,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Samough','Joh9eidahSh','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(45,'PasswordPals.com','Generated by http://www.fakenamegenerator.com/','Gratchim','eiReb8ophah','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(46,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Saling','eaHi4au3go2','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(47,'LogTrades.com','Generated by http://www.fakenamegenerator.com/','Sibes1989','heev4vohThe','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(48,'TypoFail.com','Generated by http://www.fakenamegenerator.com/','Siguld1942','eWe7aiK2i','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(49,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Mome1935','WeShou7sae','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(50,'PasswordPals.com','Generated by http://www.fakenamegenerator.com/','Becater','EeGhiec5','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(51,'PasswordPals.com','Generated by http://www.fakenamegenerator.com/','Alren1975','iuyee6OhK','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(52,'TypoFail.com','Generated by http://www.fakenamegenerator.com/','Astand','Aes7gah4Zui','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(53,'TypoFail.com','Generated by http://www.fakenamegenerator.com/','Whatefteld','aes3CeiS','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(54,'LogTrades.com','Generated by http://www.fakenamegenerator.com/','Alling54','eih4mahLie','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(55,'SearchingPays.com','Generated by http://www.fakenamegenerator.com/','Thadeciagre95','ahyo5ieCh','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(56,'PasswordPals.com','Generated by http://www.fakenamegenerator.com/','Cluounce','shed6Mejoo','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(57,'CampMissions.com','Generated by http://www.fakenamegenerator.com/','Ramie1933','Ieh8uhoo0aigh','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(58,'PaylessLimos.com','Generated by http://www.fakenamegenerator.com/','Sornsward','aeCapo2ZooL','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(59,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Septan','ceiLahb5oh','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(60,'FindPolo.com','Generated by http://www.fakenamegenerator.com/','Biall1980','Joo1Naitho','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(61,'ProvidenceInsuranceAgents.com','Generated by http://www.fakenamegenerator.com/','Shathe','Quiu8shoo','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(62,'ProvidenceInsuranceAgents.com','Generated by http://www.fakenamegenerator.com/','Satioustre','ohQu0vah','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(63,'PaylessLimos.com','Generated by http://www.fakenamegenerator.com/','Shost1957','eShah3reiNg','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(64,'ProvidenceInsuranceAgents.com','Generated by http://www.fakenamegenerator.com/','Toger1965','aez1Kai0','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(65,'TalkScope.com','Generated by http://www.fakenamegenerator.com/','Withir','siam8Ohjoo','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(66,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Hatily','hoVoh1Xu7oh','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(67,'PasswordPals.com','Generated by http://www.fakenamegenerator.com/','Beinale','dod9aiTi4k','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(68,'ConfidentialJournal.com','Generated by http://www.fakenamegenerator.com/','Neastathard','loh6Iezo','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(69,'FindPolo.com','Generated by http://www.fakenamegenerator.com/','Itimpookind','Ohk3sahzie','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(70,'LawsuitAid.com','Generated by http://www.fakenamegenerator.com/','Prourting','thoht4ahT','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(71,'ConfidentialJournal.com','Generated by http://www.fakenamegenerator.com/','Posely','Xiephah6Foh','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(72,'ConfidentialJournal.com','Generated by http://www.fakenamegenerator.com/','Ponswed','Aht8mufe1yee','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(73,'FindPolo.com','Generated by http://www.fakenamegenerator.com/','Expaletioll','ooFure5geen','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(74,'TypoFail.com','Generated by http://www.fakenamegenerator.com/','Thistagating1935','uMaef9uo','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(75,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Willon','Aec2no8wae','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(76,'PaylessLimos.com','Generated by http://www.fakenamegenerator.com/','Theromele79','yoo0wa7ha4Ei','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(77,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Nood1945','mo9iejaeLei','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(78,'LawsuitAid.com','Generated by http://www.fakenamegenerator.com/','Swerown','xiMa5ikai7ch','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(79,'TalkScope.com','Generated by http://www.fakenamegenerator.com/','Greaboy','KoSh8Ga4ee','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(80,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Musibitury63','Fohh3WiePe','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(81,'PasswordPals.com','Generated by http://www.fakenamegenerator.com/','Ittless1965','EaThah7oo','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(82,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Bitterephe30','uiBae5eiqu0','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(83,'TypoFail.com','Generated by http://www.fakenamegenerator.com/','Nowel1972','Aipae6iejie','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(84,'ProvidenceInsuranceAgents.com','Generated by http://www.fakenamegenerator.com/','Wayinshound','sah8ioShaiJ','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(85,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Likeriatues1969','thahf2Wai','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(86,'PetroleumFinder.com','Generated by http://www.fakenamegenerator.com/','Dooder','Faega6Sh','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(87,'CampMissions.com','Generated by http://www.fakenamegenerator.com/','Takedent','Cig6OSh0uH','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(88,'CampMissions.com','Generated by http://www.fakenamegenerator.com/','Eyess1952','ohgh4Ozagh','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(89,'CampMissions.com','Generated by http://www.fakenamegenerator.com/','Mach1980','UGeiZai3Ahc','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(90,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Arkly1985','ahLoovaiS3sh','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(91,'ProvidenceInsuranceAgents.com','Generated by http://www.fakenamegenerator.com/','Knearot1934','aef7EpaeB','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(92,'TypoFail.com','Generated by http://www.fakenamegenerator.com/','Adint1991','efahjoo7Ph','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(93,'SearchingPays.com','Generated by http://www.fakenamegenerator.com/','Whord1993','JahX0pe5ep8','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(94,'PasswordPals.com','Generated by http://www.fakenamegenerator.com/','Eftees1993','aeface3Sh','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(95,'TypoFail.com','Generated by http://www.fakenamegenerator.com/','Forto1971','moo8Aes2b','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(96,'PasswordPals.com','Generated by http://www.fakenamegenerator.com/','Dithey83','WeNaeyath6S','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(97,'LocationCalculator.com','Generated by http://www.fakenamegenerator.com/','Ringe1971','mef5Iev0ah','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(98,'LogTrades.com','Generated by http://www.fakenamegenerator.com/','Saitteld','ahthai6Ah','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(99,'ProvidenceInsuranceAgents.com','Generated by http://www.fakenamegenerator.com/','Lignat1950','tae7thah1N','2015-11-17 20:37:40','2015-11-17 20:37:40',0),(100,'ConfidentialJournal.com','Generated by http://www.fakenamegenerator.com/','Dolow1992','ahshei1Ji8','2015-11-17 20:37:40','2015-11-17 20:37:40',1),(101,'LogTrades.com','Generated by http://www.fakenamegenerator.com/','Lond1985','Pea2Phaish','2015-11-17 20:37:40','2015-11-17 20:37:40',0);
/*!40000 ALTER TABLE `passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `UID` varchar(8) NOT NULL,
  `GID` int(11) NOT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `ROLE` char(1) NOT NULL,
  PRIMARY KEY (`UID`,`GID`),
  KEY `GID` (`GID`),
  CONSTRAINT `user_groups_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`),
  CONSTRAINT `user_groups_ibfk_2` FOREIGN KEY (`GID`) REFERENCES `groups` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_passwords`
--

DROP TABLE IF EXISTS `user_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_passwords` (
  `UID` varchar(8) NOT NULL,
  `PID` int(11) NOT NULL,
  `DATE_ADDED` datetime NOT NULL,
  PRIMARY KEY (`UID`,`PID`),
  KEY `PID` (`PID`),
  CONSTRAINT `user_passwords_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`),
  CONSTRAINT `user_passwords_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `passwords` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_passwords`
--

LOCK TABLES `user_passwords` WRITE;
/*!40000 ALTER TABLE `user_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UID` varchar(8) NOT NULL,
  `DATE_ADDED` datetime NOT NULL,
  `ACTIVE` int(11) NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('venengnj','2015-11-17 20:37:36',1),('wasungbk','2015-11-17 20:37:37',1),('wilso199','2015-11-17 20:37:37',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-17 20:38:24
