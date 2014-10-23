
create table Office
(
    officeNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    address  char(255),
    postCode char(5),
    telNo    char(10),
    faxNo    char(10)
);

INSERT INTO Office(address, postCode, telNo,faxNo) VALUES ("5606 Bissonnet St","77081","8325122357","8325122357");
INSERT INTO Office(address, postCode, telNo,faxNo) VALUES ("5706 Bellaire Blvd","77096","7132955255","7132955255");

create table Client
(
    clientNo   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstName  char(64),
    lastName   char(64),
    address  char(255),
    postCode char(5),
    telNo    char(10),
    driverLicenseNo char(8),
    sex      char(1),
    DOB      date,
    email    char(255),
    password char(32),
    officeNo integer not null,
    foreign key(officeNo) references Office on update cascade
);

INSERT INTO Client(firstName, lastName, address,postCode,telNo,driverLicenseNo,sex,DOB,email,password,officeNo) 
            VALUES ("Yuzhong","Yan","5606 Bissonnet St","77081","8325122357","11111111","F",'1978-01-01',"yyuzhong@hotmail.com","11111111",1);


INSERT INTO Client(firstName, lastName, address,postCode,telNo,driverLicenseNo,sex,DOB,email,password,officeNo) 
            VALUES ("Jie","Zhang","5606 Bissonnet St","77081","2814094792","22222222","F",'1982-01-01',"zhangjlive@hotmail.com","22222222",1);


create table Staff
(
    staffNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstName  char(64),
    lastName   char(64),
    address    char(255),
    jobTitle    char(16),
    salary      integer,
    /*NIN         char(10),*/
    sex      char(1),
    DOB      date,
    email    char(255),
    password char(32),
    officeNo integer not null,
    foreign key(officeNo) references Office on update cascade
);

INSERT INTO Staff(firstName, lastName, address,jobTitle,salary,sex,DOB,email,password,officeNo) 
            VALUES ("Lei","Huang","5760 Indigo St","Instructor","9999","F",'1982-01-01',"lhuang@pvamu.edu","99999999",1);

INSERT INTO Staff(firstName, lastName, address,jobTitle,salary,sex,DOB,email,password,officeNo) 
            VALUES ("Lin","Li","5626 Blalock St","Instructor","8888","F",'1970-01-01',"linli@pvamu.edu","88888888",1);

create table Manage
(
    staffNo integer not null,
    officeNo integer not null,
    primary key(staffNo,officeNo),
    foreign key(staffNo) references Staff on update cascade,
    foreign key(officeNo) references Office on update cascade
);

INSERT INTO Manage(staffNo, officeNo)
       values((SELECT staffNo from Staff where Staff.firstName="Lei"),(SELECT officeNo from Office where Office.postCode="77081"));

create table Vehicle
(
    vehicleRegNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    model    char(16),
    maker    char(16),
    color    char(10),
    capacity  integer,
    VIN      char(17),
    staffNo integer,
    officeNo integer not null,
    foreign key(officeNo) references Office on update cascade,
    foreign key(staffNo) references Staff on delete set null on update cascade
);

INSERT INTO Vehicle(model,maker,color,capacity,VIN,staffNo,officeNo)
       values("CRV","Honda","White",5,"11111111111111111",(SELECT staffNo from Staff where Staff.firstName="Lei"),(SELECT officeNo from Office where Office.postCode="77081"));


create table Inspection
(
    inspectionNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    inspectionDate  date,
    inspectionTime  time,
    faultsFound integer,
    comments    char(255),
    staffNo integer not null,
    vehicleRegNo integer not null,
    foreign key(staffNo) references Staff on update cascade,
    foreign key(vehicleRegNo) references Vehicle on update cascade
);

INSERT INTO Inspection(inspectionDate,inspectionTime,faultsFound,comments,staffNo,vehicleRegNo)
       values('2014-01-01','12:10:00',0,"No faults",(SELECT staffNo from Staff where Staff.firstName="Lei"),(SELECT vehicleRegNo from Vehicle where Vehicle.VIN="11111111111111111"));


create table Lesson
(
    lessonNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lessonDate  date,
    lessonTime  time,
    stage    char(10),
    comments  char(255),
    staffNo integer not null,
    vehicleRegNo integer not null,
    clientNo integer not null,
    foreign key(staffNo) references Staff on update cascade,
    foreign key(vehicleRegNo) references Vehicle on update cascade,
    foreign key(clientNo) references Client on update cascade
);

INSERT INTO Lesson(lessonDate,lessonTime,stage,comments,staffNo,vehicleRegNo,clientNo)
       values('2014-01-01','12:10:00',"Junior","1st time",(SELECT staffNo from Staff where Staff.firstName="Lei"),(SELECT vehicleRegNo from Vehicle where Vehicle.VIN="11111111111111111"),(SELECT clientNo from Client where Client.firstName="Yuzhong"));

INSERT INTO Lesson(lessonDate,lessonTime,stage,comments,staffNo,vehicleRegNo,clientNo)
       values('2014-01-05','12:10:00',"Junior","2nd time",(SELECT staffNo from Staff where Staff.firstName="Lin"),(SELECT vehicleRegNo from Vehicle where Vehicle.VIN="11111111111111111"),(SELECT clientNo from Client where Client.firstName="Yuzhong"));



create table TakeLesson
(
    mileageStart integer,
    mileageFinish integer,
    comments char(255),
    lessonNo integer not null,
    clientNo integer not null,
    primary key(lessonNo,clientNo),
    foreign key(lessonNo) references Lesson on update cascade,
    foreign key(clientNo) references Client on update cascade
);


INSERT INTO TakeLesson(mileageStart,mileageFinish,comments,lessonNo,clientNo)
       values(35000,35035,"Good job",(SELECT lessonNo from Lesson where Lesson.clientNo = (SELECT clientNo from Client where Client.firstName="Yuzhong") and Lesson.lessonDate='2014-01-01'),(SELECT clientNo from Client where Client.firstName="Yuzhong"));


create table Interview
(
    interviewNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    interviewDate  date,
    interviewTime  time,
    interviewRoom  char(8),
    comments  char(255),
    driverLicenseNo char(8),
    staffNo integer not null,
    clientNo integer not null,
    foreign key(staffNo) references Staff on update cascade,
    foreign key(clientNo) references Client on update cascade
);

INSERT INTO Interview(interviewDate,interviewTime,interviewRoom,comments,driverLicenseNo,staffNo,clientNo)
       values('2014-01-01','09:10:00',"101","Novice","1111111",(SELECT staffNo from Staff where Staff.firstName="Lei"),(SELECT clientNo from Client where Client.firstName="Yuzhong"));



create table DrivingTest
(
    testNo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    testDate  date,
    testTime  time,
    testCenter  char(255),
    testerName  char(128),
    attempt integer,
    result  integer,
    pTestComment char(255),
    testMark    char(10),
    tTestComment char(255),
    staffNo integer not null,
    clientNo integer not null,
    foreign key(staffNo) references Staff on update cascade,
    foreign key(clientNo) references Client on update cascade
);
