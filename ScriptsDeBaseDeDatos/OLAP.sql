CREATE DATABASE OLAP
GO
USE [OLAP]
GO
/****** Object:  Table [dbo].[D_Countries]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[D_Countries](
	[countrie_id] [nvarchar](3) NOT NULL,
	[countrie_name] [nvarchar](200) NULL,
 CONSTRAINT [PK_D_Countries] PRIMARY KEY CLUSTERED 
(
	[countrie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[D_Country]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[D_Country](
	[Country_id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_D_Country] PRIMARY KEY CLUSTERED 
(
	[Country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[D_Region]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[D_Region](
	[Region_id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_D_Region] PRIMARY KEY CLUSTERED 
(
	[Region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimBrands]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[DimBrands](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimCountries]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[DimCountries](
	[Id] [int] NOT NULL,
	[Country] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimProduct]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[DimProduct](
	[id] [int] NOT NULL,
	[model_id] [int] NULL,
	[serie] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimProducts]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[DimProducts](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](152) NULL,
	[Serie] [nvarchar](30) NULL,
	[Price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[H_Currencies]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[H_Currencies](
	[currencie_id] [int] NOT NULL,
	[countrie_id] [nvarchar](3) NOT NULL,
	[currencie_date] [datetime] NOT NULL,
	[currencie_value] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[currencie_id] ASC,
	[countrie_id] ASC,
	[currencie_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[H_Purchases]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[H_Purchases](
	[id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[shipped_price] [money] NOT NULL,
	[shipped_amount] [int] NOT NULL DEFAULT ((0)),
	[date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[H_Sales]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[H_Sales](
	[Sales_Id] [int] NOT NULL,
	[Country_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Quantity] [int] NULL,
	[Product_Price] [money] NULL,
 CONSTRAINT [PK__H_Sales__553E0E9BC0439574] PRIMARY KEY CLUSTERED 
(
	[Sales_Id] ASC,
	[Country_Id] ASC,
	[Product_Id] ASC,
	[OrderDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[H_Users]    Script Date: 15/4/2021 02:33:01 a. m. ******/

CREATE TABLE [dbo].[H_Users](
	[User_id] [int] NOT NULL,
	[D_Country] [int] NOT NULL,
	[D_Region] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Bill_Item_Id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_H_Users] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC,
	[D_Country] ASC,
	[D_Region] ASC,
	[Date] ASC,
	[Bill_Item_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[H_Currencies]  WITH NOCHECK ADD FOREIGN KEY([countrie_id])
REFERENCES [dbo].[D_Countries] ([countrie_id])
GO

ALTER TABLE [dbo].[H_Purchases]  WITH NOCHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[DimBrands] ([id])
GO

ALTER TABLE [dbo].[H_Purchases]  WITH NOCHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[DimProduct] ([id])
GO

ALTER TABLE [dbo].[H_Sales]  WITH NOCHECK ADD  CONSTRAINT [FK__H_Sales__Country__22AA2996] FOREIGN KEY([Country_Id])
REFERENCES [dbo].[DimCountries] ([Id])
GO
ALTER TABLE [dbo].[H_Sales] CHECK CONSTRAINT [FK__H_Sales__Country__22AA2996]
GO

ALTER TABLE [dbo].[H_Sales]  WITH NOCHECK ADD  CONSTRAINT [FK__H_Sales__Product__239E4DCF] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[DimProducts] ([Id])
GO

ALTER TABLE [dbo].[H_Sales] CHECK CONSTRAINT [FK__H_Sales__Product__239E4DCF]
GO

ALTER TABLE [dbo].[H_Users]  WITH NOCHECK ADD  CONSTRAINT [FK_H_Users_D_Country] FOREIGN KEY([D_Country])
REFERENCES [dbo].[D_Country] ([Country_id])
GO

ALTER TABLE [dbo].[H_Users] CHECK CONSTRAINT [FK_H_Users_D_Country]
GO

ALTER TABLE [dbo].[H_Users]  WITH NOCHECK ADD  CONSTRAINT [FK_H_Users_D_Region] FOREIGN KEY([D_Region])
REFERENCES [dbo].[D_Region] ([Region_id])
GO

ALTER TABLE [dbo].[H_Users] CHECK CONSTRAINT [FK_H_Users_D_Region]
GO

