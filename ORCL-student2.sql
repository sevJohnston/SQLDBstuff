Drop table resort_type cascade constraints;
drop table resort cascade constraints;
drop table accomodations cascade constraints;


CREATE TABLE RESORT_TYPE(
RESORT_TYPE_CODE  VARCHAR2(3) PRIMARY KEY,
RESORT_TYPE       VARCHAR2(25) NOT NULL);

Create table resort(
RESORT_ID         VARCHAR2(3) PRIMARY KEY,
RESORT_NAME       VARCHAR2(50) NOT NULL,
FK_RESORT_TYPE_CODE  VARCHAR2(3) NOT NULL);


CREATE TABLE ACCOMODATIONS(
ACCOM_ID          VARCHAR2(20) PRIMARY KEY,
ACCOM_DESC        VARCHAR2(125) NOT NULL,
FK_RESORT_ID         VARCHAR2(3) NOT NULL,
COST_PER_NIGHT    NUMBER (5,2));

ALTER TABLE RESORT
ADD CONSTRAINT FK_RESORT_TYPE
FOREIGN KEY(FK_RESORT_TYPE_CODE)
REFERENCES RESORT_TYPE(RESORT_TYPE_CODE);

ALTER TABLE ACCOMODATIONS
ADD CONSTRAINT FK_RESORT
FOREIGN KEY(FK_RESORT_ID)
REFERENCES RESORT(RESORT_ID);


INSERT INTO RESORT_TYPE VALUES ('F', 'Foodie');
INSERT INTO RESORT_TYPE VALUES ('S', 'Spa');
INSERT INTO RESORT_TYPE VALUES ('E', 'Ecological');
INSERT INTO RESORT_TYPE VALUES ('G', 'Golf');


insert into resort values ('G1', 'Golfing by the Sea', 'G');
insert into resort values ('S1', 'Atlantis Spa', 'S');
insert into resort values ('E1', 'Amazing Oregon', 'E');
insert into resort values ('L1', 'Gentle Waves Spa', 'S');

INSERT INTO ACCOMODATIONS VALUES ('Bunk 1', 'Cabin on far North Beach', 'G1', 324);
INSERT INTO ACCOMODATIONS VALUES ('Bunk 2', 'Cabin at Middle Beach', 'G1', 324);
INSERT INTO ACCOMODATIONS VALUES ('Bunk 3', 'Cabin at South Beach', 'G1', 425);
INSERT INTO ACCOMODATIONS VALUES ('Chamber 1', 'Room First Floor', 'E1', 250);
INSERT INTO ACCOMODATIONS VALUES ('Chamber 2', 'Room Second Floor', 'E1', 250);
INSERT INTO ACCOMODATIONS VALUES ('Chamber 3', 'Room Third Floor', 'E1', 300);
INSERT INTO ACCOMODATIONS VALUES ('Chamber 4', 'Room Fourth Floor, Ocean View', 'E1', 350);
INSERT INTO ACCOMODATIONS VALUES ('Room 10', 'Room First Floor, Spa Side', 'S1', 200);
INSERT INTO ACCOMODATIONS VALUES ('Room 15', 'Room First Floor, Family Area', 'S1', NULL);
INSERT INTO ACCOMODATIONS VALUES ('Suite 1', 'Suite First Floor, Ocean View', 'L1', 450);
INSERT INTO ACCOMODATIONS VALUES ('Suite 2', 'Suite Second Floor, Ocean View', 'L1', NULL);
INSERT INTO ACCOMODATIONS VALUES ('Suite 3', 'Suite Third Floor, Ocean View', 'L1', 400);

select * from accomodations;

select count (accom_id)
from accomodations;

select min(cost_per_night)
from accomodations;

select resort_type.resort_type_code, resort_type.resort_type,
count(resort.resort_id) as nr_resorts
from resort_type
join resort on resort_type.resort_type_code = resort.fk_resort_type_code
group by resort_type.resort_type_code, resort_type.resort_type
order by nr_resorts desc;

select resort_type.resort_type_code, resort_type.resort_type,
count(accomodations.accom_id) as nr_accomodations
from resort_type
join resort on resort_type.RESORT_TYPE_CODE = resort.FK_RESORT_TYPE_CODE
join accomodations on accomodations.FK_RESORT_ID = resort.RESORT_ID
group by resort_type.RESORT_TYPE_CODE, resort_type.RESORT_TYPE
having count(accomodations.ACCOM_ID) < 4;

Drop table DINOSAUR cascade constraints;
drop table WHERE_FOUND cascade constraints;
drop table ARCHEOLOGIST cascade constraints;
drop table DISCOVERY cascade constraints;

CREATE TABLE DINOSAUR(
DINOSAUR_ID     VARCHAR2(3) PRIMARY KEY,
DINO_NAME       VARCHAR2(25) NOT NULL,
DIET_TYPE       VARCHAR2(20) NOT NULL,
DINO_COST       NUMBER(8,2));

CREATE TABLE WHERE_FOUND(
LOCATION_ID     VARCHAR2(3) PRIMARY KEY,
LOCATION_NAME   VARCHAR2(30) NOT NULL,
STATE_NAME      VARCHAR2(20) NOT NULL);

CREATE TABLE ARCHEOLOGIST(
ARCHEOLOGIST_ID VARCHAR2(3) PRIMARY KEY,
FIRST_NAME      VARCHAR2(20) NOT NULL,
LAST_NAME       VARCHAR2(20) NOT NULL);

CREATE TABLE DISCOVERY(
DISCOVERY_ID        VARCHAR2(3) PRIMARY KEY,
DISCOVERY_DATE      DATE,
FK_DINOSAUR_ID      VARCHAR2(3),
FK_ARCHEOLOGIST_ID  VARCHAR2(3),
FK_LOCATION_ID      VARCHAR2(3));

ALTER TABLE DISCOVERY
ADD CONSTRAINT FK_DINOSAUR
FOREIGN KEY(FK_DINOSAUR_ID)
REFERENCES DINOSAUR(DINOSAUR_ID);

ALTER TABLE DISCOVERY
ADD CONSTRAINT FK_ARCHEOLOGIST
FOREIGN KEY(FK_ARCHEOLOGIST_ID)
REFERENCES ARCHEOLOGIST(ARCHEOLOGIST_ID);

ALTER TABLE DISCOVERY
ADD CONSTRAINT FK_WHERE_FOUND
FOREIGN KEY(FK_LOCATION_ID)
REFERENCES WHERE_FOUND(LOCATION_ID);

INSERT INTO DINOSAUR VALUES('001', 'Tyrannosaurus Rex', 'Carnivore', 100000);
INSERT INTO DINOSAUR VALUES('002', 'Allosaurus', 'Carnivore', 500000);
INSERT INTO DINOSAUR VALUES('031', 'Diplodocus', 'Herbivore', 250000);
INSERT INTO DINOSAUR VALUES('055', 'Triceratops', 'Herbivore', NULL);
INSERT INTO DINOSAUR VALUES('009', 'Nodosaur', 'Herbivore', 500000);
INSERT INTO DINOSAUR VALUES('011', 'Spinosaurus', 'Carnivore', 750000);

INSERT INTO WHERE_FOUND VALUES('SD4','Black Hills', 'South Dakota');
INSERT INTO WHERE_FOUND VALUES('CA9','Los Angeles', 'California');
INSERT INTO WHERE_FOUND VALUES('AZ5','Grand Canyon', 'Arizona');
INSERT INTO WHERE_FOUND VALUES('FL4','Tampa', 'Florida');
INSERT INTO WHERE_FOUND VALUES('NY1','Rome', 'New York');
INSERT INTO WHERE_FOUND VALUES('CN7','Calgary', 'Canada');
INSERT INTO WHERE_FOUND VALUES('WI3','Milwaukee', 'Wisconsin');

INSERT INTO ARCHEOLOGIST VALUES('090', 'Ernest', 'Hemingway');
INSERT INTO ARCHEOLOGIST VALUES('101', 'Ayn', 'Rand');
INSERT INTO ARCHEOLOGIST VALUES('003', 'Greta', 'Garbo');
INSERT INTO ARCHEOLOGIST VALUES('083', 'Fred', 'Astaire');
INSERT INTO ARCHEOLOGIST VALUES('200', 'Ginger', 'Rogers');

INSERT INTO DISCOVERY VALUES('021', '12-Dec-2010', '001', '090', 'SD4');
INSERT INTO DISCOVERY VALUES('055', '15-Dec-2011', '001', '090', 'AZ5');
INSERT INTO DISCOVERY VALUES('062', '18-Jul-2012', '031', '083', 'SD4');
INSERT INTO DISCOVERY VALUES('009', '15-Jun-2009', '055', '083', 'NY1');
INSERT INTO DISCOVERY VALUES('061', '10-May-2011', '055', '090', 'CN7');
INSERT INTO DISCOVERY VALUES('099', '20-Aug-2012', '002', '200', 'WI3');
INSERT INTO DISCOVERY VALUES('096', '10-May-2012', '009', '090', 'CN7');
INSERT INTO DISCOVERY VALUES('037', '25-Jul-2010', '001', '101', 'FL4');
INSERT INTO DISCOVERY VALUES('678', '01-Aug-2016', '009', '200', 'CA9');

select discovery.discovery_ID, dinosaur.dino_name, archeologist.last_name, where_found.location_name
from discovery join dinosaur
on discovery.FK_DINOSAUR_ID = dinosaur.DINOSAUR_ID
join archeologist on discovery.FK_ARCHEOLOGIST_ID = archeologist.ARCHEOLOGIST_ID
join WHERE_FOUND on discovery.FK_LOCATION_ID = WHERE_FOUND.LOCATION_ID
order by (discovery_ID);

select count(discovery_ID)
from discovery;

select min(dino_cost)
from dinosaur;

select max(dino_cost)
from dinosaur;

select archeologist.first_name, archeologist.last_name, 
count(discovery.discovery_id) as nr_discoveries
from discovery
join archeologist on discovery.FK_ARCHEOLOGIST_ID = archeologist.ARCHEOLOGIST_ID
group by archeologist.first_name, archeologist.LAST_NAME;

select archeologist.first_name, archeologist.last_name 
from discovery
join archeologist on discovery.FK_ARCHEOLOGIST_ID = archeologist.ARCHEOLOGIST_ID
group by archeologist.first_name, archeologist.LAST_NAME
having count(discovery.discovery_ID) > 2;

select archeologist.first_name, archeologist.last_name,
count(where_Found.location_ID)as nr_locations
from discovery
join archeologist on discovery.FK_ARCHEOLOGIST_ID = archeologist.ARCHEOLOGIST_ID
join dinosaur on discovery.FK_DINOSAUR_ID = dinosaur.DINOSAUR_ID
join where_found on discovery.FK_LOCATION_ID = where_found.LOCATION_ID
group by archeologist.first_name, archeologist.last_name
having discovery.FK_DINOSAUR_ID = '001';

select archeologist.first_Name, archeologist.Last_Name, 
count(discovery.fk_location_ID) as nr_locations
from archeologist
left outer join discovery on discovery.FK_ARCHEOLOGIST_ID = archeologist.ARCHEOLOGIST_ID
and discovery.FK_DINOSAUR_ID = '001'
left outer join dinosaur on discovery.FK_DINOSAUR_ID = dinosaur.DINOSAUR_ID
group by archeologist.FIRST_NAME, archeologist.Last_Name;

select count(discovery_date)
from discovery
where discovery_date > TO_DATE('31-Dec-2011', 'dd-mm-yyyy') and discovery_date < to_Date('01-Jan-2013', 'dd-mm-yyyy');

commit;