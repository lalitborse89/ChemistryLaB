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
-- Table structure for table `questextarea`
--

DROP TABLE IF EXISTS `questextarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questextarea` (
  `q_txt_id` int(11) NOT NULL DEFAULT '0',
  `question` mediumtext NOT NULL,
  `valid_answer` varchar(50) NOT NULL,
  `type_ques_no` char(5) NOT NULL,
  `hint_id` int(11) DEFAULT NULL,
  `mod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`q_txt_id`),
  KEY `hint_id` (`hint_id`),
  CONSTRAINT `questextarea_ibfk_1` FOREIGN KEY (`hint_id`) REFERENCES `questions_hints` (`hint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questextarea`
--

LOCK TABLES `questextarea` WRITE;
/*!40000 ALTER TABLE `questextarea` DISABLE KEYS */;
INSERT INTO `questextarea` VALUES (1,'You found an RSD of RSD ppt and a percent error of PE.  Is your data precise? Explain.','0','14',29,4),(2,'You found an RSD of RSD ppt and a percent error of PE .  Is your data accurate? Explain','0','15',30,4),(3,'You found an RSD of RSD ppt. Is your data precise? Explain.','0','16',46,5),(4,'Reflect on two key concepts you learned in the lab.Key Concepts:After completing this experiment, you are responsible for understanding: the use of volumetric glassware,indicators,endpoints,acid-base reactions and titrations.','0','1',47,6),(5,'Reflect on any scientific errors or possible improvements associated with the experiment. What could be done to perform the experiment better?','0','2',48,6),(6,'You used the equation below to calculate the amount of 5.00 M NaOH required to make 0.100 M NaOH. Solve for the equation in terms of V1.C1V1 = C2V2','0','3',49,6),(7,'A student got the following HCl molarities: 0.201, 0.205, 0.203, 0.199M. If the actual molarity was 0.200 is the data accurate? Precise? Explain. Be sure to calculate the RSD and percent error and use the values in your explanation.','0','4',50,6);
/*!40000 ALTER TABLE `questextarea` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-29 15:16:53
