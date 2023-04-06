CREATE DATABASE  IF NOT EXISTS `RestaurantApp01` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `RestaurantApp01`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: RestaurantApp01
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20230406175109_AddInitial','6.0.0'),('20230406204606_SeedData','6.0.0'),('20230406205929_FinalSeedData','6.0.0');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetRoleClaims`
--

DROP TABLE IF EXISTS `AspNetRoleClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoleClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoleClaims`
--

LOCK TABLES `AspNetRoleClaims` WRITE;
/*!40000 ALTER TABLE `AspNetRoleClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetRoleClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetRoles`
--

DROP TABLE IF EXISTS `AspNetRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoles`
--

LOCK TABLES `AspNetRoles` WRITE;
/*!40000 ALTER TABLE `AspNetRoles` DISABLE KEYS */;
INSERT INTO `AspNetRoles` VALUES ('2bb4fe97-2c0d-4180-ba24-e27d992d5103','RegUser','REGUSER','9ede54d9-1940-49b8-954f-bb3757c7da2b'),('89b33488-92b2-4f85-86f9-f073812c2264','Admin','ADMIN','804b132f-6833-476e-be70-b62af508bcc9');
/*!40000 ALTER TABLE `AspNetRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserClaims`
--

DROP TABLE IF EXISTS `AspNetUserClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserClaims`
--

LOCK TABLES `AspNetUserClaims` WRITE;
/*!40000 ALTER TABLE `AspNetUserClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserLogins`
--

DROP TABLE IF EXISTS `AspNetUserLogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserLogins`
--

LOCK TABLES `AspNetUserLogins` WRITE;
/*!40000 ALTER TABLE `AspNetUserLogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserLogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserRoles`
--

DROP TABLE IF EXISTS `AspNetUserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserRoles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserRoles`
--

LOCK TABLES `AspNetUserRoles` WRITE;
/*!40000 ALTER TABLE `AspNetUserRoles` DISABLE KEYS */;
INSERT INTO `AspNetUserRoles` VALUES ('a87676fb-c778-4b5c-a439-1028d746547d','2bb4fe97-2c0d-4180-ba24-e27d992d5103'),('cca60aad-9b2e-46fc-863b-bc935dcfdf7f','89b33488-92b2-4f85-86f9-f073812c2264');
/*!40000 ALTER TABLE `AspNetUserRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUsers`
--

DROP TABLE IF EXISTS `AspNetUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUsers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUsers`
--

LOCK TABLES `AspNetUsers` WRITE;
/*!40000 ALTER TABLE `AspNetUsers` DISABLE KEYS */;
INSERT INTO `AspNetUsers` VALUES ('493aa8c0-fa25-46bf-a503-47ab37b0fffa','Michael@email.com','MICHAEL@EMAIL.COM','Michael@email.com','MICHAEL@EMAIL.COM',0,'AQAAAAEAACcQAAAAENkbaOzNuz2rW6KGG5LMKHXC/u2yrITvgRtVHkRA1EhYfONp4SpVZSKbsKI9erOExA==','3XSWFLUEJQUXRCKWMRAW4KHXLGSNEW4E','e0d31776-505f-463a-a4d1-67532de2e15d',NULL,0,0,NULL,1,0),('55919fdf-0943-40ae-99d4-6dacdee31c39','Brent@email.com','BRENT@EMAIL.COM','Brent@email.com','BRENT@EMAIL.COM',0,'AQAAAAEAACcQAAAAEJx19GhLJsTOOGXOxam8jB1WJMCBElkp+5GmwJVXlPTyDl1/Lqw/8GIK1u73kV9l9w==','24JXLLRGAMKUBXWKFYOZO2B7JLJWJOD4','36bb1a66-cdf2-4409-a0af-fc369adb2359',NULL,0,0,NULL,1,0),('a87676fb-c778-4b5c-a439-1028d746547d','User','USER','User@email.com','USER@EMAIL.COM',0,'AQAAAAEAACcQAAAAEOYvN1XaRT1Yj1/fvXHlWuaUwrE/m+Nu99xMthhFghzBrVRuc0weidI2jtFEnyvRag==','6RBNUALTWVQLQ5JNNO3UROLVKBAJEJKI','d398366d-c28b-4509-9e1d-70415fd13cbd',NULL,0,0,NULL,1,0),('bad7d0b6-0a64-4033-9c5c-3952b3b87854','Nick@email.com','NICK@EMAIL.COM','Nick@email.com','NICK@EMAIL.COM',0,'AQAAAAEAACcQAAAAEDLwCBx1TrsVJ/sw/wxxnE1/aUAWsE16z0c8SupxhRthHvdlupFHkEw8sAKXV+DFZQ==','6IK5FU2TCKCTSJWZUB2F3EEVTKZHNH36','185b38ca-b449-4ef5-a04f-c34df8e4fab2',NULL,0,0,NULL,1,0),('cca60aad-9b2e-46fc-863b-bc935dcfdf7f','Admin','ADMIN','Admin@email.com','ADMIN@EMAIL.COM',0,'AQAAAAEAACcQAAAAEN5BP4eBh8vjjJ7h8Mp6jZ8f9LOaH3qy1FHqe7CyqJGVjWy8GwRDI5wU0Yqd/zmV6w==','HCCA5J5BIJVLDDM2BA5PEMIV5VJ4UHPY','9a95d218-24bd-4358-bdfc-15ed32a95ada',NULL,0,0,NULL,1,0),('fbc529d4-7415-424e-9224-fbcea56cbd46','Viradeth@email.com','VIRADETH@EMAIL.COM','Viradeth@email.com','VIRADETH@EMAIL.COM',0,'AQAAAAEAACcQAAAAEHCkDsoqtSZx3phl1ctxeShtwGJEMLD3g0ysZLsrTz/MomTg8p0JGOGxAxtUgmlLbw==','4PU3I5FPVENIS4M7XZQ4NNJPWPGTA3FJ','50ac8296-b5cc-42d1-8791-d82b81461267',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `AspNetUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserTokens`
--

DROP TABLE IF EXISTS `AspNetUserTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserTokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserTokens`
--

LOCK TABLES `AspNetUserTokens` WRITE;
/*!40000 ALTER TABLE `AspNetUserTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Items` (
  `ItemId` int NOT NULL AUTO_INCREMENT,
  `ItemName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ItemPrice` double NOT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ItemId`),
  KEY `IX_Items_UserId` (`UserId`),
  CONSTRAINT `FK_Items_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
INSERT INTO `Items` VALUES (1,'Burrito',1.5,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(2,'Taco',0.99,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(3,'Spaghetti',25.5,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(4,'Black Coffee',4.25,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(5,'Big Burger',12.5,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(6,'Fries',7.75,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(7,'Dream Shake',8.5,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(8,'Mocha',6.25,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(9,'18\" Pepperoni Pizza',24.5,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(10,'Calzone',15.05,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(11,'Green Curry',13.95,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(12,'Salad Rolls',5,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f'),(13,'Ravioli',15.95,'cca60aad-9b2e-46fc-863b-bc935dcfdf7f');
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RestaurantItems`
--

DROP TABLE IF EXISTS `RestaurantItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RestaurantItems` (
  `RestaurantItemId` int NOT NULL AUTO_INCREMENT,
  `RestaurantId` int NOT NULL,
  `ItemId` int NOT NULL,
  PRIMARY KEY (`RestaurantItemId`),
  KEY `IX_RestaurantItems_ItemId` (`ItemId`),
  KEY `IX_RestaurantItems_RestaurantId` (`RestaurantId`),
  CONSTRAINT `FK_RestaurantItems_Items_ItemId` FOREIGN KEY (`ItemId`) REFERENCES `Items` (`ItemId`) ON DELETE CASCADE,
  CONSTRAINT `FK_RestaurantItems_Restaurants_RestaurantId` FOREIGN KEY (`RestaurantId`) REFERENCES `Restaurants` (`RestaurantId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestaurantItems`
--

LOCK TABLES `RestaurantItems` WRITE;
/*!40000 ALTER TABLE `RestaurantItems` DISABLE KEYS */;
INSERT INTO `RestaurantItems` VALUES (2,1,2),(3,2,5),(4,2,6),(5,6,3),(6,3,4),(7,2,7),(8,3,8),(9,4,9),(10,4,10),(11,5,11),(12,5,12),(13,6,13),(14,1,1);
/*!40000 ALTER TABLE `RestaurantItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RestaurantReviews`
--

DROP TABLE IF EXISTS `RestaurantReviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RestaurantReviews` (
  `RestaurantReviewId` int NOT NULL AUTO_INCREMENT,
  `RestaurantId` int NOT NULL,
  `ReviewId` int NOT NULL,
  PRIMARY KEY (`RestaurantReviewId`),
  KEY `IX_RestaurantReviews_RestaurantId` (`RestaurantId`),
  KEY `IX_RestaurantReviews_ReviewId` (`ReviewId`),
  CONSTRAINT `FK_RestaurantReviews_Restaurants_RestaurantId` FOREIGN KEY (`RestaurantId`) REFERENCES `Restaurants` (`RestaurantId`) ON DELETE CASCADE,
  CONSTRAINT `FK_RestaurantReviews_Reviews_ReviewId` FOREIGN KEY (`ReviewId`) REFERENCES `Reviews` (`ReviewId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestaurantReviews`
--

LOCK TABLES `RestaurantReviews` WRITE;
/*!40000 ALTER TABLE `RestaurantReviews` DISABLE KEYS */;
INSERT INTO `RestaurantReviews` VALUES (7,1,7),(8,2,8),(9,3,9),(10,4,10),(11,5,11),(12,6,12),(13,1,13),(14,2,14),(15,3,15),(16,4,16),(17,5,17),(18,6,18),(19,1,19),(20,2,20),(21,3,21),(22,4,22),(23,5,23),(24,6,24),(25,1,25),(26,2,26),(27,3,27),(28,4,28),(29,5,29);
/*!40000 ALTER TABLE `RestaurantReviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurants`
--

DROP TABLE IF EXISTS `Restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Restaurants` (
  `RestaurantId` int NOT NULL AUTO_INCREMENT,
  `RestaurantName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RestaurantHours` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `RestaurantRating` double NOT NULL,
  PRIMARY KEY (`RestaurantId`),
  KEY `IX_Restaurants_UserId` (`UserId`),
  CONSTRAINT `FK_Restaurants_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurants`
--

LOCK TABLES `Restaurants` WRITE;
/*!40000 ALTER TABLE `Restaurants` DISABLE KEYS */;
INSERT INTO `Restaurants` VALUES (1,'Taco Bell','Forever',NULL,5.5),(2,'Joe\'s','6am-5pm',NULL,7.75),(3,'Cafe Whatever','6am-2:30pm',NULL,7.5),(4,'Pizza Palace','11pm -12am',NULL,5.25),(5,'Thai Ginger','10:30pm - 9pm',NULL,8),(6,'Little Italy','10am - 11pm',NULL,7);
/*!40000 ALTER TABLE `Restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `ReviewId` int NOT NULL AUTO_INCREMENT,
  `ReviewTitle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ReviewText` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ReviewDate` datetime(6) NOT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ReviewRating` double NOT NULL,
  PRIMARY KEY (`ReviewId`),
  KEY `IX_Reviews_UserId` (`UserId`),
  CONSTRAINT `FK_Reviews_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (7,'I love Taco Bell','Wow, everything on the menu is PERFECT!','0001-01-01 00:00:00.000000','55919fdf-0943-40ae-99d4-6dacdee31c39',10),(8,'Terrible ','Joe\'s smells bad. I don\'t like it :(','0001-01-01 00:00:00.000000','55919fdf-0943-40ae-99d4-6dacdee31c39',2),(9,'Great Mocha','The Mocha, is very good.','0001-01-01 00:00:00.000000','55919fdf-0943-40ae-99d4-6dacdee31c39',10),(10,'Pizza Rules','Pizza is always good.','0001-01-01 00:00:00.000000','55919fdf-0943-40ae-99d4-6dacdee31c39',9),(11,'Great','The salad rolls are great, large serving of peanut sauce.','0001-01-01 00:00:00.000000','55919fdf-0943-40ae-99d4-6dacdee31c39',9),(12,'Terrible','The spaghetti is a pretty bad value.','0001-01-01 00:00:00.000000','55919fdf-0943-40ae-99d4-6dacdee31c39',1),(13,'Terrible','I feel sick','0001-01-01 00:00:00.000000','493aa8c0-fa25-46bf-a503-47ab37b0fffa',1),(14,'I love Joe\'s','Cant go wrong with the Big burger and fries.','0001-01-01 00:00:00.000000','493aa8c0-fa25-46bf-a503-47ab37b0fffa',10),(15,'Terrible','I ordered a soymilk mocha and they gave me something else.','0001-01-01 00:00:00.000000','493aa8c0-fa25-46bf-a503-47ab37b0fffa',1),(16,'WOW','Great Pizza','0001-01-01 00:00:00.000000','493aa8c0-fa25-46bf-a503-47ab37b0fffa',10),(17,'Okay','The curry isn\'t bad.','0001-01-01 00:00:00.000000','493aa8c0-fa25-46bf-a503-47ab37b0fffa',6),(18,'Super','The Ravioli is my favorite','0001-01-01 00:00:00.000000','493aa8c0-fa25-46bf-a503-47ab37b0fffa',10),(19,'Great','Eating great, even late','0001-01-01 00:00:00.000000','bad7d0b6-0a64-4033-9c5c-3952b3b87854',10),(20,'Joes is my favorite','Love everything they make','0001-01-01 00:00:00.000000','bad7d0b6-0a64-4033-9c5c-3952b3b87854',10),(21,'WOW','GREAT','0001-01-01 00:00:00.000000','bad7d0b6-0a64-4033-9c5c-3952b3b87854',9),(22,'Terrible','I HATE PIZZA','0001-01-01 00:00:00.000000','bad7d0b6-0a64-4033-9c5c-3952b3b87854',1),(23,'Pretty Good','I go here a few times a month and its fine.','0001-01-01 00:00:00.000000','bad7d0b6-0a64-4033-9c5c-3952b3b87854',7),(24,'Super','Get the Spaghetti','0001-01-01 00:00:00.000000','bad7d0b6-0a64-4033-9c5c-3952b3b87854',10),(25,'Terrible','khjk','0001-01-01 00:00:00.000000','fbc529d4-7415-424e-9224-fbcea56cbd46',1),(26,'Great','Good Shakes','0001-01-01 00:00:00.000000','fbc529d4-7415-424e-9224-fbcea56cbd46',9),(27,'Super','Amazing','0001-01-01 00:00:00.000000','fbc529d4-7415-424e-9224-fbcea56cbd46',10),(28,'Terrible','Horrible','0001-01-01 00:00:00.000000','fbc529d4-7415-424e-9224-fbcea56cbd46',1),(29,'WOW','GREAT','0001-01-01 00:00:00.000000','fbc529d4-7415-424e-9224-fbcea56cbd46',10);
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-06 14:17:59
