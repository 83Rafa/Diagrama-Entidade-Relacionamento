-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Hermione','J','Granger','324159842','Rua dos Granger, 1 Inglaterra, Grã-Bretanha','ghemione@email.com'),(2,'Jane','11','Hoper','555478321','Stranger Things St - Hawkins, Indiana','jhoper@email.com'),(3,'Bruce','R','Banner','789123456','838 5th Avenue Condominium Manhattan, New York US','bannerb@email.com'),(4,'Steve','G','Rogers','159357486','838 5th Avenue Condominium Manhattan, New York US','rsteve@email.com'),(5,'Anthony','H','Stark','943617825','Malibu Point 10880, California US','skark@email.com'),(6,'Bruce',NULL,'Wayne','999888123','Número X Estrada Leste Gothan USA','wbruce@email.com'),(7,'Darth',NULL,'Vader','000000001','Tatooine','darthv@email.com'),(8,'X Æ A-Xii',NULL,'Musk','025000321','5398 Point La Vista Rd Malakoff, Texas USA','muskxx@email.com'),(9,'Emmet','J','Brickowski','542648953','Rua Incrível - LEGO City','ammetb@email.com'),(10,'Sarah','J','Connor','147258369','7301 Santa Fe Avenue, Huntington Park US','sconnor@email.com'),(11,'Jonathan',NULL,'Wick','911888123','Continental Hotel - 1 Wall Street Court - New York City','johnwick@email.com'),(12,'Axel',NULL,'Foley','716188154','614 Walden Drive - Santa Monica - LA','afoley@email.com');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,4,'confirmed','Compra via App',20),(2,2,5,'in proccess','Compra via Web Site',170),(3,3,6,'confirmed','Compra via Web Store',120),(4,4,7,'in proccess','Compra via Web Store',1200),(5,5,8,'confirmed','Compra via App',585),(6,6,9,'confirmed','Compra via Web Store',10950),(7,7,10,'canceled','Compra via Web Store',973554000),(8,8,11,'in proccess','Compra via App',5550),(9,9,12,'confirmed','Compra via App',300),(10,10,13,'in proccess','Compra via App',50);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,1,'confirmed'),(2,2,2,3,'in proccess'),(3,3,3,65,'confirmed'),(4,4,4,1,'in proccess'),(5,5,5,50,'confirmed'),(6,6,6,1,'confirmed'),(7,7,7,5,'canceled'),(8,8,8,250,'in proccess'),(9,9,9,1,'confirmed'),(10,10,10,1,'in proccess');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (NULL,200,0,0,0),(NULL,0,3420,0,0),(NULL,0,0,380,0),(NULL,0,0,19819600,0),(NULL,3465,0,0,0),(NULL,0,0,85950,0),(NULL,0,0,0,0),(NULL,15009400,0,0,0),(NULL,2400,0,0,0),(NULL,0,270,0,0);
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Colchonete Ioga',0,'Fitness',3,'45X60cm',60.5),(2,'Cerveja Amanteigada',0,'Food & Beverage',4,NULL,7.5),(3,'Criptonita',0,'Personal Security',5,NULL,50001000),(4,'Varinha Mágica',0,'Personal Security',5,'37cm',180),(5,'Freezer Horizontal',0,'Home & Kitchen',4,NULL,3250),(6,'Calção Elastano',0,'Fitness',2,NULL,45.2),(7,'Escudo Vibrânio',0,'Personal Security',5,'75cm',1980760),(8,'Capa Audi R8',0,'Automotive',4,NULL,960),(9,'Bat-Rang',0,'Personal Security',5,'2X30cm',300),(10,'Sabre de Luz',1,'Toys & Games',5,'3X10x70',145.5),(11,'Bateria infinita',0,'Automotive',5,'3cm',3000780),(12,'Sofá de Dois Andares',0,'Home & Kitchen',5,'2.5X85X1.8',2100),(13,'Barra Exercícios Hidrolight',0,'Fitness',5,'120/160cm',110),(31,'Nimbus 2000',1,'Sports',5,'135cm',3800),(32,'Nimbus 3000',1,'Sports',5,'135cm',8750),(34,'Capa da Invisibilidade',0,'Personal Security',5,'150cm',35000),(37,'Terno Blindado',0,'Personal Security',5,NULL,12000),(38,'Jaqueta Lions 76 - Vintage Sports ',0,'Clothing',4,NULL,386.5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `null_checker` AFTER INSERT ON `product` FOR EACH ROW IF (NEW.price IS NULL) THEN
		INSERT INTO user_messages (message, product_id) VALUES (CONCAT('Por favor, preencha o preço para: ', NEW.product_name), NEW.id);
	END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (1,1,1,'available'),(2,2,1,'available'),(3,3,50,'available'),(4,4,1,'available'),(5,5,3,'available'),(6,6,250,'available'),(7,7,1,'available'),(8,8,5,'available'),(9,9,1,'available'),(10,10,2,'available');
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_seller`
--

LOCK TABLES `product_seller` WRITE;
/*!40000 ALTER TABLE `product_seller` DISABLE KEYS */;
INSERT INTO `product_seller` VALUES (1,3,1790),(1,4,2),(1,7,5000),(1,13,10),(2,5,250),(3,6,10000),(3,8,55),(3,10,1150),(3,12,6),(4,2,20),(4,9,45),(4,13,5);
/*!40000 ALTER TABLE `product_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_storage`
--

LOCK TABLES `product_storage` WRITE;
/*!40000 ALTER TABLE `product_storage` DISABLE KEYS */;
INSERT INTO `product_storage` VALUES (1,'São Paulo',2250),(2,'São Paulo',850),(3,'São Paulo',5),(4,'São Paulo',975),(5,'São Paulo',280),(6,'São Paulo',50),(7,'São Paulo',300),(8,'São Paulo',50),(9,'Rio de Janeiro',50),(10,'Rio de Janeiro',3200),(11,'Rio de Janeiro',100000),(12,'Rio de Janeiro',20),(13,'Minas Gerais',5000);
/*!40000 ALTER TABLE `product_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product_supplier`
--

LOCK TABLES `product_supplier` WRITE;
/*!40000 ALTER TABLE `product_supplier` DISABLE KEYS */;
INSERT INTO `product_supplier` VALUES (4,13,1);
/*!40000 ALTER TABLE `product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Home Marketplace','HomeMart','1310178400012',NULL,'35445551','São Paulo'),(2,'Special Clothing Store','Everything UNeed','110179500011',NULL,'24155551','Rio Grande do Norte'),(3,'Elethonics Tech','Tech4Lovers','5001555000114',NULL,'55554321','Rio de Janeiro'),(4,'Magic Wand Shop','Olivaras','20007457000112',NULL,'55543589','Travessa do Tranco - Hogwards');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `storage_location`
--

LOCK TABLES `storage_location` WRITE;
/*!40000 ALTER TABLE `storage_location` DISABLE KEYS */;
INSERT INTO `storage_location` VALUES (1,1,'SP - Brasil'),(2,2,'RN - Brasil'),(3,1,'SP - Brasil'),(4,1,'SP - Brasil'),(5,4,'SP - Brasil'),(6,6,'RJ - Brasil'),(7,1,'SP - Brasil'),(8,2,'RJ - Brasil'),(9,4,'SP - Brasil'),(10,2,'RJ - Brasil');
/*!40000 ALTER TABLE `storage_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Mumford & Sons','1012355500015','33301234'),(2,'Brother in Arms','30987655000120','31477410'),(3,'Clothing Paradise','10014755000101','32106789'),(4,'Olivaras','20007457000112','55543589'),(5,'Continental Hotel','1812355500231','121555417'),(6,'Movies Clothing','1532355504645','123555756');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_messages`
--

LOCK TABLES `user_messages` WRITE;
/*!40000 ALTER TABLE `user_messages` DISABLE KEYS */;
INSERT INTO `user_messages` VALUES (1,'Por favor, preencha o preço para: Capa da Invisibilidade',34);
/*!40000 ALTER TABLE `user_messages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-07  8:54:39
