IF (DB_ID('ProjectDB1') IS NULL)							
BEGIN
	CREATE DATABASE [ProjectDB1]							
	PRINT 'Created ProjectDB1 database'					
END ELSE
	PRINT 'ProjectDB1 already exists'					
GO													

USE [ProjectDB1]											
GO							
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Airport](
	[AirportID] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar (50),
	[Country] nvarchar (50),
    [IATACode] nvarchar (5),
 CONSTRAINT [PK_Airport] PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Airline](
	[AirlineID] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar (50),
	[Country] nvarchar (50),
 CONSTRAINT [PK_Airline] PRIMARY KEY CLUSTERED 
(
	[AirlineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Flight](
	[FlightID] int IDENTITY(1,1) NOT NULL,
	[AirlineID] int,
	[Origin_AirportID] int,
	[Destination_AirportID] int,
	[Price] int,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Customer](
	[CustomerID] int IDENTITY(1,1) NOT NULL,
	[FirstName] nvarchar (30),
	[SecondName] nvarchar (30),
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Booking](
	[BookingID] int IDENTITY(1,1) NOT NULL,
	[CustomerID] int,
	[FlightID] int,
	[Date] date NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE dbo.Booking WITH NOCHECK
ADD FOREIGN KEY (CustomerID) REFERENCES dbo.Customer (CustomerID)
GO

ALTER TABLE dbo.Booking WITH NOCHECK
ADD FOREIGN KEY (FlightID) REFERENCES dbo.Flight (FlightID)
GO

ALTER TABLE dbo.Flight WITH NOCHECK
ADD FOREIGN KEY (AirlineID) REFERENCES dbo.Airline (AirlineID)
GO

ALTER TABLE dbo.Flight WITH NOCHECK
ADD FOREIGN KEY ([Origin_AirportID]) REFERENCES dbo.Airport (AirportID)
GO

ALTER TABLE dbo.Flight WITH NOCHECK
ADD FOREIGN KEY ([Destination_AirportID]) REFERENCES dbo.Airport (AirportID)
GO

SET IDENTITY_INSERT [dbo].[Airport] ON 
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (1,'Hartsfield–Jackson Atlanta International Airport', 'United States', 'ATL')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (2,'Dallas Fort Worth International Airport', 'United States', 'DFW')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (3,'Guangzhou Baiyun International Airport', 'China', 'CAN')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (4,'Indira Gandhi International Airport', 'India', 'DEL')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (5,'Istanbul Airport', 'Turkey', 'IST')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (6,'Mexico City International Airport', 'Mexico', 'MEX')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (7,'Dubai International Airport', 'United Arab Emirates', 'DXB')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (8,'Charles de Gaulle Airport', 'France', 'CDG')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (9,'Tokyo Haneda Airport', 'Japan', 'HND')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (10,'Beijing Daxing International Airport', 'China', 'PKX')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (11,'Frankfurt Airport', 'Germany', 'FRA')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (12,'Heathrow Airport', 'United Kingdom', 'LHR')
GO
SET IDENTITY_INSERT [dbo].[Airport] OFF
GO

SET IDENTITY_INSERT [dbo].[Airline] ON 
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (1,'Delta Air Lines', 'United States')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (2,'American Airlines Group', 'United States')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (3,'United Airlines Holdings', 'United States')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (4,'Lufthansa Group', 'Germany')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (5,'Air France–KLM', 'France/Netherlands')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (6,'China Southern Airlines', 'China')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (7,'Turkish Airlines', 'Turkey')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (8,'IAG', 'Spain/UK/Ireland')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (9,'Ryanair', 'Ireland')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (10,'Air China Group', 'China')
GO
SET IDENTITY_INSERT [dbo].[Airline] OFF
GO

SET IDENTITY_INSERT [dbo].[Flight] ON 
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (1, 1, 1, 2, 300)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (2, 2, 1, 6, 1500)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (3, 3, 2, 12, 3600)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (4, 4, 11, 8, 1000)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (5, 5, 8, 12, 400)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (6, 6, 3, 10, 1200)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (7, 7, 5, 11, 600)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (8, 8, 7, 4, 1300)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (9, 9, 12, 11, 200)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (10, 10, 10, 9, 4000)
GO
SET IDENTITY_INSERT [dbo].[Flight] OFF
GO

SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (1, 'Susie','Keller')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (2, 'Kaine','Warner')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (3, 'Gloria','Haynes')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (4, 'Fletcher','Pittman')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (5, 'Charles','Adams')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (6, 'Bertie','Daniel')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (7, 'Adrian','Norris')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (8, 'Ivy','Ball')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (9, 'Carolyn','Ashley')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (10, 'Juanita','Krueger')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO

SET IDENTITY_INSERT [dbo].[Booking] ON 
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (1, 1, 1, '2023-01-01')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (2, 2, 2, '2023-01-01')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (3, 3, 3, '2023-01-02')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (4, 4, 4, '2023-01-03')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (5, 5, 5, '2023-01-03')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (6, 6, 6, '2023-01-04')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (7, 7, 7, '2023-01-04')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (8, 8, 8, '2023-01-05')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (9, 9, 9, '2023-01-05')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (10, 10, 10, '2023-01-05')
GO
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO

BEGIN TRANSACTION;
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (11, 'User11','SName11')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
COMMIT;

BEGIN TRANSACTION;
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (12, 'User12','SName12')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
ROLLBACK;

BEGIN TRANSACTION;
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (13, 'User13','SName13')
GO

WAITFOR DELAY '00:00:05'


INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (14, 'User14','SName14')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
COMMIT;

CREATE LOGIN L01 WITH PASSWORD = 'abcd';
GO
CREATE USER john FOR LOGIN L01;
GO
CREATE ROLE passengers AUTHORIZATION db_owner;
GO
EXECUTE sp_addrolemember 'passengers', 'john';
GO

IF (DB_ID('ProjectDB2') IS NULL)							
BEGIN
	CREATE DATABASE [ProjectDB2]							
	PRINT 'Created ProjectDB2 database'					
END ELSE
	PRINT 'ProjectDB2 database already exists'					
GO													

USE [ProjectDB2]											
GO							
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Airport](
	[AirportID] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar (50),
	[Country] nvarchar (50),
    [IATACode] nvarchar (5),
 CONSTRAINT [PK_Airport] PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Airline](
	[AirlineID] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar (50),
	[Country] nvarchar (50),
 CONSTRAINT [PK_Airline] PRIMARY KEY CLUSTERED 
(
	[AirlineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Flight](
	[FlightID] int IDENTITY(1,1) NOT NULL,
	[AirlineID] int,
	[Origin_AirportID] int,
	[Destination_AirportID] int,
	[Price] int,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Customer](
	[CustomerID] int IDENTITY(1,1) NOT NULL,
	[FirstName] nvarchar (30),
	[SecondName] nvarchar (30),
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Booking](
	[BookingID] int IDENTITY(1,1) NOT NULL,
	[CustomerID] int,
	[FlightID] int,
	[Date] date NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE dbo.Booking WITH NOCHECK
ADD FOREIGN KEY (CustomerID) REFERENCES dbo.Customer (CustomerID)
GO

ALTER TABLE dbo.Booking WITH NOCHECK
ADD FOREIGN KEY (FlightID) REFERENCES dbo.Flight (FlightID)
GO

ALTER TABLE dbo.Flight WITH NOCHECK
ADD FOREIGN KEY (AirlineID) REFERENCES dbo.Airline (AirlineID)
GO

ALTER TABLE dbo.Flight WITH NOCHECK
ADD FOREIGN KEY ([Origin_AirportID]) REFERENCES dbo.Airport (AirportID)
GO

ALTER TABLE dbo.Flight WITH NOCHECK
ADD FOREIGN KEY ([Destination_AirportID]) REFERENCES dbo.Airport (AirportID)
GO

SET IDENTITY_INSERT [dbo].[Airport] ON 
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (1,'Istanbul Airport', 'Turkey', 'IST')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (2,'Heathrow Airport', 'United Kingdom', 'LHR')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (3,'Charles de Gaulle Airport', 'France', 'CDG')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (4,'Amsterdam Airport Schiphol', 'Netherlands', 'AMS')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (5,'Adolfo Suárez Madrid–Barajas Airport', 'Spain', 'MAD')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (6,'Frankfurt am Main Airport', 'Germany', 'FRA')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (7,'Josep Tarradellas Barcelona–El Prat Airport', 'Spain', 'BCN')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (8,'Gatwick Airport', 'United Kingdom', 'LGW')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (9,'Munich Airport', 'Germany', 'MUC')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (10,'Orly Airport', 'France', 'ORY')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (11,'Palma de Mallorca Airport', 'Spain', 'PMI')
GO
INSERT [dbo].[Airport] ([AirportID],[Name],[Country], [IATACode]) VALUES (12,'Lisbon Airport', 'Portugal', 'LIS')
GO
SET IDENTITY_INSERT [dbo].[Airport] OFF
GO

SET IDENTITY_INSERT [dbo].[Airline] ON 
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (1,'Ryanair', 'Ireland')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (2,'Lufthansa Group', 'Germany')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (3,'Turkish Airlines', 'Turkeys')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (4,'Air France-KLM', 'France/Netherlands')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (5,'International Airlines Group', 'United Kingdom')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (6,'Wizz Air', 'Humgary')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (7,'EasyJet', 'United Kingdom')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (8,'Pegasus Airlines', 'Turkey')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (9,'SAS Group', 'Sweden')
GO
INSERT [dbo].[Airline] ([AirlineID],[Name],[Country]) VALUES (10,'Aegean Airlines', 'Greece')
GO
SET IDENTITY_INSERT [dbo].[Airline] OFF
GO

SET IDENTITY_INSERT [dbo].[Flight] ON 
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (1, 1, 1, 2, 400)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (2, 2, 1, 6, 1600)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (3, 3, 2, 12, 3700)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (4, 4, 11, 8, 1100)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (5, 5, 8, 12, 500)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (6, 6, 3, 10, 1300)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (7, 7, 5, 11, 700)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (8, 8, 7, 4, 1400)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (9, 9, 12, 11, 300)
GO
INSERT [dbo].[Flight] ([FlightID],[AirlineID],[Origin_AirportID],[Destination_AirportID],[Price]) VALUES (10, 10, 10, 9, 4100)
GO
SET IDENTITY_INSERT [dbo].[Flight] OFF
GO

SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (1, 'Phoenix','Odling')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (2, 'Raees','Bass')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (3, 'Madeline','Morgan')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (4, 'Dominik','John')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (5, 'Will','Tate')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (6, 'Kezia','Miranda')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (7, 'Jasmine','Wade')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (8, 'Ruby','Galvan')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (9, 'Nia','Mcintyre')
GO
INSERT [dbo].[Customer] ([CustomerID],[FirstName],[SecondName]) VALUES (10, 'Jared','Rivera')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO

SET IDENTITY_INSERT [dbo].[Booking] ON 
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (1, 1, 1, '2023-01-06')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (2, 2, 2, '2023-01-06')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (3, 3, 3, '2023-01-07')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (4, 4, 4, '2023-01-08')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (5, 5, 5, '2023-01-08')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (6, 6, 6, '2023-01-09')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (7, 7, 7, '2023-01-09')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (8, 8, 8, '2023-01-10')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (9, 9, 9, '2023-01-10')
GO
INSERT [dbo].[Booking] ([BookingID],[CustomerID],[FlightID], [Date]) VALUES (10, 10, 10, '2023-01-10')
GO
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO

BEGIN TRANSACTION;
SELECT tab1.*,
tab2.*
FROM [ProjectDB1].[dbo].[Customer] tab1
LEFT JOIN [ProjectDB2].[dbo].[Customer] tab2 ON tab1.CustomerID = tab2.CustomerID;
COMMIT;

BEGIN TRANSACTION;
SELECT tab1.*,
tab2.*
FROM [ProjectDB1].[dbo].[Booking] tab1
LEFT JOIN [ProjectDB2].[dbo].[Booking] tab2 ON tab1.BookingID = tab2.BookingID;
COMMIT;

BEGIN TRANSACTION;
SELECT tab1.*,
tab2.*
FROM [ProjectDB1].[dbo].[Flight] tab1
LEFT JOIN [ProjectDB2].[dbo].[Flight] tab2 ON tab1.FlightID = tab2.FlightID;
COMMIT;

BEGIN TRANSACTION;
SELECT tab1.*,
tab2.*
FROM [ProjectDB1].[dbo].[Airline] tab1
LEFT JOIN [ProjectDB2].[dbo].[Airline] tab2 ON tab1.AirlineID = tab2.AirlineID;
COMMIT;

BEGIN TRANSACTION;
SELECT tab1.*,
tab2.*
FROM [ProjectDB1].[dbo].[Airport] tab1
LEFT JOIN [ProjectDB2].[dbo].[Airport] tab2 ON tab1.AirportID = tab2.AirportID;
COMMIT;
