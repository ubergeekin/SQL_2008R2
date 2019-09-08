--=================================
--Querying Full-Text Indexes
--=================================

--Use CONTAINS in a query
SELECT *
FROM Documents
WHERE CONTAINS(Document, 'Crank')

--Use CONSTRAINABLE in a query
SELECT *
FROM CONTAINSTABLE(Documents, Document, 'Crank')
