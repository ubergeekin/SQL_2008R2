--===========================
-- FOR XML Clause
--===========================

-- FOR XML AUTO
SELECT *
FROM	HumanResources.vEmployee
FOR XML AUTO

-- Element Based Output
SELECT *
FROM HumanResources.vEmployee
FOR XML RAW('Employees'), ELEMENTS

-- FOR XML PATH W/ROOT
SELECT
	FirstName as "@FirstName",
	LastName as "@LastName",
	Phone as "ContactInfo/Phone",
	eMailAddress as "ContactInfo/eMailAddress"
FROM	HumanResources.vEmployee
FOR XML PATH, ROOT('Employees')
