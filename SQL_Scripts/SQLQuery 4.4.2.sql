------------------------------------------------
-- Verifying Database Integrity
------------------------------------------------

-- Run DBCC Commands
DBCC CHECKDB ('AdventureWorks') WITH ESTIMATEONLY
DBCC CHECKDB ('AdventureWorks') WITH DATA_PURITY
DBCC CHECKDB ('AdventureWorks') 

-- Viewing current activity
SELECT * FROM Sys.DM_Exec_Requests