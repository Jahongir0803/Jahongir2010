CREATE TABLE Employees (
    EmployeeID INT IDENTITY (1,1) PRIMARY KEY,
    Name VARCHAR(50) not null ,
    Salary DECIMAL (10, 2)  default 0.00 ,
    Department VARCHAR (100),
    Email VARCHAR(100)
);
iNSERT INTO Employees ( EmployeeID,Name, Salary, Department, Email) VALUES
(1,'Alice Johnson', 6000.00, 'HR', 'alice@example.com'),
(2,'Bob Smith', 4500.00, 'IT', 'bob@example.com'),
(3,'Charlie Brown', 5200.00, 'HR', 'Charlie@example.com'),
(4,'Diana Adams', 7000.00, 'Finance', 'diana@example.com'),
(5,'Evan Wright', 5500.00, 'HR', 'evan@example.com'),
(6,'Frank Miller', 4800.00, 'IT', 'frank@example.com'),
(7,'Grace Lee', 5000.00, 'HR', 'grace@example.com');

SELECT TOP 5 
* FROM Employees
ORDER BY Salary 
;

SELECT EmployeeID, 
       Name, 
       COALESCE(Email, 'noemail@example.com') AS Email
FROM Employees;