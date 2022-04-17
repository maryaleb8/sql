use univ
--Допзадание: создать представление с какой-нибудь агрегатной функцией и внести туда данные.
--это совершенно бессмысленный код, просто для примера

GO
IF(OBJECT_ID('zadacha') IS NOT NULL)
	DROP VIEW zadacha;

GO


go
create view zadacha as
(
	select name_school
	from school
	where [school_id] > (select count(school_id) from student)-80
);

go
insert into zadacha values ('11111');

GO
delete from zadacha where name_school like '11111' 
;
go
select * from zadacha;
