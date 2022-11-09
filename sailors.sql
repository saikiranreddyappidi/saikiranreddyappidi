SELECT * FROM university.employee;
USE UNIVERSITY;
ALTER TABLE EMPLOYEE RENAME COLUMN EMPID TO ID_O_EMP,RENAME COLUMN L_NAME TO NAME_O_EMP,RENAME COLUMN DEPTID TO ID_DEPT;
SELECT NAME_O_EMP,SALARY FROM EMPLOYEE;
SELECT * FROM EMPLOYEE WHERE NAME_O_EMP="SMITH";
SELECT * FROM EMPLOYEE WHERE SALARY>1000 AND SALARY<2000;
SELECT * FROM EMPLOYEE WHERE ID_DEPT=20 OR ID_DEPT=10;
SELECT * FROM EMPLOYEE WHERE NOT ID_DEPT=30 OR ID_DEPT=10;
SELECT * FROM EMPLOYEE WHERE NAME_O_EMP LIKE "S%";
SELECT * FROM EMPLOYEE WHERE NAME_O_EMP LIKE "S%" AND LENGTH(NAME_O_EMP)=4;
SELECT * FROM EMPLOYEE WHERE NAME_O_EMP LIKE "S%" AND LENGTH(NAME_O_EMP)=4;
SELECT * FROM EMPLOYEE WHERE ID_DEPT=10 AND SALARY>300;
SELECT * FROM EMPLOYEE WHERE  COMM IS null;

-- 11/9/2022

use university;
create table boats(bid int primary key,bname varchar(30),color varchar(30));
insert into boats values(101,"interlake","blue");
insert into boats values(102,"interlake","red");
insert into boats values(103,"Clipper","green");
insert into boats values(104,"Marine","red");

select * from boats;

create table sailors(sid int primary key,sname varchar(30),rating int,age float);
insert into sailors values(22,"Dustin",7,45.0);
insert into sailors values(29,"Brutus",1,33.0);
insert into sailors values(31,"Lubber",8,55.5);
insert into sailors values(32,"Andy",8,25.5);
insert into sailors values(58,"Rusty",10,35.0);
insert into sailors values(64,"Horatio",7,35.0);
insert into sailors values(71,"Zorab",10,16.0);
insert into sailors values(74,"Horatio",9,35.0);
insert into sailors values(85,"Art",3,25.5);
insert into sailors values(95,"Bob",3,63.5);

select * from sailors;

create table workdates(sid int,bid int,work_date date,foreign key(sid) references sailors(sid),foreign key(bid) references boats(bid));
insert into workdates values(22,101,"1998-10-10");
insert into workdates values(22,102,"1998-10-10");
insert into workdates values(22,103,"1998-10-8");
insert into workdates values(22,104,"1998-10-7");
insert into workdates values(31,102,"1998-10-11");
insert into workdates values(31,103,"1998-6-11");
insert into workdates values(31,104,"1998-12-11");
insert into workdates values(64,101,"1998-5-9");
insert into workdates values(64,102,"1998-8-9");
insert into workdates values(74,103,"1998-8-9");

select * from workdates;

select sname,age from sailors;-- 1
select * from sailors where rating>7;-- 2
select sid from workdates where bid=103;-- 3
select * from sailors group by sid=any(select sid from workdates where bid=103);-- 3
select sid from workdates where bid=any(select bid from boats where color="red");-- 4
select sname from sailors where sid=any(select sid from workdates where bid=any(select bid from boats where color="red"));-- 5
select color from boats where bid=any(select bid from workdates where sid=any(select sid from sailors where sname="Lubber"));-- 6
select distinct(sname) from sailors where sid=any(select sid from workdates);-- 7


use university;
SELECT * FROM student;
select * from fee where reg=(select regno from student where regno=(select reg from fee where reg="211FA04563"));
create table LOCATION(LOCATIONID INT primary key,REGIONALGROUP varchar(30) NOT NULL);
SELECT * FROM LOCATION;
insert into LOCATION VALUES(122,"NEW YORK");
insert into LOCATION VALUES(123,"DALLAS");
insert into LOCATION VALUES(124,"CHICAGO");
insert into LOCATION VALUES(125,"BOSTON");
ALTER TABLE LOCATION ADD PRIMARY KEY(LOCATIONID);
DROP table DEPARTMENT;
CREATE TABLE DEPARTMENT(DEPTID INT PRIMARY KEY,
			DEPTNAME VARCHAR(30) NOT NULL,
			LOCATIONID INT,
            FOREIGN KEY(LOCATIONID) references LOCATION(LOCATIONID));
INSERT INTO DEPARTMENT VALUES(10,"ACCOUNTING",122); 
INSERT INTO DEPARTMENT VALUES(20,"RESEARCH",124); 
INSERT INTO DEPARTMENT VALUES(30,"SALES",123);             
INSERT INTO DEPARTMENT VALUES(40,"OPERATIONS",125);  
SELECT * FROM DEPARTMENT;         
CREATE TABLE JOB(JOBID INT PRIMARY KEY,FUBCTION VARCHAR(45)) ;
INSERT INTO JOB VALUES(667,"CLERK");
INSERT INTO JOB VALUES(668,"STAFF");
INSERT INTO JOB VALUES(669,"ANALYST");
INSERT INTO JOB VALUES(670,"SALESPERSON");
INSERT INTO JOB VALUES(671,"MANAGER");
INSERT INTO JOB VALUES(672,"PRESIDENT");
SELECT * FROM JOB;
CREATE table EMPLOYEE(EMPID INT PRIMARY KEY NOT NULL,
						L_NAME VARCHAR(45),
                        F_NAME VARCHAR(45),
                        M_NAME VARCHAR(45),
                        JOBID INT NOT NULL,
                        MANAGERID INT NOT NULL,
                        HIREDATE date,
                        SALARY bigint(15),
                        COMM INT,
                        DEPTID INT NOT NULL,
                        foreign key(JOBID) references JOB(JOBID),
                        foreign key(DEPTID) references DEPARTMENT(DEPTID)
                        );
SELECT * FROM EMPLOYEE;                        
INSERT INTO EMPLOYEE VALUES(7369,"SMITH","JOHN","Q",667,7902,"1984-12-17",800,null,20);
INSERT INTO EMPLOYEE VALUES(7499,"ALLEN","KEVIN","J",670,7698,"1985-02-20",1600,300,30);
INSERT INTO EMPLOYEE VALUES(7505,"DOYLE","JEAN","K",671,7839,"1985-04-04",2830,null,30);
INSERT INTO EMPLOYEE VALUES(7506,"DENNIS","LYNN","S",671,7839,"1985-05-15",2750,null,30);
INSERT INTO EMPLOYEE VALUES(7507,"BAKER","LESLIE","D",671,7839,"1985-06-10",2200,null,40);
INSERT INTO EMPLOYEE VALUES(7521,"WARK","CYNTHIA","D",670,7698,"1985-02-22",1250,500,30);


SELECT * FROM university.employee;
USE UNIVERSITY;
ALTER TABLE EMPLOYEE RENAME COLUMN EMPID TO ID_O_EMP,RENAME COLUMN L_NAME TO NAME_O_EMP,RENAME COLUMN DEPTID TO ID_DEPT;
SELECT NAME_O_EMP,SALARY FROM EMPLOYEE;
SELECT NAME_O_EMP,SALARY*12 FROM EMPLOYEE;
SELECT * FROM EMPLOYEE WHERE NAME_O_EMP="SMITH";
SELECT * FROM EMPLOYEE WHERE SALARY>1000 AND SALARY<2000;
SELECT * FROM EMPLOYEE WHERE ID_DEPT=20 OR ID_DEPT=10;
SELECT * FROM EMPLOYEE WHERE NOT ID_DEPT=30 OR ID_DEPT=10;
SELECT * FROM EMPLOYEE WHERE NAME_O_EMP LIKE "S%";
SELECT * FROM EMPLOYEE WHERE NAME_O_EMP LIKE "S%" AND LENGTH(NAME_O_EMP)=4;
SELECT * FROM EMPLOYEE WHERE NAME_O_EMP LIKE "S%" AND LENGTH(NAME_O_EMP)=4;
SELECT * FROM EMPLOYEE WHERE ID_DEPT=10 AND SALARY>300;
SELECT * FROM EMPLOYEE WHERE  COMM IS null;
SELECT ID_O_EMP,NAME_O_EMP FROM EMPLOYEE ORDER BY ID_O_EMP;
SELECT ID_O_EMP,NAME_O_EMP FROM EMPLOYEE ORDER BY SALARY DESC;
SELECT * FROM EMPLOYEE ORDER BY ID_DEPT DESC,NAME_O_EMP ASC;
SELECT ID_DEPT,COUNT(ID_DEPT) FROM EMPLOYEE GROUP BY ID_DEPT;
SELECT ID_DEPT,max(SALARY),min(SALARY),avg(SALARY) FROM EMPLOYEE GROUP BY ID_DEPT;
SELECT JOBID,max(SALARY),min(SALARY),avg(SALARY) FROM EMPLOYEE GROUP BY JOBID;
SELECT COUNT(HIREDATE),HIREDATE FROM EMPLOYEE GROUP BY MONTH(HIREDATE) ORDER BY HIREDATE;
select month(HIREDATE) FROM EMPLOYEE;
SELECT COUNT(MONTH(HIREDATE)),YEAR(HIREDATE),HIREDATE FROM EMPLOYEE GROUP BY YEAR(HIREDATE) ORDER BY YEAR(HIREDATE),MONTH(HIREDATE);
SELECT ID_DEPT FROM EMPLOYEE WHERE count(ID_DEPT)>4;
SELECT ID_DEPT,COUNT(ID_DEPT)>4 FROM EMPLOYEE GROUP BY (ID_DEPT);
select COUNT(ID_O_EMP) FROM EMPLOYEE WHERE month(HIREDATE)=2 GROUP BY MONTH(HIREDATE);
select ID_O_EMP FROM EMPLOYEE WHERE month(HIREDATE)=1 OR month(HIREDATE)=9;







