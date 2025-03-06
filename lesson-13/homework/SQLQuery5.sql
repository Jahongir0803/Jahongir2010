create database examplå_db 

use examplå_db

go 
select * from examplå_db.

create table example_db.Employees(
Emp_id INT IDENTITY(1,1) PRIMARY KEY, --this col is PK and increment automatical
Name VARCHAR (50)  not null,    --name requared
Salary DECIMAL(10, 2) default 0.00, --12345678.90
); 
INSERT INTO example_db.Employees (Emp_id, name, Salary)
values (1,'John Doe', 50000.00),
(2,'Jane Smith', 60000.00),
(3, 'Robert Brown', 55000.00);

UPDATE Employees
Set Salary = 51000.00
where Emp_id = 1

Delete from Employees 
where Emp_id = 2

Delete FRom Employees 
where Emp_id = 3

Truncate Table Employees
 
 Alter Table Employees
 Modify column First_name varchar(100)
 
 alter table Employees
 add Department Varchar (50)







