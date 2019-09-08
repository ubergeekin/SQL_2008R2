CREATE DATABASE [TestDatabase02] ON  PRIMARY 
( NAME = N'Test_Primary_File01'
, FILENAME = N'C:\MSSQL\Test_Primary_File01.mdf' 
, SIZE = 2048KB 
, FILEGROWTH = 1024KB ), 
( NAME = N'Test_Primary_File02'
, FILENAME = N'C:\MSSQL\DATA\Test_Primary_File02.ndf' 
, SIZE = 2048KB 
, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestDatabase02_log'
, FILENAME = N'C:\MSSQL\DATA\TestDatabase02_log.ldf' 
, SIZE = 1024KB 
, FILEGROWTH = 10%)
-- GO
-- IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [TestDatabase02] MODIFY FILEGROUP [PRIMARY] DEFAULT
-- GO
