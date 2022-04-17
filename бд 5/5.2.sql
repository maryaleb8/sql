USE univ
--Название предмета, количество занятий, экзаменов + тестов, средняя оценка учащихся по нему, людей, которые примерно с такой оценкой

GO
IF(OBJECT_ID('efficiency') IS NOT NULL)
	DROP VIEW efficiency;

GO
CREATE VIEW efficiency ([subject], time_learn, examtest, mark_mid, familia, mark) AS
(
	select subject_name, sem, hard, mid.mark_mid, student.second_name, STUDENT_SUBJECT.mark 
	from (
		SELECT [subject].subject_id, subject_name, sem_end - sem_start as sem, avg(exam + test) as hard, avg(mark) as mark_mid
		from [subject] join student_subject 
			on [subject].subject_id = STUDENT_SUBJECT.subject_id
		group by [subject].subject_name, sem_end, sem_start, [subject].subject_id) as mid 
	join STUDENT_SUBJECT on mid.subject_id = STUDENT_SUBJECT.subject_id
	join student on STUDENT_SUBJECT.student_id = STUDENT.student_id
	where abs(STUDENT_SUBJECT.mark - mid.mark_mid) <= 1
);


go
select * from efficiency;