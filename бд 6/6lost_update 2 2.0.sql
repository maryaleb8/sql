--потерянное изменение, второе 2.0

--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED--выполняет и то и другое
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED--все равно 21
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ--все равно 21
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--21

BEGIN TRANSACTION

UPDATE [subject] SET sem_end = sem_end + 10 WHERE subject_name = 'матанализ'


COMMIT


UPDATE [subject] SET sem_end = 8 WHERE subject_name = 'матанализ'

