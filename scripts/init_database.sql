USE master;
GO

IF EXISTS(SELECT 1 FROM sys.databases WHERE NAME ='DataWareHouse')
BEGIN
	ALTER DATABASE DataWareHouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWareHouse;
END;
GO
-- Create the 'DataWareHouse' database
CREATE DATABASE DataWareHouse;
GO

USE DataWareHouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
