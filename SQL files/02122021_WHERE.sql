USE mist4000;

#REGEXP
#List the names of Motorcycles that have the string ”Chopper” in their name. 
#Order the result by their MSRP.

SELECT productName
FROM Products
WHERE productName REGEXP 'Chopper' AND productLine IN ('Motorcycles')
ORDER BY MSRP;

#List the names of product vendors (non repetitive) that sell products that 
#have the term ”official” in their product description.

SELECT DISTINCT productVendor
FROM Products
WHERE productDescription REGEXP 'official';


#List the names and credit limit of customers that are limited liability 
#companies (their names end with Ltd.)

SELECT customerName, creditLimit
FROM Customers
WHERE customerName REGEXP 'Ltd.$';

#Expressions and Operators
#List the customer name and the address of every customer. 
#Express the address of customers as 1 column with comma’s separating each part 
#of the address. Ensure the title appropriately represents what the data is.
SELECT *
FROM Customers;

SELECT customerName AS 'Customer Name', 
		CONCAT(addressLine1,",",IFNULL(addressLine2,""), state, zip,country) AS "Address"
FROM Customers;



#Calculate what the percentage margin (MSRP, buyPrice) on each product is and 
#represent it using a % sign. 
#Provide an appropriate column header and order the results from products 
#with the greatest to lowest margin.

SELECT productName, CONCAT(100*(MSRP-buyPrice)/MSRP, " %") AS 'Margin on the Product'
FROM Products
ORDER BY 100*(MSRP-buyPrice)/MSRP DESC;


#List the product name, the product line and the value of the 
#quantity in stock for the product. Express the result in dollars ($ sign), 
#provide an appropriate header and order the results from the 
#least to the greatest value. 

SELECT *
FROM Products;

SELECT productName, productLine, CONCAT("$ ",ROUND(quantityInStock*buyPrice,2)) AS 'Value of product on hand'
FROM Products
ORDER BY quantityInStock*buyPrice;


#COUNT - Returns the number of rows

SELECT COUNT(*), COUNT(creditLimit), COUNT(customerName)
FROM Customers;

SELECT COUNT(country)
FROM Customers;

SELECT COUNT(DISTINCT country)
FROM Customers;

#AVG - returns the average of a column

SELECT AVG(creditLimit)
FROM Customers;

#MIN, MAX

SELECT MIN(creditLimit), MAX(creditLimit)
FROM Customers;

#SUM - total up the values in a column

SELECT SUM(quantityInStock)
FROM Products;

USE mist4000;
#How many non-USA customers have a credit limit greater than 125000?

SELECT COUNT(country), COUNT(*), COUNT(customerName)
FROM Customers
WHERE country NOT IN ('USA') AND creditLimit > 125000;

SELECT customerName, creditLimit, country
FROM Customers
WHERE country NOT IN ('USA') AND creditLimit > 125000;


#What is the average price of Car type products?
SELECT *
FROM Products;

SELECT AVG(MSRP)
FROM Products
WHERE productLine REGEXP 'Car';


#What is the total quantity of product held in stock by the vendor Exoto Designs?

SELECT SUM(quantityInStock)
FROM Products
WHERE productVendor = 'Exoto Designs';


