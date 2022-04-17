USE laba10
SET STATISTICS IO ON
SET STATISTICS TIME ON
GO

select * from customers join orders on Orders.customerid = Customers.customerid

--Без индекса 703 17000 30000
SELECT customers.customerid, country
FROM customers JOIN orders ON orders.customerid = customers.customerid
WHERE customers.country = 'Germany'
	AND region is null


--С индексами 312 3062 2500
CREATE CLUSTERED INDEX con2 ON customers (customerid)
CREATE CLUSTERED INDEX oon2 ON orders (customerid) 
CREATE NONCLUSTERED INDEX cnon2 ON customers(country)
CREATE NONCLUSTERED INDEX cnon20 ON customers(region)

SELECT customers.customerid, employeeid, country
FROM customers JOIN orders ON orders.customerid = customers.customerid
WHERE customers.country = 'Germany'
	AND employeeid = 3
	AND region is null


DROP INDEX con2 ON customers
DROP INDEX oon2 ON orders
DROP INDEX cnon2 ON customers

DROP INDEX cnon20 ON customers

