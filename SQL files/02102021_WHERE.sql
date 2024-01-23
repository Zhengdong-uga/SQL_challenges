USE mist4000;

#WHERE - allows us to pick the rows - row conditions

SELECT customerName, creditLimit
FROM Customers
WHERE country = 'USA';

SELECT customerName, creditLimit
FROM Customers
WHERE country != 'USA';

#AND

SELECT customerName, creditLimit
FROM Customers
WHERE country = "USA" AND creditLimit > 50000;

#OR

SELECT customerName, creditLimit, country
FROM Customers
WHERE country = "Canada" OR country = "USA";

#Get me customers from USA, Canada and Australia

SELECT customerName, creditLimit
FROM Customers
WHERE country ="Canada" OR country = "USA" OR country = "Australia";

#IN

SELECT customerName, creditLimit
FROM Customers
WHERE country IN ("Canada","USA","Australia");

SELECT customerName, creditLimit
FROM Customers
WHERE country IN ("Canada");

#NOT
SELECT customerName, creditLimit, country
FROM Customers
WHERE country NOT IN ("Canada","USA","Australia");

#List customer name and credit limit for customers whose credit limit
#is between 50 and 75 thousand.

SELECT customerName, creditLimit
FROm Customers
WHERE creditLimit > 50000 AND creditLimit < 75000;

#BETWEEN

SELECT customerName, creditLimit
FROm Customers
WHERE creditLimit BETWEEN 50000 AND 75000;

#List out the names of customers who are not from 
#Germany or USA and have a credit limit  less than $50K.

SELECT customerName
FROM Customers
WHERE country NOT IN ("Germany","USA") AND creditLimit < 50000;

SELECT customerName
FROM Customers
WHERE (country != "USA" AND country != "Germany") AND creditLimit < 50000;

#List out products that are of the type Planes or Ships 
#that whose retail price is greater than $30 and have a 
#product scale of either 1:18 or 1:72.

SELECT productLine, productName
FROM Products
WHERE productLine IN ("Planes","Ships") AND MSRP > 30 
	AND productScale IN ("1:18","1:72");



#List the car name and mpg for cars from the model year 
#70 and the USA and where the horsepower is between 100 and 150.

SELECT Car, MPG
FROM cars
WHERE Model = 70 AND Origin = "US" AND Horsepower BETWEEN 100 AND 150;


#REGEXP

SELECT customerName
FROM Customers
WHERE customerName REGEXP 'toy';


SELECT customerName
FROM Customers
WHERE customerName REGEXP 'toy|gift';

SELECT *
FROM Customers
WHERE customerName REGEXP '^S';

SELECT *
FROM Customers
WHERE customerName REGEXP "es$";
