--------------------------------------
-- Managing Deadlocks
--------------------------------------

------	Transaction # 1 ------	
	-- Start a transaction
	BEGIN TRAN

	UPDATE HumanResources.Employee SET VacationHours = VacationHours + 1
	WAITFOR DELAY '00:00:45'
	UPDATE HumanResources.Department SET ModifiedDate = GetDate()

	-- End the transaction
	ROLLBACK TRAN

------	Transaction # 2 ------	
	-- Start a transaction
	BEGIN TRAN

	UPDATE HumanResources.Department SET ModifiedDate = GetDate()
	WAITFOR DELAY '00:00:45'
	UPDATE HumanResources.Employee SET VacationHours = VacationHours + 1

	-- End the transaction
	ROLLBACK TRAN

