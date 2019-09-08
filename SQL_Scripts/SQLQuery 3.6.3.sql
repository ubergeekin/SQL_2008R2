--==========================================
--Create DDL Auditing Trigger
--==========================================
--Create table for storage of auditing info
CREATE TABLE dbo.AuditLog
(
ID				int				IDENTITY(1,1) NOT NULL,
ActionDateTime	datetime		NOT NULL,
ActionType		varchar(20)		NOT NULL,
ObjectType		varchar(20)		NOT NULL,
)

CREATE TRIGGER audit_CreateTable
ON DATABASE
FOR CREATE_TABLE
AS
	INSERT INTO dbo.AuditLog (ActionDateTime, ActionType, ObjectType)
	VALUES (GetDate(), 'CREATE', 'TABLE')
	
--Create a new table
CREATE TABLE dbo.Employee
(
	ID				int			IDENTITY(1,1) NOT NULL,
	EmployeeNumber	int			NOT NULL,
	FirstName		varchar(20),
	LastName		varchar(20),
	LastUpdate		datetime	NULL
)

--View auditing info
SELECT * FROM dbo.AuditLog

--Cleanup
DROP TABLE dbo.Auditlog
DROP TABLE dbo.Employee


