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
-- Table structure for table `quesnumerical`
--

DROP TABLE IF EXISTS `quesnumerical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quesnumerical` (
  `q_num_id` int(11) NOT NULL DEFAULT '0',
  `question` mediumtext NOT NULL,
  `valid_answer` varchar(50) NOT NULL,
  `type_ques_no` char(5) NOT NULL,
  `hint_id` int(11) DEFAULT NULL,
  `mod_id` int(11) DEFAULT NULL,
  `uplimit` float DEFAULT NULL,
  `lowlimit` float DEFAULT NULL,
  PRIMARY KEY (`q_num_id`),
  KEY `hint_id` (`hint_id`),
  CONSTRAINT `quesnumerical_ibfk_1` FOREIGN KEY (`hint_id`) REFERENCES `questions_hints` (`hint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quesnumerical`
--

LOCK TABLES `quesnumerical` WRITE;
/*!40000 ALTER TABLE `quesnumerical` DISABLE KEYS */;
INSERT INTO `quesnumerical` VALUES (1,'An empty beaker has a mass of 31.987 g.  A student uses a 5.00 mL pipette to add water at 20 °C.  After the addition, the mass of the beaker and water is 36.941 g.  What is the volume of water transferred?  ','10','4',4,1,4.975,4.955),(2,'Calculate the relative standard deviation (RSD) for the following volumes delivered by a 5.00 mL volumetric pipette: 4.876, 5.021, 4.991, 4.672 mL.  Please report your answer to 1 significant figure.','5','5',5,1,11,9),(3,'How much 5.00 M NaOH solution is required to make 100.0 mL of a 0.100 M solution?','2','1',11,3,2.1,1.9),(4,'The initial burette reading in a titration was 5.41 mL and the final burette reading was 26.15 mL.  If 10.00 mL of HCl was titrated and 0.1000 M NaOH was used in the titration, what is the concentration of the acid? ','0','5',15,3,0.21,0.2),(5,'What is the mass of the flask?','5','3',18,4,25,12),(6,'What is the mass of the flask and Water?','8','5',20,4,5.2,4.8),(7,'If there is an error at any time you can record a new initial mass','9','7',22,4,5.2,4.8),(8,'What is the volume of water transferred in trial 1.','8','10',25,4,5.2,4.8),(9,'What is the average volume of water transferred.','8','11',26,4,5.2,4.8),(10,'What is the RSD (ppt) for your volumes?','8','12',27,4,5.2,4.8),(11,'What is the percent error for your average volume?','8','13',28,4,5.2,4.8),(14,'How much 5.00 M NaOH should be used to make 100.0 mL of 0.100 M NaOH.','5','6',36,5,5.1,4.9),(15,'Please be sure there is no air bubble in the tip of the burette.  If there is an air bubble, place a waste beaker under the burette and open the stopcock and quickly close it to remove the air bubble.  Repeat as necessary until the air bubble is gone. You must perform titrations accurately and precisely.  The software will only accept titration data with +/- 1.00 mL of the accepted value. After the air bubble has been removed, what is the initial burette reading?','0','10',40,5,35,0),(16,'Perform the titration so the last drop turns the solution in the Erlenmeyer flask pink. What is the final burette reading after the titration?','0','11',41,5,5.1,4.9),(17,'If there is an error at any time you can record a new initial or final volume.','0','12',42,5,0,0),(18,'What is the concentration of HCl for trial 1?','0','13',43,5,0,0),(19,'What is the average molarity of HCl for the four trials ?','0','14',44,5,0,0),(20,'What is the RSD for your titration data?','0','15',45,5,0,0),(21,'The initial burette reading in a titration was X.00 mL and the final burette reading was Y.00 mL. If 10.00 mL of HCl was titrated and Z.000 M NaOH was used in the','0','5',51,6,5.2,4.8),(22,'What is the temperature of the water (to the nearest degree) and the density at that temperature','0','9',24,4,27,18);
/*!40000 ALTER TABLE `quesnumerical` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-29 15:16:50
