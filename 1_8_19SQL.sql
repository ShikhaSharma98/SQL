CREATE DATABASE STD
USE STD
CREATE TABLE TBL_STUDENT
(
STU_ID INT IDENTITY(101,1) PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
DOB DATETIME NOT NULL,
PHONE_CUS CHAR(12),
EMAIL_CUS VARCHAR(70)
)

CREATE TABLE TBL_COURSE
( 
COURSE_ID INT IDENTITY(201,1) PRIMARY KEY,
NAME VARCHAR(10) NOT NULL
)


CREATE TABLE TBL_MAPPING
(
STU_ID INT REFERENCES TBL_STUDENT(STU_ID),
COURSE_ID INT REFERENCES TBL_COURSE(COURSE_ID)
)

INSERT INTO TBL_STUDENT VALUES
('Kallie Blackwood', '09/07/1975', '415-9170-276', 'kallie.blackwood@abc.com'), 
('Johnetta Abdallah', '08/08/1995', '919-6014-934', 'johnetta_abdallah@abc.com'), 
('Bobbye Rhym', '09/18/1972', '650-5905-578', 'brhym@abc.com'), 
('Micaela Rhymes', '08/05/1967', '925-1192-329', 'micaela_rhymes@abc.com'), 
('Tamar Hoogland', '12/14/1994', '740-1061-857', 'tamar@abc.com')

INSERT INTO TBL_COURSE VALUES
('EXCEL'), 
('VBA'), 
('TABLEAU'), 
('JAVA'), 
('PYTHON'), 
('SAS'), 
('SQL'), 
('R'), 
('DOT NET'), 
('PHP')
SELECT * FROM TBL_STUDENT
SELECT * FROM TBL_COURSE

INSERT INTO TBL_MAPPING VALUES
(101, 201), 
(101, 202), 
(101, 203), 
(102, 205), 
(102, 208), 
(105, 201), 
(105, 202), 
(105, 203), 
(105, 205), 
(105, 207), 
(105, 208)


SELECT * FROM TBL_STUDENT
         INNER JOIN
		 TBL_MAPPING ON TBL_STUDENT.STU_ID=TBL_MAPPING.STU_ID


SELECT * FROM TBL_STUDENT
         LEFT JOIN
		 TBL_MAPPING ON TBL_STUDENT.STU_ID=TBL_MAPPING.STU_ID


SELECT * FROM TBL_STUDENT
         RIGHT JOIN
		 TBL_MAPPING ON TBL_STUDENT.STU_ID=TBL_MAPPING.STU_ID



SELECT * FROM TBL_STUDENT
         FULL JOIN
		 TBL_MAPPING ON TBL_STUDENT.STU_ID=TBL_MAPPING.STU_ID

 

 SELECT T1.STU_ID [Student Id],T1.NAME [Student Name],T1.DOB[Date Of Birth],T1.PHONE_CUS[Phone Number],T1.EMAIL_CUS[Email Id],T2.COURSE_ID[Course Id],T3.NAME [Course Name] FROM TBL_STUDENT T1
        INNER JOIN
		TBL_MAPPING T2 ON T1.STU_ID=T2.STU_ID
		INNER JOIN
		TBL_COURSE T3 ON T2.COURSE_ID=T3.COURSE_ID


 SELECT  T1.STU_ID [Student Id],T1.NAME [Student Name],T1.DOB[Date Of Birth],T1.PHONE_CUS[Phone Number],T1.EMAIL_CUS[Email Id],COUNT(T3.NAME)[Count Of Courses]
 FROM TBL_STUDENT T1
 LEFT JOIN
		TBL_MAPPING T2 ON T1.S
		TU_ID=T2.STU_ID
		LEFT JOIN
		TBL_COURSE T3 ON T2.COURSE_ID=T3.COURSE_ID
 GROUP BY T1.NAME,T1.DOB,T1.STU_ID,T1.PHONE_CUS,T1.EMAIL_CUS

 SELECT  T1.STU_ID [Student Id],T1.NAME [Student Name],T1.DOB[Date Of Birth],T1.PHONE_CUS[Phone Number],T1.EMAIL_CUS[Email Id]
 FROM TBL_STUDENT T1
 LEFT JOIN
		TBL_MAPPING T2 ON T1.STU_ID=T2.STU_ID
		LEFT JOIN
		TBL_COURSE T3 ON T2.COURSE_ID=T3.COURSE_ID
 GROUP BY T1.NAME,T1.DOB,T1.STU_ID,T1.PHONE_CUS,T1.EMAIL_CUS
 HAVING COUNT(T3.NAME)=0


 SELECT T1.NAME[Course Name],COUNT(T2.COURSE_ID)[Count of Students]
 FROM TBL_COURSE T1
 LEFT JOIN
 TBL_MAPPING T2 ON T1.COURSE_ID=T2.COURSE_ID
 GROUP BY T1.NAME
 ORDER BY 2 DESC