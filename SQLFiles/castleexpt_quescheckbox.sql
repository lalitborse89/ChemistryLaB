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
-- Table structure for table `quescheckbox`
--

DROP TABLE IF EXISTS `quescheckbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quescheckbox` (
  `q_cb_id` int(11) NOT NULL DEFAULT '0',
  `question` varchar(100) NOT NULL,
  `answer_1` varchar(200) NOT NULL,
  `answer_2` varchar(200) DEFAULT NULL,
  `answer_3` varchar(200) DEFAULT NULL,
  `answer_4` varchar(200) DEFAULT NULL,
  `type_ques_no` char(5) NOT NULL,
  `hint_id` int(11) DEFAULT NULL,
  `answer` char(1) DEFAULT NULL,
  `mod_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`q_cb_id`),
  KEY `hint_id` (`hint_id`),
  CONSTRAINT `quescheckbox_ibfk_1` FOREIGN KEY (`hint_id`) REFERENCES `questions_hints` (`hint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quescheckbox`
--

LOCK TABLES `quescheckbox` WRITE;
/*!40000 ALTER TABLE `quescheckbox` DISABLE KEYS */;
INSERT INTO `quescheckbox` VALUES (0,'What would you like to record the mass of first?','An empty 50 mL Erlenmeyer flask','An empty weigh boat.','An empty 5 mL volumetric pipette.','An empty 100 mL volumetric flask.','3',NULL,'a',NULL),(1,'Volumetric glassware is','designed to measure a single volume','graduated to measure multiple volumes','not accurate or precise.','not temperature specific.','1',1,'b',1),(2,'A calibration line is','a mark indicating the fill level of the volumetric glassware.','only found on pipettes','always at the lip of the glassware','only on graduated glassware','2',2,'a',1),(3,'When using a pipette pump you should','blow the solution out with your mouth.','force the solution out with the plunger.','allow the solution to flow out only under the force of gravity','force it out with the thumb wheel.','3',3,'c',1),(4,'In the acid- base titration performed in this experiment ________ is added to the burette.','acid','base','water','acetone','1',6,'b',2),(5,'Which of the following statements is true?','A burette is read from the bottom up and the absolute volume is not important.','A burette is read from the bottom up and the absolute volume is not important.','The absolute volume of liquid in the burette is important.','When the stopcock is perpendicular to the burette','2',7,'a',2),(6,'Before filling the burette with sodium hydroxide solution for the titration you must','use a brush and soapy water to clean the inside of','rinse the burette with several small portions of water.','fill the burette completely with water, then fill it completely with base.','rinse the burette with several small portions of','3',8,'d',2),(7,'After filling the burette with sodium hydroxide, but before you begin the titration you must','read the burette ','read the burette and then remove the air bubble in the tip by turning the burette flow on.','read the burette and then remove the air bubble in the tip by turning the burette flow on.','remove the air bubble in the tip by turning the burette.','4',9,'c',2),(8,'In an acid base titration the endpoint and the equivalence point differ because','the endpoint is where the titration should be stopped and the equivalence point is where the water in the flask and in the burette is the same.','the endpoint is where the moles of acid and base are equal and the equivalence point is where the indicator changes color','the endpoint is where the indicator changes color and the equivalence point is where the moles of acid and base are equal.','the endpoint is where the moles of acid and moles of water are the same and the equivalence point is where the moles of base and moles of water are the same.','2',12,'c',3),(9,'The acid-base titration in this experiment is complete when','the pH meter reads 7.0.','a single drop of acid in the burette causes the solution in the flask to turn and stay pink','12.0 mL of base in the burette has been added to','a single drop of base in the burette causes the solution in the flask to turn and stay pink.','3',13,'d',3),(10,'It is possible to tell you are near the endpoint of the titration because',' the volume of the solution increases as more base is added','the pink color persists longer and longer.','the temperature of the solution begins to increase.','the indicator begins to precipitate out of solution.','4',14,'b',3),(11,'Are you wearing your goggles and a lab coat?','Yes','No.',NULL,NULL,'1',16,'a',4),(12,'What would you like to record the mass of first?','An empty 100 mL volumetric flask.','An empty weigh boat.','An empty 5 mL volumetric pipette.','An empty 50 mL volumetric flask.','2',17,'d',4),(13,'Next we _________ and then record the mass again.','add 5 mL of water with a volumetric pipette','fill the flask with water','add 5 mL of water with a graduated cylinder','place the flask in the oven to dry','4',19,'a',4),(14,'How would you like to proceed?','Empty the flask and this time add two portions from the volumetric flask before recording the mass again','Empty the flask between trials. Record the mass of the empty flask between trials.','Do not empty the flask between trials. Repeat this procedure and add water with the volumetric pipette over four more trials.','Determine the standard deviation for trial 1.','6',21,'c',4),(15,'What else do you need to record to find the volume of the water for each trial.','temperature','conductivity','pH','absorbance','8',23,'a',4),(17,'Are you wearing your goggles and a lab coat?','Yes','No',NULL,NULL,'1',31,'a',5),(18,'What should you do with the waste at the end of this section of the experiment?','Put it in acid waste.','Mix it together and pour it down the drain. We will use equal amounts of acid and base. When mixedtogether it will make salt water..','Put it in base waste','Put it in organic waste.','2',32,'b',5),(19,'Which of the following is true.','Sodium hydroxide and hydrochloric acid are both corrosive and must be handled with care.','There are no dangerous chemicals in this lab.','Sodium hydroxide is corrosive but hydrochloric acid is not.','Hydrochloric acid is corrosive by sodium hydroxide is not.','3',33,'a',5),(20,'Where would you like to begin?','Dilute 5.00 M NaOH to make 0.100 M NaOH.','Dilute 8.00 M NaOH to make 0.500 M NaOH.','Make NaOH solution from solid NaOH pellets.','Dilute 0.100 M NaOH to make 2.0 M NaOH.','4',34,'a',5),(21,'What size volumetric flask should be used to dilute the 5.00 M NaOH to make 0.100 M NaOH?','500 mL','100 mL','50 mL','500 mL','5',35,'c',5),(22,'Next you will make the acid solution by diluting 3.5 mL of 3 M HCl to 50 mL in a 125 mL flask\n','Never add water to acid. Add 3.5 mL of 3 M HCl to about \n25 mL of water then fill to 50 mL.','Never add acid to water. Add 3.5 mL of 3 M HCl to the flask first.','Acid \nand water donâ€™t mix. Add 3.5 mL of 3 M HCl to the base.','Acid and base donâ€™t mix. Add 3.5 mL of 3 M HCl and \ntitrate directly without diluting.','7',37,'a',5),(23,'Which correctly describes a proper titration for this experiment.','25.00 mL of 0.100 M NaOH is added to the Erlenmeyer flask. Diluted HCl is added to a cleaned burette. The indicator, phenolphthalein is then added to the burette.','5.00 mL of 0.100 M NaOH is added to the Erlenmeyer flask. The indicator, phenolphthalein is then added to the Erlenmeyer flask. Diluted acid is added to a cleaned burette.','25.00 mL of diluted HCl is added to the Erlenmeyer flask. 0.100 M NaOH is added to a cleaned burette.The indicator, phenolphthalein is then added to the burette.','5.00 mL of diluted HCl is added to the Erlenmeyer flask. The indicator, phenolphthalein is then added o the Erlenmeyer flask. 0.100 M NaOH is added to a cleaned burette.','8',38,'d',5),(24,'Which of the following statements is true.','A labeled waste beaker should be made to catch any rinsing\'s from the burette.','Before adding 0.100 M NaOH to the burette, the burette should be rinsed with several small portions of water, then base.','After the burette is filled it, any air bubbles should be removed by fully opening the stopcock.','All of the above.','9',39,'d',5),(25,'The volume reading for the burette must have _____decimal places.','0','1','2','3','5',10,'b',2);
/*!40000 ALTER TABLE `quescheckbox` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-29 15:16:51
