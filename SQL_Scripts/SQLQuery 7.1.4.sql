--------------------------------------------
-- Managing Database Mirroring
--------------------------------------------

-- View mirroring status
SELECT * FROM Sys.Database_Mirroring 

-- Fail-over to the mirror server
ALTER DATABASE AdventureWorks_new SET PARTNER FAILOVER

