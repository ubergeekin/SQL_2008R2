-----------------------------------------------
-- Viewing Backup and Restore Information
-----------------------------------------------

-- Viewing backup file information
RESTORE LABELONLY FROM DISK = 'E:\MSSQL\Backup\Test_01.bak'
RESTORE HEADERONLY FROM DISK = 'E:\MSSQL\Backup\Test_01.bak'
RESTORE FILELISTONLY FROM DISK = 'E:\MSSQL\Backup\Test_01.bak'
RESTORE VERIFYONLY FROM 
	DISK = 'E:\MSSQL\Backup\Test_01.bak',
	DISK = 'E:\MSSQL\Backup\Test_02.bak',
	DISK = 'E:\MSSQL\Backup\Test_03.bak'

-- Viewing restore history details
SELECT * FROM msdb.dbo.RestoreFile
SELECT * FROM msdb.dbo.RestoreHistory

-- Viewing backup-related information
SELECT * FROM msdb.dbo.BackupFile
SELECT * FROM msdb.dbo.BackupMediaFamily
SELECT * FROM msdb.dbo.BackupMediaSet
SELECT * FROM msdb.dbo.BackupSet
