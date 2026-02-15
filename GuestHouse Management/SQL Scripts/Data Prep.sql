
-- Combining tables for all years
WITH hotels AS (
SELECT * FROM dbo.['2018$']
UNION
SELECT * FROM dbo.['2019$']
UNION
SELECT * FROM dbo.['2020$']
)


-- Joining tables based on meal cost
SELECT * FROM hotels
LEFT JOIN dbo.market_segment$
ON hotels.market_segment=market_segment$.market_segment 
LEFT JOIN dbo.meal_cost$ on hotels.meal = meal_cost$.meal

-- Selecting our view for Power BI
SELECT arrival_date_year, hotel , SUM((stays_in_week_nights + stays_in_weekend_nights) * adr) 
AS revenue FROM hotels GROUP BY arrival_date_year,hotel ORDER BY arrival_date_year