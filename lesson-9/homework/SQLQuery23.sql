create database L9;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    ManagerID INT NULL
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    SupplierID INT
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Amount DECIMAL(10, 2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50)
);

select e.EmployeeID, e.EmployeeName, d.DepartmentID
from Employees e
inner join Departments d on e.DepartmentID = d.DepartmentID
where e.Salary > 5000;

select c.CustomerName, o.OrderDate, o.OrderID
from Customers c
inner join Orders o on C.CustomerID = o.CustomerID
where year (o.OrderDate) = 2023;

select e.EmployeeName, d.DepartmentName
from Employees e
left join Departments d on e.DepartmentID = d.DepartmentID;

select s.SupplierName, p.ProductName
from Suppliers s
right join Products p on s.SupplierID = p.SupplierID;

select o.OrderID, p.PaymentID, p.Amount
from Orders o
full join Payments p on o.OrderID = p.OrderID;

select e.EmployeeName as Employee, m.EmployeeName as Manager
from Employees e
left join Employees m on e.ManagerID = m.ManagerID;

select p.ProductName, s.Quantity
from Products p
inner join Sales s on s.ProductID = p.ProductID;

select s.StudentName, c.CourseName
from Students s
inner join Courses c on c.StudentID = s.StudentID;

select c.CustomerName, count(o.OrderID) as OrderCount
from Customers c
inner join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerName
having COUNT(o.OrderID) > 3;

select e.EmployeeName, d.DepartmentName
from Employees e
left join Departments d on e.DepartmentID = d.DepartmentID
where d.DepartmentName > 'HR';

SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 10;

SELECT p.ProductName
FROM Products p
LEFT JOIN Sales s
ON p.ProductID = s.ProductID
WHERE s.SaleID IS NULL;

SELECT c.CustomerName, o.OrderID
FROM Orders o
RIGHT JOIN Customers c
ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NOT NULL;

SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NOT NULL;

SELECT e1.EmployeeName, e2.EmployeeName AS Colleague, e1.ManagerID
FROM Employees e1
JOIN Employees e2
ON e1.ManagerID = e2.ManagerID
AND e1.EmployeeID != e2.EmployeeID;

SELECT o.OrderID, c.CustomerName, o.OrderDate
FROM Orders o
LEFT JOIN Customers c
ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2022;


SELECT e.EmployeeName, d.DepartmentName, e.Salary
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' AND e.Salary > 5000;

SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';

SELECT o.OrderID, p.PaymentID, p.Amount
FROM Orders o
FULL JOIN Payments p
ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NOT NULL;

SELECT p.ProductName
FROM Products p
LEFT JOIN Orders o
ON p.ProductID = o.ProductID
WHERE o.OrderID IS NULL;