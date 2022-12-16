create database pharmacy;
use pharmacy;
create table patients(ssn int not null,patient_name varchar(45),address varchar(45),age int,primary key (ssn));
create table doctors(ssn int not null,doctor_name varchar(45),speciality varchar(45),experience int,primary key(ssn));
create table drugs(drug_name varchar(45) not null,formula varchar(100),primary key(drug_name));
create table pharmaceutical_company(pharmacy_name varchar(45) not null,phno varchar(20),name_drug_solds varchar(45),
primary key(pharmacy_name),
foreign key(name_drug_solds) references drugs(drug_name));
create table prescription(patient_ssn int not null,doctor_ssn int not null,drug_name varchar(45)not null,amount int not null,prescpt_date datetime,
foreign key(patient_ssn) references patients(ssn),
foreign key(doctor_ssn) references doctors(ssn),
foreign key(drug_name) references drugs(drug_name));
INSERT INTO PATIENTS
VALUES("1914","MAYA","BAPATLA",19);
INSERT INTO PATIENTS 
VALUES("1915","MADAN","TENALI",25);
INSERT INTO PATIENTS 
VALUES("1916","RAYAN","GUNTUR",32);
INSERT INTO PATIENTS 
VALUES("1917","LATIKA","ONGOLE",23);
INSERT INTO PATIENTS 
VALUES("1918","MANOJ","NELLORE",30);
SELECT * FROM PATIENTS;
INSERT INTO doctors
VALUES("1814","john","Cardialogy",11);
INSERT INTO doctors
VALUES("1815","trump","ENT",25);
INSERT INTO doctors 
VALUES("1816","joe","Nephronology",32);
INSERT INTO doctors 
VALUES("1817","rishi","Neurology",3);
INSERT INTO doctors 
VALUES("1818","kiran","Phsycology",30);
select * from doctors;
insert into drugs values("dolo","c6h12o6");
insert into drugs values("metasene","c5h2o6");
insert into drugs values("zentaca","O11H22");
insert into drugs values("Arsenic","Os32");
insert into drugs values("Helium","He23");
select * from drugs;
insert into pharmaceutical_company values("Hetro Drugs","12346546","dolo");
insert into pharmaceutical_company values("Dr.Reddys Labs","12346464","metasene");
insert into pharmaceutical_company values("Mankind","98789546","zentaca");
insert into pharmaceutical_company values("Lifestar","123479987","Arsenic");
select * from pharmaceutical_company;
insert into prescription(patient_ssn,doctor_ssn,drug_name,amount) values("1914","1814","dolo",45);
insert into prescription(patient_ssn,doctor_ssn,drug_name,amount) values("1915","1816","zentaca",15);
insert into prescription(patient_ssn,doctor_ssn,drug_name,amount) values("1916","1815","metasene",25);
select * from prescription;

-- queries
select * from doctors where ssn=any(select doctor_ssn from prescription where patient_ssn="1914");
select * from pharmaceutical_company;
select count(ssn) from patients;
select count(ssn) from doctors;
select speciality from doctors;
select count(drug_name) from prescription;
select * from doctors where ssn="1814";
select * from patients where ssn="1914";
select * from doctors where experience=(select max(experience) from doctors);
