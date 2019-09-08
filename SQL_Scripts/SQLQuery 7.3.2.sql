---------------------------------------
-- Creating Database Snapshots
---------------------------------------

-- View information about AdventureWorks_new Database
SELECT * FROM Sys.Database_Files

-- Create a new database snaphost
CREATE DATABASE AdventureWorks_new_Snapshot01
ON 
(
	NAME = 'AdventureWorks_Data',
	FILENAME = 'E:\MSSQL\Data\AdventureWorks_new_Snapshot01.mdf'
)
AS SNAPSHOT OF AdventureWorks_new	

-- Use the new Database Snapshot
USE AdventureWorks_new_Snapshot01

-- Execute an update command
SELECT TOP 100 * FROM Production.TransactionHistory

-- Perform an update
UPDATE Production.TransactionHistory
SET	Quantity = Quantity + 1

