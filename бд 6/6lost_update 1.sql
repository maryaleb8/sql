--потерянное изменение, первое
--2

--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED --10
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED --10
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ --взаимоблокировка
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE --взаимоблокровка
BEGIN TRANSACTION

DECLARE @a int;
SELECT @a = sem_end FROM [subject] WHERE subject_name = 'матанализ'
WAITFOR DELAY '00:00:05';
--4
UPDATE [subject] 
SET sem_end = sem_end + 4
WHERE subject_name = 'матанализ'

COMMIT


select * from [subject]

UPDATE [subject] 
SET sem_end = 8
WHERE subject_name = 'матанализ'