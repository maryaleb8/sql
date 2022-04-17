--чтение про котором считываются откаченные в будущем данные


--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED--меняется, плохо
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED--все супер, ждет второго
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ--все супер, ждет второго
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--все супер, ждет второго
BEGIN TRANSACTION
SELECT * FROM [SUBJECT] where subject_name = 'матанализ'--1

SELECT * FROM [SUBJECT] where subject_name = 'матанализ'--3

SELECT * FROM [SUBJECT] where subject_name = 'матанализ'--5
COMMIT


UPDATE [subject] SET sem_end = 8 WHERE subject_name = 'матанализ'