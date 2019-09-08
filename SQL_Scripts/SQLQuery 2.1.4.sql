-- Create Table
CREATE TABLE [ContactInfo]
(
ID int IDENTITY (1,1),
FirstName	varchar (20),
LastName	varchar (20),
eMailAddress	varchar (50))

-- View Info
EXEC sp_help 'ContactInfo'

--Populate our test table
INSERT INTO ContactInfo
SELECT TOP 1000 LEFT (FirstName,20),
	LEFT (LastName,20),
	LEFT (eMailAddress,50)
FROM AdventureWorks.Person.Contact
ORDER BY ContactID

SELECT TOP 10 * FROM ContactInfo

-- Explicit Transation
BEGIN TRY
	BEGIN TRANSACTION
		DELETE FROM ContactInfo WHERE ID < 100
		UPDATE ContactInfo
		SET FirstName = 'MY NAME IS TOO LONG AND WILL CAUSE AND ERROR IN THE SYSTEM'
		WHERE ID = 1000
	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	-- Rollback Transaction
	ROLLBACK TRANSACTION

	-- Output error-related details
	PRINT '==========================================='
	PRINT '--ERROR DETAILS	'
	PRINT '==========================================='
	PRINT 'ERROR MESSAGE:	' + ERROR_MESSAGE()
	PRINT 'ERROR NUMBER:	' + CONVERT(VARCHAR,ERROR_NUMBER())
	PRINT 'SEVERITY:		' + CONVERT(VARCHAR,ERROR_SEVERITY())
	PRINT 'STATE:			' + CONVERT(VARCHAR,ERROR_STATE())
	PRINT 'LINE #:			' + CONVERT(VARCHAR,ERROR_LINE())
END CATCH

-- Test Values
SELECT FirstName FROM ContactInfo WHERE ID = 1000
SELECT COUNT(*) AS NumberOfRows FROM ContactInfo
GO

-- Cleanup
DROP TABLE ContactInfo
