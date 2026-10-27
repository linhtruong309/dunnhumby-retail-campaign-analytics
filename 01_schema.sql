CREATE DATABASE  IF NOT EXISTS `promo_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `promo_db`;
-- MySQL dump 10.13  Distrib 8.0.44, for macos15 (arm64)
--
-- Host: localhost    Database: promo_db
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
--
-- Table structure for table `campaign_desc`
--

DROP TABLE IF EXISTS `campaign_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_desc` (
  `DESCRIPTION` varchar(5) DEFAULT NULL,
  `CAMPAIGN` int DEFAULT NULL,
  `START_DAY` int DEFAULT NULL,
  `END_DAY` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_table`
--

DROP TABLE IF EXISTS `campaign_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_table` (
  `DESCRIPTION` varchar(5) DEFAULT NULL,
  `household_key` int DEFAULT NULL,
  `CAMPAIGN` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coupon_redempt`
--

DROP TABLE IF EXISTS `coupon_redempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon_redempt` (
  `household_key` int DEFAULT NULL,
  `DAY` int DEFAULT NULL,
  `COUPON_UPC` bigint DEFAULT NULL,
  `CAMPAIGN` int DEFAULT NULL,
  KEY `idx_cr_hh` (`household_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hh_demographic`
--

DROP TABLE IF EXISTS `hh_demographic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hh_demographic` (
  `AGE_DESC` varchar(10) DEFAULT NULL,
  `MARITAL_STATUS_CODE` varchar(5) DEFAULT NULL,
  `INCOME_DESC` varchar(20) DEFAULT NULL,
  `HOMEOWNER_DESC` varchar(30) DEFAULT NULL,
  `HH_COMP_DESC` varchar(40) DEFAULT NULL,
  `HOUSEHOLD_SIZE_DESC` varchar(10) DEFAULT NULL,
  `KID_CATEGORY_DESC` varchar(20) DEFAULT NULL,
  `household_key` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRODUCT_ID` bigint NOT NULL,
  `MANUFACTURER` int DEFAULT NULL,
  `DEPARTMENT` varchar(50) DEFAULT NULL,
  `BRAND` varchar(20) DEFAULT NULL,
  `COMMODITY_DESC` varchar(100) DEFAULT NULL,
  `SUB_COMMODITY_DESC` varchar(100) DEFAULT NULL,
  `CURR_SIZE_OF_PRODUCT` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_data`
--

DROP TABLE IF EXISTS `transaction_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_data` (
  `household_key` int DEFAULT NULL,
  `BASKET_ID` bigint DEFAULT NULL,
  `DAY` int DEFAULT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  `QUANTITY` int DEFAULT NULL,
  `SALES_VALUE` decimal(10,2) DEFAULT NULL,
  `STORE_ID` int DEFAULT NULL,
  `RETAIL_DISC` decimal(10,2) DEFAULT NULL,
  `TRANS_TIME` int DEFAULT NULL,
  `WEEK_NO` int DEFAULT NULL,
  `COUPON_DISC` decimal(10,2) DEFAULT NULL,
  `COUPON_MATCH_DISC` decimal(10,2) DEFAULT NULL,
  KEY `idx_tx_day` (`DAY`),
  KEY `idx_tx_hh` (`household_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_campaign_summary`
--

DROP TABLE IF EXISTS `vw_campaign_summary`;
/*!50001 DROP VIEW IF EXISTS `vw_campaign_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_campaign_summary` AS SELECT 
 1 AS `CAMPAIGN`,
 1 AS `campaign_type`,
 1 AS `START_DAY`,
 1 AS `END_DAY`,
 1 AS `targeted_households`,
 1 AS `redeeming_households`,
 1 AS `total_redemptions`,
 1 AS `redemption_rate`,
 1 AS `total_coupon_discount`,
 1 AS `cost_per_redemption`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_campaign_summary`
--

/*!50001 DROP VIEW IF EXISTS `vw_campaign_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_campaign_summary` AS select `tg`.`CAMPAIGN` AS `CAMPAIGN`,`cd`.`DESCRIPTION` AS `campaign_type`,`cd`.`START_DAY` AS `START_DAY`,`cd`.`END_DAY` AS `END_DAY`,`tg`.`targeted_households` AS `targeted_households`,coalesce(`rd`.`redeeming_households`,0) AS `redeeming_households`,coalesce(`rd`.`total_redemptions`,0) AS `total_redemptions`,round((coalesce(`rd`.`redeeming_households`,0) / nullif(`tg`.`targeted_households`,0)),4) AS `redemption_rate`,round(`dc`.`total_coupon_discount`,2) AS `total_coupon_discount`,round((`dc`.`total_coupon_discount` / nullif(`rd`.`total_redemptions`,0)),2) AS `cost_per_redemption` from ((((select `campaign_table`.`CAMPAIGN` AS `CAMPAIGN`,count(distinct `campaign_table`.`household_key`) AS `targeted_households` from `campaign_table` group by `campaign_table`.`CAMPAIGN`) `tg` join `campaign_desc` `cd` on((`tg`.`CAMPAIGN` = `cd`.`CAMPAIGN`))) left join (select `coupon_redempt`.`CAMPAIGN` AS `CAMPAIGN`,count(distinct `coupon_redempt`.`household_key`) AS `redeeming_households`,count(0) AS `total_redemptions` from `coupon_redempt` group by `coupon_redempt`.`CAMPAIGN`) `rd` on((`tg`.`CAMPAIGN` = `rd`.`CAMPAIGN`))) left join (select `x`.`CAMPAIGN` AS `CAMPAIGN`,sum(`dd`.`daily_disc`) AS `total_coupon_discount` from ((select distinct `coupon_redempt`.`household_key` AS `household_key`,`coupon_redempt`.`CAMPAIGN` AS `CAMPAIGN`,`coupon_redempt`.`DAY` AS `DAY` from `coupon_redempt`) `x` join (select `transaction_data`.`household_key` AS `household_key`,`transaction_data`.`DAY` AS `DAY`,sum(abs(`transaction_data`.`COUPON_DISC`)) AS `daily_disc` from `transaction_data` where (`transaction_data`.`COUPON_DISC` <> 0) group by `transaction_data`.`household_key`,`transaction_data`.`DAY`) `dd` on(((`x`.`household_key` = `dd`.`household_key`) and (`x`.`DAY` = `dd`.`DAY`)))) group by `x`.`CAMPAIGN`) `dc` on((`tg`.`CAMPAIGN` = `dc`.`CAMPAIGN`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-27 17:50:20
