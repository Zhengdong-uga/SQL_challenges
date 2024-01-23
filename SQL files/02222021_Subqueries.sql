USE ClassicModels;
#Write a query to list out the names of customers and the names of the 
#different products they have ordered.

SELECT DISTINCT customerName, productName
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON Products.productCode = OrderDetails.productCode;


#Write a query to list out the product vendor and the names of the different 
#customers they have shipped orders to.

SELECT DISTINCT productVendor, customerName
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON Products.productCode = OrderDetails.productCode
ORDER BY Products.productVendor;



#Write a query to list out the employee first and last name and those 
#customers they are sales rep’s for who are located in the same country as the office of the employee.

SELECT CONCAT(firstName, " ",lastName) AS EmployeeName,
	customerName AS CustomerName, Offices.country AS EmployeesCountry, Customers.country AS CustomersCountry
FROM Employees
JOIN Customers ON Employees.employeeNumber = Customers.salesRepEmployeeNumber
JOIN Offices ON Offices.officeCode = Employees.officeCode
WHERE Offices.country = Customers.country;


#Write a query to list out how many customers from the USA have placed 
#orders where the product name describes a “Pickup” of some kind.

SELECT COUNT(DISTINCT Customers.customerNumber)
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON Products.productCode = OrderDetails.productCode
WHERE productName REGEXP "Pickup" AND country = "USA";

SELECT productName
FROM Products
WHERE productName REGEXP "Pickup";

#Write a query to list out the number of orders in which a product from the 
#‘Planes’ product line is present.

SELECT COUNT(DISTINCT Orders.orderNumber)
FROM Orders
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON Products.productCode = OrderDetails.productCode
WHERE productLine REGEXP "Planes";

#Subqueries

#How many customers are from the USA?

SELECT COUNT(*)
FROM Customers
WHERE country = "USA";

#What percentage of customers are from the USA?

SELECT COUNT(*)
FROM Customers;

#Subquery in the SELECT

SELECT 100*COUNT(*)/(SELECT COUNT(*) FROM Customers) AS '% of USA Customers'
FROM Customers
WHERE country = "USA";

#Subquery in the FROM clause

SELECT AVG(customersCL)
FROM (SELECT customerName, creditLimit AS customersCL FROM Customers) AS aTable;


#Subquery in the WHERE clause

#Query to list names of customers who have a greater than avergae credit limit

SELECT customerName
FROm Customers
WHERE creditLimit > (SELECT AVg(creditLimit) FROM Customers);


#What percentage of products are ‘Classic Cars’ of the entire product inventory?

SELECT 100*COUNT(*)/(SELECT COUNT(*) FROM Products) AS 'Classic Cars percentage'
FROM Products
WHERE productLine = "Classic Cars";

SELECT 100*(SELECT COUNT(*) FROM Products WHERE productLine = "Classic Cars")/COUNT(*)
FROM Products;


#What percentage of the total sales volume is the the result of sales of products of
# type ‘Ships’ or ‘Planes’


SELECT 100*SUM(quantityOrdered*priceEach)/(SELECT SUM(quantityOrdered*priceEach) FROM OrderDetails)
FROM Products
JOIN OrderDetails ON Products.productCode = OrderDetails.productCode
WHERE productLine IN ("Ships","Planes");



