--���������� ���������, ������ 2.0

--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED--��������� � �� � ������
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED--��� ����� 21
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ--��� ����� 21
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--21

BEGIN TRANSACTION

UPDATE [subject] SET sem_end = sem_end + 10 WHERE subject_name = '���������'


COMMIT


UPDATE [subject] SET sem_end = 8 WHERE subject_name = '���������'

