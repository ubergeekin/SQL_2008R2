--=====================================
-- Create UDT
--=====================================

-- Create Phone Number data type
CREATE TYPE dbo.type_PhoneNumber FROM varchar(20) NULL

-- Create table using the data type
CREATE TABLE dbo.Employees
(
	ID			int			IDENTITY(1,1) NOT NULL,
	FirstName	varchar(20),
	LastName	varchar(20),
	HomePhone	dbo.type_PhoneNumber,
	OfficePhone	dbo.type_PhoneNumber,
)
sp_help 'dbo.Employees'
--=====================================
-- Create and bind rule
--=====================================
-- Define rule for use in db
CREATE RULE dbo.rule_PhoneNumberFormat
AS @vaule LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'

EXEC sp_bindrule
	'dbo.rule_PhoneNumberFormat',
	'dbo.type_PhoneNumber'
	
	
INSERT INTO dbo.Employees(FirstName, LastName, HomePhone, OfficePhone)
VALUES ('Paul','Marquardt', '555-555-1212', '555-123-4567')

--=====================================
-- Create and bind default
--=====================================
CREATE DEFAULT dbo.default_PhoneNumber
AS '555-555-1212'

-- Bind default to column
EXEC sp_bindefault
	'dbo.default_PhoneNumber',
	'dbo.type_PhoneNumber'

INSERT INTO dbo.Employees(FirstName, LastName)
VALUES ('Paul','Marquardt')

SELECT * FROM dbo.Employees
