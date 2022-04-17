--потерянное изменение, второе
--1

--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION

DECLARE @a int;
SELECT @a = sem_end FROM [subject] WHERE subject_name = 'матанализ'
WAITFOR DELAY '00:00:05';
--3
UPDATE [subject] 
SET sem_end = sem_end - 2
WHERE subject_name = 'матанализ'

COMMIT


select * from [subject]