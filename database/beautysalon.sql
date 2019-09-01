-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 29, 2019 at 09:33 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beautysalon`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `customer_id` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `Contact_no.` varchar(20) NOT NULL,
  `purok` varchar(30) NOT NULL,
  `barangay` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zipcode` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`customer_id`, `first_name`, `middle_name`, `last_name`, `Contact_no.`, `purok`, `barangay`, `city`, `zipcode`) VALUES
('1', 'joel', 'agot', 'Agot', '9957118738', 'asd', 'sadas', 'Oroquieta City', 7204);

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `Employee_JobID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`EmployeeID`, `FirstName`, `LastName`, `MiddleName`, `Employee_JobID`) VALUES
(6, 'Joel', 'Agot', 'T', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Job`
--

CREATE TABLE `Job` (
  `JobID` int(11) NOT NULL,
  `JobName` varchar(30) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Job`
--

INSERT INTO `Job` (`JobID`, `JobName`, `Description`) VALUES
(1, 'HairDressers', 'tig alot ug tig rebond'),
(2, 'Manicurist', 'hinlo koko'),
(4, 'beautician', 'beauty'),
(5, 'cut', 'makoy'),
(6, 'Silhig', 'tig shampoo');

-- --------------------------------------------------------

--
-- Table structure for table `Salary`
--

CREATE TABLE `Salary` (
  `EmployeeID` int(11) NOT NULL,
  `salaryID` int(11) NOT NULL,
  `salary` decimal(18,2) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Services`
--

CREATE TABLE `Services` (
  `ServiceID` varchar(100) NOT NULL,
  `Serv_Name` varchar(100) NOT NULL,
  `Price` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Services`
--

INSERT INTO `Services` (`ServiceID`, `Serv_Name`, `Price`) VALUES
('1', 'Hair Rebonding With Keratin Oil', '134.00'),
('2', 'haircut', '137.00'),
('3', 'Hair Rebonding With Hair Reborn', '23221.00'),
('4', 'nailcut', '43.00');

-- --------------------------------------------------------

--
-- Table structure for table `Services_availed`
--

CREATE TABLE `Services_availed` (
  `reciept_no` varchar(30) NOT NULL,
  `customer_id` varchar(30) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Services_availed`
--

INSERT INTO `Services_availed` (`reciept_no`, `customer_id`, `timestamp`) VALUES
('2', '1', '2019-03-26 05:36:16');

-- --------------------------------------------------------

--
-- Table structure for table `Service_item`
--

CREATE TABLE `Service_item` (
  `reciept_no` varchar(30) NOT NULL,
  `Services_checked` varchar(100) NOT NULL,
  `amount` decimal(18,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Service_item`
--

INSERT INTO `Service_item` (`reciept_no`, `Services_checked`, `amount`) VALUES
('2', '12', '0.00'),
('2', 'Hair Rebonding With Keratin Oil', '0.00'),
('2', 'Hair Rebonding With Keratin Oil,nailcut', '0.00'),
('2', 'Hair Rebonding With Keratin Oil,haircut', '0.00'),
('2', 'haircut,nailcut', '0.00'),
('2', 'haircut,Hair Rebonding With Hair Reborn', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `Tools_Employee`
--

CREATE TABLE `Tools_Employee` (
  `tool_id` int(10) NOT NULL,
  `tool_empID` int(11) NOT NULL,
  `id_no` int(11) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tools_Employee`
--

INSERT INTO `Tools_Employee` (`tool_id`, `tool_empID`, `id_no`, `quantity`, `timestamp`) VALUES
(1, 6, 1, 11, '2019-03-28 14:35:34'),
(7, 6, 1, 15, '2019-03-28 15:06:36'),
(8, 6, 1, 12, '2019-03-28 15:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `Tools_Item`
--

CREATE TABLE `Tools_Item` (
  `id_no` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `amount` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `unit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tools_Item`
--

INSERT INTO `Tools_Item` (`id_no`, `timestamp`, `description`, `amount`, `quantity`, `unit`) VALUES
(1, '2019-03-28 14:54:08', 'gapas', 300, 100, 'mg');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `unit`) VALUES
(3, 'kg'),
(2, 'liters'),
(4, 'mg'),
(1, 'mm');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(4, 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3'),
(10, 'asd', 'mariel@email.com', '7815696ecbf1c96e6894b779456d330e'),
(11, 'joelagot', 'joeltumandaagot@gmail.com', '7815696ecbf1c96e6894b779456d330e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `Employee_JobID` (`Employee_JobID`);

--
-- Indexes for table `Job`
--
ALTER TABLE `Job`
  ADD PRIMARY KEY (`JobID`);

--
-- Indexes for table `Salary`
--
ALTER TABLE `Salary`
  ADD PRIMARY KEY (`salaryID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`ServiceID`);

--
-- Indexes for table `Services_availed`
--
ALTER TABLE `Services_availed`
  ADD PRIMARY KEY (`reciept_no`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `Service_item`
--
ALTER TABLE `Service_item`
  ADD KEY `reciept_no` (`reciept_no`);

--
-- Indexes for table `Tools_Employee`
--
ALTER TABLE `Tools_Employee`
  ADD PRIMARY KEY (`tool_id`),
  ADD KEY `FK_id_no` (`id_no`),
  ADD KEY `tool_empID` (`tool_empID`);

--
-- Indexes for table `Tools_Item`
--
ALTER TABLE `Tools_Item`
  ADD PRIMARY KEY (`id_no`),
  ADD KEY `unit` (`unit`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit` (`unit`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Job`
--
ALTER TABLE `Job`
  MODIFY `JobID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Salary`
--
ALTER TABLE `Salary`
  MODIFY `salaryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tools_Employee`
--
ALTER TABLE `Tools_Employee`
  MODIFY `tool_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Tools_Item`
--
ALTER TABLE `Tools_Item`
  MODIFY `id_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Employee_JobID`) REFERENCES `Job` (`JobID`);

--
-- Constraints for table `Salary`
--
ALTER TABLE `Salary`
  ADD CONSTRAINT `Salary_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

--
-- Constraints for table `Services_availed`
--
ALTER TABLE `Services_availed`
  ADD CONSTRAINT `Services_availed_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`);

--
-- Constraints for table `Service_item`
--
ALTER TABLE `Service_item`
  ADD CONSTRAINT `Service_item_ibfk_1` FOREIGN KEY (`reciept_no`) REFERENCES `Services_availed` (`reciept_no`);

--
-- Constraints for table `Tools_Employee`
--
ALTER TABLE `Tools_Employee`
  ADD CONSTRAINT `Tools_Employee_ibfk_1` FOREIGN KEY (`tool_empID`) REFERENCES `Employee` (`EmployeeID`);

--
-- Constraints for table `Tools_Item`
--
ALTER TABLE `Tools_Item`
  ADD CONSTRAINT `Tools_Item_ibfk_1` FOREIGN KEY (`unit`) REFERENCES `unit` (`unit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
