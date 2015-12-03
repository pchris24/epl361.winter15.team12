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

-- 1
CREATE PROCEDURE `insertRoom`(IN `rn` VARCHAR(10) CHARSET latin1, IN `s` TINYINT(4))
    NO SQL
insert into Room(RoomNo,Seats) Values(rn,s)$$
-- ------------------------------------------------------------------------------------------ME TODAY
-- 2
CREATE PROCEDURE `insertCourseDetails`(IN `course_name` VARCHAR(20) CHARSET latin1,IN `course_description` VARCHAR(100) CHARSET latin1)
    NO SQL
insert into Course(CourseName,CourseDescription) Values(course_name,course_description)$$

-- 3
CREATE PROCEDURE `deleteCourseDetails`(IN `course_name` VARCHAR(20) CHARSET latin1)
    NO SQL
DELETE FROM Course
WHERE  CourseName = course_name$$

-- 4
CREATE PROCEDURE `editCourseDetails`(IN `previous_course_name` VARCHAR(20) CHARSET latin1, IN `new_course_name` VARCHAR(20) CHARSET latin1,IN `course_description` VARCHAR(100) CHARSET latin1)
    NO SQL
UPDATE Course
set CourseName= new_course_name,
CourseDescription=course_description
where CourseName= previous_course_name$$

-- 5
CREATE PROCEDURE `viewCourseDetails`(IN `course_name` VARCHAR(20) CHARSET latin1)
    NO SQL
select * from Course 
where CourseName=course_name$$

-- 6
CREATE PROCEDURE `insertClassDetails`(IN `ClNo` int(11),IN `rn` VARCHAR(10) CHARSET latin1,IN `cname` VARCHAR(20) CHARSET latin1,IN `teacherUsrname` VARCHAR(10) CHARSET latin1,IN `TimetblNo` int(11),IN `Cldays` bit(7),IN `ClStartTime` time,IN `ClendTime` time,IN `NumOfStudents` int(11))  
    NO SQL
insert into Class(ClassNo,RoomNo,CourseName,TeacherUsername,TimetableNo,Days,StartTime,EndTime,NumberOfStudents) Values(ClNo,rn,cname,teacherUsrname,TimetblNo,Cldays,ClStartTime,ClendTime,NumOfStudents)$$

-- 7
CREATE PROCEDURE `deleteClassDetails`(IN `ClNo` int(11))  
    NO SQL
DELETE FROM Class
WHERE ClassNo = ClNo$$

-- 8
CREATE PROCEDURE `editClassDetails`(IN `previousClassNo` int(11),IN `newClassNo` int(11),IN `RoomNumber` VARCHAR(10) CHARSET latin1,IN`CourseNm` VARCHAR(20) CHARSET latin1,IN`teacher_username` VARCHAR(10) CHARSET latin1,IN`TimetblNo` int(11),IN `ClassDays` bit(7),IN `ClassStartTime` time,IN `ClassEndTime` time,IN `NumOfStudents` int(11))  
    NO SQL
UPDATE Class
set ClassNo=newClassNo,
RoomNo=RoomNumber,
CourseName=CourseNm,
TeacherUsername=teacher_username,
TimetableNo=TimetblNo,
Days=ClassDays,
StartTime=ClassStartTime,
EndTime=ClassEndTime,
NumberOfStudents=NumOfStudents
where ClassNo= previousClassNo$$

-- ----------------------------------------------------------------------------------------------

-- 9
CREATE PROCEDURE `deleteStudentByCandidateID`(IN `cid` VARCHAR(10) CHARSET latin1)
    NO SQL
DELETE FROM Student
WHERE  CandidateID = cid$$


-- 10
CREATE PROCEDURE `editStudent`(IN `previousCID` VARCHAR(10) CHARSET latin1, IN `newCID` VARCHAR(10) CHARSET latin1, IN `FirstNameGreek` VARCHAR(30) CHARSET greek, IN `LastNameGreek` VARCHAR(30) CHARSET greek, IN `FirstNameEnglish` VARCHAR(30) CHARSET latin1, IN `LastNameEnglish` VARCHAR(30) CHARSET latin1, IN `IdentityType` VARCHAR(20) CHARSET latin1, IN `IdentityNo` VARCHAR(10) CHARSET latin1, IN `ECDL_LogbookNo` VARCHAR(20) CHARSET latin1, IN `DateOfBirth` DATE, IN `Address1` VARCHAR(50) CHARSET latin1, IN `Address2` VARCHAR(50) CHARSET latin1, IN `City` VARCHAR(10) CHARSET latin1, IN `TownVillage` VARCHAR(25) CHARSET latin1, IN `ZipCode` SMALLINT(5) UNSIGNED, IN `HomePhone` VARCHAR(8) CHARSET latin1, IN `MobilePhone` VARCHAR(8) CHARSET latin1, IN `WorkPhone` VARCHAR(8) CHARSET latin1, IN `Email` VARCHAR(50) CHARSET latin1, IN `TestCenter` VARCHAR(100) CHARSET latin1, IN `RegistrationLevel` VARCHAR(15) CHARSET latin1, IN `FatherName` VARCHAR(30) CHARSET latin1, IN `FatherJob` VARCHAR(30) CHARSET latin1, IN `FatherPhone` VARCHAR(8) CHARSET latin1, IN `MotherName` VARCHAR(30) CHARSET latin1, IN `MotherJob` VARCHAR(30) CHARSET latin1, IN `MotherPhone` VARCHAR(8) CHARSET latin1, IN `Documents` TEXT CHARSET latin1)
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


-- 11 
CREATE PROCEDURE `insertStudent`(IN `candidateId` VARCHAR(10) CHARSET latin1, IN `firstNameGreek` VARCHAR(30) CHARSET greek, IN `lastNameGreek` VARCHAR(30) CHARSET greek, IN `firstNameEnglish` VARCHAR(30) CHARSET latin1, IN `lastNameEnglish` VARCHAR(30) CHARSET latin1, IN `identityType` VARCHAR(20) CHARSET latin1, IN `identityNo` VARCHAR(10) CHARSET latin1, IN `ecdlLogbookNo` VARCHAR(20) CHARSET latin1, IN `dateOfBirth` DATE, IN `address1` VARCHAR(50) CHARSET latin1, IN `address2` VARCHAR(50) CHARSET latin1, IN `city` VARCHAR(10) CHARSET latin1, IN `townVillage` VARCHAR(25) CHARSET latin1, IN `zipCode` VARCHAR(5) CHARSET latin1, IN `homePhone` VARCHAR(8) CHARSET latin1, IN `mobilePhone` VARCHAR(8) CHARSET latin1, IN `workPhone` VARCHAR(8) CHARSET latin1, IN `email` VARCHAR(50) CHARSET latin1, IN `testCenter` VARCHAR(100) CHARSET latin1, IN `registrationLevel` VARCHAR(15) CHARSET latin1, IN `fatherName` VARCHAR(30) CHARSET latin1, IN `fatherJob` VARCHAR(30) CHARSET latin1, IN `fatherPhone` VARCHAR(8) CHARSET latin1, IN `motherName` VARCHAR(30) CHARSET latin1, IN `motherJob` VARCHAR(30) CHARSET latin1, IN `motherPhone` VARCHAR(8) CHARSET latin1, IN `documents` TEXT CHARSET latin1)
    NO SQL
insert into Student(CandidateID,FirstNameGreek,LastNameGreek,FirstNameEnglish,LastNameEnglish,IdentityType,IdentityNo,ECDL_LogbookNo,DateOfBirth,Address1,Address2,City,TownVillage,ZipCode,HomePhone,MobilePhone,WorkPhone,Email,TestCenter,RegistrationLevel,FatherName,FatherJob,FatherPhone,MotherName,MotherJob,MotherPhone,Documents) values(candidateId,firstNameGreek,lastNameGreek,firstNameEnglish,lastNameEnglish,identityType,identityNo,ecdlLogbookNo,dateOfBirth,address1,address2,city,townVillage,zipCode,homePhone,mobilePhone,workPhone,email,testCenter,registrationLevel,fatherName,fatherJob,fatherPhone,motherName,motherJob,motherPhone,documents)$$

-- 12
CREATE PROCEDURE `viewStudentDetailsByCandidateID`(IN `cid` VARCHAR(10) CHARSET latin1)
    NO SQL
select * from Student where CandidateID=cid$$

-- 13
CREATE PROCEDURE `viewStudentDetailsByECDL_LogbookNo`(IN `ECDL` VARCHAR(20) CHARSET latin1)
    NO SQL
select * from Student where ECDL_LogbookNo=ECDL$$

-- 14
CREATE PROCEDURE `viewStudentDetailsByFirstNameEnglish`(IN `fne` VARCHAR(30) CHARSET latin1)
    NO SQL
select * from Student where FirstNameEnglish=fne$$

-- 15
CREATE PROCEDURE `viewStudentDetailsByFirstNameEnglish+LastNameEnglish`(IN `fne` VARCHAR(30) CHARSET latin1, IN `lne` VARCHAR(30) CHARSET latin1)
    NO SQL
select * from Student where FirstNameEnglish=fne AND LastNameEnglish=lne$$

-- CREATE PROCEDURE `viewStudentDetailsByFirstNameGreek`(IN `fng` VARCHAR(30) CHARSET greek)
--    NO SQL
-- select ALL * from Student where FirstNameGreek=fng$$

-- 16
CREATE PROCEDURE `viewStudentDetailsByFirstNameGreek+LastNameGreek`(IN `fng` VARCHAR(30) CHARSET greek, IN `lng` VARCHAR(30) CHARSET greek)
    NO SQL
select * from Student where FirstNameGreek=fng AND LastNameGreek=lng$$

-- 17
CREATE PROCEDURE `viewStudentDetailsByIdentityNo`(IN `id` VARCHAR(10) CHARSET latin1)
    NO SQL
select * from Student where IdentityNo=id$$

-- 18
CREATE PROCEDURE `viewStudentDetailsByLastNameEnglish`(IN `lne` VARCHAR(30) CHARSET latin1)
    NO SQL
select * from Student where LastNameEnglish=lne$$

-- 19
CREATE PROCEDURE `viewStudentDetailsByLastNameGreek`(IN `lng` VARCHAR(30) CHARSET greek)
    NO SQL
select * from Student where LastNameGreek=lng$$

-- --------------------------------------------------------------------------------------------------------------------------------------------------- ME LAST WEEK & TODAY
-- 20
CREATE PROCEDURE `viewStudentSummaryFirstNameGreekLastNameGreek`(IN `fng` VARCHAR(30) CHARSET greek,IN `lng` VARCHAR(30) CHARSET greek)
    NO SQL
select CandidateID,FirstNameGreek,LastNameGreek,DateOfBirth,RegistrationLevel from Student where LastNameGreek=lng AND FirstNameGreek=fng$$

-- 21
CREATE PROCEDURE `viewStudentSummaryCandidateID`(IN `cid` VARCHAR(10) CHARSET latin1)
    NO SQL
select CandidateID,FirstNameGreek,LastNameGreek,DateOfBirth,RegistrationLevel from Student where CandidateID=cid$$

-- 22
CREATE PROCEDURE `viewStudentSummaryECDL_LogbookNo`(IN `ECDL` VARCHAR(20) CHARSET latin1)
    NO SQL
select CandidateID,FirstNameGreek,LastNameGreek,DateOfBirth,RegistrationLevel from Student where ECDL_LogbookNo=ECDL$$

-- 23
CREATE PROCEDURE `viewStudentSummaryIdentity`(IN `id` VARCHAR(20) CHARSET latin1)
    NO SQL
select CandidateID,FirstNameGreek,LastNameGreek,DateOfBirth,RegistrationLevel from Student where identityNo=id$$

-- 24
CREATE PROCEDURE `viewStudentReport`(IN `cid` VARCHAR(10) CHARSET latin1)
    NO SQL
select FirstNameGreek,LastNameGreek,CandidateID from Student where CandidateID=cid$$

-- 25
CREATE PROCEDURE `viewAttendanceOfClass`(IN `cNo` int(11),IN `startTime` date,IN `endTime` date)
    NO SQL
select Student.CandidateID,FirstNameGreek,LastNameGreek,Present,AttendanceDate 
from Student,Attendance 
where Attendance.ClassNo=cNo AND Student.CandidateID=Attendance.CandidateID AND AttendanceDate >= startTime AND AttendanceDate<=endTime$$ 

-- 26
CREATE PROCEDURE `viewAttendanceOfStudent`(IN `cid` VARCHAR(10) CHARSET latin1,IN `startTime` date,IN `endTime` date)
    NO SQL
select Student.CandidateID,ClassNo,Present,AttendanceDate 
from Student,Attendance
where Student.CandidateID=cid AND AttendanceDate >= startTime AND AttendanceDate <= endTime$$ 

-- 27
CREATE PROCEDURE `insertStudentAttendance`(IN `cid` VARCHAR(10) CHARSET latin1, IN `class_number` INT(4), IN `program_code` INT(4), IN `attendance_date` DATE, IN `present` BIT(1))
    NO SQL
insert into Attendance(CandidateID,ClassNo,ProgramCode,Attendancedate,Present) values(cid,class_number,program_code,attendance_date,present)$$

-- 28
CREATE PROCEDURE `viewClassNoByCid`(IN `cid` VARCHAR(10))
    NO SQL
Select SC.ClassNo,C.CourseName,SC.CandidateID
From StudentInClass SC,Class C
Where SC.CandidateID=cid AND C.ClassNo = SC.ClassNo$$

-- 29
CREATE PROCEDURE `viewStudentDetailsByFirstNameGreek`(IN `fng` VARCHAR(30) CHARSET greek)
    NO SQL
SELECT ALL * from Student  
INNER JOIN(  
SELECT FirstNameGreek  
FROM Student 
GROUP BY FirstNameGreek    
HAVING COUNT(FirstNameGreek) >1  
)temp ON Student.FirstNameGreek  = temp.FirstNameGreek AND temp.FirstNameGreek=fng AND Student.FirstNameGreek=fng$$

-- 30
CREATE PROCEDURE `viewBasicStudentsDetailsClass`(IN `class_number` INT(4))
    NO SQL
Select S.CandidateID,S.LastNameEnglish,S.FirstNameEnglish
From StudentInClass SC,Student S
Where SC.ClassNo=class_number and SC.CandidateID=S.CandidateID$$


-- 31
CREATE PROCEDURE `deleteClassAttendance`(IN `ClNo` INT(11), IN `Attendance_Date` DATE)
    NO SQL
DELETE FROM Attendance 
WHERE AttenDancedate=Attendance_Date and ClassNo=ClNo$$

-- 32
CREATE PROCEDURE `deleteStudentAttendanceByCID`(IN `CID` VARCHAR(10) CHARSET latin1, IN `Attendance_Date` DATE, IN `ClNo` INT(11))
    NO SQL
DELETE FROM Attendance
WHERE  CandidateID=CID and AttendanceDate=Attendance_Date and ClassNo=ClNo$$

-- 33
CREATE PROCEDURE `viewFeesDetailsByCandidateID`(IN `cid` VARCHAR(10))
    NO SQL
Select F.PaymentNo, S.CandidateID, S.FirstNameEnglish, S.LastNameEnglish, C.ClassNo, C.CourseName, F.DateOfPayment, F.Amount, F.FeeMonth, F.FeeYear, F.Discount, F.Name
From StudentInClass SC, Fees F, Class C, Student S
Where F.CandidateID=SC.CandidateID AND S.CandidateID=SC.CandidateID AND F.ClassNo=SC.ClassNo AND SC.ClassNo=C.ClassNo AND F.CandidateID=cid$$

-- 34
CREATE PROCEDURE `viewFeesDetailsByClassNo`(IN `class_number` INT(11))
    NO SQL
Select F.PaymentNo, S.CandidateID, S.FirstNameEnglish, S.LastNameEnglish, C.ClassNo, C.CourseName, F.DateOfPayment, F.Amount, F.FeeMonth, F.FeeYear, F.Discount, F.Name
From StudentInClass SC, Fees F, Class C, Student S
Where F.CandidateID=SC.CandidateID AND S.CandidateID=SC.CandidateID AND F.ClassNo=SC.ClassNo AND SC.ClassNo=C.ClassNo AND C.ClassNo=class_number$$

-- 35
CREATE PROCEDURE `viewFeesDetailsByDateOfPayment`(IN `start_date` DATE, IN `end_date` DATE)
    NO SQL
Select F.PaymentNo, S.CandidateID, S.FirstNameEnglish, S.LastNameEnglish, C.ClassNo, C.CourseName, F.DateOfPayment, F.Amount, F.FeeMonth, F.FeeYear, F.Discount, F.Name
From StudentInClass SC, Fees F, Class C, Student S
Where F.CandidateID=SC.CandidateID AND S.CandidateID=SC.CandidateID AND F.ClassNo=SC.ClassNo AND SC.ClassNo=C.ClassNo AND F.DateOfPayment BETWEEN start_date AND end_date$$

-- 36
CREATE PROCEDURE `viewFeesDetailsByDateOfPaymentAndCid`(IN `start_date` DATE, IN `end_date` DATE, IN `cid` VARCHAR(10))
    NO SQL
Select F.PaymentNo, S.CandidateID, S.FirstNameEnglish, S.LastNameEnglish, C.ClassNo, C.CourseName, F.DateOfPayment, F.Amount, F.FeeMonth, F.FeeYear, F.Discount, F.Name
From StudentInClass SC, Fees F, Class C, Student S
Where F.CandidateID=SC.CandidateID AND S.CandidateID=SC.CandidateID AND F.ClassNo=SC.ClassNo AND SC.ClassNo=C.ClassNo AND F.CandidateID=cid AND F.DateOfPayment BETWEEN start_date AND end_date$$

-- 37
CREATE PROCEDURE `viewFeesDetailsByDateOfPaymentAndClassNo`(IN `start_date` DATE, IN `end_date` DATE, IN `class_number` INT(11))
    NO SQL
Select F.PaymentNo, S.CandidateID, S.FirstNameEnglish, S.LastNameEnglish, C.ClassNo, C.CourseName, F.DateOfPayment, F.Amount, F.FeeMonth, F.FeeYear, F.Discount, F.Name
From StudentInClass SC, Fees F, Class C, Student S
Where F.CandidateID=SC.CandidateID AND S.CandidateID=SC.CandidateID AND F.ClassNo=SC.ClassNo AND SC.ClassNo=C.ClassNo AND F.ClassNo=class_number AND F.DateOfPayment BETWEEN start_date AND end_date$$

-- 38
CREATE PROCEDURE `viewFeesDetailsByMonthAndYear`(IN `fee_month` INT(4), IN `fee_year` INT(4))
    NO SQL
Select F.PaymentNo, S.CandidateID, S.FirstNameEnglish, S.LastNameEnglish, C.ClassNo, C.CourseName, F.DateOfPayment, F.Amount, F.FeeMonth, F.FeeMonth, F.Discount, F.Name
From StudentInClass SC, Fees F, Class C, Student S
Where F.CandidateID=SC.CandidateID AND S.CandidateID=SC.CandidateID AND F.ClassNo=SC.ClassNo AND SC.ClassNo=C.ClassNo AND F.FeeMonth=fee_month AND F.FeeYear=fee_year$$

-- 39
CREATE PROCEDURE `viewFeesDetailsByMonthYearAndCid`(IN `fee_month` INT(4), IN `fee_year` INT(4), IN `cid` VARCHAR(10) CHARSET latin1)
    NO SQL
Select F.PaymentNo, S.CandidateID, S.FirstNameEnglish, S.LastNameEnglish, C.ClassNo, C.CourseName, F.DateOfPayment, F.Amount, F.FeeMonth, F.FeeYear, F.Discount, F.Name
From StudentInClass SC, Fees F, Class C, Student S
Where F.CandidateID=SC.CandidateID AND S.CandidateID=SC.CandidateID AND F.ClassNo=SC.ClassNo AND SC.ClassNo=C.ClassNo AND F.FeeMonth=fee_month AND F.FeeYear=fee_year AND F.CandidateID=cid$$

-- 40
CREATE PROCEDURE `viewFeesDetailsByMonthYearAndClassNo`(IN `fee_month` INT(4), IN `fee_year` INT(4), IN `class_number` INT(11))
    NO SQL
Select F.PaymentNo, S.CandidateID, S.FirstNameEnglish, S.LastNameEnglish, C.ClassNo, C.CourseName, F.DateOfPayment, F.Amount, F.FeeMonth, F.FeeYear, F.Discount, F.Name
From StudentInClass SC, Fees F, Class C, Student S
Where F.CandidateID=SC.CandidateID AND S.CandidateID=SC.CandidateID AND F.ClassNo=SC.ClassNo AND SC.ClassNo=C.ClassNo AND F.FeeMonth=fee_month AND F.FeeYear=fee_year AND F.ClassNo=class_number$$

-- 41
CREATE PROCEDURE `viewFeesDetailsOfTechnopedia`()
    NO SQL
Select F.PaymentNo, S.CandidateID, S.FirstNameEnglish, S.LastNameEnglish, C.ClassNo, C.CourseName, F.DateOfPayment, F.Amount, F.FeeMonth, F.FeeYear, F.Discount, F.Name
From StudentInClass SC, Fees F, Class C, Student S
Where F.CandidateID=SC.CandidateID AND S.CandidateID=SC.CandidateID AND F.ClassNo=SC.ClassNo AND SC.ClassNo=C.ClassNo$$

-- 42
CREATE PROCEDURE `viewClassDetailsByCourseName`(IN `course_name` VARCHAR(20) CHARSET latin1)
    NO SQL
Select *
From Class C
Where C.CourseName=course_name$$

-- 43
CREATE PROCEDURE `insertFee`(IN `PaymentNO` INT(11), IN `CandidateID` VARCHAR(10) CHARSET latin1, IN `Name` VARCHAR(30) CHARSET latin1, IN `Amount` DOUBLE, IN `Fee_Month` TINYINT(4), IN `PaymentDate` DATE, IN `Discount` DOUBLE, IN `ClassNo` INT(11), IN `Fee_Year` INT(4))
    NO SQL
insert into Fees(PaymentNo,CandidateID,Name,Amount,FeeMonth,DateOfPayment,Discount,ClassNo,FeeYear) values(PaymentNo,CandidateID,Name,Amount,Fee_Month,PaymentDate,Discount,ClassNo,Fee_Year)$$

-- 44
CREATE PROCEDURE `editAttendance`(IN `prevCandidateID` VARCHAR(10) CHARSET latin1, IN `prevClassNo` INT, IN `prevDate` DATE, IN `newCandidateID` VARCHAR(10) CHARSET latin1, IN `newClassNo` INT, IN `newProgramCode` INT, IN `newDate` DATE, IN `newPresent` BIT)
    NO SQL
UPDATE Attendance
SET CandidateID=newCandidateID,
    ClassNo=newClassNo,
    ProgramCode=newProgramCode,
    Attendancedate=newDate,
    Present=newPresent
 WHERE CandidateID=prevCandidateID AND ClassNo=prevClassNo AND AttendanceDate=prevDate$$

-- 45
CREATE PROCEDURE `editFee`(IN `prevPaymentNo` INT(11), IN `newPaymentNo` INT(11), IN `prevCandidateID` VARCHAR(10) CHARSET latin1, IN `newCandidateID` VARCHAR(10) CHARSET latin1, IN `newName` VARCHAR(30) CHARSET latin1, IN `newMonth` TINYINT(4), IN `prevClassNo` INT(11), IN `newClassNo` INT(11), IN `newDateOfPayment` DATE, IN `newDiscount` DOUBLE, IN `newYear` INT(4))
    NO SQL
UPDATE Fees
SET PaymentNo=newPaymentNo,
    CandidateID=newCandidateID,
    ClassNo=newClassNo,
    Name=newName,
    FeeMonth=newMonth,
    DateOfPayment=newDateOfPayment,
    Discount=newDiscount,
    FeeYear=newYear
 WHERE PaymentNo=prevPaymentNO AND CandidateID=prevCandidateID 
 	AND ClassNo=prevClassNo$$

-- 46
CREATE PROCEDURE `editRoom`(IN `prevRoomNo` VARCHAR(10) CHARSET latin1, IN `newRoomNo` VARCHAR(10) CHARSET latin1, IN `newSeatsNo` TINYINT(4))
    NO SQL
UPDATE Room
SET RoomNo=newRoomNo,
    Seats=newSeatsNo
WHERE RoomNo=prevRoomNo$$

-- 47     
CREATE PROCEDURE `deleteFee`(IN `Payment_No` INT(11))
    NO SQL
DELETE FROM Fees 
WHERE PaymentNo=Payment_No$$

-- 48
CREATE PROCEDURE `deleteReicept`(IN `ReceiptCode` INT(11))
    NO SQL
DELETE FROM Receipt 
WHERE Code=ReceiptCode$$

-- 49
CREATE PROCEDURE `deleteRoom`(IN `Room_No` VARCHAR(10) CHARSET latin1)
    NO SQL
DELETE FROM Room 
WHERE RoomNo=Room_No$$

-- 50
CREATE PROCEDURE `deleteTimetable`(IN `Timetable_No` INT(11))
    NO SQL
DELETE FROM Timetable 
WHERE TimetableNo=Timetable_No$$
 	
 -- 51
CREATE PROCEDURE `editReceipt`(IN `newPaymentNo` INT(11), IN `newAmount` DOUBLE, IN `prevCode` INT(11), IN `newCode` INT(11), IN `newDate` DATE, IN `newTypeOfPayment` TINYINT(4))
    NO SQL
UPDATE Receipt
SET Code=newCode,
    Amount=newAmount,
    PaymentNo=newPaymentNo,
    ReceiptDate=newDate,
    TypeOfPayment=newTypeOfPayment
 WHERE Code=prevCode$$ 	

 -- 52
 CREATE PROCEDURE `editTimetable`(IN `prevTimetableNO` INT(11), IN `newTimetableNo` INT(11), IN `newStartDate` DATE, IN `newEndDate` DATE)
    NO SQL
UPDATE Timetable
SET TimetableNo=newTimetableNo,
    StartDate=newStartDate,
    EndDate=newEndDate
 WHERE TimetableNo=prevTimetableNO$$

 -- 53
 CREATE PROCEDURE `insertReceipt`(IN `Code` INT(11), IN `PaymentNo` INT(11), IN `Receipt_Date` DATE, IN `Amount` DOUBLE, IN `TypeofPayment` TINYINT(4))
    NO SQL
insert into Receipt(Code,PaymentNo,ReceiptDate,Amount,TypeOfpayment) values(Code,PaymentNo,Receipt_Date,Amount,TypeOfpayment)$$

 -- 54
CREATE PROCEDURE `insertTimetable`(IN `TimetableNo` INT(11), IN `StartDate` DATE, IN `EndDate` DATE)
    NO SQL
insert into Timetable(TimetableNo,StartDate,EndDate) values(TimetableNo,StartDate,EndDate)$$

 -- 55
CREATE PROCEDURE `sumOfPayments`(IN `startDate` DATE, IN `endDate` DATE)
    NO SQL
SELECT IFNULL(Sum(F.Amount-F.Discount),0) AS SumOfPayments
FROM Fees F
WHERE F.DateOfPayment BETWEEN startDate AND endDate$$

 -- 56
CREATE PROCEDURE `averagePayments`(IN `startDate` DATE, IN `endDate` DATE)
    NO SQL
SELECT IFNULL((Sum(F.Amount-F.Discount)/Count(*)),0)
FROM Fees F
WHERE F.DateOfPayment BETWEEN startDate AND endDate$$

 -- 57
CREATE PROCEDURE `veiwTimetableByDate`(IN `FirstDate` DATE, IN `SecondDate` DATE)
    NO SQL
select *
from Timetable
where StartDate >=FirstDate AND StartDate<=SecondDate$$

-- 58
CREATE PROCEDURE `viewReceipt`(IN `CandidateId` VARCHAR(10) CHARSET latin1)
    NO SQL
select s.FirstNameEnglish ,s.LastNameEnglish,f.FeeMonth,f.FeeYear,f.Amount
from Student s, Fees f
where s.CandidateID=f.CandidateID AND s.CandidateId=CandidateID$$

-- 59
CREATE PROCEDURE `viewRoomByRoomNo`(IN `rn` VARCHAR(10) CHARSET latin1)
    NO SQL
Select RoomNo,Seats
From Room
Where RoomNo=rn$$

-- 60
CREATE PROCEDURE `viewRoomBySeats`(IN `Seats` TINYINT(4))
    NO SQL
Select RoomNo,Seats
From Room
Where Seats>=Seats$$

-- 61
CREATE PROCEDURE `viewRooms`()
    NO SQL
Select *
From Room$$

-- 62
CREATE PROCEDURE `viewTimetable`(IN `Timetable_No` INT(11))
    NO SQL
Select *
From Timetable
Where TimetableNo=Timetable_No$$


-- 63
CREATE PROCEDURE `viewTimetables`()
    NO SQL
Select *
From Timetable$$


-- 64
CREATE PROCEDURE `viewStaffDetailsByFirstNameAndLastName`(IN `staff_first_name` VARCHAR(30) CHARSET latin1, IN `staff_last_name` VARCHAR(30) CHARSET latin1)
    NO SQL
Select *
From Staff
Where FirstName=staff_first_name AND LastName=staff_last_name$$

-- 65
CREATE PROCEDURE `viewStaffDetailsByUsername`(IN `staff_username` VARCHAR(10) CHARSET latin1)
    NO SQL
Select *
From Staff
Where Username=staff_username$$

-- 66
CREATE PROCEDURE `insertStaff`(IN `user_name` VARCHAR(10) CHARSET latin1, IN `staff_password` VARCHAR(15) CHARSET latin1, IN `first_name` VARCHAR(30) CHARSET latin1, IN `last_name` VARCHAR(30) CHARSET latin1, IN `date_of_birth` DATE, IN `mobile_phone` VARCHAR(8) CHARSET latin1, IN `employee_academic_details` TEXT CHARSET latin1, IN `employee_picture` TEXT CHARSET latin1, IN `date_of_joinning` DATE, IN `experience` VARCHAR(300) CHARSET latin1, IN `employee_category` TINYINT(4), IN `email` VARCHAR(30) CHARSET latin1)
    NO SQL
Insert into Staff(Username,StaffPassword,FirstName,LastName,DateOfBirth,MobilePhone,EmployeeAcademicDetails,EmployeePicture,DateOfJoinning,Experience,EmployeeCategory,Email) values(user_name,staff_password,first_name,last_name,date_of_birth,mobile_phone,employee_academic_details,employee_picture,date_of_joinning,experience,employee_category,email)$$

-- 67
CREATE PROCEDURE `viewCourses`()
    NO SQL
Select *
From Course$$

-- 68
CREATE PROCEDURE `viewCourse`(IN `course_name` VARCHAR(20) CHARSET latin1)
    NO SQL
Select *
From Course
Where CourseName=course_name$$

-- 69
CREATE PROCEDURE `viewClasses`()
    NO SQL
Select *
From Class$$

-- 70
CREATE PROCEDURE `viewClass`(IN `classNumber` INT(11))
    NO SQL
Select *
From Class
Where ClassNo=classNumber$$

DELIMITER ;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- MIME TYPES FOR TABLE `Student`:
-- `Documents`
-- `image_jpeg`



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
-- Table structure for table `Staff`
--

CREATE TABLE IF NOT EXISTS `Staff` (
  `Username` varchar(10) NOT NULL,
  `StaffPassword` varchar(10) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `MobilePhone` varchar(8) NOT NULL,
  `EmployeeAcademicDetails` text,
  `EmployeePicture` text,
  `DateOfJoinning` date NOT NULL,
  `Experience` varchar(300) DEFAULT NULL,
  `EmployeeCategory` tinyint(4) NOT NULL,
  `Email` VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- MIME TYPES FOR TABLE `Staff`:
-- `EmployeeAcademicDetails`
-- `image_jpeg`
-- `EmployeePicture`
-- `image_jpeg`
--

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`Username`, `StaffPassword`, `FirstName`, `LastName`, `DateOfBirth`, `MobilePhone`, `EmployeeAcademicDetails`, `EmployeePicture`, `DateOfJoinning`, `Experience`, `EmployeeCategory`,`Email`) VALUES
('fkyria01', 'ct4qM82', 'Fanos', 'Kyriakou', '1976-04-13', '99887766', 'Apofoitos Tmimatos Pliroforikis Panepistimiou Kuprou', NULL, '2015-09-13', NULL, 2,'afdka@hotmail.com'),
('mpetro01', 'k3hb1Ne', 'Maria', 'Petrou', '1980-05-03', '99441122', 'Apofoitos Tmimatos Pliroforikis Panepistimiou Kuprou', NULL, '2014-09-06', NULL, 1,'asdka@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Timetable`
--

CREATE TABLE IF NOT EXISTS `Timetable` (
  `TimetableNo` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`TimetableNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Timetable`
--

INSERT INTO `Timetable` (`TimetableNo`, `StartDate`, `EndDate`) VALUES
(1, '2015-09-06', '2015-12-23'),
(2, '2016-01-17', '2016-05-27');

--
-- Table structure for table `Tschedule`
--

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Tschedule` (
  `ProgramCode` int(11) NOT NULL AUTO_INCREMENT,
  `Topic` text NOT NULL,
  `Excercises` text,
  `Notes` text,
  `DocumentPicture` text,
  PRIMARY KEY (`ProgramCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- MIME TYPES FOR TABLE `Tschedule`:
-- `DocumentPicture`
-- `text_plain`
-- `Excercises`
-- `text_plain`
-- `Notes`
-- `text_plain`
--

--
-- Dumping data for table `Tschedule`
--

INSERT INTO `Tschedule` (`ProgramCode`, `Topic`, `Excercises`, `Notes`, `DocumentPicture`) VALUES
(1, 'WORD', 'NO', 'tomorrow exercise 4 page 10', 'powerpoint'),
(2, 'EXCEL', 'ex.2 p.3', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ExamTitle`
--

CREATE TABLE IF NOT EXISTS `ExamTitle` (
  `ExamTitleCode` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ExamTitleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Dumping data for table `ExamTile`
--

INSERT INTO `ExamTitle` (`ExamTitleCode`) VALUES
('Access'),
('Excel'),
('Word');

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
   PRIMARY KEY (`ExamCode`),
   CONSTRAINT fk_Exam_Title
   FOREIGN KEY (ExamTitle) REFERENCES ExamTitle(ExamTitleCode)
 
  -- FOREIGN KEY (ExamTitle) REFERENCES ExamTitle(ExamTitleCode)
  -- ON DELETE CASCADE
  -- ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;


-- ALTER TABLE Exam
--  DROP FOREIGN KEY fk_Exam_Title;
--
-- RELATIONS FOR TABLE `Exam`:
-- `ExamTitle`
-- `ExamTile` -> `ExamTitleCode`
--

--
-- Dumping data for table `Exam`
--

INSERT INTO `Exam` (`ExamCode`, `ExamTitle`, `ModuleCode`, `ModuleDescription`, `ExamSessionDate`, `StartTime`, `TestCenterName`, `PendencyStatus`) VALUES
('1', 'Word', 'MS3', NULL, '2016-01-15', '15:00:00', 'Technopedia', NULL),
('635', 'Excel', 'MS5', NULL, '2016-01-16', '13:00:00', 'Technopedia', NULL),
('1235', 'Excel', 'MS5', NULL, '2015-11-05', '16:00:00', 'wetgrw', NULL),
('159', 'Access', 'M7', NULL, '2015-11-05', '16:00:00', 'Techopedia', NULL);

-- --------------------------------------------------------
--
-- Table structure for table `StudentExam`
--

CREATE TABLE IF NOT EXISTS `StudentExam` (
  `ExamCode` varchar(20) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `FinalMark` varchar(20) DEFAULT NULL,
  `PassFail` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ExamCode`,`StudentID`),
  CONSTRAINT fk_Exam_CandidateID
  FOREIGN KEY (StudentID) REFERENCES Student(CandidateID),
  CONSTRAINT fk_Exam_ExamCode
  FOREIGN KEY (ExamCode) REFERENCES Exam(ExamCode)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--  RELATIONS FOR TABLE `StudentExam`:
--  `ExamCode`
--  `Exam` -> `ExamCode`
--   `StudentID`
--   `Student` -> `CandidateID`
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
-- Table structure for table `Course`
--

CREATE TABLE IF NOT EXISTS `Course` (
  `CourseName` varchar(20) NOT NULL,
  `CourseDescription` varchar(100) NOT NULL,
  PRIMARY KEY (`CourseName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`CourseName`,`CourseDescription`) VALUES
('EPL342','Database Principles, teaches the most important principles of Database Management.'),
('EPL361','Software Engineering I, teaches the basic principles of Software Engineering.');

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE IF NOT EXISTS `Room` (
  `RoomNo` varchar(10) NOT NULL,
  `Seats` tinyint(4) NOT NULL,
  PRIMARY KEY (`RoomNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Room`
--

INSERT INTO `Room` (`RoomNo`, `Seats`) VALUES
('A', 50),
('B', 50),
('C', 30);

-- --------------------------------------------------------
--
-- Table structure for table `Class`
--

CREATE TABLE IF NOT EXISTS `Class` (
  `ClassNo` int(11) NOT NULL,
  `RoomNo` varchar(10) NOT NULL,
  `CourseName` varchar(20) NOT NULL,
  `TeacherUsername` varchar(10) NOT NULL,
  `TimetableNo` int(11) NOT NULL,
  `Days` bit(7) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `NumberOfStudents` int(11) NOT NULL,
  PRIMARY KEY (`ClassNo`),
  CONSTRAINT fk_Class_RoomNo
  FOREIGN KEY (RoomNo) REFERENCES Room(RoomNo),
  CONSTRAINT fk_Class_CourseName
  FOREIGN KEY (CourseName) REFERENCES Course(CourseName),
  CONSTRAINT fk_Class_TimetableNo
  FOREIGN KEY (TimetableNo) REFERENCES Timetable(TimetableNo),
  CONSTRAINT fk_Class_StaffUsername
  FOREIGN KEY (TeacherUsername) REFERENCES Staff(Username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Class`:
--   `CourseName`
--   `Course` -> `CourseName`
--   `RoomNo`      
--   `Room` -> `RoomNo`
--   `StaffUsername`
--   `Staff` -> `Username`
--   `TimetableNo`
--   `Timetable` -> `TimetableNo`
--

--
-- Dumping data for table `Class`
--

INSERT INTO `Class` (`ClassNo`, `RoomNo`, `CourseName`, `TeacherUsername`, `TimetableNo`, `Days`, `StartTime`, `EndTime`, `NumberOfStudents`) VALUES
(1, 'A', 'EPL361', 'fkyria01', 1, 'S', '15:00:00', '16:00:00', 10),
(2, 'B', 'EPL342', 'mpetro01', 1, 'Y', '14:00:00', '15:00:00', 10);

-- --------------------------------------------------------

--
-- Table structure for table `StudentInClass`
--

CREATE TABLE IF NOT EXISTS `StudentInClass` (
  `ClassNo` int(11) NOT NULL,
  `CandidateID` varchar(10) NOT NULL,
  PRIMARY KEY (`ClassNo`,`CandidateID`),
  CONSTRAINT fk_StudentInClass_CandidateID
  FOREIGN KEY (CandidateID) REFERENCES Student(CandidateID),
  CONSTRAINT fk_StudentInClass_ClassNo
  FOREIGN KEY (ClassNo) REFERENCES Class(ClassNo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--  RELATIONS FOR TABLE `StudentInClass`:
--  `CandidateID`
--   `Student` -> `CandidateID`
--   `ClassNo`
--   `Class` -> `ClassNo`
--

--
-- Dumping data for table `StudentInClass`
--

INSERT INTO `StudentInClass` (`ClassNo`, `CandidateID`) VALUES
(1, '451369'),
(1, '99999'),
(2, '99999');

-- --------------------------------------------------------

--
-- Table structure for table `Fees`
--

CREATE TABLE IF NOT EXISTS `Fees` (
  `PaymentNo` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Amount` double NOT NULL,
  `FeeMonth` tinyint(4) NOT NULL,
  `DateOfPayment` date NOT NULL,
  `Discount` double NOT NULL DEFAULT 0, 
   `ClassNo` int(11) NOT NULL,
  `CandidateID` varchar(10) NOT NULL,
  `FeeYear` int(4) NOT NULL,
  PRIMARY KEY (`PaymentNo`),
  CONSTRAINT fk_Fees_CandidateIDinClass
  FOREIGN KEY (ClassNo,CandidateID) REFERENCES StudentInClass(ClassNo,CandidateID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Fees`:
-- `StudentID`
-- `Student` -> `CandidateID`
--

--
-- Dumping data for table `Fees`
--

INSERT INTO `Fees` (`PaymentNo`, `Name`, `Amount`, `FeeMonth`, `DateOfPayment`, `Discount`, `ClassNo`, `CandidateID`,`FeeYear`) VALUES
(20168,'Costas Andreou', 250.0, 11, '2015-12-12',0,1,'451369',2015),
(3596, 'Marina Panayi', 600.0, 12, '2015-12-21',0,2,'99999',2015);


-- ALLAGES SE INSERT!!!

-- --------------------------------------------------------

--
-- Table structure for table `Receipt`
--

CREATE TABLE IF NOT EXISTS `Receipt` (
  `Code` int(11) NOT NULL,
  `PaymentNo` int(11) NOT NULL,
  `ReceiptDate` date NOT NULL,
  `Amount` double NOT NULL,
  `TypeOfPayment` tinyint(4) NOT NULL,
  PRIMARY KEY (`Code`),
  CONSTRAINT fk_Receipt_PaymentNo
  FOREIGN KEY (PaymentNo) REFERENCES Fees(PaymentNo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--   RELATIONS FOR TABLE `Receipt`:
--   `PaymentNo`
--    `Fees` -> `PaymentNo`
--

--
-- Dumping data for table `Receipt`
--

INSERT INTO `Receipt` (`Code`, `PaymentNo`, `ReceiptDate`, `Amount`, `TypeOfPayment`) VALUES
(1, 3596, '2015-11-05', 200, 1),
(2, 20168, '2013-11-05', 200, 1),
(963, 20168, '2015-09-17', 120, 2),
(9631, 3596, '2015-11-13', 150, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE IF NOT EXISTS `Tevent` (
  `Number` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Name` varchar(30) NOT NULL,
  `ExamCode` varchar(20) DEFAULT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `Location` varchar(30) DEFAULT NULL,
  `EventDescription` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Number`),
  CONSTRAINT fk_Tevent_examCode
  FOREIGN KEY (examCode) REFERENCES Exam(examCode)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- RELATIONS FOR TABLE `Tevent`:
--  `ExamCode`
--   `Exam` -> `ExamCode`
--

--
-- Dumping data for table `Tevent`
--

INSERT INTO `Tevent` (`Number`, `Date`, `Name`, `ExamCode`, `StartTime`, `EndTime`, `Location`, `EventDescription`) VALUES
(1, '2015-11-11', 'Welcome ceremony', NULL, '18:00:00', '20:00:00', 'Technopedia',NULL),
(2, '2016-01-15', 'Word exam', '635', '10:00:00', '12:00:00', 'Technopedia',NULL);

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
  PRIMARY KEY (`EventNumber`,`StaffUsername`),
  CONSTRAINT fk_EventReminder_EventNumber
  FOREIGN KEY (EventNumber) REFERENCES Tevent(Number),
   CONSTRAINT fk_EventReminder_StaffUsername
  FOREIGN KEY (StaffUsername) REFERENCES Staff(Username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `EventReminder`:
--    `EventNumber`
--    `Event` -> `Number`
--    `StaffUsername`
--    `Staff` -> `Username`
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
-- Table structure for table `Expenses`
--

CREATE TABLE IF NOT EXISTS `Expenses` (
  `ExpensesNo` int(11) NOT NULL AUTO_INCREMENT,
  `Amount` double NOT NULL,
  `DateDue` date NOT NULL,
  `DateOfPayment` date DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  `StaffUsername` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ExpensesNo`),
  CONSTRAINT fk_Expenses_StaffUsername
  FOREIGN KEY (StaffUsername) REFERENCES Staff(Username)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- RELATIONS FOR TABLE `Expenses`:
-- `StaffUsername`
-- `Staff` -> `Username`
--

--
-- Dumping data for table `Expenses`
--

INSERT INTO `Expenses` (`ExpensesNo`, `Amount`, `DateDue`, `DateOfPayment`, `Name`, `StaffUsername`) VALUES
(1, 100, '2015-02-03', NULL, 'Electricity', 'fkyria01'),
(2, 800, '2015-11-12', '2015-11-28', '', 'fkyria01');

-- -------------------------------------------------------

--
-- Table structure for table `Attendance`
--

CREATE TABLE IF NOT EXISTS `Attendance` (
  `CandidateID` varchar(10) NOT NULL,
  `ClassNo` int(11) NOT NULL,
  `ProgramCode` int(11) NOT NULL,
  `Attendancedate` date NOT NULL,
  `Present` bit(1) NOT NULL,
  PRIMARY KEY (`CandidateID`,`ClassNo`,`AttendanceDate`),
  CONSTRAINT fk_Attendance_CandidateIDinClass
  FOREIGN KEY (ClassNo,CandidateID) REFERENCES StudentInClass(ClassNo,CandidateID),
  CONSTRAINT fk_Attendance_ProgramCode 
  FOREIGN KEY (ProgramCode) REFERENCES Tschedule(ProgramCode)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
--   RELATIONS FOR TABLE `Attendance`:
--
--   `CandidateID`
--   `Student` -> `CandidateID`
--   `ClassNo`
--   `Class` -> `ClassNo`
--   `ProgramCode`
--   `Program` -> `ProgramCode`
--

--
-- Dumping data for table `Attendance`
--

INSERT INTO `Attendance` (`CandidateID`, `ClassNo`, `ProgramCode`, `AttendanceDate`, `Present`) VALUES
('99999', 2, 1, '2015-11-24',1),
('451369', 1, 1, '2015-11-24',1),
('451369', 1, 2, '2015-11-25',0);

-- --------------------------------------------------------
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
