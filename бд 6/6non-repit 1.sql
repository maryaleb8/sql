--��� ��������� ������, ����� ����������� ������, ����������� �����������

--1
--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED--������� 8 88
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED--������� 8 88
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ--����� ������� 2 ���� 8
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--����� ������� 2 ���� 8

BEGIN TRANSACTION
SELECT * FROM [SUBJECT] WHERE subject_name = '���������'

--3
SELECT * FROM [SUBJECT] WHERE subject_name = '���������'
COMMIT


UPDATE [SUBJECT] SET sem_end = 8 WHERE subject_name = '���������'