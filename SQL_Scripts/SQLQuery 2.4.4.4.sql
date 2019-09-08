--==========================================
-- XML Schemas
--==========================================

-- Generating and XML Schema
SELECT TOP 3 FirstName, LastName, JobTitle, eMailAddress
FROM HumanResources.vEmployee as Employee
ORDER BY EmployeeID
FOR XML AUTO,
	ELEMENTS,
	ROOT('Employees'),
	XMLSCHEMA
	
-- Generating and XML Schema Collection
CREATE XML SCHEMA COLLECTION schema_EmployeeData
AS
'<xsd:schema targetNamespace="http://schemas.mcitp_2008_DA.com/EmployeeData" xmlns:schema="urn:schemas-microsoft-com:sql:SqlRowSet1" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:sqltypes="http://schemas.microsoft.com/sqlserver/2004/sqltypes" elementFormDefault="qualified">
    <xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/sqltypes" schemaLocation="http://schemas.microsoft.com/sqlserver/2004/sqltypes/sqltypes.xsd" />
    <xsd:element name="Employee">
      <xsd:complexType>
        <xsd:sequence>
          <xsd:element name="FirstName">
            <xsd:simpleType sqltypes:sqlTypeAlias="[AdventureWorks].[dbo].[Name]">
              <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
                <xsd:maxLength value="50" />
              </xsd:restriction>
            </xsd:simpleType>
          </xsd:element>
          <xsd:element name="LastName">
            <xsd:simpleType sqltypes:sqlTypeAlias="[AdventureWorks].[dbo].[Name]">
              <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
                <xsd:maxLength value="50" />
              </xsd:restriction>
            </xsd:simpleType>
          </xsd:element>
          <xsd:element name="JobTitle">
            <xsd:simpleType>
              <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
                <xsd:maxLength value="50" />
              </xsd:restriction>
            </xsd:simpleType>
          </xsd:element>
          <xsd:element name="eMailAddress" minOccurs="0">
            <xsd:simpleType>
              <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
                <xsd:maxLength value="50" />
              </xsd:restriction>
            </xsd:simpleType>
          </xsd:element>
        </xsd:sequence>
      </xsd:complexType>
    </xsd:element>
  </xsd:schema>'
  

-- Get Schema Information
SELECT * FROM sys.xml_schema_namespaces
SELECT * FROM sys.xml_schema_collections

-- Create a typed XML variable
DECLARE @XMLData_Typed xml (schema_EmployeeData)

-- Create a table using a typed XML column
CREATE TABLE [Employees]
(ID int
, EmployeeData xml (CONTENT schema_EmployeeData),
)

-- Add data to our table
INSERT INTO Employees (EmployeeData)
VALUES
('<Employee xmlns="http://schemas.mcitp_2008_DA.com/EmployeeData">
    <FirstName>Guy</FirstName>
    <LastName>Gilbert</LastName>
    <JobTitle>Production Technician - WC60</JobTitle>
    <eMailAddress>guy1@adventure-works.com</eMailAddress>
  </Employee>
  <Employee xmlns="http://schemas.mcitp_2008_DA.com/EmployeeData">
    <FirstName>Kevin</FirstName>
    <LastName>Brown</LastName>
    <JobTitle>Marketing Assistant</JobTitle>
    <eMailAddress>kevin0@adventure-works.com</eMailAddress>
  </Employee>
  <Employee xmlns="http://schemas.mcitp_2008_DA.com/EmployeeData">
    <FirstName>Roberto</FirstName>
    <LastName>Tamburello</LastName>
    <JobTitle>Engineering Manager</JobTitle>
    <eMailAddress>roberto0@adventure-works.com</eMailAddress>
  </Employee>')

-- Get XML Data from the data
SELECT * FROM Employees

-- Perform Cleanup
DROP TABLE Employees
DROP XML SCHEMA COLLECTION schema_EmployeeData
