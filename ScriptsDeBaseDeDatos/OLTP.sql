CREATE DATABASE OLTP
GO
USE [OLTP]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 15/4/2021 02:29:46 a. m. ******/

CREATE TABLE [dbo].[Addresses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [text] NOT NULL,
	[region_id] [int] NOT NULL,
	[country_id] [int] NOT NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ApiCountries]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[ApiCountries](
	[countrie_id] [varchar](3) NOT NULL,
	[countrie_name] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[countrie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ApiCurrencies]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[ApiCurrencies](
	[currencie_id] [int] IDENTITY(1,1) NOT NULL,
	[currencie_name] [varchar](3) NOT NULL,
	[currencie_value] [float] NOT NULL,
	[currencie_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[currencie_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Bills]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Bills](
	[id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[total] [money] NOT NULL,
	[invoice_number] [varchar](20) NOT NULL,
	[bill_config_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[exempted] [money] NOT NULL,
	[exonerated] [money] NOT NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Bills_Config]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Bills_Config](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_document_id] [int] NOT NULL,
	[branch_office_id] [int] NOT NULL,
	[initial_date] [date] NOT NULL,
	[final_date] [date] NOT NULL,
	[created_at] [date] NOT NULL,
	[next_value] [int] NOT NULL,
	[initial_value] [int] NOT NULL,
	[final_value] [int] NOT NULL,
	[format] [varchar](20) NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Bills_Config] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Bills_Items]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Bills_Items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[price] [money] NOT NULL,
	[tax] [money] NOT NULL,
	[tax_type_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[subtotal] [money] NULL,
 CONSTRAINT [PK_Bills_Items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BillsItem_x_Bills]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[BillsItem_x_Bills](
	[bills_id] [int] NOT NULL,
	[bills_item_id] [int] NOT NULL,
 CONSTRAINT [PK_BillsItem_x_Bills] PRIMARY KEY CLUSTERED 
(
	[bills_id] ASC,
	[bills_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Branch_Offices]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Branch_Offices](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[region_id] [int] NOT NULL,
	[country_id] [int] NOT NULL,
	[address_description] [text] NOT NULL,
	[phone] [varchar](30) NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Branch_offices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Brands]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Brands](
	[id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Buy_Orders]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Buy_Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[shipped_price] [money] NOT NULL,
	[shipped_amount] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[branch_id] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Buy_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Countries]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Countries](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[region_id] [int] NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Cpu]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Cpu](
	[id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[model_id] [int] NOT NULL,
 CONSTRAINT [PK_Cpu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Inventory_Mov]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Inventory_Mov](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[movement_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Inventory_Mov] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Items]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Items](
	[id] [int] NOT NULL,
	[brand_id] [int] NOT NULL,
	[model_id] [int] NOT NULL,
	[cpu_id] [int] NOT NULL,
	[storage_id] [int] NOT NULL,
	[screenPanel] [varchar](100) NOT NULL,
	[graphicCard] [varchar](100) NOT NULL,
	[serie] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Models]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Models](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[brand_id] [int] NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[branch_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[sell_price] [money] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Products_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Regions]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Regions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Storage]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Storage](
	[id] [int] NOT NULL,
	[type_id] [int] NOT NULL,
	[memory_size] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Storage_Type]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Storage_Type](
	[id] [int] NOT NULL,
	[name] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Storage_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Tax_Types]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Tax_Types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[percentage] [float] NOT NULL,
	[active] [bit] NOT NULL,
	[required] [bit] NOT NULL,
 CONSTRAINT [PK_Tax_Types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Type_Documents]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Type_Documents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [text] NOT NULL,
 CONSTRAINT [PK_Type_bills] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Type_Movement]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Type_Movement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[movement] [smallint] NOT NULL,
 CONSTRAINT [PK_Type_Movement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[middle_name] [varchar](30) NULL,
	[last_name] [varchar](30) NOT NULL,
	[second_last_name] [varchar](30) NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[phone] [varchar](30) NULL,
	[registration_date] [date] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  View [dbo].[ViewCountries]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE VIEW [dbo].[ViewCountries]
AS
SELECT Countries.id 'Id', Countries.name 'Country', Regions.name 'Region'
FROM OLTP.dbo.Countries Countries
INNER JOIN OLTP.dbo.Regions Regions
ON Countries.region_id = Regions.id

GO

/****** Object:  View [dbo].[ViewProducts]    Script Date: 15/4/2021 02:29:48 a. m. ******/

CREATE VIEW [dbo].[ViewProducts]
AS
SELECT dbo.Bills_Items.id 'Id',dbo.Brands.name + ' ' + dbo.Models.name  + ' ' AS 'Name', dbo.Items.serie AS 'Serie', 
dbo.Bills_Items.price AS 'Precio Unitario', dbo.Bills_Items.quantity AS 'Cantidad', dbo.Bills_Items.subtotal AS 'Sub Total'
FROM dbo.Bills_Items 
INNER JOIN dbo.Products ON dbo.Bills_Items.product_id = dbo.Products.id
INNER JOIN dbo.Items ON dbo.Products.item_id = dbo.Items.id
INNER JOIN dbo.Models ON dbo.Items.model_id = dbo.Models.id
INNER JOIN dbo.Brands ON dbo.Models.brand_id = dbo.Brands.id
GO

ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Countries] FOREIGN KEY([country_id])
REFERENCES [dbo].[Countries] ([id])
GO

ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Countries]
GO

ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Regions] FOREIGN KEY([region_id])
REFERENCES [dbo].[Regions] ([id])
GO

ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Regions]
GO

ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO

ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Users]
GO

ALTER TABLE [dbo].[ApiCurrencies]  WITH CHECK ADD  CONSTRAINT [FK_ApiCurrencies_ApiCountries] FOREIGN KEY([currencie_name])
REFERENCES [dbo].[ApiCountries] ([countrie_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApiCurrencies] CHECK CONSTRAINT [FK_ApiCurrencies_ApiCountries]
GO

ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Addresses] FOREIGN KEY([address_id])
REFERENCES [dbo].[Addresses] ([id])
GO

ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Addresses]
GO

ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Bills_Config] FOREIGN KEY([bill_config_id])
REFERENCES [dbo].[Bills_Config] ([id])
GO

ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Bills_Config]
GO

ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO

ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Users]
GO

ALTER TABLE [dbo].[Bills_Config]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Config_Branch_Offices] FOREIGN KEY([branch_office_id])
REFERENCES [dbo].[Branch_Offices] ([id])
GO

ALTER TABLE [dbo].[Bills_Config] CHECK CONSTRAINT [FK_Bills_Config_Branch_Offices]
GO

ALTER TABLE [dbo].[Bills_Config]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Config_Type_Documents] FOREIGN KEY([type_document_id])
REFERENCES [dbo].[Type_Documents] ([id])
GO

ALTER TABLE [dbo].[Bills_Config] CHECK CONSTRAINT [FK_Bills_Config_Type_Documents]
GO

ALTER TABLE [dbo].[Bills_Items]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Items_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO

ALTER TABLE [dbo].[Bills_Items] CHECK CONSTRAINT [FK_Bills_Items_Products]
GO

ALTER TABLE [dbo].[Bills_Items]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Items_Tax_Types1] FOREIGN KEY([tax_type_id])
REFERENCES [dbo].[Tax_Types] ([id])
GO

ALTER TABLE [dbo].[Bills_Items] CHECK CONSTRAINT [FK_Bills_Items_Tax_Types1]
GO

ALTER TABLE [dbo].[BillsItem_x_Bills]  WITH CHECK ADD  CONSTRAINT [FK_BillsItem_x_Bills_Bills] FOREIGN KEY([bills_id])
REFERENCES [dbo].[Bills] ([id])
GO

ALTER TABLE [dbo].[BillsItem_x_Bills] CHECK CONSTRAINT [FK_BillsItem_x_Bills_Bills]
GO

ALTER TABLE [dbo].[BillsItem_x_Bills]  WITH CHECK ADD  CONSTRAINT [FK_BillsItem_x_Bills_Bills_Items] FOREIGN KEY([bills_item_id])
REFERENCES [dbo].[Bills_Items] ([id])
GO

ALTER TABLE [dbo].[BillsItem_x_Bills] CHECK CONSTRAINT [FK_BillsItem_x_Bills_Bills_Items]
GO

ALTER TABLE [dbo].[Branch_Offices]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Offices_Countries] FOREIGN KEY([country_id])
REFERENCES [dbo].[Countries] ([id])
GO

ALTER TABLE [dbo].[Branch_Offices] CHECK CONSTRAINT [FK_Branch_Offices_Countries]
GO

ALTER TABLE [dbo].[Branch_Offices]  WITH CHECK ADD  CONSTRAINT [FK_Branch_Offices_Regions] FOREIGN KEY([region_id])
REFERENCES [dbo].[Regions] ([id])
GO

ALTER TABLE [dbo].[Branch_Offices] CHECK CONSTRAINT [FK_Branch_Offices_Regions]
GO

ALTER TABLE [dbo].[Buy_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Buy_Orders_Branch_Offices] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch_Offices] ([id])
GO

ALTER TABLE [dbo].[Buy_Orders] CHECK CONSTRAINT [FK_Buy_Orders_Branch_Offices]
GO

ALTER TABLE [dbo].[Buy_Orders]  WITH CHECK ADD  CONSTRAINT [FK_Buy_Orders_Items] FOREIGN KEY([item_id])
REFERENCES [dbo].[Items] ([id])
GO

ALTER TABLE [dbo].[Buy_Orders] CHECK CONSTRAINT [FK_Buy_Orders_Items]
GO

ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Regions] FOREIGN KEY([region_id])
REFERENCES [dbo].[Regions] ([id])
GO

ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Regions]
GO

ALTER TABLE [dbo].[Cpu]  WITH CHECK ADD  CONSTRAINT [FK_Cpu_Brands] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([id])
GO

ALTER TABLE [dbo].[Cpu] CHECK CONSTRAINT [FK_Cpu_Brands]
GO

ALTER TABLE [dbo].[Cpu]  WITH CHECK ADD  CONSTRAINT [FK_Cpu_Models] FOREIGN KEY([model_id])
REFERENCES [dbo].[Models] ([id])
GO

ALTER TABLE [dbo].[Cpu] CHECK CONSTRAINT [FK_Cpu_Models]
GO

ALTER TABLE [dbo].[Inventory_Mov]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Mov_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO

ALTER TABLE [dbo].[Inventory_Mov] CHECK CONSTRAINT [FK_Inventory_Mov_Products]
GO

ALTER TABLE [dbo].[Inventory_Mov]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Mov_Type_Movement] FOREIGN KEY([movement_id])
REFERENCES [dbo].[Type_Movement] ([id])
GO

ALTER TABLE [dbo].[Inventory_Mov] CHECK CONSTRAINT [FK_Inventory_Mov_Type_Movement]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([id])
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Products_Brands]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Products_Cpu] FOREIGN KEY([cpu_id])
REFERENCES [dbo].[Cpu] ([id])
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Products_Cpu]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Products_Models] FOREIGN KEY([model_id])
REFERENCES [dbo].[Models] ([id])
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Products_Models]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Products_Storage] FOREIGN KEY([storage_id])
REFERENCES [dbo].[Storage] ([id])
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Products_Storage]
GO

ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_Models_Brands] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([id])
GO

ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_Models_Brands]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Branch_Offices] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch_Offices] ([id])
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Branch_Offices]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Items] FOREIGN KEY([item_id])
REFERENCES [dbo].[Items] ([id])
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Items]
GO

ALTER TABLE [dbo].[Storage]  WITH CHECK ADD  CONSTRAINT [FK_Storage_Storage_Type] FOREIGN KEY([type_id])
REFERENCES [dbo].[Storage_Type] ([id])
GO

ALTER TABLE [dbo].[Storage] CHECK CONSTRAINT [FK_Storage_Storage_Type]
GO

