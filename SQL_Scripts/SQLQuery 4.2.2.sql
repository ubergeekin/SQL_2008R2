--============================================
-- Creating Full-Text Indexes
--============================================

--Copy data from AdventureWorks db
SELECT *
INTO Documents
FROM AdventureWorks.Production.Document

--Create a PRIMARY KEY on the Documents table
CREATE UNIQUE CLUSTERED INDEX PK_Documents
ON Documents (DocumentID ASC)
	
--Get table Information
SELECT * FROM Documents
EXEC sp_help 'Documents'

--Create a Full-Text Catalog
CREATE FULLTEXT CATALOG FTCatalog_Documents

-Create a Full-Text Index
CREATE FULLTEXT INDEX ON Documents
	(Document
	TYPE COLUMN FileExtension)	--Specifies the document datatype
	KEY INDEX PK_Documents		--Index name
	ON FTCatalog_Documents		--Full text catalog
	WITH CHANGE_TRACKING AUTO	--Automatically update the index

--Get Full-Text information
SELECT * FROM Sys.FullText_Catalogs
SELECT * FROM Sys.fulltext_indexes
SELECT * FROM Sys.fulltext_document_types
EXEC sp_help_fulltext_tables

--Populate the Full-Text Index
ALTER FULLTEXT INDEX ON Documents
	START FULL POPULATION


-Cleanup
DROP FULLTEXT INDEX ON Documents
DROP FULLTEXT CATALOG FTCatalog_Documents
DROP TABLE Documents

