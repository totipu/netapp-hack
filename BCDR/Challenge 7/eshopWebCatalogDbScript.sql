
CREATE DATABASE [eShopOnWeb.CatalogDb]
GO
USE [eShopOnWeb.CatalogDb]
GO

/****** Object:  Sequence [dbo].[catalog_brand_hilo]    Script Date: 11/6/2020 4:49:49 PM ******/
CREATE SEQUENCE [dbo].[catalog_brand_hilo] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 10
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[catalog_hilo]    Script Date: 11/6/2020 4:49:49 PM ******/
CREATE SEQUENCE [dbo].[catalog_hilo] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 10
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[catalog_type_hilo]    Script Date: 11/6/2020 4:49:49 PM ******/
CREATE SEQUENCE [dbo].[catalog_type_hilo] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 10
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/6/2020 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasketItems]    Script Date: 11/6/2020 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BasketId] [int] NULL,
	[CatalogItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_BasketItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Baskets]    Script Date: 11/6/2020 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baskets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyerId] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Baskets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 11/6/2020 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[Id] [int] NOT NULL,
	[CatalogBrandId] [int] NOT NULL,
	[CatalogTypeId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PictureUri] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogBrands]    Script Date: 11/6/2020 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogBrands](
	[Id] [int] NOT NULL,
	[Brand] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CatalogBrands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogTypes]    Script Date: 11/6/2020 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogTypes](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CatalogTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 11/6/2020 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Units] [int] NOT NULL,
	[ItemOrdered_CatalogItemId] [int] NOT NULL,
	[ItemOrdered_PictureUri] [nvarchar](max) NULL,
	[ItemOrdered_ProductName] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/6/2020 4:49:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyerId] [nvarchar](max) NULL,
	[OrderDate] [datetimeoffset](7) NOT NULL,
	[ShipToAddress_City] [nvarchar](100) NULL,
	[ShipToAddress_Country] [nvarchar](90) NULL,
	[ShipToAddress_State] [nvarchar](60) NULL,
	[ShipToAddress_Street] [nvarchar](180) NULL,
	[ShipToAddress_ZipCode] [nvarchar](18) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20171018175735_Initial', N'3.1.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180725190153_AddExtraConstraints', N'3.1.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190601014740_UpdatingDefaultDataTypes', N'3.1.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190818191507_UpdatedConstraints', N'3.1.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20190911011026_UpdateCatalogModels', N'3.1.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191031185508_Post30Upgrade', N'3.1.6')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191105161820_AddressAndCatalogItemOrderedChanges', N'3.1.6')
GO
SET IDENTITY_INSERT [dbo].[Baskets] ON 
GO
INSERT [dbo].[Baskets] ([Id], [BuyerId]) VALUES (1, N'admin@netapp.com')
GO
INSERT [dbo].[Baskets] ([Id], [BuyerId]) VALUES (2, N'demouser@netapp.com')
GO

INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000001, 2, 2, N'.NET Bot Black Sweatshirt', N'.NET Bot Black Sweatshirt', N'http://catalogbaseurltobereplaced/images/products/1.png', CAST(19.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000002, 2, 1, N'.NET Black & White Mug', N'.NET Black & White Mug', N'http://catalogbaseurltobereplaced/images/products/2.png', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000003, 5, 2, N'Prism White T-Shirt', N'Prism White T-Shirt', N'http://catalogbaseurltobereplaced/images/products/3.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000004, 2, 2, N'.NET Foundation Sweatshirt', N'.NET Foundation Sweatshirt', N'http://catalogbaseurltobereplaced/images/products/4.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000005, 5, 3, N'Roslyn Red Sheet', N'Roslyn Red Sheet', N'http://catalogbaseurltobereplaced/images/products/5.png', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000006, 2, 2, N'.NET Blue Sweatshirt', N'.NET Blue Sweatshirt', N'http://catalogbaseurltobereplaced/images/products/6.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000007, 5, 2, N'Roslyn Red T-Shirt', N'Roslyn Red T-Shirt', N'http://catalogbaseurltobereplaced/images/products/7.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000008, 5, 2, N'Kudu Purple Sweatshirt', N'Kudu Purple Sweatshirt', N'http://catalogbaseurltobereplaced/images/products/8.png', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000009, 5, 1, N'Cup<T> White Mug', N'Cup<T> White Mug', N'http://catalogbaseurltobereplaced/images/products/9.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000010, 2, 3, N'.NET Foundation Sheet', N'.NET Foundation Sheet', N'http://catalogbaseurltobereplaced/images/products/10.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000011, 2, 2, N'.NET Bot Black Sweatshirt', N'.NET Bot Black Sweatshirt', N'http://catalogbaseurltobereplaced/images/products/1.png', CAST(19.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000012, 2, 1, N'.NET Black & White Mug', N'.NET Black & White Mug', N'http://catalogbaseurltobereplaced/images/products/2.png', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000013, 5, 2, N'Prism White T-Shirt', N'Prism White T-Shirt', N'http://catalogbaseurltobereplaced/images/products/3.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000014, 2, 2, N'.NET Foundation Sweatshirt', N'.NET Foundation Sweatshirt', N'http://catalogbaseurltobereplaced/images/products/4.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000015, 5, 3, N'Roslyn Red Sheet', N'Roslyn Red Sheet', N'http://catalogbaseurltobereplaced/images/products/5.png', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000016, 2, 2, N'.NET Blue Sweatshirt', N'.NET Blue Sweatshirt', N'http://catalogbaseurltobereplaced/images/products/6.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000017, 5, 2, N'Roslyn Red T-Shirt', N'Roslyn Red T-Shirt', N'http://catalogbaseurltobereplaced/images/products/7.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000018, 5, 2, N'Kudu Purple Sweatshirt', N'Kudu Purple Sweatshirt', N'http://catalogbaseurltobereplaced/images/products/8.png', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000019, 5, 1, N'Cup<T> White Mug', N'Cup<T> White Mug', N'http://catalogbaseurltobereplaced/images/products/9.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000020, 2, 3, N'.NET Foundation Sheet', N'.NET Foundation Sheet', N'http://catalogbaseurltobereplaced/images/products/10.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000021, 2, 3, N'Cup<T> Sheet', N'Cup<T> Sheet', N'http://catalogbaseurltobereplaced/images/products/11.png', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000022, 5, 2, N'Prism White TShirt', N'Prism White TShirt', N'http://catalogbaseurltobereplaced/images/products/12.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000031, 2, 3, N'Cup<T> Sheet', N'Cup<T> Sheet', N'http://catalogbaseurltobereplaced/images/products/11.png', CAST(8.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000032, 5, 2, N'Prism White TShirt', N'Prism White TShirt', N'http://catalogbaseurltobereplaced/images/products/12.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000041, 2, 2, N'Roslyn Red T-Shirt test', N'Roslyn Red T-Shirt test', N'http://catalogbaseurltobereplaced/images/products/7.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000051, 2, 2, N'Roslyn Red T-Shirt test', N'Roslyn Red T-Shirt test novi', N'http://catalogbaseurltobereplaced/images/products/7.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000061, 2, 2, N'Roslyn Red T-Shirt test', N'Roslyn Red T-Shirt test novi2', N'http://catalogbaseurltobereplaced/images/products/7.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000071, 2, 2, N'Roslyn Red T-Shirt test', N'Roslyn Red T-Shirt test novi', N'http://catalogbaseurltobereplaced/images/products/7.png', CAST(12.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Catalog] ([Id], [CatalogBrandId], [CatalogTypeId], [Description], [Name], [PictureUri], [Price]) VALUES (1000081, 2, 2, N'Roslyn Red T-Shirt sql', N'Roslyn Red T-Shirt test sql', N'http://catalogbaseurltobereplaced/images/products/7.png', CAST(12.00 AS Decimal(18, 2)))
GO

INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (1, N'Cloud')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (2, N'.NET')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (3, N'Visual Studio')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (4, N'SQL Server')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (5, N'Other')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (11, N'Cloud')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (12, N'.NET')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (13, N'Visual Studio')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (14, N'SQL Server')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (15, N'Other')
GO

INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (1, N'Mug')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (2, N'T-Shirt')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (3, N'Sheet')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (4, N'USB Memory Stick')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (11, N'Mug')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (12, N'T-Shirt')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (13, N'Sheet')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (14, N'USB Memory Stick')
GO

/****** Object:  Index [IX_BasketItems_BasketId]    Script Date: 11/6/2020 4:49:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_BasketId] ON [dbo].[BasketItems]
(
	[BasketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_CatalogBrandId]    Script Date: 11/6/2020 4:49:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_CatalogBrandId] ON [dbo].[Catalog]
(
	[CatalogBrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Catalog_CatalogTypeId]    Script Date: 11/6/2020 4:49:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_Catalog_CatalogTypeId] ON [dbo].[Catalog]
(
	[CatalogTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 11/6/2020 4:49:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_Baskets_BasketId] FOREIGN KEY([BasketId])
REFERENCES [dbo].[Baskets] ([Id])
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_Baskets_BasketId]
GO
ALTER TABLE [dbo].[Catalog]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_CatalogBrands_CatalogBrandId] FOREIGN KEY([CatalogBrandId])
REFERENCES [dbo].[CatalogBrands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_CatalogBrands_CatalogBrandId]
GO
ALTER TABLE [dbo].[Catalog]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_CatalogTypes_CatalogTypeId] FOREIGN KEY([CatalogTypeId])
REFERENCES [dbo].[CatalogTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_CatalogTypes_CatalogTypeId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
USE [master]
GO
ALTER DATABASE [eShopOnWeb.CatalogDb] SET  READ_WRITE 
GO
