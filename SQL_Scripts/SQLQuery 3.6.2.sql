--=======================================
--Create an AFTER DML Trigger
--=======================================
--Create test table
CREATE TABLE dbo.Employees
(
ID				int			IDENTITY(1,1) NOT NULL,
EmployeeNumber	int			NOT NULL,
FirstName		varchar(20),
LastName		varchar(20),
LastUpdate		datetime	NULL
)
--Create trigger to record last modification time
CREATE TRIGGER dbo.UpdateModificationDate
ON dbo.Employees
AFTER UPDATE,INSERT
AS
UPDATE dbo.Employees
SET LastUpdate = GETDATE()
FROM inserted i
WHERE i.ID = dbo.Employees.ID

select * from dbo.Employees

--Get trigger-realted information
SELECT * FROM Sys.Triggers
SELECT OBJECT_NAME(Object_ID), * FROM Sys.Trigger_Events

--Update Employee Information
INSERT INTO dbo.Employees (EmployeeNumber, FirstName, LastName)
VALUES (001, 'Bob', 'Happy')

INSERT INTO dbo.Employees (EmployeeNumber, FirstName, LastName)
VALUES (002, 'Jason', 'Newstead')

INSERT INTO dbo.Employees (EmployeeNumber, FirstName, LastName)
VALUES (003, 'Jason', 'Smith')

--Disable trigger
--DISABLE TRIGGER dbo.UpdateModificationDate
ON dbo.Employees

ENABLE TRIGGER dbo.UpdateModificationDate
ON dbo.Employees

--Drop the table and associated triggers
DROP TABLE dbo.Employees

