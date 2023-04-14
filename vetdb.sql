-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 25, 2023 at 03:36 PM
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
-- Database: `vetdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
CREATE TABLE IF NOT EXISTS `appointments` (
  `appointmentNo` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `patientNo` tinyint UNSIGNED NOT NULL,
  `appointmentDate` date NOT NULL,
  `staffID` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`appointmentNo`),
  KEY `patientNo` (`patientNo`),
  KEY `fk_appointments_staff` (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointmentNo`, `patientNo`, `appointmentDate`, `staffID`) VALUES
(1, 10, '2023-03-28', 1),
(2, 11, '2023-03-29', 1),
(3, 12, '2023-04-01', 2),
(4, 13, '2023-04-04', 2),
(5, 14, '2023-04-06', 2),
(6, 15, '2023-04-13', 3),
(7, 16, '2023-04-16', 3),
(8, 17, '2023-05-01', 3),
(9, 18, '2023-05-03', 1),
(10, 19, '2023-05-20', 3);

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `billId` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointmentNo` tinyint UNSIGNED NOT NULL,
  `cost` double NOT NULL,
  PRIMARY KEY (`billId`),
  KEY `appointmentNo` (`appointmentNo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`billId`, `appointmentNo`, `cost`) VALUES
(1, 1, 100),
(2, 2, 150),
(3, 3, 75),
(4, 4, 50),
(5, 5, 200),
(6, 6, 250),
(7, 7, 140),
(8, 8, 90),
(9, 9, 35),
(10, 10, 79);

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
CREATE TABLE IF NOT EXISTS `medications` (
  `medicationNo` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `appointmentNo` tinyint UNSIGNED NOT NULL,
  `treatmentDetails` varchar(200) DEFAULT NULL,
  `status` enum('Complete','onGoing','NotStarted') DEFAULT NULL,
  PRIMARY KEY (`medicationNo`),
  KEY `appointmentNo` (`appointmentNo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`medicationNo`, `appointmentNo`, `treatmentDetails`, `status`) VALUES
(1, 1, 'Prescription medication for allergies', 'Complete'),
(2, 2, 'Antibiotics for ear infection', 'onGoing'),
(3, 3, 'Pain medication for arthritis', 'NotStarted'),
(4, 4, 'Pain medication for arthritis', 'onGoing'),
(5, 5, 'Prescription medication for allergies', 'Complete'),
(6, 6, 'Antibiotics for ear infection', 'onGoing'),
(7, 7, 'Pain medication for arthritis', 'Complete'),
(8, 8, 'Pain medication for arthritis', 'NotStarted'),
(9, 9, 'Antibiotics for ear infection', 'onGoing'),
(10, 10, 'Pain medication for arthritis', 'onGoing');

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
CREATE TABLE IF NOT EXISTS `owners` (
  `ownerID` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`ownerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`ownerID`, `firstName`, `lastName`, `phone`, `email`) VALUES
(1, 'John', 'Doe', '123-456-7890', 'john.doe@example.com'),
(2, 'Jane', 'Doe', '123-456-7890', 'jane.doe@example.com'),
(3, 'Bob', 'Smith', '123-456-7890', 'bob.smith@example.com'),
(4, 'Alice', 'Johnson', '123-456-7890', 'alice.johnson@example.com'),
(5, 'David', 'Brown', '123-456-7890', 'david.brown@example.com'),
(6, 'Sarah', 'Lee', '123-456-7890', 'sarah.lee@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `paymentId` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `billId` tinyint UNSIGNED NOT NULL,
  `method` enum('Cash','Cheque','Mastercard','Visa','BTC') DEFAULT NULL,
  `receivedBy` enum('Online','handedIn','Upfront') DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `billId` (`billId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentId`, `billId`, `method`, `receivedBy`) VALUES
(1, 1, 'Visa', 'Online'),
(2, 2, 'Cash', 'handedIn'),
(3, 3, 'Cheque', 'Upfront');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
CREATE TABLE IF NOT EXISTS `pets` (
  `patientNo` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ownerID` tinyint UNSIGNED NOT NULL,
  `petName` varchar(45) NOT NULL,
  `species` enum('Dog','Cat','Hamster','Bird') NOT NULL,
  PRIMARY KEY (`patientNo`),
  KEY `ownerID` (`ownerID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`patientNo`, `ownerID`, `petName`, `species`) VALUES
(10, 1, 'Fido', 'Dog'),
(11, 2, 'Fluffy', 'Cat'),
(12, 1, 'Buddy', 'Hamster'),
(13, 3, 'Nika', 'Dog'),
(14, 4, 'Kiba', 'Dog'),
(15, 5, 'Beckham', 'Cat'),
(16, 6, 'Lucky Roo', 'Hamster'),
(17, 4, 'Kidd', 'Bird'),
(18, 2, 'Mars', 'Hamster'),
(19, 6, 'Ugo', 'Cat');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `staffID` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `position` enum('Vet','Assistant','Receptionist') NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `firstName`, `lastName`, `position`) VALUES
(1, 'Mike', 'Smith', 'Vet'),
(2, 'Sarah', 'Johnson', 'Assistant'),
(3, 'Tom', 'Lee', 'Receptionist');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patientNo`) REFERENCES `pets` (`patientNo`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_appointments_staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE CASCADE;

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`appointmentNo`) REFERENCES `appointments` (`appointmentNo`) ON DELETE CASCADE;

--
-- Constraints for table `medications`
--
ALTER TABLE `medications`
  ADD CONSTRAINT `medications_ibfk_1` FOREIGN KEY (`appointmentNo`) REFERENCES `appointments` (`appointmentNo`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`billId`) REFERENCES `bills` (`billId`) ON DELETE CASCADE;

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`ownerID`) REFERENCES `owners` (`ownerID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;