create table Customers (
CustomerID int primary key,
CustomerName Varchar (50),
Region Varchar (100)
);
create table Orders(
OrderID int primary key,
CustomerID Int,
OrderDate data,
SalesAmount Decimal  (10,2)
);
create table Products (
ProductID int primary key,
ProductName Varchar (50),
Price decimal (10,2)
);
Create table OutOfStock (
ProductID int primary key,
ProductName varchar
);
Create table DiscontinuedProducts(
ProductID int primary key,
ProductName  Varchar (50)
);
create table Employees (
EmployeesID int primary key,
Name varchar (50),
Age int,
salary Decimal (10,2)
);
create table Sales(
SaleID int primary key,
Region varchar (50),
SalesAmount Decimal (10,2)
);

INSERT INTO Customers (CustomerID, CustomerName, Region) VALUES
(1, 'Иван Иванов', 'Север'),
(2, 'Мария Смирнова', 'Юг'),
(3, 'Алексей Петров', 'Запад'),
(4, 'Ольга Сидорова', 'Восток');


INSERT INTO Orders (OrderID, CustomerID, OrderDate, SalesAmount) VALUES
(101, 1, '2024-03-01', 500.00),
(102, 1, '2024-03-05', 150.00),
(103, 2, '2024-03-10', 300.00),
(104, 3, '2024-03-15', 200.00),
(105, 4, '2024-03-20', 450.00);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Ноутбук', 1200.00),
(2, 'Смартфон', 800.00),
(3, 'Планшет', 400.00),
(4, 'Часы', 150.00);

INSERT INTO OutOfStock (ProductID, ProductName) VALUES
(2, 'Смартфон'),
(4, 'Часы');

INSERT INTO DiscontinuedProducts (ProductID, ProductName) VALUES
(3, 'Планшет');

INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department) VALUES
(1, 'Петр Васильев', 30, 5500.00, 'IT'),
(2, 'Анна Козлова', 24, 6200.00, 'HR'),
(3, 'Дмитрий Соколов', 40, 7000.00, 'Sales'),
(4, 'Екатерина Орлова', 22, 4800.00, 'HR');

INSERT INTO Sales (SaleID, Region, SalesAmount) VALUES
(1, 'Север', 1000.00),
(2, 'Юг', 800.00),
(3, 'Запад', 1200.00),
(4, 'Восток', 950.00);


SELECT ProductName FROM Products
UNION
SELECT ProductName FROM OutOfStock;

SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM DiscontinuedProducts;

SELECT c.CustomerID, 
       c.CustomerName, 
       CASE 
           WHEN COUNT(o.OrderID) > 5 THEN 'Eligible'
           ELSE 'Not Eligible'
       END AS Eligibility
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

SELECT ProductName, Price,
       IIF(Price > 100, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;

SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID;

SELECT * 
FROM Employees
WHERE Age < 25 OR Salary > 6000;

SELECT Region, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY Region;

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate AS DateOfOrder
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

UPDATE Employees
SET Salary = Salary * 1.1
WHERE Department = 'HR';