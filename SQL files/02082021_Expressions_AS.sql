#Data Types

#CHAR/VARCHAR

#DATE/TIME/DATETIME

USE ClassicModels;

SELECT *
FROM Orders;

#BOOLEAN/INT



#String Expressions
USE mist4000;

#CONCAT

SELECT *
FROM Customers;

SELECT CONCAT(contactFirstName," ",contactLastName)
FROM Customers;

#TRIM

SELECT TRIM(city)
FROM Customers
ORDER BY city;

#UPPER/LOWER

SELECT UPPER(contactFirstName)
FROM Customers;

SELECT LOWER(contactFirstName)
FROM Customers;

#Combine Functions

SELECT CONCAT(UPPER(contactFirstName), " ",UPPER(contactLastName))
FROM Customers;

#SUBSTRING

SELECT *
FROM Products;

SELECT SUBSTRING(productCode,1,3)
FROM Products;

SELECT SUBSTRING(productCode,-4,3)
FROM Products;


#Numeric Expressions

# +-/*


SELECT *
FROM Products;

SELECT productName, MSRP-buyPrice, 0.9*MSRP
FROM Products;

#TRUNCATE

SELECT productName, MSRP-buyPrice
FROM Products;

SELECT productName, TRUNCATE(MSRP-buyPrice,1)
FROM Products;

#DIV/MOD

SELECT 18 DIV 4;

SELECT MOD(18,4);

#ROUND

SELECT productName, ROUND(MSRP-buyPrice,2)
FROM Products;

#AS

SELECT productName AS 'Product Name', ROUND(MSRP-buyPrice,2) AS 'Margin on Product'
FROM Products
ORDER BY ROUND(MSRP-buyPrice,2);