CREATE DATABASE [DW_STAGING]
 
USE [DW_STAGING]
GO

CREATE TABLE [dbo].[Stag _Fact _SalesOrder](
	[OrderDate] [date] NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[CustomerID] [int] NULL,
	[Revenue] [money] NULL,
	[NumberOrder] [numeric](20, 0) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Customer](
	[CustomerID] [int] NULL,
	[PersonID] [int] NULL
) ON [PRIMARY]
GO
 

CREATE TABLE [dbo].[Stag_Dim_Customer](
	[CustomerID] [int] NULL,
	[FullName] [nvarchar](308) NULL,
	[PhoneNumber] [nvarchar](25) NULL,
	[EmailAddress] [nvarchar](50) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Dim_Date](
	[OrderDate] [date] NULL
) ON [PRIMARY]
GO

 
CREATE TABLE [dbo].[Stag_Dim_Product](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Weight] [numeric](8, 2) NULL,
	[ProductSubcategoryID] [int] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Dim_ProductCategory](
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Dim_ProductSubCategory](
	[ProductSubcategoryID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Dim_SalesPerson](
	[SalesPersonID] [int] NULL,
	[FullName] [nvarchar](308) NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[Gender] [nvarchar](1) NULL,
	[HireDate] [date] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Dim_Territory](
	[TerritoryID] [int] NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_EmailAddress](
	[BusinessEntityID] [int] NULL,
	[EmailAddress] [nvarchar](50) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Employee](
	[BusinessEntityID] [int] NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[Gender] [nvarchar](1) NULL,
	[HireDate] [date] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Fact_Product](
	[OrderDate] [date] NULL,
	[TerritoryID] [int] NULL,
	[ProductID] [int] NULL,
	[Qty] [bigint] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_OrderDetail](
	[SalesOrderDetailID] [int] NULL,
	[SalesOrderID] [int] NULL,
	[OrderQty] [smallint] NULL,
	[ProductID] [int] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_OrderHeader](
	[SalesOrderID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[CustomerID] [int] NULL,
	[TotalDue] [money] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Person](
	[BusinessEntityID] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_PersonPhone](
	[BusinessEntityID] [int] NULL,
	[PhoneNumber] [nvarchar](25) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Product](
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Weight] [numeric](8, 2) NULL,
	[ProductSubcategoryID] [int] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_ProductCategory](
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_ProductSubcategory](
	[ProductSubcategoryID] [int] NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Stag_Territory](
	[TerritoryID] [int] NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
