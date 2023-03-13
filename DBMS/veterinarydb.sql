-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 13, 2023 at 04:53 PM
-- Server version: 8.0.26
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `veterinarydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appointmentNo` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointmentDate` date NOT NULL,
  `petName` varchar(45) NOT NULL,
  PRIMARY KEY (`appointmentNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentNo`, `appointmentDate`, `petName`) VALUES
(1, '2023-03-08', 'Link'),
(2, '2023-03-09', 'Killer'),
(3, '2023-03-10', 'Dice'),
(4, '2023-04-12', 'Rick'),
(5, '2023-04-27', 'Miles'),
(6, '2023-05-08', 'Sonic'),
(7, '2023-06-12', 'Buddy');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `billId` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `patientNo` tinyint UNSIGNED NOT NULL,
  `paymentId` tinyint UNSIGNED NOT NULL,
  `cost` double NOT NULL,
  PRIMARY KEY (`billId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`billId`, `patientNo`, `paymentId`, `cost`) VALUES
(1, 100, 200, 50),
(2, 101, 201, 250),
(3, 102, 202, 350),
(4, 103, 203, 230),
(5, 104, 204, 120),
(6, 105, 205, 150);

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
CREATE TABLE IF NOT EXISTS `medication` (
  `medicationNo` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `vetenarianNo` tinyint UNSIGNED NOT NULL,
  `treatmentDetails` varchar(200) DEFAULT NULL,
  `status` enum('Complete','onGoing','NotStarted') DEFAULT NULL,
  PRIMARY KEY (`medicationNo`),
  KEY `vetenarianNo` (`vetenarianNo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `medication`
--

INSERT INTO `medication` (`medicationNo`, `vetenarianNo`, `treatmentDetails`, `status`) VALUES
(1, 1, 'Prescription', 'NotStarted'),
(2, 2, 'Surgery', 'onGoing'),
(3, 3, 'Surgery', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `paymentId` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `billId` tinyint UNSIGNED NOT NULL,
  `method` enum('Cash','Cheque','Mastercard','Visa','BTC') DEFAULT NULL,
  `recievedBy` enum('Online','handedIn','Upfront') DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `billId` (`billId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `billId`, `method`, `recievedBy`) VALUES
(1, 1, 'Cash', 'Online'),
(2, 1, 'Visa', 'handedIn'),
(4, 3, 'Visa', 'Online');

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

DROP TABLE IF EXISTS `pet`;
CREATE TABLE IF NOT EXISTS `pet` (
  `ownerID` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `patientNo` tinyint UNSIGNED NOT NULL,
  `petName` varchar(45) NOT NULL,
  `appointmentNo` tinyint UNSIGNED NOT NULL,
  `species` enum('Dog','Cat','Hamster','Bird') NOT NULL,
  PRIMARY KEY (`ownerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`ownerID`, `patientNo`, `petName`, `appointmentNo`, `species`) VALUES
(1, 1, 'Link', 1, 'Cat'),
(1, 2, 'Ilias', 2, 'Cat'),
(2, 3, 'Drogon', 3, 'Cat'),
(2, 4, 'Mink', 4, 'Bird'),
(3, 5, 'Killer', 5, 'Dog'),
(4, 6, 'Dice', 6, 'Bird'),
(5, 7, 'Kiba', 7, 'Hamster'),
(6, 8, 'Buddy', 8, 'Dog');
(4, 9, 'Yoru', 9, 'Hamster');

-- --------------------------------------------------------

--
-- Table structure for table `petowners`
--

DROP TABLE IF EXISTS `petowners`;
CREATE TABLE IF NOT EXISTS `petowners` (
  `ownerID` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `addy` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `ccdetails` varchar(45) NOT NULL,
  `appointmentNo` tinyint UNSIGNED NOT NULL,
  `billId` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`ownerID`),
  KEY `appointmentNo` (`appointmentNo`),
  KEY `billId` (`billId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `petowners`
--

INSERT INTO `petowners` (`ownerID`, `name`, `lastName`, `addy`, `email`, `ccdetails`, `appointmentNo`, `billId`) VALUES
(1, 'John', 'Doe', 'Donegal', 'johndoe@example.com', '9876-5678-7654-3456', 1, 1),
(2, 'Jane', 'Smith', 'Meath', 'janesmith@example.com', '9876-5432-1098-7654', 2, 2),
(3, 'Akeem', 'Joko', 'Longford', 'akeemjoko@example.com', '4319-7654-2081-8391', 3, 3),
(4, 'Kaido', 'Yamato', 'Cork', 'beastking@example.com', '4319-5678-2081-8391', 4, 4),
(5, 'Zoro', 'Roronoa', 'Galway', 'hunterzoro@example.com', '4319-5678-5432-9012', 5, 5),
(6, 'Xebeck', 'Theach', 'Dublin', 'xebeckdthea@example.com', '4319-9012-2081-7654', 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staffId` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `staffpicture` longblob,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`staffId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffId`, `firstName`, `lastName`, `staffpicture`, `path`) VALUES
(1, 'Liam', 'Savage', NULL, '/staff1.jpeg'),
(2, 'Emma', 'Watson', NULL, '/staff2.jpeg'),
(3, 'William', 'Smith', NULL, '/staff3.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `vetenarian`
--

DROP TABLE IF EXISTS `vetenarian`;
CREATE TABLE IF NOT EXISTS `vetenarian` (
  `vetenarianNo` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `specialist` enum('Vet','Surgeon','dentist') NOT NULL,
  `veterinarianFirstName` varchar(45) DEFAULT NULL,
  `vetenarianLastName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vetenarianNo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vetenarian`
--

INSERT INTO `vetenarian` (`vetenarianNo`, `specialist`, `veterinarianFirstName`, `vetenarianLastName`) VALUES
(1, 'Vet', 'John', 'Smith'),
(2, 'Surgeon', 'Jane', 'Doe'),
(3, 'dentist', 'David', 'Lee');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medication`
--
ALTER TABLE `medication`
  ADD CONSTRAINT `medication_ibfk_1` FOREIGN KEY (`vetenarianNo`) REFERENCES `vetenarian` (`vetenarianNo`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`billId`) REFERENCES `bill` (`billId`);

--
-- Constraints for table `petowners`
--
ALTER TABLE `petowners`
  ADD CONSTRAINT `petowners_ibfk_1` FOREIGN KEY (`appointmentNo`) REFERENCES `appointment` (`appointmentNo`),
  ADD CONSTRAINT `petowners_ibfk_2` FOREIGN KEY (`billId`) REFERENCES `bill` (`billId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
