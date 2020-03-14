--TABLA CUSTOMERS
CREATE TABLE [dbo].[TBL_CUSTOMERS]
(
	[ID] NVARCHAR(15) NOT NULL PRIMARY KEY, 
    [NAME] NVARCHAR(50) NOT NULL, 
    [LAST_NAME] NVARCHAR(50) NOT NULL, 
    [AGE] int NOT NULL
)

--INSERT EN  CUSTOMERS
CREATE PROCEDURE [dbo].[CRE_CUSTOMER_PR]
	@P_ID nvarchar(25),
	@P_NAME nvarchar(25),
	@P_LAST_NAME nvarchar(25),
	@P_AGE int
AS
	INSERT INTO [dbo].[TBL_CUSTOMERS] VALUES(@P_ID,@P_NAME,@P_LAST_NAME,@P_AGE);
GO;

--RETRIEVE ALL CUSTOMER
CREATE PROCEDURE [dbo].[RET_ALL_CUSTOMER_PR]
AS
	SELECT ID, NAME, LAST_NAME, AGE FROM TBL_CUSTOMERS;
RETURN 0


--UPDATE CUSTOMER
CREATE PROCEDURE [dbo].[UPD_CUSTOMER_PR]
	@P_ID nvarchar(25),
	@P_NAME nvarchar(25),
	@P_LAST_NAME nvarchar(25),
	@P_AGE int
AS
	UPDATE [dbo].[TBL_CUSTOMERS] SET NAME=@P_NAME, LAST_NAME=@P_LAST_NAME, AGE=@P_AGE WHERE ID=@P_ID;
GO;

--RET CUSTOMER BY ID
CREATE PROCEDURE [dbo].[RET_CUSTOMER_PR]
	@P_ID nvarchar(25)
AS
	SELECT ID, NAME, LAST_NAME, AGE FROM TBL_CUSTOMERS WHERE ID=@P_ID;
RETURN 0


--DELETE CUSTOMER
CREATE PROCEDURE [dbo].[DEL_CUSTOMER_PR]
	@P_ID nvarchar(25)
AS
	DELETE FROM TBL_CUSTOMERS WHERE ID=@P_ID;
RETURN 0

-- Exception Messages

CREATE TABLE [dbo].[TBL_MESSAGES]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Text] NVARCHAR(500) NOT NULL
);

INSERT INTO TBL_MESSAGES VALUES(0,'Houston we have a problem.');
INSERT INTO TBL_MESSAGES VALUES(1,'Invalid customer id.');
INSERT INTO TBL_MESSAGES VALUES(2,'The customer must be over 18 years old.');
INSERT INTO TBL_MESSAGES VALUES(3,'This customer already exist.');

CREATE PROCEDURE [dbo].[RET_ALL_MESSAGE_PR]
AS
	SELECT ID, TEXT FROM TBL_MESSAGES;
RETURN 0

USE [PROY_2]
GO

CREATE TABLE [dbo].[TBL_LIST_OPTIONS](
	[LIST_ID] [nvarchar](50) NOT NULL,
	[LIST_VALUE] [nvarchar](50) NOT NULL,
	[LIST_DESC] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TBL_LIST_OPTIONS] PRIMARY KEY CLUSTERED 
(
	[LIST_ID] ASC,
	[LIST_VALUE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

create PROCEDURE [dbo].[RET_ALL_LIST_OPTION_PR]
AS
	SELECT LIST_ID, LIST_VALUE, LIST_DESC FROM TBL_LIST_OPTIONS;
GO







