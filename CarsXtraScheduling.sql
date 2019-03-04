-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               Microsoft SQL Server 2017 (RTM) - 14.0.1000.169
-- Server OS:                    Windows 10 Enterprise 10.0 <X64> (Build 17763: )
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for CarsXtraScheduling
CREATE DATABASE IF NOT EXISTS "CarsXtraScheduling";
USE "CarsXtraScheduling";

-- Dumping structure for table CarsXtraScheduling.Cars
CREATE TABLE IF NOT EXISTS "Cars" (
	"ID" INT(10,0) NOT NULL,
	"Trademark" NVARCHAR(50) NULL DEFAULT NULL,
	"Model" NVARCHAR(50) NULL DEFAULT NULL,
	"HP" SMALLINT(5,0) NULL DEFAULT ((0)),
	"Liter" FLOAT(53) NULL DEFAULT ((0)),
	"Cyl" SMALLINT(5,0) NULL DEFAULT ((0)),
	"TransmissSpeedCount" SMALLINT(5,0) NULL DEFAULT ((0)),
	"TransmissAutomatic" NVARCHAR(3) NULL DEFAULT NULL,
	"MPG_City" SMALLINT(5,0) NULL DEFAULT ((0)),
	"MPG_Highway" SMALLINT(5,0) NULL DEFAULT ((0)),
	"Category" NVARCHAR(7) NULL DEFAULT NULL,
	"Description" NTEXT(1073741823) NULL DEFAULT NULL,
	"Hyperlink" NVARCHAR(50) NULL DEFAULT NULL,
	"Picture" IMAGE(2147483647) NULL DEFAULT NULL,
	"Price" MONEY(19,4) NULL DEFAULT ((0)),
	"RtfContent" NTEXT(1073741823) NULL DEFAULT NULL,
	PRIMARY KEY ("ID")
);

-- Dumping data for table CarsXtraScheduling.Cars: -1 rows
/*!40000 ALTER TABLE "Cars" DISABLE KEYS */;
INSERT INTO "Cars" ("ID", "Trademark", "Model", "HP", "Liter", "Cyl", "TransmissSpeedCount", "TransmissAutomatic", "MPG_City", "MPG_Highway", "Category", "Description", "Hyperlink", "Picture", "Price", "RtfContent") VALUES
	(1, 'Mercedes-Benz', 'SL500 Roadster', 302, 4.966, 8, 5, 'Yes', 16, 23, 'SPORTS', NULL, 'http://www.mercedes.com', NULL, 83800, NULL),
	(2, 'Mercedes-Benz', 'CLK55 AMG Cabriolet', 342, 5.439, 8, 5, 'Yes', 17, 24, 'SPORTS', NULL, 'http://www.mercedes.com', NULL, 79645, NULL),
	(3, 'Mercedes-Benz', 'C230 Kompressor Sport Coupe', 189, 1.796, 4, 5, 'Yes', 21, 28, 'SPORTS', NULL, 'http://www.mercedes.com', NULL, 25600, NULL),
	(4, 'BMW', '530i', 225, 3, 6, 5, 'No', 21, 30, 'SALOON', NULL, 'http://www.bmw.com', NULL, 39450, NULL),
	(5, 'Rolls-Royce', 'Corniche', 325, 6.75, 8, 4, 'Yes', 11, 16, 'SALOON', NULL, 'http://www.rollsroyce.com', NULL, 370485, NULL),
	(6, 'Jaguar', 'S-Type 3.0', 235, 3, 6, 5, 'No', 18, 25, 'SALOON', NULL, 'http://www.jaguar.com', NULL, 44320, NULL),
	(7, 'Cadillac', 'Seville', 275, 4.6, 8, 4, 'Yes', 18, 27, 'SALOON', NULL, 'http://www.cadillac.com', NULL, 49600, NULL),
	(8, 'Cadillac', 'DeVille', 275, 4.6, 8, 4, 'Yes', 18, 27, 'SALOON', NULL, 'http://www.cadillac.com', NULL, 47780, NULL),
	(9, 'Lexus', 'LS430', 290, 4.3, 8, 5, 'Yes', 18, 25, 'SALOON', NULL, 'http://www.lexus.com', NULL, 54900, NULL),
	(10, 'Lexus', 'GS 430', 300, 4.3, 8, 5, 'Yes', 18, 23, 'SALOON', NULL, 'http://www.lexus.com', NULL, 41242, NULL),
	(11, 'Ford', 'Ranger FX-4', 135, 2.3, 4, 5, 'Yes', 21, 25, 'TRUCK', NULL, 'http://www.ford.com', NULL, 12565, NULL),
	(12, 'Dodge', 'Ram 1500', 215, 3.7, 6, 4, 'Yes', 15, 19, 'TRUCK', NULL, 'http://www.dodge.com', NULL, 17315, NULL),
	(13, 'GMC', 'Siera Quadrasteer', 200, 4.3, 6, 4, 'Yes', 15, 20, 'TRUCK', NULL, 'http://www.gmc.com', NULL, 17748, NULL),
	(14, 'Nissan', 'Crew Cab SE', 143, 2.4, 4, 4, 'Yes', 20, 23, 'TRUCK', NULL, 'http://www.NissanDriven.com', NULL, 12800, NULL),
	(15, 'Toyota', 'Tacoma S-Runner', 190, 3.4, 6, 5, 'No', 18, 22, 'TRUCK', NULL, 'http://www.toyota.com', NULL, 20000, NULL);
/*!40000 ALTER TABLE "Cars" ENABLE KEYS */;

-- Dumping structure for table CarsXtraScheduling.CarScheduling
CREATE TABLE IF NOT EXISTS "CarScheduling" (
	"ID" INT(10,0) NOT NULL,
	"CarId" NVARCHAR(max) NULL DEFAULT NULL,
	"UserId" INT(10,0) NULL DEFAULT NULL,
	"Status" INT(10,0) NULL DEFAULT NULL,
	"Subject" NVARCHAR(50) NULL DEFAULT NULL,
	"Description" NTEXT(1073741823) NULL DEFAULT NULL,
	"Label" INT(10,0) NULL DEFAULT NULL,
	"StartTime" DATETIME(3) NULL DEFAULT NULL,
	"EndTime" DATETIME(3) NULL DEFAULT NULL,
	"Location" NVARCHAR(50) NULL DEFAULT NULL,
	"AllDay" BIT NOT NULL,
	"EventType" INT(10,0) NULL DEFAULT NULL,
	"RecurrenceInfo" NTEXT(1073741823) NULL DEFAULT NULL,
	"ReminderInfo" NTEXT(1073741823) NULL DEFAULT NULL,
	"Price" MONEY(19,4) NULL DEFAULT NULL,
	"ContactInfo" NTEXT(1073741823) NULL DEFAULT NULL,
	PRIMARY KEY ("ID")
);

-- Dumping data for table CarsXtraScheduling.CarScheduling: -1 rows
/*!40000 ALTER TABLE "CarScheduling" DISABLE KEYS */;
INSERT INTO "CarScheduling" ("ID", "CarId", "UserId", "Status", "Subject", "Description", "Label", "StartTime", "EndTime", "Location", "AllDay", "EventType", "RecurrenceInfo", "ReminderInfo", "Price", "ContactInfo") VALUES
	(1, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 3, 'Mr.Brown', 'Rent this car', 2, '2008-07-12 11:00:00.000', '2008-07-12 14:30:00.000', 'city', 'False', 0, NULL, NULL, 8, 'cellular: +530145961202'),
	(2, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 2, 'Repair', 'Scheduled repair of this car', 4, '2008-07-14 08:00:00.000', '2008-07-15 16:30:00.000', 'Service Center', 'False', 0, NULL, NULL, 90, 'Contact: Paula Wilson Address: OR Elgin City Center Plaza 516 Main St.'),
	(3, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 3, 'Mr.White', 'Rent this car', 3, '2008-07-13 10:00:00.000', '2008-07-13 17:00:00.000', 'city', 'False', 0, NULL, NULL, 7.5, 'phone: (401) 349-4620'),
	(4, '<ResourceIds>  <ResourceId Type="System.Int32" Value="2" />  </ResourceIds>', NULL, 1, 'Wash', 'Wash this car in the garage', 1, '2008-07-05 16:30:00.000', '2008-07-05 18:00:00.000', 'Garage', 'False', 1, '<RecurrenceInfo Start="07/05/2008 16:30:00" End="08/01/2008 00:00:00" WeekDays="62" Id="975889a8-ea37-4625-a1ec-0fb2806199e2" OccurrenceCount="20" Range="2" Type="1" />', NULL, 7.5, '7466 - Gas / Car Wash'),
	(5, NULL, NULL, 3, 'Tune up', 'Check up after maintenance', 5, '2008-07-15 19:30:00.000', '2008-07-15 22:30:00.000', 'Service', 'False', 0, NULL, NULL, 45, 'Len Radde, 10564 W Woodward Ave, Wauwatosa WI 53444  Email: s_vanish1@servicec.com'),
	(6, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 3, 'Mr.Green', 'Rent this car for the all day', 3, '2008-07-11 00:00:00.000', '2008-07-12 00:00:00.000', 'city', 'True', 0, NULL, NULL, 6, 'Phone: (414) 964-5861 (w); (414) 647-1231 (cell); (414) 965-5950 (fax)'),
	(7, NULL, NULL, -1, 'Wash', 'Wash this car in the garage', -1, '2008-07-11 07:00:00.000', '2008-07-11 09:00:00.000', 'Garage', 'False', 1, '<RecurrenceInfo Start="07/11/2008 07:00:00" End="12/03/2027 07:00:00" WeekDays="32" Id="51c81018-53fa-4d10-925f-2ed7f8408c75" Month="12" OccurrenceCount="20" Range="1" Type="3" />', NULL, 10, 'Test'),
	(8, '<ResourceIds>  <ResourceId Type="System.Int32" Value="3" />  </ResourceIds>', NULL, 4, 'Mrs.Black', 'Rent this car', 3, '2008-07-11 10:00:00.000', '2008-07-11 11:30:00.000', 'out-of-town', 'False', 0, NULL, NULL, 7, 'Phone: (262) 946-9474; w (222) 723-2678 x22, cell (253) 713-0563, fax (361) 733-2870'),
	(9, '<ResourceIds>  <ResourceId Type="System.Int32" Value="3" />  </ResourceIds>', NULL, 4, 'Mrs.Black', 'Rent this car', 3, '2008-07-12 13:00:00.000', '2008-07-12 14:30:00.000', 'out-of-town', 'False', 0, NULL, NULL, 7, 'Phone: (262) 946-9474; w (222) 723-2678 x22, cell (253) 713-0563, fax (361) 733-2870'),
	(10, '<ResourceIds>  <ResourceId Type="System.Int32" Value="3" />  </ResourceIds>', NULL, 4, 'Mrs.Black', 'Rent this car', 3, '2008-07-13 15:30:00.000', '2008-07-14 14:00:00.000', 'out-of-town', 'False', 0, NULL, NULL, 7, 'Phone: (262) 946-9474; w (222) 723-2678 x22, cell (253) 713-0563, fax (361) 733-2870'),
	(11, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 1, 'Wash', 'Wash this car in the garage', 1, '2008-07-07 16:30:00.000', '2008-07-07 18:00:00.000', 'Garage', 'False', 3, '<RecurrenceInfo Id="975889a8-ea37-4625-a1ec-0fb2806199e2" />', NULL, 0, NULL),
	(12, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 1, 'Wash', 'Wash this car in the garage', 1, '2008-07-14 18:30:00.000', '2008-07-14 20:00:00.000', 'Garage', 'False', 3, '<RecurrenceInfo Id="975889a8-ea37-4625-a1ec-0fb2806199e2" Index="5" />', NULL, 0, NULL),
	(13, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 1, 'Wash', 'Wash this car in the garage', 1, '2008-07-23 15:00:00.000', '2008-07-23 16:30:00.000', 'Garage', 'False', 3, '<RecurrenceInfo Id="975889a8-ea37-4625-a1ec-0fb2806199e2" Index="12" />', NULL, 0, NULL),
	(14, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 1, 'Wash', 'Wash this car in the garage', 1, '2008-07-25 16:30:00.000', '2008-07-25 17:00:00.000', 'Garage', 'False', 3, '<RecurrenceInfo Id="975889a8-ea37-4625-a1ec-0fb2806199e2" Index="14" />', NULL, 0, NULL),
	(15, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 2, 'London - Brussels', 'Travel from London to Brussels by Eurostar, leaving London St Pancras at 13:00 (12:57 Fridays & Sundays), arriving Brussels Midi 16:03', 6, '2008-07-23 13:00:00.000', '2008-07-23 16:06:00.000', 'Eurostar', 'False', 0, NULL, NULL, NULL, NULL),
	(16, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 2, 'Brussels - Cologne', 'Travel from Brussels to Cologne by high-speed Thalys train, leaving Brussels Midi at 17:25, arriving in Cologne Hauptbahnhof at 19:45.', 6, '2008-07-23 17:25:00.000', '2008-07-23 19:45:00.000', 'Thalys', 'False', 0, NULL, NULL, NULL, NULL),
	(17, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 2, 'Cologne - Vienna', 'Travel from Cologne to Vienna on the excellent City Night Line hotel train ''Donau Kurier'', leaving Cologne Hauptbahnhof at 20:06 and arriving in Vienna Westbahnhof at 08:35.', 6, '2008-07-23 20:06:00.000', '2008-07-24 08:35:00.000', 'Donau Kurier', 'False', 0, NULL, NULL, NULL, NULL),
	(18, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 2, 'Vienna - Budapest', 'Travel from Vienna to Budapest on the air-conditioned InterCity train ''Avala'', leaving Vienna Westbahnhof at 09:52 and arriving in Budapest Keleti station at 12:53.', 6, '2008-07-24 09:52:00.000', '2008-07-24 12:53:00.000', 'Avala', 'False', 0, NULL, NULL, NULL, NULL),
	(19, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 2, 'Budapest - Bucharest', 'Travel from Budapest to Bucharest overnight on the EuroNight sleeper train ''Ister'', leaving Budapest Keleti station at 17:45 and arriving at Bucharest (Nord station) at 08:43 next morning.', 6, '2008-07-24 17:45:00.000', '2008-07-25 08:43:00.000', 'Ister', 'False', 0, NULL, NULL, NULL, NULL),
	(20, '<ResourceIds>  <ResourceId Type="System.Int32" Value="1" />  </ResourceIds>', NULL, 2, 'Bucharest - Istanbul', 'Travel from Bucharest to Istanbul on the ''Bosphor'', leaving Bucharest (Nord) daily at 12:15 and arriving at Istanbul (Sirkeci station) at 08:00 next day.', 6, '2008-07-25 12:15:00.000', '2008-07-26 08:00:00.000', 'Bosphor', 'False', 0, NULL, NULL, NULL, NULL),
	(21, '<ResourceIds>  <ResourceId Type="System.Int32" Value="2" />  </ResourceIds>', NULL, 2, 'Istanbul - Aleppo', 'The famous ''Toros Express'', named after the Taurus mountains through which it passes, runs 3 times a week from Istanbul (Haydarpasa station on the Asian side) to Gaziantep in southern Turkey.  Once a week on Sundays, it conveys a direct sleeping-car from Istanbul to Aleppo in Syria.', 6, '2008-07-27 08:55:00.000', '2008-07-28 14:17:00.000', 'Toros Express', 'False', 0, NULL, NULL, NULL, NULL),
	(22, '<ResourceIds>  <ResourceId Type="System.Int32" Value="3" />  </ResourceIds>', NULL, 2, 'Aleppo - Damascus', 'Aleppo       depart  10:05    Hama         arr/dep 11:30   Homs         arr/dep 12:30   Damascus  arrive   13:30 Damascus Kadem station   ', 6, '2008-07-29 10:05:00.000', '2008-07-29 13:30:00.000', 'Train No.12', 'False', 0, NULL, NULL, NULL, NULL),
	(23, '<ResourceIds>  <ResourceId Type="System.Int32" Value="4" />  </ResourceIds>', NULL, 2, 'Damascus - Amman', 'Days of running: Mondays & Thursdays  Damascus  (Kadem station)  depart  08:00   Deraa  (change trains)  depart 13:15  Mafraq  arrive 15:00    Amman  arrive 17:00   ', 6, '2008-07-31 08:00:00.000', '2008-07-31 17:00:00.000', 'Hejaz railway', 'False', 0, NULL, NULL, NULL, NULL),
	(24, '<ResourceIds>  <ResourceId Type="System.Int32" Value="3" />  </ResourceIds>', NULL, 2, 'Check oil', 'Regular Maintenance #1', 7, '2008-07-21 00:00:00.000', '2008-07-22 00:00:00.000', 'Parking', 'False', 1, '<RecurrenceInfo Start="07/21/2008 00:00:00" End="09/22/2008 00:00:00" WeekDays="8" Id="1304e53a-a1db-4159-8de8-8ee62c7c7424" OccurrenceCount="10" Periodicity="2" Type="1" />', NULL, NULL, NULL),
	(25, '<ResourceIds>  <ResourceId Type="System.Int32" Value="3" />  </ResourceIds>', NULL, 2, 'Regular Maintenance', NULL, 3, '2008-07-16 00:00:00.000', '2008-07-17 00:00:00.000', 'Service', 'False', 1, '<RecurrenceInfo Start="07/16/2008 00:00:00" End="09/01/2008 00:00:00" WeekDays="34" Id="6e4518d0-a570-4208-aa4e-4a385f2eea6e" OccurrenceCount="7" Range="2" Type="1" />', NULL, NULL, NULL);
/*!40000 ALTER TABLE "CarScheduling" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
