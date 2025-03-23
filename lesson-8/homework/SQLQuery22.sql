
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY ,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL
);


CREATE TABLE StudentCourses (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2),
    DepartmentID INT
);

CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY,
    Details TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);


CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(100) NOT NULL
);


SELECT c.CustomerName, o.OrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT e.EmployeeName, ed.Address, ed.PhoneNumber
FROM Employees e
INNER JOIN EmployeeDetails ed ON e.EmployeeID = ed.EmployeeID;

SELECT p.ProductName, c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;


SELECT c.CustomerName, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT o.OrderID, p.ProductName, od.Quantity
FROM Orders o
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID;

SELECT p.ProductName, c.CategoryName
FROM Products p
CROSS JOIN Categories c;

SELECT c.CustomerName, o.OrderID, o.OrderDate
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT p.ProductName, o.OrderID, o.OrderAmount
FROM Products p
CROSS JOIN Orders o
WHERE o.OrderAmount > 500;

SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

SELECT a.Col1, b.Col2
FROM TableA a
INNER JOIN TableB b ON a.SomeValue <> b.SomeValue;




select c.CustomerName,count(o.OrderID)  as TotalOrders
from Customers c
Inner join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerName;

select s.StudentName , c.CourseName
from Students s
inner join StudentCourses sc on s.StudentID = sc.StudentID
inner join Courses c on sc.CourseID = c.CourseID;

select e.EmployeeName, d.DepartmentName , e.Salary
from Employees e
cross join Departments d
where e.Salary > 5000;

select e.EmployeeName, ed.Details
from Employees e
inner join EmployeeDetails ed on e.EmployeeID = ed.EmployeeID;


select p.ProductName, s.SupplierName
from Products p
inner join Suppliers s on p.SupplierID = s.SupplierID
where s.SupplierName ='Suplier A'

select p.ProductName, Coalesce(sum(s.Qoantity), 0) As TotalSales
from Products p
left join sales s on p.ProductID = s.ProductID
group by p.ProductName;

select e.EmployeeName, e.Salary, d.DepartmentName
from Employees e
inner join Departments d on d.DepartmentID = e.DepartmentID
where e.Salary > 4000 and d.DepartmentName='HR'

select a.col1, b.col1
from TableA a
inner join TableB b on a.SomeValue >= b.SomeValue;

select p.ProductName, p.Price, s.SuplierName
from Products p
inner join Suppliers s on p.SupplierID = s.SupplierID
where p.Price >= 50;

select s.SaleID, r.RegionName, s.Amount
from Sales s
cross join Regions r
where s.Amount > 1000