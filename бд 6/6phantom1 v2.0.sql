--����������� ������, ������� �� ���� � ������ ����������


--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--��� ������, � ��������� �����

BEGIN TRANSACTION
SELECT * FROM OLYMPIAD WHERE olympiad_name like '%������%'


SELECT * FROM OLYMPIAD WHERE olympiad_name like '%������%'
COMMIT



DELETE FROM OLYMPIAD where olympiad_id = 7