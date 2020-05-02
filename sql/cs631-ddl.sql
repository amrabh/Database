CREATE DATABASE  IF NOT EXISTS `cs631` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cs631`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cs631
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `Building_Id` int NOT NULL AUTO_INCREMENT,
  `B_Name` varchar(50) NOT NULL,
  `Location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Building_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Rex Building','on campus'),(2,'Star Building','West Wing'),(3,'Sun Building','East Wing'),(4,'Morning Rise Building','South Side'),(5,'Edward Jefferson','odio a purus. Duis'),(6,'vulputate, lacus.','lectus pede, ultrices a,'),(7,'ante.','Nunc pulvinar arcu et'),(8,'fringilla est.','dui lectus rutrum urna,'),(9,'in','metus. Aliquam erat volutpat.'),(10,'euismod enim. Etiam gravida','quis arcu vel quam'),(11,'molestie arcu. Sed eu','metus sit amet ante.'),(12,'malesuada vel, convallis','felis orci, adipiscing non,'),(13,'egestas ligula.','turpis. In condimentum. Donec'),(14,'faucibus','Integer mollis. Integer tincidunt');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `Course_Code` varchar(10) NOT NULL,
  `Course_Name` varchar(50) NOT NULL,
  `Credit` int NOT NULL,
  `TA_Hr_Req` int DEFAULT NULL,
  `Dept_Code` int NOT NULL,
  PRIMARY KEY (`Course_Code`),
  KEY `FK_Course_Dept_idx` (`Dept_Code`),
  CONSTRAINT `FK_Course_Dept` FOREIGN KEY (`Dept_Code`) REFERENCES `department` (`Dept_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('AP700','Advanced Physics 700',5,15,3),('CS602','Computer Science 602 - Programming I',3,10,1),('CS603','Computer Science 603 - Programming II',3,10,1),('CS631','Computer Science 631 - DB Systems',3,10,1),('M605','Math 605 - Complex Mathematics',4,10,2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dept_Code` int NOT NULL AUTO_INCREMENT,
  `Dept_Name` varchar(50) NOT NULL,
  `Lat_Ann_Budget` decimal(10,2) DEFAULT NULL,
  `Chairman_SSN` varchar(10) NOT NULL,
  `Building_Id` int NOT NULL,
  PRIMARY KEY (`Dept_Code`),
  KEY `FK_Dept_Faculty_idx` (`Chairman_SSN`),
  KEY `FK_Dept_Build_idx` (`Building_Id`),
  CONSTRAINT `FK_Dept_Build` FOREIGN KEY (`Building_Id`) REFERENCES `building` (`Building_Id`),
  CONSTRAINT `FK_Dept_Faculty` FOREIGN KEY (`Chairman_SSN`) REFERENCES `faculty` (`SSN`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Computer Science',10000.00,'147253698',1),(2,'Mathematics',8294.95,'258369741',2),(3,'Physics',9292838.00,'206788228',3),(4,'Chemistry',33838.00,'266890388',4),(5,'Arts',2839.00,'326220379',4);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `SSN` varchar(10) NOT NULL,
  `Course_Load` int NOT NULL,
  `Rank` int NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `FK_Faculty_Staff` FOREIGN KEY (`SSN`) REFERENCES `staff` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('119623002',10,8),('125998030',10,8),('127724873',10,8),('138954888',10,8),('143131157',10,8),('147253698',10,8),('148087470',10,8),('174042245',10,8),('189338325',10,8),('200552249',10,8),('206788228',10,8),('226329619',10,8),('226804705',10,8),('232408255',10,8),('244399213',10,8),('258135519',10,8),('258369741',5,19),('264526490',10,8),('266890388',10,8),('273812255',10,8),('275425461',10,8),('278542917',10,8),('288895962',10,8),('290548115',10,8),('290643609',10,8),('295732407',10,8),('296182200',10,8),('309205608',10,8),('326220379',10,8),('344610558',10,8),('352168983',10,8),('362612499',10,8),('364147188',10,8),('372231052',10,8),('389311568',10,8),('391865795',10,8),('413201668',10,8),('413464938',10,8),('424976106',10,8),('443207634',10,8),('451070114',10,8),('451701624',10,8),('458664478',10,8),('458909362',10,8),('460927874',10,8),('464120343',10,8),('480371610',10,8),('488302183',10,8),('512759458',10,8),('513047378',10,8),('528329880',10,8),('544085899',10,8),('546855654',10,8),('561087838',10,8),('564013075',10,8),('566126054',10,8),('571391287',10,8),('580825862',10,8),('581129810',10,8),('624432538',10,8),('632106905',10,8),('647376603',10,8),('653208821',10,8),('664300060',10,8),('670155494',10,8),('673708442',10,8),('680947500',10,8),('688287731',10,8),('697214191',10,8),('699895400',10,8),('715126775',10,8),('719347063',10,8),('721585307',10,8),('725344771',10,8),('727325914',10,8),('730599452',10,8),('736055239',10,8),('736815723',10,8),('738921033',10,8),('740269610',10,8),('762350912',10,8),('762508131',10,8),('763222994',10,8),('767838644',10,8),('772101750',10,8),('773660869',10,8),('788157378',10,8),('822936731',10,8),('827907995',10,8),('838336904',10,8),('869544048',10,8),('870842986',10,8),('877811904',10,8),('884557127',10,8),('887677345',10,8),('888879582',10,8),('898774433',10,8),('919047528',10,8),('975144187',10,8),('977167613',10,8),('982999659',10,8),('984623537',10,8);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_department`
--

DROP TABLE IF EXISTS `faculty_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty_department` (
  `Faculty_SSN` varchar(10) NOT NULL,
  `Dept_Code` int NOT NULL,
  `Date_Assigned` datetime DEFAULT NULL,
  PRIMARY KEY (`Faculty_SSN`,`Dept_Code`),
  KEY `FK_Fd_Dept_idx` (`Dept_Code`),
  CONSTRAINT `FK_Fd_Dept` FOREIGN KEY (`Dept_Code`) REFERENCES `department` (`Dept_Code`),
  CONSTRAINT `FK_Fd_Faculty` FOREIGN KEY (`Faculty_SSN`) REFERENCES `faculty` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_department`
--

LOCK TABLES `faculty_department` WRITE;
/*!40000 ALTER TABLE `faculty_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculty_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `Student_Id` int NOT NULL,
  `Course_Code` varchar(10) NOT NULL,
  `Sec_No` int NOT NULL,
  `Date_Registered` datetime DEFAULT NULL,
  PRIMARY KEY (`Student_Id`,`Course_Code`,`Sec_No`),
  KEY `FK_Reg_Section_idx` (`Course_Code`,`Sec_No`),
  CONSTRAINT `FK_Reg_Section` FOREIGN KEY (`Course_Code`, `Sec_No`) REFERENCES `section` (`Course_Code`, `Sec_No`),
  CONSTRAINT `FK_Reg_Student` FOREIGN KEY (`Student_Id`) REFERENCES `student` (`Student_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (8,'CS603',20,'2020-05-02 16:25:56');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `Building_Id` int NOT NULL,
  `Room_No` int NOT NULL,
  `Capacity` int DEFAULT NULL,
  `AV_Equipment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Building_Id`,`Room_No`),
  CONSTRAINT `FK_Room_Build` FOREIGN KEY (`Building_Id`) REFERENCES `building` (`Building_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,71,27,'Pointers'),(1,101,20,'Projectors'),(2,128,41,''),(2,238,24,'Monitors, Pointers, Cable TV, Projectors, Mics'),(3,33,25,''),(3,49,20,'Cable TV, Pointers, Monitors, Computer, Projectors'),(3,118,27,'DVD Player, Mics, Projectors, Pointers'),(3,211,21,'Cable TV'),(4,81,38,'Monitors'),(4,109,44,''),(4,134,41,'Whiteboard, Monitors, Computer, Projectors'),(4,172,36,'Mics, Projectors'),(4,174,25,''),(5,23,34,'Cable TV, Projectors'),(5,39,33,'Mics, Whiteboard, Monitors, Pointers, Projectors'),(5,116,33,'Cable TV, Whiteboard, Pointers'),(5,146,27,''),(6,45,46,'Projectors, Mics, Cable TV, Whiteboard, DVD Player'),(6,128,31,'DVD Player'),(6,224,35,'Projectors, Cable TV, Computer'),(6,241,43,'Mics, DVD Player, Monitors, Projectors'),(7,98,34,'Pointers, Cable TV'),(7,231,44,'Mics, Monitors, Whiteboard, Pointers, Computer'),(7,296,29,'Monitors, Mics, DVD Player, Whiteboard'),(8,62,37,'Cable TV, Pointers, Monitors, DVD Player'),(8,63,33,'Computer, Pointers'),(8,71,47,'Whiteboard, Pointers, Cable TV, DVD Player'),(8,187,35,'Mics, Pointers, Monitors, Cable TV, Computer'),(8,225,44,'Whiteboard, Mics, Projectors, Cable TV, Computer'),(8,251,33,'Projectors, Monitors, Cable TV, Pointers'),(9,46,42,'DVD Player, Computer, Monitors, Pointers, Mics'),(9,74,25,'Projectors, DVD Player, Monitors, Pointers'),(9,107,45,'Monitors, Whiteboard, Computer, Mics, Pointers'),(9,143,48,'Monitors'),(9,172,21,'Cable TV, Mics, Projectors, Pointers'),(9,198,30,'Monitors, Pointers'),(9,207,29,'Whiteboard, Mics, Pointers'),(9,258,34,'DVD Player, Computer, Whiteboard, Cable TV'),(9,280,47,'Mics, Cable TV, Monitors, Whiteboard'),(10,226,28,'Pointers'),(10,234,42,''),(11,111,34,'Computer, DVD Player, Whiteboard, Projectors'),(12,165,46,'Mics, Pointers'),(12,232,30,'Cable TV, Projectors, Monitors'),(13,71,40,'Pointers'),(13,112,47,'Mics, Computer, Monitors, Cable TV'),(13,117,38,'DVD Player, Pointers, Computer'),(13,199,25,'Computer, Whiteboard'),(13,221,22,'Whiteboard'),(14,89,36,'Computer, Pointers'),(14,140,50,'Whiteboard, Monitors');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `Sec_No` int NOT NULL,
  `Course_Code` varchar(10) NOT NULL,
  `Year` int NOT NULL,
  `Semester` varchar(20) NOT NULL,
  `Max_Enrollment` int DEFAULT NULL,
  `Faculty_SSN` varchar(10) NOT NULL,
  PRIMARY KEY (`Sec_No`,`Course_Code`),
  KEY `FK_Section_Course_idx` (`Course_Code`),
  KEY `FK_Section_Faculty_idx` (`Faculty_SSN`),
  CONSTRAINT `FK_Section_Course` FOREIGN KEY (`Course_Code`) REFERENCES `course` (`Course_Code`),
  CONSTRAINT `FK_Section_Faculty` FOREIGN KEY (`Faculty_SSN`) REFERENCES `faculty` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'CS631',2020,'Spring',10,'147253698'),(2,'CS631',2020,'Spring',20,'147253698'),(3,'CS602',2020,'Summer',18,'464120343'),(4,'CS631',2020,'Fall',3,'581129810'),(5,'CS603',2020,'Summer',20,'670155494'),(6,'CS631',2020,'Spring',17,'148087470'),(7,'CS631',2020,'Fall',17,'670155494'),(8,'M605',2020,'Fall',19,'632106905'),(9,'CS631',2020,'Summer',20,'564013075'),(10,'CS603',2020,'Spring',15,'278542917'),(11,'M605',2020,'Summer',15,'244399213'),(12,'CS602',2020,'Fall',17,'389311568'),(13,'CS631',2020,'Fall',18,'451070114'),(14,'CS602',2020,'Summer',19,'372231052'),(15,'CS603',2020,'Spring',20,'326220379'),(16,'CS631',2020,'Spring',15,'624432538'),(17,'CS603',2020,'Fall',18,'460927874'),(18,'CS602',2020,'Spring',20,'413464938'),(19,'CS631',2020,'Summer',19,'200552249'),(20,'CS603',2020,'Fall',16,'647376603'),(21,'CS603',2020,'Fall',18,'653208821'),(22,'CS602',2020,'Fall',15,'413464938'),(23,'CS603',2020,'Spring',20,'295732407'),(24,'CS602',2020,'Fall',17,'264526490'),(25,'CS631',2020,'Fall',20,'389311568'),(26,'M605',2020,'Fall',16,'458664478'),(27,'CS603',2020,'Summer',18,'226329619'),(28,'CS603',2020,'Summer',16,'372231052'),(29,'M605',2020,'Spring',16,'564013075'),(30,'M605',2020,'Spring',20,'460927874'),(31,'M605',2020,'Summer',19,'200552249'),(32,'CS603',2020,'Summer',17,'443207634'),(33,'CS603',2020,'Summer',16,'290548115'),(34,'CS603',2020,'Spring',19,'670155494'),(35,'M605',2020,'Summer',19,'290643609'),(36,'M605',2020,'Summer',15,'362612499'),(37,'CS602',2020,'Summer',16,'488302183'),(38,'CS631',2020,'Spring',18,'443207634'),(39,'CS602',2020,'Spring',16,'189338325'),(40,'M605',2020,'Summer',15,'362612499'),(41,'M605',2020,'Fall',18,'458664478'),(42,'CS602',2020,'Spring',15,'451070114'),(43,'M605',2020,'Summer',16,'546855654'),(44,'CS602',2020,'Fall',15,'232408255'),(45,'CS602',2020,'Fall',20,'443207634'),(46,'M605',2020,'Fall',16,'624432538'),(47,'CS631',2020,'Spring',17,'290643609'),(48,'CS602',2020,'Spring',19,'326220379'),(49,'CS631',2020,'Fall',16,'528329880'),(50,'CS603',2020,'Summer',17,'464120343'),(51,'CS631',2020,'Spring',17,'653208821'),(52,'M605',2020,'Fall',19,'546855654'),(53,'M605',2020,'Fall',17,'673708442'),(54,'CS602',2020,'Spring',19,'451701624'),(55,'M605',2020,'Fall',18,'189338325'),(56,'CS631',2020,'Summer',17,'344610558'),(57,'CS603',2020,'Fall',19,'528329880'),(58,'CS631',2020,'Summer',20,'488302183'),(59,'CS631',2020,'Spring',20,'266890388'),(60,'CS602',2020,'Spring',18,'670155494'),(61,'CS603',2020,'Summer',18,'670155494'),(62,'CS631',2020,'Summer',15,'278542917'),(63,'M605',2020,'Spring',16,'670155494'),(64,'CS602',2020,'Spring',19,'290643609'),(65,'CS603',2020,'Summer',19,'258369741'),(66,'CS631',2020,'Spring',20,'273812255'),(67,'CS603',2020,'Fall',17,'226804705'),(68,'CS602',2020,'Summer',20,'391865795'),(69,'M605',2020,'Spring',18,'362612499'),(70,'M605',2020,'Spring',15,'364147188'),(71,'CS631',2020,'Fall',20,'148087470'),(72,'CS602',2020,'Spring',16,'566126054'),(73,'CS631',2020,'Fall',15,'480371610'),(74,'M605',2020,'Spring',16,'189338325'),(75,'CS603',2020,'Summer',19,'226329619'),(76,'CS602',2020,'Fall',19,'458909362'),(77,'CS602',2020,'Spring',19,'362612499'),(78,'CS603',2020,'Summer',19,'632106905'),(79,'CS631',2020,'Spring',18,'232408255'),(80,'CS603',2020,'Fall',15,'264526490'),(81,'CS602',2020,'Spring',20,'581129810'),(82,'CS602',2020,'Spring',18,'546855654'),(83,'CS631',2020,'Fall',15,'513047378'),(84,'CS631',2020,'Summer',20,'278542917'),(85,'M605',2020,'Summer',19,'296182200'),(86,'CS602',2020,'Summer',19,'464120343'),(87,'CS603',2020,'Fall',17,'653208821'),(88,'CS631',2020,'Fall',18,'413464938'),(89,'CS603',2020,'Spring',16,'290643609'),(90,'CS602',2020,'Fall',20,'647376603'),(91,'CS631',2020,'Spring',17,'488302183'),(92,'M605',2020,'Summer',18,'226804705'),(93,'M605',2020,'Fall',20,'488302183'),(94,'CS631',2020,'Summer',16,'566126054'),(95,'CS603',2020,'Summer',16,'632106905'),(96,'CS602',2020,'Spring',17,'528329880'),(97,'CS631',2020,'Summer',20,'174042245'),(98,'CS631',2020,'Summer',20,'278542917'),(99,'CS602',2020,'Summer',15,'451701624'),(100,'CS603',2020,'Spring',20,'424976106'),(101,'CS602',2020,'Summer',20,'451070114'),(102,'CS603',2020,'Spring',16,'258369741');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `SSN` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('119623002','Chester Morse','Ap #582-4451 At, Avenue','874-552-9712','elementum@Donecegestas.edu',13071.09),('125998030','Abra Ramos','189-1117 In Ave','265-213-1611','nibh@Donecporttitortellus.edu',30551.59),('127724873','Dylan Barrera','682-8451 Nec Road','630-616-1284','eu.odio.tristique@adipiscingenimmi.ca',81289.67),('138954888','Wang Hanson','8000 Velit Rd.','703-267-2037','placerat.orci.lacus@fringillaeuismodenim.ca',35330.26),('143131157','Barry Cleveland','809-3046 Ullamcorper. St.','795-470-2791','Proin.dolor.Nulla@nislsemconsequat.co.uk',24412.48),('147253698','Orio','School',NULL,'orio@njit.edu',993.00),('148087470','Brock Kidd','Ap #581-9807 Libero Road','884-586-4476','vulputate@ante.edu',28632.67),('174042245','Emmanuel Boyer','583-7624 Pellentesque Street','648-741-6786','nisi.sem@Mauris.co.uk',9803.59),('189338325','Adrian Kline','989-2802 Massa Rd.','812-451-2605','malesuada.malesuada.Integer@eratvel.com',94269.03),('200552249','Hashim Ward','6349 Placerat Road','802-484-9674','eget@Crasvulputatevelit.net',23670.14),('206788228','Rhea Christian','951-2593 Metus. St.','434-104-7136','nunc.id@quislectus.net',21620.60),('226329619','Shoshana Bentley','Ap #198-2962 Justo Av.','745-689-4817','In.ornare@Morbiquisurna.ca',46959.93),('226804705','Fuller Nelson','Ap #999-730 Egestas. Road','486-538-0500','aliquet@aliquamenimnec.com',67294.19),('232408255','Haley Barber','P.O. Box 982, 1848 Nulla Road','849-847-1431','tempor.augue.ac@velvulputate.net',69954.55),('244399213','Shana Roach','P.O. Box 461, 8890 Integer Rd.','232-446-4164','Donec@Quisque.org',26231.74),('258135519','Vernon Frye','351-887 Magna. Rd.','833-341-6702','Cras.convallis.convallis@Proinmi.net',62274.48),('258369741','Mark Antonne','New Jersey','987-254-4785','mantonne@njit.edu',475.00),('264526490','Edan Browning','P.O. Box 369, 3189 Sem St.','247-919-3284','dictum.eu@massarutrum.net',79333.63),('266890388','Quyn Pugh','5536 Mollis. Av.','988-547-6769','fringilla.ornare.placerat@elementum.org',10741.28),('273812255','Charde Terrell','258-9096 Eros. Road','151-651-0830','libero.Integer@ac.com',75405.66),('275425461','Lesley Herrera','P.O. Box 801, 2284 Eget Rd.','530-154-6131','neque@Donec.net',72561.48),('278542917','Patrick Craft','Ap #309-9817 Sit St.','117-754-7894','massa.non.ante@consectetuer.org',27900.82),('288895962','Kennedy Landry','143 Sem Road','563-246-9492','est.vitae@lectusconvallis.org',39475.36),('290548115','Zachery Turner','P.O. Box 625, 8256 Montes, Av.','703-963-3951','amet@disparturient.co.uk',53207.56),('290643609','Myles Cummings','980-5046 Risus. Ave','233-528-5778','id@augueeu.org',80323.04),('295732407','Illana Marsh','928-9860 Nullam Rd.','686-251-9288','mattis.velit.justo@Nunc.ca',84884.36),('296182200','Kevin Blake','Ap #474-3068 Praesent Road','202-292-9513','ante@felisorci.org',38867.70),('309205608','Joshua Ward','9070 Integer Street','611-550-2246','feugiat.non@ametmetusAliquam.net',63652.11),('326220379','Beverly Schmidt','6270 Pellentesque Street','240-165-5605','Duis.dignissim.tempor@Ut.net',30480.13),('344610558','Luke Little','886-9579 Velit Ave','762-270-9682','Suspendisse.commodo.tincidunt@neque.co.uk',75137.83),('352168983','Orli Hopkins','6377 Sociis St.','335-213-6895','nec.mauris@Maecenasiaculisaliquet.org',76907.18),('362612499','Stacy Contreras','P.O. Box 486, 2417 Molestie Ave','385-140-6034','eget.odio@convallisligulaDonec.com',60691.72),('364147188','Shad Donovan','P.O. Box 497, 4805 Libero St.','443-405-6553','Fusce.mollis@diamProindolor.ca',97078.13),('372231052','Mufutau Diaz','Ap #485-4842 Vel, Street','315-283-0370','lorem@suscipitestac.net',59551.15),('389311568','Ferdinand Fischer','337-5448 Gravida. Road','857-482-5925','Aenean@metusIn.co.uk',66210.35),('391865795','Carolyn Sims','824-1481 Nulla Rd.','295-935-9027','urna.Nunc@dolor.com',74563.80),('413201668','Miriam Lewis','677-7266 Pharetra Road','827-275-3690','lobortis.Class@Nunc.com',40682.79),('413464938','Fleur Martinez','Ap #748-3994 Quisque Avenue','994-892-5530','vulputate.velit.eu@pretium.co.uk',77754.82),('424976106','Griffith Snyder','498-2462 At St.','215-939-0436','Curae.Phasellus@loremeumetus.org',68939.00),('443207634','Chaney Mayo','P.O. Box 630, 8087 Mollis Street','962-631-8077','nec@leo.co.uk',47064.89),('451070114','Colorado Harper','P.O. Box 950, 495 Vel Street','816-532-7903','penatibus@aliquamerosturpis.org',98038.29),('451701624','Reagan Hickman','486-6572 Elit, Avenue','916-131-2307','et.ultrices.posuere@venenatislacusEtiam.com',83602.46),('458664478','Eugenia Bentley','7652 Vestibulum Ave','983-697-1877','molestie.Sed@egetvolutpatornare.net',53973.30),('458909362','Britanni Logan','P.O. Box 946, 9822 Morbi Rd.','688-323-7808','lobortis.tellus.justo@rhoncusNullam.org',58347.83),('460927874','Lucas Puckett','5518 Nunc Av.','571-403-4830','et@lacusCrasinterdum.com',79681.40),('464120343','Magee Haney','Ap #867-1112 Dictum St.','307-892-5984','purus.Duis.elementum@elit.net',34641.80),('480371610','Anika Mullins','368-964 Mauris St.','540-530-7385','hendrerit.consectetuer.cursus@at.edu',59495.48),('488302183','Sheila Evans','P.O. Box 939, 385 Ligula. Rd.','590-729-6149','volutpat.ornare.facilisis@liberoProinsed.co.uk',99341.30),('512759458','Leilani Zimmerman','132-5320 Iaculis Rd.','165-796-0825','cursus.in.hendrerit@Maecenasmifelis.com',12568.98),('513047378','Quemby Ball','Ap #110-4132 Sed Av.','316-336-9918','dapibus@mauris.org',20460.18),('528329880','Zephania Travis','621-362 Posuere Rd.','871-197-9994','et.magnis.dis@ut.net',86887.81),('544085899','Donovan Santos','1659 Vestibulum St.','723-544-6999','netus@Donectempuslorem.ca',52876.88),('546855654','Mason Freeman','418-3702 Nulla. St.','711-208-5851','lacus.Quisque@nuncQuisqueornare.org',3297.51),('561087838','Mariko Clarke','4912 Libero Av.','327-392-4503','Cras@Integer.org',93213.37),('564013075','Jeremy Marquez','762-2620 Feugiat Avenue','258-485-5331','nec.mollis@sedhendrerita.ca',95363.94),('566126054','Kim Marquez','894-8443 Lorem Rd.','211-346-2095','Quisque.ornare.tortor@Curabitur.com',70009.92),('571391287','Judith James','7411 Sapien, Avenue','482-682-8904','Phasellus@aliquetvel.ca',62917.72),('580825862','Maxwell Stevenson','7084 Urna Rd.','611-213-5134','dictum.eu.eleifend@et.edu',71597.56),('581129810','Carl Cooley','9856 Gravida St.','217-890-2422','lorem.fringilla@ridiculusmusDonec.org',84136.43),('624432538','Felicia Cole','834-2618 Vulputate St.','334-397-6485','lorem@arcu.edu',59657.07),('632106905','Hop Hurley','4354 Magna. St.','270-648-6105','ultrices.Duis.volutpat@libero.co.uk',68675.57),('647376603','Yoshio Reese','4665 Eget Road','655-861-2079','consequat.lectus.sit@nibh.org',70937.51),('653208821','Magee Potter','Ap #117-9547 Diam. Ave','791-827-7209','commodo.hendrerit.Donec@pulvinararcuet.edu',51846.97),('664300060','Jason Hess','580-9792 Integer Street','885-359-1950','tortor.at.risus@blanditenim.org',88364.37),('670155494','Graham Benjamin','Ap #562-6075 Curabitur Road','647-276-6490','lacus.Cras@Suspendissenon.edu',61310.87),('673708442','Jolene Odonnell','Ap #683-442 Diam Street','355-369-7139','Duis@maurissit.co.uk',14873.65),('680947500','Kim Landry','P.O. Box 758, 5974 Quam. St.','107-750-6663','dignissim.magna.a@risus.net',52461.56),('688287731','Ian Castaneda','Ap #897-5885 Vitae, Rd.','209-587-1263','fames.ac@ac.co.uk',7365.34),('697214191','Marcia Sanchez','6884 Rutrum Avenue','668-204-0217','quam@euaccumsansed.net',60998.11),('699895400','Abraham Vance','Ap #949-1248 Commodo Rd.','981-454-2143','ac@maurisrhoncusid.com',87389.00),('715126775','Alfonso Daugherty','P.O. Box 239, 1626 Eros Avenue','457-977-2102','eu.odio.Phasellus@nec.ca',41046.73),('719347063','Lacy Combs','Ap #342-6959 Dis Ave','345-704-2912','Vivamus.sit.amet@Donec.ca',58955.78),('721585307','Martena Lane','7927 Sed St.','331-909-9305','orci@euaugueporttitor.com',48394.41),('725344771','Heidi Coleman','P.O. Box 773, 8220 Vivamus St.','727-582-5493','lorem.vehicula.et@dictummi.com',58923.66),('727325914','Hakeem Keith','P.O. Box 447, 321 Non St.','452-472-6815','Morbi.sit.amet@duilectusrutrum.net',23340.60),('730599452','Brandon Tyson','368-4075 Tellus. Street','939-257-8003','eu.ligula.Aenean@nibhsitamet.com',79305.86),('736055239','Harriet Mathis','Ap #784-903 Primis Rd.','535-145-2762','ipsum.dolor.sit@Donectempus.edu',62754.83),('736815723','Vielka Alston','880-2262 Montes, Ave','536-149-7464','vel@inaliquetlobortis.co.uk',33715.79),('738921033','Salvador Larson','902-4326 Non Avenue','652-125-6016','egestas@ornare.edu',89663.20),('740269610','Jordan Buckner','P.O. Box 271, 5704 Ante. Road','530-438-6982','dui@utcursusluctus.org',28967.67),('762350912','Drew Gill','P.O. Box 316, 563 Mauris Street','998-329-4433','est.Mauris.eu@Inornaresagittis.edu',81832.66),('762508131','Mufutau Reed','P.O. Box 838, 4570 Massa. St.','556-488-1723','Mauris.vestibulum@Fuscemi.com',51407.15),('763222994','Daphne Atkins','P.O. Box 870, 5471 In Av.','527-809-2240','cursus.et@Integersemelit.co.uk',11591.81),('767838644','Evan Mueller','P.O. Box 192, 3507 Risus, St.','518-509-4975','blandit.enim.consequat@sodalesnisimagna.ca',98578.47),('772101750','Kay Malone','Ap #223-4486 Donec Avenue','440-165-6418','lacus.Quisque.imperdiet@purusDuiselementum.co.uk',22404.52),('773660869','Patrick Bowen','P.O. Box 104, 6322 Nulla Rd.','150-107-8381','risus.In.mi@Maecenasliberoest.org',2277.64),('788157378','Armand Delacruz','6229 Blandit Avenue','681-155-5840','leo.Morbi@scelerisque.edu',45908.59),('822936731','Kylan Allen','7648 Aliquam Road','546-135-0416','cubilia.Curae@euismod.ca',55214.64),('827907995','Tara Weiss','Ap #903-3266 Est. Avenue','759-363-2102','et.tristique@Innec.net',75545.64),('838336904','Edward Jefferson','1714 Nunc St.','915-610-3974','erat@asollicitudin.net',59886.50),('869544048','Hope Howard','5547 Libero St.','864-171-4700','tortor.Integer.aliquam@Aenean.ca',92933.87),('870842986','Eagan French','P.O. Box 932, 6139 Sit St.','899-499-3626','pede@mitempor.edu',80934.00),('877811904','Erich Dominguez','5471 Mauris Rd.','805-197-5370','et@ut.edu',99562.27),('884557127','Abbot Jackson','P.O. Box 422, 2594 Mauris. St.','466-518-4619','consequat.auctor@mollisPhaselluslibero.co.uk',87186.94),('887677345','Rogan Mitchell','8037 Nulla Rd.','760-365-8783','dolor.Nulla@Sedmalesuadaaugue.com',71271.98),('888879582','Hyatt Olson','3372 Libero. St.','257-906-9252','aliquet@hendreritnequeIn.edu',83071.01),('898774433','Brielle Lloyd','4346 Et, Rd.','634-784-5341','libero.est.congue@tristiquesenectuset.co.uk',48058.64),('919047528','Audra Pierce','7128 Ut St.','157-574-6914','ligula.Nullam@vulputate.ca',15014.60),('975144187','Raphael Greer','162-4349 Dignissim. Av.','951-961-7532','gravida.nunc.sed@cursus.net',603.55),('977167613','Kadeem Day','Ap #989-9044 Quisque Av.','185-347-9232','blandit.Nam.nulla@euismod.org',32424.54),('982999659','Shaeleigh Hunt','5614 Sed Rd.','125-546-0099','rutrum.eu.ultrices@magnatellusfaucibus.edu',96254.17),('984623537','India Beasley','897 Risus. Rd.','417-600-0148','in.faucibus@fermentumrisusat.ca',28932.75);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Student_Id` int NOT NULL AUTO_INCREMENT,
  `SSN` varchar(10) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `High_School` varchar(50) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Dept_Code` int NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Student_Id`),
  UNIQUE KEY `SSN_UNIQUE` (`SSN`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  KEY `FK_Student_Dept_idx` (`Dept_Code`),
  CONSTRAINT `FK_Student_Dept` FOREIGN KEY (`Dept_Code`) REFERENCES `department` (`Dept_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'123456789','John','Doe','NJ',NULL,2020,1,'johndoe@gmail.com','347-559-9632'),(6,'877667794','Oprah','Case','P.O. Box 110, 7971 Aliquam St.','Sed Dolor Incorporated',2024,2,'quam.Curabitur@ametconsectetueradipiscing.com','489-627-8363'),(7,'408760600','Mallory','Pruitt','195-1779 Curabitur Rd.','Eu Augue Porttitor Ltd',2020,2,'nibh.Donec.est@necimperdietnec.ca','416-109-7547'),(8,'134429338','Anthony','Bender','2248 Velit St.','Ullamcorper Nisl Inc.',2020,4,'dui.Cum.sociis@ornare.edu','474-970-5407'),(9,'723398944','Nyssa','Foster','Ap #854-8496 A, Street','Sed Malesuada Industries',2021,4,'elit@inhendreritconsectetuer.co.uk','172-595-5775'),(10,'255841327','Charde','Ruiz','6601 Odio Road','Fringilla Associates',2024,1,'amet@Donecfelis.ca','292-126-9108'),(11,'861406555','Quamar','Kidd','Ap #419-2221 Suscipit, Ave','Orci Quis Lectus Incorporated',2020,3,'Mauris@at.edu','468-673-6256'),(12,'456686856','Caldwell','Baird','9611 Eu, Rd.','Massa Quisque Ltd',2024,5,'posuere@posuerecubiliaCurae.com','912-783-6998'),(13,'127684115','Orlando','Donaldson','518-4609 Per Av.','Phasellus Vitae Mauris LLC',2025,2,'arcu.eu.odio@et.com','760-320-2510'),(14,'994611630','Derek','Bradshaw','1148 Nam Ave','Sit Consulting',2024,4,'ipsum.Suspendisse.non@ligulaNullamfeugiat.net','875-213-8565'),(15,'261403008','Frances','Erickson','1125 Pellentesque Street','Ultrices Iaculis Associates',2024,5,'lacus.Ut@nisi.com','711-426-7830'),(16,'271832246','Brooke','Lang','709-2292 Proin Rd.','Orci Tincidunt Institute',2022,2,'vehicula@placeratvelit.org','508-629-5871'),(17,'124318265','Mariam','Dejesus','P.O. Box 754, 4484 Ac St.','Dapibus Quam Quis Industries',2023,2,'at@Quisque.ca','488-372-4620'),(18,'897121829','Tate','Craig','381-6963 Nisi. St.','Maecenas Ornare Egestas Consulting',2024,4,'ullamcorper.nisl@erosnon.com','834-402-3091'),(19,'619017180','Mary','Hunt','Ap #406-8722 Sed St.','Aliquam Nec Enim Ltd',2023,3,'Phasellus.ornare.Fusce@vehicula.ca','904-249-0822'),(20,'818607640','Tasha','Kelley','Ap #916-2797 Etiam Rd.','Nunc Incorporated',2021,3,'ipsum@consequatnecmollis.co.uk','298-660-6995'),(21,'806470907','Alec','Hester','P.O. Box 561, 1849 Vitae Av.','Pede Inc.',2022,2,'dictum.ultricies.ligula@fringillamilacinia.net','685-373-4612'),(22,'986105924','Lucy','Walter','3335 Pharetra. Rd.','Enim Corporation',2020,1,'orci.Donec@quamvelsapien.net','889-124-4692'),(23,'614260010','Hermione','Rollins','8544 Eget Av.','Parturient Montes Nascetur Limited',2023,5,'dolor.dolor.tempus@veliteusem.net','686-602-5653'),(24,'322258290','Lynn','Bullock','402-7218 Risus. Ave','A Felis Inc.',2024,4,'pellentesque.Sed.dictum@urnaconvalliserat.edu','548-983-6402'),(25,'825733183','Harlan','Simon','P.O. Box 491, 1574 Luctus St.','Fusce Limited',2021,3,'posuere@semperauctorMauris.com','929-478-2452'),(26,'234296558','Kiona','Stuart','P.O. Box 688, 6685 Tellus. St.','Lobortis Tellus Consulting',2025,2,'porta@consectetueradipiscingelit.org','363-787-4847'),(27,'749616646','Teagan','Woods','222-5578 Nunc, Rd.','Sed Eget Lacus Inc.',2024,1,'habitant.morbi@Donec.net','698-142-4513'),(28,'567469193','Patricia','Garza','P.O. Box 318, 1557 Luctus Avenue','Eu Neque Pellentesque Consulting',2022,3,'Curabitur.ut.odio@aauctor.com','183-181-7105'),(29,'290874366','Alana','Nicholson','P.O. Box 544, 4287 Erat. Road','Amet Risus Associates',2020,2,'Proin.dolor@elitEtiamlaoreet.co.uk','949-131-3341'),(30,'739043979','Jael','Franco','Ap #559-7948 Cras Av.','Aenean Egestas Hendrerit Limited',2022,3,'enim.mi@seddictumeleifend.net','391-237-8103'),(31,'481507342','Ivan','Bauer','2834 Suspendisse Ave','Tempor Erat Company',2022,3,'pede@luctusaliquet.com','927-472-9916'),(32,'555683157','Lucy','Pratt','5486 Cras Street','Ornare Fusce Mollis Institute',2021,5,'eu@sapienCrasdolor.ca','640-631-2401'),(33,'126811066','Derek','Solomon','Ap #833-7911 Convallis, St.','Dignissim LLC',2025,1,'mus.Proin@odioPhasellus.ca','962-382-3667'),(34,'433274329','Ora','Stein','320-7560 Semper Road','Integer Mollis Company',2025,3,'sed.pede@erategetipsum.org','190-308-6547'),(35,'929313664','Allen','Bradford','5236 Scelerisque Rd.','Duis LLP',2022,3,'dui.nec@Morbinonsapien.edu','233-873-6911'),(36,'841537189','Jamalia','Harris','Ap #263-1083 Lectus Av.','Vel Nisl Quisque Corporation',2022,5,'cursus.purus@famesac.org','734-886-4176'),(37,'602399756','Ashton','Compton','558-6052 Nunc St.','Mi Company',2022,2,'vel.est.tempor@rhoncus.net','146-551-3772'),(38,'894843373','Doris','Singleton','7679 Cras Street','At Lacus LLP',2024,2,'Suspendisse@Quisque.co.uk','576-938-5111'),(39,'581601129','Clementine','May','6291 Amet Avenue','Morbi Non PC',2022,4,'dapibus.id.blandit@Vestibulumanteipsum.co.uk','575-731-6710'),(40,'617972211','Fallon','Lyons','Ap #258-3048 Interdum Avenue','Vivamus Euismod Urna Inc.',2021,2,'volutpat.ornare@enim.co.uk','857-578-8894'),(41,'454468458','Alea','England','P.O. Box 496, 1248 Laoreet Street','Massa Ltd',2025,5,'ultrices@Nulla.com','196-983-4443'),(42,'913654374','Avye','Freeman','4428 Nunc Avenue','Mi Ltd',2024,3,'Aliquam.ornare.libero@Nam.org','760-265-1101'),(43,'563528644','Hamish','Sargent','924-604 Nisl Avenue','Rutrum Justo PC',2021,1,'augue@vel.ca','443-735-8866'),(44,'656527361','Noel','Guzman','572-2658 Tempor Rd.','Donec Institute',2021,2,'dui@duiCraspellentesque.org','578-428-7003'),(45,'502549885','Jonas','Cannon','P.O. Box 620, 2433 Primis Av.','Risus Quis Industries',2025,3,'mollis@Aliquam.ca','196-866-9745'),(46,'196613106','Danielle','Chavez','409-2764 Magnis St.','Sem Ut Dolor PC',2023,4,'ornare.In@lobortisrisusIn.ca','272-999-0277'),(47,'771342460','Yetta','Williams','4003 Commodo Street','Ut LLP',2024,1,'nibh@aliquetmetus.org','420-506-1592'),(48,'217338324','Sloane','Lindsey','357-7139 Sed Av.','Lacinia Ltd',2021,5,'fermentum@felis.edu','771-214-3078'),(49,'717780979','Cedric','Avery','379-5033 Mauris. St.','Pede Cras Limited',2020,3,'aliquam@aliquamadipiscing.ca','555-791-7224'),(50,'380099236','Ruth','Cabrera','5105 Vestibulum Rd.','Semper Egestas Corp.',2023,2,'Duis.ac.arcu@venenatisa.org','849-264-4474'),(51,'235539019','Blossom','Davenport','145 Amet Ave','Auctor Corporation',2023,5,'Donec@enimmitempor.ca','654-192-8264'),(52,'467765990','Darrel','Burke','P.O. Box 394, 6509 Vel Street','At Nisi Foundation',2023,1,'Quisque@commodoat.com','486-341-6012'),(53,'734300513','James','Chase','Ap #343-4051 Nulla. St.','Ullamcorper Industries',2024,3,'dui@tellussemmollis.com','428-348-6465'),(54,'473178715','Yardley','Bryant','4606 Integer St.','Tristique Inc.',2024,3,'ipsum.dolor.sit@vulputate.ca','843-889-7980'),(55,'931792082','Drake','Gates','Ap #430-5781 Convallis Av.','Erat Eget Ipsum Associates',2024,4,'ut@antelectus.co.uk','861-891-1592'),(56,'834490825','Abraham','Mosley','P.O. Box 446, 608 Integer Avenue','Lectus Cum PC',2021,1,'Nunc@molestiedapibusligula.co.uk','710-113-6730'),(57,'167266063','Hayes','Maxwell','621-4044 Consequat Rd.','Imperdiet Dictum PC',2021,2,'est.ac.mattis@risus.net','664-159-6144'),(58,'519481384','Rudyard','Hopkins','985 Donec Street','Mauris Eu Elit Inc.',2024,2,'luctus@Quisque.ca','780-544-9128'),(59,'155070168','Nerea','Whitfield','Ap #715-7400 Aliquam Road','Donec Felis Corporation',2023,5,'lectus.justo@fermentumvelmauris.net','405-994-4571'),(60,'369769216','Adrian','Ruiz','9058 Nec, Rd.','Mauris Institute',2023,4,'adipiscing.elit@adipiscingnonluctus.co.uk','467-756-2611'),(61,'894938405','Bruce','Chan','P.O. Box 589, 3667 Vel, Street','Quam Ltd',2022,3,'Maecenas@nislarcu.com','671-326-7867'),(62,'781799406','Carter','Cotton','112-2483 Sem Street','Tincidunt Adipiscing Consulting',2022,1,'tellus.sem.mollis@adipiscingfringilla.org','116-466-6973'),(63,'729266170','Bell','Harding','6584 Placerat. Rd.','Arcu Eu Industries',2023,2,'vulputate.velit.eu@sitametmassa.net','917-411-3723'),(64,'600173426','Emmanuel','Rhodes','P.O. Box 343, 1044 Risus. Rd.','Eros Proin Ultrices Limited',2025,5,'nisl@risusDonecegestas.net','508-137-5297'),(65,'691955289','Hamilton','Solis','283-7539 Molestie St.','Urna Nec Luctus Associates',2025,4,'risus@dolortempusnon.ca','118-435-0630'),(66,'223227315','Emerson','Green','989-441 Libero Road','Curabitur Associates',2024,1,'ligula.Aenean@nullaat.co.uk','493-539-7587'),(67,'299455656','James','Dillon','490-4010 Quis, Rd.','Neque Sed Sem Institute',2023,2,'Cras.pellentesque.Sed@Nuncac.net','641-519-0044'),(68,'275983749','Imelda','Freeman','9008 Ultricies Street','Et Pede Institute',2025,4,'vitae.mauris@lobortistellusjusto.com','164-589-6830'),(69,'855745786','Sarah','Stokes','Ap #624-2590 Quis Avenue','Blandit Nam Nulla Incorporated',2021,4,'adipiscing.enim@a.ca','577-431-9055'),(70,'488511593','Len','Matthews','Ap #873-9055 Mauris Avenue','Elementum Sem Company',2024,5,'sit.amet@sodalesMaurisblandit.org','329-805-8006'),(71,'514800327','Martin','Santiago','3392 Volutpat. Av.','Tristique Pellentesque Tellus LLC',2021,4,'non@est.net','357-752-7164'),(72,'538117355','Hadley','Sweeney','5888 Conubia Avenue','Posuere Company',2023,3,'Mauris.molestie.pharetra@PhasellusnullaInteger.net','675-547-4562'),(73,'228891638','Erich','Moreno','261-9606 Nulla Rd.','Laoreet Posuere Enim Ltd',2025,4,'sem.ut@felis.ca','932-484-9888'),(74,'946054560','Selma','Park','7239 Amet Av.','Erat In Consulting',2025,1,'facilisis@acturpisegestas.edu','923-345-8608'),(75,'201172415','Stella','Brewer','1726 Vivamus Avenue','Quam Curabitur Vel Company',2024,1,'orci@Integervitae.co.uk','959-608-5448'),(76,'218271567','Maya','Woodward','704-5313 Egestas Av.','Tempus Mauris Erat Institute',2020,3,'ipsum.Suspendisse.non@vulputate.net','483-754-0489'),(77,'241833551','Juliet','Carrillo','P.O. Box 236, 6920 Sed Ave','Nunc Risus Consulting',2021,4,'et@Etiam.net','884-883-5949'),(78,'219254277','Orlando','Roth','Ap #981-9903 Sollicitudin Ave','Proin Inc.',2023,5,'sapien.Cras@facilisis.edu','815-456-2568'),(79,'809890583','Leslie','Benton','Ap #481-3511 Enim Avenue','Condimentum Institute',2023,1,'Curabitur@IntegerurnaVivamus.co.uk','620-294-1759'),(80,'887897567','Linus','Randall','689-6080 Libero Rd.','Bibendum Ullamcorper Duis Company',2023,3,'enim.Etiam.gravida@ametrisusDonec.org','582-196-0105'),(81,'316072088','Athena','Glover','6730 Dictum Avenue','Parturient Montes Nascetur Company',2025,3,'luctus.ut@nunc.org','418-321-1498'),(82,'367818542','Bethany','Pruitt','537-1894 Mattis Av.','Eu Associates',2024,1,'cursus@adipiscingenim.com','481-762-9949'),(83,'550566703','Doris','Robles','846-5724 Ornare Ave','Donec Industries',2023,4,'tristique.pellentesque.tellus@Nam.ca','439-970-9932'),(84,'736654587','Quintessa','Osborn','P.O. Box 506, 2123 Tristique Avenue','Commodo Tincidunt Consulting',2025,1,'elementum.purus.accumsan@semperNam.ca','152-168-5413'),(85,'576883925','Dominic','Merrill','3918 Turpis. Road','Odio Industries',2020,4,'orci@elitafeugiat.edu','881-627-3755'),(86,'215482408','Vivien','Meyer','5350 Fames Ave','Fringilla Cursus Institute',2023,5,'arcu.Vestibulum.ante@euneque.ca','166-634-9780'),(87,'729888695','Savannah','Whitaker','Ap #643-2174 Aliquet Road','Nulla Ltd',2021,1,'sit@esttemporbibendum.net','111-857-6998'),(88,'310938584','Judith','Bell','392 Ante. Road','Molestie Arcu Sed Incorporated',2024,3,'erat.neque.non@non.org','524-944-3301'),(89,'168933452','Angela','Fisher','289-3723 Quis Rd.','Vestibulum Company',2025,2,'Cras.vulputate@ullamcorper.org','753-825-9385'),(90,'747549364','Hadley','Santos','Ap #621-4822 Fermentum Rd.','Magna Lorem Ipsum LLP',2025,4,'blandit.congue@metus.edu','953-389-5915'),(91,'352077111','Wyoming','Hurley','160-6059 Ultrices Avenue','Libero Donec Consectetuer Consulting',2020,3,'Duis.cursus@semperegestas.co.uk','835-211-3849'),(92,'592772879','Ignatius','Mccall','Ap #163-9041 Ullamcorper. Rd.','Erat Inc.',2023,1,'molestie@augueporttitorinterdum.ca','831-981-6468'),(93,'336046764','Beau','Alston','P.O. Box 957, 2013 Sed St.','Metus Corp.',2020,4,'erat.volutpat@dictummagnaUt.net','467-534-0857'),(94,'399821989','Jeanette','Chapman','278-2219 In Avenue','Risus In Mi Company',2020,3,'non.magna.Nam@Morbivehicula.net','508-764-2708'),(95,'835237264','Vivien','Norton','P.O. Box 488, 8266 Sit Av.','Mus LLP',2021,5,'auctor@amet.com','705-726-8886'),(96,'461055228','Raven','Gamble','7738 Lectus. Rd.','Ultricies Ornare Foundation',2021,4,'lacus@augue.edu','326-455-3672'),(97,'866749591','Sierra','Keith','Ap #597-1138 Dui. St.','Nascetur Ltd',2021,5,'pede.Praesent@ametnulla.org','850-719-8717'),(98,'585962446','Bert','Oliver','244-9806 Scelerisque Rd.','Tempus Risus Institute',2024,5,'Fusce.mi@nequetellus.co.uk','112-530-9482'),(99,'997582652','Zeph','Kirby','293-6877 Sagittis Avenue','Cum Sociis Corp.',2025,1,'rhoncus.Nullam@dignissimtempor.org','776-795-9464'),(100,'275683796','Bevis','Pate','Ap #585-1723 Blandit Rd.','Ac Facilisis Foundation',2022,2,'non@convallisconvallis.com','973-902-0776'),(101,'417998946','Fuller','Hardin','Ap #110-1033 Nec Av.','Posuere Vulputate PC',2025,1,'orci.luctus@molestietellusAenean.com','933-350-2035'),(102,'594536114','Kirby','Higgins','P.O. Box 901, 5248 Est Ave','Volutpat Corp.',2024,4,'orci@Aeneanegetmetus.co.uk','401-615-3089'),(103,'361612156','Jerry','Kramer','Ap #218-2020 Malesuada Ave','Risus At Incorporated',2020,3,'libero.mauris@a.net','909-905-6426'),(104,'482208530','Brody','Rollins','5981 Tempus Avenue','Ad Litora Torquent PC',2025,1,'taciti@urna.co.uk','970-413-3467'),(105,'837589592','James','Valencia','679-9352 Odio. Avenue','Ut Erat Sed Incorporated',2024,2,'taciti.sociosqu@iaculis.ca','381-302-5929');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ta_assignment`
--

DROP TABLE IF EXISTS `ta_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ta_assignment` (
  `Student_Id` int NOT NULL,
  `Course_Code` varchar(10) NOT NULL,
  `Sec_No` int NOT NULL,
  `Work_Hr` int NOT NULL,
  PRIMARY KEY (`Student_Id`,`Course_Code`,`Sec_No`),
  KEY `FK_TA_Sec_idx` (`Course_Code`,`Sec_No`),
  CONSTRAINT `FK_TA_Sec` FOREIGN KEY (`Course_Code`, `Sec_No`) REFERENCES `section` (`Course_Code`, `Sec_No`),
  CONSTRAINT `FK_TA_Student` FOREIGN KEY (`Student_Id`) REFERENCES `student` (`Student_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ta_assignment`
--

LOCK TABLES `ta_assignment` WRITE;
/*!40000 ALTER TABLE `ta_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ta_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taught_in`
--

DROP TABLE IF EXISTS `taught_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taught_in` (
  `Building_Id` int NOT NULL,
  `Room_No` int NOT NULL,
  `Course_Code` varchar(10) NOT NULL,
  `Sec_No` int NOT NULL,
  `Weekday` int DEFAULT NULL,
  `Time` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Building_Id`,`Room_No`,`Course_Code`,`Sec_No`),
  KEY `FK_T_Sec_idx` (`Course_Code`,`Sec_No`),
  CONSTRAINT `FK_T_Room` FOREIGN KEY (`Building_Id`, `Room_No`) REFERENCES `room` (`Building_Id`, `Room_No`),
  CONSTRAINT `FK_T_Sec` FOREIGN KEY (`Course_Code`, `Sec_No`) REFERENCES `section` (`Course_Code`, `Sec_No`),
  CONSTRAINT `taught_in_chk_1` CHECK ((`Weekday` in (1,2)))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taught_in`
--

LOCK TABLES `taught_in` WRITE;
/*!40000 ALTER TABLE `taught_in` DISABLE KEYS */;
INSERT INTO `taught_in` VALUES (1,71,'CS602',3,1,'01:00'),(1,101,'CS631',1,1,'19:00'),(2,128,'CS602',3,2,'07:00'),(2,238,'CS602',3,1,'02:00'),(3,33,'CS602',3,2,'02:00'),(3,49,'CS602',3,2,'02:00'),(3,118,'CS602',3,1,'05:00'),(3,211,'CS602',3,2,'04:00'),(4,81,'CS602',3,2,'08:00'),(4,109,'CS602',3,2,'01:00'),(4,134,'CS602',3,2,'05:00'),(4,172,'CS602',3,1,'07:00'),(4,174,'CS602',3,2,'02:00'),(5,23,'CS602',3,2,'00:00'),(5,39,'CS602',3,1,'04:00'),(5,116,'CS602',3,2,'05:00'),(5,146,'CS602',3,1,'02:00'),(6,45,'CS602',3,1,'01:00'),(6,128,'CS602',3,1,'00:00'),(6,224,'CS602',3,2,'06:00'),(6,241,'CS602',3,1,'07:00'),(7,98,'CS602',3,2,'00:00'),(7,231,'CS602',3,1,'01:00'),(7,296,'CS602',3,2,'07:00'),(8,62,'CS602',3,1,'01:00'),(8,63,'CS602',3,1,'05:00'),(8,71,'CS602',3,1,'06:00'),(8,187,'CS602',3,2,'05:00'),(8,225,'CS602',3,2,'05:00'),(8,251,'CS602',3,1,'06:00'),(9,46,'CS602',3,1,'01:00');
/*!40000 ALTER TABLE `taught_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-02 16:41:24
