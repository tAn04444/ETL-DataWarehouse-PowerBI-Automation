CREATE DATABASE [DW]

USE [DW]
GO

CREATE TABLE [dbo].[Dim_Customer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[FullName] [nvarchar](308) NULL,
	[PhoneNumber] [nvarchar](25) NULL,
	[EmailAddress] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Dim_Date](
	[DateKey] [nvarchar](8) NOT NULL,
	[FullDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Dim_Product](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Weight] [numeric](8, 2) NULL,
	[ProductSubcategoryKey] [int] NULL,
 CONSTRAINT [PK_Dim_Product] PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Dim_ProductCategory](
	[ProductCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Dim_ProductSubCategory](
	[ProductSubcategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductCategoryKey] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_ProductSubCategory] PRIMARY KEY CLUSTERED 
(
	[ProductSubcategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[Dim_SalesPerson](
	[SalesPersonKey] [int] IDENTITY(1,1) NOT NULL,
	[SalesPersonID] [int] NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[FullName] [nvarchar](308) NULL,
	[Gender] [nvarchar](1) NULL,
	[HireDate] [date] NULL,
 CONSTRAINT [PK_Dim_SalesPerson] PRIMARY KEY CLUSTERED 
(
	[SalesPersonKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Dim_Territory](
	[TerritoryKey] [int] IDENTITY(1,1) NOT NULL,
	[TerritoryID] [int] NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_SalesTerritory] PRIMARY KEY CLUSTERED 
(
	[TerritoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Fact_Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [nvarchar](8) NULL,
	[TerritoryKey] [int] NULL,
	[ProductKey] [int] NULL,
	[Qty] [bigint] NULL,
 CONSTRAINT [PK_Fact_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
 

CREATE TABLE [dbo].[Fact_SalesOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [nvarchar](8) NULL,
	[SalesPersonKey] [int] NULL,
	[TerritoryKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[Revenue] [money] NULL,
	[NumberOrder] [numeric](20, 0) NULL,	
 CONSTRAINT [PK_Fact_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Product]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Product_Dim_ProductSubCategory] FOREIGN KEY([ProductSubcategoryKey])
REFERENCES [dbo].[Dim_ProductSubCategory] ([ProductSubcategoryKey])
GO
ALTER TABLE [dbo].[Dim_Product] CHECK CONSTRAINT [FK_Dim_Product_Dim_ProductSubCategory]
GO
ALTER TABLE [dbo].[Dim_ProductSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_Dim_ProductSubCategory_Dim_ProductCategory] FOREIGN KEY([ProductCategoryKey])
REFERENCES [dbo].[Dim_ProductCategory] ([ProductCategoryKey])
GO
ALTER TABLE [dbo].[Dim_ProductSubCategory] CHECK CONSTRAINT [FK_Dim_ProductSubCategory_Dim_ProductCategory]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Date] FOREIGN KEY([DateKey])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Product] FOREIGN KEY([ProductKey])
REFERENCES [dbo].[Dim_Product] ([ProductKey])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Product]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Territory] FOREIGN KEY([TerritoryKey])
REFERENCES [dbo].[Dim_Territory] ([TerritoryKey])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Territory]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Customer] FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Dim_Customer] ([CustomerKey])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Customer]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Date] FOREIGN KEY([DateKey])
REFERENCES [dbo].[Dim_Date] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_SalesPerson] FOREIGN KEY([SalesPersonKey])
REFERENCES [dbo].[Dim_SalesPerson] ([SalesPersonKey])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_SalesPerson]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Territory] FOREIGN KEY([TerritoryKey])
REFERENCES [dbo].[Dim_Territory] ([TerritoryKey])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Territory]
GO
