# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: yolo
# Generation Time: 2017-12-22 00:26:33 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Items`;

CREATE TABLE `Items` (
  `item_id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `itemName` varchar(45) NOT NULL DEFAULT ' ',
  `itemDescription` varchar(45) NOT NULL DEFAULT ' ',
  `itemPrice` int(100) NOT NULL DEFAULT '0',
  `itemUrl` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;

INSERT INTO `Items` (`item_id`, `itemName`, `itemDescription`, `itemPrice`, `itemUrl`)
VALUES
	(1,'Kanelsnegl','Med glasur',10,'https://www.testuniverset.dk/wp-content/uploads/2016/11/Q8.jpg'),
	(2,'Frøsnapper','Med birkes',10,'http://www.ebager.dk/foto/Big/20197171044-20Fr%C3%B8snapper.jpg'),
	(3,'Tebirkes','Med birkes',12,'https://www.testuniverset.dk/wp-content/uploads/2017/03/CIrcle-K.jpg'),
	(4,'Appelsinjuice','0,25 liter',15,'https://www.papirladen.dk/images/billeder/3536-p.jpg'),
	(5,'Coca cola','0,5 liter',20,'https://www.fleggaard.dk/SL/PI/637/128/115015fc-6a5f-40d7-b9a9-e8cc79cbfbd8.jpg'),
	(6,'Romkugle','Med chokolade',12,'https://www.copenhagenpastry.com/images/product/Romkugle.jpg'),
	(7,'Yoggi','Vaniliesmag',10,'https://www.arla.dk/globalassets/arla-dk/products/all-our-brands/arla-yoggi/yoggi-muesli-top-vanilje.png?preset=product-desktop'),
	(8,'Yoggi','Appelsinsmag',10,'https://www.arla.dk/globalassets/arla-dk/products/all-our-brands/arla-yoggi/yoggi-muesli-top-appelsin.png?preset=3col-desktop'),
	(10,'Kaffe','Sort kaffe',10,'http://merekaffe.dk/wp-content/uploads/2015/04/kop-kaffe.jpg');

/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Order_has_Items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Order_has_Items`;

CREATE TABLE `Order_has_Items` (
  `Items_itemId` int(100) unsigned NOT NULL,
  `Orders_orderId` int(100) unsigned NOT NULL,
  KEY `OrderId_user_relation` (`Orders_orderId`),
  KEY `ItemsId_order_relation` (`Items_itemId`),
  CONSTRAINT `ItemsId_order_relation` FOREIGN KEY (`Items_itemId`) REFERENCES `Items` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrderId_user_relation` FOREIGN KEY (`Orders_orderId`) REFERENCES `Orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Order_has_Items` WRITE;
/*!40000 ALTER TABLE `Order_has_Items` DISABLE KEYS */;

INSERT INTO `Order_has_Items` (`Items_itemId`, `Orders_orderId`)
VALUES
	(1,83),
	(10,83);

/*!40000 ALTER TABLE `Order_has_Items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Orders`;

CREATE TABLE `Orders` (
  `order_id` int(100) unsigned NOT NULL AUTO_INCREMENT,
  `orderTime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `isReady` tinyint(1) NOT NULL DEFAULT '0',
  `user_userid` int(100) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `Userid_OrderRelation` (`user_userid`),
  CONSTRAINT `Userid_OrderRelation` FOREIGN KEY (`user_userid`) REFERENCES `Users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;

INSERT INTO `Orders` (`order_id`, `orderTime`, `isReady`, `user_userid`)
VALUES
	(83,'2017-12-22 00:31:06',0,82);

/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Token`;

CREATE TABLE `Token` (
  `tokenId` int(11) NOT NULL AUTO_INCREMENT,
  `tokenString` longtext NOT NULL,
  `Users_user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`tokenId`),
  UNIQUE KEY `tokenId_UNIQUE` (`tokenId`),
  KEY `fk_Token_Users1_idx` (`Users_user_id`),
  CONSTRAINT `fk_Token_Users1` FOREIGN KEY (`Users_user_id`) REFERENCES `Users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `isPersonel` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`user_id`, `username`, `password`, `isPersonel`)
VALUES
	(82,'Frederik','e139c20787f5f692b37501cb5677b2e36fe794b50b472cc4d095ff45bba44a78',0),
	(94,'Staff','8d7176564e4060ac0f4af032e1f478333cf76b20881c2542dd47b062ee1597ff',1);

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
