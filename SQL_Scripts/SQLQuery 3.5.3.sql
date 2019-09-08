--================================
-- Create a CLR Based Data Type
--================================

--Enable CLR Integration
EXEC sp_configure 'clr enabled', 1
RECONFIGURE

--Create the assembly reference based on a DLL
CREATE ASSEMBLY clr_ComplexNumber
FROM 'C:\Temp\ComplexNumber.dll'

-- Create new data type
CREATE TYPE type_ComplexNumber
EXTERNAL NAME clr_ComplexNumber.[Microsoft.Samples.SqlServer.ComplexNumber];

--Create a table using the data type
CREATE TABLE dbo.EngineeringData
(
	ID	INT	IDENTITY(1,1) NOT NULL,
	Data	dbo.type_ComplexNumber
)

--Perform a test INSERT
INSERT INTO dbo.EngineeringData(Data) VALUES ('(1, 2i)')
INSERT INTO dbo.EngineeringData(Data) VALUES ('(3, 1i)')
INSERT INTO dbo.EngineeringData(Data) VALUES ('(2, 7i)')

SELECT ID, Data, CONVERT(varchar,Data) as TextValue 
FROM dbo.EngineeringData

--Cleanup
DROP TABLE dbo.EngineeringData
DROP TYPE type_ComplexNumber
DROP ASSEMBLY clr_ComplexNumber

