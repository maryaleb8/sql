USE laba10
SET STATISTICS IO ON
SET STATISTICS TIME ON

--Без индекса 1500 25500 40000

SELECT customers.customerid, country
FROM customers JOIN orders ON orders.customerid = customers.customerid
				JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
				JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE customers.country = 'Germany'
	AND region is null
	AND discount = 0


--С индексом 188 4000 10000

CREATE CLUSTERED INDEX con3 ON customers(customerID, country)
CREATE CLUSTERED INDEX oon3 ON orders(customerID)
CREATE CLUSTERED INDEX pon3 ON products (productID)
CREATE CLUSTERED INDEX odon3 ON orderdetails (orderID, productID)

CREATE NONCLUSTERED INDEX odnon3 ON orderdetails (discount)


SELECT customers.customerid, employeeid, country
FROM customers JOIN orders ON orders.customerid = customers.customerid
				JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
				JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE customers.country = 'Germany'
	AND employeeid = 3
	AND region is null
	AND discount = 0
	AND Discontinued is not null

DROP INDEX con3 ON Customers
DROP INDEX oon3 ON Orders
DROP INDEX pon3 ON Products
DROP INDEX odon3 ON OrderDetails


DROP INDEX odnon3 ON OrderDetails

