create database MyDatabase;

--to get into the table in any data base, select the database where the table is present.
use MyDatabase;

DROP TABLE Family_Data;

create table Family_Data (
First_Name Char(20),
Last_Name Char(20),
Contact_No Varchar(15)
);

select * from Family_Data;

--alter the table by making the contact number header as the primary key.
--add city to the table in one go along with the previous task.

--Test: Inserting data into the talbe by specifying the colums and the values.

INSERT INTO Family_Data (First_Name, Last_Name, Contact_No)
VALUES
    ('Rosario', 'Aruldoss', 7904721635),
    ('Selcia', 'Chandradas', 7892209727);
	
--('Selcia', 'Chandradas', 7892209727)

--Test: inserting multiple values by specifying the column names
INSERT INTO Family_Data (First_Name, Last_Name, Contact_No)
VALUES
    ('Jaya', 'Aruldoss', 8825739941),
    ('Aruldoss', 'Gnanadoss', 8825621451),
    ('Christy', 'Prema', 9445699380);

--Test: inserting the values without specifying the column names.
INSERT INTO Family_Data 
VALUES
('Rosita','Mary',6382905291),
('Randy','Orton',8015535922),
('Ranti','Bownisha',9445699370);

--Test: filling partial data into the table
INSERT INTO Family_Data (First_Name, Last_Name)
VALUES
('Jerald','John');

--Test: Filling the null value which is updating the record as we did not fill the contact no, with the jerald contact no.
-- so we have to use the update command.

UPDATE Family_Data 
SET Contact_No = 7358027760
WHERE First_Name = 'Jerald';

SELECT * FROM Family_Data;

--Including a column to the table and adding the values to the column - here we have to use the ALTER command

ALTER TABLE Family_Data 
ADD Age int;

UPDATE Family_Data SET Age = 28 WHERE First_Name = 'Rosario'
UPDATE Family_Data SET Age = 26 WHERE First_Name = 'Selcia'
UPDATE Family_Data SET Age = 21 WHERE First_Name = 'Randy'
UPDATE Family_Data SET Age = 31 WHERE First_Name = 'Jerald'
UPDATE Family_Data SET Age = 55 WHERE First_Name = 'Jaya'
UPDATE Family_Data SET Age = 66 WHERE First_Name = 'Aruldoss'
UPDATE Family_Data SET Age = 45 WHERE First_Name = 'Christy'
UPDATE Family_Data SET Age = 25 WHERE First_Name = 'Rosita'
UPDATE Family_Data SET Age = 29 WHERE First_Name = 'Ranti'

-- As we did not give the primary key as the numbers, we have to edit based on first name for the time being. In our table we can make the contact no as the 
-- primary key.


INSERT INTO Family_Data
VALUES ('Chandradas','unknown',7598530305,55)

SELECT * FROM Family_Data;
SELECT First_Name,Last_Name FROM Family_Data;

--Using the where clause to filter and view the data. 
SELECT * FROM Family_Data
WHERE Age > 30;

-- Single filter condition

SELECT * FROM Family_Data
WHERE Last_Name LIKE 'unknown';

SELECT * FROM Family_Data
WHERE Last_Name = 'Aruldoss';

-- Multiple filter condition

SELECT * FROM Family_Data
WHERE Age < 30 AND Last_Name = 'Aruldoss';

-- ORDER BY clause DESC & ASC

SELECT * FROM Family_Data
WHERE Age>30
ORDER BY Age DESC;

SELECT * FROM Family_Data
WHERE Age>30
ORDER BY Age ASC;

--Without where clause,
SELECT * FROM Family_Data
ORDER BY Age DESC;
 
 -- FIRST NAME
SELECT * FROM Family_Data
ORDER BY First_Name ASC;

SELECT * FROM Family_Data
ORDER BY First_Name ASC, Age DESC;

--Exploring Group By Command
SELECT Last_Name, COUNT(*) AS Number_Of_People
FROM Family_Data
GROUP BY Last_Name;

SELECT
    Last_Name,
    MIN(Age) AS Youngest_Age
FROM Family_Data
GROUP BY Last_Name;

--Exploring the Having Command
SELECT Last_Name, COUNT(*) AS Number_of_People1
FROM Family_Data
GROUP BY Last_Name
HAVING COUNT(*)=1;

SELECT * FROM Family_Data;

--Primary key and foreign key reference practice. 

CREATE TABLE Department (
Department_ID INT PRIMARY KEY, 
Department_Name CHAR(20)
)

CREATE TABLE Employees (
Employee_ID INT PRIMARY KEY,
First_Name CHAR(20),
Department_ID INT FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
)

SELECT * FROM Department;

--filling the department table
INSERT INTO Department
VALUES (1, 'Mechanical'),
(2, 'Transportation'),
(3, 'Human Resourses'),
(4, 'Information Tech'),
(5, 'Purchase');

--filling the Employees table.
INSERT INTO Employees
VALUES (1, 'Rosario',1),
(2, 'Selcia',3),
(3, 'Christy',5),
(4, 'Aruldoss',1),
(5, 'Jaya',5);
--it will give an error if the Department ID mentioned is not available in the Primary key of the Department Table.


--GROUP BY & HAVING Clause-- Detailed practice.

--Creating a new table
CREATE TABLE Sales (
Sales_ID INT PRIMARY KEY,
Product_Name VARCHAR(20),
Qty INT,
);

--inserting the values in the table.
INSERT INTO Sales VALUES
(1,'Apple',25),
(2,'Orange',50),
(3,'Banana',75),
(4,'Apple',10);

--checking the table.
SELECT * FROM Sales;

SELECT Product_Name, SUM(Qty) AS Total_Qty FROM Sales
GROUP BY Product_Name
HAVING SUM(Qty) > 40
ORDER BY Total_Qty DESC;

--SQL Operators: Performing Calculations and Comparisons

    --for this we created a excel sheet and converted the same to csv file and them imported the file here.
    --we are gonna create a new col by multiplying the two existing cols.

SELECT * FROM SalesData;

SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesData';

EXEC sp_help 'SalesData';

ALTER TABLE SalesData
DROP CONSTRAINT PK_SalesData;

ALTER TABLE SalesData
ALTER COLUMN Sale_ID INT;

ALTER TABLE SalesData
ALTER COLUMN Price INT;

ALTER TABLE SalesData
ALTER COLUMN Qty_Sold INT;

--ADDING THE PRIMARY KEY BACK
ALTER TABLE SalesData
ALTER COLUMN Sale_ID INT NOT NULL;

ALTER TABLE SalesData
ADD CONSTRAINT PK_SalesData PRIMARY KEY (Sale_ID);

SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesData';

    
    --using the arithemetic operator
    -- we are going to take the Sale_ID, Product_Name, and the Total_Cost

SELECT Sale_ID, Product_Name, Price*Qty_Sold AS Total_Cost FROM SalesData

--WHERE CLAUSE.

SELECT Product_Name, SUM(Price * Qty_Sold) AS Total_Cost
FROM SalesData
WHERE Price > 10 AND Qty_Sold < 50
GROUP BY Product_Name
ORDER BY Product_Name ASC;

--SQL Predicates: Defining Your Conditions

SELECT * FROM SalesData;

-- BETWEEN PREDICATE
SELECT Product_Name, Price FROM SalesData WHERE Price Between 1 and 10;

-- IN PREDICATE
SELECT Product_Name, AVG(Price) AS Avg_Price From SalesData WHERE Product_Name in ('Apple','Banana')
GROUP BY Product_Name;

-- LIKE PREDICATE
SELECT Product_Name, Price, Qty_Sold FROM SalesData WHERE Product_Name LIKE 'Apple';
-- ARITHEMETIC OPERATOR
SELECT Product_Name, AVG(Price) AS AvgPrice FROM SalesData WHERE Product_Name = 'Apple'
GROUP BY Product_Name;

-- LIKE PREDICATE (with partial letters) (Usage of % for coverup)
SELECT Product_Name, Price, Qty_Sold FROM SalesData WHERE Product_Name LIKE 'App%';

-- IS NULL PREDICATE
