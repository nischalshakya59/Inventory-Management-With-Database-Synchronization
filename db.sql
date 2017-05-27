-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: inventory
-- ------------------------------------------------------
-- Server version	5.5.47

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(10) NOT NULL AUTO_INCREMENT,
  `country` varchar(32) DEFAULT NULL,
  `zone` varchar(32) DEFAULT NULL,
  `district` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `street` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (39,'Nepal','Bagmati','Kathmandu','Kathmandu','Manamaiju'),(40,'Nepal','Bagmati','Kathmandu','Kathmandu','Dallu'),(41,'Nepal','Bagmati','Kathmandu','Kathmandu','Chhetrapati'),(42,'Nepal','Bagmati','Kathmandu','Kathmandu','Thamel'),(43,'Nepal','Bagmati','Kathmandu','Kathmandu','Dhalko'),(44,'Nepal','Bagmati','bhaktapur','bhaktapur','chowk'),(45,'Nepal','Bagmati','Kathmandu','Kathmandu','Khusibu');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `login_id` int(10) NOT NULL,
  `userdetails_id` int(10) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `FKAdmin762029` (`userdetails_id`),
  KEY `FKAdmin734870` (`login_id`),
  CONSTRAINT `FKAdmin734870` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKAdmin762029` FOREIGN KEY (`userdetails_id`) REFERENCES `user_details` (`userdetails_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `brand_id` int(10) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (3,'Lenovo'),(6,'HP'),(7,'Dell'),(9,'Acer'),(10,'Brother'),(11,'Cannon'),(12,'Gucci'),(13,'Ralph Lauren'),(14,'Forever 21'),(15,'Addidas'),(16,'Nike'),(17,'Nextbit Robin'),(18,'Apple'),(19,'RayBan'),(20,'Dark Hours');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` int(10) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `rate` int(10) DEFAULT NULL,
  `product_id` int(10) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `FKCart322845` (`product_id`),
  KEY `FKCart812621` (`order_id`),
  CONSTRAINT `FKCart322845` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `FKCart812621` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(32) DEFAULT NULL,
  `parent_id` int(10) DEFAULT '1',
  PRIMARY KEY (`category_id`),
  KEY `FKCategory549056` (`parent_id`),
  CONSTRAINT `FKCategory549056` FOREIGN KEY (`parent_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'No Parent Category',1),(2,'Electronics',1),(3,'Clothes',1),(4,'Shoes',1),(5,'Women\'s Shoes',4),(9,'Women\'s Clothes',3),(10,'Phone',2),(11,'Men\'s Clothes',3),(12,'Laptop',2),(13,'Men\'s Shoes',4),(14,'Camera',2),(15,'Accessories',1),(16,'Bag',15);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL AUTO_INCREMENT,
  `login_id` int(10) DEFAULT NULL,
  `userdetails_id` int(10) DEFAULT NULL,
  `address_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `FKCustomer465884` (`userdetails_id`),
  KEY `FKCustomer76555` (`address_id`),
  KEY `FKCustomer968983` (`login_id`),
  CONSTRAINT `FKCustomer465884` FOREIGN KEY (`userdetails_id`) REFERENCES `user_details` (`userdetails_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKCustomer76555` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKCustomer968983` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,42,43),(2,2,43,44),(3,3,44,45);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `login_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `user_status` tinyint(1) DEFAULT '1',
  `register_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'lee','lee',1,'2016-08-03 06:46:35'),(2,'sabin','sabin',1,'2016-08-03 09:01:57'),(3,'ritu','ritu',NULL,NULL);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` varchar(255) NOT NULL,
  `order_details_id` int(10) NOT NULL,
  `sync_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FKOrder367828` (`order_details_id`),
  CONSTRAINT `FKOrder367828` FOREIGN KEY (`order_details_id`) REFERENCES `order_details` (`order_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `order_details_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT NULL,
  `shipping_date` timestamp NULL DEFAULT NULL,
  `shipping_amount` double DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL,
  `discount` double DEFAULT NULL,
  `grandtotal` double DEFAULT NULL,
  PRIMARY KEY (`order_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_invoice`
--

DROP TABLE IF EXISTS `order_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_invoice` (
  `order_invoice_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL,
  `invoice_date` timestamp NULL DEFAULT NULL,
  `invoice_details_id` int(10) NOT NULL,
  PRIMARY KEY (`order_invoice_id`),
  KEY `FKOrder_Invo580780` (`invoice_details_id`),
  CONSTRAINT `FKOrder_Invo580780` FOREIGN KEY (`invoice_details_id`) REFERENCES `order_invoice_details` (`invoice_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_invoice`
--

LOCK TABLES `order_invoice` WRITE;
/*!40000 ALTER TABLE `order_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_invoice_details`
--

DROP TABLE IF EXISTS `order_invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_invoice_details` (
  `invoice_details_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) DEFAULT NULL,
  `product_id` int(10) DEFAULT NULL,
  `rate` int(10) DEFAULT NULL,
  `order_quantity` int(10) DEFAULT NULL,
  `invoice_date` int(10) DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  PRIMARY KEY (`invoice_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_invoice_details`
--

LOCK TABLES `order_invoice_details` WRITE;
/*!40000 ALTER TABLE `order_invoice_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_invoice_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_return`
--

DROP TABLE IF EXISTS `order_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_return` (
  `return_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL,
  `return_details_id` int(10) NOT NULL,
  PRIMARY KEY (`return_id`),
  KEY `FKOrder_Retu637780` (`return_details_id`),
  CONSTRAINT `FKOrder_Retu637780` FOREIGN KEY (`return_details_id`) REFERENCES `order_return_details` (`return_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_return`
--

LOCK TABLES `order_return` WRITE;
/*!40000 ALTER TABLE `order_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_return_details`
--

DROP TABLE IF EXISTS `order_return_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_return_details` (
  `return_details_id` int(10) NOT NULL AUTO_INCREMENT,
  `return_type` varchar(32) DEFAULT NULL,
  `return_date` timestamp NULL DEFAULT NULL,
  `return_quantity` int(10) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  PRIMARY KEY (`return_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_return_details`
--

LOCK TABLES `order_return_details` WRITE;
/*!40000 ALTER TABLE `order_return_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_return_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_invoice_id` int(10) NOT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  `payment_details_id` int(10) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `FKPayment31852` (`payment_details_id`),
  CONSTRAINT `FKPayment31852` FOREIGN KEY (`payment_details_id`) REFERENCES `payment_details` (`payment_details_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_details` (
  `payment_details_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_id` int(10) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `rate` int(10) DEFAULT NULL,
  `tax_rate` double DEFAULT NULL,
  `tax _amount` double DEFAULT NULL,
  `discount` int(10) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  PRIMARY KEY (`payment_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(10) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `product_price` int(10) DEFAULT NULL,
  `product_quantity` int(10) DEFAULT NULL,
  `product_attribute` varchar(255) DEFAULT NULL,
  `product_entrydate` timestamp NULL DEFAULT NULL,
  `product_modifieddate` timestamp NULL DEFAULT NULL,
  `product_reorder_level` int(10) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `brand_id` int(10) DEFAULT NULL,
  `supplier_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKProduct928863` (`category_id`),
  CONSTRAINT `FKProduct928863` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Canon EOS Rebel SL1','\\public\\ProductImage\\canon.jpg','18.0 Megapixel CMOS, (APS-C) sensor, ISO range of 100-12800 (expandable to H: 25600) for stills and 100-6400 (expandable to H: 12800) for video plus up to 4.0 fps continuous shooting',50000,3,'Color: White, Touch Screen 3.0\"','2016-08-01 08:56:59','2016-08-01 09:09:43',5,14,11,31),(2,'Dell XPS 13','\\public\\ProductImage\\501452-dell-xps-13-touch-2016-gold-edition.jpg','Core i7 processor\r\nIntel Iris graphics\r\nRAM: 8 GB\r\nHarddrive: 1TB',175000,3,'Color available: White, Black','2016-08-01 09:13:56',NULL,5,12,7,30),(3,'Heels','\\public\\ProductImage\\gucci.jpg','Beautiful Gucci Heels',3000,4,'Color available: Golden, Black, Red\r\nSize: 36, 37, 38','2016-08-01 09:17:36',NULL,9,5,12,30),(4,'Hoodie','\\public\\ProductImage\\e3cd452b7387a068ad0624a92f8224d5.jpg','Rally Funnel-Neck Hoodie',2500,5,'Color available: Black, White\r\nSize: L, XL, S','2016-08-01 09:22:01',NULL,10,9,16,32),(5,'Lace Chiffon Tshirt','\\public\\ProductImage\\chiffonTshirt.jpg','White Short Sleeve Lace Hem Chiffon Crop T-Shirt',1200,5,'Color available: White, Orange, Black','2016-08-01 09:32:45','2016-08-15 15:11:12',25,9,13,30),(6,'Joey SweatShirt','\\public\\ProductImage\\sweatshirt.jpg','Joey \"How you doing\" sweatshirt',1500,5,'Color available: Black, Blue','2016-08-01 09:37:32',NULL,10,11,13,30),(7,'Microsoft Surface Pro 4','\\public\\ProductImage\\surfacepro.jpg','6th Gen Intel Core m3, 128GB SSD, 4GB RAM\r\n12.3-inch PixelSense touchscreen display\r\nSurface Pen included\r\nWindows 10 Pro',150000,10,'Color: Silver, Black, White, Blue','2016-08-01 09:43:16',NULL,2,12,3,33),(8,'Nextbit Robin Smartphone','\\public\\ProductImage\\nextbitrobin.jpg','5.20-inch touchscreen \r\n2GHz hexa-core Qualcomm Snapdragon 808 processor\r\n13-mp primary camera and a 5-mp front\r\nAndroid 6.0.1',40000,3,'Color: Mint, Midnight\r\nScreen size (inches) 5.20','2016-08-01 09:51:03',NULL,3,10,17,32),(9,'Iphone 7','\\public\\ProductImage\\iphone7.jpg','Camera: primary 12mp, front 5mpOS: iOS 10Chipset: Apple A10',100000,3,'Size:	4.7 inchesColors: Space Gray, Silver, Gold, Rose Gold','2016-08-01 09:58:08','2016-08-01 09:58:40',2,10,18,32),(10,'Nike Sneakers','\\public\\ProductImage\\nike.jpg','Black Nike Sneakers',2500,10,'Color: Black, Grey','2016-08-01 10:00:41',NULL,5,13,16,31),(11,'Polo Tshirt','\\public\\ProductImage\\polo t.jpg','casual short-sleeved cotton shirt ',1200,15,'Color: Black, White','2016-08-01 10:02:30',NULL,5,11,13,30),(12,'Jacket','\\public\\ProductImage\\7b4b3057e34c47f25884b4e191fa5019.jpg','Womens Anorak Jacket with Hood and Drawstring Waist',2900,7,'Color: Green, White, Blue','2016-08-01 10:06:42',NULL,5,9,14,33),(13,'Laptop Backpack ','\\public\\ProductImage\\bag.jpg','14\" Laptop Bag, Sleek Nylon ',3000,9,'Color: Black','2016-08-01 10:10:15','2016-08-01 10:11:08',2,16,12,33),(14,'R-B Sunglasses ','\\public\\ProductImage\\rayban.jpg','Summer R-B Sunglasses ',3000,15,'Color: Black, Brown','2016-08-01 10:13:03',NULL,4,15,19,30),(15,'Essential - Dark Hours','\\public\\ProductImage\\watch.jpg','40 mm diameter, brushed stainless steel case,  DLC coating, sleek design,',5000,12,'Color: Black','2016-08-01 10:16:41','2016-08-02 07:07:05',5,15,20,32),(16,'Shoes','\\public\\ProductImage\\shoes.jpg','.....................',3000,8,'Color: Black','2016-08-01 10:19:34',NULL,3,5,12,32),(18,'q','\\public\\ProductImage\\7b4b3057e34c47f25884b4e191fa5019.jpg','qq',NULL,NULL,'q','2016-08-17 04:22:58',NULL,NULL,3,3,30),(19,'w','\\public\\ProductImage\\tshirt.jpg','w',NULL,NULL,'w','2016-08-17 05:45:45',NULL,NULL,3,12,30);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_brand`
--

DROP TABLE IF EXISTS `product_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_brand` (
  `Productproduct_id` int(10) NOT NULL,
  `Brandbrand_id` int(10) NOT NULL,
  PRIMARY KEY (`Productproduct_id`,`Brandbrand_id`),
  KEY `FKProduct_Br593230` (`Productproduct_id`),
  KEY `FKProduct_Br899657` (`Brandbrand_id`),
  CONSTRAINT `FKProduct_Br593230` FOREIGN KEY (`Productproduct_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKProduct_Br899657` FOREIGN KEY (`Brandbrand_id`) REFERENCES `brand` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_brand`
--

LOCK TABLES `product_brand` WRITE;
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_supplier`
--

DROP TABLE IF EXISTS `product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_supplier` (
  `Productproduct_id` int(10) NOT NULL,
  `Suppliersupplier_id` int(10) NOT NULL,
  PRIMARY KEY (`Productproduct_id`,`Suppliersupplier_id`),
  KEY `FKProduct_Su256965` (`Productproduct_id`),
  KEY `FKProduct_Su900289` (`Suppliersupplier_id`),
  CONSTRAINT `FKProduct_Su256965` FOREIGN KEY (`Productproduct_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKProduct_Su900289` FOREIGN KEY (`Suppliersupplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supplier`
--

LOCK TABLES `product_supplier` WRITE;
/*!40000 ALTER TABLE `product_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplier_id` int(10) NOT NULL AUTO_INCREMENT,
  `address_id` int(10) NOT NULL,
  `userdetails_id` int(10) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  KEY `FKSupplier16851` (`userdetails_id`),
  KEY `FKSupplier412300` (`address_id`),
  CONSTRAINT `FKSupplier16851` FOREIGN KEY (`userdetails_id`) REFERENCES `user_details` (`userdetails_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKSupplier412300` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (30,39,38),(31,40,39),(32,41,40),(33,42,41);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `userdetails_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `user_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`userdetails_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (38,'Shajish','Manandhar','shajish@gmail.com','9841','supplier'),(39,'Nischal','Shakya','nischal@gmail.com','9841','supplier'),(40,'Eliza','Shilakar','elzodon@gmail.com','9849','supplier'),(41,'Ashok ','Shrestha','ashok@gmail.com','9841','supplier'),(42,'Leesa','Shakya','leezshk@gmail.com','984933','customer'),(43,'Sabin','Koju','sabinkoju72@gmail.com','9843','customer'),(44,'Ritu','Maharjan','mhrzn.ritu@gmail.com','9841','customer');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-02 15:29:54
