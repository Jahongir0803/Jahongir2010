CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (1, 'Laptop', 999.99),
       (2, 'Smartphone', 499.99),
       (3, 'Headphones', 79.99);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (4, 'Tablet', NULL);  -- This is valid if Price allows NULL
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (5, 'Smartwatch', NULL);  -- This would fail if Price is NOT NULL

ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
-- This query inserts a new record into the Products table

INSERT INTO Products (ProductID, ProductName, Price)
VALUES (6, 'Monitor', 150.00);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

select * from master.dbo.Products
