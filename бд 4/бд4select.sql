use univ

--вывести преподавателя, у которого у учеников самая большая средняя зарплата
select top(1) avg(salary) as max_salary,  teachers.first_name, teachers.second_name
from teachers 
	join subject_teach on teachers.teacher_id = subject_teach.teacher_id
	join [subject] on [subject].subject_id  = subject_teach.subject_id
	join STUDENT_SUBJECT on STUDENT_SUBJECT.subject_id = [subject].subject_id
	join student on student.student_id = STUDENT_SUBJECT.student_id
	join work on work.student_id = student.student_id
group by teachers.teacher_id, teachers.first_name, teachers.second_name


--вывести преподавателя, к которому попало наибольшее кол-во олимпиад
select top(1) count(student.student_id) as t,  teachers.first_name, teachers.second_name
from teachers 
	join subject_teach on teachers.teacher_id = subject_teach.teacher_id
	join [subject] on [subject].subject_id  = subject_teach.subject_id
	join STUDENT_SUBJECT on STUDENT_SUBJECT.subject_id = [subject].subject_id
	join student on student.student_id = STUDENT_SUBJECT.student_id
	join olymp_student on olymp_student.student_id = student.student_id
group by teachers.teacher_id, teachers.first_name, teachers.second_name

--выбрать студентов, которые учатся сейчас и посмотреть на кол-во экзаменов и зачетов у них
select sum(exam + test) as p, student.student_id, student.first_name, student.second_name
from student
	join STUDENT_SUBJECT on STUDENT_SUBJECT.student_id = student.student_id
where year_out is null
group by student.student_id, student.first_name, student.second_name
order by p desc

--выбрать студента и его школу, который набрал больше всего предметов
select top(1) count(subject_id) as counts, student.school_id , student.first_name, student.second_name
from student
	join STUDENT_SUBJECT on STUDENT_SUBJECT.student_id = student.student_id
	join school on school.school_id = student.student_id
where year_out is null
group by student.student_id, student.first_name, student.second_name,student.school_id  




