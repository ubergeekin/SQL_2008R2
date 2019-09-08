-- Bulk Insert

-- Create table
CREATE TABLE DBO.Users
(
	FirstName	varchar(100),
	LastName	varchar(100),
)

-- Import test data
SELECT EmployeeID, FirstName, LastName
FROM	AdventureWorks.HumanResources.vEmployee
ORDER BY LastName, FirstName

-- BULK INSERT of data
BULK INSERT [Development].[DBO].[Users]
FROM 'C:\MSSQL\Users.csv'
WITH
(
	DATAFILETYPE = 'widechar', 
	FIELDTERMINATOR = ','
)
-- View Data
SELECT * FROM dbo.Users

-- Cleanup
DROP TABLE Users
