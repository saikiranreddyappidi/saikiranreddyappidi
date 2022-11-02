use university
SELECT * from student;
select * from free where reg=(select regno from student 
create table location(locationid int primary key,regionalgroup varchar(30) not null);
select * from location;
insert into location values(122,"new york");
insert into location values(123,"dallas");
insert into location values(124,"chicago");
insert into location values(125,"boston");
alter table location and primary key("locationid");
drop table department;
create table department(deptid int primary key);
alter table department add column(
			deptname varchar(30) not null,
            locationid int,
            foreign key(locationid) references location(locationid));
select * from department;
insert into department values(10,"accounting",122);	   
select * from job;
create table job(jobid int primary key,func varchar(45));
insert job values(667,"clerk");
create table employee(empid int primary key not null,
						l_name varchar(45),
                        F_name varchar(45),
                        m_name varchar(45),
                        jobid int not null,
                        managerid int not null,
                        hiredate date,
                        salary bigint(15),
                        comm int,
						deptid int not null,
                        foreign key(jobid) references job(jobid),
                        foreign key(deptid) references department(deptid)
                        );
                        select * from employee





