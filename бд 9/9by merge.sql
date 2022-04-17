--код не рабочий, сказали, что это неправильно
use univ
go

if object_id('trig2', 'TR') is not null
drop trigger trig2
go

create trigger dbo.trig2 on dbo.STUDENT_SUBJECT
after update 
as

merge student_subject
using inserted
on 
student_subject.student_id = inserted.student_id and student_subject.subject_id = inserted.subject_id

				
when matched and (select inserted.exam - deleted.exam  as diff
				from STUDENT_SUBJECT JOIN DELETED on STUDENT_SUBJECT.student_id = DELETED.student_id and STUDENT_SUBJECT.subject_id = deleted.subject_id
									join inserted on STUDENT_SUBJECT.student_id = inserted.student_id and STUDENT_SUBJECT.subject_id = inserted.subject_id
				where STUDENT_SUBJECT.student_id = @i and STUDENT_SUBJECT.subject_id = @j) >= 1

	then update STUDENT_SUBJECT SET test = test - 1
--when not matched then insert STUDENT_SUBJECT values(1, 1, 1, 1)
go