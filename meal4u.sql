CREATE DATABASE  IF NOT EXISTS `meals4u` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `meals4u`;
-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (x86_64)
--
-- Host: localhost    Database: meals4u
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `Drink`
--

DROP TABLE IF EXISTS `Drink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Drink` (
  `Item_ID` int NOT NULL,
  `Cuisine_Type` text,
  PRIMARY KEY (`Item_ID`),
  CONSTRAINT `drink_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `General_Item_Inventory` (`Item_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drink`
--

LOCK TABLES `Drink` WRITE;
/*!40000 ALTER TABLE `Drink` DISABLE KEYS */;
INSERT INTO `Drink` VALUES (11,'Thai'),(12,'Mexican'),(13,'Greek'),(14,'Ethiopian'),(15,'Polish'),(16,'Indian'),(17,'Italian'),(18,'Filipino'),(19,'Turkish'),(20,'Japanese');
/*!40000 ALTER TABLE `Drink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entree`
--

DROP TABLE IF EXISTS `Entree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entree` (
  `Item_ID` int NOT NULL,
  `Cuisine_Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Item_ID`),
  CONSTRAINT `entree_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `General_Item_Inventory` (`Item_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entree`
--

LOCK TABLES `Entree` WRITE;
/*!40000 ALTER TABLE `Entree` DISABLE KEYS */;
INSERT INTO `Entree` VALUES (1,'Thai'),(2,'Mexican'),(3,'Greek'),(4,'Ethiopian'),(5,'Polish'),(6,'Indian'),(7,'Italian'),(8,'Filipino'),(9,'Turkish'),(10,'Japanese');
/*!40000 ALTER TABLE `Entree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `General_Item_Inventory`
--

DROP TABLE IF EXISTS `General_Item_Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `General_Item_Inventory` (
  `Item_ID` int NOT NULL AUTO_INCREMENT,
  `Item_Type` enum('Entree','Drink','Side') NOT NULL,
  `Item_Name` varchar(255) DEFAULT NULL,
  `Item_Category` varchar(255) NOT NULL,
  `Ingredients` text,
  `Allergens` text,
  `Quantity` int NOT NULL,
  `Supplier_ID` int NOT NULL,
  PRIMARY KEY (`Item_ID`),
  KEY `Supplier_ID` (`Supplier_ID`),
  CONSTRAINT `general_item_inventory_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `Suppliers_Volunteers` (`User_ID`) ON DELETE CASCADE,
  CONSTRAINT `general_item_inventory_chk_1` CHECK ((`Quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `General_Item_Inventory`
--

LOCK TABLES `General_Item_Inventory` WRITE;
/*!40000 ALTER TABLE `General_Item_Inventory` DISABLE KEYS */;
INSERT INTO `General_Item_Inventory` VALUES (1,'Entree','Spicy Green Papaya Salad','Vegan','Green papaya, chili, peanuts, soy sauce','Vegan, None',97,101),(2,'Entree','Chicken Tinga Tacos on Corn Tortillas','Gluten-Free','Chicken, tortillas, chipotle, garlic','Gluten-Free, Dairy, Soy',100,103),(3,'Entree','Spanakopita','Vegetarian','Phyllo dough, spinach, feta, eggs','Vegetarian, Gluten, Dairy',79,108),(4,'Entree','Misir Wat','Vegan','Lentils, onion, tomato paste, berbere','Vegan, None',96,112),(5,'Entree','Pierogi Ruskie','Standard','Dough, potato, cheese, onion, butter','Standard, Gluten, Dairy, Eggs',100,108),(6,'Entree','Palak Paneer','Vegetarian','Paneer, spinach, tomato, cream','Vegetarian, Dairy',78,105),(7,'Entree','Eggplant Parmesan','Vegetarian','Eggplant, tomato sauce, cheese, flour, eggs','Vegetarian, Gluten, Dairy, Eggs',95,120),(8,'Entree','Chicken Adobo','Standard','Chicken, soy sauce, garlic','Standard, Soy, Garlic',100,136),(9,'Entree','Lamb Shish Kebab','Gluten-Free','Lamb, yogurt, garlic, lemon','Gluten-Free, Dairy',97,140),(10,'Entree','Salmon Teriyaki','Pescatarian','Salmon, soy sauce, mirin, garlic, ginger','Pescatarian, Soy, Fish, Sesame',100,149),(11,'Drink','Coconut water','Vegan','Coconut water','None',300,125),(12,'Drink','Iced hibiscus tea (Agua de Jamaica)','Vegan','Hibiscus, sweetener','None (traces of gluten)',300,125),(13,'Drink','Sparkling water with lemon','Vegan','Sparkling water, lemon','None',294,120),(14,'Drink','Mint tea','Vegan','Mint leaves, sweetener','None',300,115),(15,'Drink','Ginger beer','Vegan','Ginger, sweetener, lemon juice','None (traces of gluten)',293,149),(16,'Drink','Iced chai','Vegetarian','Black tea, milk/spices','Dairy, Soy, Spices',295,108),(17,'Drink','Italian soda (Limonata)','Vegan','Lemon juice, sugar','None',300,132),(18,'Drink','Iced tea','Vegan','Black tea, sweetener, lemon','None (traces of gluten)',297,111),(19,'Drink','Ayran (yogurt drink)','Vegetarian','Yogurt, salt','Dairy',284,140),(20,'Drink','Green tea','Vegan','Green tea, water','None',298,120),(21,'Side','Sticky rice','Vegan','Sticky rice, water','None',100,101),(22,'Side','Mexican street corn (elote)','Standard','Corn, mayo, cotija, lime','Dairy, Soy, Corn',100,130),(23,'Side','Greek salad','Vegetarian','Cucumber, tomatoes, feta, olives','Dairy, Olives',93,105),(24,'Side','Injera','Vegetarian','Teff flour, yeast','Gluten, Yeast',89,112),(25,'Side','Sour cream with chives','Vegetarian','Sour cream, chives','Dairy',86,136),(26,'Side','Basmati rice','Vegan','Basmati, broth, oil','None',100,108),(27,'Side','Garlic bread','Standard','Bread, butter, garlic','Gluten, Dairy, Garlic, Soy',100,140),(28,'Side','Garlic fried rice','Standard','Rice, garlic, soy sauce, eggs','Soy, Eggs, Sesame',100,141),(29,'Side','Bulgur pilaf','Vegan','Bulgur, tomato paste, onion, garlic','Gluten',100,167),(30,'Side','Miso soup','Pescatarian','Miso, tofu, seaweed, soy sauce','Soy, Gluten, Fish',100,115);
/*!40000 ALTER TABLE `General_Item_Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_History`
--

DROP TABLE IF EXISTS `Order_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_History` (
  `Record_ID` int NOT NULL AUTO_INCREMENT,
  `Order_ID` int NOT NULL,
  `User_ID` int NOT NULL,
  `Item_ID` int NOT NULL,
  `Item_Name` varchar(255) NOT NULL,
  `Quantity` int NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Record_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Item_ID` (`Item_ID`),
  CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`),
  CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`Item_ID`) REFERENCES `General_Item_Inventory` (`Item_ID`),
  CONSTRAINT `order_history_chk_1` CHECK ((`Quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_History`
--

LOCK TABLES `Order_History` WRITE;
/*!40000 ALTER TABLE `Order_History` DISABLE KEYS */;
INSERT INTO `Order_History` VALUES (1,1000,184,1,'Spicy Green Papaya Salad',3,21.00),(2,1000,184,4,'Misir Wat',4,21.00),(3,1000,184,13,'Sparkling water with lemon',6,21.00),(4,1000,184,15,'Ginger beer',7,21.00),(5,1000,184,18,'Iced tea',3,21.00),(6,1000,184,20,'Green tea',2,21.00),(7,1001,154,3,'Spanakopita',3,84.00),(8,1001,154,6,'Palak Paneer',9,84.00),(9,1001,154,7,'Eggplant Parmesan',3,84.00),(10,1001,154,16,'Iced chai',2,84.00),(11,1001,154,19,'Ayran (yogurt drink)',5,84.00),(12,1001,154,23,'Greek salad',7,84.00),(13,1002,178,3,'Spanakopita',8,84.00),(14,1002,178,6,'Palak Paneer',5,84.00),(15,1002,178,9,'Lamb Shish Kebab',3,84.00),(16,1002,178,19,'Ayran (yogurt drink)',5,84.00),(17,1002,178,24,'Injera',7,84.00),(18,1002,178,25,'Sour cream with chives',8,84.00),(19,1003,119,3,'Spanakopita',9,84.00),(20,1003,119,6,'Palak Paneer',8,84.00),(21,1003,119,16,'Iced chai',3,84.00),(22,1003,119,19,'Ayran (yogurt drink)',6,84.00),(23,1003,119,24,'Injera',4,84.00),(24,1003,119,25,'Sour cream with chives',6,84.00),(25,1004,173,3,'Spanakopita',1,84.00),(26,1004,173,7,'Eggplant Parmesan',2,84.00);
/*!40000 ALTER TABLE `Order_History` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`emilytorres`@`localhost`*/ /*!50003 TRIGGER `update_inventory_after_order` AFTER INSERT ON `order_history` FOR EACH ROW BEGIN
  UPDATE General_Item_Inventory
  SET Quantity = Quantity - NEW.Quantity
  WHERE Item_ID = NEW.Item_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Plans`
--

DROP TABLE IF EXISTS `Plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plans` (
  `Plan_ID` int NOT NULL AUTO_INCREMENT,
  `Plan_Type` enum('Weekly','Monthly') NOT NULL,
  `Total_Meals` int NOT NULL DEFAULT '21',
  `Base_Price` decimal(10,2) NOT NULL DEFAULT '37.50',
  `Calculated_Fee` decimal(10,2) DEFAULT NULL,
  `Scheduled_Delivery_Date` date NOT NULL,
  `User_ID` int DEFAULT NULL,
  PRIMARY KEY (`Plan_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `plans_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Students` (`User_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plans`
--

LOCK TABLES `Plans` WRITE;
/*!40000 ALTER TABLE `Plans` DISABLE KEYS */;
INSERT INTO `Plans` VALUES (201,'Weekly',21,37.50,28.13,'2025-03-30',100),(202,'Monthly',84,150.00,112.50,'2025-04-01',102),(203,'Weekly',21,37.50,28.13,'2025-03-30',104),(204,'Weekly',21,37.50,28.13,'2025-03-30',106),(205,'Monthly',84,150.00,112.50,'2025-04-01',109),(206,'Monthly',84,150.00,112.50,'2025-04-01',113),(207,'Weekly',21,37.50,28.13,'2025-03-30',114),(208,'Weekly',21,37.50,28.13,'2025-03-30',116),(209,'Weekly',21,37.50,28.13,'2025-03-30',117),(210,'Weekly',21,37.50,28.13,'2025-03-30',118),(211,'Monthly',84,150.00,37.50,'2025-04-01',119),(212,'Weekly',21,37.50,9.38,'2025-03-30',122),(213,'Monthly',84,150.00,37.50,'2025-04-01',124),(214,'Monthly',84,150.00,37.50,'2025-04-01',127),(215,'Monthly',84,150.00,37.50,'2025-04-01',128),(216,'Monthly',84,150.00,37.50,'2025-04-01',129),(217,'Monthly',84,150.00,37.50,'2025-04-01',131),(218,'Monthly',84,150.00,37.50,'2025-04-01',134),(219,'Weekly',21,37.50,9.38,'2025-03-30',137),(220,'Weekly',21,37.50,9.38,'2025-03-30',138),(221,'Weekly',21,37.50,9.38,'2025-03-30',142),(222,'Weekly',21,37.50,9.38,'2025-03-30',144),(223,'Weekly',21,37.50,9.38,'2025-03-30',151),(224,'Weekly',21,37.50,9.38,'2025-03-30',153),(225,'Monthly',84,150.00,75.00,'2025-04-01',154),(226,'Monthly',84,150.00,75.00,'2025-04-01',157),(227,'Weekly',21,37.50,18.75,'2025-03-30',159),(228,'Weekly',21,37.50,18.75,'2025-03-30',160),(229,'Weekly',21,37.50,18.75,'2025-03-30',161),(230,'Weekly',21,37.50,18.75,'2025-03-30',162),(231,'Monthly',84,150.00,75.00,'2025-04-01',163),(232,'Monthly',84,150.00,75.00,'2025-04-01',168),(233,'Monthly',84,150.00,75.00,'2025-04-01',170),(234,'Monthly',84,150.00,75.00,'2025-04-01',171),(235,'Monthly',84,150.00,75.00,'2025-04-01',173),(236,'Monthly',84,150.00,75.00,'2025-04-01',174),(237,'Monthly',84,150.00,150.00,'2025-04-01',175),(238,'Weekly',21,37.50,37.50,'2025-03-30',176),(239,'Monthly',84,150.00,150.00,'2025-04-01',177),(240,'Monthly',84,150.00,150.00,'2025-04-01',178),(241,'Monthly',84,150.00,150.00,'2025-04-01',179),(242,'Monthly',84,150.00,150.00,'2025-04-01',180),(243,'Monthly',84,150.00,150.00,'2025-04-01',181),(244,'Weekly',21,37.50,37.50,'2025-03-30',182),(245,'Weekly',21,37.50,37.50,'2025-03-30',184),(246,'Weekly',21,37.50,37.50,'2025-03-30',191),(247,'Weekly',21,37.50,37.50,'2025-03-30',192),(248,'Monthly',84,150.00,150.00,'2025-04-01',194),(249,'Monthly',84,150.00,150.00,'2025-04-01',195),(250,'Monthly',84,150.00,150.00,'2025-04-01',199);
/*!40000 ALTER TABLE `Plans` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`emilytorres`@`localhost`*/ /*!50003 TRIGGER `calculate_plan_fee` BEFORE INSERT ON `plans` FOR EACH ROW BEGIN
  DECLARE income_level ENUM('Low_Income','Middle_Income','High_Income','Upper_Income');
  DECLARE discount DECIMAL(5,2);

  -- Get income details of the user
  SELECT Income_Details INTO income_level
  FROM Students
  WHERE User_ID = NEW.User_ID;

  -- Determine discount based on income level
  SET discount = CASE income_level
    WHEN 'Low_Income' THEN 0.75
    WHEN 'Middle_Income' THEN 0.50
    WHEN 'High_Income' THEN 0.25
    ELSE 0.00
  END;

  -- Calculate final fee
  SET NEW.Calculated_Fee = NEW.Base_Price * (1 - discount);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`emilytorres`@`localhost`*/ /*!50003 TRIGGER `recalculate_plan_fee` BEFORE UPDATE ON `plans` FOR EACH ROW BEGIN
  DECLARE income_level ENUM('Low_Income','Middle_Income','High_Income','Upper_Income');
  DECLARE discount DECIMAL(5,2);

  -- Get income details of the user
  SELECT Income_Details INTO income_level
  FROM Students
  WHERE User_ID = NEW.User_ID;

  -- Determine discount based on income level
  SET discount = CASE income_level
    WHEN 'Low_Income' THEN 0.75
    WHEN 'Middle_Income' THEN 0.50
    WHEN 'High_Income' THEN 0.25
    ELSE 0.00
  END;

  -- Calculate final fee
  SET NEW.Calculated_Fee = NEW.Base_Price * (1 - discount);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Side`
--

DROP TABLE IF EXISTS `Side`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Side` (
  `Item_ID` int NOT NULL,
  `Cuisine_Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Item_ID`),
  CONSTRAINT `side_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `General_Item_Inventory` (`Item_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Side`
--

LOCK TABLES `Side` WRITE;
/*!40000 ALTER TABLE `Side` DISABLE KEYS */;
INSERT INTO `Side` VALUES (21,'Thai'),(22,'Mexican'),(23,'Greek'),(24,'Ethiopian'),(25,'Polish'),(26,'Indian'),(27,'Italian'),(28,'Filipino'),(29,'Turkish'),(30,'Japanese');
/*!40000 ALTER TABLE `Side` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `User_ID` int NOT NULL,
  `Student_College_ID_Number` int NOT NULL,
  `College_ID` int NOT NULL,
  `Dorm_Address` varchar(255) DEFAULT NULL,
  `Dietary_Restrictions` varchar(255) DEFAULT NULL,
  `Income_Details` enum('Low_Income','Middle_Income','High_Income','Upper_Income') NOT NULL,
  `Plan_ID` int DEFAULT NULL,
  `Payment_Method` varchar(255) NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Student_College_ID_Number` (`Student_College_ID_Number`),
  KEY `Plan_ID` (`Plan_ID`),
  KEY `College_ID` (`College_ID`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`) ON DELETE CASCADE,
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`Plan_ID`) REFERENCES `Plans` (`Plan_ID`),
  CONSTRAINT `students_ibfk_3` FOREIGN KEY (`College_ID`) REFERENCES `Universities` (`College_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (100,500,419,'333 N College Way, Claremont, CA 91711','Pescatarian','Upper_Income',201,'1723'),(102,501,419,'333 N College Way, Claremont, CA 91711','Pescatarian','Middle_Income',202,'9127'),(104,502,417,'201 Old Main, University Park, PA 16802','Standard','Low_Income',203,'8274'),(106,503,403,'450 Jane Stanford Way, Stanford, CA 94305','Gluten-Free','Low_Income',204,'5426'),(109,504,406,'5000 Forbes Ave, Pittsburgh, PA 15213','Pescatarian','High_Income',205,'2815'),(113,505,403,'450 Jane Stanford Way, Stanford, CA 94305','Gluten-Free','High_Income',206,'2903'),(114,506,406,'5000 Forbes Ave, Pittsburgh, PA 15213','Vegetarian','High_Income',207,'6045'),(116,507,415,'933 Harrisburg Ave, Lancaster, PA 17603','Pescatarian','High_Income',208,'4522'),(117,508,404,'3400 N. Charles Street, Baltimore, MD 21218','Gluten-Free','Upper_Income',209,'4094'),(118,509,417,'201 Old Main, University Park, PA 16802','Pescatarian','High_Income',210,'5374'),(119,510,402,'633 Clark St, Evanston, IL 60208','Vegetarian','Low_Income',211,'3932'),(122,511,412,'220 South Pleasant Street, Amherst, Massachusetts','Pescatarian','Middle_Income',212,'4515'),(124,512,401,'360 Huntington Ave, Boston, MA 02115','Vegan','Low_Income',213,'3514'),(127,513,402,'633 Clark St, Evanston, IL 60208','Pescatarian','Low_Income',214,'3336'),(128,514,417,'201 Old Main, University Park, PA 16802','Vegan','Upper_Income',215,'2671'),(129,515,404,'3400 N. Charles Street, Baltimore, MD 21218','Vegan','Middle_Income',216,'1733'),(131,516,402,'633 Clark St, Evanston, IL 60208','Pescatarian','Middle_Income',217,'2825'),(134,517,409,'106 Central St, Wellesley, MA 02481','Vegetarian','Low_Income',218,'6331'),(137,518,405,'70 Brown St., Providence, RI 02912','Gluten-Free','Upper_Income',219,'2345'),(138,519,402,'633 Clark St, Evanston, IL 60208','Vegetarian','Low_Income',220,'4478'),(142,520,415,'933 Harrisburg Ave, Lancaster, PA 17603','Vegetarian','Low_Income',221,'9428'),(144,521,407,'101 North Merion Ave., Bryn Mawr, PA 19010','Standard','Upper_Income',222,'8284'),(151,522,417,'201 Old Main, University Park, PA 16802','Gluten-Free','Upper_Income',223,'6644'),(153,523,403,'450 Jane Stanford Way, Stanford, CA 94305','Pescatarian','Low_Income',224,'1647'),(154,524,406,'5000 Forbes Ave, Pittsburgh, PA 15213','Vegetarian','Middle_Income',225,'1458'),(157,525,409,'106 Central St, Wellesley, MA 02481','Vegan','Low_Income',226,'7890'),(159,526,408,'233 Bay State Road, Boston, MA 02215','Vegan','Middle_Income',227,'6695'),(160,527,419,'333 N College Way, Claremont, CA 91711','Pescatarian','Middle_Income',228,'5615'),(161,528,413,'6100 Main St, Houston, TX 77005','Gluten-Free','Low_Income',229,'9441'),(162,529,402,'633 Clark St, Evanston, IL 60208','Standard','High_Income',230,'4237'),(163,530,414,'1 College St, Worcester, MA 01610','Pescatarian','Upper_Income',231,'9776'),(168,531,411,'900 S Crouse Ave, Syracuse, NY 13244','Standard','High_Income',232,'1843'),(170,532,409,'106 Central St, Wellesley, MA 02481','Vegan','Upper_Income',233,'1684'),(171,533,411,'900 S Crouse Ave, Syracuse, NY 13244','Vegetarian','Upper_Income',234,'3504'),(173,534,401,'360 Huntington Ave, Boston, MA 02115','Vegetarian','High_Income',235,'3331'),(174,535,402,'633 Clark St, Evanston, IL 60208','Standard','Upper_Income',236,'1442'),(175,536,413,'6100 Main St, Houston, TX 77005','Pescatarian','High_Income',237,'6055'),(176,537,404,'3400 N. Charles Street, Baltimore, MD 21218','Pescatarian','High_Income',238,'9795'),(177,538,408,'233 Bay State Road, Boston, MA 02215','Gluten-Free','Low_Income',239,'4223'),(178,539,417,'201 Old Main, University Park, PA 16802','Gluten-Free','Upper_Income',240,'8665'),(179,540,406,'5000 Forbes Ave, Pittsburgh, PA 15213','Standard','Upper_Income',241,'8370'),(180,541,411,'900 S Crouse Ave, Syracuse, NY 13244','Standard','Upper_Income',242,'4322'),(181,542,406,'5000 Forbes Ave, Pittsburgh, PA 15213','Standard','Middle_Income',243,'3322'),(182,543,407,'101 North Merion Ave., Bryn Mawr, PA 19010','Gluten-Free','Middle_Income',244,'9796'),(184,544,413,'6100 Main St, Houston, TX 77005','Vegan','Low_Income',245,'4961'),(191,545,415,'933 Harrisburg Ave, Lancaster, PA 17603','Vegan','Upper_Income',246,'3545'),(192,546,411,'900 S Crouse Ave, Syracuse, NY 13244','Vegan','Middle_Income',247,'6421'),(194,547,414,'1 College St, Worcester, MA 01610','Pescatarian','Low_Income',248,'9792'),(195,548,409,'106 Central St, Wellesley, MA 02481','Vegan','Middle_Income',249,'8353'),(199,549,405,'70 Brown St., Providence, RI 02912','Gluten-Free','Middle_Income',250,'6143');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`emilytorres`@`localhost`*/ /*!50003 TRIGGER `after_student_signup` AFTER INSERT ON `students` FOR EACH ROW BEGIN
  UPDATE Universities
  SET Students_in_Meals4U = Students_in_Meals4U + 1
  WHERE College_ID = NEW.College_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`emilytorres`@`localhost`*/ /*!50003 TRIGGER `after_student_delete` AFTER DELETE ON `students` FOR EACH ROW BEGIN
  UPDATE Universities
  SET Students_in_Meals4U = Students_in_Meals4U - 1
  WHERE College_ID = OLD.College_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Suppliers_Volunteers`
--

DROP TABLE IF EXISTS `Suppliers_Volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Suppliers_Volunteers` (
  `User_ID` int NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Delivery_Frequency` varchar(255) NOT NULL,
  `Delivery_Status` varchar(255) DEFAULT NULL,
  `Cuisine_Types_Offered` varchar(255) NOT NULL,
  PRIMARY KEY (`User_ID`),
  CONSTRAINT `suppliers_volunteers_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suppliers_Volunteers`
--

LOCK TABLES `Suppliers_Volunteers` WRITE;
/*!40000 ALTER TABLE `Suppliers_Volunteers` DISABLE KEYS */;
INSERT INTO `Suppliers_Volunteers` VALUES (101,'1 Indian Summer Ave.\n, Passaic, NJ 07055','Biweekly','Delivered to facility','Greek, Vietnamese, Polish, Thai'),(103,'81 Columbia St., \nCranford, NJ 07016','Biweekly','In transit to facility','Thai, Peruvian, Portuguese, Ukranian, Other, Polish, Filipino, Russian'),(105,'7400 Thompson Street, \nYorktown, VA 23693','Weekly','Delivered to facility','Chinese, Italian, Greek, Mediterranean, Thai, Vietnamese, Russian, Korean, Indian, Other'),(107,'1 SE. Elmwood St., Garner, NC 27529','Biweekly','Preparing meals','Japanese, Mexican'),(108,'24 Brookside Drive, Mays Landing, NJ 08330','Weekly','Preparing meals','Indian, Russian, Other, Ukranian, Greek, Mediterranean, Filipino, Portuguese, Italian'),(110,'9014 Tunnel Ave., Rockville Centre, NY 11570','Biweekly','In transit to facility','Ethiopian, Chinese, Turkish'),(111,'29 Del Monte St., Poughkeepsie, NY 12601','Biweekly','Ready for student delivery','Puerto Rican, Italian, Chinese, Ukranian, Ethiopian, Russian, Nigerian'),(112,'7512 Smoky Hollow St., Eau Claire, WI 54701','Biweekly','Preparing meals','Ethiopian, Mediterranean, Greek, Other, Nigerian, Puerto Rican, Ukranian, Russian, Vietnamese'),(115,'99 Circle Ave., North Augusta, SC 29841','Weekly','Delivered to facility','Mediterranean, Japanese, Vietnamese, Italian, Nigerian, Chinese, Filipino, Portuguese, Polish, Other'),(120,'8857 Stillwater St., Henderson, KY 42420','Weekly','Delivered to facility','Mediterranean, Indian, Polish, Japanese, Turkish, Filipino, Chinese'),(121,'74 West Snake Hill St., Delaware, OH 43015','Weekly','Ready for student delivery','Ethiopian, Greek, Other, Japanese'),(123,'7793B Del Monte St., Essex, MD 21221','Weekly','In transit to facility','Other, Ukranian, Korean, Thai, Ethiopian, Indian'),(125,'37 Glen Ridge St., East Haven, CT 06512','Weekly','Delivered to facility','Vietnamese, Filipino, Chinese, Mediterranean, Greek'),(126,'8802 Virginia Street, Metairie, LA 70001','Weekly','Preparing meals','Turkish, Peruvian, Greek, Mediterranean'),(130,'91 Wagon Street, Palm Beach Gardens, FL 33410','Biweekly','Preparing meals','Chinese, Greek, Thai, Italian, Mexican, Ukranian, Japanese'),(132,'4832 Highland Drive, Madison, WI 53711','Weekly','Preparing meals','Greek, Ukranian, Italian, Mediterranean, Korean, Mexican, Indian'),(133,'1276 Sunset Boulevard, Austin, TX 78704','Weekly','Delivered to facility','Puerto Rican, Italian, Japanese, Vietnamese, Ukranian, Nigerian, Ethiopian, Turkish, Thai'),(135,'2034 Meadowbrook Lane, Miami, FL 33133','Biweekly','Ready for student delivery','Mediterranean, Ethiopian, Ukranian, Filipino'),(136,'5961 Crestwood Avenue, Denver, CO 80206','Biweekly','Ready for student delivery','Filipino, Indian, Polish, Vietnamese'),(139,'3218 Timberland Road, Portland, OR 97205','Weekly','Ready for student delivery','Italian, Peruvian, Ukranian, Turkish, Puerto Rican'),(140,'4527 Rolling Hills Court, Atlanta, GA 30319','Weekly','Preparing meals','Polish, Korean, Ukranian, Indian, Vietnamese, Mediterranean'),(141,'8120 Evergreen Street, Houston, TX 77056','Biweekly','In transit to facility','Chinese, Ukranian, Puerto Rican, Thai'),(143,'1497 Brookside Drive, Chicago, IL 60614','Biweekly','Delivered to facility','Nigerian, Greek, Chinese, Polish, Vietnamese, Peruvian'),(145,'2906 Summit Lane, Los Angeles, CA 90036','Biweekly','Ready for student delivery','Filipino, Greek, Ukranian, Turkish, Polish'),(146,'6743 Redwood Avenue, Phoenix, AZ 85018','Biweekly','Delivered to facility','Portuguese, Thai, Mexican, Korean, Mediterranean, Chinese, Polish'),(147,'5310 Oakridge Street, Philadelphia, PA 19103','Weekly','In transit to facility','Thai, Chinese, Mediterranean, Ukranian, Turkish, Italian, Nigerian'),(148,'3842 Sycamore Drive, San Diego, CA 92103','Weekly','Delivered to facility','Puerto Rican, Chinese, Mediterranean, Portuguese, Peruvian, Filipino, Polish, Nigerian, Ukranian'),(149,'7586 Bluebell Lane, Seattle, WA 98109','Weekly','Ready for student delivery','Ethiopian, Greek, Polish, Italian, Peruvian, Ukranian, Japanese, Chinese, Nigerian'),(150,'2179 Aspen Avenue, Boston, MA 02116','Weekly','Delivered to facility','Ethiopian, Mediterranean, Korean, Italian'),(152,'4295 Valley Road, Las Vegas, NV 89109','Biweekly','Ready for student delivery','Polish, Italian, Puerto Rican, Japanese, Mexican, Ethiopian, Vietnamese, Thai'),(155,'9051 Maplewood Court, New Orleans, LA 70118','Biweekly','Delivered to facility','Ethiopian, Mediterranean, Other'),(156,'6618 Pinecrest Lane, Minneapolis, MN 55408','Weekly','Delivered to facility','Nigerian, Russian, Portuguese, Greek, Ethiopian'),(158,'3450 Whispering Pines Drive, Columbus, OH 43215','Biweekly','Preparing meals','Ethiopian, Russian, Greek, Filipino'),(164,'5827 Glenwood Street, San Francisco, CA 94117','Weekly','Delivered to facility','Puerto Rican, Turkish, Vietnamese'),(165,'1043 Autumn Avenue, Nashville, TN 37215','Biweekly','Delivered to facility','Peruvian, Nigerian, Other, Thai, Mexican, Greek, Russian'),(166,'2171 Lakeside Boulevard, Dallas, TX 75219','Biweekly','Preparing meals','Chinese, Polish, Other, Thai, Puerto Rican, Filipino, Korean, Mexican, Ethiopian'),(167,'6785 Briarwood Road, Kansas City, MO 64112','Biweekly','Ready for student delivery','Mediterranean, Portuguese, Russian, Filipino, Puerto Rican, Chinese, Korean, Indian, Greek, Vietnamese'),(169,'2310 Willowbrook Lane, Orlando, FL 32801','Biweekly','In transit to facility','Mexican, Nigerian, Mediterranean, Chinese, Italian'),(172,'4986 Parkview Court, Detroit, MI 48226','Weekly','In transit to facility','Italian, Puerto Rican'),(183,'7432 Birchwood Street, Charlotte, NC 28202','Weekly','In transit to facility','Nigerian, Portuguese, Puerto Rican, Indian, Ukranian, Japanese, Thai, Chinese'),(185,'1124 Rosewood Avenue, Salt Lake City, UT 84101','Biweekly','Ready for student delivery','Russian, Other'),(186,'3659 Cedar Ridge Lane, Baltimore, MD 21202','Weekly','Ready for student delivery','Japanese, Vietnamese, Turkish'),(187,'5894 Chestnut Drive, Indianapolis, IN 46204','Biweekly','Delivered to facility','Puerto Rican'),(188,'2035 Sunflower Boulevard, San Antonio, TX 78209','Weekly','Preparing meals','Mediterranean, Ethiopian, Nigerian, Thai, Turkish, Indian, Vietnamese, Portuguese, Italian'),(189,'4719 Hawthorne Avenue, Oklahoma City, OK 73102','Biweekly','Delivered to facility','Peruvian, Vietnamese, Turkish, Ethiopian, Korean, Russian, Puerto Rican'),(190,'1568 Elmwood Street, Milwaukee, WI 53202','Weekly','In transit to facility','Portuguese, Italian, Filipino, Korean, Thai, Greek, Ethiopian, Japanese, Chinese, Mediterranean'),(193,'8297 Silverleaf Lane, Louisville, KY 40202','Weekly','Preparing meals','Indian, Mexican'),(196,'3946 Magnolia Road, Memphis, TN 38103','Biweekly','Preparing meals','Portuguese, Italian, Peruvian'),(197,'5793 Goldenrod Court, Tampa, FL 33606','Biweekly','Ready for student delivery','Mexican, Ukranian, Japanese'),(198,'2175 Shadowbrook Street, Cincinnati, OH 45202','Weekly','Preparing meals','Indian, Russian');
/*!40000 ALTER TABLE `Suppliers_Volunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Universities`
--

DROP TABLE IF EXISTS `Universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Universities` (
  `College_ID` int NOT NULL,
  `College_Name` varchar(255) NOT NULL,
  `Students_in_Meals4U` int DEFAULT '0',
  `College_Address` varchar(255) DEFAULT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Website_URL` varchar(255) DEFAULT NULL,
  `Accreditation_Status` enum('Accredited','Non-Accredited','Pending') NOT NULL,
  `Campus_Type` enum('Urban','Suburban','Rural') NOT NULL,
  `Established_Year` int DEFAULT NULL,
  `Funding_Type` enum('Public','Private','Charter') NOT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`College_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Universities`
--

LOCK TABLES `Universities` WRITE;
/*!40000 ALTER TABLE `Universities` DISABLE KEYS */;
INSERT INTO `Universities` VALUES (400,'Sarah Lawrence College',0,'1 Mead Way, Bronxville, NY 10708','914.337.0700','https://www.sarahlawrence.edu/','Accredited','Suburban',1926,'Private','Northeast','Private liberal arts college located in Yonkers, NY, offering a unique, multidisciplinary liberal arts education.'),(401,'Northeastern University',2,'Boston, MA','617.373.2000','https://www.northeastern.edu/','Accredited','Urban',1898,'Private','Northeast','Private research university located in Boston, MA, known for its cooperative education program.'),(402,'Northwestern University',6,'Evanston, IL','847.491.3741','https://www.northwestern.edu/','Accredited','Suburban',1851,'Private','Midwest','Private research university with campuses in Evanston and Chicago, IL.'),(403,'Stanford University',3,'Stanford, CA','650.723.2300','https://www.stanford.edu/','Accredited','Suburban',1885,'Private','West','Private research university located near Palo Alto, CA.'),(404,'Johns Hopkins University',3,'Baltimore, MD','410.516.8000','https://www.jhu.edu/','Accredited','Urban',1876,'Private','Mid-Atlantic','Private research university known for its medical and public health programs.'),(405,'Brown University',2,'Providence, RI','401.863.1000','https://www.brown.edu/','Accredited','Urban',1764,'Private','Northeast','Ivy League university offering a flexible curriculum.'),(406,'Carnegie Mellon University',5,'Pittsburgh, PA','412.268.2000','https://www.cmu.edu/','Accredited','Urban',1900,'Private','Mid-Atlantic','Private research university known for its programs in technology and the arts.'),(407,'Bryn Mawr College',2,'Bryn Mawr, PA','610.526.5000','https://www.brynmawr.edu/','Accredited','Suburban',1885,'Private','Mid-Atlantic','Private women\'s liberal arts college.'),(408,'Boston University',2,'Boston, MA','617.353.2000','https://www.bu.edu/','Accredited','Urban',1839,'Private','Northeast','Private research university located along the Charles River.'),(409,'Wellesley College',4,'Wellesley, MA','781.283.1000','https://www.wellesley.edu/','Accredited','Suburban',1870,'Private','Northeast','Private women\'s liberal arts college.'),(410,'Middlebury College',0,'Middlebury, VT','802.443.5000','https://www.middlebury.edu/','Accredited','Rural',1800,'Private','Northeast','Private liberal arts college known for its language programs.'),(411,'Syracuse University',4,'Syracuse, NY','315.443.1870','https://www.syracuse.edu/','Accredited','Urban',1870,'Private','Northeast','Private research university with a strong communications program.'),(412,'Amherst College',1,'Amherst, MA','413.542.2000','https://www.amherst.edu/','Accredited','Rural',1821,'Private','Northeast','Private liberal arts college known for its open curriculum.'),(413,'Rice University',3,'Houston, TX','713.348.0000','https://www.rice.edu/','Accredited','Urban',1912,'Private','South','Private research university with a strong focus on STEM fields.'),(414,'College of the Holy Cross',2,'1 College St, Worcester, MA 01610','(508) 793-2011','https://www.holycross.edu','Accredited','Urban',1843,'Private','Northeast',NULL),(415,'Franklin and Marshall College',3,'637 College Ave, Lancaster, PA 17603','(717) 358-3911','https://www.fandm.edu','Accredited','Urban',1787,'Private','Northeast',NULL),(416,'University of Georgia',0,'Athens, GA 30602','(706) 542-3000','https://www.uga.edu','Accredited','Urban',1785,'Public','Southeast',NULL),(417,'Penn State University',5,'University Park, PA 16802','(814) 865-4700','https://www.psu.edu','Accredited','Suburban',1855,'Public','Northeast',NULL),(418,'Vanderbilt University',0,'2201 West End Ave, Nashville, TN 37235','(615) 322-7311','https://www.vanderbilt.edu','Accredited','Urban',1873,'Private','Southeast',NULL),(419,'Pomona College',3,'333 N College Way, Claremont, CA 91711','(909) 621-8000','https://www.pomona.edu','Accredited','Suburban',1887,'Private','West',NULL);
/*!40000 ALTER TABLE `Universities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `User_Type` enum('Student','Supplier/Volunteer') NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Phone_Number` varchar(12) NOT NULL,
  `Email_Address` varchar(255) NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Email_Address` (`Email_Address`),
  CONSTRAINT `users_chk_1` CHECK (regexp_like(`Phone_Number`,_utf8mb4'^[0-9]{3}-[0-9]{3}-[0-9]{4}$'))
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (100,'Student','Merrill Weeks','751-713-3257','merrillweeks3824@gmail.com'),(101,'Supplier/Volunteer','Piper Madden','693-425-4351','pipermadden5611@gmail.com'),(102,'Student','Lane Fisher','458-422-6166','lanefisher@gmail.com'),(103,'Supplier/Volunteer','Flavia Peck','683-713-4822','flaviapeck625@gmail.com'),(104,'Student','Demetrius Whitfield','543-754-9256','demetriuswhitfield@gmail.com'),(105,'Supplier/Volunteer','Rafael Sweet','879-821-1386','rafaelsweet@gmail.com'),(106,'Student','Patience Castillo','534-780-8672','patiencecastillo@gmail.com'),(107,'Supplier/Volunteer','Quinn Kelley','892-580-5013','quinnkelley6025@gmail.com'),(108,'Supplier/Volunteer','Gregory Potts','524-237-6578','gregorypotts3594@gmail.com'),(109,'Student','Constance Deleon','373-786-4624','constancedeleon@gmail.com'),(110,'Supplier/Volunteer','Fiona King','679-813-6577','fionaking@gmail.com'),(111,'Supplier/Volunteer','Rooney Landry','486-878-3016','rooneylandry2962@gmail.com'),(112,'Supplier/Volunteer','Hedley Barry','638-741-6771','hedleybarry@gmail.com'),(113,'Student','Alexander Stanley','267-592-6216','alexanderstanley@gmail.com'),(114,'Student','Lillian Ferguson','342-723-8245','lillianferguson@gmail.com'),(115,'Supplier/Volunteer','Cameron Pacheco','793-356-1847','cameronpacheco9823@gmail.com'),(116,'Student','Marsden Holt','320-461-1436','marsdenholt@gmail.com'),(117,'Student','Vielka Haynes','348-225-1511','vielkahaynes@gmail.com'),(118,'Student','Zorita Small','945-388-2843','zoritasmall@gmail.com'),(119,'Student','Laura Baldwin','608-894-5643','laurabaldwin@gmail.com'),(120,'Supplier/Volunteer','Kiona Head','138-378-1502','kionahead@gmail.com'),(121,'Supplier/Volunteer','Alma Jacobson','776-942-2168','almajacobson@gmail.com'),(122,'Student','Sage Lowe','146-328-5825','sagelowe5466@gmail.com'),(123,'Supplier/Volunteer','Cassidy Collins','971-312-2522','cassidycollins7005@gmail.com'),(124,'Student','Elizabeth Daniel','510-853-3486','elizabethdaniel@gmail.com'),(125,'Supplier/Volunteer','Deanna Wilkerson','883-488-8505','deannawilkerson@gmail.com'),(126,'Supplier/Volunteer','Griffin Stark','788-975-0344','griffinstark@gmail.com'),(127,'Student','Gloria Stark','655-697-7274','gloriastark5976@gmail.com'),(128,'Student','Raymond Greer','371-217-8813','raymondgreer@gmail.com'),(129,'Student','Echo Keith','568-843-0844','echokeith@gmail.com'),(130,'Supplier/Volunteer','Wyatt Patel','262-379-4105','wyattpatel@gmail.com'),(131,'Student','Ann Carroll','358-475-2620','anncarroll4191@gmail.com'),(132,'Supplier/Volunteer','Magee Raymond','355-108-5163','mageeraymond@gmail.com'),(133,'Supplier/Volunteer','Rhiannon Palmer','477-884-1435','rhiannonpalmer1397@gmail.com'),(134,'Student','Jenette Branch','454-230-4280','jenettebranch@gmail.com'),(135,'Supplier/Volunteer','Colin Ayers','829-873-6819','colinayers@gmail.com'),(136,'Supplier/Volunteer','Thaddeus Morse','628-816-4054','thaddeusmorse1229@gmail.com'),(137,'Student','Ava Snider','357-574-6607','avasnider@gmail.com'),(138,'Student','Madeline Vega','753-734-1083','madelinevega@gmail.com'),(139,'Supplier/Volunteer','Benedict Cummings','428-355-5036','benedictcummings2416@gmail.com'),(140,'Supplier/Volunteer','Hashim Bell','658-119-3933','hashimbell2902@gmail.com'),(141,'Supplier/Volunteer','Jayme Justice','265-328-6191','jaymejustice@gmail.com'),(142,'Student','Alexander Barlow','363-398-6310','alexanderbarlow@gmail.com'),(143,'Supplier/Volunteer','Ginger Merrill','437-416-0640','gingermerrill@gmail.com'),(144,'Student','Macon Reyes','456-319-2267','maconreyes@gmail.com'),(145,'Supplier/Volunteer','Marah Mcmillan','722-864-6860','marahmcmillan2052@gmail.com'),(146,'Supplier/Volunteer','Madeline Stark','315-724-6636','madelinestark@gmail.com'),(147,'Supplier/Volunteer','Rhoda Hayes','449-187-3238','rhodahayes@gmail.com'),(148,'Supplier/Volunteer','Sacha Olson','574-362-7773','sachaolson@gmail.com'),(149,'Supplier/Volunteer','Blaze Decker','873-462-7388','blazedecker@gmail.com'),(150,'Supplier/Volunteer','Marah Snyder','745-376-4770','marahsnyder@gmail.com'),(151,'Student','Quyn Wolf','716-454-8285','quynwolf6214@gmail.com'),(152,'Supplier/Volunteer','Alec Reyes','535-406-3657','alecreyes@gmail.com'),(153,'Student','Holly Benson','856-424-7447','hollybenson@gmail.com'),(154,'Student','Gannon Chambers','966-853-8242','gannonchambers@gmail.com'),(155,'Supplier/Volunteer','Reagan Valenzuela','324-676-0686','reaganvalenzuela34@gmail.com'),(156,'Supplier/Volunteer','Vincent Brewer','251-359-6784','vincentbrewer@gmail.com'),(157,'Student','Lani Tanner','162-344-1337','lanitanner3383@gmail.com'),(158,'Supplier/Volunteer','Graiden Day','976-475-8351','graidenday687@gmail.com'),(159,'Student','Cameron Carrillo','527-380-5825','cameroncarrillo@gmail.com'),(160,'Student','Rinah Bass','411-515-1324','rinahbass1635@gmail.com'),(161,'Student','Evelyn Wilder','668-744-1648','evelynwilder3222@gmail.com'),(162,'Student','Carlos Robinson','550-353-1259','carlosrobinson@gmail.com'),(163,'Student','Kevin Harmon','386-588-7559','kevinharmon8789@gmail.com'),(164,'Supplier/Volunteer','Ronan Bailey','281-748-9475','ronanbailey3602@gmail.com'),(165,'Supplier/Volunteer','Ayanna Dickerson','301-282-7754','ayannadickerson@gmail.com'),(166,'Supplier/Volunteer','Myra Dawson','439-782-2628','myradawson3519@gmail.com'),(167,'Supplier/Volunteer','Rina Mcfarland','989-360-4322','rinamcfarland@gmail.com'),(168,'Student','Chelsea Keller','588-783-8392','chelseakeller@gmail.com'),(169,'Supplier/Volunteer','Charde Mcmahon','436-471-8832','chardemcmahon3851@gmail.com'),(170,'Student','Rina Kidd','615-476-5927','rinakidd@gmail.com'),(171,'Student','Dominic Alford','660-336-4289','dominicalford@gmail.com'),(172,'Supplier/Volunteer','Vaughan Allen','219-632-6751','vaughanallen@gmail.com'),(173,'Student','Kelly Brown','264-198-3142','kellybrown@gmail.com'),(174,'Student','Gage Rojas','233-508-4873','gagerojas6610@gmail.com'),(175,'Student','Berk Callahan','213-661-7170','berkcallahan@gmail.com'),(176,'Student','Neve Montgomery','224-265-8530','nevemontgomery@gmail.com'),(177,'Student','Elizabeth Dixon','954-766-3368','elizabethdixon8125@gmail.com'),(178,'Student','Giacomo Weaver','680-762-7113','giacomoweaver4942@gmail.com'),(179,'Student','Aimee Whitney','432-107-5173','aimeewhitney9174@gmail.com'),(180,'Student','Garrett Morin','582-763-1958','garrettmorin@gmail.com'),(181,'Student','Anthony Walter','403-827-8220','anthonywalter5311@gmail.com'),(182,'Student','Alvin Klein','812-536-2412','alvinklein6009@gmail.com'),(183,'Supplier/Volunteer','Gage Mccormick','286-236-4968','gagemccormick5277@gmail.com'),(184,'Student','Clayton Mitchell','885-880-8444','claytonmitchell8379@gmail.com'),(185,'Supplier/Volunteer','Eve Craft','511-403-0852','evecraft@gmail.com'),(186,'Supplier/Volunteer','Ann Larsen','914-612-5945','annlarsen@gmail.com'),(187,'Supplier/Volunteer','Shellie Mullen','360-940-2436','shelliemullen@gmail.com'),(188,'Supplier/Volunteer','Palmer Patton','614-401-2588','palmerpatton8135@gmail.com'),(189,'Supplier/Volunteer','Caesar Carey','625-184-8256','caesarcarey8275@gmail.com'),(190,'Supplier/Volunteer','Katell Ramos','847-288-6345','katellramos@gmail.com'),(191,'Student','Maggie Martin','526-175-8252','maggiemartin@gmail.com'),(192,'Student','Donna Dejesus','544-856-3132','donnadejesus@gmail.com'),(193,'Supplier/Volunteer','Frances Banks','464-666-2254','francesbanks1943@gmail.com'),(194,'Student','Melinda Mccullough','116-791-8858','melindamccullough5722@gmail.com'),(195,'Student','George Mccormick','429-235-4467','georgemccormick6599@gmail.com'),(196,'Supplier/Volunteer','Ria Yates','369-208-6858','riayates410@gmail.com'),(197,'Supplier/Volunteer','Burke Navarro','381-370-2756','burkenavarro6361@gmail.com'),(198,'Supplier/Volunteer','James Oneal','716-158-3381','jamesoneal584@gmail.com'),(199,'Student','Orla Holmes','635-858-8321','orlaholmes1860@gmail.com');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-15 12:19:44
