------------------------------------------------
-- Shrinking Database Files
------------------------------------------------

-- Perform database changes
SELECT * INTO Transactions_01 FROM AdventureWorks.Production.TransactionHistory
SELECT * INTO Transactions_02 FROM AdventureWorks.Production.TransactionHistory
SELECT * INTO Transactions_03 FROM AdventureWorks.Production.TransactionHistory

-- Drop the test tables
DROP TABLE Transactions_01
DROP TABLE Transactions_02
DROP TABLE Transactions_03

-- View database storage information
EXEC sp_HelpDB 'Development'
EXEC sp_SpaceUsed
DBCC SQLPERF(LOGSPACE)

-- Enable AutoShrink for the Database
ALTER DATABASE Development
SET AUTO_SHRINK ON

-- Shrink a single database file
SELECT * FROM Sys.Database_Files

DBCC SHRINKFILE('Development', 10)
DBCC SHRINKFILE('Development_Log', 10)

-- Shrink all files in database
DBCC SHRINKDATABASE ('Development')