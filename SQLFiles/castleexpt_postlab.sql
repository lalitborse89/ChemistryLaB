-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: castleexpt
-- ------------------------------------------------------
-- Server version	5.6.28-log

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
-- Table structure for table `postlab`
--

DROP TABLE IF EXISTS `postlab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postlab` (
  `expno` int(11) NOT NULL,
  `quesno` int(11) NOT NULL,
  `ques` mediumtext,
  `ans` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postlab`
--

LOCK TABLES `postlab` WRITE;
/*!40000 ALTER TABLE `postlab` DISABLE KEYS */;
INSERT INTO `postlab` VALUES (1,1,'Reflect on two key concepts you learned in the lab',NULL),(1,2,'Reflect on any scientific errors or possible improvements associated with the experiment. What could be done to perform the experiment better? ',NULL),(1,3,'You used the equation below to calculate the amount of 5.00 M NaOH required to make 0.100 M NaOH. Solve for the equation in terms of V1.   C1V1 = C2V2',NULL),(1,4,'A student got the following HCl mo\nlarities: 0.201, 0.205, 0.203, 0.199 M. If the actual molarity was 0.200 is the data accurate? \nPrecise? Explain. Be sure to calculate the RSD and percent error and use the values in your explanation ',NULL),(1,5,'The initial burette reading in a titration was X.00 mL and the final burette reading was Y.00 mL. If 10.00 mL of HCl was titrated and Z.000 M NaOH was used in the titration, what is the concentration of the acid?',NULL);
/*!40000 ALTER TABLE `postlab` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-29 15:16:59
