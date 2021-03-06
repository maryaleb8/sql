use univ
set dateformat dmy



DROP TABLE OLYMP_STUDENT
DROP TABLE OLYMPIAD
DROP TABLE WORK
DROP TABLE STUDENT_SUBJECT
DROP TABLE STUDENT
DROP TABLE BASIS_LEARN
DROP TABLE SUBJECT_TEACH
DROP TABLE TEACHERS
DROP TABLE SCHOOL
DROP TABLE [LOCATION]
DROP TABLE [SUBJECT]
DROP TABLE DEPARTMENT



CREATE TABLE [SUBJECT] 
(
	subject_id int not null primary key identity(1, 1), 
	subject_name varchar(50) not null,
	sem_start int not null,
	sem_end int not null,
	department_id int
);

CREATE TABLE DEPARTMENT
(
	department_id int not null primary key identity(1, 1),
	department_name varchar(50)
);

CREATE TABLE [LOCATION]
(
	location_id int not null primary key identity(1, 1),
	country varchar(50) not null,
	town varchar(50) not null
);

CREATE TABLE SCHOOL
(
	school_id int not null primary key identity(1, 1),
	name_school varchar(50),
	location_id int,
	place_in_area int
);

CREATE TABLE TEACHERS
(
	teacher_id int not null primary key identity(1, 1),
	department_id int ,
	first_name varchar(50) not null,
	second_name varchar(50) null,
	birth_year int not null,
	location_id int ,
	degree varchar(50) null,
	year_work int not null
);

CREATE TABLE SUBJECT_TEACH 
(
	teacher_id int ,
	subject_id int 
);


CREATE TABLE BASIS_LEARN
(
	basis_id int not null primary key identity(1, 1),
	basis_name varchar(50) not null
);

CREATE TABLE STUDENT
(
	student_id int not null primary key identity(1, 1),
	first_name varchar(50) not null,
	second_name varchar(50) null,
	year_enter int not null,
	location_id int ,
	school_id int ,
	basis_id int 
);

CREATE TABLE STUDENT_SUBJECT
(
	student_id int ,
	subject_id int ,
	mark int null
);

CREATE TABLE WORK
(
	salary int null,
	student_id int ,
	year_work int
);

CREATE TABLE OLYMPIAD
(
	olympiad_id int not null primary key identity(1, 1),
	olympiad_name varchar(50) not null
);

CREATE TABLE OLYMP_STUDENT
(
	student_id int ,
	olympiad_id int ,
	place int 
);

ALTER TABLE [subject] ADD
	FOREIGN KEY (department_id) 
	REFERENCES department (department_id)
ALTER TABLE teachers ADD 
	FOREIGN KEY (department_id) 
	REFERENCES department (department_id)

ALTER TABLE teachers ADD 
	FOREIGN KEY (location_id) 
	REFERENCES [location] (location_id)

ALTER TABLE subject_teach ADD 
	FOREIGN KEY (teacher_id) 
	REFERENCES teachers (teacher_id)

ALTER TABLE subject_teach ADD 
	FOREIGN KEY (subject_id) 
	REFERENCES [subject] (subject_id)

ALTER TABLE school ADD 
	FOREIGN KEY (location_id) 
	REFERENCES [location] (location_id)

ALTER TABLE student_subject ADD 
	FOREIGN KEY (student_id) 
	REFERENCES student (student_id)

ALTER TABLE student_subject ADD 
	FOREIGN KEY (subject_id) 
	REFERENCES [subject] (subject_id)

ALTER TABLE student ADD 
	FOREIGN KEY (location_id) 
	REFERENCES [location] (location_id),
	FOREIGN KEY (school_id) 
	REFERENCES school (school_id),
	FOREIGN KEY (basis_id) 
	REFERENCES [basis_learn] (basis_id)

ALTER TABLE work ADD 
	FOREIGN KEY (student_id) 
	REFERENCES [student] (student_id)

ALTER TABLE olymp_student ADD 
	FOREIGN KEY (student_id) 
	REFERENCES [student] (student_id),
	FOREIGN KEY (olympiad_id) 
	REFERENCES [olympiad] (olympiad_id)






INSERT INTO [department] VALUES ('??????? ??????????');
INSERT INTO [department] VALUES ('??????? ??????');
INSERT INTO [department] VALUES ('??????? ?????');
INSERT INTO [department] VALUES ('??????? ????????');
INSERT INTO [department] VALUES ('??????? ???????????');
INSERT INTO [department] VALUES ('??????? ?????????? ????????');
INSERT INTO [department] VALUES ('??????? ??????????? ?????');

INSERT INTO [subject] VALUES ('?????????', 1, 8, 1);
INSERT INTO [subject] VALUES ('??????', 1, 4, 1);
INSERT INTO [subject] VALUES ('?????????????', 3, 5, 1);
INSERT INTO [subject] VALUES ('?????', 3, 7, 1);
INSERT INTO [subject] VALUES ('?????????', 6, 8, 1);
INSERT INTO [subject] VALUES ('???????', 1, 6, 1);
INSERT INTO [subject] VALUES ('????? ??????', 1, 8, 2);
INSERT INTO [subject] VALUES ('?????????? ?????????', 1, 4, 2);
INSERT INTO [subject] VALUES ('????????? ??????', 4, 6, 2);
INSERT INTO [subject] VALUES ('?????????? ????', 6, 8, 2);
INSERT INTO [subject] VALUES ('???????????? ?????', 3, 5, 3);
INSERT INTO [subject] VALUES ('?????????????? ?????', 3, 7, 3);
INSERT INTO [subject] VALUES ('????????', 1, 4, 4);
INSERT INTO [subject] VALUES ('???????', 1, 6, 4);
INSERT INTO [subject] VALUES ('????????', 3, 6, 4);
INSERT INTO [subject] VALUES ('????????????? ?????', 5, 8, 4);
INSERT INTO [subject] VALUES ('????????', 5, 8, 4);
INSERT INTO [subject] VALUES ('????????', 1, 4, 4);
INSERT INTO [subject] VALUES ('???????? ?', 1, 6, 5);
INSERT INTO [subject] VALUES ('???????? phyton', 1, 3, 5);
INSERT INTO [subject] VALUES ('????? ?????????', 3, 6, 5);
INSERT INTO [subject] VALUES ('?????', 1, 8, 6);
INSERT INTO [subject] VALUES ('?????????? ??????????', 1, 4, 7);
INSERT INTO [subject] VALUES ('?????????? ????', 5, 8, 7);


INSERT INTO [location] VALUES (		'??????'		,		'????'		)	;
INSERT INTO [location] VALUES (		'??????'		,		'??????'		)	;
INSERT INTO [location] VALUES (		'??????'		,		'????????????'		)	;
INSERT INTO [location] VALUES (		'??????'		,		'???????'		)	;
 INSERT INTO [location] VALUES (		'??????'		,		'??????'		)	;
INSERT INTO [location] VALUES (		'??????'		,		'?????????'		)	;
INSERT INTO [location] VALUES (		'??????'		,		'?????-?????????'		)	;
INSERT INTO [location] VALUES (		'??????'		,		'????'		)	;
INSERT INTO [location] VALUES (		'??????'		,		'????????????'		)	;
 INSERT INTO [location] VALUES (		'??????'		,		'??????'		)	;
INSERT INTO [location] VALUES (		'??????'		,		'?????????'		)	;
INSERT INTO [location] VALUES (		'??????'		,		'???????????'		)	;
INSERT INTO [location] VALUES (		'????????'		,		'?????'		)	;
INSERT INTO [location] VALUES (		'????????'		,		'?????'		)	;
 INSERT INTO [location] VALUES (		'????????'		,		'??????'		)	;
INSERT INTO [location] VALUES (		'?????'		,		'???????'		)	;
INSERT INTO [location] VALUES (		'?????????'		,		'??????'		)	;
INSERT INTO [location] VALUES (		'????????'		,		'????-?????'		)	;
INSERT INTO [location] VALUES (		'??????'		,		'???????'		)	;
 INSERT INTO [location] VALUES (		'??????'		,		'??????'		)	;



 INSERT INTO [school] VALUES ('	1329	 ',	4	,	1	);
INSERT INTO [school] VALUES ('	45	 ',	18	,	null	);
INSERT INTO [school] VALUES ('	98	 ',	12	,	3	);
INSERT INTO [school] VALUES ('	456	 ',	15	,	null	);
INSERT INTO [school] VALUES ('	1907	 ',	15	,	2	);
INSERT INTO [school] VALUES ('	2007	 ',	7	,	1	);
INSERT INTO [school] VALUES ('	239	 ',	13	,	null	);
INSERT INTO [school] VALUES ('	2	 ',	5	,	1	);
INSERT INTO [school] VALUES ('	1	 ',	11	,	3	);
INSERT INTO [school] VALUES ('	68	 ',	14	,	null	);




INSERT INTO TEACHERS VALUES (	1	,	'????'	,	'??????'	,	1993	,	3	,	'???????? ????'	,	8	)	;
INSERT INTO TEACHERS VALUES (	4	,	'????	',	'???????	',	1950	,	7	,	'?????? ????'	,	25	)	;
INSERT INTO TEACHERS VALUES (	1	,	'?????	',	'????????	',	1964	,	2	,null		,	29	)	;
INSERT INTO TEACHERS VALUES (	1	,	'??????'	,	'?????'	,	1968	,	8	,	'???????? ????'	,	6	)	;
INSERT INTO TEACHERS VALUES (	4	,	'?????'	,	'??????	',	1941	,	11	,	'?????? ????'	,	22	)	;
INSERT INTO TEACHERS VALUES (	4	,	'?????'	,	'???????'	,	1944	,	15	,	null	,	47	)	;
INSERT INTO TEACHERS VALUES (	6	,	'?????'	,	'?????????'	,	1951	,	20	,	null	,	26	)	;
INSERT INTO TEACHERS VALUES (	6	,	'???????'	,'	????????'	,	1967	,	7	,	'???????? ????'	,	22	)	;
INSERT INTO TEACHERS VALUES (	3	,	'?????????'	,'	????????'	,	1953	,	14	,	null	,	29	)	;
INSERT INTO TEACHERS VALUES (	3	,	'?????'	,	'???????'	,	1973	,	19	,	null	,	28	)	;
INSERT INTO TEACHERS VALUES (	4	,	'??????'	,'	???????'	,	1986	,	19	,	null	,	3	)	;
INSERT INTO TEACHERS VALUES (	5	,	'??????????'	,'	????????'	,	1990	,	15	,	'?????? ????'	,	5	)	;
INSERT INTO TEACHERS VALUES (	1	,	'???????'	,	'????????'	,	1965	,	2	,	null	,	4	)	;
INSERT INTO TEACHERS VALUES (	4	,	'???????'	,	'????????'	,	1984	,	2	,	null	,	7	)	;
INSERT INTO TEACHERS VALUES (	6	,	'????'	,	'????????'	,	1985	,	2	,	'???????? ????'	,	16	)	;
INSERT INTO TEACHERS VALUES (	4	,	'????????'	,'	???????????'	,	1985	,	10	,	null	,	13	)	;
INSERT INTO TEACHERS VALUES (	7	,	'?????'	,	'?????????'	,	1969	,	20	,	'?????? ????'	,	5	)	;
INSERT INTO TEACHERS VALUES (	1	,	'???????'	,	'???????'	,	1947	,	9	,	null	,	5	)	;
INSERT INTO TEACHERS VALUES (	2	,	'??????'	,	'??????'	,	1965	,	15	,	'???????? ????'	,	18	)	;
INSERT INTO TEACHERS VALUES (	1	,	'????'	,	'?????	',	1966	,	6	,	null	,	14	)	;
INSERT INTO TEACHERS VALUES (	5	,	'??????'	,	'????????'	,	1957	,	11	,	null	,	14	)	;
INSERT INTO TEACHERS VALUES (	6	,	'????????'	,	'?????	',	1946	,	7	,	null	,	2	)	;
INSERT INTO TEACHERS VALUES (	1	,	'?????????'	,	'?????????	',	1941	,	18	,	'?????? ????'	,	52	)	;
INSERT INTO TEACHERS VALUES (	5	,	'???????'	,	'?????????	',	1993	,	18	,	null	,	5	)	;
INSERT INTO TEACHERS VALUES (	4	,	'????????'	,	'?????????'	,	1970	,	2	,	null	,	24	)	;
INSERT INTO TEACHERS VALUES (	1	,	'????'	,	'????????	',	1995	,	12	,	'?????? ????'	,	2	)	;
INSERT INTO TEACHERS VALUES (	1	,	'?????????'	,'	????????'	,	1978	,	1	,	null	,	4	)	;
INSERT INTO TEACHERS VALUES (	5	,	'???????'	,'	????????'	,	1969	,	2	,	'?????? ????'	,	14	)	;
INSERT INTO TEACHERS VALUES (	1	,	'??????	',	'?????????	',	1975	,	14	,	null	,	23	)	;
INSERT INTO TEACHERS VALUES (	7	,	'???????	',	'????????	',	1944	,	5	,	null	,	23	)	;
INSERT INTO TEACHERS VALUES (	2	,	'???????	',	'?????????'	,	1950	,	19	,	'???????? ????'	,	46	)	;
INSERT INTO TEACHERS VALUES (	4	,	'??????????'	,	'???????'	,	1967	,	5	,	null	,	4	)	;
INSERT INTO TEACHERS VALUES (	3	,	'?????????'	,	'?????	',	1957	,	20	,	null	,	25	)	;
INSERT INTO TEACHERS VALUES (	3	,	'?????	',	'?????????'	,	1941	,	18	,	'???????? ????'	,	14	)	;
INSERT INTO TEACHERS VALUES (	5	,	'??????'	,	'????????'	,	1964	,	9	,	null	,	14	)	;
INSERT INTO TEACHERS VALUES (	2	,	'???????'	,	'??????'	,	1961	,	7	,	null	,	20	)	;



INSERT INTO subject_teach VALUES (	33	,	13	)	;
INSERT INTO subject_teach VALUES (	22	,	15	)	;
INSERT INTO subject_teach VALUES (	31	,	5	)	;
INSERT INTO subject_teach VALUES (	22	,	3	)	;
INSERT INTO subject_teach VALUES (	9	,	18	)	;
INSERT INTO subject_teach VALUES (	29	,	18	)	;
INSERT INTO subject_teach VALUES (	10	,	23	)	;
INSERT INTO subject_teach VALUES (	22	,	5	)	;
INSERT INTO subject_teach VALUES (	14	,	19	)	;
INSERT INTO subject_teach VALUES (	11	,	4	)	;
INSERT INTO subject_teach VALUES (	19	,	11	)	;
INSERT INTO subject_teach VALUES (	32	,	14	)	;
INSERT INTO subject_teach VALUES (	28	,	12	)	;
INSERT INTO subject_teach VALUES (	29	,	21	)	;
INSERT INTO subject_teach VALUES (	24	,	3	)	;
INSERT INTO subject_teach VALUES (	31	,	10	)	;
INSERT INTO subject_teach VALUES (	8	,	24	)	;
INSERT INTO subject_teach VALUES (	34	,	1	)	;
INSERT INTO subject_teach VALUES (	8	,	19	)	;
INSERT INTO subject_teach VALUES (	15	,	4	)	;
INSERT INTO subject_teach VALUES (	25	,	13	)	;
INSERT INTO subject_teach VALUES (	6	,	14	)	;
INSERT INTO subject_teach VALUES (	31	,	12	)	;
INSERT INTO subject_teach VALUES (	27	,	7	)	;
INSERT INTO subject_teach VALUES (	36	,	7	)	;
INSERT INTO subject_teach VALUES (	4	,	1	)	;
INSERT INTO subject_teach VALUES (	14	,	22	)	;
INSERT INTO subject_teach VALUES (	12	,	1	)	;
INSERT INTO subject_teach VALUES (	35	,	8	)	;
INSERT INTO subject_teach VALUES (	8	,	23	)	;
INSERT INTO subject_teach VALUES (	18	,	22	)	;
INSERT INTO subject_teach VALUES (	28	,	5	)	;
INSERT INTO subject_teach VALUES (	15	,	12	)	;
INSERT INTO subject_teach VALUES (	7	,	1	)	;

									
	INSERT INTO BASIS_LEARN VALUES ( 'BUDJET');
INSERT INTO BASIS_LEARN VALUES ( 'PAID');
INSERT INTO BASIS_LEARN VALUES ( 'GRANT');
INSERT INTO BASIS_LEARN VALUES ( 'TARGET');

INSERT INTO [student] VALUES ('	????????	  ','	???????????	 ',	1989	,	2	,	5	,	4	);
INSERT INTO [student] VALUES ('	?????	  ','	????????	 ',	1971	,	7	,	10	,	4	);
INSERT INTO [student] VALUES ('	?????	  ','	?????????	 ',	1981	,	18	,	1	,	2	);
INSERT INTO [student] VALUES ('	????????	  ','	??????	 ',	1986	,	8	,	4	,	2	);
INSERT INTO [student] VALUES ('	??????	  ','	???????	 ',	2003	,	7	,	7	,	2	);
INSERT INTO [student] VALUES ('	???????	  ','	????????	 ',	1957	,	1	,	7	,	1	);
INSERT INTO [student] VALUES ('	????????	  ','	???????????	 ',	1959	,	17	,	10	,	2	);
INSERT INTO [student] VALUES ('	??????	  ','	????????	 ',	2005	,	9	,	2	,	3	);
INSERT INTO [student] VALUES ('	?????	  ','	???????	 ',	1993	,	13	,	10	,	2	);
INSERT INTO [student] VALUES ('	?????	  ','	?????????	 ',	2012	,	5	,	6	,	3	);
INSERT INTO [student] VALUES ('	????	  ','	???????	 ',	1992	,	9	,	5	,	3	);
INSERT INTO [student] VALUES ('	????????	  ','	??????	 ',	1996	,	20	,	8	,	2	);
INSERT INTO [student] VALUES ('	????	  ','	??????	 ',	1950	,	16	,	9	,	4	);
INSERT INTO [student] VALUES ('	??????????	  ','	???????	 ',	2010	,	15	,	10	,	4	);
INSERT INTO [student] VALUES ('	?????	  ','	?????	 ',	2017	,	1	,	7	,	2	);
INSERT INTO [student] VALUES ('	?????????	  ','	??????	 ',	1988	,	17	,	5	,	4	);
INSERT INTO [student] VALUES ('	???????	  ','	???????	 ',	1988	,	9	,	6	,	2	);
INSERT INTO [student] VALUES ('	??????	  ','	??????	 ',	2002	,	15	,	9	,	3	);
INSERT INTO [student] VALUES ('	????????	  ','	?????????	 ',	2001	,	11	,	1	,	3	);
INSERT INTO [student] VALUES ('	???????	  ','	?????	 ',	1961	,	5	,	3	,	3	);
INSERT INTO [student] VALUES ('	??????	  ','	??????	 ',	1968	,	7	,	9	,	1	);
INSERT INTO [student] VALUES ('	???????	  ','	????????	 ',	1976	,	7	,	6	,	4	);
INSERT INTO [student] VALUES ('	?????	  ','	?????????	 ',	1994	,	13	,	3	,	2	);
INSERT INTO [student] VALUES ('	???????	  ','	??????	 ',	2015	,	9	,	3	,	2	);
INSERT INTO [student] VALUES ('	?????	  ','	??????	 ',	2018	,	13	,	6	,	4	);
INSERT INTO [student] VALUES ('	???????	  ','	?????	 ',	1951	,	16	,	2	,	4	);
INSERT INTO [student] VALUES ('	????	  ','	??????	 ',	1974	,	16	,	10	,	3	);
INSERT INTO [student] VALUES ('	??????	  ','	????????	 ',	1988	,	7	,	3	,	4	);
INSERT INTO [student] VALUES ('	???????	  ','	??????	 ',	1995	,	12	,	1	,	3	);
INSERT INTO [student] VALUES ('	???	  ','	????????	 ',	2010	,	12	,	10	,	1	);
INSERT INTO [student] VALUES ('	??????	  ','	???????	 ',	2009	,	8	,	2	,	4	);
INSERT INTO [student] VALUES ('	??????	  ','	?????	 ',	1995	,	20	,	9	,	4	);
INSERT INTO [student] VALUES ('	????????	  ','	?????????	 ',	2008	,	3	,	4	,	1	);
INSERT INTO [student] VALUES ('	?????	  ','	??????	 ',	2004	,	20	,	2	,	2	);
INSERT INTO [student] VALUES ('	???????	  ','	?????	 ',	1954	,	6	,	8	,	3	);
INSERT INTO [student] VALUES ('	???????	  ','	??????????	 ',	1987	,	17	,	8	,	2	);
INSERT INTO [student] VALUES ('	???????	  ','	????????	 ',	1988	,	15	,	7	,	4	);
INSERT INTO [student] VALUES ('	????	  ','	???????	 ',	1999	,	9	,	5	,	4	);
INSERT INTO [student] VALUES ('	?????	  ','	????	 ',	1991	,	15	,	2	,	1	);
INSERT INTO [student] VALUES ('	????????	  ','	??????	 ',	1980	,	9	,	4	,	3	);
INSERT INTO [student] VALUES ('	???????	  ','	???????????	 ',	2016	,	2	,	9	,	1	);
INSERT INTO [student] VALUES ('	??????	  ','	???????	 ',	1984	,	20	,	1	,	4	);
INSERT INTO [student] VALUES ('	???????	  ','	??????	 ',	1968	,	18	,	4	,	4	);
INSERT INTO [student] VALUES ('	??????????	  ','	?????????	 ',	2007	,	12	,	4	,	3	);
INSERT INTO [student] VALUES ('	??????	  ','	??????	 ',	1960	,	6	,	10	,	4	);
INSERT INTO [student] VALUES ('	???	  ','	????????	 ',	2015	,	19	,	3	,	4	);
INSERT INTO [student] VALUES ('	?????	  ','	??????	 ',	1977	,	9	,	7	,	1	);
INSERT INTO [student] VALUES ('	???????	  ','	????????	 ',	1964	,	12	,	4	,	2	);
INSERT INTO [student] VALUES ('	????	  ','	???????	 ',	1978	,	6	,	1	,	4	);
INSERT INTO [student] VALUES ('	????????	  ','	???????????	 ',	1965	,	1	,	8	,	4	);


INSERT INTO [student_subject] VALUES (	25	,	5	,	9	);
INSERT INTO [student_subject] VALUES (	19	,	8	,	9	);
INSERT INTO [student_subject] VALUES (	5	,	15	,	5	);
INSERT INTO [student_subject] VALUES (	20	,	24	,	1	);
INSERT INTO [student_subject] VALUES (	2	,	5	,	4	);
INSERT INTO [student_subject] VALUES (	22	,	9	,	7	);
INSERT INTO [student_subject] VALUES (	31	,	21	,	8	);
INSERT INTO [student_subject] VALUES (	45	,	22	,	6	);
INSERT INTO [student_subject] VALUES (	30	,	10	,	9	);
INSERT INTO [student_subject] VALUES (	42	,	7	,	5	);
INSERT INTO [student_subject] VALUES (	42	,	7	,	8	);
INSERT INTO [student_subject] VALUES (	34	,	24	,	3	);
INSERT INTO [student_subject] VALUES (	28	,	7	,	7	);
INSERT INTO [student_subject] VALUES (	39	,	24	,	7	);
INSERT INTO [student_subject] VALUES (	39	,	23	,	5	);
INSERT INTO [student_subject] VALUES (	9	,	8	,	5	);
INSERT INTO [student_subject] VALUES (	7	,	19	,	9	);
INSERT INTO [student_subject] VALUES (	39	,	13	,	3	);
INSERT INTO [student_subject] VALUES (	7	,	10	,	4	);
INSERT INTO [student_subject] VALUES (	7	,	11	,	9	);
INSERT INTO [student_subject] VALUES (	15	,	6	,	6	);
INSERT INTO [student_subject] VALUES (	26	,	21	,	3	);
INSERT INTO [student_subject] VALUES (	21	,	9	,	6	);
INSERT INTO [student_subject] VALUES (	29	,	4	,	9	);
INSERT INTO [student_subject] VALUES (	22	,	23	,	9	);
INSERT INTO [student_subject] VALUES (	47	,	20	,	4	);
INSERT INTO [student_subject] VALUES (	35	,	7	,	5	);
INSERT INTO [student_subject] VALUES (	12	,	11	,	7	);
INSERT INTO [student_subject] VALUES (	10	,	15	,	2	);
INSERT INTO [student_subject] VALUES (	47	,	5	,	6	);
INSERT INTO [student_subject] VALUES (	44	,	24	,	5	);
INSERT INTO [student_subject] VALUES (	40	,	5	,	7	);
INSERT INTO [student_subject] VALUES (	1	,	19	,	1	);
INSERT INTO [student_subject] VALUES (	14	,	17	,	4	);
INSERT INTO [student_subject] VALUES (	5	,	23	,	7	);
INSERT INTO [student_subject] VALUES (	31	,	12	,	4	);
INSERT INTO [student_subject] VALUES (	22	,	8	,	10	);
INSERT INTO [student_subject] VALUES (	18	,	7	,	9	);
INSERT INTO [student_subject] VALUES (	34	,	21	,	6	);
INSERT INTO [student_subject] VALUES (	23	,	10	,	7	);
INSERT INTO [student_subject] VALUES (	19	,	7	,	10	);
INSERT INTO [student_subject] VALUES (	28	,	1	,	2	);
INSERT INTO [student_subject] VALUES (	40	,	23	,	1	);
INSERT INTO [student_subject] VALUES (	44	,	17	,	9	);
INSERT INTO [student_subject] VALUES (	19	,	4	,	10	);
INSERT INTO [student_subject] VALUES (	18	,	13	,	3	);
INSERT INTO [student_subject] VALUES (	22	,	8	,	7	);
INSERT INTO [student_subject] VALUES (	4	,	1	,	6	);
INSERT INTO [student_subject] VALUES (	47	,	12	,	1	);
INSERT INTO [student_subject] VALUES (	42	,	14	,	5	);
INSERT INTO [student_subject] VALUES (	23	,	22	,	9	);
INSERT INTO [student_subject] VALUES (	18	,	15	,	5	);
INSERT INTO [student_subject] VALUES (	10	,	2	,	8	);
INSERT INTO [student_subject] VALUES (	26	,	21	,	3	);
INSERT INTO [student_subject] VALUES (	45	,	1	,	8	);
INSERT INTO [student_subject] VALUES (	30	,	5	,	5	);
INSERT INTO [student_subject] VALUES (	50	,	12	,	5	);
INSERT INTO [student_subject] VALUES (	46	,	14	,	5	);
INSERT INTO [student_subject] VALUES (	30	,	17	,	9	);
INSERT INTO [student_subject] VALUES (	15	,	17	,	10	);
INSERT INTO [student_subject] VALUES (	40	,	19	,	6	);
INSERT INTO [student_subject] VALUES (	29	,	17	,	7	);
INSERT INTO [student_subject] VALUES (	36	,	15	,	7	);
INSERT INTO [student_subject] VALUES (	14	,	24	,	4	);
INSERT INTO [student_subject] VALUES (	18	,	6	,	2	);
INSERT INTO [student_subject] VALUES (	37	,	17	,	4	);
INSERT INTO [student_subject] VALUES (	3	,	8	,	1	);
INSERT INTO [student_subject] VALUES (	19	,	9	,	1	);
INSERT INTO [student_subject] VALUES (	9	,	2	,	6	);
INSERT INTO [student_subject] VALUES (	11	,	20	,	9	);
INSERT INTO [student_subject] VALUES (	17	,	6	,	4	);
INSERT INTO [student_subject] VALUES (	21	,	4	,	1	);
INSERT INTO [student_subject] VALUES (	22	,	21	,	8	);
INSERT INTO [student_subject] VALUES (	8	,	16	,	3	);
INSERT INTO [student_subject] VALUES (	50	,	17	,	6	);
INSERT INTO [student_subject] VALUES (	33	,	8	,	2	);
INSERT INTO [student_subject] VALUES (	13	,	14	,	2	);
INSERT INTO [student_subject] VALUES (	48	,	3	,	2	);
INSERT INTO [student_subject] VALUES (	42	,	17	,	9	);
INSERT INTO [student_subject] VALUES (	18	,	19	,	2	);
INSERT INTO [student_subject] VALUES (	29	,	6	,	8	);
INSERT INTO [student_subject] VALUES (	31	,	5	,	4	);
INSERT INTO [student_subject] VALUES (	32	,	6	,	2	);
INSERT INTO [student_subject] VALUES (	29	,	24	,	2	);
INSERT INTO [student_subject] VALUES (	43	,	17	,	2	);
INSERT INTO [student_subject] VALUES (	3	,	10	,	10	);
INSERT INTO [student_subject] VALUES (	23	,	5	,	2	);
INSERT INTO [student_subject] VALUES (	48	,	23	,	2	);
INSERT INTO [student_subject] VALUES (	42	,	3	,	5	);
INSERT INTO [student_subject] VALUES (	29	,	14	,	7	);
INSERT INTO [student_subject] VALUES (	40	,	23	,	5	);
INSERT INTO [student_subject] VALUES (	31	,	24	,	9	);
INSERT INTO [student_subject] VALUES (	44	,	16	,	4	);
INSERT INTO [student_subject] VALUES (	4	,	23	,	10	);
INSERT INTO [student_subject] VALUES (	38	,	2	,	4	);
INSERT INTO [student_subject] VALUES (	21	,	16	,	4	);
INSERT INTO [student_subject] VALUES (	23	,	11	,	8	);
INSERT INTO [student_subject] VALUES (	33	,	5	,	8	);
INSERT INTO [student_subject] VALUES (	43	,	21	,	8	);
INSERT INTO [student_subject] VALUES (	3	,	10	,	8	);


INSERT INTO [WORK] VALUES (	2761	,	49	,	1	);
INSERT INTO [WORK] VALUES (	2169	,	14	,	1	);
INSERT INTO [WORK] VALUES (	380	,	50	,	6	);
INSERT INTO [WORK] VALUES (	4142	,	35	,	10	);
INSERT INTO [WORK] VALUES (	920	,	23	,	3	);
INSERT INTO [WORK] VALUES (	4847	,	11	,	8	);
INSERT INTO [WORK] VALUES (	2562	,	10	,	9	);
INSERT INTO [WORK] VALUES (	4323	,	15	,	10	);
INSERT INTO [WORK] VALUES (	4863	,	45	,	10	);
INSERT INTO [WORK] VALUES (	1958	,	40	,	5	);
INSERT INTO [WORK] VALUES (	2323	,	46	,	7	);
INSERT INTO [WORK] VALUES (	617	,	40	,	0	);
INSERT INTO [WORK] VALUES (	4549	,	22	,	5	);
INSERT INTO [WORK] VALUES (	3636	,	39	,	3	);
INSERT INTO [WORK] VALUES (	2031	,	29	,	9	);
INSERT INTO [WORK] VALUES (	4173	,	10	,	0	);
INSERT INTO [WORK] VALUES (	1243	,	28	,	9	);
INSERT INTO [WORK] VALUES (	4182	,	39	,	5	);
INSERT INTO [WORK] VALUES (	2956	,	21	,	7	);
INSERT INTO [WORK] VALUES (	1415	,	24	,	6	);
INSERT INTO [WORK] VALUES (	3225	,	41	,	0	);
INSERT INTO [WORK] VALUES (	3065	,	24	,	7	);
INSERT INTO [WORK] VALUES (	3887	,	46	,	10	);
INSERT INTO [WORK] VALUES (	1845	,	20	,	10	);
INSERT INTO [WORK] VALUES (	428	,	22	,	10	);
INSERT INTO [WORK] VALUES (	1286	,	21	,	3	);
INSERT INTO [WORK] VALUES (	3169	,	43	,	7	);
INSERT INTO [WORK] VALUES (	1112	,	46	,	1	);
INSERT INTO [WORK] VALUES (	4294	,	13	,	1	);
INSERT INTO [WORK] VALUES (	1111	,	18	,	8	);
INSERT INTO [WORK] VALUES (	686	,	4	,	6	);
INSERT INTO [WORK] VALUES (	4225	,	17	,	2	);
INSERT INTO [WORK] VALUES (	2693	,	4	,	0	);
INSERT INTO [WORK] VALUES (	4759	,	44	,	7	);
INSERT INTO [WORK] VALUES (	4702	,	10	,	0	);
INSERT INTO [WORK] VALUES (	4033	,	38	,	2	);
INSERT INTO [WORK] VALUES (	1194	,	1	,	10	);
INSERT INTO [WORK] VALUES (	4257	,	1	,	8	);
INSERT INTO [WORK] VALUES (	3313	,	25	,	1	);
INSERT INTO [WORK] VALUES (	4167	,	18	,	7	);
INSERT INTO [WORK] VALUES (	438	,	38	,	10	);
INSERT INTO [WORK] VALUES (	3449	,	25	,	7	);
INSERT INTO [WORK] VALUES (	223	,	15	,	9	);
INSERT INTO [WORK] VALUES (	825	,	12	,	0	);
INSERT INTO [WORK] VALUES (	1497	,	41	,	4	);
INSERT INTO [WORK] VALUES (	572	,	20	,	0	);
INSERT INTO [WORK] VALUES (	4375	,	1	,	5	);
INSERT INTO [WORK] VALUES (	1246	,	43	,	10	);
INSERT INTO [WORK] VALUES (	918	,	31	,	5	);
INSERT INTO [WORK] VALUES (	311	,	17	,	2	);
INSERT INTO [WORK] VALUES (	1019	,	7	,	4	);
INSERT INTO [WORK] VALUES (	2984	,	25	,	4	);
INSERT INTO [WORK] VALUES (	1360	,	34	,	3	);
INSERT INTO [WORK] VALUES (	621	,	3	,	3	);
INSERT INTO [WORK] VALUES (	1103	,	50	,	7	);
INSERT INTO [WORK] VALUES (	1906	,	47	,	10	);
INSERT INTO [WORK] VALUES (	2814	,	43	,	4	);
INSERT INTO [WORK] VALUES (	4388	,	5	,	5	);
INSERT INTO [WORK] VALUES (	3555	,	4	,	3	);
INSERT INTO [WORK] VALUES (	1866	,	25	,	1	);
INSERT INTO [WORK] VALUES (	3121	,	13	,	6	);
INSERT INTO [WORK] VALUES (	469	,	40	,	5	);
INSERT INTO [WORK] VALUES (	209	,	10	,	3	);
INSERT INTO [WORK] VALUES (	2006	,	24	,	5	);
INSERT INTO [WORK] VALUES (	2187	,	26	,	2	);
INSERT INTO [WORK] VALUES (	1066	,	44	,	7	);
INSERT INTO [WORK] VALUES (	652	,	22	,	6	);
INSERT INTO [WORK] VALUES (	4356	,	50	,	1	);
INSERT INTO [WORK] VALUES (	829	,	3	,	2	);
INSERT INTO [WORK] VALUES (	3331	,	1	,	0	);
INSERT INTO [WORK] VALUES (	2527	,	32	,	8	);
INSERT INTO [WORK] VALUES (	2428	,	45	,	5	);
INSERT INTO [WORK] VALUES (	1167	,	26	,	9	);
INSERT INTO [WORK] VALUES (	2632	,	8	,	9	);
INSERT INTO [WORK] VALUES (	2688	,	3	,	6	);


INSERT INTO olympiad VALUES ('	?????? ???	 ');
INSERT INTO olympiad VALUES ('	?????????? ??????????	 ');
INSERT INTO olympiad VALUES ('	?????? ??????????	 ');
INSERT INTO olympiad VALUES ('	??????	 ');
INSERT INTO olympiad VALUES ('	??????	 ');
INSERT INTO olympiad VALUES ('	?????? ??????????	 ');
INSERT INTO olympiad VALUES ('	?????????? ???	 ');
INSERT INTO olympiad VALUES ('	?????? ??????	 ');
INSERT INTO olympiad VALUES ('	????????? ??????	 ');
INSERT INTO olympiad VALUES ('	??????? ??????	 ');
INSERT INTO olympiad VALUES ('	?????? ???????	 ');
INSERT INTO olympiad VALUES ('	???	 ');
INSERT INTO olympiad VALUES ('	??? ?? ??????	 ');
INSERT INTO olympiad VALUES ('	??????	 ');
INSERT INTO olympiad VALUES ('	????????? ???	 ');

INSERT INTO olymp_student VALUES (	4	,	4	,	1	);
INSERT INTO olymp_student VALUES (	12	,	9	,	2	);
INSERT INTO olymp_student VALUES (	45	,	10	,	null	);
INSERT INTO olymp_student VALUES (	45	,	13	,	3	);
INSERT INTO olymp_student VALUES (	44	,	1	,	3	);
INSERT INTO olymp_student VALUES (	25	,	13	,	2	);
INSERT INTO olymp_student VALUES (	18	,	9	,	null	);
INSERT INTO olymp_student VALUES (	15	,	7	,	1	);
INSERT INTO olymp_student VALUES (	19	,	1	,	2	);
INSERT INTO olymp_student VALUES (	5	,	13	,	3	);
INSERT INTO olymp_student VALUES (	6	,	13	,	null	);
INSERT INTO olymp_student VALUES (	2	,	3	,	3	);
INSERT INTO olymp_student VALUES (	41	,	1	,	2	);
INSERT INTO olymp_student VALUES (	32	,	14	,	2	);
INSERT INTO olymp_student VALUES (	47	,	2	,	2	);
INSERT INTO olymp_student VALUES (	41	,	2	,	null	);
INSERT INTO olymp_student VALUES (	22	,	3	,	3	);
INSERT INTO olymp_student VALUES (	20	,	12	,	3	);
INSERT INTO olymp_student VALUES (	43	,	11	,	null	);
INSERT INTO olymp_student VALUES (	44	,	14	,	3	);
INSERT INTO olymp_student VALUES (	21	,	9	,	3	);
INSERT INTO olymp_student VALUES (	4	,	9	,	3	);
INSERT INTO olymp_student VALUES (	28	,	5	,	1	);
INSERT INTO olymp_student VALUES (	13	,	11	,	2	);
INSERT INTO olymp_student VALUES (	2	,	6	,	2	);
INSERT INTO olymp_student VALUES (	49	,	10	,	null	);
INSERT INTO olymp_student VALUES (	49	,	4	,	1	);
INSERT INTO olymp_student VALUES (	24	,	10	,	2	);
INSERT INTO olymp_student VALUES (	5	,	3	,	2	);
INSERT INTO olymp_student VALUES (	25	,	10	,	3	);
INSERT INTO olymp_student VALUES (	3	,	1	,	3	);
INSERT INTO olymp_student VALUES (	2	,	8	,	3	);
INSERT INTO olymp_student VALUES (	23	,	2	,	1	);
INSERT INTO olymp_student VALUES (	15	,	9	,	null	);
INSERT INTO olymp_student VALUES (	11	,	2	,	2	);
INSERT INTO olymp_student VALUES (	21	,	15	,	2	);
INSERT INTO olymp_student VALUES (	3	,	13	,	3	);
INSERT INTO olymp_student VALUES (	37	,	5	,	3	);
INSERT INTO olymp_student VALUES (	39	,	5	,	3	);
INSERT INTO olymp_student VALUES (	7	,	14	,	3	);
INSERT INTO olymp_student VALUES (	4	,	4	,	null	);
INSERT INTO olymp_student VALUES (	18	,	3	,	1	);
INSERT INTO olymp_student VALUES (	24	,	11	,	2	);
INSERT INTO olymp_student VALUES (	22	,	5	,	null	);
INSERT INTO olymp_student VALUES (	7	,	15	,	2	);
INSERT INTO olymp_student VALUES (	7	,	10	,	2	);
INSERT INTO olymp_student VALUES (	36	,	11	,	3	);
INSERT INTO olymp_student VALUES (	24	,	6	,	3	);
INSERT INTO olymp_student VALUES (	4	,	12	,	3	);
INSERT INTO olymp_student VALUES (	18	,	12	,	null	);
INSERT INTO olymp_student VALUES (	1	,	15	,	2	);
INSERT INTO olymp_student VALUES (	10	,	1	,	2	);
INSERT INTO olymp_student VALUES (	22	,	12	,	2	);
INSERT INTO olymp_student VALUES (	34	,	12	,	1	);
INSERT INTO olymp_student VALUES (	40	,	2	,	null	);
INSERT INTO olymp_student VALUES (	25	,	7	,	3	);
INSERT INTO olymp_student VALUES (	29	,	5	,	3	);
INSERT INTO olymp_student VALUES (	28	,	13	,	null	);
INSERT INTO olymp_student VALUES (	9	,	11	,	2	);
INSERT INTO olymp_student VALUES (	34	,	2	,	2	);
INSERT INTO olymp_student VALUES (	29	,	7	,	2	);
INSERT INTO olymp_student VALUES (	17	,	12	,	3	);
INSERT INTO olymp_student VALUES (	44	,	5	,	3	);
INSERT INTO olymp_student VALUES (	3	,	5	,	3	);
INSERT INTO olymp_student VALUES (	27	,	7	,	null	);
INSERT INTO olymp_student VALUES (	2	,	6	,	3	);
INSERT INTO olymp_student VALUES (	46	,	12	,	3	);
INSERT INTO olymp_student VALUES (	37	,	13	,	1	);
INSERT INTO olymp_student VALUES (	9	,	12	,	2	);
INSERT INTO olymp_student VALUES (	38	,	2	,	2	);
INSERT INTO olymp_student VALUES (	26	,	9	,	3	);
INSERT INTO olymp_student VALUES (	35	,	2	,	null	);
INSERT INTO olymp_student VALUES (	22	,	9	,	3	);
INSERT INTO olymp_student VALUES (	42	,	2	,	3	);
INSERT INTO olymp_student VALUES (	26	,	13	,	2	);
INSERT INTO olymp_student VALUES (	7	,	14	,	null	);
INSERT INTO olymp_student VALUES (	32	,	3	,	1	);
INSERT INTO olymp_student VALUES (	48	,	6	,	1	);
INSERT INTO olymp_student VALUES (	40	,	1	,	null	);
INSERT INTO olymp_student VALUES (	21	,	12	,	3	);
INSERT INTO olymp_student VALUES (	28	,	15	,	3	);
INSERT INTO olymp_student VALUES (	9	,	4	,	null	);
INSERT INTO olymp_student VALUES (	31	,	7	,	3	);
INSERT INTO olymp_student VALUES (	34	,	7	,	2	);
INSERT INTO olymp_student VALUES (	49	,	12	,	null	);
INSERT INTO olymp_student VALUES (	36	,	1	,	2	);
INSERT INTO olymp_student VALUES (	10	,	10	,	3	);
INSERT INTO olymp_student VALUES (	21	,	3	,	3	);
INSERT INTO olymp_student VALUES (	7	,	5	,	2	);
INSERT INTO olymp_student VALUES (	30	,	11	,	2	);
INSERT INTO olymp_student VALUES (	16	,	10	,	null	);
INSERT INTO olymp_student VALUES (	12	,	3	,	3	);
INSERT INTO olymp_student VALUES (	50	,	4	,	2	);
INSERT INTO olymp_student VALUES (	13	,	14	,	2	);
INSERT INTO olymp_student VALUES (	18	,	10	,	1	);
INSERT INTO olymp_student VALUES (	3	,	4	,	2	);
INSERT INTO olymp_student VALUES (	20	,	10	,	3	);
INSERT INTO olymp_student VALUES (	8	,	4	,	null	);
INSERT INTO olymp_student VALUES (	3	,	8	,	3	);
INSERT INTO olymp_student VALUES (	38	,	6	,	3	);
