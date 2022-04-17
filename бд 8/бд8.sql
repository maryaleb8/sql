use univ

--������� ����� ���� ������, ��������� ����������� ������������� ���� ������

select name as '�������'
FROM sys.sysobjects
WHERE xtype = 'U' 
	AND [uid] =(SELECT sysusers.[uid] FROM sys.sysusers
			WHERE sysusers.name = user_name() )
	AND [name] <> 'sysdiagrams'
/*AND
object_id not in (select major_id from sys.extended_properties
					where name = 'microsoft_database_tools_support')*/

--������� ��� �������, ��� ������� �������, ������� ����, ��������� �� ������ ������� null-��������, �������� ���� ������ ������� �������,
--������ ����� ���� ������ - ��� ���� ������, ��������� ����������� ������������� ���� ������ � ���� �� ��������

select o.[name] as '�������', c.[name] as '�������',
	c.isnullable as 'null or not', [type].[name] as '���', c.[length] as '������ ����'
FROM sys.sysobjects AS o
	JOIN sys.syscolumns AS c ON c.id = o.id
	JOIN sys.systypes AS [type] ON c.xtype = [type].xtype
WHERE o.xtype = 'U' 
	AND o.[uid] =(SELECT sysusers.[uid] FROM sys.sysusers
				WHERE sysusers.name = user_name())
	AND o.name <> 'sysdiagrams'
ORDER BY o.name

--������� �������� ����������� ����������� (��������� � ������� �����), ��� �������, � ������� ��� ���������, ������� ����, ��� ��� �� ����������� 
--('PK' ��� ���������� ����� � 'F' ��� ��������) - ��� ���� ����������� �����������, ��������� ����������� ������������� ���� ������

SELECT o1.name AS '�����������', o2.name AS '�������',o1.xtype AS '���'
FROM sys.sysobjects AS o1
JOIN sys.sysobjects AS o2 ON o1.parent_obj = o2.id AND o2.xtype = 'U'
WHERE o1.xtype IN ('F', 'PK')
	AND o1.[uid] = (SELECT [uid] FROM sys.sysusers
		WHERE name = user_name() ) 
	AND o2.name <> 'sysdiagrams'


--������� �������� �������� �����, ��� �������, ���������� ������� ����, ��� �������, ���������� ��� ������������ ���� - ��� ���� ������� ������, 
--��������� ����������� ������������� ���� ������

SELECT obj.name AS '������� ����', out.name AS '�������� �������', [into].name AS '������������ �������'
FROM sys.sysreferences AS k
	JOIN sys.sysobjects AS obj ON k.constid = obj.id
	JOIN sys.sysobjects AS out ON k.fkeyid = out.id
	JOIN sys.sysobjects AS [into] ON k.rkeyid = [into].id
WHERE  obj.[uid] = (SELECT [uid] FROM sys.sysusers
		WHERE name = user_name() ) 
	AND obj.name <> 'sysdiagrams'


--������� �������� �������������, SQL-������, ��������� ��� ������������� - ��� ���� �������������, ��������� ����������� ������������� ���� ������

SELECT v.name AS '�������������', kod.[text] AS '���'
FROM sys.sysobjects AS v
	JOIN sys.syscomments AS kod ON v.id = kod.id
WHERE v.xtype = 'V'
	AND v.[uid] =(SELECT sysusers.[uid] FROM sys.sysusers
				WHERE sysusers.name = user_name())
	AND v.name <> 'sysdiagrams'


--������� �������� ��������, ��� �������, ��� ������� ��������� ������� - ��� ���� ���������, ��������� ����������� ������������� ���� ������
SELECT t.name AS '�������', tab.name AS '�������'
FROM sys.sysobjects AS t
	JOIN sys.sysobjects AS tab ON t.parent_obj = tab.id
WHERE t.xtype = 'TR'
	AND t.[uid] =(SELECT sysusers.[uid] FROM sys.sysusers
				WHERE sysusers.name = user_name())
	AND t.name <> 'sysdiagrams'


/*
go
CREATE TRIGGER test  ON  [location]
AFTER INSERT, UPDATE   
AS RAISERROR ('Notify Customer Relations', 16, 10);  

go
drop trigger test*/




