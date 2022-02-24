--drop database motelDB
create database motelDB
go
use motelDB
go
--drop table Account

go
create table Account
(
	ID int primary key identity(1,1), 
	Username varchar(30) not null, 
	Password varchar(30) not null,
	CreatedAt date not null,
	UpdatedAt date not null
)

go
create table Profile
(
	ID int primary key identity(1,1), 
	AccountID int foreign key references Account(ID),
	role bit not null,
	Name nvarchar(100) not null,
	PhoneNumber varchar(20) not null,
	DOB date not null,
	Address nvarchar(300) not null,
	Job nvarchar(30) not null,
	Email varchar(100),
	CreatedAt date not null,
	UpdatedAt date not null
)

go
create table Request
(
	ID int primary key identity(1,1), 
	AccountID int foreign key references Account(ID),
	Content nvarchar(1000) not null,
	Status bit not null,
	Note nvarchar(1000),
	CreatedAt date not null,
	UpdatedAt date not null
)
--drop table Room
go
create table Room
(
	ID int primary key identity(1,1),
	Name nvarchar(100) not null;
	Price float not null,
	Area float not null,
	QuantityMax int not null,
	Utensil nvarchar(1000),
	CreatedAt date not null,
	UpdatedAt date not null
)

go
create table Contract
(
	ID int primary key identity(1,1),
	AccountID int foreign key references Account(ID),
	RoomID int foreign key references Room(ID),
	Note nvarchar(1000),
	CreatedAt date not null,
	UpdatedAt date not null
)
--drop table Services
go
create table Services
(
	ID int primary key identity(1,1),
	Name nvarchar(50) not null,
	SupplierName nvarchar(100),
	OriginCost float not null,
	Price float not null,
	CreatedAt date not null,
	UpdatedAt date not null
)
--drop table ServicesOfContract
go
create table ServicesOfContract
(
	ID int primary key identity(1,1),
	ServicesID int foreign key references Services(ID),
	ContractID int foreign key references Contract(ID),
	--note nvarchar(100)
)
--drop table Transaction
go
create table Transactions
(
	ID int primary key identity(1,1),
	ServicesID int foreign key references Services(ID),
	ContractID int foreign key references Contract(ID),
	Amount float,
	Note nvarchar(500),
	CreatedAt date not null,
	UpdatedAt date not null
)
go
create table Customer
(
	ID int primary key identity(1,1),
	ContractID int foreign key references Contract(ID),
	Name nvarchar(100),
	PhoneNumber varchar(20),
	DOB date,
	Address nvarchar(300),
	Job nvarchar(30),
	Email varchar(100),
	Sex bit,
	RelativePhoneNumber varchar(20),
	CreatedAt date not null,
	UpdatedAt date not null,
)

--insert Account
select * from Account
insert into Account(Username,Password,CreatedAt,UpdatedAt) values('Admin','Admin','2022-02-21','2022-02-21')
insert into Account(Username,Password,CreatedAt,UpdatedAt) values('P01','P01','2022-02-22','2022-02-22')
--insert Profile
select * from Profile
insert into Profile(AccountID,role,Name,PhoneNumber,DOB,Address,Job,Email,CreatedAt,UpdatedAt)
values(1,1,'Lê Thiện Đức','0989355382','2001-02-26','Thanh Hóa','Sinh Viên','thienduc260201@gmail.com','2022-02-21','2022-02-21')
insert into Profile(AccountID,role,Name,PhoneNumber,DOB,Address,Job,Email,CreatedAt,UpdatedAt)
values(2,0,'Lê Thiện Văn','0375956599','1999-02-18','Thanh Hóa','Lập trình viên','vankcdhv@gmail.com','2022-02-22','2022-02-22')

--insert Room
Insert into room(Name,Price,Area,QuantityMax,Utensil,CreatedAt,UpdatedAt) 
values('P02',1800000, 18, 2,'','2022-02-23','2022-02-23')
--test query
Select * from Profile where AccountID=2
select * from Room
ALTER TABLE Room
ADD Name NVARCHAR(100) NOT NULL;