--==============================================
--Create stored procedure
--==============================================
--Create test table
CREATE TABLE dbo.Employee
(
ID				int		IDENTITY(1,1),
EmployeeName	varchar(30) NOT NULL,
Salary			int	NOT NULL
)
--Add data to table
INSERT INTO dbo.Employee (EmployeeName, Salary)
VALUES ('Jason Newstead', 10000)

INSERT INTO dbo.Employee (EmployeeName, Salary)
VALUES ('Joe the ENG', 100000)

INSERT INTO dbo.Employee (EmployeeName, Salary)
VALUES ('Mary Jane RC', 101000)

--Create stored procedure
CREATE PROCEDURE dbo.proc_IncreaseSalary
	@PercentIncrease int,
	@Result varchar(50) OUTPUT
AS
BEGIN
	UPDATE Employee
	SET Salary = Salary + (Salary * @PercentIncrease / 100)

	IF (@PercentIncrease > 5)
	BEGIN
		SET @Result = 'PARTY IS AT MY PLACE!!!'
	END
	ELSE SET @Result = 'PARTY IS AT JOES'
END

--Use Salary Procedure
DECLARE @Comments varchar(50)
EXECUTE proc_IncreaseSalary @PercentIncrease = 10, @Result = @Comments OUTPUT
PRINT @Comments

SELECT * FROM dbo.Employee

--Look @ stored procedure in OE

--Cleanup
DROP TABLE dbo.Employee
DROP PROCEDURE dbo.proc_IncreaseSalary
