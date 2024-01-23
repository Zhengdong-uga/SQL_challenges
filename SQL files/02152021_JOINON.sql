USE ClassicModels;


#Individual tables
SELECT * 
FROM Customers;

SELECT *
FROM Orders;

#PK-FK relationship between Customers and Orders
#customerNumber PK of Customers
#is present as a FK in Orders
#To JOIN equivalent rows in tables

SELECT *
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber;

#Can switch the order of the tables in the query

SELECT *
FROM Orders
JOIN Customers ON Customers.customerNumber = Orders.customerNumber;

#Can switch the order in the ON clause

SELECT *
FROM Customers
JOIN Orders ON Orders.customerNumber = Customers.customerNumber;

#WRONG
SELECT *
FROM Customers
JOIN Orders; #creates a cartesian product of the 2 tables




