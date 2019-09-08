--==============================================
-- Catalog Listing of SYS Views
--==============================================

-- Obtain list of system views
SELECT * FROM sys.system_views ORDER BY name

-- Obtain list of tables
SELECT * FROM sys.tables ORDER BY name

-- Obtain list of views
SELECT * FROM sys.views ORDER BY name

--==============================================
-- System Stored Procedures
--==============================================

-- General DB info
EXEC sp_help

-- Obtain table info
EXEC sp_help 'HumanResources.Employee'

-- Obtain object text
exec sp_helptext 'HumanResources.vEmployee'

--==============================================
-- Information Schema Views
--==============================================

--- Obtain list of tables
SELECT * FROM INFORMATION_SCHEMA.TABLES
where TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, TABLE_NAME

-- Obtain view information
SELECT * FROM INFORMATION_SCHEMA.VIEWS
ORDER BY TABLE_SCHEMA, TABLE_NAME

--==============================================
-- Dependencies
--==============================================

-- Obtain depdencies for table
EXEC sp_depends 'HumanResources.vEmployeeDepartment'
