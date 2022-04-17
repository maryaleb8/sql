--(из варианта) Название кафедры, название предмета, количество преподавателей, с ними связанных

use univ

GO
IF(OBJECT_ID('cprepod') IS NOT NULL)
	DROP VIEW cprepod;

GO
CREATE VIEW cprepod  ([subject_name], kolvo_teacher, department) as
(
	select [SUBJECT].subject_name, count(teachers.teacher_id) as [count], DEPARTMENT.department_name
	FROM TEACHERS join SUBJECT_TEACH on TEACHERS.teacher_id = SUBJECT_TEACH.teacher_id
			join [SUBJECT] on [SUBJECT].subject_id = SUBJECT_TEACH.subject_id
			join DEPARTMENT on [SUBJECT].department_id = DEPARTMENT.department_id
			group by [SUBJECT].subject_name, DEPARTMENT.department_name
);

go
select * from cprepod;


