#Date - 01/29/2021

#USING A DATABASE 

USE Text; #This is my database. You guys will have to use your own databases by using the command 'USE ps_myid'

# CREATE A TABLE

CREATE TABLE Student(
	studentID INT,
    firstName VARCHAR(45),
	lastName VARCHAR(45),
	gpa	DECIMAL(3,2),
    PRIMARY KEY(studentID)
);

SELECT * FROM Student;

# INSERT DATA INTO A TABLE

INSERT INTO Student
VALUES(811246990,'PKumar','Sachin',3.89); 

INSERT INTO Student
VALUES(811246991,'Tanner','Skoussen',3.92);

INSERT INTO Student
VALUES(811246880,'Emett','Skoussen',4.0);

INSERT INTO Student
VALUES(811246880,'Emett','Skoussen',4.0);

INSERT INTO Student
VALUES(811246992,'John','Doe',3.5);

INSERT INTO Student
VALUES(811246993,'Jack','Ryan',3.5);

# SELECT FROM TABLES 

Select * From Student;

USE Text;
# SELECT SPECIFIC COLUMNS FROM TABLES 
# Format for Select queries: SELECT columnNames FROM TABLEName WHERE condition;

SELECT * FROM emp;

SELECT empno,empfname FROM emp;


# SELECT SPECIFIC COLUMNS AND ROWS
#Give me name and empno of employees who earn more than 50000

SELECT empno,empfname 
FROM emp 
WHERE empsalary > 50000;

#Give me the name, empno and department of employees who work for the marketing department

SELECT empfname,empno,deptname
FROM emp
WHERE deptname = "Marketing";

#Give me the empno, names of employees who work in marketing and make more than 30000

SELECT empno,empfname,empsalary,deptname
FROM emp 
WHERE deptname = 'Marketing' AND empsalary > 30000;

#Give me the empno,empfname of employees who earn more than 40000 or work for marketing department

SELECT empno,empfname,empsalary,deptname
FROM emp 
WHERE deptname = 'Marketing' OR empsalary > 40000;


#Date - 02/01/2021

#List of donors

seLEct * FROM donor;

#Give me names of donors from georgia

SELECT * 
FROM donor 
WHERE dstate = 'GA';

#Give me names of donors from georgia or south carolina

SELECT * 
FROM donor 
WHERE dstate = 'GA' OR dstate = 'SC';


#Give me the names of donors from southern states (IN Keyword)

SELECT dfname,dlname,dstate
FROM donor
WHERE dstate IN ("GA",'NC','AK','FL');

# NOT IN

SELECT dfname,dlname,dstate
FROM donor
WHERE dstate NOT IN ("GA",'NC','AK','FL');

# SELECT ON PK

SELECT * 
FROM donor 
where donorno IN (101,103,105,107,113);


# ORDERING RESULTS

SELECT empno,empfname,empsalary
FROM emp
ORDER BY empsalary;

#Class Quiz - GIVE ME employees working in marketing department and order their salaries in
#in descending order



# CALCULATIONS 

#What is the total value of shares outstanding for each share

SELECT shrfirm,shrprice*shrqty AS 'Total Value of Shares'
FROM share;

#Who earns the most salary in our company

SELECT max(empsalary)
FROM emp;

#Give me max salary for marketing department

SELECT max(empsalary)
FROM emp;

#Built-in Function (Max,Min,avg,count)

SELECT COUNT(*) AS 'Number of Employees in Marketing'
FROM emp 
WHERE deptname = 'Marketing';

#Date 02/04/2021

# SUBQUERIES 

SELECT AVG(quantityOrdered)
FROM OrderDetails; #35.2190

SELECT * FROM OrderDetails
WHERE quantityOrdered > 35.2190;

#or we can write 

SELECT  orderNumber,quantityOrdered
FROM OrderDetails
WHERE quantityOrdered > (SELECT AVG(quantityOrdered) FROM OrderDetails)
ORDER BY quantityOrdered;

# REGULAR EXPRESSIONS 

SELECT firstName
FROM Employees
WHERE f = 'Mary';

#Or we can write the following command 

SELECT * 
FROM Employees
WHERE firstName REGEXP 'Mary|Jeff|Harry';

SELECT * 
FROM Employees
WHERE firstName REGEXP 'Mary|Jeff|Harry';

SELECT * 
FROM Employees
WHERE firstName REGEXP '^J';

SELECT * 
FROM Employees
WHERE firstName REGEXP 'y$';


# DISTINCT 

SELECT DISTINCT(productName)
FROM Products;

# BETWEEN 

SELECT productCode,productName
FROM Products
WHERE quantityInStock BETWEEN 0 AND 100;


#DELETE

SELECT * FROM Products
WHERE productName REGEXP 'Ferrari';

DELETE FROM Products 
WHERE productName REGEXP 'Ferrari';

#UPDATE

SELECT productName,quantityInStock FROM Products
where productCode = 'S12_1099';

UPDATE Products
SET quantityInStock = 268
WHERE productCode = 'S12_1099';

#FINISH
