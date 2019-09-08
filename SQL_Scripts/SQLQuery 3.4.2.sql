--=======================================
-- Creating Views
--=======================================
select * from dbo.Employee
select * from dbo.Department

CREATE VIEW dbo.view_MarketingEmployees AS
SELECT		dbo.Employee.FirstName, dbo.Employee.LastName, dbo.Employee.Salary, Name as Departmentname
FROM		dbo.Department INNER JOIN
			dbo.Employee ON dbo.Department.ID = dbo.Employee.DepartmentID
WHERE		dbo.Department.ID = 2	           

select * from sys.sql_modules
select * from view_MarketingEmployees
--=======================================
-- Modifying Views
--=======================================
alter view dbo.view_MarketingEmployees as
SELECT		dbo.Employee.FirstName, dbo.Employee.LastName, dbo.Employee.Salary, Name as Departmentname
FROM		dbo.Department INNER JOIN
			dbo.Employee ON dbo.Department.ID = dbo.Employee.DepartmentID
WHERE		dbo.Department.ID = 2	           

with check option

--=======================================
-- Modifying Data with a View
--=======================================	
select * from Employee
select * from view_MarketingEmployees

update	view_MarketingEmployees
set		salary = 100000
where	FirstName = 'Jane'

update	view_MarketingEmployees
set		salary = 101000
where	FirstName = 'Max'

--=======================================
-- Schemabinding
--=======================================
alter view dbo.view_MarketingEmployees
with schemabinding as
SELECT		dbo.Employee.FirstName, dbo.Employee.LastName, dbo.Employee.Salary, Name as Departmentname
FROM		dbo.Department INNER JOIN
			dbo.Employee ON dbo.Department.ID = dbo.Employee.DepartmentID
WHERE		dbo.Department.ID = 2	           

	
--=======================================
-- Indexed View
--=======================================
create unique clustered index Index_MarketingEmployees
on dbo.view_MarketingEmployees (FirstName, LastName, DepartmentName)

select	FirstName, LastName, DepartmentName
from	view_MarketingEmployees

--=======================================
-- cleanup
--=======================================
drop view dbo.view_MarketingEmployees

	