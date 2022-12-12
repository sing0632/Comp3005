create table publisher (
	Pname		varchar(30) NOT NULL,
	Pemail			varchar(30) NOT NULL,
	Pphone		numeric(10, 0) NOT NULL,
	BankACC		numeric(8, 0) NOT NULL,	
	Paddress		varchar(10) NOT NULL,
	primary key (Pname)
);

create table book (
	ISBN				numeric(10, 0) UNIQUE NOT NULL,
    Bname               varchar(50) NOT NULL,
	Btitle				varchar(50) NOT NULL NOT NULL,
    Bauthor             varchar(50) NOT NULL,
	price				numeric(5, 2) NOT NULL,
    Pname               varchar(50) NOT NULL,
	NoCopies			int,
	primary key (ISBN),
	foreign key (Pname) references publisher (Pname)
);

create table delivery (
    Did varchar(10) UNIQUE NOT NULL,
    details  varchar (50) NOT NULL,
    primary key (Did)
);

create table report(
    Rid varchar(10) UNIQUE NOT NULL,
    sales numeric(100,2),
    RTransactionID varchar(10) NOT NULL,
    NumCopies int,
    primary key (Rid)
);

create table orders(
    Onumber varchar(10) UNIQUE NOT NULL,
    amount  numeric (5 , 2) NOT NULL,
    TransactionID varchar(10) NOT NULL,
    PaymentType varchar(10) NOT NULL,
    primary key (Onumber),
    foreign key (Onumber) references delivery (Did)
    foreign key (TransactionID) references report (RTransactionID)
);

create table place (
    Bid varchar(10) NOT NULL,
    Onumber varchar(10) NOT NULL,
    primary key (Bid,Onumber),
    foreign key (Onumber) references orders (Onumber)
);

create table basket (
	Cid			varchar(10) NOT NULL,
    Bid			varchar(10) UNIQUE NOT NULL,
	ISBN		numeric(10, 0) NOT NULL,
	quantity	int,
	primary key (Cid,Bid,ISBN),
	foreign key (Bid) references place (Bid),
	foreign key (ISBN) references Book (ISBN)
);

create table customer (
	Cid			varchar(10) UNIQUE NOT NULL,
    Cname		varchar(20) NOT NULL,
	Cemail		varchar(20) NOT NULL,
	Cphone			numeric(10 ,0) NOT NULL,
	CShippingAdd		varchar(50) NOT NULL,
	CbillingAdd		varchar(50) NOT NULL,
	primary key (Cid),
    foreign key (Cid) references Basket (Cid)
);

create table user (
	Uname			varchar(10) UNIQUE NOT NULL,
	passwd		varchar(10) NOT NULL,
	Uemail		varchar(20) NOT NULL,
	Uphone			numeric(10 ,0) NOT NULL,
	UShippingAdd		varchar(50) NOT NULL,
	UbillingAdd		varchar(50) NOT NULL,
	primary key (Uname),
	foreign key (Uname) references customer (Cid)
);


insert into book values ('0012343','The Love', 'Apple', 'amrit',100,'Scholastic Press',80);
insert into user values ('sing', '123e','aas@gmail.com',1032304123,"55 BAy Ottawa", "55 Bay Ottawa");
