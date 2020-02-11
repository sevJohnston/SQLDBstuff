CREATE TABLE DORM_ROOM
(DORM_ROOM_ID       NUMBER  PRIMARY KEY,
BUILDING_NAME       VARCHAR2(50)  NOT NULL,
COST                NUMBER(7,2) NOT NULL)

CREATE TABLE TERM
(TERM_ID            NUMBER PRIMARY KEY,
TERM_DESC           VARCHAR2(150) NOT NULL,
TERM_BEGIN_DATE     DATE  NOT NULL,
TERM_END_DATE       DATE  NOT NULL)


CREATE TABLE PETS
(PET_NAME           VARCHAR2(5) NOT NULL)
INSERT INTO PETS (PET_NAME) VALUES('SPARKY');