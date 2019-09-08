-- =========================================
-- Create table
-- =========================================
CREATE TABLE Test_Employee
(
	ID int		IDENTITY(1,1)	not null, 
	FirstName	varchar(20)	NULL, 
	LastName	varchar(20)	NULL, 
    HireDate	datetime	NULL,
)

EXEC sp_help #Test_Employee
SELECT * FROM Test_Employee


-- =========================================
-- ALTER TABLE
-- =========================================
ALTER TABLE #Test_Employee ALTER COLUMN FirstName varchar(25)
ALTER TABLE #Test_Employee ALTER COLUMN LastName varchar(25)
ALTER TABLE #Test_Employee ADD Comments varchar(200)

EXEC sp_help #Test_Employee
SELECT * FROM Test_Employee

DROP TABLE ##Test_Employee
