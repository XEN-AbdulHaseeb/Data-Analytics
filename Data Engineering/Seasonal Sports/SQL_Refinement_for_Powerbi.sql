-- Rank by country
SELECT [Rank]
,[TeamCountry]
 FROM [OlympicDB].[dbo].[medals] AS Rank_By_Country

--Athlete count per Discipline by country
SELECT Discipline, COUNT(Discipline) AS Athelete_Count,Country
FROM [OlympicDB].[dbo].[athletes] AS Athlete_Count_Discipline_Country
GROUP BY Discipline, Country

--Including full table for stacked bar graph
SELECT * FROM entriesgender

--Coach count per discipline by country
SELECT COUNT(Name) AS Coach_Count,Discipline,Country
FROM coaches AS Coach_Count_Discpline_Country
GROUP BY Discipline,Country

--Coach name per discipline by country
SELECT Name, Discipline,Country
FROM coaches AS Coach_Name_Discipline_Country

--Medal count per country
SELECT TeamCountry,Gold,Silver,Bronze
FROM medals AS Medal_Count_Country




