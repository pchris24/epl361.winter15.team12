-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 20, 2015 at 11:38 PM
-- Server version: 5.1.73
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `technopedia`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`technopedia`@`%` PROCEDURE `addRoom`(IN `rn` VARCHAR(10) CHARSET latin1, IN `s` TINYINT(4))
    NO SQL
insert into Room(RoomNo,Seats) Values(rn,s)$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `deleteStudentByCandidateID`(IN `cid` VARCHAR(10) CHARSET latin1)
    NO SQL
DELETE FROM Student
WHERE  CandidateID = cid$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `editStudent`(IN `previousCID` VARCHAR(10) CHARSET latin1, IN `newCID` VARCHAR(10) CHARSET latin1, IN `FirstNameGreek` VARCHAR(30) CHARSET greek, IN `LastNameGreek` VARCHAR(30) CHARSET greek, IN `FirstNameEnglish` VARCHAR(30) CHARSET latin1, IN `LastNameEnglish` VARCHAR(30) CHARSET latin1, IN `IdentityType` VARCHAR(20) CHARSET latin1, IN `IdentityNo` VARCHAR(10) CHARSET latin1, IN `ECDL_LogbookNo` VARCHAR(20) CHARSET latin1, IN `DateOfBirth` DATE, IN `Address1` VARCHAR(50) CHARSET latin1, IN `Address2` VARCHAR(50) CHARSET latin1, IN `City` VARCHAR(10) CHARSET latin1, IN `TownVillage` VARCHAR(25) CHARSET latin1, IN `ZipCode` SMALLINT(5) UNSIGNED, IN `HomePhone` VARCHAR(8) CHARSET latin1, IN `MobilePhone` VARCHAR(8) CHARSET latin1, IN `WorkPhone` VARCHAR(8) CHARSET latin1, IN `Email` VARCHAR(50) CHARSET latin1, IN `TestCenter` VARCHAR(100) CHARSET latin1, IN `RegistrationLevel` VARCHAR(15) CHARSET latin1, IN `FatherName` VARCHAR(30) CHARSET latin1, IN `FatherJob` VARCHAR(30) CHARSET latin1, IN `FatherPhone` VARCHAR(8) CHARSET latin1, IN `MotherName` VARCHAR(30) CHARSET latin1, IN `MotherJob` VARCHAR(30) CHARSET latin1, IN `MotherPhone` VARCHAR(8) CHARSET latin1, IN `Documents` TEXT CHARSET latin1)
    NO SQL
UPDATE Student
set CandidateID= newCID,
FirstNameGreek=FirstNameGreek,
LastNameGreek=LastNameGreek,
FirstNameEnglish=FirstNameEnglish,
LastNameEnglish=LastNameEnglish,
IdentityType=IdentityType,
IdentityNo=IdentityNo,
ECDL_LogbookNo=ECDL_LogbookNo,
DateOfBirth=DateOfBirth,
Address1=Address1,
Address2=Address2,
City=City,
TownVillage=TownVillage,
ZipCode=ZipCode,
HomePhone=HomePhone,
MobilePhone=MobilePhone,
WorkPhone=WorkPhone,
Email=Email,
TestCenter=TestCenter,
RegistrationLevel=RegistrationLevel,
FatherName=FatherName,
FatherJob=FatherJob,
FatherPhone=FatherPhone,
MotherName=MotherName,
MotherJob=MotherJob,
MotherPhone=MotherPhone,
Documents=Documents

where CandidateID= previousCID$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `insertStudent`(IN `candidateId` VARCHAR(10) CHARSET latin1, IN `firstNameGreek` VARCHAR(30) CHARSET greek, IN `lastNameGreek` VARCHAR(30) CHARSET greek, IN `firstNameEnglish` VARCHAR(30) CHARSET latin1, IN `lastNameEnglish` VARCHAR(30) CHARSET latin1, IN `identityType` VARCHAR(20) CHARSET latin1, IN `identityNo` VARCHAR(10) CHARSET latin1, IN `ecdlLogbookNo` VARCHAR(20) CHARSET latin1, IN `dateOfBirth` DATE, IN `address1` VARCHAR(50) CHARSET latin1, IN `address2` VARCHAR(50) CHARSET latin1, IN `city` VARCHAR(10) CHARSET latin1, IN `townVillage` VARCHAR(25) CHARSET latin1, IN `zipCode` VARCHAR(5) CHARSET latin1, IN `homePhone` VARCHAR(8) CHARSET latin1, IN `mobilePhone` VARCHAR(8) CHARSET latin1, IN `workPhone` VARCHAR(8) CHARSET latin1, IN `email` VARCHAR(50) CHARSET latin1, IN `testCenter` VARCHAR(100) CHARSET latin1, IN `registrationLevel` VARCHAR(15) CHARSET latin1, IN `fatherName` VARCHAR(30) CHARSET latin1, IN `fatherJob` VARCHAR(30) CHARSET latin1, IN `fatherPhone` VARCHAR(8) CHARSET latin1, IN `motherName` VARCHAR(30) CHARSET latin1, IN `motherJob` VARCHAR(30) CHARSET latin1, IN `motherPhone` VARCHAR(8) CHARSET latin1, IN `documents` TEXT CHARSET latin1)
    NO SQL
insert into Student(CandidateID,FirstNameGreek,LastNameGreek,FirstNameEnglish,LastNameEnglish,IdentityType,IdentityNo,ECDL_LogbookNo,DateOfBirth,Address1,Address2,City,TownVillage,ZipCode,HomePhone,MobilePhone,WorkPhone,Email,TestCenter,RegistrationLevel,FatherName,FatherJob,FatherPhone,MotherName,MotherJob,MotherPhone,Documents) values(candidateId,firstNameGreek,lastNameGreek,firstNameEnglish,lastNameEnglish,identityType,identityNo,ecdlLogbookNo,dateOfBirth,address1,address2,city,townVillage,zipCode,homePhone,mobilePhone,workPhone,email,testCenter,registrationLevel,fatherName,fatherJob,fatherPhone,motherName,motherJob,motherPhone,documents)$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `viewStudentDetailsByCandidateID`(IN `cid` VARCHAR(10) CHARSET latin1)
    NO SQL
select * from Student where CandidateID=cid$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `viewStudentDetailsByECDL_LogbookNo`(IN `ECDL` VARCHAR(20) CHARSET latin1)
    NO SQL
select * from Student where ECDL_LogbookNo=ECDL$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `viewStudentDetailsByFirstNameEnglish`(IN `fne` VARCHAR(30) CHARSET latin1)
    NO SQL
select * from Student where FirstNameEnglish=fne$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `viewStudentDetailsByFirstNameEnglish+LastNameEnglish`(IN `fne` VARCHAR(30) CHARSET latin1, IN `lne` VARCHAR(30) CHARSET latin1)
    NO SQL
select * from Student where FirstNameEnglish=fne AND LastNameEnglish=lne$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `viewStudentDetailsByFirstNameGreek`(IN `fng` VARCHAR(30) CHARSET greek)
    NO SQL
select ALL * from Student where FirstNameGreek=fng$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `viewStudentDetailsByFirstNameGreek+LastNameGreek`(IN `fng` VARCHAR(30) CHARSET greek, IN `lng` VARCHAR(30) CHARSET greek)
    NO SQL
select * from Student where FirstNameGreek=fng AND LastNameGreek=lng$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `viewStudentDetailsByIdentityNo`(IN `id` VARCHAR(10) CHARSET latin1)
    NO SQL
select * from Student where IdentityNo=id$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `viewStudentDetailsByLastNameEnglish`(IN `lne` VARCHAR(30) CHARSET latin1)
    NO SQL
select * from Student where LastNameEnglish=lne$$

CREATE DEFINER=`technopedia`@`%` PROCEDURE `viewStudentDetailsByLastNameGreek`(IN `lng` VARCHAR(30) CHARSET greek)
    NO SQL
select * from Student where LastNameGreek=lng$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Attendance`
--

CREATE TABLE IF NOT EXISTS `Attendance` (
  `CandidateID` varchar(10) NOT NULL,
  `ClassNo` int(11) NOT NULL,
  `ProgramCode` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Present` bit(1) NOT NULL,
  PRIMARY KEY (`CandidateID`,`ClassNo`,`ProgramCode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Attendance`:
--   `CandidateID`
--       `Student` -> `CandidateID`
--   `ClassNo`
--       `Class` -> `ClassNo`
--   `ProgramCode`
--       `Schedule` -> `ProgramCode`
--

--
-- Dumping data for table `Attendance`
--

INSERT INTO `Attendance` (`CandidateID`, `ClassNo`, `ProgramCode`, `Date`, `Present`) VALUES
('963214', 1, 2, '2015-11-04', '');

-- --------------------------------------------------------

--
-- Table structure for table `Class`
--

CREATE TABLE IF NOT EXISTS `Class` (
  `ClassNo` int(11) NOT NULL,
  `RoomNo` varchar(10) NOT NULL,
  `CourseName` varchar(20) NOT NULL,
  `StaffUsername` varchar(10) NOT NULL,
  `TimetableNo` int(11) NOT NULL,
  `Days` bit(7) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `NumberOfStudents` int(11) NOT NULL,
  PRIMARY KEY (`ClassNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Class`:
--   `CourseName`
--       `Course` -> `CourseName`
--   `RoomNo`
--       `Room` -> `RoomNo`
--   `StaffUsername`
--       `Staff` -> `Username`
--   `TimetableNo`
--       `Timetable` -> `TimetableNo`
--

--
-- Dumping data for table `Class`
--

INSERT INTO `Class` (`ClassNo`, `RoomNo`, `CourseName`, `StaffUsername`, `TimetableNo`, `Days`, `StartTime`, `EndTime`, `NumberOfStudents`) VALUES
(1, 'A', 'EPL361', 'fkyria01', 1, 'H', '15:00:00', '16:00:00', 10),
(2, 'B', 'EPL342', 'mpetro01', 1, '$', '14:00:00', '15:00:00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE IF NOT EXISTS `Course` (
  `CourseName` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`CourseName`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`CourseName`) VALUES
('EPL342'),
('EPL361');

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE IF NOT EXISTS `Event` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `ExamCode` varchar(20) DEFAULT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `Location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Number`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- RELATIONS FOR TABLE `Event`:
--   `ExamCode`
--       `Exam` -> `ExamCode`
--

--
-- Dumping data for table `Event`
--

INSERT INTO `Event` (`Number`, `Date`, `Name`, `ExamCode`, `StartTime`, `EndTime`, `Location`) VALUES
(1, '2015-11-11', 'Welcome ceremony', NULL, '18:00:00', '20:00:00', 'Technopedia'),
(2, '2016-01-15', 'Word exam', '635', '10:00:00', '12:00:00', 'Technopedia');

-- --------------------------------------------------------

--
-- Table structure for table `EventReminder`
--

CREATE TABLE IF NOT EXISTS `EventReminder` (
  `EventNumber` int(11) NOT NULL,
  `StaffUsername` varchar(10) NOT NULL,
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  PRIMARY KEY (`EventNumber`,`StaffUsername`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `EventReminder`:
--   `EventNumber`
--       `Event` -> `Number`
--   `StaffUsername`
--       `Staff` -> `Username`
--

--
-- Dumping data for table `EventReminder`
--

INSERT INTO `EventReminder` (`EventNumber`, `StaffUsername`, `Date`, `Name`, `StartTime`, `EndTime`) VALUES
(1, 'fkyria01', '2015-11-25', '', '13:00:00', '13:15:00'),
(2, 'mpetro01', '2015-11-25', 'Word exam', '12:00:00', '12:10:00'),
(2, 'fkyria01', '2015-11-23', '', '11:00:00', '11:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `Exam`
--

CREATE TABLE IF NOT EXISTS `Exam` (
  `ExamCode` varchar(20) CHARACTER SET latin1 NOT NULL,
  `ExamTitle` varchar(20) CHARACTER SET latin1 NOT NULL,
  `ModuleCode` varchar(30) CHARACTER SET latin1 NOT NULL,
  `ModuleDescription` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `ExamSessionDate` date NOT NULL,
  `StartTime` time NOT NULL,
  `TestCenterName` varchar(100) CHARACTER SET latin1 NOT NULL,
  `PendencyStatus` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ExamCode`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- RELATIONS FOR TABLE `Exam`:
--   `ExamTitle`
--       `ExamTile` -> `ExamTitleCode`
--

--
-- Dumping data for table `Exam`
--

INSERT INTO `Exam` (`ExamCode`, `ExamTitle`, `ModuleCode`, `ModuleDescription`, `ExamSessionDate`, `StartTime`, `TestCenterName`, `PendencyStatus`) VALUES
('1', 'Word', 'MS3', NULL, '2016-01-15', '15:00:00', 'Technopedia', NULL),
('635', 'Excel', 'MS5', NULL, '2016-01-16', '13:00:00', 'Technopedia', ''),
('1235', 'Excel', 'MS5', NULL, '2015-11-05', '16:00:00', 'wetgrw', NULL),
('159', 'Access', 'M7', NULL, '2015-11-05', '16:00:00', 'Techopedia', '');

-- --------------------------------------------------------

--
-- Table structure for table `ExamTile`
--

CREATE TABLE IF NOT EXISTS `ExamTile` (
  `ExamTitleCode` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ExamTitleCode`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Dumping data for table `ExamTile`
--

INSERT INTO `ExamTile` (`ExamTitleCode`) VALUES
('Access'),
('Excel'),
('Word');

-- --------------------------------------------------------

--
-- Table structure for table `Expenses`
--

CREATE TABLE IF NOT EXISTS `Expenses` (
  `ExpensesNo` int(11) NOT NULL AUTO_INCREMENT,
  `Ammount` double NOT NULL,
  `DateDue` date NOT NULL,
  `DateOfPayment` date DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  `StaffUsername` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ExpensesNo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- RELATIONS FOR TABLE `Expenses`:
--   `StaffUsername`
--       `Staff` -> `Username`
--

--
-- Dumping data for table `Expenses`
--

INSERT INTO `Expenses` (`ExpensesNo`, `Ammount`, `DateDue`, `DateOfPayment`, `Name`, `StaffUsername`) VALUES
(1, 100, '2015-02-03', NULL, 'Electricity', ''),
(2, 800, '2015-11-12', '2015-11-28', '', 'fkyria01');

-- --------------------------------------------------------

--
-- Table structure for table `Fees`
--

CREATE TABLE IF NOT EXISTS `Fees` (
  `PaymentNo` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Ammount` double NOT NULL,
  `Date` date NOT NULL,
  `DateOfPayment` date NOT NULL,
  `Discount` double DEFAULT NULL,
  `StudentID` varchar(10) NOT NULL,
  PRIMARY KEY (`PaymentNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Fees`:
--   `StudentID`
--       `Student` -> `CandidateID`
--

--
-- Dumping data for table `Fees`
--

INSERT INTO `Fees` (`PaymentNo`, `Name`, `Ammount`, `Date`, `DateOfPayment`, `Discount`, `StudentID`) VALUES
(20168, 'Katerina Georgiou', 250, '2015-11-01', '2015-11-19', NULL, '963214'),
(3596, 'Marios Andreas', 600, '2015-10-01', '2015-11-17', 50, '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `Receipt`
--

CREATE TABLE IF NOT EXISTS `Receipt` (
  `Code` int(11) NOT NULL,
  `PaymentNo` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Ammount` double NOT NULL,
  `TypeOfPayment` tinyint(4) NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Receipt`:
--   `PaymentNo`
--       `Fees` -> `PaymentNo`
--

--
-- Dumping data for table `Receipt`
--

INSERT INTO `Receipt` (`Code`, `PaymentNo`, `Date`, `Ammount`, `TypeOfPayment`) VALUES
(1, 3596, '2015-11-05', 200, 1),
(963, 20168, '2015-09-17', 120, 2),
(9631, 3596, '2015-11-13', 150, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE IF NOT EXISTS `Room` (
  `RoomNo` varchar(10) NOT NULL,
  `Seats` tinyint(4) NOT NULL,
  PRIMARY KEY (`RoomNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Room`
--

INSERT INTO `Room` (`RoomNo`, `Seats`) VALUES
('A', 50),
('B', 50),
('C', 30);

-- --------------------------------------------------------

--
-- Table structure for table `Schedule`
--

CREATE TABLE IF NOT EXISTS `Schedule` (
  `ProgramCode` int(11) NOT NULL AUTO_INCREMENT,
  `Topic` text NOT NULL,
  `Excercises` text,
  `Notes` text,
  `DocumentPicture` text,
  PRIMARY KEY (`ProgramCode`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- MIME TYPES FOR TABLE `Schedule`:
--   `DocumentPicture`
--       `text_plain`
--   `Excercises`
--       `text_plain`
--   `Notes`
--       `text_plain`
--

--
-- Dumping data for table `Schedule`
--

INSERT INTO `Schedule` (`ProgramCode`, `Topic`, `Excercises`, `Notes`, `DocumentPicture`) VALUES
(1, 'WORD', 'NO', 'tomorrow exercise 4 page 10', 'powerpoint'),
(2, 'EXCEL', 'ex.2 p.3', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE IF NOT EXISTS `Staff` (
  `Username` varchar(10) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `MobilePhone` varchar(8) NOT NULL,
  `EmployeeAcademicDetails` text,
  `EmployeePicture` text,
  `DateOfJoinning` date NOT NULL,
  `Experience` varchar(300) DEFAULT NULL,
  `EmployeeCategory` tinyint(4) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- MIME TYPES FOR TABLE `Staff`:
--   `EmployeeAcademicDetails`
--       `image_jpeg`
--   `EmployeePicture`
--       `image_jpeg`
--

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`Username`, `Password`, `FirstName`, `LastName`, `DateOfBirth`, `MobilePhone`, `EmployeeAcademicDetails`, `EmployeePicture`, `DateOfJoinning`, `Experience`, `EmployeeCategory`) VALUES
('fkyria01', 'ct4qM82', 'Fanos', 'Kyriakou', '1976-04-13', '99887766', 'Apofoitos Tmimatos Pliroforikis Panepistimiou Kuprou', NULL, '2015-09-13', NULL, 2),
('mpetro01', 'k3hb1Ne', 'Maria', 'Petrou', '1980-05-03', '99441122', 'Apofoitos Tmimatos Pliroforikis Panepistimiou Kuprou', NULL, '2014-09-06', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE IF NOT EXISTS `Student` (
  `FirstNameGreek` varchar(30) CHARACTER SET greek NOT NULL,
  `LastNameGreek` varchar(30) CHARACTER SET greek NOT NULL,
  `FirstNameEnglish` varchar(30) CHARACTER SET latin1 NOT NULL,
  `LastNameEnglish` varchar(30) CHARACTER SET latin1 NOT NULL,
  `IdentityType` varchar(20) CHARACTER SET latin1 NOT NULL,
  `IdentityNo` varchar(10) CHARACTER SET latin1 NOT NULL,
  `ECDL_LogbookNo` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address1` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Address2` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `City` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `TownVillage` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `ZipCode` smallint(5) unsigned DEFAULT NULL,
  `HomePhone` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `MobilePhone` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `WorkPhone` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `TestCenter` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `RegistrationLevel` varchar(15) CHARACTER SET latin1 NOT NULL,
  `FatherName` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `FatherJob` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `FatherPhone` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `MotherName` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `MotherJob` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `MotherPhone` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `Documents` text CHARACTER SET latin1,
  `CandidateID` varchar(10) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`CandidateID`),
  UNIQUE KEY `IdentityNo` (`IdentityNo`),
  UNIQUE KEY `ECDL_LogbookNo` (`ECDL_LogbookNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- MIME TYPES FOR TABLE `Student`:
--   `Documents`
--       `image_jpeg`
--

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`FirstNameGreek`, `LastNameGreek`, `FirstNameEnglish`, `LastNameEnglish`, `IdentityType`, `IdentityNo`, `ECDL_LogbookNo`, `DateOfBirth`, `Address1`, `Address2`, `City`, `TownVillage`, `ZipCode`, `HomePhone`, `MobilePhone`, `WorkPhone`, `Email`, `TestCenter`, `RegistrationLevel`, `FatherName`, `FatherJob`, `FatherPhone`, `MotherName`, `MotherJob`, `MotherPhone`, `Documents`, `CandidateID`) VALUES
('Γιώργος', 'Γεωργίου', 'Giorgos', 'Georgiou', 'Identity Card', '969852', '155fdgf5dfgd', '1992-10-18', 'Konstantinou 9', NULL, 'Larnaca', 'Xylophagou', 7520, NULL, '99665544', NULL, 'asjdhakd@asd', 'asjh', '2', 'Andreas', NULL, '99554466', 'Andri', NULL, '99445566', NULL, '12345678'),
('Γιώργος', 'Παπαδάκη', 'Giorgos', 'Andreou', 'Identity Card', '124578', '54ghdg6', '1998-02-23', 'Arxiepiskopou Makariou 10', NULL, 'Nicosia', 'Aglantzia', 7320, NULL, '99558877', NULL, NULL, NULL, '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '685512'),
('Νίκος', 'Ανδρέου', 'Nicos', 'Andreou', 'Identity Card', '214589', 'aghaeth9', '2010-09-22', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '99999'),
('Νίκος', 'Παναγή', 'Nicos', 'Panayi', 'Identity Card', '478961', '65fs62sd5', '1999-11-30', 'Megas Alexandros 8', '', 'Paphos', 'Emba', 8850, '', '99321456', '', '', '', '1', 'Panayiotis', '', '99478132', 'Marianna', '', '96301485', '', '451369');

-- --------------------------------------------------------

--
-- Table structure for table `StudentExam`
--

CREATE TABLE IF NOT EXISTS `StudentExam` (
  `ExamCode` varchar(20) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `FinalMark` varchar(20) DEFAULT NULL,
  `PassFail` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ExamCode`,`StudentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `StudentExam`:
--   `ExamCode`
--       `Exam` -> `ExamCode`
--   `StudentID`
--       `Student` -> `CandidateID`
--

--
-- Dumping data for table `StudentExam`
--

INSERT INTO `StudentExam` (`ExamCode`, `StudentID`, `FinalMark`, `PassFail`) VALUES
('1', '685512', '98', '\0'),
('159', '12345678', '63', '\0'),
('635', '12345678', '20', '\0');

-- --------------------------------------------------------

--
-- Table structure for table `StudentInClass`
--

CREATE TABLE IF NOT EXISTS `StudentInClass` (
  `ClassNo` int(11) NOT NULL,
  `CandidateID` varchar(10) NOT NULL,
  PRIMARY KEY (`ClassNo`,`CandidateID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `StudentInClass`:
--   `CandidateID`
--       `Student` -> `CandidateID`
--   `ClassNo`
--       `Class` -> `ClassNo`
--

--
-- Dumping data for table `StudentInClass`
--

INSERT INTO `StudentInClass` (`ClassNo`, `CandidateID`) VALUES
(1, '12345678'),
(1, '963214'),
(2, '12345678'),
(2, '963214');

-- --------------------------------------------------------

--
-- Table structure for table `Timetable`
--

CREATE TABLE IF NOT EXISTS `Timetable` (
  `TimetableNo` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`TimetableNo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Timetable`
--

INSERT INTO `Timetable` (`TimetableNo`, `StartDate`, `EndDate`) VALUES
(1, '2015-09-06', '2015-12-23'),
(2, '2016-01-17', '2016-05-27');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
