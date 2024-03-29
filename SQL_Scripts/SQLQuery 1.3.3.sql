CREATE DATABASE [TestDatabase01] 
ON  PRIMARY 
(	NAME = N'TestDatabase01', 
	FILENAME = N'C:\MSSQL\DATA\TestDatabase01.mdf' 
	, SIZE = 2048KB 
	, FILEGROWTH = 1024KB )
 LOG ON 
(	NAME = N'TestDatabase01_log', 
	FILENAME = N'C:\MSSQL\DATA\TestDatabase01_log.ldf' 
	, SIZE = 1024KB 
	, FILEGROWTH = 10%)

CREATE DATABASE [TestDatabase02] ON  PRIMARY 
( NAME = N'TestDatabase02'
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