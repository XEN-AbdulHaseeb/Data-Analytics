# Bike Rental Analysis and Dashboarding




<pre>

WITH combined_year as( SELECT * FROM dbo.bike_share_yr_0
UNION ALL
SELECT * FROM dbo.bike_share_yr_1)

--optimizing and joining our table with the cost table
SELECT 
dteday,
season,
mnth,
hr,
weekday,
rider_type,
riders,
price,
COGS,
riders*price as revenue,
(riders*price) - (COGS*riders) as profit
FROM combined_year as a
LEFT JOIN dbo.cost_table as b
ON a.yr = b.yr


</pre>

