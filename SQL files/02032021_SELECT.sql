# All database names, table names, column names
# are case sensitive.
#SQL commands are NOT case sensitive

#USE - statement that allows us to pick the database
#we want to work with
USE mist4000;

#SELECT - retrieve data from a table

SELECT * # * symbol indicates that you want all the columns
FROM Customers;

#Picking specific columns
SELECT customerName, phone
FROM Customers;
