------------------------------------------------
-- Maintaining Statistics
------------------------------------------------

-- Get list of statistics
SELECT OBJECT_NAME(Object_ID) as ObjectName, * 
FROM Sys.Stats

-- Update statistics for a specific table
UPDATE STATISTICS dbo.Person 
WITH FULLSCAN

-- Update all statistics in the database
EXEC sp_UpdateStats 

-- Get statistics details
DBCC SHOW_STATISTICS ('dbo.Person', 'index_Contact1')