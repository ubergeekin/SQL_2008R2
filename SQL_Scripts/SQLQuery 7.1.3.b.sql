-------------------------------------------------
-- Implement Database Mirroring
-------------------------------------------------

--    ** SCRIPT FOR MIRROR SERVER **

--Restore the AdventureWorks_new DB on the mirror server
RESTORE DATABASE AdventureWorks_new
FROM DISK = 'E:\MSSQL\Backup\AdventureWorks-Database.bak'
WITH 
	MOVE 'AdventureWorks_Data' TO 'E:\MSSQL\Data\AdventureWorks_Mirror.mdf',
	MOVE 'AdventureWorks_Log' TO 'E:\MSSQL\Data\AdventureWorks_Mirror.ldf',
	REPLACE,
	NORECOVERY

RESTORE LOG AdventureWorks_new
FROM DISK = 'E:\MSSQL\Backup\AdventureWorks-Log.bak'
WITH NORECOVERY