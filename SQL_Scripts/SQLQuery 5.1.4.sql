-----------------------------------------------
-- Performing Database Backups
-----------------------------------------------

-- Getting database file information
EXEC sp_HelpDB 'AdventureWorks'
EXEC sp_SpaceUsed
SELECT * FROM Sys.Database_Files

-- Perform a basic backup
BACKUP DATABASE AdventureWorks
TO DISK = 'E:\MSSQL\Backup\AdventureWorks-Full.bak'

-- Perform a differential backup
BACKUP DATABASE AdventureWorks
TO DISK = 'E:\MSSQL\Backup\AdventureWorks-Differential.bak'
WITH DIFFERENTIAL

-- Perform multiple transaction log backups
BACKUP LOG AdventureWorks
TO DISK = 'E:\MSSQL\Backup\AdventureWorks-Log-01.bak'

BACKUP LOG AdventureWorks
TO DISK = 'E:\MSSQL\Backup\AdventureWorks-Log-02.bak'

BACKUP LOG AdventureWorks
TO DISK = 'E:\MSSQL\Backup\AdventureWorks-Log-03.bak'

BACKUP LOG AdventureWorks
TO DISK = 'E:\MSSQL\Backup\AdventureWorks-Log-04.bak'

-----------------------------------------------
-- Other Backup Options
-----------------------------------------------
-- Perform a partial backup
BACKUP DATABASE AdventureWorks
READ_WRITE_FILEGROUPS
TO DISK = 'E:\MSSQL\Backup\AdventureWorks-Partial.bak'

-- Perform a copy-only backup
BACKUP DATABASE AdventureWorks
TO DISK = 'E:\MSSQL\Backup\AdventureWorks-Copy.bak'
WITH COPY_ONLY