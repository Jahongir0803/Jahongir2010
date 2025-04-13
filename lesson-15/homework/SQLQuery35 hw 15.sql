create database HW15

CREATE TABLE Cart1 (item_id INT, item_name VARCHAR(50));
CREATE TABLE Cart2 (item_id INT, item_name VARCHAR(50));
INSERT INTO Cart1 VALUES (1, 'Apple'), (2, 'Banana'), (3, 'Orange');
INSERT INTO Cart2 VALUES (1, 'Apple'), (4, 'Mango'), (5, 'Banana');
SELECT COALESCE(c1.item_name, '-') AS Cart1_Item, COALESCE(c2.item_name, '-') AS Cart2_Item
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2 ON c1.item_name = c2.item_name;

CREATE TABLE ProcessLog (workflow_id INT, execution_date DATE);
INSERT INTO ProcessLog VALUES (1, '2024-01-01'), (1, '2024-01-03'), (1, '2024-01-06'),
                              (2, '2024-02-01'), (2, '2024-02-10');
SELECT workflow_id, AVG(DATEDIFF(day, LAG(execution_date) OVER (PARTITION BY workflow_id ORDER BY execution_date), execution_date)) AS avg_days
FROM ProcessLog GROUP BY workflow_id;

CREATE TABLE Movie (MName VARCHAR(10), AName VARCHAR(10), Roles VARCHAR(10));
INSERT INTO Movie(MName,AName,Roles)
SELECT 'A','Amitabh','Actor' UNION ALL SELECT 'A','Vinod','Villan' UNION ALL
SELECT 'B','Amitabh','Actor' UNION ALL SELECT 'B','Vinod','Actor' UNION ALL
SELECT 'D','Amitabh','Actor' UNION ALL SELECT 'E','Vinod','Actor';
SELECT MName FROM Movie WHERE Roles = 'Actor' AND AName IN ('Amitabh', 'Vinod')
GROUP BY MName HAVING COUNT(DISTINCT AName) = 2;

CREATE TABLE PhoneDirectory (customer_id INT, phone_type VARCHAR(10), phone_number VARCHAR(20));
INSERT INTO PhoneDirectory VALUES (1, 'home', '111-111'), (1, 'mobile', '222-222'),
                                  (2, 'work', '333-333'), (2, 'mobile', '444-444');
SELECT customer_id,
       MAX(CASE WHEN phone_type = 'home' THEN phone_number END) AS home,
       MAX(CASE WHEN phone_type = 'mobile' THEN phone_number END) AS mobile,
       MAX(CASE WHEN phone_type = 'work' THEN phone_number END) AS work
FROM PhoneDirectory GROUP BY customer_id;

CREATE TABLE Numbers (number INT);
WITH nums AS (
    SELECT 1 AS number
    UNION ALL
    SELECT number + 1 FROM nums WHERE number < 100
)
INSERT INTO Numbers SELECT number FROM nums;
SELECT number FROM Numbers WHERE number <= 100 AND number % 9 = 0;

CREATE TABLE BatchStarts (batch_id INT, line_number INT);
CREATE TABLE BatchLines (batch_id INT, line_number INT, command VARCHAR(50));


INSERT INTO BatchStarts VALUES (1, 1), (2, 5);
INSERT INTO BatchLines VALUES (1, 3, 'GO'), (2, 8, 'GO');
SELECT b.batch_id, b.line_number AS start_line, bl.line_number AS end_line
FROM BatchStarts b JOIN BatchLines bl ON bl.batch_id = b.batch_id AND bl.command = 'GO'
WHERE bl.line_number > b.line_number;

CREATE TABLE Inventory (item_id INT, transaction_date DATE, quantity INT);
INSERT INTO Inventory VALUES (1, '2024-01-01', 100), (1, '2024-01-03', -20), (1, '2024-01-05', 50);
SELECT item_id, transaction_date, quantity,
       SUM(quantity) OVER (PARTITION BY item_id ORDER BY transaction_date) AS running_balance
FROM Inventory;

CREATE TABLE NthHighest (Name VARCHAR(5), Salary INT);
INSERT INTO NthHighest(Name, Salary) VALUES ('e5', 45000), ('e3', 30000), ('e2', 49000), ('e4', 36600), ('e1', 58000);
SELECT MAX(Salary) AS SecondHighest FROM NthHighest WHERE Salary < (SELECT MAX(Salary) FROM NthHighest);

CREATE TABLE Sales (year INT, amount DECIMAL(10, 2));
INSERT INTO Sales VALUES (2022, 1000), (2023, 1500), (2024, 2000);
SELECT 
    SUM(CASE WHEN year = 2024 THEN amount ELSE 0 END) AS sales_this_year,
    SUM(CASE WHEN year = 2023 THEN amount ELSE 0 END) AS sales_last_year,
    SUM(CASE WHEN year = 2022 THEN amount ELSE 0 END) AS sales_two_years_ago
FROM Sales;


CREATE TABLE #Boxes (Box CHAR(1), [Length] INT, Width INT, Height INT);
INSERT INTO #Boxes (Box, [Length], Width, Height) VALUES
('A', 10, 25, 15), ('B', 15, 10, 25), ('C', 10, 15, 25), ('D', 20, 30, 30), ('E', 30, 30, 20);
SELECT DISTINCT b1.Box AS Box1, b2.Box AS Box2
FROM #Boxes b1
JOIN #Boxes b2
  ON b1.Box < b2.Box
 AND (
     (b1.Length = b2.Length AND b1.Width = b2.Width AND b1.Height = b2.Height) OR
     (b1.Length = b2.Width AND b1.Width = b2.Height AND b1.Height = b2.Length) OR
     (b1.Length = b2.Height AND b1.Width = b2.Length AND b1.Height = b2.Width) OR
     (b1.Length = b2.Length AND b1.Width = b2.Height AND b1.Height = b2.Width) OR
     (b1.Length = b2.Height AND b1.Width = b2.Width AND b1.Height = b2.Length) OR
     (b1.Length = b2.Width AND b1.Width = b2.Length AND b1.Height = b2.Height)
 );


CREATE TABLE dbo.AlternateMaleFemale (ID INT, NAME VARCHAR(10), GENDER VARCHAR(1));
INSERT INTO dbo.AlternateMaleFemale(ID,NAME,GENDER) VALUES
(1,'Neeraj','M'), (2,'Mayank','M'), (3,'Pawan','M'), (4,'Gopal','M'), (5,'Sandeep','M'),
(6,'Isha','F'), (7,'Sugandha','F'), (8,'kritika','F');
WITH Male AS (
    SELECT ROW_NUMBER() OVER (ORDER BY ID) AS rn, NAME AS MaleName FROM dbo.AlternateMaleFemale WHERE GENDER = 'M'
),
Female AS (
    SELECT ROW_NUMBER() OVER (ORDER BY ID) AS rn, NAME AS FemaleName FROM dbo.AlternateMaleFemale WHERE GENDER = 'F'
)
SELECT MaleName, FemaleName FROM Male FULL OUTER JOIN Female ON Male.rn = Female.rn;

CREATE TABLE lag (BusinessEntityID INT, SalesYear INT, CurrentQuota DECIMAL(20,4));
INSERT INTO lag
SELECT 275, 2005, '367000.00' UNION ALL
SELECT 275, 2005, '556000.00' UNION ALL
SELECT 275, 2006, '502000.00' UNION ALL
SELECT 275, 2006, '550000.00' UNION ALL
SELECT 275, 2006, '1429000.00' UNION ALL
SELECT 275, 2006, '1324000.00';
SELECT BusinessEntityID, SalesYear, CurrentQuota,
       LAG(CurrentQuota) OVER (PARTITION BY BusinessEntityID ORDER BY SalesYear) AS PrevQuota
FROM lag;

CREATE TABLE #BowlingResults (GameID INT, Bowler VARCHAR(20), Score INT);
INSERT INTO #BowlingResults (GameID, Bowler, Score) VALUES
(1, 'John', 167), (1, 'Susan', 139), (1, 'Ralph', 95), (1, 'Mary', 90),
(2, 'Susan', 187), (2, 'John', 155), (2, 'Dennis', 100), (2, 'Anthony', 78);
WITH Ranked AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY GameID ORDER BY Score DESC) AS rn
    FROM #BowlingResults
)
SELECT a.Bowler AS Bowler1, b.Bowler AS Bowler2, a.GameID
FROM Ranked a JOIN Ranked b ON a.GameID = b.GameID AND ABS(a.rn - b.rn) = 1
WHERE a.Bowler < b.Bowler;

WITH Numbers AS (
    SELECT TOP 100 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS num
    FROM sys.all_objects
)
SELECT num FROM Numbers n
WHERE num > 1 AND NOT EXISTS (
    SELECT 1 FROM Numbers d WHERE d.num BETWEEN 2 AND n.num - 1 AND n.num % d.num = 0
);


CREATE TABLE PlayerScores (Player VARCHAR(20), Score INT);
INSERT INTO PlayerScores VALUES
('A', 100), ('B', 80), ('C', 60), ('D', 50), ('E', 40), ('F', 30);
WITH Ranked AS (
    SELECT Player, Score,
           NTILE(2) OVER (ORDER BY Score DESC) AS Tier
    FROM PlayerScores
)
SELECT * FROM Ranked;

WITH Numbers AS (
    SELECT TOP 10000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS num
    FROM sys.all_objects a CROSS JOIN sys.all_objects b
)
SELECT n.num
FROM Numbers n
WHERE n.num > 1 AND (
    SELECT SUM(d.num)
    FROM Numbers d
    WHERE d.num < n.num AND n.num % d.num = 0
) = n.num;
