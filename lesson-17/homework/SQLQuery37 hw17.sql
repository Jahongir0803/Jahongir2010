create database HW17

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Staff VALUES
(1, 'Anna', 'Petrova', 'HR', 50000),
(2, 'Ivan', 'Ivanov', 'IT', 70000),
(3, 'Maria', 'Sidorova', 'Finance', 65000);

CREATE TABLE Items (
    ItemID INT PRIMARY KEY,
    ItemName NVARCHAR(100),
    Price DECIMAL(10, 2),
    Quantity INT
);

INSERT INTO Items VALUES
(1, 'Laptop', 1200.00, 50),
(2, 'Mouse', 25.00, 200),
(3, 'Keyboard', 45.00, 150),
(4, 'Monitor', 300.00, 80);

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100)
);

INSERT INTO Clients VALUES
(1, 'Dmitry', 'Kozlov', 'd.kozlov@example.com'),
(2, 'Elena', 'Smirnova', 'e.smirnova@example.com'),
(3, 'Sergey', 'Fedorov', 's.fedorov@example.com');

CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY,
    ClientID INT FOREIGN KEY REFERENCES Clients(ClientID),
    ItemID INT FOREIGN KEY REFERENCES Items(ItemID),
    Quantity INT,
    PurchaseDate DATE
);

INSERT INTO Purchases VALUES
(1, 1, 1, 1, '2025-03-15'),
(2, 2, 2, 2, '2025-03-20'),
(3, 3, 3, 1, '2025-04-01'),
(4, 1, 4, 1, '2025-04-10');

CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY,
    ClientID INT FOREIGN KEY REFERENCES Clients(ClientID),
    ItemID INT FOREIGN KEY REFERENCES Items(ItemID),
    Quantity INT,
    PurchaseDate DATE,
    Status NVARCHAR(20) DEFAULT 'Pending'
);

INSERT INTO Purchases VALUES
(1, 1, 1, 1, '2025-03-15', 'Completed'),
(2, 2, 2, 2, '2025-03-20', 'Pending'),
(3, 3, 3, 1, '2025-04-01', 'Pending'),
(4, 1, 4, 1, '2025-04-10', 'Completed');

CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY,
    ItemID INT,
    QuantityDelivered INT
);

INSERT INTO Delivery VALUES
(1, 1, 10),
(2, 2, 50),
(3, 3, 30),
(4, 4, 20);

CREATE TABLE #SalaryUpdates (
    StaffID INT,
    NewSalary DECIMAL(10, 2)
);

INSERT INTO #SalaryUpdates VALUES
(1, 52000),
(2, 75000),
(3, 68000);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    StaffID INT FOREIGN KEY REFERENCES Staff(StaffID),
    Amount DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO Sales VALUES
(1, 1, 1500.00, '2025-03-10'),
(2, 2, 3000.00, '2025-03-15'),
(3, 2, 1200.00, '2025-04-01'),
(4, 3, 2500.00, '2025-04-05');

CREATE TABLE #ClientDataTemp (
    ClientID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100)
);

INSERT INTO #ClientDataTemp VALUES
(1, 'Dmitry', 'Kozlov', 'd.kozlov@example.com'),      -- already exists
(4, 'Olga', 'Morozova', 'o.morozova@example.com'),    -- new
(5, 'Nikita', 'Belov', 'n.belov@example.com');        -- new

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Region NVARCHAR(50),
    Salary DECIMAL(10, 2),
    SalesQuota DECIMAL(10, 2)
);

INSERT INTO Staff VALUES
(1, 'Anna', 'Petrova', 'HR', 'North', 50000, 2000),
(2, 'Ivan', 'Ivanov', 'IT', 'South', 70000, 4000),
(3, 'Maria', 'Sidorova', 'Sales', 'East', 65000, 3000),
(4, 'Pavel', 'Smirnov', 'Sales', 'North', 60000, 2500);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    StaffID INT FOREIGN KEY REFERENCES Staff(StaffID),
    Amount DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO Sales VALUES
(1, 1, 1500.00, '2025-03-10'),
(2, 2, 3000.00, '2025-03-15'),
(3, 2, 2500.00, '2025-04-01'),
(4, 3, 3500.00, '2025-04-05'),
(5, 3, 1000.00, '2025-04-12'),
(6, 4, 4000.00, '2025-04-15');

CREATE TABLE #SalesTemp (
    SaleID INT,
    StaffID INT,
    Amount DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO #SalesTemp VALUES
(2, 2, 3200.00, '2025-03-15'), -- update
(6, 4, 4200.00, '2025-04-15'), -- update
(7, 1, 1800.00, '2025-04-18'); -- insert

CREATE TABLE #TempStaffMerge (
    StaffID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Region NVARCHAR(50),
    Salary DECIMAL(10, 2),
    SalesQuota DECIMAL(10, 2)
);

INSERT INTO #TempStaffMerge VALUES
(2, 'Ivan', 'Ivanov', 'IT', 'South', 72000, 4500), -- обновление
(5, 'Nina', 'Volkova', 'Finance', 'West', 55000, 2000); -- вставка

CREATE TABLE ProductInfo (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

INSERT INTO ProductInfo VALUES
(1, 'Laptop', 1200.00),
(2, 'Mouse', 25.00),
(3, 'Keyboard', 45.00);

CREATE TABLE ProductStock (
    ProductID INT PRIMARY KEY,
    StockQuantity INT
);

INSERT INTO ProductStock VALUES
(1, 30),
(2, 100),
(3, 80);

CREATE TABLE PurchasesBackup (
    PurchaseID INT PRIMARY KEY,
    ClientID INT,
    ItemID INT,
    Quantity INT,
    PurchaseDate DATE,
    Status NVARCHAR(20)
);

CREATE VIEW vwStaff AS
SELECT * FROM Staff;

CREATE VIEW vwItemPrices AS
SELECT ItemID, ItemName, Price FROM Items;

CREATE TABLE #TempPurchases (
    PurchaseID INT,
    ClientID INT,
    ItemID INT,
    Quantity INT,
    PurchaseDate DATE
);
INSERT INTO #TempPurchases VALUES
(1, 1, 1, 2, '2025-04-01'),
(2, 2, 3, 1, '2025-04-02');

DECLARE @currentRevenue DECIMAL(10, 2);

CREATE FUNCTION fnSquare (@Number INT)
RETURNS INT
AS
BEGIN
    RETURN @Number * @Number;
END;

CREATE PROCEDURE spGetClients
AS
BEGIN
    SELECT * FROM Clients;
END;

MERGE Purchases AS Target
USING Clients AS Source
ON Target.ClientID = Source.ClientID
WHEN MATCHED THEN
    UPDATE SET PurchaseDate = PurchaseDate -- фиктивное обновление
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ClientID, ItemID, Quantity, PurchaseDate)
    VALUES (Source.ClientID, 1, 1, GETDATE());

CREATE TABLE #StaffInfo (
    StaffID INT,
    FirstName NVARCHAR(50),
    Department NVARCHAR(50)
);
INSERT INTO #StaffInfo VALUES
(1, 'Anna', 'HR'),
(2, 'Ivan', 'IT');

CREATE FUNCTION fnEvenOdd (@Number INT)
RETURNS NVARCHAR(10)
AS
BEGIN
    RETURN CASE 
        WHEN @Number % 2 = 0 THEN 'Even'
        ELSE 'Odd'
    END;
END;

CREATE PROCEDURE spMonthlyRevenue
    @Month INT,
    @Year INT
AS
BEGIN
    SELECT SUM(Amount) AS TotalRevenue
    FROM Sales
    WHERE MONTH(SaleDate) = @Month AND YEAR(SaleDate) = @Year;
END;

CREATE VIEW vwRecentItemSales AS
SELECT 
    ItemID, 
    SUM(Quantity) AS TotalSold
FROM Purchases
WHERE MONTH(PurchaseDate) = MONTH(GETDATE()) - 1
  AND YEAR(PurchaseDate) = YEAR(GETDATE())
GROUP BY ItemID;

DECLARE @currentDate DATE = GETDATE();
PRINT @currentDate;

CREATE VIEW vwHighQuantityItems AS
SELECT * FROM Items WHERE Quantity > 100;

CREATE TABLE #ClientOrders (
    ClientID INT,
    OrderID INT
);
INSERT INTO #ClientOrders VALUES
(1, 101), (2, 102);

SELECT co.*, p.ItemID, p.Quantity
FROM #ClientOrders co
JOIN Purchases p ON co.ClientID = p.ClientID;

CREATE PROCEDURE spStaffDetails
    @StaffID INT
AS
BEGIN
    SELECT FirstName, Department
    FROM Staff
    WHERE StaffID = @StaffID;
END;

CREATE FUNCTION fnAddNumbers (@a INT, @b INT)
RETURNS INT
AS
BEGIN
    RETURN @a + @b;
END;

CREATE TABLE #NewItemPrices (
    ItemID INT,
    NewPrice DECIMAL(10, 2)
);
INSERT INTO #NewItemPrices VALUES
(1, 1300.00),
(2, 28.00);

MERGE Items AS Target
USING #NewItemPrices AS Source
ON Target.ItemID = Source.ItemID
WHEN MATCHED THEN
    UPDATE SET Price = Source.NewPrice;

CREATE VIEW vwStaffSalaries AS
SELECT FirstName, LastName, Salary FROM Staff;

CREATE PROCEDURE spClientPurchases
    @ClientID INT
AS
BEGIN
    SELECT * FROM Purchases WHERE ClientID = @ClientID;
END;

CREATE FUNCTION fnStringLength (@text NVARCHAR(MAX))
RETURNS INT
AS
BEGIN
    RETURN LEN(@text);
END;



CREATE PROCEDURE spTopSalesStaff
    @Year INT
AS
BEGIN
    SELECT TOP 1 s.StaffID, s.FirstName, s.LastName, SUM(S.Amount) AS TotalRevenue
    FROM Staff s
    JOIN Sales S ON s.StaffID = S.StaffID
    WHERE YEAR(S.SaleDate) = @Year
    GROUP BY s.StaffID, s.FirstName, s.LastName
    ORDER BY TotalRevenue DESC;
END;


CREATE VIEW vwClientOrderStats AS
SELECT 
    c.ClientID,
    COUNT(p.PurchaseID) AS TotalOrders,
    SUM(p.Amount) AS TotalSpent
FROM Clients c
LEFT JOIN Purchases p ON c.ClientID = p.ClientID
GROUP BY c.ClientID;


MERGE Purchases AS Target
USING Items AS Source
ON Target.ItemID = Source.ItemID
WHEN MATCHED THEN
    UPDATE SET Quantity = Quantity + 1
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ClientID, ItemID, Quantity, PurchaseDate)
    VALUES (1, Source.ItemID, 1, GETDATE());


CREATE FUNCTION fnMonthlyRevenue (@Year INT, @Month INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(10,2)
    SELECT @TotalRevenue = SUM(Amount)
    FROM Sales
    WHERE YEAR(SaleDate) = @Year AND MONTH(SaleDate) = @Month;
    RETURN @TotalRevenue;
END;

CREATE PROCEDURE spProcessOrderTotals
    @OrderID INT,
    @DiscountRate DECIMAL(5,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);
    SELECT @Total = SUM(Quantity * Price)
    FROM OrderItems oi
    JOIN Items i ON oi.ItemID = i.ItemID
    WHERE oi.OrderID = @OrderID;

    SET @Total = @Total - (@Total * @DiscountRate / 100);

    UPDATE Orders SET TotalAmount = @Total, Status = 'Processed'
    WHERE OrderID = @OrderID;
END;

CREATE TABLE #StaffSalesData (
    StaffID INT,
    TotalSales DECIMAL(10, 2)
);
INSERT INTO #StaffSalesData
SELECT StaffID, SUM(Amount)
FROM Sales
GROUP BY StaffID;

MERGE Sales AS Target
USING #SalesTemp AS Source
ON Target.SaleID = Source.SaleID
WHEN MATCHED THEN
    UPDATE SET Amount = Source.Amount
WHEN NOT MATCHED THEN
    INSERT (SaleID, StaffID, Amount, SaleDate)
    VALUES (Source.SaleID, Source.StaffID, Source.Amount, Source.SaleDate)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

CREATE PROCEDURE spOrdersByDateRange
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT * FROM Purchases
    WHERE PurchaseDate BETWEEN @StartDate AND @EndDate;
END;


CREATE FUNCTION fnCompoundInterest (
    @Principal DECIMAL(10,2),
    @Rate DECIMAL(5,2),
    @Time INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Principal * POWER(1 + @Rate / 100, @Time);
END;

CREATE VIEW vwQuotaExceeders AS
SELECT s.StaffID, s.FirstName, s.LastName, SUM(sales.Amount) AS TotalSales
FROM Staff s
JOIN Sales sales ON s.StaffID = sales.StaffID
GROUP BY s.StaffID, s.FirstName, s.LastName
HAVING SUM(sales.Amount) > 100000;

CREATE PROCEDURE spSyncProductStock
AS
BEGIN
    MERGE Items AS Target
    USING ProductStock AS Source
    ON Target.ItemID = Source.ItemID
    WHEN MATCHED THEN
        UPDATE SET Quantity = Source.Quantity;
END;

MERGE Staff AS Target
USING ExternalStaff AS Source
ON Target.StaffID = Source.StaffID
WHEN MATCHED THEN
    UPDATE SET FirstName = Source.FirstName, LastName = Source.LastName;

CREATE FUNCTION fnDateDiffDays (@Date1 DATE, @Date2 DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(DAY, @Date1, @Date2);
END;

CREATE PROCEDURE spUpdateItemPrices
AS
BEGIN
    UPDATE Items
    SET Price = Price * 1.10
    WHERE ItemID IN (
        SELECT ItemID FROM Purchases
        GROUP BY ItemID
        HAVING SUM(Quantity) > 50
    );
    SELECT ItemID, Price FROM Items;
END;

MERGE Clients AS Target
USING #ClientDataTemp AS Source
ON Target.ClientID = Source.ClientID
WHEN MATCHED THEN
    UPDATE SET Name = Source.Name
	WHEN NOT MATCHED THEN
    INSERT (ClientID, Name)
    VALUES (Source.ClientID, Source.Name);


CREATE PROCEDURE spRegionalSalesReport
AS
BEGIN
    SELECT Region, 
           SUM(Amount) AS TotalRevenue, 
           AVG(Amount) AS AvgSale, 
           COUNT(DISTINCT StaffID) AS StaffCount
    FROM Sales
    GROUP BY Region;
END;



CREATE FUNCTION fnProfitMargin (
    @Cost DECIMAL(10,2), 
    @Price DECIMAL(10,2)
)
RETURNS DECIMAL(5,2)
AS
BEGIN
    RETURN ((@Price - @Cost) / @Price) * 100;
END;


MERGE Staff AS Target
USING #TempStaffMerge AS Source
ON Target.StaffID = Source.StaffID
WHEN MATCHED THEN
    UPDATE SET FirstName = Source.FirstName, Department = Source.Department
WHEN NOT MATCHED THEN
    INSERT (StaffID, FirstName, Department)
    VALUES (Source.StaffID, Source.FirstName, Source.Department);


CREATE PROCEDURE spBackupData
AS
BEGIN
    INSERT INTO BackupPurchases
    SELECT * FROM Purchases;

    DELETE FROM Purchases WHERE PurchaseDate < DATEADD(YEAR, -1, GETDATE());
END;


CREATE PROCEDURE spTopSalesReport
AS
BEGIN
    SELECT TOP 10 
        s.StaffID,
        s.FirstName,
        s.LastName,
        SUM(Sales.Amount) AS TotalSales,
        RANK() OVER (ORDER BY SUM(Sales.Amount) DESC) AS Rank
    FROM Staff s
    JOIN Sales ON s.StaffID = Sales.StaffID
    GROUP BY s.StaffID, s.FirstName, s.LastName
    ORDER BY TotalSales DESC;
END;



CREATE PROCEDURE spTopSalesStaff
    @Year INT
AS
BEGIN
    SELECT TOP 1 s.StaffID, s.FirstName, s.LastName, SUM(S.Amount) AS TotalRevenue
    FROM Staff s
    JOIN Sales S ON s.StaffID = S.StaffID
    WHERE YEAR(S.SaleDate) = @Year
    GROUP BY s.StaffID, s.FirstName, s.LastName
    ORDER BY TotalRevenue DESC;
END;


CREATE VIEW vwClientOrderStats AS
SELECT 
    c.ClientID,
    COUNT(p.PurchaseID) AS TotalOrders,
    SUM(p.Amount) AS TotalSpent
FROM Clients c
LEFT JOIN Purchases p ON c.ClientID = p.ClientID
GROUP BY c.ClientID;



MERGE Purchases AS Target
USING Items AS Source
ON Target.ItemID = Source.ItemID
WHEN MATCHED THEN
    UPDATE SET Quantity = Quantity + 1
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ClientID, ItemID, Quantity, PurchaseDate)
    VALUES (1, Source.ItemID, 1, GETDATE());


CREATE FUNCTION fnMonthlyRevenue (@Year INT, @Month INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(10,2)
    SELECT @TotalRevenue = SUM(Amount)
    FROM Sales
    WHERE YEAR(SaleDate) = @Year AND MONTH(SaleDate) = @Month;
    RETURN @TotalRevenue;
END;


CREATE PROCEDURE spProcessOrderTotals
    @OrderID INT,
    @DiscountRate DECIMAL(5,2)
AS
BEGIN
    DECLARE @Total DECIMAL(10,2);
    SELECT @Total = SUM(Quantity * Price)
    FROM OrderItems oi
    JOIN Items i ON oi.ItemID = i.ItemID
    WHERE oi.OrderID = @OrderID;

    SET @Total = @Total - (@Total * @DiscountRate / 100);

    UPDATE Orders SET TotalAmount = @Total, Status = 'Processed'
    WHERE OrderID = @OrderID;
END;


CREATE TABLE #StaffSalesData (
    StaffID INT,
    TotalSales DECIMAL(10, 2)
);
INSERT INTO #StaffSalesData
SELECT StaffID, SUM(Amount)
FROM Sales
GROUP BY StaffID;


MERGE Sales AS Target
USING #SalesTemp AS Source
ON Target.SaleID = Source.SaleID
WHEN MATCHED THEN
    UPDATE SET Amount = Source.Amount
WHEN NOT MATCHED THEN
    INSERT (SaleID, StaffID, Amount, SaleDate)
    VALUES (Source.SaleID, Source.StaffID, Source.Amount, Source.SaleDate)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;


CREATE PROCEDURE spOrdersByDateRange
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT * FROM Purchases
    WHERE PurchaseDate BETWEEN @StartDate AND @EndDate;
END;


CREATE FUNCTION fnCompoundInterest (
    @Principal DECIMAL(10,2),
    @Rate DECIMAL(5,2),
    @Time INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Principal * POWER(1 + @Rate / 100, @Time);
END;


CREATE VIEW vwQuotaExceeders AS
SELECT s.StaffID, s.FirstName, s.LastName, SUM(sales.Amount) AS TotalSales
FROM Staff s
JOIN Sales sales ON s.StaffID = sales.StaffID
GROUP BY s.StaffID, s.FirstName, s.LastName
HAVING SUM(sales.Amount) > 100000;


CREATE PROCEDURE spSyncProductStock
AS
BEGIN
    MERGE Items AS Target
    USING ProductStock AS Source
    ON Target.ItemID = Source.ItemID
    WHEN MATCHED THEN
        UPDATE SET Quantity = Source.Quantity;
END;


MERGE Staff AS Target
USING ExternalStaff AS Source
ON Target.StaffID = Source.StaffID
WHEN MATCHED THEN
    UPDATE SET FirstName = Source.FirstName, LastName = Source.LastName;


CREATE FUNCTION fnDateDiffDays (@Date1 DATE, @Date2 DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(DAY, @Date1, @Date2);
END;


CREATE PROCEDURE spUpdateItemPrices
AS
BEGIN
    UPDATE Items
    SET Price = Price * 1.10
    WHERE ItemID IN (
        SELECT ItemID FROM Purchases
        GROUP BY ItemID
        HAVING SUM(Quantity) > 50
    );
    SELECT ItemID, Price FROM Items;
END;



MERGE Clients AS Target
USING #ClientDataTemp AS Source
ON Target.ClientID = Source.ClientID
WHEN MATCHED THEN
    UPDATE SET Name = Source.Name
	WHEN NOT MATCHED THEN
    INSERT (ClientID, Name)
    VALUES (Source.ClientID, Source.Name);


CREATE PROCEDURE spRegionalSalesReport
AS
BEGIN
    SELECT Region, 
           SUM(Amount) AS TotalRevenue, 
           AVG(Amount) AS AvgSale, 
           COUNT(DISTINCT StaffID) AS StaffCount
    FROM Sales
    GROUP BY Region;
END;


CREATE FUNCTION fnProfitMargin (
    @Cost DECIMAL(10,2), 
    @Price DECIMAL(10,2)
)
RETURNS DECIMAL(5,2)
AS
BEGIN
    RETURN ((@Price - @Cost) / @Price) * 100;
END;


MERGE Staff AS Target
USING #TempStaffMerge AS Source
ON Target.StaffID = Source.StaffID
WHEN MATCHED THEN
    UPDATE SET FirstName = Source.FirstName, Department = Source.Department
WHEN NOT MATCHED THEN
    INSERT (StaffID, FirstName, Department)
    VALUES (Source.StaffID, Source.FirstName, Source.Department);


CREATE PROCEDURE spBackupData
AS
BEGIN
    INSERT INTO BackupPurchases
    SELECT * FROM Purchases;

    DELETE FROM Purchases WHERE PurchaseDate < DATEADD(YEAR, -1, GETDATE());
END;


CREATE PROCEDURE spTopSalesReport
AS
BEGIN
    SELECT TOP 10 
        s.StaffID,
        s.FirstName,
        s.LastName,
        SUM(Sales.Amount) AS TotalSales,
        RANK() OVER (ORDER BY SUM(Sales.Amount) DESC) AS Rank
    FROM Staff s
    JOIN Sales ON s.StaffID = Sales.StaffID
    GROUP BY s.StaffID, s.FirstName, s.LastName
    ORDER BY TotalSales DESC;
END;

