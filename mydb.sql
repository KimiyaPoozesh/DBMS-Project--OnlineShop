CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `strAddress` varchar(45) NOT NULL,
  `postalCode` int NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `plate` int unsigned DEFAULT NULL,
  `ownerID` int NOT NULL,
  PRIMARY KEY (`postalCode`,`ownerID`),
  KEY `CstID_idx` (`ownerID`),
  CONSTRAINT `ownID` FOREIGN KEY (`ownerID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('farshad 18',848856,'esfahan',555,10),('bahar 20',54338856,'shiraz',555,11),('bahar 15',54848856,'tehran',555,2),('bahar 15',54850856,'tehran',555,8),('sajad 45',55848856,'rasht',555,3),('namaz 15',66648856,'semnan',555,9),('haftetir 15',77848856,'tehran',555,5),('honarestan 3',88848856,'tehran',555,4),('bahar 5',89848856,'amol',555,6),('niloofar 15',98848856,'chabahar',555,7),('baHonar 2',99125687,'mashhad',12,1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `idAdmin` int NOT NULL,
  PRIMARY KEY (`idAdmin`),
  CONSTRAINT `user-admID` FOREIGN KEY (`idAdmin`) REFERENCES `user` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket` (
  `totalCost` int NOT NULL,
  `BasketID` int unsigned NOT NULL,
  PRIMARY KEY (`BasketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES (500,1),(400,2),(400,3),(400,4),(400,5),(400,6),(400,7),(400,8),(400,9),(400,10),(400,11);
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basketitem`
--

DROP TABLE IF EXISTS `basketitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basketitem` (
  `totalitemCost` int NOT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `BasketID` int unsigned NOT NULL,
  `ProdID` int NOT NULL,
  PRIMARY KEY (`BasketID`),
  KEY `prodID_idx` (`ProdID`),
  CONSTRAINT `itemProdID` FOREIGN KEY (`ProdID`) REFERENCES `product` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `targetBasketID` FOREIGN KEY (`BasketID`) REFERENCES `basket` (`BasketID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basketitem`
--

LOCK TABLES `basketitem` WRITE;
/*!40000 ALTER TABLE `basketitem` DISABLE KEYS */;
INSERT INTO `basketitem` VALUES (100,'1',1,555),(400,'2',2,506);
/*!40000 ALTER TABLE `basketitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `number` varchar(16) NOT NULL,
  `expireDate` varchar(5) DEFAULT NULL,
  `cvv2` int NOT NULL,
  `UID` int NOT NULL,
  PRIMARY KEY (`number`,`UID`),
  KEY `UID_idx` (`UID`),
  CONSTRAINT `UserID` FOREIGN KEY (`UID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES ('6104337495507456','02-09',562,1),('61045654598990','02-10',666,8),('61045655598997','02-11',789,7),('61045658598994','02-08',850,10),('61045659598995','02-03',999,9),('61045659598997','02-12',910,2),('61045659598997','02-06',210,6),('61045659598998','02-08',912,3),('61045659598999','02-05',810,4),('61045659898997','02-01',510,5);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choose`
--

DROP TABLE IF EXISTS `choose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choose` (
  `prodID` int NOT NULL,
  `cstID` int NOT NULL,
  PRIMARY KEY (`prodID`,`cstID`),
  KEY `cstID_idx` (`cstID`),
  CONSTRAINT `chosenprodID` FOREIGN KEY (`prodID`) REFERENCES `product` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `targetCstID` FOREIGN KEY (`cstID`) REFERENCES `customer` (`customerID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choose`
--

LOCK TABLES `choose` WRITE;
/*!40000 ALTER TABLE `choose` DISABLE KEYS */;
INSERT INTO `choose` VALUES (555,1),(506,2);
/*!40000 ALTER TABLE `choose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `rate` int NOT NULL,
  `text` varchar(45) DEFAULT NULL,
  `id` int NOT NULL,
  `prodID` int NOT NULL,
  `cstID` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ProdID_idx` (`prodID`),
  KEY `CustomerID_idx` (`cstID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`cstID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `targetprodID` FOREIGN KEY (`prodID`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (10,'Awli bud',54,506,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communicate`
--

DROP TABLE IF EXISTS `communicate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communicate` (
  `idAdmin` int NOT NULL,
  `idSupplier` int NOT NULL,
  PRIMARY KEY (`idAdmin`,`idSupplier`),
  KEY `idSupplier_idx` (`idSupplier`),
  CONSTRAINT `admID` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`idAdmin`),
  CONSTRAINT `idSupplier` FOREIGN KEY (`idSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communicate`
--

LOCK TABLES `communicate` WRITE;
/*!40000 ALTER TABLE `communicate` DISABLE KEYS */;
INSERT INTO `communicate` VALUES (1,1);
/*!40000 ALTER TABLE `communicate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` int NOT NULL,
  `basketID` int unsigned NOT NULL,
  PRIMARY KEY (`customerID`),
  KEY `basketID_idx` (`basketID`),
  CONSTRAINT `basketID` FOREIGN KEY (`basketID`) REFERENCES `basket` (`BasketID`),
  CONSTRAINT `cstID` FOREIGN KEY (`customerID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `arival_time` time NOT NULL,
  `ShipmentID` int NOT NULL,
  PRIMARY KEY (`ShipmentID`),
  CONSTRAINT `ShipmentID` FOREIGN KEY (`ShipmentID`) REFERENCES `shipment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES ('12:32:00',1);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `ID` int unsigned NOT NULL,
  `picture` varchar(45) DEFAULT NULL,
  `license plate` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `car pelak` varchar(45) DEFAULT NULL,
  `car model` varchar(45) DEFAULT NULL,
  `DeliveryID` int NOT NULL,
  PRIMARY KEY (`ID`,`DeliveryID`),
  KEY `ShipmentID_idx` (`DeliveryID`),
  CONSTRAINT `DeliveryID` FOREIGN KEY (`DeliveryID`) REFERENCES `delivery` (`ShipmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'asghar pic','546B4589','asghar sepehri','789A5658','mazerati',1);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factor`
--

DROP TABLE IF EXISTS `factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factor` (
  `ID` int NOT NULL,
  `date` date DEFAULT NULL,
  `BasketID` int unsigned NOT NULL,
  PRIMARY KEY (`ID`,`BasketID`),
  KEY `BasketID_idx` (`BasketID`),
  CONSTRAINT `constructorID` FOREIGN KEY (`BasketID`) REFERENCES `basket` (`BasketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factor`
--

LOCK TABLES `factor` WRITE;
/*!40000 ALTER TABLE `factor` DISABLE KEYS */;
INSERT INTO `factor` VALUES (1,'2022-12-01',1);
/*!40000 ALTER TABLE `factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `delivaryCode` int NOT NULL,
  `shipmentID` int NOT NULL,
  PRIMARY KEY (`shipmentID`),
  CONSTRAINT `ShipID` FOREIGN KEY (`shipmentID`) REFERENCES `shipment` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (486235487,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `date` date DEFAULT NULL,
  `value` int NOT NULL,
  `ProdID` int NOT NULL,
  PRIMARY KEY (`ProdID`),
  CONSTRAINT `ownerProdID` FOREIGN KEY (`ProdID`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES ('2022-06-07',500,555);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `size` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `age_range` varchar(30) DEFAULT NULL,
  `availability` int unsigned DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `AdminID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY ` AdminID_idx` (`AdminID`),
  CONSTRAINT ` AdminID` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (50,'Skirt','36','Women',20,'adult',12,'Gucci','Black',1),(506,'Shirt','XXL','Men',50,'adult',6,'zara','white',4),(507,'Pants','43','Men',0,'adult',5,'G-Star','Black',2),(508,'Pants','36','Women',20,'adult',7,'G-Star','Blue',1),(509,'Skirt','38','Women',10,'adult',4,'Gucci','White',3),(510,'Legging','40','Women',15,'adult',6,'Tie-Dye','Red',5),(511,'Sweatshirt','XXL','Men',0,'adult',5,'Lacoste','Blue',1),(512,'TrackSuit','XL','Women',20,'adult',12,'Lacoste','Black',2),(513,'Pants','32','Women',20,'kid',5,'Everlane','Blue',4),(514,'Shirt','L','Women',20,'kid',8,'Balenciaga','Pink',3),(515,'SweatShirt','S','Men',20,'kid',7,'Balenciaga','Black',2),(555,'blue dress','36','women',0,'adult',3,'Gucci','blue',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `ID` int NOT NULL,
  `arival Date` date DEFAULT NULL,
  `BasketID` int unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `BasketID_idx` (`BasketID`),
  CONSTRAINT `exportedBasketID` FOREIGN KEY (`BasketID`) REFERENCES `basket` (`BasketID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,'2022-12-01',1),(2,'2022-12-06',2);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL,
  PRIMARY KEY (`idSupplier`),
  CONSTRAINT `U-supplyID` FOREIGN KEY (`idSupplier`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply` (
  `idSupplier` int NOT NULL,
  `prodID` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`idSupplier`,`prodID`),
  KEY `prodID_idx` (`prodID`),
  CONSTRAINT `suppliedProdID` FOREIGN KEY (`prodID`) REFERENCES `product` (`ID`),
  CONSTRAINT `supplierID` FOREIGN KEY (`idSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
INSERT INTO `supply` VALUES (6, 555, 200);
INSERT INTO `supply` VALUES (7, 506, 120);
INSERT INTO `supply` VALUES (8, 507, 300);
INSERT INTO `supply` VALUES (9, 508, 250);
INSERT INTO `supply` VALUES (10, 509, 170);
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support` (
  `idAdmin` int NOT NULL,
  `idProd` int NOT NULL,
  PRIMARY KEY (`idAdmin`,`idProd`),
  KEY `idProd_idx` (`idProd`),
  CONSTRAINT `idAdmin` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`idAdmin`),
  CONSTRAINT `idProd` FOREIGN KEY (`idProd`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
INSERT INTO `support` VALUES (1,555);
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ID` int NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phonenumber` varchar(11) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `userName` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mostafa','mostafa123','9024561189','girl','mosi'),(2,'fatemeh','12kode45','9155487589','girl','fati'),(3,'kimiya','kimkim','9155487779','girl','kim'),(4,'pedram','pedo','9155557589','boy','ped'),(5,'alasti','amir','9995487589','boy','niloufar'),(6,'sonia','sisi','9159987589','girl','xxx'),(7,'mohammad','mmd45','9155487589','boy','mmd'),(8,'ali','rezrez','9155487589','boy','aliz'),(9,'kouroush','btch','9155487589','boy','kouri'),(10,'mahasti','masti','9155487589','girl','dava nemikone'),(11,'sharare','shshsh','9155487589','girl','sharare');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-09  9:26:07
