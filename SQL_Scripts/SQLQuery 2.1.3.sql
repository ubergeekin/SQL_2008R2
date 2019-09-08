Create Database [Development]

CREATE TABLE [ContactInfo]
(
ID int IDENTITY (1,1),
FirstName	varchar (20),
LastName	varchar (20),
eMailAddress	varchar (50))

EXEC sp_help 'ContactInfo'

--Populate our test table
INSERT INTO ContactInfo
SELECT TOP 1000 LEFT (FirstName,20),
	LEFT (LastName,20),
	LEFT (eMailAddress,50)
FROM AdventureWorks.Person.Contact
ORDER BY ContactID

SELECT TOP 10 * FROM ContactInfo

-- Explicit Transation
BEGIN TRANSACTION
GO

-- 1ST UPDATE
UPDATE ContactInfo
SET eMailAddress = 'test@test.com'
WHERE ID = 1000
GO

SELECT eMailAddress from ContactInfo WHERE ID = 1000
GO

-- Delete rows

DELETE FROM ContactInfo WHERE ID < 100
GO

SELECT COUNT(*) AS NumberOfRows FROM ContactInfo
GO

-- 2nd UPDATE

UPDATE ContactInfo
SET FirstName = 'Test'
WHERE ID = 1000
GO

-- End Transaction

ROLLBACK TRANSACTION
GO

-- Test Values

SELECT eMailAddress FROM ContactInfo WHERE ID = 1000
SELECT COUNT(*) AS NumberOfRows FROM ContactInfo
GO

-- Cleanup

DROP TABLE ContactInfo
