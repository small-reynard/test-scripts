drop database if exists homework1;
create database if not exists homework1;
use homework1;

create table Passenger (
	pID integer primary key auto_increment,
	pName varchar(255),
	pCountry varchar(255)
);

create table Airport (
	apCode char(3) primary key not null,
	apCity varchar(255),
	apCountry varchar(255)
);

create table Airline (
	aID integer primary key auto_increment,
	aName varchar(255),
	aCountry varchar(255)
);

create table Flight (
	fnum integer auto_increment,
	aID integer,
	deptdate date not null,
	deptTime int not null,
	arrTime int not null,
	originAp char(3) not null,
	destinAp char(3) not null,
	primary key (fnum, deptdate),
	foreign key (aID) references Airline(aID),
	foreign key (originAp) references Airport(apCode),
	foreign key (destinAp) references Airport(apCode)
);

create table Books (
	pID integer,
	fnum integer,
	deptdate date not null,
	price decimal,
	primary key (pID, fnum, deptdate),
	foreign key (pID) references Passenger(pID),
	foreign key (fnum, deptdate) references Flight(fnum, deptdate)
);

insert into Passenger(pName, pCountry) 
values
('John', 'United States'),
('Mike', 'Japan'),
('Steve', 'Africa'),
('Bob', 'United States'),
('Eve', 'Japan'),
('Cat', 'China');

insert into Airport(apCode, apCity, apCountry)
values
('JFK', 'NY', 'United States'),
('LGA', 'NY', 'United States'),
('JPN', 'Tokyo', 'Japan'),
('IDC', 'I Don\'t Care', 'Greenland');

insert into Airline(aName, aCountry)
values
('AA', 'United States'), -- 1
('Delta', 'China'), -- 2
('EU', 'Japan'); -- 3

insert into Flight(aID, deptdate, deptTime, arrTime, originAp, destinAp)
values
(1, str_to_date('11-05-2017', '%m-%d-%Y'), time_to_sec('03:11:11'), time_to_sec('06:11:11'), 'JPN', 'JFK'), -- 1
(1, str_to_date('11-07-2017', '%m-%d-%Y'), time_to_sec('06:11:12'), time_to_sec('08:50:30'), 'JFK', 'LGA'), -- 2
(2, str_to_date('04-08-2016', '%m-%d-%Y'), time_to_sec('12:11:11'), time_to_sec('14:40:30'), 'JPN', 'LGA'), -- 3
(1, str_to_date('11-06-2017', '%m-%d-%Y'), time_to_sec('03:11:11'), time_to_sec('14:40:30'), 'JPN', 'JFK'), -- 4
(2, str_to_date('11-05-2017', '%m-%d-%Y'), time_to_sec('06:12:11'), time_to_sec('10:40:30'), 'JFK', 'LGA'), -- 5
(2, str_to_date('12-06-2017', '%m-%d-%Y'), time_to_sec('06:12:13'), time_to_sec('08:30:00'), 'LGA', 'JPN'); -- 6

insert into Books(pID, fnum, deptdate, price)
values
(1, 1, str_to_date('11-05-2017', '%m-%d-%Y'), 114.41),
(1, 5, str_to_date('11-05-2017', '%m-%d-%Y'), 112.41),
(2, 3, str_to_date('04-08-2016', '%m-%d-%Y'), 214.41),
(2, 1, str_to_date('11-05-2017', '%m-%d-%Y'), 314.41),
(3, 1, str_to_date('11-05-2017', '%m-%d-%Y'), 124.31),
(3, 2, str_to_date('11-07-2017', '%m-%d-%Y'), 124.41),
(2, 4, str_to_date('11-06-2017', '%m-%d-%Y'), 114.42);


-- Passenger (\u{pID}, pName, pCity, pCountry)\n
-- Airline(\u{aID}, aName, aCountry)\n
-- Airport(\u{apCode}, apCity, apCountry)\n
-- Flight(\u{fnum}, aID, \u{deptdate}, deptTime, arrTime, originAp, destinAp)\n
-- Books(\u{pID, fnum, deptdate}, price)
