--в задании: при добавлении нового семинара, по возможности, уменьшается число лекций по данному предмету
--у меня: при добавлении экзамена, по возможности, уменьшить число тестов по данному предмету

use univ
go

if object_id('trig', 'TR') is not null
drop trigger trig
go

create trigger dbo.trig on dbo.STUDENT_SUBJECT
after update 
as

if (ROWCOUNT_BIG() = 0)
return;
--так как у меня два ключа в этой таблице, мне нужно идти по двум
declare @i int;
set @i = (select min(student_id) from inserted);
while (@i <= (select max(student_id) from inserted))
begin
	declare @j int;
	set @j = (select min(subject_id) from inserted);
	while (@j <= (select max(subject_id) from inserted))
	begin
		
		if (select inserted.exam - deleted.exam  as diff
				from STUDENT_SUBJECT JOIN DELETED on STUDENT_SUBJECT.student_id = DELETED.student_id and STUDENT_SUBJECT.subject_id = deleted.subject_id
									join inserted on STUDENT_SUBJECT.student_id = inserted.student_id and STUDENT_SUBJECT.subject_id = inserted.subject_id
				where STUDENT_SUBJECT.student_id = @i and STUDENT_SUBJECT.subject_id = @j) >= 1
			begin
				update STUDENT_SUBJECT set test = test - 1 where STUDENT_SUBJECT.student_id = @i and STUDENT_SUBJECT.subject_id = @j
			end
		
		set @j = @j + 1;

			

	end
	set @i = @i + 1;
end
go

--так как таблица n к n то нет зависимых таблиц

/*
select * from STUDENT_SUBJECT where student_id = 25 and subject_id = 5


update STUDENT_SUBJECT set exam = exam + 1 where student_id = 25 and subject_id = 5

select * from STUDENT_SUBJECT where student_id = 25 and subject_id = 5

*/






