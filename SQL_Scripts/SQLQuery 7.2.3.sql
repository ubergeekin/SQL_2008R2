------------------------------------------
-- Monitoring Log Shipping
------------------------------------------

-- Using System Stored Procedures
EXEC SP_Help_Log_Shipping_Monitor 

-- Querying System Views
SELECT * FROM msdb.dbo.Log_Shipping_Monitor_History_Detail
SELECT * FROM msdb.dbo.Log_Shipping_Monitor_Primary
SELECT * FROM msdb.dbo.Log_Shipping_Monitor_Secondary
SELECT * FROM msdb.dbo.Log_Shipping_Monitor_Error_Detail