create database dop
go
use dop
go

CREATE TABLE a
(
	id int not null primary key identity(1, 1),
	a_data varchar(50)
);

CREATE TABLE b
(
	id int,
	b_data varchar(50)
		CONSTRAINT fk_b
		FOREIGN KEY (id)
		REFERENCES a (id)
);
TRUNCATE table b
select * from b

DECLARE @count INT
SELECT @count = 100000
WHILE @count >= 0
  BEGIN
    INSERT INTO a values('trash')
    SELECT @count = @count - 1
  END

DECLARE @count2 INT
SELECT @count2 = 100000
WHILE @count2 >= 0
  BEGIN
    INSERT INTO b values(@count2, 'trash2')
    SELECT @count2 = @count2 - 1000
  END

GO
CREATE TABLE help --вспомогательная таблица для копии b
( 
	id int NOT NULL,
	help_data varchar(50)
);
GO
------------------------------------------


--создаем логин
CREATE LOGIN login_new WITH PASSWORD = '1234'
CREATE USER user_new FOR LOGIN login_new
go
----даем право на TRUNCATE TABLE
create PROCEDURE atruncate

	WITH EXECUTE AS OWNER
	AS

	ALTER TABLE b   
	DROP CONSTRAINT fk_b  
	

    SET NOCOUNT OFF;
    DECLARE @QUERY NVARCHAR(200);
    SET @QUERY = N'TRUNCATE TABLE ' + 'a;'
    EXECUTE sp_executesql @QUERY
	
	ALTER TABLE b   
	add CONSTRAINT fk_b
	FOREIGN KEY (id)
	REFERENCES a (id);   
GO

GRANT EXECUTE ON  atruncate TO user_new;  
GO

execute as user = 'user_new'

EXEC atruncate;  
GO

revert

