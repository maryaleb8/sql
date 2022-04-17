USE laba10
SET STATISTICS IO ON
SET STATISTICS TIME ON
GO
--ctrl L схемы
SELECT * FROM CUSTOMERS

--без индекса 250 2000 30000

SELECT customerid, country
FROM Customers
WHERE country = 'Germany' AND region is null

--с индексом 156 1900 5000
CREATE NONCLUSTERED INDEX cnon ON Customers(customerid, country, region)

GO

SELECT customerid, country
FROM Customers
WHERE country = 'Germany' AND region is null

DROP INDEX cnon ON Customers
GO




