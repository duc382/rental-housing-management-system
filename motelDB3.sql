drop database motelDB3
create database motelDB3
go
use motelDB3
go
go
create table Room
(
	ID int primary key identity(1,1),
	Name nvarchar(100) not null,
	Price int not null,
	Area float not null,
	QuantityMax int not null,
	QuantityCurrent int not null,
	Utensil nvarchar(1000),
	Status bit,
	CreatedAt date not null,
	UpdatedAt date not null
)

--drop table Account
go
create table Account
(
	ID int primary key identity(1,1), 
	RoomID int foreign key references Room(ID),
	Username varchar(30) not null, 
	Password varchar(30) not null,
	role bit not null,
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
create table Contract
(
	ID int primary key identity(1,1),
	RoomID int foreign key references Room(ID),
	RoomName varchar(100),
	--ContractID int foreign key references Customer(ID),
	Note nvarchar(1000),
	status bit not null,
	startAt date not null,
	endAt date not null,
	CreatedAt date not null,
	UpdatedAt date not null
)
--drop table Services
go
create table Services
(
	ID int primary key identity(1,1),
	Name nvarchar(50),
	SupplierName nvarchar(100),
	OriginCost float,
	Price float,
	CreatedAt date,
	UpdatedAt date
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
	CCCD varchar(20),
	Address nvarchar(300),
	Job nvarchar(30),
	Email varchar(100),
	Sex bit,
	RelativePhoneNumber varchar(20),
	CreatedAt date not null,
	UpdatedAt date not null,
)
ALTER TABLE Contract
  ADD CustomerIDRepresentative int foreign key references Customer(ID)
ALTER TABLE contract
  ADD RoomName varchar(100)
  select * from room
--insert Account and room
insert into Room(Name,Price,Area,QuantityMax,QuantityCurrent,status,Utensil,CreatedAt,UpdatedAt)  values('Admin',0,0,1,1,1,'','2022-03-07','2022-03-07')
insert into Account(Username,Password,role,CreatedAt,UpdatedAt) values('Admin','Admin',1,'2022-02-21','2022-02-21')
select * from Contract
update Room set QuantityCurrent = 0, status =  where ID = 1
delete Contract
delete Customer
select * from Contract
select * from Room
select * from Customer
update Room set Status = 1 