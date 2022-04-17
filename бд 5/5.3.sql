USE univ
--учителя и ученики из одного города, оценки, которые им выставили

GO
IF(OBJECT_ID('support') IS NOT NULL)
	DROP VIEW support;

GO

create view support as
(
	select TEACHERS.second_name as teacher, [SUBJECT].subject_id, STUDENT.second_name as stud, town, mark
	FROM TEACHERS join SUBJECT_TEACH on TEACHERS.teacher_id = SUBJECT_TEACH.teacher_id
	JOIN STUDENT_SUBJECT on SUBJECT_TEACH.subject_id = STUDENT_SUBJECT.subject_id
	join [SUBJECT] on [SUBJECT].subject_id = STUDENT_SUBJECT.subject_id
	join student on student.student_id = STUDENT_SUBJECT.student_id
	join [LOCATION] on [LOCATION].location_id = STUDENT.location_id
	where STUDENT.location_id = TEACHERS.location_id
);

go
select * from support;

go

select * 
from support 
where mark > 7;

