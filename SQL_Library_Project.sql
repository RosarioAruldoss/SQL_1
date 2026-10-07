-- Project Scenario: Library Management System

-- Objective

-- The goal of this project is to create a Library Management System database that will store
-- information about books, authors, and members. This will involve creating the database,
-- defining tables, and populating them with sample data.

-- Creating the Database
-- Database Name: LibraryDB

CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO

-- We will create three tables:
-- ● Authors: To store information about authors.
-- ● Books: To store information about books in the library.
-- ● Members: To store information about library members.

CREATE TABLE Authors (
AuthorID INT Primary Key IDENTITY(1,1),
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
BirthDate DATE
);
GO
SELECT * FROM Authors;

CREATE TABLE Books (
BookID INT PRIMARY KEY IDENTITY(1,1),
Title NVARCHAR(100) NOT NULL,
AuthorID INT,
PublicationYear INT,
Genre NVARCHAR(50),
FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
GO

CREATE TABLE Books (
BookID INT Primary Key IDENTITY(1,1),
Title NVARCHAR(100) NOT NULL,
AuthorID INT Foreign Key REFERENCES Authors(AuthorID),
PublicationYear INT,
Genre NVARCHAR(50)
);

CREATE TABLE Members (
MemberID INT PRIMARY KEY IDENTITY(1,1),
FullName NVARCHAR(100) NOT NULL,
MembershipDate DATE,
Email NVARCHAR(100)
)

--NOW WE POPULATE THE TABLE WITH SAMPLE DATA FOR FURTHER PROCESSING

INSERT INTO Authors (FirstName, LastName, BirthDate)
VALUES
('George', 'Orwell', '1903-06-25'),
('Jane', 'Austen', '1775-12-16'),
('Mark', 'Twain', '1835-11-30');

INSERT INTO Books (Title, AuthorID, PublicationYear, Genre)
VALUES
('1984', 1, 1949, 'Dystopian'),
('Pride and Prejudice', 2, 1813, 'Romance'),
('The Adventures of Huckleberry Finn', 3, 1884, 'Adventure');

INSERT INTO Members (FullName, MembershipDate, Email)
VALUES
('Alice Johnson', '2023-01-15', 'alice@example.com'),
('Bob Smith', '2023-02-20', 'bob@example.com'),
('Charlie Brown', '2023-03-05', 'charlie@example.com');

-- Querying the Data
-- To verify that the data has been added correctly, you can run the following queries:
-- Retrieve Authors

SELECT * FROM Authors;

-- Retrieve Books

SELECT * FROM Books;

-- Retrieve Members

SELECT * FROM Members;

-- Summary
--  In this project, we successfully created a LibraryDB database, defined tables for authors,
--  books, and members, and inserted sample data. This foundational setup can be expanded with
--  additional features such as:
--    ● Transactions: Handling book loans.
--    ● Search Functionality: Finding books or members.
--    ● Reporting: Generating reports on book availability and member activity