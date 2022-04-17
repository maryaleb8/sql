-- фантом второй

--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--только здесь работает нормально

BEGIN TRANSACTION


UPDATE OLYMPIAD SET olympiad_name = 'физтех' WHERE olympiad_name = 'физтех математика'

UPDATE OLYMPIAD SET olympiad_name = 'физтех' WHERE olympiad_name = 'физтех физика'

COMMIT

SELECT * FROM [OLYMPIAD]


UPDATE OLYMPIAD SET olympiad_name = 'физтех математика' WHERE olympiad_id = 6

UPDATE OLYMPIAD SET olympiad_name = 'физтех физика' WHERE olympiad_id = 8
