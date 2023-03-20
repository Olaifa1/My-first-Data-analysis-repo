USE AdventureWorks2019;



/*
Q1 - From the humanresources.employee table, 
write a query in SQL to retrieve all fields and records 
from the employee table in the adventure works database.
sort the result in ascending order of the job title.*/
FOR SORTING, USE THE ORDER BY THEN SPECIFY YOUR COLUMN OF CHOICE.



SELECT *
FROM humanresources.employee
ORDER BY [JobTitle] ASC


/*Q2 - From the person.person table, 
write a query in SQL to retrieve all fields and records 
from the employee table using table aliasing in the adventure works database.
sort the output in ascending order on last name.*/


SELECT *
FROM person.person AS PEOPLE
ORDER BY LastName ASC

/*Q3 - From the production.product table, 
write a query that displays the productid, name, and color columns.
display only the rows in which the colors is not blue.*/

SELECT ProductID, Name, Color
FROM production.product
WHERE Color <> 'Blue'

--OR
SELECT ProductID, Name, Color
FROM production.product
WHERE Color != 'Blue'

/*Q4 - From the person.person table,
write a query in SQL to return all rows and a subset of the columns 
(FirstName, LastName, businessentityid) 
from the person table in the AdventureWorks database. 
The third column heading is renamed to Employee_id. 
Arranged the output in ascending order by lastname. */

SELECT FirstName, LastName, BusinessEntityID AS Employee_id
FROM person.person
ORDER BY LastName ASC



/*Q5 -  From the sales.salesorderheader table 
write a query in SQL to return all rows 
from the salesorderheader table in Adventureworks database 
and calculate the percentage of tax on the subtotal as decided. 
Return salesorderid, customerid, orderdate, subtotal, percentage of tax column. 
Arranged the result set in ascending order on subtotal.*/

SELECT SalesOrderID, CustomerID, OrderDate, SubTotal, ((TaxAmt / SubTotal)* 100) AS [PERCENTAGE OF TAX]
FROM sales.salesorderheader
ORDER BY SubTotal ASC

/*Q6 - From the humanresources.employee table 
write a query in SQL to create a list of 
unique jobtitles in the employee table in Adventureworks database. 
Return jobtitle column and arranged the resultset in ascending order.*/

SELECT DISTINCT JobTitle
FROM humanresources.employee
ORDER BY JobTitle ASC


/*Q7 - From the sales.salesorderheader table 
write a query in SQL to calculate the total freight paid by each customer. 
Return customerid and total freight. 
Sort the output in ascending order on customerid.*/


SELECT CustomerID, SUM(Freight) AS [TOTAL FREIGHT]
FROM sales.salesorderheader
GROUP BY CustomerID
ORDER BY CustomerID ASC



/*Q8 - From the production.productinventory table,
write a query in SQL to retrieve total quantity of each productid 
which are in shelf of 'A' or 'C' or 'H'. 
Filter the results for sum quantity is more than 500. 
Return productid and sum of the quantity. 
Sort the results according to the productid in ascending order.*/

WHERE - ACTS AS A FILTER TO FOCUS ON A PARTICULAR DATA POINT.
HAVING - ACTS AS A WHERE CLAUSE FOR AGGREGATION

SELECT *
FROM production.productinventory

SELECT ProductID, SUM(QUANTITY) AS [SUM OF THE QUANTITY]
FROM production.productinventory
WHERE Shelf IN ('A', 'C', 'H')
GROUP BY ProductID
HAVING SUM(QUANTITY) > 500
ORDER BY ProductID ASC

--OR
SELECT ProductID, SUM(QUANTITY) AS [SUM OF THE QUANTITY]
FROM production.productinventory
WHERE Shelf = 'A' OR Shelf ='B' OR Shelf ='C' OR Shelf = 'H'
GROUP BY ProductID
HAVING SUM(QUANTITY) > 500
ORDER BY ProductID ASC

INLINE OR SINGLE LINE COMMENTS --
MULTILINE COMMENTS /* */
/*Q9 - From the production.productinventory table, 
write a query in SQL to find the sum of the quantity of all combination 
of group of distinct locationid and shelf column. 
Return locationid, shelf and sum of quantity as TotalQuantity.*/

SELECT *
FROM production.productinventory

SELECT DISTINCT LocationID, Shelf, SUM(QUANTITY) AS [TOTAL QUANTITY]
FROM production.productinventory
GROUP BY LocationID, Shelf
ORDER BY LocationID

/*Q10 - From the Person.BusinessEntityAddress table 
write a query in SQL to retrieve the number of employees for each City. 
Return city and number of employees. 
Sort the result in ascending order on city.*/
SELECT *
FROM Person.BusinessEntityAddress

SELECT *
FROM Person.Address

SELECT CITY, COUNT(BusinessEntityID) AS [NO OF EMPLOYEES]
FROM Person.BusinessEntityAddress
JOIN Person.Address
ON Person.Address.AddressID = Person.BusinessEntityAddress.AddressID
GROUP BY City
ORDER BY City

--0R
SELECT COUNT(BusinessEntityID) AS [NO OF EMPLOYEES], CITY
FROM Person.BusinessEntityAddress
JOIN Person.Address
ON Person.Address.AddressID = Person.BusinessEntityAddress.AddressID
GROUP BY City
ORDER BY City

--SQL JOINS
ALLOW YOU TO BE ABLE TO GET DATA FROM ONE TABLE INTO ANOTHER TABLE BASED ON A COMMON COLUMN

INNER JOIN
OUTER (RIGHT & LEFT JOIN)
FULL JOIN
CROSS JOIN



--USING THE INNER JOIN
SELECT COUNT(BusinessEntityID)  [NO OF EMPLOYEES], CITY
FROM Person.BusinessEntityAddress
INNER JOIN Person.Address
ON Person.Address.AddressID = Person.BusinessEntityAddress.AddressID
GROUP BY City
ORDER BY City

SELECT PP.BusinessEntityID, FirstName, LastName, City
FROM Person.BusinessEntityAddress PBEA
INNER JOIN Person.Address PA
ON PA.AddressID = PBEA.AddressID
INNER JOIN Person.Person PP
ON PP.BusinessEntityID = PBEA.BusinessEntityID
ORDER BY City


select *
from person.Person
--USING THE LEFT JOIN
 