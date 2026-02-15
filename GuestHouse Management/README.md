# Guest House Data Analysis

We have a dataset containing hotel data for 3 years, from 2018 to 2020

## Dataset preview
Our excel file has 5 sheets, 2018,2019,2020,meal costs and market segments

### Preview of 2018

<img width="1451" height="111" alt="Screenshot 2026-02-15 234153" src="https://github.com/user-attachments/assets/14c7cecb-3333-4cf8-a5bb-75b7eb6a7308" />

2019 and 2020 are identical with just the arrival date updated

### Meal Cost

<img width="187" height="157" alt="Screenshot 2026-02-15 234303" src="https://github.com/user-attachments/assets/69e85ce7-8987-4ea3-98f9-9b384eb3e0e5" />

### Market Segments

<img width="280" height="241" alt="Screenshot 2026-02-15 234311" src="https://github.com/user-attachments/assets/e5f9f06a-1472-4661-8608-85ccc43774cd" />


Market segments applies discounts based on the market sector booking rooms

## Requirements

We try to answer the following questions:

#### Does the guest house revenues increase with time?

#### Is additional parking space required?

#### Are there any useful trends in the data?


## Data Preparation

We use SQL Server Studio 2019 as our data base manager.

We use SQL to combine the yearly sheets and join the resultant combination with the meal cost table and the market segment table.

Then we optimize our query for Power BI

<pre>

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

</pre>

