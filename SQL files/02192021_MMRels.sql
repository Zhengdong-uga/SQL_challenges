#Based on the ClassicModels database

USE ClassicModels;

#List the customer name and the check numbers for the different checks they have written.
SELECT customerName, checkNumber
FROM Payments
JOIN Customers ON Customers.customerNumber = Payments.customerNumber;

SELECT customerName, checkNumber
FROM Customers
JOIN Payments ON Customers.customerNumber = Payments.customerNumber;

#List the last and first name of employees and the order numbers that they were sales representatives for.

SELECT *
FROM Customers;

SELECT lastName, firstName, orderNumber
FROm Employees
JOIN Customers ON Employees.employeeNumber = Customers.salesRepEmployeeNumber
JOIn Orders On Customers.customerNumber = Orders.customerNumber;



#Write a query to list the names of the customers and the order numbers for the orders they have placed if the 
#customer is from the USA or France.

SELECT customerName, orderNumber
FROm Customers
JOIN Orders On Customers.customerNumber = Orders.customerNumber
WHERE country = "USA" OR country = "France";


#Write a query to list the customers from the USA and the amount’s of the different check’s each 
#customer has written if the amount on the check is greater than 2000.

SELECT customerName, amount
FROM Payments
JOIN Customers ON Customers.customerNumber = Payments.customerNumber
WHERE country = "USA" AND amount > 2000;


#Write a query to list the office code, the country an office is in the name of the employee’s at the office. 
#Order the results in alphabetical order by country of the office.

SELECT Employees.officeCode, country, CONCAT(firstName, " ", lastName)
FROM Offices
JOIN Employees ON Offices.officeCode = Employees.officeCode
ORDER BY country;


#M-M Relationships

SELECT *
FROM Orders
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON Products.productCode = OrderDetails.productCode;




#Write a query to list out the names of customers and the names of the different products they have ordered.

SELECT DISTINCT customerName, productName
FROM Customers
JOIN Orders ON Customers.customerNumber = Orders.customerNumber
JOIN OrderDetails ON Orders.orderNumber = OrderDetails.orderNumber
JOIN Products ON Products.productCode = OrderDetails.productCode
ORDER BY customerName, productName;


