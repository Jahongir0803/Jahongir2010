
 go
 with Number as(
      select 1 as Num
	  union all
	  select num + 1
	  from Number
	  where num < 10
)
select * from Number
go
with Doubles as(
     select 1 as Num
	 union all
	 select num * 2
	 from Doubles
	 where num < 50
)
select * from Doubles

go

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00),
(11, 5, 'Elizabeth', 'Hernández', 95000.00),
(12, 2, 'David', 'Lopez', 88000.00),
(13, 3, 'Joseph', 'Martinez', 74000.00),
(14, 4, 'Susan', 'Rodriguez', 80000.00),
(15, 5, 'Daniel', 'Wilson', 89000.00),
(16, 1, 'Karen', 'Moore', 67000.00),
(17, 2, 'Charles', 'Taylor', 71000.00),
(18, 3, 'Christopher', 'Anderson', 76000.00),
(19, 4, 'Sarah', 'Thomas', 83000.00),
(20, 5, 'Jessica', 'Jackson', 92000.00),
(21, 1, 'Kevin', 'White', 64000.00),
(22, 2, 'Nancy', 'Harris', 78000.00),
(23, 3, 'Steven', 'Clark', 78000.00),
(24, 4, 'Betty', 'Lewis', 79000.00),
(25, 5, 'Ryan', 'Young', 94000.00),
(26, 1, 'Daniel', 'King', 68000.00),
(27, 2, 'Dorothy', 'Scott', 73000.00),
(28, 3, 'Ethan', 'Adams', 77000.00),
(29, 4, 'Megan', 'Baker', 82000.00),
(30, 5, 'Anthony', 'Green', 88000.00),
(31, 1, 'Laura', 'Nelson', 66000.00),
(32, 2, 'Ryan', 'Carter', 71000.00),
(33, 3, 'George', 'Mitchell', 76000.00),
(34, 4, 'Deborah', 'Perez', 79000.00),
(35, 5, 'Brian', 'Roberts', 90000.00),
(36, 1, 'Alice', 'Garcia', 60000.00),
(37, 2, 'Jack', 'Evans', 72000.00),
(38, 3, 'Ashley', 'Gonzalez', 77000.00),
(39, 4, 'Evan', 'Stewart', 80000.00),
(40, 5, 'Sophia', 'King', 93000.00);


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');


CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales (SalesID, ProductID, SalesAmount, SaleDate) VALUES
(1, 1, 1500.00, '2025-01-01'),
(2, 2, 2000.00, '2025-01-02'),
(3, 3, 1200.00, '2025-01-03'),
(4, 4, 1800.00, '2025-01-04'),
(5, 5, 2200.00, '2025-01-05'),
(6, 6, 1400.00, '2025-01-06'),
(7, 1, 2500.00, '2025-01-07'),
(8, 2, 1700.00, '2025-01-08'),
(9, 3, 1600.00, '2025-01-09'),
(10, 4, 1900.00, '2025-01-10'),
(11, 5, 2100.00, '2025-01-11'),
(12, 6, 1300.00, '2025-01-12'),
(13, 1, 2000.00, '2025-01-13'),
(14, 2, 1800.00, '2025-01-14'),
(15, 3, 1500.00, '2025-01-15'),
(16, 4, 2200.00, '2025-01-16'),
(17, 5, 1700.00, '2025-01-17'),
(18, 6, 1600.00, '2025-01-18'),
(19, 1, 2500.00, '2025-01-19'),
(20, 2, 1800.00, '2025-01-20'),
(21, 3, 1400.00, '2025-01-21'),
(22, 4, 1900.00, '2025-01-22'),
(23, 5, 2100.00, '2025-01-23'),
(24, 6, 1600.00, '2025-01-24'),
(25, 1, 1500.00, '2025-01-25'),
(26, 2, 2000.00, '2025-01-26'),
(27, 3, 2200.00, '2025-01-27'),
(28, 4, 1300.00, '2025-01-28'),
(29, 5, 2500.00, '2025-01-29'),
(30, 6, 1800.00, '2025-01-30'),
(31, 1, 2100.00, '2025-02-01'),
(32, 2, 1700.00, '2025-02-02'),
(33, 3, 1600.00, '2025-02-03'),
(34, 4, 1900.00, '2025-02-04'),
(35, 5, 2000.00, '2025-02-05'),
(36, 6, 2200.00, '2025-02-06'),
(37, 1, 1300.00, '2025-02-07'),
(38, 2, 2500.00, '2025-02-08'),
(39, 3, 1400.00, '2025-02-09'),
(40, 4, 1800.00, '2025-02-10');



CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1000.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 500.00),
(4, 'Monitor', 300.00),
(5, 'Headphones', 150.00),
(6, 'Mouse', 25.00),
(7, 'Keyboard', 50.00),
(8, 'Camera', 400.00),
(9, 'Printer', 150.00),
(10, 'Smartwatch', 200.00),
(11, 'Speakers', 80.00),
(12, 'Flash Drive', 20.00),
(13, 'Hard Drive', 120.00),
(14, 'External Battery', 30.00),
(15, 'Charger', 15.00),
(16, 'Router', 70.00),
(17, 'Graphics Card', 500.00),
(18, 'Processor', 300.00),
(19, 'RAM', 120.00),
(20, 'Motherboard', 150.00),
(21, 'Power Supply', 80.00),
(22, 'Webcam', 40.00),
(23, 'Microphone', 60.00),
(24, 'Projector', 400.00),
(25, 'Electric Fan', 25.00),
(26, 'Air Conditioner', 250.00),
(27, 'Refrigerator', 500.00),
(28, 'Washing Machine', 350.00),
(29, 'Microwave', 100.00),
(30, 'Blender', 80.00),
(31, 'Vacuum Cleaner', 150.00),
(32, 'Coffee Maker', 90.00),
(33, 'Toaster', 40.00),
(34, 'Water Heater', 120.00),
(35, 'Iron', 30.00),
(36, 'Hair Dryer', 40.00),
(37, 'Electric Toothbrush', 50.00),
(38, 'Shaver', 60.00),
(39, 'Electric Kettle', 30.00),
(40, 'Rice Cooker', 60.00);


     

SELECT e.Name, s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID;


go

with AvgSalary as(
     select AVG(Salary) as AvgSal from Employees
)
select * from AvgSalary

go 

SELECT p.ProductName, s.MaxSale
FROM Products p
JOIN (
    SELECT ProductID, MAX(Amount) AS MaxSale
    FROM Sales
    GROUP BY ProductID
) s ON p.ProductID = s.ProductID;


go

WITH SaleCounts AS (
    SELECT EmployeeID, COUNT(*) AS SaleCount
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.Name
FROM Employees e
JOIN SaleCounts s ON e.EmployeeID = s.EmployeeID
WHERE s.SaleCount > 5;


go


WITH ProductSales AS (
    SELECT ProductID, SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
)
SELECT p.ProductName, ps.TotalSales
FROM Products p
JOIN ProductSales ps ON p.ProductID = ps.ProductID
WHERE ps.TotalSales > 500;

go

WITH AvgSalary AS (
    SELECT AVG(Salary) AS AvgSal FROM Employees
)
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AvgSal FROM AvgSalary);

go

SELECT SUM(s.TotalQty) AS AllProductsSold
FROM (
    SELECT ProductID, SUM(Quantity) AS TotalQty
    FROM Sales
    GROUP BY ProductID
) s;

go

WITH EmployeeSales AS (
    SELECT DISTINCT EmployeeID FROM Sales
)
SELECT Name
FROM Employees
WHERE EmployeeID NOT IN (SELECT EmployeeID FROM EmployeeSales);

go




WITH Factorial AS (
    SELECT 1 AS n, 1 AS fact
    UNION ALL
    SELECT n + 1, fact * (n + 1)
    FROM Factorial
    WHERE n < 4
)
SELECT * FROM Factorial;



WITH Fibonacci AS (
    SELECT 0 AS n, 0 AS fib1, 1 AS fib2
    UNION ALL
    SELECT n + 1, fib2, fib1 + fib2
    FROM Fibonacci
    WHERE n < 10
)
SELECT n, fib1 FROM Fibonacci;




WITH StringSplit AS (
    SELECT Id, 1 AS pos, SUBSTRING(String, 1, 1) AS ch
    FROM Example
    UNION ALL
    SELECT Id, pos + 1, SUBSTRING(String, pos + 1, 1)
    FROM StringSplit
    WHERE pos < LEN(String)
)
SELECT * FROM StringSplit;




WITH EmployeeSales AS (
    SELECT EmployeeID, SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT EmployeeID, TotalSales,
       RANK() OVER (ORDER BY TotalSales DESC) AS Rank
FROM EmployeeSales;




SELECT TOP 5 e.Name, s.OrderCount
FROM Employees e
JOIN (
    SELECT EmployeeID, COUNT(*) AS OrderCount
    FROM Sales
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID
ORDER BY s.OrderCount DESC;



WITH MonthlySales AS (
    SELECT FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
           SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY FORMAT(SaleDate, 'yyyy-MM')
),
Diff AS (
    SELECT SaleMonth, TotalSales,
           LAG(TotalSales) OVER (ORDER BY SaleMonth) AS PrevMonthSales,
           TotalSales - LAG(TotalSales) OVER (ORDER BY SaleMonth) AS Diff
    FROM MonthlySales
)
SELECT * FROM Diff;



SELECT Category, SUM(Amount) AS TotalSales
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY Category;




WITH ProductSales AS (
    SELECT ProductID, SUM(Amount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY ProductID
)
SELECT ProductID, TotalSales,
       RANK() OVER (ORDER BY TotalSales DESC) AS Rank
FROM ProductSales;




SELECT *
FROM (
    SELECT EmployeeID,
           DATEPART(QUARTER, SaleDate) AS Quarter,
           SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
) AS Quarterly
WHERE TotalSales > 5000;
]
SELECT TOP 3 e.Name, s.TotalSales
FROM Employees e
JOIN (
    SELECT EmployeeID, SUM(Amount) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -1, GETDATE())
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID
ORDER BY s.TotalSales DESC;


CREATE TABLE Schedule ( ScheduleID CHAR(1) PRIMARY KEY, StartTime DATETIME NOT NULL, EndTime DATETIME NOT NULL );
GO


CREATE TABLE Activity ( ScheduleID CHAR(1) 
REFERENCES Schedule (ScheduleID), 
ActivityName VARCHAR(100),
StartTime DATETIME, 
EndTime DATETIME,
PRIMARY KEY (ScheduleID, ActivityName, StartTime, EndTime) );
GO

INSERT INTO Schedule (ScheduleID, StartTime, EndTime) VALUES ('A',CAST('2021-10-01 10:00:00' AS DATETIME),CAST('2021-10-01 15:00:00' AS DATETIME)), ('B',CAST('2021-10-01 10:15:00' AS DATETIME),CAST('2021-10-01 12:15:00' AS DATETIME)); GO

INSERT INTO Activity (ScheduleID, ActivityName, StartTime, EndTime) VALUES ('A','Meeting',CAST('2021-10-01 10:00:00' AS DATETIME),CAST('2021-10-01 10:30:00' AS DATETIME)), ('A','Break',CAST('2021-10-01 12:00:00' AS DATETIME),CAST('2021-10-01 12:30:00' AS DATETIME)), ('A','Meeting',CAST('2021-10-01 13:00:00' AS DATETIME),CAST('2021-10-01 13:30:00' AS DATETIME)), ('B','Break',CAST('2021-10-01 11:00:00'AS DATETIME),CAST('2021-10-01 11:15:00' AS DATETIME));

CREATE TABLE Numbers ( Id INTEGER, StepNumber INTEGER, [Count] INTEGER ); GO

INSERT INTO Numbers VALUES (1,1,1) ,(1,2,-2) ,(1,3,-1) ,(1,4,12) ,(1,5,-2) ,(2,1,7) ,(2,2,-3); GO

CREATE TABLE Example ( Id INTEGER IDENTITY(1,1) PRIMARY KEY, String VARCHAR(30) NOT NULL ); GO

INSERT INTO Example VALUES('123456789'),('abcdefghi'); GO

REATE TABLE Employees ( EmployeeID INT PRIMARY KEY, DepartmentID INT, FirstName VARCHAR(50), LastName VARCHAR(50), Salary DECIMAL(10, 2) );

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES (1, 1, 'John', 'Doe', 60000.00), (2, 1, 'Jane', 'Smith', 65000.00), (3, 2, 'James', 'Brown', 70000.00), (4, 3, 'Mary', 'Johnson', 75000.00), (5, 4, 'Linda', 'Williams', 80000.00), (6, 2, 'Michael', 'Jones', 85000.00), (7, 1, 'Robert', 'Miller', 55000.00), (8, 3, 'Patricia', 'Davis', 72000.00), (9, 4, 'Jennifer', 'García', 77000.00), (10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Departments ( DepartmentID INT PRIMARY KEY, DepartmentName VARCHAR(50) );

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'HR'), (2, 'Sales'), (3, 'Marketing'), (4, 'Finance'), (5, 'IT'), (6, 'Operations'), (7, 'Customer Service'), (8, 'R&D'), (9, 'Legal'), (10, 'Logistics');

CREATE TABLE Sales ( SalesID INT PRIMARY KEY, EmployeeID INT, ProductID INT, SalesAmount DECIMAL(10, 2), SaleDate DATE );

INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES (1, 1, 1, 1500.00, '2025-01-01'), (2, 2, 2, 2000.00, '2025-01-02'), (3, 3, 3, 1200.00, '2025-01-03'), (4, 4, 4, 1800.00, '2025-01-04'), (5, 5, 5, 2200.00, '2025-01-05'), (6, 6, 6, 1400.00, '2025-01-06'), (7, 7, 1, 2500.00, '2025-01-07'), (8, 8, 2, 1700.00, '2025-01-08'), (9, 9, 3, 1600.00, '2025-01-09'), (10, 10, 4, 1900.00, '2025-01-10'), (11, 1, 5, 2100.00, '2025-01-11'), (12, 2, 6, 1300.00, '2025-01-12'), (13, 3, 1, 2000.00, '2025-01-13'), (14, 4, 2, 1800.00, '2025-01-14'), (15, 5, 3, 1500.00, '2025-01-15'), (16, 6, 4, 2200.00, '2025-01-16'), (17, 7, 5, 1700.00, '2025-01-17'), (18, 8, 6, 1600.00, '2025-01-18'), (19, 9, 1, 2500.00, '2025-01-19'), (20, 10, 2, 1800.00, '2025-01-20'), (21, 1, 3, 1400.00, '2025-01-21'), (22, 2, 4, 1900.00, '2025-01-22'), (23, 3, 5, 2100.00, '2025-01-23'), (24, 4, 6, 1600.00, '2025-01-24'), (25, 5, 1, 1500.00, '2025-01-25'), (26, 6, 2, 2000.00, '2025-01-26'), (27, 7, 3, 2200.00, '2025-01-27'), (28, 8, 4, 1300.00, '2025-01-28'), (29, 9, 5, 2500.00, '2025-01-29'), (30, 10, 6, 1800.00, '2025-01-30'), (31, 1, 1, 2100.00, '2025-02-01'), (32, 2, 2, 1700.00, '2025-02-02'), (33, 3, 3, 1600.00, '2025-02-03'), (34, 4, 4, 1900.00, '2025-02-04'), (35, 5, 5, 2000.00, '2025-02-05'), (36, 6, 6, 2200.00, '2025-02-06'), (37, 7, 1, 2300.00, '2025-02-07'), (38, 8, 2, 1750.00, '2025-02-08'), (39, 9, 3, 1650.00, '2025-02-09'), (40, 10, 4, 1950.00, '2025-02-10');

CREATE TABLE Products ( ProductID INT PRIMARY KEY, CategoryID INT, ProductName VARCHAR(100), Price DECIMAL(10, 2) );

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES (1, 1, 'Laptop', 1000.00), (2, 1, 'Smartphone', 800.00), (3, 2, 'Tablet', 500.00), (4, 2, 'Monitor', 300.00), (5, 3, 'Headphones', 150.00), (6, 3, 'Mouse', 25.00), (7, 4, 'Keyboard', 50.00), (8, 4, 'Speaker', 200.00), (9, 5, 'Smartwatch', 250.00), (10, 5, 'Camera', 700.00);



WITH RECURSIVE NumberSequence AS (
    SELECT 1 AS StepNumber, '1' AS Count
    UNION ALL
    SELECT StepNumber + 1, Count + CAST(StepNumber + 1 AS VARCHAR)
    FROM NumberSequence
    WHERE StepNumber < 5  -- Максимальное значение n = 5
)
SELECT * FROM NumberSequence;

go

SELECT e.FirstName, e.LastName, COUNT(s.SalesID) AS SalesCount
FROM Sales s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
WHERE s.SaleDate >= DATEADD(MONTH, -6, GETDATE())  -- За последние 6 месяцев
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY SalesCount DESC;

go

WITH RECURSIVE RunningTotal AS (
    SELECT 1 AS StepNumber, 1 AS Count  -- Начальная точка
    UNION ALL
    SELECT StepNumber + 1,
           CASE
               WHEN Count + StepNumber > 10 THEN 10
               WHEN Count + StepNumber < 0 THEN 0
               ELSE Count + StepNumber
           END
    FROM RunningTotal
    WHERE StepNumber < 10  -- Ограничиваем до 10 шагов
)
SELECT * FROM RunningTotal;

go	

SELECT s.ScheduleID, 
       COALESCE(a.ActivityName, 'Work') AS Activity
FROM Schedule s
LEFT JOIN Activity a ON s.ScheduleID = a.ScheduleID;

go 

WITH DepartmentSales AS (
    SELECT e.DepartmentID, 
           p.ProductID, 
           SUM(s.SalesAmount) AS TotalSales
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    JOIN Products p ON s.ProductID = p.ProductID
    GROUP BY e.DepartmentID, p.ProductID
)
SELECT d.DepartmentName, 
       p.ProductName, 
       ds.TotalSales
FROM DepartmentSales ds
JOIN Departments d ON ds.DepartmentID = d.DepartmentID
JOIN Products p ON ds.ProductID = p.ProductID;