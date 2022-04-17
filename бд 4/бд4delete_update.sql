use univ

--изменим неправильное написание страны
update [location]
set country = 'Ѕ≈Ћј–”—№'
where country like '%Ѕ≈Ћќ–”——»я%'

--удалим олимпиаду москву из интересных нам
delete OLYMP_STUDENT
	from OLYMP_STUDENT os join student s on s.student_id = os.student_id
		join [location] l on l.location_id = s.student_id
where [town] like '%ћќ— ¬ј%'

--если криво заполнили, то заполнитс€ null, потому что остальное недопустимо
update student
set basis_id = null
where basis_id not in (1, 2, 3, 4)

--выведем школу, у кторой больше всего участников олимпиад на первое место в топе школ


/*DECLARE @j INT
set @j=2

while top(j

update school
	set school.place_in_area = 1
	where (select school_id 
			from (select top(1) count(OLYMP_STUDENT.student_id) as maxp, school.school_id
					from school join student on school.school_id = student.student_id
								join olymp_student on student.student_id = olymp_student.student_id
					group by school.school_id
					order by maxp desc
					) as fff
			) = school.school_id

			*/


--удалим одну из олимпиад, посмотрим на таблицу, св€занную с ней в каскаде
delete olympiad
where olympiad.[olympiad_name] like '%пвг%'
--select * from OLYMP_STUDENT join olympiad on OLYMP_STUDENT.olympiad_id=olympiad.olympiad_id

--повысить студенту, выпустившимус€ более 5 лет назад, зарплату на 300$
	update work
	set salary = salary + 300
	where work.student_id in (select  work.student_id
		from STUDENT join work on STUDENT.student_id = work.student_id
		where year_enter < 2015


