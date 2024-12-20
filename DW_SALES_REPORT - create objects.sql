CREATE DATABASE [DW_SALES_REPORT]
USE [DW_SALES_REPORT]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[DateID] [nvarchar](8) NOT NULL,
	[MonthID] [nvarchar](6) NULL,
	[OrderDate] [date] NULL,
 CONSTRAINT [PK_Dim_Date] PRIMARY KEY CLUSTERED 
(
	[DateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Month](
	[MonthID] [nvarchar](6) NOT NULL,
	[YearID] [nvarchar](4) NULL,
	[Month] [int] NULL,
 CONSTRAINT [PK_Dim_Month] PRIMARY KEY CLUSTERED 
(
	[MonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Product](
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ProductNumber] [nvarchar](25) NULL,
	[StandardCost] [money] NULL,
	[ListPrice] [money] NULL,
	[Weight] [numeric](8, 2) NULL,
	[ProductSubcategoryID] [int] NULL,
 CONSTRAINT [PK_Dim_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_ProductCategory](
	[ProductCategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_ProductSubCategory](
	[ProductSubcategoryID] [int] NOT NULL,
	[ProductCategoryID] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_ProductSubCategory] PRIMARY KEY CLUSTERED 
(
	[ProductSubcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_SalesPerson](
	[SalesPersonID] [int] NOT NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[FullName] [nvarchar](308) NULL,
	[Gender] [nvarchar](1) NULL,
	[HireDate] [date] NULL,
 CONSTRAINT [PK_Dim_SalesPerson] PRIMARY KEY CLUSTERED 
(
	[SalesPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Territory](
	[TerritoryID] [int] NOT NULL,
	[CountryRegionCode] [nvarchar](3) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Dim_Territory] PRIMARY KEY CLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Year](
	[YearID] [nvarchar](4) NOT NULL,
	[Year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[YearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Product](
	[SalesOrderDetailID] [int] NOT NULL,
	[DateID] [nvarchar](8) NULL,
	[TerritoryID] [int] NULL,
	[ProductID] [int] NULL,
	[Qty] [bigint] NULL,
 CONSTRAINT [PK_Fact_Product] PRIMARY KEY CLUSTERED 
(
	[SalesOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_SalesOrder](
	[SalesOrderID] [int] NOT NULL,
	[DateID] [nvarchar](8) NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[Revenue] [money] NULL,
	[NumberOrder] [numeric](20, 0) NULL,
 CONSTRAINT [PK_Fact_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dim_Date]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Date_Dim_Month] FOREIGN KEY([MonthID])
REFERENCES [dbo].[Dim_Month] ([MonthID])
GO
ALTER TABLE [dbo].[Dim_Date] CHECK CONSTRAINT [FK_Dim_Date_Dim_Month]
GO
ALTER TABLE [dbo].[Dim_Month]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Month_Dim_Year] FOREIGN KEY([YearID])
REFERENCES [dbo].[Dim_Year] ([YearID])
GO
ALTER TABLE [dbo].[Dim_Month] CHECK CONSTRAINT [FK_Dim_Month_Dim_Year]
GO
ALTER TABLE [dbo].[Dim_Product]  WITH CHECK ADD  CONSTRAINT [FK_Dim_Product_Dim_ProductSubCategory] FOREIGN KEY([ProductSubcategoryID])
REFERENCES [dbo].[Dim_ProductSubCategory] ([ProductSubcategoryID])
GO
ALTER TABLE [dbo].[Dim_Product] CHECK CONSTRAINT [FK_Dim_Product_Dim_ProductSubCategory]
GO
ALTER TABLE [dbo].[Dim_ProductSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_Dim_ProductSubCategory_Dim_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[Dim_ProductCategory] ([ProductCategoryID])
GO
ALTER TABLE [dbo].[Dim_ProductSubCategory] CHECK CONSTRAINT [FK_Dim_ProductSubCategory_Dim_ProductCategory]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Date] FOREIGN KEY([DateID])
REFERENCES [dbo].[Dim_Date] ([DateID])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Dim_Product] ([ProductID])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Product]
GO
ALTER TABLE [dbo].[Fact_Product]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Product_Dim_Territory] FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[Dim_Territory] ([TerritoryID])
GO
ALTER TABLE [dbo].[Fact_Product] CHECK CONSTRAINT [FK_Fact_Product_Dim_Territory]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Date] FOREIGN KEY([DateID])
REFERENCES [dbo].[Dim_Date] ([DateID])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Date]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_SalesPerson] FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[Dim_SalesPerson] ([SalesPersonID])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_SalesPerson]
GO
ALTER TABLE [dbo].[Fact_SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_Fact_SalesOrder_Dim_Territory] FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[Dim_Territory] ([TerritoryID])
GO
ALTER TABLE [dbo].[Fact_SalesOrder] CHECK CONSTRAINT [FK_Fact_SalesOrder_Dim_Territory]
GO
