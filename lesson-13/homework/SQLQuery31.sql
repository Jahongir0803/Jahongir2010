create database HW13




CREATE TABLE Puzzle_1 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_1 (ID, Title, InputData, ExpectedResult) VALUES
(1, 'Extract first 4 characters', 'DATABASE', 'DATA');

CREATE TABLE Puzzle_2 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_2 (ID, Title, InputData, ExpectedResult) VALUES
(2, 'Find position of SQL', 'I love SQL Server', '8');

CREATE TABLE Puzzle_3 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_3 (ID, Title, InputData, ExpectedResult) VALUES
(3, 'Replace World with SQL', 'Hello World', 'Hello SQL');

CREATE TABLE Puzzle_4 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_4 (ID, Title, InputData, ExpectedResult) VALUES
(4, 'Find string length', 'Microsoft SQL Server', '21');

CREATE TABLE Puzzle_5 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_5 (ID, Title, InputData, ExpectedResult) VALUES
(5, 'Extract last 3 characters', 'Database', 'ase');

CREATE TABLE Puzzle_6 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_6 (ID, Title, InputData, ExpectedResult) VALUES
(6, 'Count letter a', 'apple, banana, grape', '1, 3, 1');

CREATE TABLE Puzzle_7 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_7 (ID, Title, InputData, ExpectedResult) VALUES
(7, 'Remove first 5 characters', 'abcdefg', 'fg');

CREATE TABLE Puzzle_8 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_8 (ID, Title, InputData, ExpectedResult) VALUES
(8, 'Extract second word', 'SQL is powerful; I love databases', 'is; love');

CREATE TABLE Puzzle_9 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_9 (ID, Title, InputData, ExpectedResult) VALUES
(9, 'Round to 2 decimals', '15.6789', '15.68');

CREATE TABLE Puzzle_10 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_10 (ID, Title, InputData, ExpectedResult) VALUES
(10, 'Absolute value', '-345.67', '345.67');

CREATE TABLE Puzzle_11 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_11 (ID, Title, InputData, ExpectedResult) VALUES
(11, 'Extract middle 3 characters', 'ABCDEFGHI', 'DEF');

CREATE TABLE Puzzle_12 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_12 (ID, Title, InputData, ExpectedResult) VALUES
(12, 'Replace first 3 characters with XXX', 'Microsoft', 'XXXrosoft');

CREATE TABLE Puzzle_13 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_13 (ID, Title, InputData, ExpectedResult) VALUES
(13, 'Find position of first space', 'SQL Server 2025', '4');

CREATE TABLE Puzzle_14 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_14 (ID, Title, InputData, ExpectedResult) VALUES
(14, 'Concatenate first and last name', 'John, Smith', 'John, Smith');

CREATE TABLE Puzzle_15 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_15 (ID, Title, InputData, ExpectedResult) VALUES
(15, 'Extract third word', 'The database is very efficient', 'is');

CREATE TABLE Puzzle_16 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_16 (ID, Title, InputData, ExpectedResult) VALUES
(16, 'Extract numbers', 'INV1234, ORD5678', '1234, 5678');

CREATE TABLE Puzzle_17 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_17 (ID, Title, InputData, ExpectedResult) VALUES
(17, 'Round to nearest integer', '99.5', '100');

CREATE TABLE Puzzle_18 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_18 (ID, Title, InputData, ExpectedResult) VALUES
(18, 'Days between dates', '2025-01-01 to 2025-03-15', '73');

CREATE TABLE Puzzle_19 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_19 (ID, Title, InputData, ExpectedResult) VALUES
(19, 'Month name from date', '2025-06-10', 'June');

CREATE TABLE Puzzle_20 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_20 (ID, Title, InputData, ExpectedResult) VALUES
(20, 'Week number of the year', '2025-04-22', '17');

CREATE TABLE Puzzle_21 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_21 (ID, Title, InputData, ExpectedResult) VALUES
(21, 'Extract domain from email', 'user1@gmail.com; admin@company.org', 'gmail.com; company.org');

CREATE TABLE Puzzle_22 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_22 (ID, Title, InputData, ExpectedResult) VALUES
(22, 'Last occurrence of e', 'experience', '10');

CREATE TABLE Puzzle_23 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_23 (ID, Title, InputData, ExpectedResult) VALUES
(23, 'Random number between 100 and 500', '', 'Random (e.g., 347)');

CREATE TABLE Puzzle_24 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_24 (ID, Title, InputData, ExpectedResult) VALUES
(24, 'Format number with commas', '9876543', '9,876,543');

CREATE TABLE Puzzle_25 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_25 (ID, Title, InputData, ExpectedResult) VALUES
(25, 'Extract first names', 'John Doe; Jane Smith', 'John; Jane');

CREATE TABLE Puzzle_26 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_26 (ID, Title, InputData, ExpectedResult) VALUES
(26, 'Replace spaces with dashes', 'SQL Server is great', 'SQL-Server-is-great');

CREATE TABLE Puzzle_27 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_27 (ID, Title, InputData, ExpectedResult) VALUES
(27, 'Pad number with zeros to 5 digits', '42', '00042');

CREATE TABLE Puzzle_28 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_28 (ID, Title, InputData, ExpectedResult) VALUES
(28, 'Length of longest word', 'SQL is fast and efficient', '9');

CREATE TABLE Puzzle_29 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_29 (ID, Title, InputData, ExpectedResult) VALUES
(29, 'Remove first word', 'Error: Connection failed', ': Connection failed');

CREATE TABLE Puzzle_30 (
    ID INT PRIMARY KEY,
    Title VARCHAR(100),
    InputData TEXT,
    ExpectedResult TEXT
);

INSERT INTO Puzzle_30 (ID, Title, InputData, ExpectedResult) VALUES
(30, 'Time difference in minutes', '08:15:00 to 09:45:00', '90');


SELECT SUBSTRING('DATABASE', 1, 4) AS result_1;

SELECT CHARINDEX('SQL', 'I love SQL Server') AS result_2;

SELECT REPLACE('Hello World', 'World', 'SQL') AS result_3;

SELECT LEN('Microsoft SQL Server') AS result_4;

SELECT RIGHT('Database', 3) AS result_5;

SELECT 
    (LEN('apple') - LEN(REPLACE('apple', 'a', ''))) AS apple_count,
    (LEN('banana') - LEN(REPLACE('banana', 'a', ''))) AS banana_count,
    (LEN('grape') - LEN(REPLACE('grape', 'a', ''))) AS grape_count ;

SELECT SUBSTRING('abcdefg', 6, LEN('abcdefg') - 5) AS result_7;

SELECT 
    (SELECT value FROM STRING_SPLIT('SQL is powerful', ' ') WHERE ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) = 2) AS second_word_1,
    (SELECT value FROM STRING_SPLIT('I love databases', ' ') WHERE ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) = 2) AS second_word_2;

SELECT ROUND(15.6789, 2) AS result_9;

SELECT ABS(-345.67) AS result_10;

SELECT SUBSTRING('ABCDEFGHI', LEN('ABCDEFGHI') / 2, 3) AS result_11;

SELECT 'XXX' + SUBSTRING('Microsoft', 4, LEN('Microsoft') - 3) AS result_12;

SELECT CHARINDEX(' ', 'SQL Server 2025') AS result_13;

SELECT CONCAT('John', ' ', 'Smith') AS result_14;

SELECT 
    (SELECT value FROM STRING_SPLIT('The database is very efficient', ' ') WHERE ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) = 3) AS result_15;

SELECT 
    SUBSTRING('INV1234', 4, LEN('INV1234') - 3) AS numeric_part_1,
    SUBSTRING('ORD5678', 4, LEN('ORD5678') - 3) AS numeric_part_2 ;

SELECT ROUND(99.5, 0) AS result_17;

SELECT DATEDIFF(DAY, '2025-01-01', '2025-03-15') AS result_18;

SELECT DATENAME(MONTH, '2025-06-10') AS result_19;

SELECT DATEPART(WEEK, '2025-04-22') AS result_20;

SELECT 
    SUBSTRING('user1@gmail.com', CHARINDEX('@', 'user1@gmail.com') + 1, LEN('user1@gmail.com') - CHARINDEX('@', 'user1@gmail.com')) AS domain_1,
    SUBSTRING('admin@company.org', CHARINDEX('@', 'admin@company.org') + 1, LEN('admin@company.org') - CHARINDEX('@', 'admin@company.org')) AS domain_2 ;

SELECT LEN('experience') - LEN(REPLACE('experience', 'e', '')) + 1 AS result_22;

SELECT FLOOR(RAND() * (500 - 100 + 1)) + 100 AS result_23;

SELECT FORMAT(9876543, 'N0') AS result_24;

SELECT 
    (SELECT value FROM STRING_SPLIT('John Doe', ' ') WHERE ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) = 1) AS first_name_1,
    (SELECT value FROM STRING_SPLIT('Jane Smith', ' ') WHERE ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) = 1) AS first_name_2 ;

SELECT REPLACE('SQL Server is great', ' ', '-') AS result_26;

SELECT RIGHT('00000' + CAST(42 AS VARCHAR(5)), 5) AS result_27;
