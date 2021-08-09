CREATE DATABASE resp1;
USE resp1;

CREATE TABLE ConsolD
(Platform VARCHAR(20),
FirstRetailAvailability VARCHAR(20),
Discontinued VARCHAR(20),
UnitsSoldMillions float,
Comment VARCHAR(200),
constraint pl_pk PRIMARY KEY(Platform)
);

CREATE TABLE ConsoleG
(`Rank` INT,
Name VARCHAR(200),
Platform VARCHAR(20),
Year INT,
Genre VARCHAR(50),
NA_Sales float,
EU_Sales float,
JP_Sales float,
Other_Sales float,
constraint pl_fk foreign key(Platform) references ConsolD(Platform)
);