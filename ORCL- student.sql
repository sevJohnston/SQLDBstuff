Create table BOOK
(Title              varchar2(30),
Author_first_name   varchar2(50),
Author_last_name    varchar2(50),
ISBN_number         varchar2(13),
Date_published      date);

Insert into BOOK (Title, Author_first_name, Author_last_name, ISBN_number, Date_published)
Values ('To Kill a Mockingbird', 'Lee', 'Harper', '1234567891012', CAST('11-JUL-1960' AS DATE));

Select * from BOOK;

Update Book set ISBN_number='1234654354890';

Delete from BOOK;

Drop table BOOK;

drop table owner cascade constraints;
drop table pet cascade constraints;

create table PET
(PET_ID		NUMBER	PRIMARY KEY,
FK_OWNER_ID	NUMBER	not null,
PET_TYPE	varchar2(3)  not null,
PET_NAME	varchar2(25)  not null,
PET_COLOR	varchar2(10)  not null,
PET_AGE		number		not null);



create table OWNER
(OWNER_ID	number  PRIMARY KEY,
owner_first_name	varchar2(25)	not null,
owner_last_name		varchar2(25)	not null);


insert into pet values
(1234,3456,'Dog','Ruggles','Brown',8);
insert into pet values
(2345,5678,'Cat','Wayne','Black',5);
insert into pet values
(7890,3456,'D','Addie','Black',4);
insert into pet values
(6789,5678,'Cat','Rosie','White',7);
insert into owner values
(3456,'Pamela','Farr');
insert into owner values
(5678,'James','Joyce');

drop table pet

alter table PET
add constraint fk_owner_id
foreign key (fk_owner_id)
references owner (owner_id);

delete from pet
where pet_age >= 7;

delete from owner 
where pet_color = 'White';

select* from pet;

update pet
set PET_NAME = 'George'
where PET_NAME = 'Ruggles';

update pet
set PET_NAME = 'Rudolph' AND PET_AGE = 2
where ONWER_NAME = 'Pamela Farr';

update pet
set PET_NAME = 'RUGGLES';


delete from pet
where pet_color = 'Black' OR pet_age = 7;

delete from pet
where PET_NAME = 'Ruggles';

CREATE TABLE PATIENT
(patientNumber DECIMAL(12) PRIMARY KEY,
patientLastName VARCHAR2(50),
patientFirstName VARCHAR2(50),
patientBirthdate DATE);

CREATE TABLE MedicalTest
(medicalTestID DECIMAL(12) PRIMARY KEY,
testName VARCHAR2(50) NOT NULL,
patientTestDate DATE,
patientNumber DECIMAL(12));

ALTER TABLE MEDICALTEST 
ADD CONSTRAINT fk_patient 
FOREIGN KEY (patientNumber) 
REFERENCES Patient (patientNumber); 

DROP TABLE MEDICALTEST CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;

INSERT INTO PATIENT (patientNumber, patientLastName,
patientFirstName, patientBirthdate)
VALUES (1, 'Doe','John', TO_DATE('01-JAN-73'));

INSERT INTO PATIENT (patientNumber, patientLastName,
patientFirstName, patientBirthdate)
VALUES (2, 'Smith','Harry', TO_DATE('16-MAY-69'));

INSERT INTO PATIENT (patientNumber, patientLastName,
patientFirstName, patientBirthdate)
VALUES (3, 'Lawrence','Joseph', TO_DATE('21-JUN-84'));

INSERT INTO MedicalTest(medicalTestID, testName,
patientTestDate, patientNumber)
VALUES(1,'Magnetic Resonance Imaging',TO_DATE('08-APR-2014'),2);

INSERT INTO MedicalTest(medicalTestID, testName,
patientTestDate)
VALUES(2,'Electrocardiogram', TO_DATE('20-NOV-2012'));

INSERT INTO MedicalTest(medicalTestID, testName,
patientTestDate, patientNumber)
VALUES(3,'Electrocardiogram',TO_DATE('09-OCT-2013'),2);

SELECT * FROM PATIENT;
SELECT* FROM MEDICALTEST;

SELECT PATIENT.PATIENTFIRSTNAME, PATIENT.PATIENTLASTNAME, MEDICALTEST.TESTNAME
from PATIENT
join MEDICALTEST
on PATIENT.PATIENTNUMBER = MEDICALTEST.PATIENTNUMBER;
