-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2020 at 08:15 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getdonors` (IN `bg` VARCHAR(20))  select * from tblblooddonars WHERE BloodGroup=bg$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', 'c05c8795f7e5863a32cea6cc0eeea51c', '2019-12-01 06:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblbackup`
--

CREATE TABLE `tblbackup` (
  `id` int(11) NOT NULL,
  `FullName` varchar(20) NOT NULL,
  `MobileNumber` int(11) NOT NULL,
  `EmailId` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblbackup`
--

INSERT INTO `tblbackup` (`id`, `FullName`, `MobileNumber`, `EmailId`) VALUES
(7, 'delson', 2147483647, 'delson@gmail.com'),
(8, 'hansea', 675477867, 'hansea@gmail.com'),
(10, 'Rayeez', 0, 'muhammadrayeesnp@gma'),
(11, 'czdc', 0, 'muhammadrayeesnp@gma');

-- --------------------------------------------------------

--
-- Table structure for table `tblblooddonars`
--

CREATE TABLE `tblblooddonars` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` int(11) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `BloodGroup` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblblooddonars`
--

INSERT INTO `tblblooddonars` (`id`, `FullName`, `MobileNumber`, `EmailId`, `Gender`, `Age`, `BloodGroup`, `Address`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Anuj Kotian', 2147483647, 'anuj@gmail.com', 'Male', 27, 'O+', ' yokalu house,4th cross shiv nagar,bangaluru,karnatka', 'i donate blood every year,helping the needy', '2019-11-09 20:14:16', 1),
(2, 'shashikala', 2147483647, 'shashikala@gmail.com', 'female', 34, 'AB-', ' 23-7 main road kavoor,hyderabad,telangana', '', '2019-11-09 20:48:11', 1),
(3, 'Amith', 778965784, 'amithshah@gmail.com', 'Male', 40, 'A+', 'Shastri Chowk, Sector 17, Station Rd Ulhas Nagar,mumbai,maharastra', ' i live in mumbai,i would like to volunteer to donate blood.', '2019-11-10 07:21:21', 1),
(4, 'akash s', 2147483647, 'sakash.icloud.com', 'male', 26, 'AB+', 'C 57, Part 2, Lajpat Nagar,delhi', 'happy to be a part of this ', '2019-11-10 07:21:42', 1),
(5, 'Nitesh Kumar', 2147483647, 'niteshkumar@gmail.com', 'Male', 32, 'A-', 'Shop No 11, Sarita Apts, Vn Purav Mrg, Chunnabhatti,Mumbai,Maharashtra', '', '2019-11-10 09:00:18', 1),
(6, 'chirag bangera', 2147483647, 'chiragb@outlook.com', 'Male', 22, 'B-', '14-7 apartment no.101, moras residency,attavar,mangaluru,karnataka ', ' this is my 1st time becoming a donar i hope this will be a good experience and continue to be a donar', '2019-11-11 14:06:43', 1),
(9, 'del', 2147483647, 'delson@gmail.com', 'Male', 26, 'O-', 'mangalore', ' nice', '2019-12-01 06:37:18', 1);

--
-- Triggers `tblblooddonars`
--
DELIMITER $$
CREATE TRIGGER `backup_save` BEFORE DELETE ON `tblblooddonars` FOR EACH ROW BEGIN
insert into tblbackup values(old.id,old.FullName,old.MobileNumber,old.EmailId);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblbloodgroup`
--

CREATE TABLE `tblbloodgroup` (
  `id` int(11) NOT NULL,
  `BloodGroup` varchar(20) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbloodgroup`
--

INSERT INTO `tblbloodgroup` (`id`, `BloodGroup`, `PostingDate`) VALUES
(17, 'A+', '2019-11-10 09:27:05'),
(19, 'A-', '2019-11-10 09:27:18'),
(21, 'B+', '2019-11-10 09:28:15'),
(22, 'B-', '2019-11-10 09:28:24'),
(23, 'O+', '2019-11-10 09:28:38'),
(24, 'O-', '2019-11-10 09:28:51'),
(25, 'AB+', '2019-11-10 09:29:00'),
(26, 'AB-', '2019-11-10 09:29:07'),
(27, 'B RhD positive (B+)', '2019-12-03 07:00:41'),
(28, 'B RhD positive (B+)', '2019-12-03 07:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, '\'Red Cross Bhavan’, Behind DC Office, Dakshina Kannada, Mangalore, Karnataka 575001																								', 'blooddrive@gmail.com', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` int(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Anuj Kumar', 'anujkumar@gmail.com', 2147483647, 'this is very good initiative.it will help a lot people who are in need,i have registered and would like to donate blood and make this world a better place', '2019-11-10 10:03:07', 1),
(2, 'hansea', 'hanseaco@gmail.com', 2147483647, 'i\'ve been facing some problem registering into your site, the site is getting hanged.could please tell me what is wrong', '2019-11-09 21:17:09', 1),
(3, 'bhushith', 'bhushith@gmail.com', 2147483647, 'this site has helped me to get blood for my relative at a very short period of time', '2019-11-09 21:21:30', 1),
(4, 'sagar pinto', 'sagarpin@gmail.com', 2147483647, 'what is the eligibilty to become a blood donor', '2019-11-10 07:19:36', 1),
(8, 'del', 'sfds@fhjhg.com', 993848884, 'frfefef', '2019-12-01 06:38:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(2, 'Why Become Donor', 'donor', '										<p style=\"box-sizing: inherit; margin-right: 20px; margin-bottom: 18px; padding: 0px; border: 0px; outline: 0px; font-size: 20px; font-family: Helvetica, Arial, sans-serif; vertical-align: baseline; line-height: 18px; color: rgb(51, 51, 51);\"><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\">Blood is the most precious gift that anyone can give to another person the gift of life. A decision to donate your blood can save a life, or even several if your blood is separated into its components red cells, platelets and plasma which can be used individually for patients with specific conditions.</span></p><div><span style=\"box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline;\"><br></span></div>\r\n										'),
(3, 'About Us ', 'aboutus', '																				<div style=\"text-align: justify;\"><div dir=\"auto\" style=\"text-align: center; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: x-large;\">Life Saver Blood Bank\' is the first product resulted out of the</span></div><div dir=\"auto\" style=\"text-align: center; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: x-large;\">community welfare initiative called People Project from uSiS</span></div><div dir=\"auto\" style=\"text-align: center; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: x-large;\">Technologies. Universal, Blood is recognized as the most precious</span></div><div dir=\"auto\" style=\"text-align: center; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: x-large;\">element that sustains life. It saves innumerable lives across the world</span></div><div dir=\"auto\" style=\"text-align: center; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: x-large;\">in a variety of conditions Once in every 2- seconds, someone</span></div><div dir=\"auto\" style=\"text-align: center; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: x-large;\">somewhere is desperately in need of blood. More than 29 million units</span></div><div dir=\"auto\" style=\"text-align: center; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: x-large;\">of blood components are transfused every year. The need for blood is</span></div><div dir=\"auto\" style=\"text-align: center; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: x-large;\">great-on any given day, approximately 39,000 units of Red Blood Cells</span></div><div dir=\"auto\" style=\"text-align: center; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: x-large;\">are needed. Each year, we could meet only up to 1% ( approx)of our</span></div><div dir=\"auto\" style=\"text-align: center; color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif;\"><span style=\"font-size: x-large;\">nation\'s demand for blood transfusion</span></div></div>\r\n										\r\n										');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbackup`
--
ALTER TABLE `tblbackup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblblooddonars`
--
ALTER TABLE `tblblooddonars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbloodgroup`
--
ALTER TABLE `tblbloodgroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblblooddonars`
--
ALTER TABLE `tblblooddonars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblbloodgroup`
--
ALTER TABLE `tblbloodgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
