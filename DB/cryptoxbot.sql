-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Host: aarambh.ipagemysql.com
-- Generation Time: Aug 04, 2020 at 05:13 AM
-- Server version: 5.6.41-84.1-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cryptoxbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `Tx_Test`
--

CREATE TABLE IF NOT EXISTS `Tx_Test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StringCol` varchar(255) NOT NULL,
  `dbconIdx` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For Texting ... not permanent data.' AUTO_INCREMENT=12526348 ;

-- --------------------------------------------------------

--
-- Table structure for table `TX_TEST_COD`
--

CREATE TABLE IF NOT EXISTS `TX_TEST_COD` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `StringCol` varchar(255) NOT NULL,
  `dbconIdx` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40779 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_API_Log`
--

CREATE TABLE IF NOT EXISTS `XB_API_Log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `Source` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Type` varchar(255) CHARACTER SET latin1 NOT NULL,
  `APIserver` varchar(255) CHARACTER SET latin1 NOT NULL,
  `APIstring` mediumtext CHARACTER SET latin1 NOT NULL,
  `JSONdata` longtext CHARACTER SET latin1 NOT NULL,
  `UserID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=404694 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_Current_DB_User`
--

CREATE TABLE IF NOT EXISTS `XB_Current_DB_User` (
  `ID` int(11) NOT NULL,
  `CU_VALUES` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `XB_EngineControlConfig`
--

CREATE TABLE IF NOT EXISTS `XB_EngineControlConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EngineName` varchar(30) NOT NULL,
  `ConfigObject` varchar(5000) NOT NULL,
  `UpdateUserID` int(11) NOT NULL,
  `UpdateTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='One row for Each Engine or other service settings. Stored JSON in ConfigObject' AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_ExchCurrenies`
--

CREATE TABLE IF NOT EXISTS `XB_ExchCurrenies` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ExchID` bigint(20) NOT NULL,
  `Pair` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Currency` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'COIN',
  `Category` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'BASE',
  `UserID` bigint(20) NOT NULL,
  `Active` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=179 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_ExchDetail`
--

CREATE TABLE IF NOT EXISTS `XB_ExchDetail` (
  `ExchID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MasterExchID` bigint(20) NOT NULL,
  `UserExchName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Exch_API_Public` mediumtext CHARACTER SET latin1 NOT NULL,
  `Exch_API_PublicVersion` mediumtext CHARACTER SET latin1 NOT NULL,
  `Exch_API_Private` mediumtext CHARACTER SET latin1 NOT NULL,
  `Exch_API_PrivateVersion` mediumtext CHARACTER SET latin1 NOT NULL,
  `UserID` bigint(20) NOT NULL,
  `ExchActive` tinyint(1) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ExchID`),
  KEY `MasterExchID` (`MasterExchID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_ExchOrderBook`
--

CREATE TABLE IF NOT EXISTS `XB_ExchOrderBook` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ExchID` bigint(20) NOT NULL,
  `Pair` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Side` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Price` double NOT NULL,
  `Quantity` double NOT NULL,
  `UserID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_ExchTicker`
--

CREATE TABLE IF NOT EXISTS `XB_ExchTicker` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `ExchID` bigint(20) NOT NULL,
  `Pair` varchar(255) CHARACTER SET latin1 NOT NULL,
  `lastTrade` double NOT NULL,
  `lowestAsk` double NOT NULL,
  `highestBid` double NOT NULL,
  `percentChange` double NOT NULL,
  `baseVolume` double NOT NULL,
  `quoteVolume` double NOT NULL,
  `high24` double NOT NULL,
  `low24` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11988972 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_ExchTriArb`
--

CREATE TABLE IF NOT EXISTS `XB_ExchTriArb` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ExchID` int(11) NOT NULL,
  `TradePair1` varchar(255) NOT NULL,
  `TradePair2` varchar(255) NOT NULL,
  `TradePair3` varchar(255) NOT NULL,
  `TriType` int(11) NOT NULL,
  `Triplet` varchar(50) NOT NULL,
  `Trade1st` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1278 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_ExchUserConfig`
--

CREATE TABLE IF NOT EXISTS `XB_ExchUserConfig` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `ExchID` bigint(20) NOT NULL,
  `ExchNickname` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Active` tinyint(1) NOT NULL,
  `UserAPI` text CHARACTER SET latin1 NOT NULL,
  `BaseCoin` int(11) NOT NULL,
  `NotifyTrade` tinyint(1) NOT NULL,
  `NotifyError` tinyint(1) NOT NULL,
  `NotifyCancel` tinyint(1) NOT NULL,
  `UserXBbudget` varchar(255) CHARACTER SET latin1 NOT NULL,
  `UserXReserved` decimal(10,2) NOT NULL,
  `UserXBbudgetTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserXBbudgetType` enum('Capped','Time') CHARACTER SET latin1 NOT NULL,
  `UserMaxOpenSell` int(11) NOT NULL COMMENT 'save in seconds',
  `UserMaxOpenBuy` int(11) NOT NULL COMMENT 'save in seconds',
  `UserMaxOpenPositions` int(11) NOT NULL,
  `UserMaxBudgetPerCoin` decimal(10,2) NOT NULL,
  `HoldPerDiffBuySell` decimal(10,2) NOT NULL COMMENT 'use this filed to save percentage of max sell and min buy difference  ',
  `stopLoss` decimal(10,2) NOT NULL COMMENT 'save stop loss percentage',
  `UserPercentBuySize` decimal(10,2) NOT NULL,
  `UserMinLotUSDBuy` varchar(255) CHARACTER SET latin1 NOT NULL,
  `UserExchCoins` longtext CHARACTER SET latin1 NOT NULL,
  `UpdateUserID` bigint(20) NOT NULL,
  `UpdateTimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_ExchUserPairConfig`
--

CREATE TABLE IF NOT EXISTS `XB_ExchUserPairConfig` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ExchID` bigint(20) NOT NULL,
  `Pair` varchar(255) CHARACTER SET latin1 NOT NULL,
  `PairBudget` double NOT NULL,
  `PairCoin` double NOT NULL,
  `UserId` bigint(20) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_Indicator`
--

CREATE TABLE IF NOT EXISTS `XB_Indicator` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IndicatorKey` mediumtext CHARACTER SET latin1 NOT NULL,
  `IndicatorName` mediumtext CHARACTER SET latin1 NOT NULL,
  `IndicatorFunction` mediumtext CHARACTER SET latin1 NOT NULL,
  `IndicatorParams` longtext CHARACTER SET latin1 NOT NULL,
  `Active` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_MasterExch`
--

CREATE TABLE IF NOT EXISTS `XB_MasterExch` (
  `MasterExchID` int(11) NOT NULL AUTO_INCREMENT,
  `MasterExchName` varchar(255) NOT NULL,
  `MasterExchActive` tinyint(1) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MasterExchID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_Strategy`
--

CREATE TABLE IF NOT EXISTS `XB_Strategy` (
  `StratID` bigint(20) NOT NULL AUTO_INCREMENT,
  `StratName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `StratFunction` mediumtext CHARACTER SET latin1 NOT NULL,
  `StratParams` longtext CHARACTER SET latin1 NOT NULL,
  `Active` tinyint(1) NOT NULL,
  PRIMARY KEY (`StratID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_StrategyGrid`
--

CREATE TABLE IF NOT EXISTS `XB_StrategyGrid` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `StratID` bigint(20) NOT NULL,
  `Type` varchar(255) CHARACTER SET latin1 NOT NULL,
  `NameKey` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Active` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_StrategyUserConfig`
--

CREATE TABLE IF NOT EXISTS `XB_StrategyUserConfig` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `ExchID` bigint(20) NOT NULL,
  `Pair` bigint(20) NOT NULL,
  `StratID` bigint(20) NOT NULL,
  `StratName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Active` tinyint(1) NOT NULL,
  `UserParams` longtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_TradeBookFills`
--

CREATE TABLE IF NOT EXISTS `XB_TradeBookFills` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `OrderParent` bigint(20) NOT NULL,
  `UserID` bigint(20) NOT NULL,
  `ExchID` bigint(20) NOT NULL,
  `Side` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Price` double NOT NULL,
  `Quantity` double NOT NULL,
  `Closed` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_TradeBookOrders`
--

CREATE TABLE IF NOT EXISTS `XB_TradeBookOrders` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserID` bigint(20) NOT NULL,
  `ExchID` bigint(20) NOT NULL,
  `Pair` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'use to store pair',
  `Side` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Price` double NOT NULL,
  `Quantity` double NOT NULL,
  `PositionID` varchar(255) CHARACTER SET latin1 NOT NULL,
  `QuantityFilled` double NOT NULL,
  `Closed` tinyint(1) NOT NULL,
  `Status` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_UserActivity`
--

CREATE TABLE IF NOT EXISTS `XB_UserActivity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UserID` bigint(20) NOT NULL,
  `Source` mediumtext CHARACTER SET latin1 NOT NULL,
  `Description` text CHARACTER SET latin1 NOT NULL,
  `Data` longtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_UserProfile`
--

CREATE TABLE IF NOT EXISTS `XB_UserProfile` (
  `UserId` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserFirstName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `UserLastName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `UserHandle` varchar(255) CHARACTER SET latin1 NOT NULL,
  `UserEmail` varchar(255) CHARACTER SET latin1 NOT NULL,
  `UserEmailValid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `UserPassword` mediumtext CHARACTER SET latin1 NOT NULL,
  `UserType` enum('admin','member') NOT NULL,
  `UserSalt` mediumtext CHARACTER SET latin1 NOT NULL,
  `UserGravitar` mediumtext CHARACTER SET latin1 NOT NULL,
  `User2FAkey` varchar(255) CHARACTER SET latin1 NOT NULL,
  `UserCreateTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdateUserID` bigint(20) NOT NULL,
  `UpdateTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IsCurrentLogin` tinyint(1) NOT NULL,
  `IsStartScript` int(11) NOT NULL COMMENT 'this indicate user click on start button and 0 indicate user click on stop button',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `XB_UserWallets`
--

CREATE TABLE IF NOT EXISTS `XB_UserWallets` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `UserWalletName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `UserWalletCoin` int(11) NOT NULL,
  `UserWalletAddress` mediumtext CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
