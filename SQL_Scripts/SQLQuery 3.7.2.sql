--==========================================
--Create a scalar function
--==========================================
--Create scalar-valued function
CREATE FUNCTION dbo.fn_GetCircleArea (@Radius decimal (10,5))
RETURNS decimal (10,5)
AS
BEGIN
	DECLARE @Area decimal (10,5)
	SET @Area = PI() * (@Radius * @Radius)
	RETURN @Area
END

--Create test table
CREATE TABLE dbo.CircleData
(
	ID		int		IDENTITY(1,1) NOT NULL,
	Radius	decimal (10, 5)
)
--Add data to test table
INSERT INTO dbo.CircleData (Radius) VALUES (1.5)
INSERT INTO dbo.CircleData (Radius) VALUES (2.5)
INSERT INTO dbo.CircleData (Radius) VALUES (3.5)
INSERT INTO dbo.CircleData (Radius) VALUES (125.5)
INSERT INTO dbo.CircleData (Radius) VALUES (10.5)

--Use scalar-valued function
SELECT ID, Radius, dbo.fn_GetCircleArea(Radius) as Area
FROM dbo.CircleData
ORDER BY Radius

--==============================================
--Create a table-valued function
--==============================================
CREATE FUNCTION dbo.fn_GetLargestCircleRadius()
RETURNS TABLE
AS
RETURN
(
	SELECT TOP 1 Radius
	FROM dbo.CircleData
	ORDER BY Radius DESC
)

--Use the table-valued function
SELECT * FROM dbo.fn_GetLargestCircleRadius()

--Look @ functions in OE

--Cleanup objects
DROP TABLE dbo.CircleData
DROP FUNCTION dbo.fn_GetCircleArea
DROP FUNCTION dbo.fn_GetLargestCircleRadius
