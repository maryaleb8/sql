-- ������ ������

--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--������ ����� �������� ���������

BEGIN TRANSACTION


UPDATE OLYMPIAD SET olympiad_name = '������' WHERE olympiad_name = '������ ����������'

UPDATE OLYMPIAD SET olympiad_name = '������' WHERE olympiad_name = '������ ������'

COMMIT

SELECT * FROM [OLYMPIAD]


UPDATE OLYMPIAD SET olympiad_name = '������ ����������' WHERE olympiad_id = 6

UPDATE OLYMPIAD SET olympiad_name = '������ ������' WHERE olympiad_id = 8
