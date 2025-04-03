create database Hw 




CREATE TABLE SqlFunctionsTest (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    FunctionName NVARCHAR(50),
    ExampleQuery NVARCHAR(MAX),
    ExpectedResult NVARCHAR(MAX)
);

INSERT INTO SqlFunctionsTest (FunctionName, ExampleQuery, ExpectedResult)  
VALUES  
('ASCII', 'SELECT ASCII(''A'')', '65'),  
('LEN', 'SELECT LEN(''Hello World'')', '11'),  
('REVERSE', 'SELECT REVERSE(''OpenAI'')', '''IAnepO'''),  
('LTRIM', 'SELECT LTRIM('' SQL Server'')', '''SQL Server'''),  
('UPPER', 'SELECT UPPER(''sql'')', '''SQL'''),  
('LEFT', 'SELECT LEFT(''Database'', 3)', '''Dat'''),  
('RIGHT', 'SELECT RIGHT(''Technology'', 4)', '''logy'''),  
('SUBSTRING', 'SELECT SUBSTRING(''Programming'', 3, 4)', '''ogra'''),  
('CONCAT', 'SELECT CONCAT(''SQL'', '' '', ''Server'')', '''SQL Server'''),  
('REPLACE', 'SELECT REPLACE(''apple pie'', ''apple'', ''orange'')', '''orange pie'''),  
('CHARINDEX', 'SELECT CHARINDEX(''learn'', ''Learn SQL with LearnSQL'')', '0'),  
('POWER', 'SELECT POWER(2, 3)', '8'),  
('SQRT', 'SELECT SQRT(16)', '4'),  
('GETDATE', 'SELECT GETDATE()', 'Текущая дата и время'),  
('GETUTCDATE', 'SELECT GETUTCDATE()', 'Текущая дата и время в UTC'),  
('DAY', 'SELECT DAY(''2025-02-03'')', '3'),  
('DATEADD', 'SELECT DATEADD(DAY, 10, ''2025-02-03'')', '''2025-02-13''');



SELECT ASCII('A');

SELECT LEN('Hello World');


SELECT REVERSE('OpenAI');

SELECT SPACE(5) + 'YourString';

SELECT LTRIM(' SQL Server');


SELECT UPPER('sql');


SELECT LEFT('Database', 3);

SELECT RIGHT('Technology', 4);


SELECT SUBSTRING('Programming', 3, 4);


SELECT CONCAT('SQL', ' ', 'Server');

SELECT REPLACE('apple pie', 'apple', 'orange');

SELECT CHARINDEX('learn', 'Learn SQL with LearnSQL');

SELECT CHARINDEX('er', 'Server') > 0;

SELECT value FROM STRING_SPLIT('apple,orange,banana', ',');

SELECT POWER(2, 3);

SELECT SQRT(16);

SELECT GETDATE();

SELECT GETUTCDATE();

SELECT DAY('2025-02-03');

SELECT DATEADD(DAY, 10, '2025-02-03');

CREATE TABLE Cities (
    City VARCHAR(100)
);

INSERT INTO Cities (City)
VALUES 
    ('New York'),
    ('Los Angeles'),
    ('Chicago'),
    ('Houston'),
    ('Phoenix'),
    ('Philadelphia'),
    ('San Antonio'),
    ('San Diego'),
    ('Dallas'),
    ('San Jose');

SELECT CHAR(65);

SELECT LTRIM(' SQL ') AS WithoutLeadingSpaces, RTRIM(' SQL ') AS WithoutTrailingSpaces;

SELECT CHARINDEX('SQL', 'Learn SQL basics');

SELECT CONCAT_WS(',', 'SQL', 'Server');

SELECT STUFF('test case', 1, 4, 'exam');

SELECT SQUARE(7);

SELECT LEFT('International', 5);

SELECT RIGHT('Database', 2);

SELECT PATINDEX('%n%', 'Learn SQL');

SELECT DATEDIFF(DAY, '2025-01-01', '2025-02-03');

SELECT MONTH('2025-02-03');

SELECT DATEPART(YEAR, '2025-02-03');

SELECT CONVERT(TIME, GETDATE());

SELECT SYSDATETIME();

SELECT DATEADD(DAY, (7 - DATEPART(WEEKDAY, GETDATE()) + 4) % 7, GETDATE());

SELECT GETDATE() AS LocalTime, GETUTCDATE() AS UTCTime;

SELECT ABS(-15);

SELECT CEILING(4.57);

SELECT CURRENT_TIMESTAMP;

SELECT DATENAME(WEEKDAY, '2025-02-03');



CREATE TABLE SampleData (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Description VARCHAR(255),
    CreatedDate DATETIME,
    UpdatedDate DATETIME
);

INSERT INTO SampleData (Name, Description, CreatedDate, UpdatedDate)
VALUES
    ('SQL Server', 'A relational database management system developed by Microsoft', '2025-01-01', '2025-01-10'),
    ('MySQL', 'An open-source relational database management system', '2024-06-12', '2024-07-05'),
    ('PostgreSQL', 'An open-source object-relational database system', '2023-08-22', '2023-09-01'),
    ('Oracle Database', 'A multi-model database management system produced by Oracle Corporation', '2023-03-15', '2023-03-20'),
    ('MongoDB', 'A source-available cross-platform document-oriented database program', '2025-02-10', '2025-02-15');


SELECT REPLACE(REVERSE('SQL Server'), ' ', '') AS ReversedWithoutSpaces;

SELECT STRING_AGG(City, ', ') AS CityList FROM Cities;

SELECT 
    CASE 
        WHEN CHARINDEX('SQL', 'SQL Server') > 0 AND CHARINDEX('Server', 'SQL Server') > 0 
        THEN 'Yes' 
        ELSE 'No' 
    END AS ContainsBoth;

SELECT POWER(5, 3) AS CubeOfFive;

SELECT value FROM STRING_SPLIT('apple;orange;banana', ';');

SELECT TRIM(' SQL ') AS TrimmedString;

SELECT DATEDIFF(HOUR, '2025-01-01 10:00', '2025-01-02 15:00') AS HourDifference;

SELECT DATEDIFF(MONTH, '2023-05-01', '2025-02-03') AS MonthsDifference;

SELECT LEN('Learn SQL Server') - CHARINDEX('SQL', REVERSE('Learn SQL Server')) + 1 AS PositionFromEnd;

SELECT value FROM STRING_SPLIT('apple,orange,banana', ',');

SELECT DATEDIFF(DAY, '2025-01-01', GETDATE()) AS DaysDifference;

SELECT LEFT('Data Science', 4) AS First4Chars;

SELECT CEILING(SQRT(225)) AS RoundedSquareRoot;

SELECT CONCAT_WS('|', 'SQL', 'Server') AS ConcatenatedString;

SELECT PATINDEX('%[0-9]%', 'abc123xyz') AS PositionOfFirstDigit;

SELECT CHARINDEX('SQL', 'SQL Server SQL', CHARINDEX('SQL', 'SQL Server SQL') + 1) AS SecondOccurrenceOfSQL;

SELECT DATEPART(YEAR, GETDATE()) AS CurrentYear;

SELECT DATEADD(DAY, -100, GETDATE()) AS DateMinus100Days;

SELECT DATENAME(WEEKDAY, '2025-02-03') AS DayOfWeek;

SELECT POWER(5, 2) AS SquareOfFive;