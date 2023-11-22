CREATE DATABASE NDS_20HTTT2_BI_08;
USE NDS_20HTTT2_BI_08



create table NDS_Payment (
	PaymentID_SK int identity(1,1) primary key,
	PaymentID_NK nvarchar (50),
	PaymentName nvarchar(50),
	CreatedDate datetime,
	UpdatedDate datetime,
	SourceID int)




create table NDS_ProductLine (
	ProductLineID_SK int identity(1,1) primary key,
	ProductLineID_NK nvarchar (50),
	ProductLineName nvarchar(50),
	CreatedDate datetime,
	UpdatedDate datetime,
	SourceID int)




create table NDS_Product(
	ProductID_SK int identity(1,1) primary key,
	ProductID_NK nvarchar (50),
	ProductLineID_SK int,
	UnitPrice float ,
	CreatedDate datetime,
	UpdatedDate datetime,
	SourceID int)



create table NDS_City (
	BranchID_SK int identity(1,1) primary key,
	BranchID_NK nvarchar (50),
	CityName nvarchar(50),
	CreatedDate datetime,
	UpdatedDate datetime,
	SourceID int)

	create table Sources (
	SourceID int identity(1,1) primary key,
	SourceName nvarchar (50),
	CreatedDate datetime,
	UpdatedDate datetime,
	)


	
create table NDS_CustomerType (
	CustomerTypeID_SK int identity(1,1) primary key,
	CustomerTypeID_NK nvarchar (50),
	CustomerTypeName nvarchar(50),
	CreatedDate datetime,
	UpdatedDate datetime,
	SourceID int)


create 
table NDS_SupermarketSale (
	InvoiceID_SK int identity(1,1) primary key,
	InvoiceID_NK nvarchar (50),
	ProductID_SK int,
	BranchID_SK int,
	PaymentID_SK int,
	CustomerTypeID_SK int,
	Gender nvarchar(50),
	Quantity int,
	Tax_5p float,
	Total float,
	OrderDate date,
	OrderTime time(0),
	Cogs float,
	Gross_margin_perrcentage float,
	Gross_income float,
	Rating float,
	CreatedDate datetime,
	UpdatedDate datetime,
	SourceID int)



-- NDS PRODUCT
ALTER TABLE NDS_Product
add constraint FK_Product_ProductLine
foreign key (ProductLineID_SK) references NDS_ProductLine


ALTER TABLE NDS_Product
add constraint FK_Product_Sources
foreign key (SourceID) references Sources

-- PRODUCT LINE
ALTER TABLE NDS_ProductLine
add constraint FK_ProductLine_Sources
foreign key (SourceID) references Sources

-- PAYMENT
ALTER TABLE NDS_Payment
add constraint FK_Payment_Sources
foreign key (SourceID) references Sources

-- CIty
ALTER TABLE NDS_City
add constraint FK_City_Sources
foreign key (SourceID) references Sources

-- CustomerType
ALTER TABLE NDS_CustomerType
add constraint FK_CustomerType_Sources
foreign key (SourceID) references Sources


-- Supermarket Sales
ALTER TABLE NDS_SupermarketSale
add constraint FK_SupermarketSale_Sources
foreign key (SourceID) references Sources


ALTER TABLE NDS_SupermarketSale
add constraint FK_SupermarketSale_Product
foreign key (ProductID_SK) references NDS_Product


ALTER TABLE NDS_SupermarketSale
add constraint FK_SupermarketSale_Payment
foreign key (PaymentID_SK) references NDS_Payment


ALTER TABLE NDS_SupermarketSale
add constraint FK_SupermarketSale_City
foreign key (BranchID_SK) references NDS_City


ALTER TABLE NDS_SupermarketSale
add constraint FK_SupermarketSale_CustomerType
foreign key (CustomerTypeID_SK) references NDS_CustomerType
