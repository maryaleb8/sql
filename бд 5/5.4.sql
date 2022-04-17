USE univ
--������� �������� 1 � 2 �����, �� �����, �������� ��������
GO
IF(OBJECT_ID('achive') IS NOT NULL)
	DROP VIEW achive;

GO

create view achive as
(
select second_name, gender, olympiad_name, name_school
from student join school on STUDENT.school_id = SCHOOL.school_id
			join OLYMP_STUDENT on STUDENT.student_id = OLYMP_STUDENT.student_id
			join OLYMPIAD on OLYMPIAD.olympiad_id = OLYMP_STUDENT.olympiad_id
	where place < 3 and gender like 'female'

);

go
select * from achive;