use univ
go

/*
CREATE LOGIN login_test6 WITH PASSWORD = '1234'
CREATE USER user_test6 FOR LOGIN login_test6
*/
CREATE USER user_test3 FOR LOGIN login_test1

--1��������� ������ ������������ ����� SELECT, INSERT, UPDATE � ������ ������ �� ���� �������
GRANT INSERT, SELECT, UPDATE ON olympiad TO user_test1
go
GRANT alter ON olympiad TO user_test6


--2��� ����� ������� ������ ������������ �������� ����� SELECT � UPDATE ������ ��������� ��������.
GRANT SELECT, UPDATE ON [location](country) TO user_test1
go


--3��� ����� ������� ������ ������������ �������� ������ ����� SELECT.
GRANT SELECT ON school TO user_test1
go

--4��������� ������ ������������ ����� ������� (SELECT) � �������������, ���������� � ������������ ������ �4.
GRANT SELECT ON achive TO user_test1
go


--5C������ ����������� ���� ������ ���� ������, ��������� �� ����� ������� (UPDATE �� ��������� �������) � �������������, 
--���������� � ������������ ������ �4, ��������� ������ ������������ ��������� ����
/*go
create view zadacha as
(
	select name_school
	from school
	where [school_id] > (select count(school_id) from student)-80
);*/--��������� �������������

CREATE ROLE role_test1
GRANT SELECT, UPDATE ON zadacha (name_school) TO role_test1

alter role role_test1 add member [user_test1]
go


/*
SELECT session_id FROM sys.dm_exec_sessions WHERE login_name = 'login_test1'
KILL 60
go

drop login [login_test]
go

drop role test_role
go

---

select current_user

revoke --�������� �����

EXEC sp_addlogin 'testuser', 'test', 'test'

EXEC sp_grantdbaccess 'testuser'
EXEC sp_addrole 'testrole';

EXEC sp_addrolemember 'testrole', 'testuser';
*/
