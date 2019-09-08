--====================================================
-- Implementing messaging with service broker
--====================================================

-- Setup the test device
USE Development
ALTER DATABASE Development SET ENABLE_BROKER
ALTER DATABASE Development SET TRUSTWORTHY ON

-- Define message types
CREATE MESSAGE TYPE SubmitOrder VALIDATION = NONE
CREATE MESSAGE TYPE OrderResponse VALIDATION = NONE

-- Define a contract for sending order
CREATE CONTRACT OrderProcessingContract
(
	SubmitOrder SENT BY INITIATOR
	OrderResponse SENT BY TARGET
)

-- Create queue for communicating orders
CREATE QUEUE PendingOrdersQueue
CREATE QUEUE NewOrdersQueue

-- Create services for sending messages
CREATE SERVICE ProcessOrderService
ON QUEUE PendingOrdersQueue (OrderProcessingContract)

CREATE SERVICE OrderEntryApplicationService
ON QUEUE NewOrdersQueue (OrderProcessingContract)

--====================================================
-- Create and process messages
--====================================================

-- Begin a conversation
DECLARE @DialogID UniqueIdentifier

BEGIN DIALOG CONVERSATION @DialogID
FROM SERVICE OrderEntryApplicationService
TO SERVICE 'ProcessOrderService'
ON CONTRACT OrderProcessingContract;

-- Send a message
SEND ON CONVERSATION @DialogID
MESSAGE TYPE SubmitOrder ('937');

-- Process message and send response
DECLARE @DialogID		UniqueIdentifier
DECLARE @MessageType	varchar(50)
DECLARE @Message		varchar(50)

BEGIN
		-- Process 1st item
		RECEIVE TOP(1)
			@DialogID = Conversation_Handle,
			@MessageType = Message_Type_Name,
			@Message = Message_Body
		FROM PendingOrdersQueue;
		
		IF (@Message = 'SubmitOrder')
		BEGIN
			-- Send response
			SEND ON CONVERSATION @DialogID
			MESSAGE TYPE OrderResponse ('Order '
			+ @Message + ' has been processed');
			
			PRINT 'Processed Order #' + @Message
		END
END

-- Check order entry queue for a response message
RECEIVE TOP(1) * FROM NewOrdersQueue

-- Drop service broker related object
DROP SERVICE ProcessOrderService
DROP SERVICE OrderEntryApplicationService
DROP QUEUE PendingOrdersQueue
DROP QUEUE NewOrdersQueue
DROP CONTRACT OrderProcessingContract
DROP MESSAGE TYPE SubmitOrder
DROP MESSAGE TYPE OrderResponse
