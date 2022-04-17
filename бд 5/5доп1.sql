use univ
--допзадание: создать представление со всеми числами от 1 до 1000 с помощью рекурсии
go

GO
IF(OBJECT_ID('QUESTION') IS NOT NULL)
	DROP VIEW QUESTION;



GO

CREATE VIEW QUESTION AS

	WITH Letters AS(
	SELECT  code = 1
	UNION ALL
	SELECT code+1 FROM Letters
	WHERE code+1 < 1000
	)
	SELECT code FROM Letters 

		

	; 

	go
	select * from QUESTION
	OPTION (MAXRECURSION 1002);
	

