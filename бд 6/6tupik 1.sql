--????? ?????? ?? ????????? ??????? 100, 101
--1
--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE


BEGIN TRANSACTION


UPDATE [SUBJECT] SET sem_end = 66 WHERE subject_name = '??????'
--3
UPDATE [SUBJECT] SET sem_end = 88 WHERE subject_name = '?????????'


COMMIT


select * from [SUBJECT]