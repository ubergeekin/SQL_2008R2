-----------------------------------------------
-- Working with Backup Media
-----------------------------------------------

-- Backup to multiple disk files
BACKUP DATABASE AdventureWorks
TO 
	DISK = 'E:\MSSQL\Backup\Test_01.bak',
	DISK = 'E:\MSSQL\Backup\Test_02.bak',
	DISK = 'E:\MSSQL\Backup\Test_03.bak'
WITH 
	FORMAT,
	MEDIANAME = 'Adventure Works Backup',
	MEDIADESCRIPTION = 'Test backup for spreading accross multiple files'

-- Creating a mirrored backup set
BACKUP DATABASE AdventureWorks
TO DISK = 'E:\MSSQL\Backup\AdventureWorks_Backup_Primary.bak'
MIRROR TO DISK = 'E:\MSSQL\Backup\AdventureWorks_Backup_Mirror.bak'
WITH FORMAT

-- Backup to a network share
BACKUP DATABASE AdventureWorks
TO DISK = '\\NAS01\Backups\NetworkBackup.bak'

-- Backup to a tape device
BACKUP DATABASE AdventureWorks
TO TAPE = '\\.\tape0'

-- Backup to a logical disk device

	-- Create a new backup device
	EXEC sp_AdDumpDevice 
		@DevType='Disk',
		@LogicalName = 'AdventureWorks Backups',
		@PhysicalName = 'E:\MSSQL\Data\AdventureWorks Backup Device.bak'

	-- View information about backup devices
	SELECT * FROM Sys.Backup_Devices

	-- Create the backup
	BACKUP DATABASE AdventureWorks
	TO [AdventureWorks Backups]
	WITH 
		FORMAT,
		MEDIANAME = 'Adventure Works Backup',
		MEDIADESCRIPTION = 'Test backup to a disk device. '