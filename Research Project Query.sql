USE resp1;

Select * from ConsolD;
SET SQL_SAFE_UPDATES = 0;
UPDATE ConsolD
SET FirstRetailAvailability = str_to_date(FirstRetailAvailability,'%m/%d/%Y');
UPDATE ConsolD
SET Discontinued = str_to_date(Discontinued,'%m/%d/%Y');
SELECT * FROM ConsoleG;


##1 Max Sales 80-90
Select cg.Platform, SUM(NA_Sales) As NA_Total_Sales, SUM(EU_Sales) As EU_Total_Sales,SUM(JP_Sales) As JP_Total_Sales, SUM(Other_Sales) As Other_Total_Sales, cd.Comment From ConsoleG as cg
JOIN ConsolD as cd
ON cg.Platform = cd.Platform
Where Year Between 1980 and 1990
Group By Platform;

##2 Max Sales 1990-2000
Select * from ConsolD;
SELECT * FROM ConsoleG;
Select cg.Platform, SUM(NA_Sales) As NA_Total_Sales, SUM(EU_Sales) As EU_Total_Sales,SUM(JP_Sales) As JP_Total_Sales, SUM(Other_Sales) As Other_Total_Sales, cd.Comment From ConsoleG as cg
JOIN ConsolD as cd
ON cg.Platform = cd.Platform
Where Year Between 1990 and 2000
Group By Platform;


##3 Max Sales 2000-2015
Select * from ConsolD;
SELECT * FROM ConsoleG;
Select cg.Platform, SUM(NA_Sales) As NA_Total_Sales, SUM(EU_Sales) As EU_Total_Sales,SUM(JP_Sales) As JP_Total_Sales, SUM(Other_Sales) As Other_Total_Sales, cd.Comment From ConsoleG as cg
JOIN ConsolD as cd
ON cg.Platform = cd.Platform
Where Year Between 2000 and 2015
Group By Platform;

##4 Genere Wise Sales in different Regions
Select Genre, (SUM(NA_Sales)+
SUM(EU_Sales)+SUM(JP_Sales)+SUM(Other_Sales)) As Total_Sales From ConsoleG
group by Genre;

## Region-wise Highest sale
Select Platform,MAX(NA_Sales) As Max_NA_Sales from ConsoleG
GROUP BY Platform
Order by Max_NA_Sales DESC
LIMIT 10;

### Console Which are still in market
SELECT * FROM ConsolD
Where YEAR(Discontinued) = 0000;

## Console discontinued before 2000
SELECT * FROM ConsolD
Where YEAR(Discontinued) <= 2000;

## Console discontinued Between 2000 and 2010
SELECT * FROM ConsolD
Where YEAR(Discontinued) between 2000 and 2010;

## Console Discontinued recently i.e after 2010
SELECT * FROM ConsolD
Where YEAR(Discontinued) between 2010 and 2015;

## Top 10 platform sold
SELECT * FROM ConsolD
Order by UnitsSoldMillions DESC
LIMIT 10;

## Top 10 Highest Selling Video Games
Select Name, (NA_Sales+EU_Sales+JP_Sales+Other_Sales) As Total_Sales, Genre, Platform  From ConsoleG
Order by Total_Sales Desc
LIMIT 10;

## Number of games released per year
SELECT * FROM ConsolD;
SELECT COUNT(Name) as TotalGames, Year FROM ConsoleG
GROUP BY Year
ORDER BY Year, TotalGames;


##Games released in each decade
SELECT * FROM ConsolD;
SELECT COUNT(Name) as TotalGames FROM ConsoleG
Where Year between 1980 and 1989;


SELECT COUNT(Name) as TotalGames FROM ConsoleG
Where Year between 1990 and 1999;


SELECT COUNT(Name) as TotalGames FROM ConsoleG
Where Year between 2000 and 2009;

SELECT COUNT(Name) as TotalGames FROM ConsoleG
Where Year between 2010 and 2015;

## Console sold for longest period of time
Select Platform, DATEDIFF(Discontinued,FirstRetailAvailability)/365 as diffyear from ConsolD
WHERE Year(Discontinued) != 0000
Order by diffyear DESC
LIMIT 10;
