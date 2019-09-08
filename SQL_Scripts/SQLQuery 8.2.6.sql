  --===============================
  -- Working with replication
  --===============================
  
  -- Query the publisher
  SELECT TOP 100 *
  FROM [7Y8E324KMABCL9R].AdventureWorks_new.Production.TransactionHistory
  ORDER BY TransactionID
  
 --	Query the subscriber
 SELECT TOP 100 *
 FROM [7Y8E324KMABCL9R\TEST].AdventureWorks_new.Production.TransactionHistory
 ORDER BY TransactionID
 
 -- Update data
 UPDATE [7Y8E324KMABCL9R].AdventureWorks_new.Production.TransactionHistory
 SET Quantity = Quantity +1
 WHERE TransactionID BETWEEN 100000 AND 100099
 