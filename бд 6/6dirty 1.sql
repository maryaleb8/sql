--������ ��� ������� ����������� ���������� � ������� ������


--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED--��������, �����
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED--��� �����, ���� �������
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ--��� �����, ���� �������
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE--��� �����, ���� �������
BEGIN TRANSACTION
SELECT * FROM [SUBJECT] where subject_name = '���������'--1

SELECT * FROM [SUBJECT] where subject_name = '���������'--3

SELECT * FROM [SUBJECT] where subject_name = '���������'--5
COMMIT


UPDATE [subject] SET sem_end = 8 WHERE subject_name = '���������'