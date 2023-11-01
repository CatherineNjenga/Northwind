-- SELECT clause
SELECT *
FROM Employees

SELECT LastName, FirstName, HireDate,
		GETDATE() AS Date, DATEPART(MONTH, HireDate) AS HireMonth
FROM Employees

SELECT OrderID, UnitPrice, Quantity,
		(UnitPrice * Quantity) AS TotalValue
FROM [Order Details]

SELECT LastName, FirstName,
		DATENAME(MONTH, DATEADD(MONTH, DATEPART(MONTH, HireDate), 0) -1) AS HireMonth
FROM Employees

-- Concatenation
SELECT CONCAT(FirstName, ' ', LastName) AS EmployeeName
FROM Employees

SELECT FirstName + ' ' + LastName AS EmployeeName
FROM Employees

SELECT ProductID, ProductName,
		QuantityPerUnit, UnitPrice, UnitsInStock
FROM Products

SELECT CONCAT(FirstName, ' ' , LastName) AS EmployeeName,
		DATEPART(YEAR, HireDate) AS HireYear
FROM Employees

SELECT ProductName, UnitPrice, UnitsInStock,
		(UnitPrice * UnitsInStock) AS TotalValue
FROM Products

SELECT CONCAT(FirstName, ' ' , LastName) AS EmployeeName,
		DATENAME(MONTH, DATEADD(MONTH, DATEPART(MONTH, BirthDate), 0) -1) AS BirthMonth
FROM Employees

SELECT *
FROM Employees

-- WHERE clause and Conditions
SELECT CustomerID, ContactName, Country
FROM Customers

SELECT CustomerID, ContactName, Country
FROM Customers
WHERE Country = 'Brazil'

SELECT CustomerID, ContactName, Country
FROM Customers
WHERE Country <> 'Brazil'

SELECT CustomerID, ContactName, Country
FROM Customers
WHERE Country != 'Brazil'

SELECT CustomerID, ContactName, Country
FROM Customers
WHERE NOT Country <> 'Brazil'

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice > 60

-- % any number of any characters
SELECT CustomerID, ContactName, Country
FROM Customers
WHERE ContactName LIKE 'M%'

-- Caps insensitive
SELECT CustomerID, ContactName, Country
FROM CustomerS
WHERE ContactName LIKE '%M%'

SELECT CustomerID, ContactName, Country
FROM Customers
WHERE ContactName LIKE '%A%'

SELECT CustomerID, ContactName, Country
FROM Customers
WHERE ContactName LIKE '_a%'

-- IN operator compares an operand to a list of values. 
-- list of values must match the data type of the operand
SELECT ProductID, ProductName, UnitPrice, SupplierID
FROM Products
WHERE SupplierID IN (2, 4, 6, 8)

SELECT SupplierID, CompanyName, Region
FROM Suppliers
WHERE Region IN ('LA', 'MI', 'OR')

-- BETWEEN operator. Values must match the data type of the operand. It is inclusive
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 20 AND 30

SELECT LastName, FirstName
FROM Employees
WHERE LastName BETWEEN 'A' AND 'M'

-- Boolean. Multiple conditions in a WHERE clause combined with 'AND' and 'OR'.
-- Any condition can be negated with 'NOT'. Boolean expressions are not English

SELECT ProductName, SupplierID, CategoryID,
		UnitPrice, UnitsInStock
FROM Products
WHERE SupplierID = 1 AND CategoryID = 2 OR
		CategoryID = 3 AND UnitPrice > 20 OR
		UnitsInStock < 12

SELECT ProductName, SupplierID, CategoryID,
		UnitPrice, UnitsInStock
FROM Products
WHERE SupplierID = 1 AND (CategoryID = 2 OR
		CategoryID = 3 AND UnitPrice > 20) OR
		UnitsInStock < 12

SELECT CustomerID, CompanyName, Country
FROM Customers
WHERE Region <> 'U.S.A'

SELECT ProductName, UnitPrice, UnitsInStock,
		(UnitPrice * UnitsInStock) AS TotalValue
FROM Products
WHERE (UnitPrice * UnitsInStock) > 1000

SELECT ProductID, ProductName, QuantityPerUnit
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%'

-- Where CategoryID is an ODD number
SELECT ProductID, ProductName, UnitPrice, CategoryID
FROM Products
WHERE CategoryID IN (1, 3, 5, 7, 9)

SELECT OrderID, CustomerID, ShippedDate, ShipCountry
FROM Orders
WHERE ShippedDate BETWEEN '1996-12-01 00:00:00.000' AND '1997-01-31 00:00:00.000' 
		AND ShipCountry = 'Canada'

-- DISTINCT keyword. Count() function counts rows OR non-null values within a column
-- Count functions implodes(inward movement vs outward) the total rows to one value
SELECT COUNT(*)
FROM Customers

SELECT COUNT(Country)
FROM Customers

SELECT COUNT(DISTINCT Country)
FROM Customers

SELECT DISTINCT Country
FROM Customers

-- ORDER BY. Sort in SQL. Default: ASC, option: DESC
SELECT ProductName, UnitPrice
FROM Products
ORDER BY ProductName

SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC

SELECT ProductName, UnitPrice
FROM Products
ORDER BY 2 DESC

-- LIMIT/TOP  clause
SELECT TOP 5 ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC

SELECT ProductName, UnitPrice, UnitsInStock,
		(UnitPrice * UnitsInStock) AS TotalValue
FROM Products
WHERE (UnitPrice * UnitsInStock) > 1000
ORDER BY 2 DESC

SELECT TOP 1 ProductName, UnitPrice
FROM Products
ORDER BY 2

SELECT TOP 1 ProductName, UnitPrice
FROM Products
ORDER BY 2 DESC

SELECT ProductName, MAX(UnitPrice)
FROM Products
GROUP BY ProductName

SELECT DISTINCT ProductName
FROM Products

-- DATES and NULLS
SELECT GETDATE()

SELECT LastName, FirstName, BirthDate, HireDate
FROM Employees

-- Calculating age difference
SELECT EmployeeID, LastName, FirstName, DATEDIFF(YY, BirthDate, HireDate) AS HireAge,
		BirthDate, HireDate
FROM Employees

/*Date Functions
AGE
CURRENT_DATE
CURRENT_TIME
CURRENT_TIMESTAMP
EXTRACT
DATE_PART
DATE_TRUNC
NOW
TO_DATE
TO_TIMESTAMP
*/

SELECT CURRENT_TIMESTAMP

SELECT LastName, FirstName, CAST(DATEDIFF(YY, HireDate, GETDATE())AS CHAR)
FROM Employees

SELECT EmployeeID, LastName, FirstName, DATEPART(YEAR, HireDate) AS Age
FROM Employees

SELECT CAST('20221231' AS DATE)

-- NULLS. Presence of a null in a cell may affect calculations
-- A cell with null will not affect an average while that with a zero will.

SELECT ProductID, ProductName, Discontinued
FROM Products
WHERE Discontinued = '0'

UPDATE Products
SET Discontinued = NULL
WHERE Discontinued = '0'

SELECT ProductID, ProductName, Discontinued
FROM Products
WHERE Discontinued IS NULL

SELECT ProductID, ProductName, Discontinued
FROM Products
WHERE Discontinued IS NOT NULL

SELECT ProductID, ProductName, Discontinued
FROM Products
WHERE Discontinued IS NULL

SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS Emloyee,
		DATEDIFF(YY, BirthDate, HireDate) AS HireAge
FROM Employees

SELECT DATEDIFF(YY, '19851205', GETDATE())

SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS Emloyee,
		DATEDIFF(YY, BirthDate, HireDate) AS HireAge, HireDate
FROM Employees
WHERE DATEPART(YEAR, HireDate) = '1993'

SELECT ProductName, UnitPrice, UnitsInStock,
		(UnitPrice * UnitsInStock) AS TotalValue
FROM Products
WHERE (UnitPrice * UnitsInStock) > 1000
ORDER BY 2 DESC

SELECT TOP 1 ProductName, UnitPrice
FROM Products
ORDER BY 2 DESC

-- List all the products with a price greater than 1000
SELECT ProductName, UnitPrice, UnitsInStock,
		(UnitPrice * UnitsInStock) AS TotalValue
FROM Products
WHERE (UnitPrice * UnitsInStock) > 1000
ORDER BY 2 DESC

-- A product priced at 20 as the first listed item
SELECT ProductName, UnitPrice, UnitsInStock
FROM Products
WHERE UnitPrice BETWEEN 10 AND 20
ORDER BY UnitPrice DESC

-- A product with a quantity per unit in 'bottle' will not be included in the table out
SELECT ProductName, UnitPrice, UnitsInStock,
		QuantityPerUnit
FROM Products
WHERE QuantityPerUnit LIKE '%bottles%'
ORDER BY UnitPrice

-- An employee with lastname Aaron will appear since satisfies the condition of the btween operator
SELECT LastName, FirstName
FROM Employees
WHERE LastName BETWEEN 'A' AND 'M'
ORDER BY 2 DESC

SELECT EmployeeID, LastName, FirstName,
		CAST(DATEDIFF(YEAR, BirthDate, HireDate) AS CHAR) AS HireAge
FROM Employees

-- Extracting the month part of the employees hire month.
SELECT EmployeeID, LastName, FirstName,
		DATEPART(MONTH, HireDate) AS HireMonth
FROM Employees

-- GROUP functions
SELECT COUNT(*) AS StaffSize
FROM Employees

SELECT COUNT(DISTINCT Country) AS Countries
FROM Customers

SELECT SUM(UnitsInStock) AS Inventory
FROM Products

SELECT MAX(UnitPrice) AS HighPrice
FROM Products

SELECT MIN(UnitPrice) AS LowPrice
FROM Products

SELECT AVG(UnitPrice) AS AveragePrice
FROM Products

SELECT CAST(ROUND(AVG(unitprice), 2, 1) AS CHAR) AS AveragePrice
FROM Products

SELECT COUNT(*) AS StaffSize
FROM Employees

SELECT COUNT(EmployeeID) AS StaffSize
FROM Employees

SELECT OrderID, SUM(UnitPrice) AS TotalPrice,
		SUM(Quantity) AS TotalQuantity 
FROM [Order Details]
WHERE OrderID IN (10248, 10249, 10250, 10251)
GROUP BY OrderID

-- How many customers does Northwind have in each country
SELECT Country, COUNT(CustomerID) AS Total
FROM Customers
GROUP BY Country

-- What is the average product price for each supplier?
SELECT SupplierID, CAST(AVG(UnitPrice) AS CHAR) AS AveragePrice
FROM Products
GROUP BY SupplierID
ORDER BY AveragePrice

-- From which supplier does Northwind carry the most inventory
SELECT TOP 1 SupplierID, SUM(UnitsInStock) AS TotalInventory
FROM Products
GROUP BY SupplierID
ORDER BY TotalInventory DESC

-- In which countries does Northwinds have more than five customers?
SELECT country, COUNT(CustomerID) AS CustomerNumbers
FROM Customers
GROUP BY Country HAVING COUNT(CustomerID) > 5
ORDER BY CustomerNumbers DESC
-- WHERE clause gives you a subset of rows from your input table
-- HAVING clause gives you a subset of rows from your grouped interim table

-- Misuse of resources since by default the rows are group by each row in the column for the entire table
SELECT OrderID, UnitPrice, Quantity
FROM [Order Details]
--GROUP BY OrderID, UnitPrice, Quantity

-- List the total (unitprice * quantity) as TotalValue by orderid for the top 5 orders
SELECT TOP 5 OrderID, SUM(UnitPrice * Quantity) AS TotalValue
FROM [Order Details]
GROUP BY OrderID
ORDER BY TotalValue DESC

-- How many products does Northwinds have in inventory
SELECT COUNT(ProductID)
FROM Products
WHERE UnitsInStock <> 0

-- How many products are out of stock
SELECT COUNT(ProductID)
FROM Products
WHERE UnitsInStock = 0

-- From which supplier(s) does Northwind carry the fewest products?
SELECT SupplierID, COUNT(ProductID) AS ProductsTotal
FROM Products
GROUP BY SupplierID
ORDER BY ProductsTotal

-- Which Northwinds employees had over 100 orders?
SELECT EmployeeID, COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY EmployeeID HAVING COUNT(OrderID) > 100
ORDER BY TotalOrders DESC

-- Find the productID, name and unit price of the highest priced product Northwinds sells
SELECT TOP 1 ProductID, ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC

-- Find the customerID, and OrderID for all orders with more than 100 units sold
SELECT CustomerID, OrderID
FROM Orders
WHERE OrderID IN (SELECT OrderID
				  FROM [Order Details]
                  WHERE Quantity > 100)
ORDER BY CustomerID

-- List each product name and total value of that product's orders
SELECT ProductName, (SELECT SUM(UnitPrice * Quantity)
					 FROM [Order Details]
					 --WHERE ProductID = 1
					 WHERE [Order Details].ProductID = Products.ProductID) AS Total
FROM Products

-- Create a list of all orders with fewer than 100 items sold
SELECT OrderID, SUM(Quantity) AS Total
FROM [Order Details]
GROUP BY OrderID HAVING SUM(Quantity) < 100
ORDER BY OrderID

SELECT OrderID
FROM (SELECT OrderID, SUM(Quantity) AS Total
	  FROM [Order Details]
	  GROUP BY OrderID HAVING SUM(Quantity) < 100) AS DetailCount
-- The subquery must have an alias name

/*
	Co-Related SubQuery
	Special type of subquery
	The inner query references a value from the outer query
	The inner query is executed each time the outer query returns another row
	Can yield performance issues
*/
-- Select all the employees where the employee has orders shipped to customers in the 
-- employee's own home city
SELECT EmployeeID, OrderID, ShipCity, CustomerID
FROM Orders
WHERE EmployeeID IN (SELECT EmployeeID
					FROM Employees 
					WHERE Employees.City = Orders.ShipCity)

-- List the productID, productname, unitprice of the lowest priced product Nortwinds sells
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MIN(UnitPrice)
					FROM Products)

-- How many orders in the orders table have a bad customerID(either missing or not on file in the customers table)
SELECT COUNT(OrderID)
FROM Orders
WHERE NOT CustomerID IN (SELECT CustomerID
					 FROM Customers)
					 
-- List customers names whose shipped dates are null
SELECT COUNT(CustomerID)
FROM (SELECT customerID
	 FROM Orders
	 WHERE ShippedDate IS NULL) AS OrdersNotShipped

-- List the customers and their order counts
--SELECT CustomerID, (SELECT COUNT(OrderID)
					--FROM Orders
					
--FROM Customers

-- Provide a listing showing Northwinds employees and a count of each employee's orders sorted from highest to lowest
SELECT E.EmployeeID, LastName, FirstName, COUNT(OrderID) AS TotalOrders
FROM Employees E
JOIN Orders O ON O.EmployeeID = E.EmployeeID
GROUP BY E.EmployeeID, LastName, FirstName
ORDER BY TotalOrders DESC

-- List each order and its TotalValue(unitprice*quantity) for all orders shipping into France in descending Total Value order
SELECT O.OrderID, SUM(UnitPrice * Quantity) TotalValue
FROM Orders O, [Order Details] OD
WHERE ShipCountry = 'France' AND O.OrderID = OD.OrderID
GROUP BY O.OrderID
ORDER BY TotalValue DESC


-- Create a suppliers list showing supplier company name, and names of all the products sold by each supplier located in Japan
SELECT CompanyName, ProductName
FROM Suppliers S, Products P
WHERE S.SupplierID = p.SupplierID AND S.Country = 'Japan'

-- Create a 'Low Performers' list showing the employees who have less than $100,000 in total sales.
-- List the employee's lastname, firstname followed by their total sales volume(the total dollar value of their orders)

SELECT LastName, FirstName, SUM(OD.UnitPrice * OD.Quantity) TotalSales
FROM Employees E, Orders O, [Order Details] OD
WHERE E.EmployeeID = O.EmployeeID AND O.OrderID = OD.OrderID 
GROUP BY LastName, FirstName HAVING SUM(OD.UnitPrice * OD.Quantity) < 100000

-- Create a report showing the top five employees in sales dollar volume
SELECT TOP 5 LastName, FirstName, SUM(OD.UnitPrice * OD.Quantity) TotalSales
FROM Employees E
	JOIN 
	Orders O ON  E.EmployeeID = O.EmployeeID
		JOIN 
		[Order Details] OD ON O.OrderID = OD.OrderID
GROUP BY LastName, FirstName
ORDER BY TotalSales DESC

-- Left Outer Join
SELECT LastName, FirstName, COUNT(OrderID) AS OrderTotal
FROM Employees E LEFT OUTER JOIN
		Orders O
			ON E.EmployeeID = O.EmployeeID
GROUP BY LastName, FirstName
ORDER BY OrderTotal DESC

-- Right Outer Table
SELECT LastName, FirstName, COUNT(OrderID) AS OrderTotal
FROM Employees E RIGHT OUTER JOIN
		Orders O
			ON E.EmployeeID = O.EmployeeID
GROUP BY LastName, FirstName
ORDER BY OrderTotal DESC

-- Are there any orders in the Orders table that have an invalid reference to a Northwinds customer?
SELECT DISTINCT O.CustomerID
FROM Orders O LEFT OUTER JOIN
		Customers C
		ON	C.CustomerID = O.CustomerID
WHERE C.CustomerID = NULL

SELECT COUNT(CustomerID)
FROM Customers

SELECT COUNT(DISTINCT CustomerID)
FROM Orders

SELECT CustomerID
FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID
							FROM Orders)

-- How many orders are there?
SELECT COUNT(OrderID)
FROM Orders O INNER JOIN 
		Customers C
		ON O.CustomerID =  C.CustomerID

SELECT COUNT(OrderID)
FROM Orders O RIGHT OUTER JOIN 
		Customers C
		ON O.CustomerID =  C.CustomerID

-- Are there any Northwinds employees that have no orders?
SELECT LastName, FirstName, COUNT(OrderID) AS TotalOrders
FROM Employees E LEFT OUTER JOIN
		Orders O
		ON E.EmployeeID = O.EmployeeID
GROUP BY LastName, FirstName
HAVING COUNT(OrderID) = 0

-- Are there any Northwind customers that have no orders?
SELECT C.CustomerID, CompanyName, COUNT(OrderID) AS TotalOrders
FROM Customers C LEFT OUTER JOIN
		Orders O
		ON C.CustomerID= O.CustomerID
GROUP BY C.CustomerID, CompanyName 
HAVING COUNT(OrderID) = 0

-- Are there any Northwind order that have bad(not on file) customer numbers?
SELECT O.CustomerID, COUNT(OrderID) AS TotalOrders
FROM Orders O LEFT OUTER JOIN
		Customers C
		ON C.CustomerID= O.CustomerID
WHERE C.CustomerID IS NULL
GROUP BY O.CustomerID

SELECT *
FROM Orders

-- Are there any shippers that have shipped no Northwind orders?
SELECT CompanyName, COUNT(OrderID) AS TotalOrders
FROM Shippers S LEFT OUTER JOIN
		Orders O
		ON S.ShipperID= O.ShipVia
GROUP BY CompanyName
SELECT *
FROM Orders
DROP TABLE IF EXISTS Items
CREATE TABLE Items 
(
	itemID integer primary key,
	itemcode varchar(5) NULL,
	itemname varchar(40) NOT NULL DEFAULT ' ',
	quantity integer NOT NULL DEFAULT 0,
	price decimal (9,2) NOT NULL DEFAULT 0
)

INSERT INTO Items
SELECT ProductID, CONCAT(SupplierID, CategoryID, Discontinued),
		ProductName, UnitsInStock, UnitPrice
FROM Products

SELECT *
FROM Items

-- Table Constraints
DROP TABLE IF EXISTS Goods

CREATE TABLE Goods
(
	itemID INT NOT NULL,
	supplierID INT NOT NULL,
	itemname VARCHAR(40) NOT NULL DEFAULT ' ',
	quantity INT NOT NULL DEFAULT 0,
	price DECIMAL(9,2) CHECK (price < 1000),
	PRIMARY KEY (itemID),
	CONSTRAINT fk_supplier FOREIGN KEY(supplierid)
			REFERENCES suppliers(supplierid)
			ON DELETE NO ACTION
)

INSERT INTO Goods
SELECT ProductID, SupplierID, ProductName, UnitsInStock, UnitPrice
FROM Products

SELECT *
FROM Goods
ORDER BY 2 DESC

-- Duplicate primary key
INSERT INTO Goods VALUES
(77, 29, 'Jiffy Peanut Butter', 12, 1.89)

-- Bad Foreign Key
INSERT INTO Goods VALUES
(78, 30, 'Jiffy Peanut Butter', 12, 1.89)

--Attempt to delete a supplier(with children)
DELETE FROM Suppliers
WHERE SupplierID = 27
