use univ

--выбрать имена всех таблиц, созданных назначенным пользователем базы данных

select name as 'таблица'
FROM sys.sysobjects
WHERE xtype = 'U' 
	AND [uid] =(SELECT sysusers.[uid] FROM sys.sysusers
			WHERE sysusers.name = user_name() )
	AND [name] <> 'sysdiagrams'
/*AND
object_id not in (select major_id from sys.extended_properties
					where name = 'microsoft_database_tools_support')*/

--выбрать имя таблицы, имя столбца таблицы, признак того, допускает ли данный столбец null-значения, название типа данных столбца таблицы,
--размер этого типа данных - для всех таблиц, созданных назначенным пользователем базы данных и всех их столбцов

select o.[name] as 'таблица', c.[name] as 'столбец',
	c.isnullable as 'null or not', [type].[name] as 'тип', c.[length] as 'размер типа'
FROM sys.sysobjects AS o
	JOIN sys.syscolumns AS c ON c.id = o.id
	JOIN sys.systypes AS [type] ON c.xtype = [type].xtype
WHERE o.xtype = 'U' 
	AND o.[uid] =(SELECT sysusers.[uid] FROM sys.sysusers
				WHERE sysusers.name = user_name())
	AND o.name <> 'sysdiagrams'
ORDER BY o.name

--выбрать название ограничения целостности (первичные и внешние ключи), имя таблицы, в которой оно находится, признак того, что это за ограничение 
--('PK' для первичного ключа и 'F' для внешнего) - для всех ограничений целостности, созданных назначенным пользователем базы данных

SELECT o1.name AS 'ограничение', o2.name AS 'таблица',o1.xtype AS 'тип'
FROM sys.sysobjects AS o1
JOIN sys.sysobjects AS o2 ON o1.parent_obj = o2.id AND o2.xtype = 'U'
WHERE o1.xtype IN ('F', 'PK')
	AND o1.[uid] = (SELECT [uid] FROM sys.sysusers
		WHERE name = user_name() ) 
	AND o2.name <> 'sysdiagrams'


--выбрать название внешнего ключа, имя таблицы, содержащей внешний ключ, имя таблицы, содержащей его родительский ключ - для всех внешних ключей, 
--созданных назначенным пользователем базы данных

SELECT obj.name AS 'внешний ключ', out.name AS 'дочерняя таблица', [into].name AS 'родительская таблица'
FROM sys.sysreferences AS k
	JOIN sys.sysobjects AS obj ON k.constid = obj.id
	JOIN sys.sysobjects AS out ON k.fkeyid = out.id
	JOIN sys.sysobjects AS [into] ON k.rkeyid = [into].id
WHERE  obj.[uid] = (SELECT [uid] FROM sys.sysusers
		WHERE name = user_name() ) 
	AND obj.name <> 'sysdiagrams'


--выбрать название представления, SQL-запрос, создающий это представление - для всех представлений, созданных назначенным пользователем базы данных

SELECT v.name AS 'представление', kod.[text] AS 'код'
FROM sys.sysobjects AS v
	JOIN sys.syscomments AS kod ON v.id = kod.id
WHERE v.xtype = 'V'
	AND v.[uid] =(SELECT sysusers.[uid] FROM sys.sysusers
				WHERE sysusers.name = user_name())
	AND v.name <> 'sysdiagrams'


--выбрать название триггера, имя таблицы, для которой определен триггер - для всех триггеров, созданных назначенным пользователем базы данных
SELECT t.name AS 'триггер', tab.name AS 'таблица'
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




