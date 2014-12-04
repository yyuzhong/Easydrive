/*a: The names and telephone numbers of the Managers of each office*/
SELECT Staff.firstName, Staff.lastName, Office.telNo FROM Manage inner JOIN Staff ON Staff.staffNo=Manage.staffNo inner JOIN Office 
ON Office.officeNo=Manage.officeNo;

/*b: the full address of all offices in Glasgow*/
SELECT address,postCode from Office where city="Houston";


/*c: the names of all female Instructors based in the Glasgow,Bearsden office*/

SELECT A.firstName,A.lastName,B.city from (SELECT firstName, lastName, officeNo from Staff where sex="F") A inner JOIN 
(select officeNo,city from Office where city="Houston") B ON A.officeNo=B.officeNo;


/*d: the total number of staff at each office*/
SELECT A.officeNo, A.city,A.address,A.postCode, B.staffNumber from Office as A inner JOIN 
(Select officeNo, count(*) as staffNumber from Staff as S1 group by officeNo)  B ON A.officeNo=B.officeNo;

/*e: the total number of clients(past and present) in each city*/

SELECT  A.city,A.address,A.postCode, B.clientNumber from Office as A inner JOIN 
(Select officeNo, count(*) as clientNumber from Client as C1 group by officeNo)  B ON A.officeNo=B.officeNo;

/*f: the timetable of appointments for a given Instructor next week*/

select  B.firstName,B.lastName,A.lessonDate,A.stage from (select * from Lesson where LessonDate<'2014-07-07' and LessonDate>'2014-06-30') A inner JOIN 
(SELECT firstName,lastName,staffNo from Staff where Staff.firstName="Yonggao") B on A.staffNo=B.staffNo

/*g: the details of interviews conducted by a given Instructor*/
select B.firstName,B.lastName, A.interviewDate,A.comments,C.firstName,C.lastName from Interview as A inner JOIN 
(SELECT firstName,lastName,staffNo from Staff where Staff.firstName="Lei") B on A.staffNo=B.staffNo inner JOIN Client as C on A.clientNo=C.clientNo

/*h:the total number of female and male clients(past and present) in the Glasgow Bearsden office*/

select A.city,B.officeNo,B.sex,B.cNumber from (select officeNo,city from Office where city="Houston") A inner JOIN 
(select officeNo,sex,count(*) as cNumber from Client group by sex) B on A.officeNo=B.officeNo

/*i: the numbers and name of staff who are instructors and over 55 years old*/

select firstName,lastName,DOB as cNumber from Staff where DOB<"1980-01-01" and jobTitle="Instructor"

/*j: the registration number of cars that had no faults found*/

select  B.vehicleRegNo, B.model,B.VIN, A.faultsFound from (select vehicleRegNo,faultsFound from Inspection where faultsFound=0) A inner JOIN 
(select * from Vehicle) B on A.vehicleRegNo=B.vehicleRegNo


/*k: the registration number of the cars used by Instructors at the Glasgow, Bearsden office*/

select  B.vehicleRegNo, B.model,B.VIN, A.OfficeNo, A.city from (select officeNo,city from Office where city="Houston") A inner JOIN 
(select * from Vehicle) B on A.officeNo=B.officeNo


/*l: The names of clients who passed the driving test in January 2013*/

select B.firstName,B.lastName,A.testDate from (select * from DrivingTest where testMark='Pass' and testDate>"2014-07-30" and testDate<"2014-09-01") A inner JOIN 
(select * from Client) B on A.clientNo=B.clientNo

/*m: the names of clients who have sat the driving test more than three times and have still not passed*/

select B.firstName,B.lastName from (select *, count(*) as fNumber from DrivingTest where testMark='Fail' having fNumber>2) A  inner JOIN 
(select * from Client) B on A.clientNo=B.clientNo


/*n: the average number of miles driven during  a one-hour lesson*/

select AVG(A.milesLesson) from (select mileageFinish-mileageStart as milesLesson from TakeLesson) A;


/*o: the number of administrative staff located at each office*/

SELECT t1.officeNo,t1.city,t1.postCode,t1.address,count(t2.staffno) as adminNumber FROM Office as t1 
left outer join Staff as t2 on t1.officeNo=t2.officeNO where t2.jobTitle='Manager' group by t1.officeNo






