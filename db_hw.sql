drop table Branch;

create table Branch
(branchno char(5) not null,
 street varchar(35),
 city varchar(10),
 postcode varchar(10),
 primary key(branchno)
);

insert into Branch values 
('B005','22 Deer Rd','London','SW1 4EH'),
('B007','16 Argyll St','Aberdeen','AB2 3SU'),
('B003','163 Main St','Glasgow','G11 9QX'),
('B004','32 Manse Rd','Bristol','BS99 1NZ'),
('B002','56 Clover Dr','London','NW10 6EU');

drop table Staff;

create table Staff
(staffno char(5) not null,
 fname varchar(10),
 lname varchar(10),
 position varchar(10),
 sex char(1),
 dob date,
 salary smallint,
 branchno char(5),
 primary key(staffno)
);

insert into Staff values 
('SL21','John','White','Manager','M','1945-10-01',300000,'B005'),
('SG37','Ann','Beech','Assistant','F','1960-11-10','12000','B003'),
('SG14','David','Ford','Supervisor','M','1958-03-24',18000,'B003'),
('SA9','Mary','Howe','Assistant','F','1970-02-19',9000,'B007'),
('SG5','Susan','Brand','Manager','F','1940-06-03',24000,'B003'),
('SL41','Julie','Lee','Assistant','F','1965-06-13',9000,'B005'),
('SL7','Yuzhong','Yan','Supervisor','M','1978-1-01',300000,'B005'),
('SA7','Sunny','Jia','Manager','F','1980-01-1',20000,'B007');


drop table PropertyForRent;

create table PropertyForRent 
(propertyno char(5) not null, 
 street varchar(35), 
 city varchar(10),
 postcode varchar(10),
 type varchar(10),
 rooms smallint,
 rent int,
 ownerno char(5),
 staffno char(5),
 branchno char(5),
 primary key(propertyno)
);

insert into PropertyForRent values 
('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B007'), 
('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005'), 
('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat',3,350,'CO40','','B003'),
('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat',3,375,'CO93','SG37','B003'), 
('PG21','18 Dale Rd','Glasgow','G12','House',5,600,'CO87','SG37','B003'), 
('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450,'CO93','SG14','B003'),
('PA7','5606 Bissonnet','Aberdeen','AB7 5SU','House',3,700,'CO58','SA7','B007'), 
('PL7','5706 Indigo','London','NW2','Flat',4,700,'CO42','SL7','B005');



drop table Client;

create table Client
(clientno char(5) not null,
 fname varchar(10),
 lname varchar(10),
 telno char(15),
 preftype varchar(10),
 maxrent int,
 primary key(clientno)
);

insert into Client values 
('CR76','John','Kay','0171-774-5632','Flat',425),
('CR56','Aline','Steward','0141-848-1825','Flat',350),
('CR74','Mike','Ritchie','','House',750), 
('CR62','Mary','Tregear','01224-196720','Flat',600),
('CR29','Thomas','Yan','8325-122-3570','House',800), 
('CR04','JN','Shi','01234-456789','Flat',900);


drop table PrivateOwner;

create table PrivateOwner 
(ownerno char(5) not null,
 fname varchar(10),
 lname varchar(10),
 address varchar(50),
 telno char(15),
 primary key(ownerno)
);

insert into PrivateOwner values 
('CO46','Joe','Keogh','2 Fergus Dr. Aberdeen AB2 7SX','01224-861212'),
('CO87','Carol','Farrel','6 Achray St. Glasgow G32 9DX','0141-357-7419'),
('CO40','Tina','Murphy','63 Well St. Glasgow G42','0141-943-1728'),
('CO93','Tony','Shaw','12 Park Pl. Glasgow G4 0QR','0141-225-7025'),
('CO42','Lei','Huang','5700 Indigo','0123-456-7890'),
('CO58','Jean','Fang','5606 Bissonnet ST','9876-543-2100');


drop table Viewing;

create table Viewing
(clientno char(5) not null,
 propertyno char(5) not null,
 viewdate date,
 commnt varchar(15),
 primary key(clientno,propertyno)
);

insert into Viewing values
('CR56','PA14','1995-05-24','too small'),
('CR76','PG4','1995-04-20','too remote'),
('CR56','PG4','1995-05-26',''),
('CR62','PA14','1995-05-14','no dining room'),
('CR56','PG36','1995-04-28',''),
('CR29','PA7','1996-01-01','no fun'),
('CR04','PL7','1996-07-01','cost too much');

drop table Registration;

create table Registration
(clientNo char(5) not null,
branchNo char(5) not null,
staffNo char(5),
dateJoined date,
primary key(clientNo,branchNo)
);

insert into Registration values 
('CR76','B003','SG5','1980-06-01'),
('CR56','B003','SG14','1985-06-03'),
('CR74','B005','SL41','1992-06-03'), 
('CR62','B007','SA9','1989-06-04'),
('CR04','B005','SL7','1995-12-01'), 
('CR29','B007','SA7','1997-06-01');



B1. 
select * from (SELECT t1.branchno,city,postcode,street,count(*) as staffnumber FROM Branch as t1,Staff as t2 where t1.branchno=t2.branchno group by t1.branchno) A
inner join
(select s1.branchno,s1.position,s1.fname,s1.lname from Staff as s1 where s1.position='Manager') B on A.branchno=B.branchno;

SELECT Branch.branchno,street,city,postcode, count(*) as staffnumber, S2.position,S2.fname,S2.lname FROM Branch inner JOIN Staff as S1 ON Branch.branchno=S1.branchno inner JOIN Staff as S2 ON Branch.branchno=S2.branchno where S2.position = 'Manager' group by Branch.branchno;

select A.branchno,A.city,A.staffnumber,B.position,B.fname,B.lname from (SELECT t1.branchno,city,postcode,street,count(*) as staffnumber FROM Branch as t1 left outer join Staff as t2 on t1.branchno=t2.branchno group by t1.branchno) A
left outer join
(select s1.branchno,s1.position,s1.fname,s1.lname from Staff as s1 where s1.position='Manager') B on A.branchno=B.branchno;

B2.
select M1.staffNO,M1.fname,M1.lname, C1.clientNo,C1.fname,C1.lname, count(*) as viewTimes from (select S1.staffNO,S1.fname,S1.lname from Staff as S1 inner Join Branch as B1 on B1.branchno=S1.branchno where B1.city='Glasgow') M1 inner JOIN Registration as R1 on M1.staffNo=R1.staffNo inner Join Client as C1 on C1.clientNo=R1.clientNo inner JOIN Viewing as V1 on R1.clientNo=V1.clientNo  group by M1.staffNO;


B3. 
select P.city,PC.allNumber,P.type,P.typeNumber from 
    (select city,type,count(*) as typeNumber from PropertyForRent group by city,type) as P
    join
    (select city,count(*) as allNumber from PropertyForRent group by city) as PC on PC.city = P.city order by P.city

B4.

select M1.staffno,M1.fname,M1.lname,M1.position,P1.propertyno,M2.viewtimes,M2.viewdate from (select * from Staff as s1 where s1.position!='Manager') M1 inner Join PropertyForRent as P1 on P1.staffNo=M1.staffNo inner join (select propertyno, viewdate, count(*) as viewtimes from Viewing where viewdate<'1995-12-31' and viewdate>'1995-01-01' group by propertyno) M2 on P1.propertyno=M2.propertyno


B5.
select M1.propertyno, S1.fname,S1.lname, PO.fname,PO.lname from 
       (select * from PropertyForRent where propertyno not in (select propertyno from Viewing)) M1 
       inner join Staff as S1 on M1.staffNo = S1.staffNo
       inner join PrivateOwner as PO on M1.ownerno = PO.ownerno






