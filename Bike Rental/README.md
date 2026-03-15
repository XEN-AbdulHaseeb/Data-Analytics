# Bike Rental Business Performance Dashboard — Power BI

## Project Overview
This project analyzes the performance of a bike rental company over **2021–2022** using **Power BI**. The dashboard provides insights into revenue, profit, rider behavior, and operational trends to support business decision-making and identify growth opportunities.

## Objectives
- Analyze revenue and profitability trends across seasons, days, and hours.  
- Identify peak demand periods and most profitable customer segments.  
- Develop an **interactive dashboard** to enable dynamic filtering and KPI monitoring.  
- Visualize key performance indicators (KPIs) for strategic business insights.

## Key Metrics & Findings
- **Revenue:** $15M across 2021–2022  
- **Profit:** $10.54M; **Profit Margin:** 45%  
- **Most profitable season:** Season 3 — $3.4M profit (both years combined)  
- **Peak hours:** 10 AM – 3 PM and early evening  
- **Most profitable days:** Wednesday & Thursday  
- **Rider demographics:** 81.17% Registered vs 18.83% Casual  

## Dashboard Features
- Interactive filtering by **year (2021 or 2022)**  
- **KPI over time chart**: shows **average revenue and average profit per rider**  
- Line and clustered column charts to visualize **time-of-day trends, seasonal patterns, and daily performance**  
- Demographic breakdown and rider type analysis

![Image](https://github.com/user-attachments/assets/52ba4fcc-53e7-4a4c-9786-44dff0fdf36d)


## Tools & Technologies
- **Power BI** — interactive dashboard creation  
- **DAX** — KPI calculations and metrics  
- **SQL** — data preprocessing and cleaning  

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


## Insights & Business Impact
- Identified **high-revenue hours and days**, enabling optimized staffing and bike availability planning.  
- Highlighted **seasonal profitability trends** to guide marketing and promotions.  
- Provided clear **registered vs casual rider analysis** to inform loyalty programs and targeted campaigns.  
- Delivered **interactive dashboards** that allow stakeholders to monitor performance dynamically and make data-driven decisions.

## How to Use
1. Open the `.pbix` Power BI file in the Dashboard folder.  
2. Use the **Year slicer** to select 2021 or 2022.  
3. Explore the dashboards for **KPIs, seasonality, hourly trends, and rider demographics**.  
4. Hover over charts to view detailed metrics.

---

**Author:** [Abdul Haseeb] 
