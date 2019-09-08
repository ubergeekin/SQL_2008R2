------------------------------------------------
-- Maintaining Indexes
------------------------------------------------

-- Get Index-related information
SELECT * FROM Sys.Indexes

SELECT OBJECT_NAME(Object_ID) as ObjectName, *
FROM Sys.Index_Columns

-- Get index fragment-related information
SELECT OBJECT_NAME(Object_ID) as ObjectName, * 
FROM Sys.DM_DB_Index_Physical_Stats
(DB_ID(), OBJECT_ID('dbo.Person'), NULL, NULL, NULL)

-- Reorganize the index
ALTER INDEX index_Contact1 ON dbo.Person
REORGANIZE

-- Rebuild the index
ALTER INDEX index_Contact1 ON dbo.Person
REBUILD