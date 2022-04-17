--найти опцию которая включает триггерный вывод
use univ
go

if object_id('trig3', 'TR') is not null
drop trigger trig3
go



create trigger dbo.trig3 on dbo.STUDENT_SUBJECT
after update 
as

if (ROWCOUNT_BIG() = 0)
return;

declare @t1 table (num int, student_id int, subject_id int, oldexam int, newexam int, test int, mark int)

DECLARE @i INT 
	SET @i = 1
	DECLARE @size INT
	SET @size = (SELECT COUNT(*) FROM inserted)
	--создадим табличное выражение для записи строк, котрые изменялись
	
	INSERT INTO @t1(num, student_id, subject_id, oldexam, newexam, test, mark)  SELECT ROW_NUMBER() OVER (ORDER BY deleted.student_id, deleted.subject_id),
		deleted.student_id, deleted.subject_id, deleted.exam, inserted.exam, deleted.test, deleted.mark FROM deleted join inserted 
		on deleted.student_id = inserted.student_id and deleted.subject_id = inserted.subject_id
	WHILE (@i <= @size)
	BEGIN

		--для удобства создадим переменные, в которые все будем писать
		DECLARE @oldexam INT 
		DECLARE @newexam INT	
		SET @oldexam = (SELECT oldexam FROM @t1 WHERE num = @i)	
		SET @newexam = (SELECT newexam FROM @t1 WHERE num = @i)

		DECLARE @student_id INT 
		DECLARE @subject_id INT	
		declare @test int
		declare @mark int
		SET @student_id = (SELECT student_id FROM @t1 WHERE num = @i)	
		SET @subject_id = (SELECT subject_id FROM @t1 WHERE num = @i)
		SET @test = (SELECT test FROM @t1 WHERE num = @i)
		set @mark = (SELECT mark FROM @t1 WHERE num = @i)

		if (@newexam - @oldexam) >= 1
			begin
				
				delete STUDENT_SUBJECT where STUDENT_SUBJECT.student_id = @student_id and STUDENT_SUBJECT.subject_id = @subject_id
				insert into STUDENT_SUBJECT values(@student_id, @subject_id, @mark, @newexam, @test - 1)
			end
		set @i = @i + 1

	END

go

/*
select * from STUDENT_SUBJECT where student_id = 25 and subject_id = 5


update STUDENT_SUBJECT set exam = exam + 1 where student_id = 25 and subject_id = 5

--update STUDENT_SUBJECT set test = test + 20 where student_id = 25 and subject_id = 5

select * from STUDENT_SUBJECT where student_id = 25 and subject_id = 5

*/