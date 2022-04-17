--при повторном чтении, ранее прочитанные данные, оказываются изменёнными

--1
--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED--выводит 8 88
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED--выводит 8 88
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ--супер выводит 2 раза 8
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--супер выводит 2 раза 8

BEGIN TRANSACTION
SELECT * FROM [SUBJECT] WHERE subject_name = 'матанализ'

--3
SELECT * FROM [SUBJECT] WHERE subject_name = 'матанализ'
COMMIT


UPDATE [SUBJECT] SET sem_end = 8 WHERE subject_name = 'матанализ'