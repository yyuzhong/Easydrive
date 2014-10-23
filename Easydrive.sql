-- phpMyAdmin SQL Dump
-- version 4.0.10.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 23, 2014 at 03:33 PM
-- Server version: 5.1.66
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Easydrive`
--

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE IF NOT EXISTS `Client` (
  `clientNo` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` char(64) DEFAULT NULL,
  `lastName` char(64) DEFAULT NULL,
  `address` char(255) DEFAULT NULL,
  `postCode` char(5) DEFAULT NULL,
  `telNo` char(10) DEFAULT NULL,
  `driverLicenseNo` char(8) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `email` char(255) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `officeNo` int(11) NOT NULL,
  PRIMARY KEY (`clientNo`),
  KEY `officeNo` (`officeNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Client`
--

INSERT INTO `Client` (`clientNo`, `firstName`, `lastName`, `address`, `postCode`, `telNo`, `driverLicenseNo`, `sex`, `DOB`, `email`, `password`, `officeNo`) VALUES
(1, 'Yuzhong', 'Yan', '5606 Bissonnet St', '77081', '8325122357', '11111111', 'M', '1978-01-01', 'yyuzhong@hotmail.com', '11111111', 1),
(2, 'Jie', 'Zhang', '5606 Bissonnet St', '77081', '2814094792', '22222222', 'M', '1982-01-01', 'zhangjlive@hotmail.com', '22222222', 1),
(3, 'Hanbing', 'Yan', '10000 Sheffield gray trail', '77433', '7135055997', '33333333', 'F', '1992-01-01', 'hyan@pvamu.edu', '33333333', 3),
(4, 'Mahsa', 'Hanifi', 'Collage Station', '77845', '9794222360', '44444444', 'F', '1985-01-01', 'mahsa@pvamu.edu', '44444444', 3);

-- --------------------------------------------------------

--
-- Table structure for table `DrivingTest`
--

CREATE TABLE IF NOT EXISTS `DrivingTest` (
  `testNo` int(11) NOT NULL AUTO_INCREMENT,
  `testDate` date DEFAULT NULL,
  `testTime` time DEFAULT NULL,
  `testCenter` char(255) DEFAULT NULL,
  `testerName` char(128) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `pTestComment` char(255) DEFAULT NULL,
  `testMark` char(255) DEFAULT NULL,
  `tTestComment` char(255) DEFAULT NULL,
  `staffNo` int(11) NOT NULL,
  `clientNo` int(11) NOT NULL,
  PRIMARY KEY (`testNo`),
  KEY `staffNo` (`staffNo`),
  KEY `clientNo` (`clientNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `DrivingTest`
--

INSERT INTO `DrivingTest` (`testNo`, `testDate`, `testTime`, `testCenter`, `testerName`, `attempt`, `result`, `pTestComment`, `testMark`, `tTestComment`, `staffNo`, `clientNo`) VALUES
(1, '2014-08-10', '10:10:00', 'Cypress', 'Dr. Clee', 1, 90, 'Ready to drive', 'Pass', 'Awesome', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Inspection`
--

CREATE TABLE IF NOT EXISTS `Inspection` (
  `inspectionNo` int(11) NOT NULL AUTO_INCREMENT,
  `inspectionDate` date DEFAULT NULL,
  `inspectionTime` time DEFAULT NULL,
  `faultsFound` int(11) DEFAULT NULL,
  `comments` char(255) DEFAULT NULL,
  `staffNo` int(11) NOT NULL,
  `vehicleRegNo` int(11) NOT NULL,
  PRIMARY KEY (`inspectionNo`),
  KEY `staffNo` (`staffNo`),
  KEY `vehicleRegNo` (`vehicleRegNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Inspection`
--

INSERT INTO `Inspection` (`inspectionNo`, `inspectionDate`, `inspectionTime`, `faultsFound`, `comments`, `staffNo`, `vehicleRegNo`) VALUES
(1, '2014-01-01', '12:10:00', 0, 'No faults', 1, 1),
(2, '2014-06-01', '10:10:00', 0, 'No faults', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Interview`
--

CREATE TABLE IF NOT EXISTS `Interview` (
  `interviewNo` int(11) NOT NULL AUTO_INCREMENT,
  `interviewDate` date DEFAULT NULL,
  `interviewTime` time DEFAULT NULL,
  `interviewRoom` char(8) DEFAULT NULL,
  `comments` char(255) DEFAULT NULL,
  `driverLicenseNo` char(8) DEFAULT NULL,
  `staffNo` int(11) NOT NULL,
  `clientNo` int(11) NOT NULL,
  PRIMARY KEY (`interviewNo`),
  KEY `staffNo` (`staffNo`),
  KEY `clientNo` (`clientNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Interview`
--

INSERT INTO `Interview` (`interviewNo`, `interviewDate`, `interviewTime`, `interviewRoom`, `comments`, `driverLicenseNo`, `staffNo`, `clientNo`) VALUES
(1, '2014-01-01', '09:10:00', '101', 'Novice', '1111111', 1, 1),
(2, '2014-01-10', '09:10:00', '103', 'Novice', '2222222', 1, 2),
(3, '2014-06-10', '12:10:00', '102', 'Novice', '3333333', 1, 3),
(4, '2014-07-05', '10:10:00', '110', 'Novice', '4444444', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Lesson`
--

CREATE TABLE IF NOT EXISTS `Lesson` (
  `lessonNo` int(11) NOT NULL AUTO_INCREMENT,
  `lessonDate` date DEFAULT NULL,
  `lessonTime` time DEFAULT NULL,
  `stage` char(10) DEFAULT NULL,
  `comments` char(255) DEFAULT NULL,
  `staffNo` int(11) NOT NULL,
  `vehicleRegNo` int(11) NOT NULL,
  `clientNo` int(11) NOT NULL,
  PRIMARY KEY (`lessonNo`),
  KEY `staffNo` (`staffNo`),
  KEY `vehicleRegNo` (`vehicleRegNo`),
  KEY `clientNo` (`clientNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Lesson`
--

INSERT INTO `Lesson` (`lessonNo`, `lessonDate`, `lessonTime`, `stage`, `comments`, `staffNo`, `vehicleRegNo`, `clientNo`) VALUES
(1, '2014-01-01', '12:10:00', 'Junior', '1st time', 1, 1, 1),
(2, '2014-01-05', '12:10:00', 'Junior', '2nd time', 2, 1, 1),
(3, '2014-06-01', '09:10:00', 'Junior', '1st time', 3, 2, 3),
(4, '2014-07-01', '09:10:00', 'Junior', '2nd time', 3, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Manage`
--

CREATE TABLE IF NOT EXISTS `Manage` (
  `staffNo` int(11) NOT NULL,
  `officeNo` int(11) NOT NULL,
  PRIMARY KEY (`staffNo`,`officeNo`),
  KEY `officeNo` (`officeNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Manage`
--

INSERT INTO `Manage` (`staffNo`, `officeNo`) VALUES
(1, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Office`
--

CREATE TABLE IF NOT EXISTS `Office` (
  `officeNo` int(11) NOT NULL AUTO_INCREMENT,
  `address` char(255) DEFAULT NULL,
  `postCode` char(5) DEFAULT NULL,
  `telNo` char(10) DEFAULT NULL,
  `faxNo` char(10) DEFAULT NULL,
  PRIMARY KEY (`officeNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Office`
--

INSERT INTO `Office` (`officeNo`, `address`, `postCode`, `telNo`, `faxNo`) VALUES
(1, '5606 Bissonnet St', '77081', '8325122357', '8325122357'),
(2, '5706 Bellaire Blvd', '77096', '7132955255', '7132955255'),
(3, 'P.O. Box 519', '77746', '9362613311', '9362613311');

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE IF NOT EXISTS `Staff` (
  `staffNo` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` char(64) DEFAULT NULL,
  `lastName` char(64) DEFAULT NULL,
  `address` char(255) DEFAULT NULL,
  `jobTitle` char(16) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `email` char(255) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `officeNo` int(11) NOT NULL,
  PRIMARY KEY (`staffNo`),
  KEY `officeNo` (`officeNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`staffNo`, `firstName`, `lastName`, `address`, `jobTitle`, `salary`, `sex`, `DOB`, `email`, `password`, `officeNo`) VALUES
(1, 'Lei', 'Huang', '5760 Indigo St', 'Instructor', 9999, 'M', '1974-01-01', 'lhuang@pvamu.edu', '99999999', 1),
(2, 'Lin', 'Li', '5626 Blalock St', 'Instructor', 8888, 'M', '1975-01-01', 'linli@pvamu.edu', '88888888', 1),
(3, 'Yonggao', 'Yang', '10000 Sheffield gray trail', 'Manager', 9999, 'M', '1970-01-01', 'yyang@pvamu.edu', '666666', 1);

-- --------------------------------------------------------

--
-- Table structure for table `TakeLesson`
--

CREATE TABLE IF NOT EXISTS `TakeLesson` (
  `mileageStart` int(11) DEFAULT NULL,
  `mileageFinish` int(11) DEFAULT NULL,
  `comments` char(255) DEFAULT NULL,
  `lessonNo` int(11) NOT NULL,
  `clientNo` int(11) NOT NULL,
  PRIMARY KEY (`lessonNo`,`clientNo`),
  KEY `clientNo` (`clientNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TakeLesson`
--

INSERT INTO `TakeLesson` (`mileageStart`, `mileageFinish`, `comments`, `lessonNo`, `clientNo`) VALUES
(35000, 35035, 'Good job', 1, 1),
(56000, 56035, 'Good job', 3, 3),
(57000, 57035, 'Good job', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle`
--

CREATE TABLE IF NOT EXISTS `Vehicle` (
  `vehicleRegNo` int(11) NOT NULL AUTO_INCREMENT,
  `model` char(16) DEFAULT NULL,
  `maker` char(16) DEFAULT NULL,
  `color` char(10) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `VIN` char(17) DEFAULT NULL,
  `staffNo` int(11) DEFAULT NULL,
  `officeNo` int(11) NOT NULL,
  PRIMARY KEY (`vehicleRegNo`),
  KEY `officeNo` (`officeNo`),
  KEY `staffNo` (`staffNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Vehicle`
--

INSERT INTO `Vehicle` (`vehicleRegNo`, `model`, `maker`, `color`, `capacity`, `VIN`, `staffNo`, `officeNo`) VALUES
(1, 'CRV', 'Honda', 'White', 5, '11111111111111111', 1, 1),
(2, 'Accord', 'Honda', 'Black', 5, '22222222222222222', 3, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
