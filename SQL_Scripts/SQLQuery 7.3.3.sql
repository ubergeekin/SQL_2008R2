---------------------------------------
-- Managing Database Snapshots
---------------------------------------

SELECT TOP 100 * 
FROM Production.TransactionHistory
ORDER BY TransactionID

UPDATE Production.TransactionHistory
SET Quantity = 5

-- Reverting to a database snapshot
RESTORE DATABASE AdventureWorks_new
FROM DATABASE_SNAPSHOT = 'AdventureWorks_new_Snapshot01'

-- Drop a database snapshot
DROP DATABASE AdventureWorks_new_Snapshot01

