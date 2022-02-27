--drop database motelDB2
create database motelDB2
go
use motelDB2
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
Alter table room
 alter column price int
 update Room set Name = 'P101', Utensil = 'giuong tu' where ID= 5
 select * from Services
 insert into Services(Name, SupplierName, OriginCost, Price, CreatedAt, UpdatedAt) values('dien','NPC',2.5,3,'2022-02-25','2022-02-25')
 
 Alter table Customer
 add CCCD varchar(20)
 select * from Room
update Room set quantityCurrent = 3 where ID = 7
 select * from Customer
 