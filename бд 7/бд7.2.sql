use univ
go


/*
CREATE LOGIN login_test1 WITH PASSWORD = '1234'
CREATE USER user_test1 FOR LOGIN login_test1
*/


--1
execute as user = 'user_test1'
BEGIN TRAN
select * from olympiad
go

update olympiad set olympiad_name = 'ФИЗТЕХ МАТЕМАТИКА' WHERE OLYMPIAD_NAME = 'физтех математика'
go

insert into olympiad values ( 'бельчонок')

ROLLBACK
revert

--2
execute as user = 'user_test1'
begin tran
select country from [location]
go

update [location] set country = 'CCCР' where country = 'РОССИЯ'
go
rollback
revert


--3
execute as user = 'user_test1'
select * from school
go

revert

--4
execute as user = 'user_test1'
select * from achive
go

revert

--5
execute as user = 'user_test1'
begin tran
select * from zadacha
update  zadacha set name_school = 'школа без имени' where name_school = '45'
go
rollback

revert

--юзер создать схема создать юзера дать ему права на создание таблиц

CREATE LOGIN login_dop WITH PASSWORD = '1234'
CREATE USER user_dop FOR LOGIN login_dop

alter  role --db_accessadmin 
db_owner add member [user_dop]
go



execute as user = 'user_dop';

go
create schema newyyy
go-----

CREATE LOGIN login_dop2 WITH PASSWORD = '1234'
CREATE USER user_dop2 FOR LOGIN login_dop2
with default_schema = new
go

GRANT CREATE  TABLE TO  user_dop2
go

revert
