USE mist4000;

#MAC - Command + Enter
#WINDOWS - Control + Enter

SELECT *
FROM Customers;

#PE1
#List out the names of customers and their phone numbers.

SELECT customerName, phone
FROM Customers;

#List out the product line and name of the product.

SELECT productLine, productName
FROM Products;

#List out the region of origin and the name of the car.

SELECT *
FROM cars;

SELECT Origin, Car
FROM cars;


SELECT *
FROM Customers;

#DISTINCT - eliminate the duplicate rows

SELECT DISTINCT country
FROM Customers;

SELECT DISTINCT city, country
FROM Customers;

#List out the different product lines. 

SELECT DISTINCT productLine
FROM Products;

#List out the different countries that customers are based in.

SELECT DISTINCT country
FROM Customers;

#List out the different model years for cars. 

SELECT DISTINCT Model
FROM cars;

#List out all the different cities and countries that customers are located in.

SELECT DISTINCT city, country
FROM Customers;

#List out the origin region and the different model years in that region.

SELECT DISTINCT Origin, Model
FROM cars;


#ORDER BY - Orders the resulting rows returned based on column
#Default ordering is ascending, adding DESC flips it to descending order

SELECT customerName
FROM Customers
ORDER BY customerName DESC;

SELECT customerName, country
FROM Customers
ORDER BY country DESC, customerName;


#List out the customer names and their credit limits in descending order.

SELECT customerName, creditLimit
FROM Customers
ORDER BY creditLimit DESC;

#List the names of products, their product line and their MSRP in alphabetical order 
#by product line and from highest to lowest of MSRP.

SELECT productName, productLine, MSRP
FROM Products
ORDER BY productLine, MSRP DESC;

#List out the different cities and countries that customers are located in 
#alphabetical order of cities and reverse alphabetical order of countries.

SELECT city, country
FROM Customers
ORDER BY country DESC, city ASC;

