
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(100),
    LoyaltyStatus VARCHAR(20)
);

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    EmployeeID INT,
    ProductID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    JobTitle VARCHAR(50)
);

CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT,
    Price DECIMAL(10, 2),
    Rating INT,
    IsDiscontinued BIT
);

CREATE TABLE Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(100)
);

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    SaleDate DATE,
    Amount DECIMAL(10, 2),
    Discount DECIMAL(5, 2)
);

CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    PaymentStatus VARCHAR(20),
    PaymentAmount DECIMAL(10, 2)
);

CREATE TABLE Temp_Orders (
    OrderID INT PRIMARY KEY
);

CREATE TABLE Temp_Products (
    ProductID INT PRIMARY KEY,
    IsDiscontinued BIT
);


INSERT INTO Customers (CustomerName, LoyaltyStatus)
VALUES ('John Doe', 'Gold'), ('Jane Smith', 'Silver'), ('Alice Johnson', 'Gold');

INSERT INTO Departments (DepartmentName)
VALUES ('Sales'), ('Marketing'), ('HR');

INSERT INTO Employees (EmployeeName, DepartmentID, Salary, JobTitle)
VALUES ('Mark Lee', 1, 6000, 'Sales Manager'),
       ('Emily Davis', 2, 4500, 'Marketing Executive'),
       ('Robert Brown', 3, 5200, 'HR Specialist');

INSERT INTO Products (ProductName, SupplierID, Price, Rating, IsDiscontinued)
VALUES ('Product A', 1, 150, 5, 0),
       ('Product B', 2, 80, 4, 1),
       ('Product C', 1, 200, 5, 0);

INSERT INTO Suppliers (SupplierName)
VALUES ('Supplier A'), ('Supplier B');

INSERT INTO Orders (CustomerID, EmployeeID, ProductID, OrderDate, TotalAmount)
VALUES (1, 1, 1, '2023-05-10', 5500),
       (2, 2, 2, '2022-08-15', 3000),
       (3, 3, 3, '2023-11-22', 7000);

INSERT INTO Sales (ProductID, SaleDate, Amount, Discount)
VALUES (1, '2022-07-15', 3000, 15),
       (2, '2023-03-18', 4000, 10),
       (3, '2022-10-05', 2500, 25);

INSERT INTO Payments (OrderID, PaymentStatus, PaymentAmount)
VALUES (1, 'Fully Paid', 5500),
       (2, 'Partially Paid', 1500),
       (3, 'Fully Paid', 7000);

INSERT INTO Temp_Orders (OrderID)
VALUES (1), (3);

INSERT INTO Temp_Products (ProductID, IsDiscontinued)
VALUES (2, 1);


SELECT o.OrderID, c.CustomerName, o.OrderDate
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID
AND o.OrderDate > '2022-12-31';

	SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
AND (d.DepartmentName = 'Sales' OR d.DepartmentName = 'Marketing');

SELECT p.ProductName, o.OrderID
FROM (SELECT * FROM Products WHERE Price > 100) p
JOIN Orders o
ON p.ProductID = o.ProductID;

SELECT o.*
FROM Orders o
JOIN Temp_Orders t
ON o.OrderID = t.OrderID;

SELECT e.EmployeeName, s.SaleAmount
FROM Employees e
CROSS APPLY (
    SELECT TOP 5 SaleAmount
    FROM Sales s
    WHERE s.DepartmentID = e.DepartmentID
    ORDER BY s.SaleAmount DESC
)as s;

select c.CustomerName, o.OrderID
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID and o.OrderDate between '2023' and c.LoyaltyStatus = 'Gold';

select  c.CustomerName, o.OrderCount
from Customers c
join (
    select CustomerID, count(*) as OrderCount
	from Orders 
	group by CustomerID
) o
on c.CustomerID = o.CustomerID;

select p.ProductName, s.SupllierName
from Products p 
join Suppliers s on s.SupplierID = p.SupplierID and (s.SupplierName = 'Supllier A' or s.SupplierName = 'Supllier B');

select e.EmployeeName, o.*
from Employees e 
outer apply 
(
select top 1 *
from Orders o
where o.EmployeeID = e.EmployeeID
order by o.OrderDate Desc
) o;

select d.DepartmentName, e.*
from Departments d
cross apply dbo.GetEmployeesByDepartment(d.DepartmentID) e;

select c.CustomerName, o.orderId, o.TotalAmount
from Customers c
join Orders o on c.CustomerID = o.CustomerID and o.TotalAmount >5000;


SELECT p.ProductName, s.SaleDate, s.Discount
FROM Products p
JOIN Sales s
ON p.ProductID = s.ProductID
AND (YEAR(s.SaleDate) = 2022 OR s.Discount > 20);

SELECT p.ProductName, s.TotalSales
FROM Products p
JOIN (
    SELECT ProductID, SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
) s
ON p.ProductID = s.ProductID;

SELECT p.*
FROM Products p
JOIN Temp_Products t
ON p.ProductID = t.ProductID
AND t.IsDiscontinued = 1;

SELECT e.EmployeeName, s.*
FROM Employees e
CROSS APPLY dbo.GetSalesPerformance(e.EmployeeID) s;

SELECT e.EmployeeName, e.Salary, d.DepartmentName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
AND d.DepartmentName = 'HR'
AND e.Salary > 5000;

SELECT o.OrderID, p.PaymentStatus
FROM Orders o
JOIN Payments p
ON o.OrderID = p.OrderID
AND (p.PaymentStatus = 'Fully Paid' OR p.PaymentStatus = 'Partially Paid');

SELECT c.CustomerName, o.*
FROM Customers c
OUTER APPLY (
    SELECT TOP 1 *
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
    ORDER BY o.OrderDate DESC
) o;

SELECT p.ProductName, s.SaleDate, p.Rating
FROM Products p
JOIN Sales s
ON p.ProductID = s.ProductID
AND YEAR(s.SaleDate) = 2023
AND p.Rating > 4;

SELECT e.EmployeeName, d.DepartmentName, e.JobTitle
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
AND (d.DepartmentName = 'Sales' OR e.JobTitle LIKE '%Manager%');