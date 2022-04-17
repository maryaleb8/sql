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






INSERT INTO [department] VALUES ('кафедра математики');
INSERT INTO [department] VALUES ('кафедра физики');
INSERT INTO [department] VALUES ('кафедра химии');
INSERT INTO [department] VALUES ('кафедра биологии');
INSERT INTO [department] VALUES ('кафедра информатика');
INSERT INTO [department] VALUES ('кафедра физической культуры');
INSERT INTO [department] VALUES ('кафедра английского языка');

INSERT INTO [subject] VALUES ('матанализ', 1, 8, 1);
INSERT INTO [subject] VALUES ('аналит', 1, 4, 1);
INSERT INTO [subject] VALUES ('комбинаторика', 3, 5, 1);
INSERT INTO [subject] VALUES ('графы', 3, 7, 1);
INSERT INTO [subject] VALUES ('геометрия', 6, 8, 1);
INSERT INTO [subject] VALUES ('алгебра', 1, 6, 1);
INSERT INTO [subject] VALUES ('общая физика', 1, 8, 2);
INSERT INTO [subject] VALUES ('физический практикум', 1, 4, 2);
INSERT INTO [subject] VALUES ('квантовая физика', 4, 6, 2);
INSERT INTO [subject] VALUES ('инженерное дело', 6, 8, 2);
INSERT INTO [subject] VALUES ('органическая химия', 3, 5, 3);
INSERT INTO [subject] VALUES ('неорганическая химия', 3, 7, 3);
INSERT INTO [subject] VALUES ('ботаника', 1, 4, 4);
INSERT INTO [subject] VALUES ('биопрак', 1, 6, 4);
INSERT INTO [subject] VALUES ('анатомия', 3, 6, 4);
INSERT INTO [subject] VALUES ('биологическая химия', 5, 8, 4);
INSERT INTO [subject] VALUES ('селекция', 5, 8, 4);
INSERT INTO [subject] VALUES ('зоология', 1, 4, 4);
INSERT INTO [subject] VALUES ('практика с', 1, 6, 5);
INSERT INTO [subject] VALUES ('практика phyton', 1, 3, 5);
INSERT INTO [subject] VALUES ('общие алгоритмы', 3, 6, 5);
INSERT INTO [subject] VALUES ('физра', 1, 8, 6);
INSERT INTO [subject] VALUES ('английский начинающий', 1, 4, 7);
INSERT INTO [subject] VALUES ('английский спец', 5, 8, 7);


INSERT INTO [location] VALUES (		'РОССИЯ'		,		'ОРЕЛ'		)	;
INSERT INTO [location] VALUES (		'РОССИЯ'		,		'МОСКВА'		)	;
INSERT INTO [location] VALUES (		'РОССИЯ'		,		'ЕКАТЕРИНБУРГ'		)	;
INSERT INTO [location] VALUES (		'РОССИЯ'		,		'ИВАНОВО'		)	;
 INSERT INTO [location] VALUES (		'РОССИЯ'		,		'КАЗАНЬ'		)	;
INSERT INTO [location] VALUES (		'РОССИЯ'		,		'ХАБАРОВСК'		)	;
INSERT INTO [location] VALUES (		'РОССИЯ'		,		'САНКТ-ПЕТЕРБУРГ'		)	;
INSERT INTO [location] VALUES (		'РОССИЯ'		,		'КЛИН'		)	;
INSERT INTO [location] VALUES (		'РОССИЯ'		,		'ДОЛГОПРУДНЫЙ'		)	;
 INSERT INTO [location] VALUES (		'РОССИЯ'		,		'КАЗАНЬ'		)	;
INSERT INTO [location] VALUES (		'РОССИЯ'		,		'ЧЕБОКСАРЫ'		)	;
INSERT INTO [location] VALUES (		'РОССИЯ'		,		'НОВОСИБИРСК'		)	;
INSERT INTO [location] VALUES (		'БЕЛАРУСЬ'		,		'МИНСК'		)	;
INSERT INTO [location] VALUES (		'БЕЛАРУСЬ'		,		'БРЕСТ'		)	;
 INSERT INTO [location] VALUES (		'БЕЛАРУСЬ'		,		'ГОМЕЛЬ'		)	;
INSERT INTO [location] VALUES (		'ЛИТВА'		,		'ВИЛЬНЮС'		)	;
INSERT INTO [location] VALUES (		'КАЗАХСТАН'		,		'АСТАНА'		)	;
INSERT INTO [location] VALUES (		'МОНГОЛИЯ'		,		'УЛАН-БАТОР'		)	;
INSERT INTO [location] VALUES (		'РОССИЯ'		,		'САРАТОВ'		)	;
 INSERT INTO [location] VALUES (		'РОССИЯ'		,		'САМАРА'		)	;



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




INSERT INTO TEACHERS VALUES (	1	,	'Иван'	,	'Иванов'	,	1993	,	3	,	'кандидат наук'	,	8	)	;
INSERT INTO TEACHERS VALUES (	4	,	'Петр	',	'Смирнов	',	1950	,	7	,	'доктор наук'	,	25	)	;
INSERT INTO TEACHERS VALUES (	1	,	'Игорь	',	'Кузнецов	',	1964	,	2	,null		,	29	)	;
INSERT INTO TEACHERS VALUES (	1	,	'Никита'	,	'Попов'	,	1968	,	8	,	'кандидат наук'	,	6	)	;
INSERT INTO TEACHERS VALUES (	4	,	'Алекс'	,	'Петров	',	1941	,	11	,	'доктор наук'	,	22	)	;
INSERT INTO TEACHERS VALUES (	4	,	'Тимур'	,	'Соколов'	,	1944	,	15	,	null	,	47	)	;
INSERT INTO TEACHERS VALUES (	6	,	'Мария'	,	'Михайлова'	,	1951	,	20	,	null	,	26	)	;
INSERT INTO TEACHERS VALUES (	6	,	'Наталья'	,'	Новикова'	,	1967	,	7	,	'кандидат наук'	,	22	)	;
INSERT INTO TEACHERS VALUES (	3	,	'Екатерина'	,'	Федорова'	,	1953	,	14	,	null	,	29	)	;
INSERT INTO TEACHERS VALUES (	3	,	'Артур'	,	'Морозов'	,	1973	,	19	,	null	,	28	)	;
INSERT INTO TEACHERS VALUES (	4	,	'Иванна'	,'	Волкова'	,	1986	,	19	,	null	,	3	)	;
INSERT INTO TEACHERS VALUES (	5	,	'Константин'	,'	Алексеев'	,	1990	,	15	,	'доктор наук'	,	5	)	;
INSERT INTO TEACHERS VALUES (	1	,	'Эвелина'	,	'Лебедева'	,	1965	,	2	,	null	,	4	)	;
INSERT INTO TEACHERS VALUES (	4	,	'Таиссия'	,	'Шпиленко'	,	1984	,	2	,	null	,	7	)	;
INSERT INTO TEACHERS VALUES (	6	,	'Егор'	,	'Андрейко'	,	1985	,	2	,	'кандидат наук'	,	16	)	;
INSERT INTO TEACHERS VALUES (	4	,	'Григорий'	,'	Золотинский'	,	1985	,	10	,	null	,	13	)	;
INSERT INTO TEACHERS VALUES (	7	,	'Артем'	,	'Шляпочник'	,	1969	,	20	,	'доктор наук'	,	5	)	;
INSERT INTO TEACHERS VALUES (	1	,	'Артемий'	,	'Тумашук'	,	1947	,	9	,	null	,	5	)	;
INSERT INTO TEACHERS VALUES (	2	,	'Максим'	,	'Лебедь'	,	1965	,	15	,	'кандидат наук'	,	18	)	;
INSERT INTO TEACHERS VALUES (	1	,	'Анна'	,	'Мороз	',	1966	,	6	,	null	,	14	)	;
INSERT INTO TEACHERS VALUES (	5	,	'Виктор'	,	'Кирсанов'	,	1957	,	11	,	null	,	14	)	;
INSERT INTO TEACHERS VALUES (	6	,	'Василиса'	,	'Бутко	',	1946	,	7	,	null	,	2	)	;
INSERT INTO TEACHERS VALUES (	1	,	'Валентина'	,	'Романенко	',	1941	,	18	,	'доктор наук'	,	52	)	;
INSERT INTO TEACHERS VALUES (	5	,	'Варвара'	,	'Кравченко	',	1993	,	18	,	null	,	5	)	;
INSERT INTO TEACHERS VALUES (	4	,	'Ангелина'	,	'Коваленко'	,	1970	,	2	,	null	,	24	)	;
INSERT INTO TEACHERS VALUES (	1	,	'Перт'	,	'Петренко	',	1995	,	12	,	'доктор наук'	,	2	)	;
INSERT INTO TEACHERS VALUES (	1	,	'Владислав'	,'	Савченко'	,	1978	,	1	,	null	,	4	)	;
INSERT INTO TEACHERS VALUES (	5	,	'Алексей'	,'	Добрынин'	,	1969	,	2	,	'доктор наук'	,	14	)	;
INSERT INTO TEACHERS VALUES (	1	,	'Андрей	',	'Емельянин	',	1975	,	14	,	null	,	23	)	;
INSERT INTO TEACHERS VALUES (	7	,	'Евгений	',	'Карпухин	',	1944	,	5	,	null	,	23	)	;
INSERT INTO TEACHERS VALUES (	2	,	'Николай	',	'Николенко'	,	1950	,	19	,	'кандидат наук'	,	46	)	;
INSERT INTO TEACHERS VALUES (	4	,	'Константин'	,	'Слесарь'	,	1967	,	5	,	null	,	4	)	;
INSERT INTO TEACHERS VALUES (	3	,	'Александр'	,	'Волга	',	1957	,	20	,	null	,	25	)	;
INSERT INTO TEACHERS VALUES (	3	,	'Павел	',	'Короленко'	,	1941	,	18	,	'кандидат наук'	,	14	)	;
INSERT INTO TEACHERS VALUES (	5	,	'Ильгам'	,	'Высоцкий'	,	1964	,	9	,	null	,	14	)	;
INSERT INTO TEACHERS VALUES (	2	,	'Савелий'	,	'Визбор'	,	1961	,	7	,	null	,	20	)	;



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

INSERT INTO [student] VALUES ('	Терентий	  ','	Кунаковский	 ',	1989	,	2	,	5	,	4	);
INSERT INTO [student] VALUES ('	Потап	  ','	Головкин	 ',	1971	,	7	,	10	,	4	);
INSERT INTO [student] VALUES ('	Павел	  ','	Рабинович	 ',	1981	,	18	,	1	,	2	);
INSERT INTO [student] VALUES ('	Викентий	  ','	Маслов	 ',	1986	,	8	,	4	,	2	);
INSERT INTO [student] VALUES ('	Нестор	  ','	Апалков	 ',	2003	,	7	,	7	,	2	);
INSERT INTO [student] VALUES ('	Леондий	  ','	Гусенков	 ',	1957	,	1	,	7	,	1	);
INSERT INTO [student] VALUES ('	Дементий	  ','	Стрельников	 ',	1959	,	17	,	10	,	2	);
INSERT INTO [student] VALUES ('	Феликс	  ','	Плеханов	 ',	2005	,	9	,	2	,	3	);
INSERT INTO [student] VALUES ('	Иосиф	  ','	Благово	 ',	1993	,	13	,	10	,	2	);
INSERT INTO [student] VALUES ('	Денис	  ','	Куприянов	 ',	2012	,	5	,	6	,	3	);
INSERT INTO [student] VALUES ('	Наум	  ','	Громыко	 ',	1992	,	9	,	5	,	3	);
INSERT INTO [student] VALUES ('	Поликарп	  ','	Храмов	 ',	1996	,	20	,	8	,	2	);
INSERT INTO [student] VALUES ('	Яков	  ','	Каиров	 ',	1950	,	16	,	9	,	4	);
INSERT INTO [student] VALUES ('	Константин	  ','	Умников	 ',	2010	,	15	,	10	,	4	);
INSERT INTO [student] VALUES ('	Фадей	  ','	Манин	 ',	2017	,	1	,	7	,	2	);
INSERT INTO [student] VALUES ('	Александр	  ','	Плюхин	 ',	1988	,	17	,	5	,	4	);
INSERT INTO [student] VALUES ('	Василий	  ','	Гордеев	 ',	1988	,	9	,	6	,	2	);
INSERT INTO [student] VALUES ('	Ерофей	  ','	Дудкин	 ',	2002	,	15	,	9	,	3	);
INSERT INTO [student] VALUES ('	Борислав	  ','	Абумайлов	 ',	2001	,	11	,	1	,	3	);
INSERT INTO [student] VALUES ('	Дмитрий	  ','	Чехов	 ',	1961	,	5	,	3	,	3	);
INSERT INTO [student] VALUES ('	Трофим	  ','	Ишутин	 ',	1968	,	7	,	9	,	1	);
INSERT INTO [student] VALUES ('	Виталий	  ','	Редругин	 ',	1976	,	7	,	6	,	4	);
INSERT INTO [student] VALUES ('	Назар	  ','	Шуличенко	 ',	1994	,	13	,	3	,	2	);
INSERT INTO [student] VALUES ('	Клавдий	  ','	Смагин	 ',	2015	,	9	,	3	,	2	);
INSERT INTO [student] VALUES ('	Борис	  ','	Тукаев	 ',	2018	,	13	,	6	,	4	);
INSERT INTO [student] VALUES ('	Савелий	  ','	Банин	 ',	1951	,	16	,	2	,	4	);
INSERT INTO [student] VALUES ('	Аким	  ','	Панкин	 ',	1974	,	16	,	10	,	3	);
INSERT INTO [student] VALUES ('	Данила	  ','	Черкашин	 ',	1988	,	7	,	3	,	4	);
INSERT INTO [student] VALUES ('	Филимон	  ','	Кунаев	 ',	1995	,	12	,	1	,	3	);
INSERT INTO [student] VALUES ('	Тит	  ','	Кропанин	 ',	2010	,	12	,	10	,	1	);
INSERT INTO [student] VALUES ('	Касьян	  ','	Нусинов	 ',	2009	,	8	,	2	,	4	);
INSERT INTO [student] VALUES ('	Леонид	  ','	Луков	 ',	1995	,	20	,	9	,	4	);
INSERT INTO [student] VALUES ('	Аристарх	  ','	Каприянов	 ',	2008	,	3	,	4	,	1	);
INSERT INTO [student] VALUES ('	Юлиан	  ','	Утёсов	 ',	2004	,	20	,	2	,	2	);
INSERT INTO [student] VALUES ('	Всеслав	  ','	Кучав	 ',	1954	,	6	,	8	,	3	);
INSERT INTO [student] VALUES ('	Евдокия	  ','	Кривоухова	 ',	1987	,	17	,	8	,	2	);
INSERT INTO [student] VALUES ('	Эльвира	  ','	Кабисова	 ',	1988	,	15	,	7	,	4	);
INSERT INTO [student] VALUES ('	Нина	  ','	Пайкова	 ',	1999	,	9	,	5	,	4	);
INSERT INTO [student] VALUES ('	Дарья	  ','	Юнге	 ',	1991	,	15	,	2	,	1	);
INSERT INTO [student] VALUES ('	Кристина	  ','	Губина	 ',	1980	,	9	,	4	,	3	);
INSERT INTO [student] VALUES ('	Эвелина	  ','	Капишникова	 ',	2016	,	2	,	9	,	1	);
INSERT INTO [student] VALUES ('	Полина	  ','	Яцунова	 ',	1984	,	20	,	1	,	4	);
INSERT INTO [student] VALUES ('	Наталия	  ','	Жилова	 ',	1968	,	18	,	4	,	4	);
INSERT INTO [student] VALUES ('	Бронислава	  ','	Астанкова	 ',	2007	,	12	,	4	,	3	);
INSERT INTO [student] VALUES ('	Рената	  ','	Махнер	 ',	1960	,	6	,	10	,	4	);
INSERT INTO [student] VALUES ('	Ева	  ','	Набокова	 ',	2015	,	19	,	3	,	4	);
INSERT INTO [student] VALUES ('	Клара	  ','	Кошляк	 ',	1977	,	9	,	7	,	1	);
INSERT INTO [student] VALUES ('	Изольда	  ','	Вавилова	 ',	1964	,	12	,	4	,	2	);
INSERT INTO [student] VALUES ('	Анна	  ','	Зууфина	 ',	1978	,	6	,	1	,	4	);
INSERT INTO [student] VALUES ('	Владлена	  ','	Никулаичева	 ',	1965	,	1	,	8	,	4	);


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


INSERT INTO olympiad VALUES ('	физика пвг	 ');
INSERT INTO olympiad VALUES ('	ломомносов математика	 ');
INSERT INTO olympiad VALUES ('	турнир ломоносова	 ');
INSERT INTO olympiad VALUES ('	всерос	 ');
INSERT INTO olympiad VALUES ('	всесиб	 ');
INSERT INTO olympiad VALUES ('	физтех математика	 ');
INSERT INTO olympiad VALUES ('	математика пвг	 ');
INSERT INTO olympiad VALUES ('	физтех физика	 ');
INSERT INTO olympiad VALUES ('	ломоносов физика	 ');
INSERT INTO olympiad VALUES ('	росатом физика	 ');
INSERT INTO olympiad VALUES ('	турнир городов	 ');
INSERT INTO olympiad VALUES ('	ммо	 ');
INSERT INTO olympiad VALUES ('	мош по физике	 ');
INSERT INTO olympiad VALUES ('	межнар	 ');
INSERT INTO olympiad VALUES ('	олимпиада юмш	 ');

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
