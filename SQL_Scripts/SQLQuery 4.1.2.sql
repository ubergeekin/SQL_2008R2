------------------------------------------------
-- Creating Indexes
------------------------------------------------

-- Copy test data from AdventureWorks database
SELECT ContactID, FirstName, MiddleName, LastName,
		EMailAddress, Phone
INTO dbo.Person
FROM AdventureWorks.Person.Contact

-- Create a clustered index
CREATE UNIQUE CLUSTERED INDEX pk_Contact1
ON dbo.Person
(
	[ContactID] ASC
)

-- Test query (range)
SELECT * 
FROM dbo.Person
WHERE ContactID BETWEEN 100 and 200

-- Test Query (specific IDs)
SELECT FirstName, EMailAddress
FROM dbo.Person
WHERE ContactID IN (100, 150, 1852, 11322, 14783)

-- Create a non-clustered index
CREATE INDEX index_Contact1
ON dbo.Person
(
	ContactID,
	FirstName,
	LastName
)

-- Work with covering indexes
CREATE INDEX index_Contact1
ON dbo.Person
(
	ContactID,
	FirstName,
	LastName
)
INCLUDE (EMailAddress)
WITH DROP_EXISTING

-- Test Query (covered columns only)
SELECT FirstName, LastName, EMailAddress
FROM dbo.Person

-- Perform clean-up
DROP INDEX index_Contact1 ON dbo.Person
DROP TABLE dbo.Person