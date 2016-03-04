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
-- Table structure for table `questions_hints`
--

DROP TABLE IF EXISTS `questions_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_hints` (
  `hint_id` int(11) NOT NULL DEFAULT '0',
  `hint_1` mediumtext,
  `hint_2` mediumtext,
  `hint_3` mediumtext,
  PRIMARY KEY (`hint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_hints`
--

LOCK TABLES `questions_hints` WRITE;
/*!40000 ALTER TABLE `questions_hints` DISABLE KEYS */;
INSERT INTO `questions_hints` VALUES (1,'Hint:  Volumetric glassware is designed to accurately and precisely measure a specific volume at a specified temperature (generally room temperature).','No Hint for this Question','No Hint for this Question'),(2,'Hint: The line on volumetric glassware, including volumetric burets and pipettes, indicating the fill level for the specified volume','No Hint for this Question','No Hint for this Question'),(3,'Hint: A pipette pump should only be used to draw the liquid into a pipette, it should never be used to force the liquid out','No Hint for this Question','No Hint for this Question'),(4,'You need to find the actual volume of water transferred from its mass and density.  A table of densities of water based on temperature can be found in the lab manual/experiment write-up online.  Be sure to look up the density of water at 20 °C.  The density formula is shown below. Density= mass/volume','An empty beaker has a mass of 41.345 g.  A student uses a 5.00 mL pipette to add water at 20 °C.  After the addition, the mass of the beaker and water is 46.023 g.  What is the volume of water transferred?   Step 1: Mass of water 46.223 g - 41.345 g = 4.878 g      Step 2: Volume of water 4.878 g x 1 mL/0.9982 g=4.889 mL','Step 1: Mass of water 36.941 g – 31.987 g = 4.954 g Step 2: Volume of water 4.954*1mL/4.963mL'),(5,'Use Excel to answer this question.  You will need to use the STDEV and AVERAGE functions.  Please consult the Excel appendix in the manual for step by step instructions RSD=(std dev)*1000/Average  Simplification of significant figures in statistical calculations allows one to report the answer to one significant figure.  Remember 27 to one significant figure would be 30','Calculate the relative standard deviation (RSD) for the following volumes delivered by a 5.00 mL volumetric pipette: 5.103, 4.987, 5.031, 4.899 mL  Answer:STDEV(B2:B5)/Average(B2:B5)*1000  Excel displays 17.047535, but the answer is reported as 20 ppt (1 sig fig).','Excel displays 12.62204, but the answer is reported as 10 ppt (1 sig fig)'),(6,'Hint: In this experiment the 0.1 M not 5.0 M, NaOH solution should be added to the burette.  Generally in acid-base titrations, the base is added to the burette. ','No Hint for this Question','No Hint for this Question'),(7,'Hint: A burette measures the difference in volume from when the titration is completed to when the titration is finished.  The amount of solution used in the titration is what is important, not the absolute volume of solution in the burette.  A burette is always read from the top down.','No Hint for this Question','No Hint for this Question'),(8,'Hint: It is important the burette is cleaned with water to ensure any contaminants are removed.  After rinsing with water, it is important to rinse with a few portions of base to ensure the concentration of the base in the burette is the same as the stock concentration of the base in the flask.  Rinse water may dilute the base in the burette.  ','No Hint for this Question','No Hint for this Question'),(9,'Hint: It is very important to remove the air bubble for the bottom of the burette before you start the titration.  This is done by quickly opening and closing the stopcock until the air is forced out.  If the air bubble fills with solution during the titration, the experimenter will assume the base filling the air bubble was used in the titration.  ','No Hint for this Question','No Hint for this Question'),(10,'Hint: Remember when making measurements there should always be one estimated digit. A burette has graduations in the tenths place (1 decimal place).  Therefore one must estimate the hundredths place (2 decimal places).','No Hint for this Question','No Hint for this Question'),(11,'Hint 1: This is a dilution question.  In a dilution, more solvent is added but the amount of solute remains constants.  Dilutions can be understood by the following equation. C1V1 = C2V2 ','Example feedback: Please use the following example to help guide you to solve this problem.    Plugging in:  8.00*v1=0.4*350.0    v1=17.5 mL ','5.00 × V_1=0.100 ×100.0 V_1=2.00 mL'),(12,'Hint: The endpoint is what you will measure in this experiment and is where the indicator changes color.  The indicator is carefully chosen so that the endpoint and the equivalence point are close together.','No Hint for this Question','No Hint for this Question'),(13,'Hint: It is extremely important to stop the titration when a single drop of base causes the solution to turn from colorless to pink.  Adding more base may not cause a significant color change, but will cause a falsely low base concentration to be calculated.','No Hint for this Question','No Hint for this Question'),(14,'Hint: As you get closer and closer to the endpoint of the titration, the pink color will persist longer and longer.  In an ideal situation, it will take only one drop of the base to cause the solution to turn and stay pink.','No Hint for this Question','No Hint for this Question'),(15,'At the endpoint of the titration the moles of acid and moles of base can be considered equal.  First determine the volume of NaOH solution used in the titration and then determine the moles of base. Next use the balanced chemical equation (shown below) to find the moles of acid and then finally the concentration of the acid.  HCL (aq) +NaOH (aq) -->Nacl (aq)+ H2O (l)','Example feedback: Please use the following example to help guide you to solve this problem. The initial burette reading in a titration was 10.31 mL and the final burette reading was 23.27 mL.  If 10.00 mL of HCl was titrated and 0.413 M NaOH was used in the titration, what is the concentration of the acid? HCL (aq) +NaOH (aq) -->Nacl (aq)+ H2O (l)  Volume of NaOH used: 23.27 – 10.31 =12.96 mL or 0.01296 L   Concentration of HCl   0.01296 L * (0.413 mol NaoH/1 L ) * (1 mol HCL/ 1mol NaoH ) * (1/0.100 L) =0.5352 M  ','0.02074 L * (0.1000 mol NaoH/1 L ) * (1 mol HCL/ 1mol NaoH ) * (1/0.100 L) =0.2074 M'),(16,'No Hint for this Question','No Hint for this Question',NULL),(17,'You need the mass of the clean, dry and empty 50 mL Elenmeyer flask first.','No Hint for this Question',NULL),(18,'The mass of your flask is different than expected, please try again.','No Hint for this Question',NULL),(19,'The objective of this section of the experiment is to find the volume of water delivered by a 5.00 mL pipette using the mass and density of the water transferred.  ','No Hint for this Question',NULL),(20,': The mass of your flask and water is different than expected, please try again.  Start by measuring the mass of the flask and water again.  If the value is still not accepted, please empty the flask and measure the mass of the empty flask again. The initial mass will be slightly different because it is now wet.  ','No Hint for this Question',NULL),(21,'A total of five trials is needed.  It is important to not empty the flask between trials.','No Hint for this Question',NULL),(22,'No Hint for this Question','No Hint for this Question',NULL),(23,'To find the density of water, the temperature is required','No Hint for this Question',NULL),(24,'No Hint for this Question','No Hint for this Question',NULL),(25,'Use excel to find the mass of water transferred in the first trail by subtracting the mass of the empty flask from the mass of the flask and water after the first portion of water was added.  Next use density of water transferred in trial 1 to calculate the volume of water transferred.  ','Hit GET Formula button for reference',NULL),(26,'Use Excel to find the average volume of water transferred using the AVERAGE function','Hit GET Formula button for reference',NULL),(27,'No Hint for this Question','Hit GET Formula button for reference',NULL),(28,'Use Excel to find the percent error.  The percent error is the absolute value of the difference between the accepted volume transferred by the pipette (5.00 mL) and the average volume you transferred (avg mL) divided by the accepted value time 100.','Hit GET Formula button for reference',NULL),(29,'No Hint for this Question','Hit GET Formula button for reference',NULL),(30,'No Hint for this Question','Hit GET Formula button for reference',NULL),(31,'No Hint for this Question','No Hint for this Question',NULL),(32,'This lab was specially designed so equal amounts of acid and base waste would be generated.  Since the acid is HCl and the base is NaOH, mixing the dilute acid and base creates salt water.  DO NOT mix concentrated acid and base as it can lead to a violent reaction.','No Hint for this Question',NULL),(33,'Concentrated hydrochloric acid and concentrated sodium hydroxide are both corrosive and dangerous solutions.  Wear the proper PPE and handle them with care.','No Hint for this Question',NULL),(34,'The first step of this experiment is to dilute the 5.00 M NaOH solution','No Hint for this Question',NULL),(35,'To make 100 mL of 0.100 M NaOH solution, a 100.0 mL volumetric flask should be used','No Hint for this Question',NULL),(36,'This is a dilution question.  In a dilution, more solvent is added but the amount of solute remains constants.  Dilutions can be understood by the following equation. C1V1=C2V2','5.00*V1=0.1*100       V1=2.00 mL',NULL),(37,'Hint: To avoid water to acid, which should never be done, you must add the 3.5 mL of 3.0 M HCl to 25 mL of water and the dilute the acid to a total volume of approximately 50 mL (using the graduations on the Erlenmeyer flask, which are not as accurate or precise as a volumetric flask).','No Hint for this Question',NULL),(38,'Hint: The diluted, 0.100 M, NaOH should be put into the burette after the burrette is rinsed with water and then small portions of the 0.100 M NaOH.  5.00 mL of the diluted acid should be added to an Erlenmeyer flask with a 5.00 mL volumetric pipette.    Phenophthalien, the indicator, should be added to the Erlenmeyer flask with 5.00 mL of the diluted acid','No Hint for this Question',NULL),(39,'Hint: Please read each answer carefully because all of them are true and they are all important for obtaining accurate and precise results. ','No Hint for this Question',NULL),(40,'The burette reading has the wrong number of significant figures.  ','The burette does not have an appropriate amount of solvent to ensure you will be able to complete the titration.  ',NULL),(41,'Hint: Titrations must be within +/- 1 mL of the expected value.  Please follow the following steps if your value is not accepted until the value is accepted.  Accurate and precise values are essential in a titration.  The lab has been designed so you have plenty of time to repeat a titration if needed.Step 1: Double check your final burette reading.Step 2: Repeat the titration with making another initial reading.  (THE SOFTWARE MUST HAVE A FEATURE TO REPEAT A TITRATION)Step 3: Remake the HCl solution by diluting 3.5 mL of 3.0 M HCl into 25 mL of water and then filling to the 50 mL line.  Be sure to save and label the original and new HClsolutions  Repeat the titration with the new acid.Step 4: Remake the NaOH solution by diluting 2.0 mL of 5.00 M NaOH into a 100.0 mL volumetric flask.  Be sure to save and label the new and old NaOH solutions.  Repeat the titration with the new base  ','No Hint for this Question',NULL),(42,'The burette does not have an appropriate amount of solvent to ensure you will be able to complete the titration.  ','No Hint for this Question',NULL),(43,'Use Excel to calculate the volume of NaOH used in the titration.  Used the volume of NaOH used in the titration, the balanced chemical equation and the volume of HCl titrated (5.00 mL or 0.00500 L) to find the molarity of HCl.  Remember, all volumes used in stoichiometric calculations must be in liters.  ','Hit Get Formula for Reference',NULL),(44,': Use Excel to find the average volume of water transferred using the AVERAGE function','Hit Get Formula for Reference',NULL),(45,'Use Excel to find the RSD.  The RSD is the standard deviation (STDEV) divided by the average (AVERAGE) times 1000.  ','Hit Get Formula for Reference',NULL),(46,'No Hint for this Question','Hit Get Formula for Reference',NULL),(47,'No Hint for this Question','No Hint for this Question',NULL),(48,'No Hint for this Question','No Hint for this Question',NULL),(49,'No Hint for this Question','No Hint for this Question',NULL),(50,'No Hint for this Question','No Hint for this Question',NULL),(51,'No Hint for this Question','No Hint for this Question',NULL);
/*!40000 ALTER TABLE `questions_hints` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-29 15:16:57