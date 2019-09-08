--==============================================
-- Querying linked servers
--==============================================

SELECT [EmployeeID]
      ,[NationalIDNumber]
      ,[ContactID]
      ,[LoginID]
      ,[ManagerID]
      ,[Title]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [7Y8E324KMABCL9R\TEST].[AdventureWorks_new].[HumanResources].[Employee]


UPDATE [7Y8E324KMABCL9R\TEST].[Adventureworks_new].[Sales].[SalesOrderDetail]
SET ModifiedDate = GETDATE()

-- Execute a distributed query
	
SELECT     
e.EmployeeID, 
c.Title, 
c.FirstName, 
c.MiddleName, 
c.LastName, 
c.Suffix, 
e.Title AS JobTitle, 
c.Phone, 
c.EmailAddress, 
c.EmailPromotion, 
a.AddressLine1, 
a.AddressLine2, 
a.City, 
sp.Name AS StateProvinceName, 
a.PostalCode, cr.Name AS CountryRegionName, 
c.AdditionalContactInfo
FROM        [7Y8E324KMABCL9R\TEST].[Adventureworks_new].[HumanResources].[Employee]
 AS e INNER JOIN
      Person.Contact AS c ON c.ContactID = e.ContactID INNER JOIN
      HumanResources.EmployeeAddress AS ea ON e.EmployeeID = ea.EmployeeID INNER JOIN
      Person.Address AS a ON ea.AddressID = a.AddressID INNER JOIN
      Person.StateProvince AS sp ON sp.StateProvinceID = a.StateProvinceID INNER JOIN
      Person.CountryRegion AS cr ON cr.CountryRegionCode = sp.CountryRegionCode

