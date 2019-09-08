--======================================
-- Using OPENXML to read XML data
--======================================

-- Generating XML Data
SELECT TOP 3 FirstName, LastName, JobTitle, eMailAddress
FROM HumanResources.vEmployee as Employee
ORDER BY EmployeeID
FOR XML AUTO,
	ELEMENTS,
	ROOT('Employees')

-- Create an XML document variable
DECLARE @XMLData xml
SET @XMLData =
'<?xml version="1.0" ?>
<Employees>
  <Employee>
    <FirstName>Guy</FirstName>
    <LastName>Gilbert</LastName>
    <JobTitle>Production Technician - WC60</JobTitle>
    <eMailAddress>guy1@adventure-works.com</eMailAddress>
  </Employee>
  <Employee>
    <FirstName>Kevin</FirstName>
    <LastName>Brown</LastName>
    <JobTitle>Marketing Assistant</JobTitle>
    <eMailAddress>kevin0@adventure-works.com</eMailAddress>
  </Employee>
  <Employee>
    <FirstName>Roberto</FirstName>
    <LastName>Tamburello</LastName>
    <JobTitle>Engineering Manager</JobTitle>
    <eMailAddress>roberto0@adventure-works.com</eMailAddress>
  </Employee>
</Employees>'

-- Prepare document for use by OPENXML
DECLARE @XMLDocumentID int -- Stores the doc ID
EXEC sp_xml_PrepareDocument @XMLDocumentID OUTPUT, @XMLData

-- Create and OPENXML query to shred the document
SELECT *
FROM OPENXML(@XMLDocumentID, 'Employees/Employee', 2)
WITH
(
	FirstName		varchar(50),
	LastName		varchar(50),
	JobTitle		varchar(50),
	eMailAddress	varchar(50)
)

-- Cleanup
EXEC sp_xml_RemoveDocument @XMLDocumentID
