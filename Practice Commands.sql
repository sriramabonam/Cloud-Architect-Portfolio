SELECT * FROM Customers;
SELECT CustomerName, City FROM Customers;
SELECT * FROM Customers
WHERE Country='Mexico';
SELECT * FROM Customers
WHERE CustomerID=2;
SELECT * FROM Customers
WHERE City='Berlin' OR City='München';
SELECT * FROM Customers
ORDER BY Country DESC;
SELECT * FROM Customers
ORDER BY Country, CustomerName;
SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL;
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;
UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico';
UPDATE Customers
SET ContactName='Juan';
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';
SELECT * FROM Customers
LIMIT 3;
SELECT * FROM Customers
WHERE ROWNUM <= 3;
SELECT TOP 50 PERCENT * FROM Customers;
SELECT TOP 3 * FROM Customers
WHERE Country='Mexico';
SELECT top 3 * FROM Customers
WHERE Country='Norway';
SELECT * FROM Customers
WHERE Country='Germany' AND ROWNUM <= 3;


