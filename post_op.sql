-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2019 at 04:19 PM
-- Server version: 5.6.40
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `post_op`
--

-- --------------------------------------------------------

--
-- Table structure for table `BeInHospital`
--

CREATE TABLE `BeInHospital` (
  `PatientID` int(11) NOT NULL,
  `Ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'create time',
  `Department` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `Disease` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `OperateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `BeInHospital`
--

INSERT INTO `BeInHospital` (`PatientID`, `Ctime`, `Department`, `Disease`, `OperateDate`) VALUES
(1, '2019-11-19 05:32:39', 'Cerebral surgery', 'head', '2019-07-04 14:39:46'),
(2, '2019-11-19 05:53:03', 'Cerebral surgery', 'head', '2019-07-05 10:19:26'),
(3, '2019-11-19 05:53:03', 'Orthopedics', 'bone', '2019-07-13 16:19:40'),
(4, '2019-11-19 05:53:03', 'Cerebral surgery', 'head', '2019-07-11 14:18:39'),
(5, '2019-11-19 05:53:03', 'Digestion', 'stomache', '2019-07-17 12:45:57'),
(6, '2019-11-19 05:53:03', 'Orthopedics', 'hand', '2019-08-01 15:44:52'),
(7, '2019-11-19 05:53:03', 'Digestion', 'stomache', '2019-08-31 20:22:06');

-- --------------------------------------------------------

--
-- Table structure for table `DoctorDetail`
--

CREATE TABLE `DoctorDetail` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `Age` int(11) NOT NULL,
  `Department` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `Phone` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `Address` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `SSN` varchar(9) COLLATE utf8mb4_bin NOT NULL,
  `Commit` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `DoctorDetail`
--

INSERT INTO `DoctorDetail` (`ID`, `Name`, `Age`, `Department`, `Phone`, `Address`, `SSN`, `Commit`) VALUES
(1, 'Bong Hiong Hwa', 36, 'Cerebral surgery', '3017540716', NULL, '535235252', 'Bong-Hiong-Hwa@zachsem.com'),
(2, 'Edward Belcher', 41, 'Orthopedics', '9124143022', NULL, '653257989', 'Edward-Belcher@zachsem.com'),
(3, 'Brian P. Farrell', 29, 'Orthopedics', '4799719515', NULL, '165363601', 'Brian-P-Farrell@zachsem.com'),
(4, 'Maurice Baker', 33, 'Digestion', '6070932726', NULL, '711248301', 'Maurice-Baker@zachsem.com');

-- --------------------------------------------------------

--
-- Table structure for table `LoginUser`
--

CREATE TABLE `LoginUser` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `Role` int(11) NOT NULL COMMENT '1 => doctor, 2 => patient',
  `Password` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `Commit` text COLLATE utf8mb4_bin,
  `Roleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `LoginUser`
--

INSERT INTO `LoginUser` (`ID`, `Name`, `Role`, `Password`, `Commit`, `Roleid`) VALUES
(1, 'admin', 1, 'admin', NULL, 1),
(2, 'guest', 2, 'guest', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PatientDetail`
--

CREATE TABLE `PatientDetail` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `Age` int(11) NOT NULL,
  `Phone` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `Address` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `SSN` varchar(9) COLLATE utf8mb4_bin NOT NULL,
  `Commit` text COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `PatientDetail`
--

INSERT INTO `PatientDetail` (`ID`, `Name`, `Age`, `Phone`, `Address`, `SSN`, `Commit`) VALUES
(1, 'Robert Min Chen', 23, '6623999246', NULL, '111196801', 'Robert-Min-Chen@zachsem.com'),
(2, 'Chia Soon Ann', 42, '2168061624', NULL, '111132099', 'Chia-Soon-Ann@zachsem.com'),
(3, 'Gerard Clarke', 63, '8288830099', NULL, '111133601', 'Gerard-Clarke@zachsem.com'),
(4, 'Allen & Gledhill', 26, '7409426558', NULL, '111184101', 'Allen-&-Gledhill@zachsem.com'),
(5, 'Boh Chit Hee', 41, '9726913691', NULL, '111189101', 'Boh-Chit-Hee@zachsem.com'),
(6, 'Colin Cheong', 23, '8023061751', NULL, '111160601', 'Colin-Cheong@zachsem.com'),
(7, 'Chow Li Liang', 43, '3342152513', NULL, '111110001', 'Chow-Li-Liang@zachsem.com'),
(8, 'Elangovan', 61, '3064428958', NULL, '111160601', 'Elangovan@zachsem.com');

-- --------------------------------------------------------

--
-- Table structure for table `PostRecord`
--

CREATE TABLE `PostRecord` (
  `RecordID` int(11) NOT NULL,
  `DoctorID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `CheckStartDate` date NOT NULL DEFAULT '2019-11-19',
  `PostDays` int(11) NOT NULL,
  `Medicines` text COLLATE utf8mb4_bin,
  `Doses` float NOT NULL,
  `Times` int(11) NOT NULL,
  `Symptom` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `ExamResult` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `PostRecord`
--

INSERT INTO `PostRecord` (`RecordID`, `DoctorID`, `PatientID`, `CheckStartDate`, `PostDays`, `Medicines`, `Doses`, `Times`, `Symptom`, `ExamResult`) VALUES
(1, 1, 1, '2019-11-19', 3, 'MED-000001', 1, 2, 'no problem', 'ok'),
(2, 1, 2, '2019-11-19', 1, 'MED-000001', 1.5, 2, 'no problem', 'ok'),
(3, 2, 3, '2019-11-19', 1, 'MED-000001', 0.5, 3, 'no problem', 'ok'),
(4, 3, 6, '2019-11-19', 1, 'MED-000001', 4, 1, 'no problem', 'ok'),
(5, 1, 4, '2019-11-19', 1, 'MED-000001', 3, 2, 'no problem', 'ok'),
(6, 4, 5, '2019-11-19', 1, 'MED-000001', 1, 1, 'no problem', 'ok'),
(7, 4, 7, '2019-11-19', 1, 'MED-000001', 2, 2, 'no problem', 'ok');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BeInHospital`
--
ALTER TABLE `BeInHospital`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `DoctorDetail`
--
ALTER TABLE `DoctorDetail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `LoginUser`
--
ALTER TABLE `LoginUser`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `PatientDetail`
--
ALTER TABLE `PatientDetail`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `PostRecord`
--
ALTER TABLE `PostRecord`
  ADD PRIMARY KEY (`RecordID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BeInHospital`
--
ALTER TABLE `BeInHospital`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `DoctorDetail`
--
ALTER TABLE `DoctorDetail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `LoginUser`
--
ALTER TABLE `LoginUser`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `PatientDetail`
--
ALTER TABLE `PatientDetail`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `PostRecord`
--
ALTER TABLE `PostRecord`
  MODIFY `RecordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
