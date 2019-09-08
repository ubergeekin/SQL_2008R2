-------------------------------------------------------------
--  Database Mail: Sending messages
-------------------------------------------------------------
--Get info about messages
SELECT * FROM msdb.dbo.sysmail_allitems
SELECT * FROM msdb.dbo.sysmail_event_log

--Send simple mail
EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'Primary_Datacenter_SMTP_Server',
@recipients = 'DBA@MyCompany.com',
@body = 'A db error has occurred',
@subject = '[AUTOGEN] Database Error'

--Send a message with the results of query
EXEC msdb.dbo.sp_send_dbmail
@profile_name = 'Primary_Datacenter_SMTP_Server',
@recipients = 'DBA@MyCompany.com',
@body = 'A db error has occurred',
@subject = '[AUTOGEN] Database Error',
@query = 'SELECT TOP 10 * FROM ErrorLog ORDER BY ErrorDate DESC'

