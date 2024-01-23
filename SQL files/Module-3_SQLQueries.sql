#One-Many Relationships

CREATE TABLE Faculty(
	facultyID INT,
    fName VARCHAR(25),
    lName VARCHAR(25),
    department VARCHAR(45),
    phoneNumber VARCHAR(12),
    PRIMARY KEY(facultyID)
);

CREATE TABLE Course(
	crn INT,
    courseName VARCHAR(45),
    enrollment INT,
    facultyID INT,
    PRIMARY KEY(crn),
    CONSTRAINT CourseHasFaculty FOREIGN KEY(facultyID) REFERENCES Faculty(facultyID) ON DELETE RESTRICT

);

Create table if not exists Nation(
natCode varchar(3) Not Null,
natName varchar(45),
exchRate decimal(3,2),
primary key(natCode)
);

Create table if not exists Stock(
stkCode varchar(2) Not Null,
stkName varchar(45),
stkPrice decimal(7,2),
natCode varchar(3),
primary key(stkCode),
CONSTRAINT NationHasStock FOREIGN KEY(natCode) REFERENCES Nation(natCode) ON DELETE RESTRICT
);


Create table Nation(
natCode varchar(3),
natName varchar(45),
exchRate decimal(3,2),
primary key(natCode)
);


Create table Stock(
stkCode varchar(3),
stkName varchar(45),
stkPrice decimal(7,2),
natCode varchar(3),
primary key(stkCode),
CONSTRAINT NationHasStock FOREIGN KEY(natCode) REFERENCES Nation(natCode) ON DELETE RESTRICT
);


#Inserting Data

Select * From Stock;
Select * From Nation;

SELECT *
FROM Stock Join Nation;




#JOIN TABLES

SELECT *
FROM Stock Join Nation
ON Stock.natCode = Nation.natCode;

USE ClassicModels;

Select * From Orders;
Select * From Customers;



SELECT *
FROM Stock Join Nation
ON Stock.natCode = Nation.natCode;





#Name the customer who ordered order number 10100?



SELECT *
FROM Orders;

SELECT *
FROM Customers;


SELECT customerName 
FROM Customers 
WHERE orderNumber = 10100;


SELECT customerName
FROM Customers JOIN Orders
ON Customners.customerNumber = Orders.customerNumber
WHERE orderNumber = 10100;




#List CustomerName who have made at least one order

SELECT customerName AS 'Customers who made at least one order'
FROM Customers
WHERE customerNumber IN (SELECT distinct(customerNumber) FROM Orders);

#Which customers did not order anything? 


SELECT distinct(customerNumber) as 'Made an Order'
FROM Orders;

SELECT customerNumber
FROM Customers;

SELECT customerName
FROM Customers 
WHERE customerNumber NOT IN (SELECT distinct(customerNumber) FROM Orders);

SELECT orderNumber
FROM Orders
WHERE customerNumber = 168;

SELECT count(distinct(orderNumber))
FROM Orders;

SELECT * FROM Orders;








SELECT DISTINCT(customerName)
FROM Customers JOIN Orders
ON Customers.customerNumber = Orders.customerNumber
WHERE Customers.customerNumber = 114;


#LIST CustomerNames who have made a payment of more than 10000 dollars.

SELECT customerName,amount
FROM Customers JOIN Payments
ON Customers.customerNumber = Payments.customerNumber
WHERE amount > 10000;







Select customerName, checkNumber
From Payments Join Customers
On Payments.customerNumber = Customers.customerNumber;

#GROUP BY CLAUSE

#Example-1 How many customers in each country





SELECT country,count(country) as 'Number of Customers'
FROM Customers
group by country;


#What is the average payment made by each customer 
#Hint - Join as well as group by




SELECT country,count(country)
FROM Customers
GROUP BY country;

#Example-2 Select the product with the maximum MSRP in each productline

SELECT productLine,max(MSRP)
FROM Products
GROUP BY productLine;



Select productLine,max(MSRP)
From Products
GROUP BY productLine;

#Example-3 How many orders by each customer

SELECT customerNumber,count(customerNumber)
FROM Orders 
GROUP BY customerNumber;

SELECT customerNumber,OrderNumber
FROM Orders
ORDER BY customerNumber;


SELECT Customers.customerNumber,customerName,count(Customers.customerNumber) as 'Number of Orders'
FROM Orders JOIN Customers
ON Orders.customerNumber = Customers.customerNumber
GROUP BY customerNumber
ORDER BY count(Customers.customerNumber) DESC;

#HAVING CLAUSE 

Select productLine,sum(quantityInStock)
From Products
GROUP BY productLine
HAVING sum(quantityInStock) < 50000;


#CORRELATED SUBQUERY

#Regular Subquery Select product Names whose quantityinstock is greater than the average quantityinstock 

SELECT productName,quantityInStock
FROM Products 
WHERE quantityInStock > (SELECT avg(quantityInStock) FROM Products);

#Example-4 
#SELECT Product Names whose quantity in stock is greater than the average quantity in stock in its specific productLine

SELECT productLine,avg(quantityInStock)
FROM Products
GROUP BY productLine;

SELECT productLine,productName,quantityInStock
FROM Products 
WHERE quantityInStock > (SELECT avg(quantityInStock) FROM Products WHERE productLine = 'Planes')
AND productLine = 'Planes';



SELECT productLine,productName,quantityInStock
FROM Products P
WHERE P.quantityInStock > (SELECT avg(quantityInStock) FROM Products Q where Q.productLine = P.productLine)
ORDER BY productLine;




#VIEWS

CREATE VIEW userView(CustomerName,ContactLastName,ContactFirstName)
AS
SELECT customerName,contactLastName,contactFirstName 
FROM Customers;

USE ps_ps63828;

CREATE VIEW userView(firstName,lastName,major)
AS
SELECT firstName,lastName,major 
FROM Student;












