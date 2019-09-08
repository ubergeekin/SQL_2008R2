--=======================================
-- Working with constraints
--=======================================

-- create test table
CREATE TABLE Test_Employee
(
ID			int IDENTITY(1,1)		not null,
FirstName	varchar(20)				null,
LastName	varchar(20)				null,
PhoneNumber	varchar(20)				null,
HireDate	datetime				null,
CONSTRAINT PK_EmployeeID PRIMARY KEY (ID)
)
INSERT INTO Test_Employee (FirstName, LastName, PhoneNumber)
VALUES ('Jason', 'Smith', '555-555-1212')

SELECT * FROM Test_Employee

-- add unique constraint
ALTER TABLE Test_Employee ADD UNIQUE (FirstName, LastName)

INSERT INTO Test_Employee (FirstName, LastName, PhoneNumber)
VALUES ('Betty', 'Boop', '555-555-1212')


ADD CONSTRAINT constraint_PhoneNumber
CHECK (PhoneNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')

INSERT INTO Test_Employee (FirstName, LastName, PhoneNumber)
VALUES ('Test', 'Employee', '555-1212')

INSERT INTO Test_Employee (FirstName, LastName, PhoneNumber)
VALUES ('Test', 'Employee', '555-555-1212')

-- cleanup
DROP TABLE Test_Employee
