-------------------------------------------------
-- Implement Database Mirroring
-------------------------------------------------

--    ** PRINCIPAL SERVER **

-- Backup the AdventureWorks_new Database
BACKUP DATABASE AdventureWorks_new
TO DISK = 'E:\MSSQL\Backup\AdventureWorks-Database.bak'
WITH FORMAT

BACKUP LOG AdventureWorks_new
TO DISK = 'E:\MSSQL\Backup\AdventureWorks-Log.bak'
WITH FORMAT

-- Perform test updates
UPDATE AdventureWorks_new.Production.TransactionHistory
SET	ModifiedDate = '01-01-2006'

SELECT TOP 100 * 
FROM AdventureWorks_new.Production.TransactionHistory

SELECT TOP 100 * 
FROM [7Y8E324KMABCL9R\TEST].AdventureWorks_new.Production.TransactionHistory

