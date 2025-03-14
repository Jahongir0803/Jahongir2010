CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Category VARCHAR(50),
    SaleAmount DECIMAL(10,2),
    SaleDate DATE
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    JobTitle VARCHAR(50), 
    Department VARCHAR(50), 
    Salary DECIMAL(10,2)
);
INSERT INTO Sales (ProductID, Category, SaleAmount, SaleDate)
VALUES
(1,1, 'Electronics', 500.00, '2023-01-10'),
(2,2, 'Electronics', 300.00, '2021-01-12'),
(3,3, 'Furniture', 700.00, '2024-01-15'),
(4,4, 'Furniture', 200.00, '2020-01-18'),
(5,5, 'Clothing', 150.00, '2025-01-20');

INSERT INTO Employees (Name, JobTitle, Department, Salary) VALUES
('Alice Smith', 'Manager', 'HR', 80000),
('Bob Johnson', 'Engineer', 'IT', 95000),
('Charlie Brown', 'Technician', 'IT', 60000),
('David Wilson', 'Manager', 'Sales', 90000),
('Eve Adams', 'Analyst', 'Finance', 85000);

select category
SUM(SalesAmount) as Total,
AVG (SalesAmount) as AVGSalesAmount,
group by category
from Sales;

select JobTitle
count (JobTitle) as EmpCount,

group by department
from Employee;
where (JobTitle)='Manager';

select Department
max(Salary) as maxSalary,
min(salary) as minSalary,
from Employee
group by department;


select department
Avg(salary),
Count(*),
from employee
group by Department;


select ProductID
avg(SaleAmount),
from Sales,
group by ProductID,
Having avg(SalesAmount)>100

select 
COUNT(distinct ProductID) as HighSellingProducts,
from Sales
Where SalesAmount > 100;

select 
Year(SaleDate) as year,
sum(SaleAmount) as TotalSales,
from Sales
group by year(SaleDate);

ALTER TABLE Sales ADD COLUMN Region VARCHAR(50);
UPDATE Sales SET Region = 'North' WHERE SaleID IN (1,2);
UPDATE Sales SET Region = 'South' WHERE SaleID IN (3,4,5);

SELECT Region, COUNT(DISTINCT ProductID) AS CustomerCount
FROM Sales
GROUP BY Region;

SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 100000;