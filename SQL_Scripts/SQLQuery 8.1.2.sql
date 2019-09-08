--=======================================
-- *** Working with linked servers ***
--=======================================

-- Add new SQL linked server
EXEC sp_addlinkedserver   
   @server='7Y8E324KMABCL9R\TEST', 
   @srvproduct='',
   @provider='SQLNCLI'
   
-- Configure linked server properties   
EXEC sp_ServerOption
	@server='7Y8E324KMABCL9R\TEST',
	@optname='query timeout',   
	@optvalue='30'
	
-- View info about linked server
EXEC sp_linkedservers

SELECT * FROM sys.servers

-- Drop linked server

EXEC sp_dropserver
	@server='7Y8E324KMABCL9R\TEST',
	@droplogins='droplogins'
	