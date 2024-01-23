#Prepare a list of offices sorted by country, state, city. 
SELECT country, state, city 
FROM Offices
ORDER BY country, state, city;


#How many employees are there in the company?

SELECT COUNT(employeeNumber)
FROM Employees;

#List the product lines that contain 'Cars'.

SELECT productLine
FROM ProductLines
WHERE productLine REGEXP 'Cars';

#Report total payments for October 28, 2004.

SELECT SUM(amount)
FROM Payments
WHERE MONTHNAME(paymentDate) = 'October' AND DAY(paymentDate) = 28
AND YEAR(paymentDate) = 2004;

#Report those payments greater than $100,000.
SELECT *
FROM Payments
WHERE amount > 100000;

#How many products in each product line?

SELECT COUNT(productName), productLine
FROM Products
GROUP BY productLine;

# What is the minimum payment received?

SELECT MIN(amount)
FROM Payments;


#List all payments greater than twice the average payment.

SELECT *
FROM Payments
WHERE amount > (SELECT 2*AVG(amount) FROM Payments);

#What are the names of executives with VP or Manager in their title? Use the CONCAT function to combine the employee's first name and last name into a single field for reporting.
SELECT CONCAT(firstName, ' ', lastName) AS 'Name'
FROM Employees
WHERE jobTitle REGEXP 'VP|Manager';

#Which orders have a value greater than $5,000?

SELECT orderNumber, SUM(quantityOrdered*priceEach)
FROM OrderDetails
GROUP BY orderNumber
HAVING SUM(quantityOrdered*priceEach) > 5000;


USE ClassicModels;

#List the order dates in descending order for orders 
#for the 1940 Ford Pickup Truck.

SELECT orderDate
FROM Orders
JOIN OrderDetails ON OrderDetails.orderNumber = Orders.orderNumber
JOIN Products ON Products.productCode = OrderDetails.productCode
WHERE productName = '1940 Ford Pickup Truck'
ORDER BY orderDate DESC;


#List the names of customers and their corresponding order number 
#where a particular order from that customer has a value greater than $25,000?

SELECT customerName, OrderDetails.orderNumber
FROM Customers
JOIN Orders ON Customer.customerNumber = Orders.customerNumber
JOIN OrderDetails ON OrderDetails.orderNumber = Orders.orderNumber
GROUP BY customerName, OrderDetails.orderNumber
HAVING SUM(quantityOrdered*priceEach) > 25000;


#List the names of products sold at less than 80% of the MSRP.

SELECT DISTINCT productName
FROM Products
JOIn OrderDetails on Products.productCode = OrderDetails.productCode
WHERE priceEach < 0.8*MSRP;


#Reports those products that have been sold with a markup of 100% or more 
#(i.e.,  the priceEach is at least twice the buyPrice)

SELECT DISTINCT productName
FROM Products
JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
WHERE priceEach >= buyPrice*2;

#List the products ordered on a Monday.
SELECT DISTINCT productName
FROM Products
JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
JOIN Orders ON Orders.orderNumber = OrderDetails.orderNumber
WHERE DAYOFWEEK(orderDate) = 2;

#What is the quantity on hand for products listed on 'On Hold' orders?

SELECT productName, quantityInStock
FROM Products
JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
JOIN Orders ON Orders.orderNumber = OrderDetails.orderNumber
WHERE status = 'On Hold';


#Report total payments for Atelier graphique.

SELECT SUM(amount)
FROM Payments
JOIN Customers ON Customers.customerNumber = Payments.customerNumber
WHERE customerName REGEXP 'Atelier graphique';


#Report the total payments by date (date of month)

SELECT DAY(paymentDate), SUM(amount)
FROM Payments
GROUP BY DAY(paymentDate)
ORDER BY DAY(paymentDate);

#Write a query to list out total payments made in each month of 2004.

SELECT MONTH(paymentDate), CONCAT( '$ ',ROUND(SUM(amount),2))
FROM Payments
WHERE YEAR(paymentDate) = 2004
GROUP BY MONTH(paymentDate)
ORDER BY MONTH(paymentDate);

#List the amount paid by each customer.

SELECT customerName, SUM(amount)
FROM Payments
JOIN Customers ON Customers.customerNumber = Payments.customerNumber
GROUP BY customerName;

#How many orders have been placed by Herkku Gifts?

SELECT COUNT(orderNumber)
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
WHERE customerName = 'Herkku Gifts';

#Who are the employees in Boston?
SELECT lastName, firstName, Offices.city
FROM Employees
JOIN Offices ON Employees.officeCode = Offices.officeCode
WHERE city = 'Boston';

#Report those payments greater than $100,000. 
#Sort the report so the customer who made the highest payment appears first.

SELECT customerName, amount
FROM Customers
JOIN Payments ON Customers.customerNumber = Payments.customerNumber
WHERE amount > 100000
ORDER BY amount DESC;

# List the value of 'On Hold' orders.
SELECT Orders.orderNumber, SUM(quantityOrdered*priceEach)
FROM OrderDetails
JOIn Orders ON Orders.orderNumber = OrderDetails.orderNumber
WHERE status = 'On Hold'
GROUP BY Orders.orderNumber;


#Report the number of orders 'On Hold' for each customer.

SELECT customerName, COUNT(*)
FROM Orders
JOIN Customers On Customers.customerNumber = Orders.customerNumber
WHERE status = 'On Hold'
GROUP BY customerName;


SELECT productName
FROM Products
WHERE productName REGEXP 'Ford|ford';

SELECT productName
FROM Products
WHERE productName REGEXP '[Ss]hip$';

SELECT country, COUNT(*)
FROM Customers
WHERE country IN ('Denmark','Norway','Sweden')
GROUP BY country;

SELECT productName
FROM Products
WHERE productName REGEXP 'S700_1[0-4][0-9]{2}';

SELECT *
FROM Employees
WHERE firstName REGEXP 'Dian';

SELECT *
FROM Products
WHERE productName REGEXP 'ship|boat|Ship|Boat';

SELECT *
FROM Products
WHERE productCode REGEXP '^S700' ;


SELECT productName
FROM OrderDetails 
JOIN Orders ON OrderDetails.orderNumber = Orders.orderNumber
JOIN Customers ON Orders.customerNumber = Customers.customerNumber
JOIN Products ON Products.productCode = OrderDetails.productCode 
WHERE customerName = 'Herkku Gifts';


SELECT CONCAT(firstName, ' ',lastName) AS Name, FORMAT(.05 * SUM(quantityOrdered * priceEach),0) AS Commission
FROM Employees 
JOIN Customers ON Employees.employeeNumber = Customers.salesRepEmployeeNumber
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
GROUP BY employeeNumber
ORDER BY lastName, firstName ASC;


SELECT FORMAT(SUM(quantityOrdered*priceEach),0) as orderValue FROM Orders JOIN OrderDetails
ON Orders.orderNumber = OrderDetails. orderNumber
AND YEAR(orderDate) = 2004
AND MONTH(orderDate) = 8;
