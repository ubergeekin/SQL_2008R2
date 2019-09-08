-----------------------------------------------
-- Performing Restore Operations
-----------------------------------------------

-- Restoring from a full Backup
RESTORE DATABASE AdventureWorks_New_Copy
FROM DISK = 'E:\MSSQL\Backup\AdventureWorks-Full.bak'
WITH 
	MOVE 'AdventureWorks_Data' TO 'E:\MSSQL\Data\AdventureWorks_New_Copy.mdf',
	MOVE 'AdventureWorks_Log' TO 'E:\MSSQL\Data\AdventureWorks_New_Copy_Log.ldf',
	NORECOVERY

-- Restore from a differential Backup
RESTORE DATABASE AdventureWorks_New_Copy
FROM DISK = 'E:\MSSQL\Backup\AdventureWorks-Differential.bak'
WITH 
	MOVE 'AdventureWorks_Data' TO 'E:\MSSQL\Data\AdventureWorks_New_Copy.mdf',
	MOVE 'AdventureWorks_Log' TO 'E:\MSSQL\Data\AdventureWorks_New_Copy_Log.ldf',
	NORECOVERY

-- Restore Transaction Logs
RESTORE LOG AdventureWorks_New_Copy
FROM DISK = 'E:\MSSQL\Backup\AdventureWorks-Log-01.bak'
WITH NORECOVERY

RESTORE LOG AdventureWorks_New_Copy
FROM DISK = 'E:\MSSQL\Backup\AdventureWorks-Log-02.bak'
WITH NORECOVERY

RESTORE LOG AdventureWorks_New_Copy
FROM DISK = 'E:\MSSQL\Backup\AdventureWorks-Log-03.bak'
WITH NORECOVERY

-- Restore final trasaction log and bring database online
RESTORE LOG AdventureWorks_New_Copy
FROM DISK = 'E:\MSSQL\Backup\AdventureWorks-Log-04.bak'
WITH RECOVERY

-- Perform Clean-up
DROP DATABASE AdventureWorks_New_Copy
