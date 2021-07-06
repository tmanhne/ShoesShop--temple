create database SE1428 
use SE1428 
create table admin (username varchar(30) primary key, password varchar(32)) 
create table Customer(cid int primary key identity(1,1), 
	fullName nvarchar(30), address nvarchar(200), phone varchar(20), 
	username varchar(30), password varchar(32), status bit default 1) 
create table Category(cateId varchar(30) primary key, cateName nvarchar(100) unique not null, 
	image varchar(200), status bit default 1) 
create table Product(pid varchar(30) primary key, pname nvarchar(200) not null, 
quantity int, price money, image varchar(200), description nvarchar (max), status bit default 1, 
cateId varchar(30) foreign key references Category(cateId)) 
create table Bill(bid int primary key identity(1,1), dateCreate dateTime, total money, 
	recName nvarchar(30), recAddress nvarchar(200), recPhone varchar(20), status int default 1, 
	cid int foreign key references Customer(cid) )
create table BillDetail(bid int foreign key references Bill(bid),
					pid varchar(30) foreign key references Product(pid), quantity int, price money, 
					primary key(bid, pid))