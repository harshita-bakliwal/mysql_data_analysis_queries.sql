CREATE TABLE Contact (
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip VARCHAR(10),
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone VARCHAR(12),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID)
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone VARCHAR(12)
);

CREATE TABLE ContactEmployee (
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

UPDATE Employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.'; 

SELECT ContactEmployeeID 
FROM ContactEmployee ce
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Employee e ON ce.EmployeeID = e.EmployeeID
WHERE c.FirstName = 'Dianne' AND c.LastName = 'Connor'
AND e.FirstName = 'Jack' AND e.LastName = 'Lee';

DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 5;

SELECT e.FirstName, e.LastName
FROM Employee e
JOIN ContactEmployee ce ON e.EmployeeID = ce.EmployeeID
JOIN Contact c ON ce.ContactID = c.ContactID
JOIN Company co ON c.CompanyID = co.CompanyID
WHERE co.CompanyName = 'Toll Brothers';

SELECT * FROM Employee WHERE FirstName LIKE 'J%';

SELECT * FROM Employee WHERE FirstName LIKE 'J_n';

## Normalization is the process of organizing data in a relational database to reduce redundancy 
##(duplicate data) and improve data integrity (accuracy).
##It involves dividing large tables into smaller, related tables and defining relationships between them.  


##In MySQL, a JOIN is a clause used to combine rows from two or more tables based on a related column between them.
##Because relational databases use normalization to split data into separate, specialized tables (like "Customers" and "Orders"),
##a JOIN is the bridge that allows you to pull that scattered data back together into a single, meaningful result set.
 
 
 ##In MySQL, SQL commands are categorized into different "sub-languages" based on their specific function. Understanding these helps you manage not just the data, but the structure and security of the entire database.

##1. DDL (Data Definition Language)
-- DDL is used to define or modify the database structure . It deals with the "containers" where data is stored,
--  such as tables, indexes, and databases themselves.
-- Key characteristic: Changes made by DDL are usually auto-committed
-- Common Commands:: To create a new database or table.
-- ALTER: To modify an existing table (e.g., adding a column).
--  To delete an entire table or database.
-- TRUNCATE: To remove all records from a table but keep the structure.

-- 2. DML (Data Manipulation Language)
-- DML is used to manage the data stored within those structures.
--  This is what you use for your day-to-day operations like adding or changing information.
-- Key characteristic: DML commands deal with the rows/records inside the tables.
-- Common Commands:
-- INSERT: To add new rows of data.
-- UPDATE: To modify existing data.
-- DELETE: To remove specific rows.
-- Note: While SELECT is sometimes called DQL (Data Query Language), it is often grouped under DML in general discussions.

-- 3. DCL (Data Control Language)
-- DCL is used to control access to the data. It is the security layer of MySQL,
--  ensuring that only authorized users can perform certain actions.
-- Key characteristic: DCL manages permissions and rights.
-- Common Commands:
-- GRANT: To give a user permission to perform tasks .
-- REVOKE: To take back permissions previously granted.

-- A MySQL JOIN clause combines rows from multiple tables based on a related column, typically linking a primary key to a foreign key.
--  It is essential for retrieving data from a normalized database where information is stored in separate tables to reduce redundancy.
--  Common types include INNER JOIN (only matching records), LEFT JOIN (all from the left table plus matches
--  and RIGHT JOIN (all from the right table plus matches). Ultimately, JOINs allow you to reconstruct complete records from an organized,
--  fragmented database for meaningful analysis.  
