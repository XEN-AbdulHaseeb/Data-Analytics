# Seasonal Sports Data Engineering and Analytics

## Overview

This project demonstrates an end-to-end data engineering pipeline built on the Azure cloud ecosystem using the Seasonal Sports dataset.

The pipeline covers:

* Data ingestion from external sources
* Data transformation using distributed processing
* Data analysis using SQL
* Final data modeling for reporting and dashboards

---

## Architecture

<img width="1915" height="592" alt="Screenshot 2026-04-06 195745" src="https://github.com/user-attachments/assets/20325fe5-94aa-4758-94f9-1bee541b62c4" />


---

## Tech Stack

* Azure Data Factory
* Azure Data Lake Storage Gen2
* Azure Databricks (Apache Spark)
* Azure Synapse Analytics
* SQL

---

## Project Workflow

### Part 1 – Data Engineering Pipeline

#### 1. Data Ingestion

* Built pipelines using Azure Data Factory
* Extracted Olympic dataset from GitHub
* Loaded raw data into Azure Data Lake Storage Gen2

  <img width="1389" height="172" alt="Screenshot 2026-04-06 203815" src="https://github.com/user-attachments/assets/01be6978-e194-47a8-ae24-eaff5669d3dd" />


#### 2. Data Transformation (See Notebook for code)

* Used Azure Databricks (Apache Spark)
* Performed:

  * Data cleaning
  * Removing duplicates
  * Renaming columns
  * Stored transformed data back into the Data Lake
  <br>
  <img width="1909" height="714" alt="Screenshot 2026-04-06 203947" src="https://github.com/user-attachments/assets/495c7d2e-7d87-40be-9c0c-87b937c7525a" />


#### 3. Environment Setup

* Configured Azure resources:

  * Resource Groups
  * Storage Accounts with hierarchical namespace
  * Established connections between services using mounting points
  <br>
  <img width="1892" height="459" alt="image" src="https://github.com/user-attachments/assets/e09b92dc-0cfb-4f43-bb39-b08ea828a12b" />


---

### Part 2 – Data Analytics with Synapse

#### 1. Synapse Workspace Setup

* Created Azure Synapse workspace
* Connected to Data Lake Gen2
* Used Synapse Studio for integrated workflows

#### 2. Data Loading

* Created serverless SQL database: TokyoOlympicDB
* Loaded datasets:

  * Athletes
  * Coaches
  * Medals
  * Teams
  * Entries
  <br>
  <img width="1919" height="800" alt="image" src="https://github.com/user-attachments/assets/3e8bcdf3-b5f4-46d6-8e4e-9d64cdd575fc" />


#### 3. Data Analysis (SQL)

#### Scenario

To ground the analysis in a realistic business context, the project assumes the role of a Performance Analytics Lead at an international high-performance sports consultancy that advises national Olympic committees and elite training centers.

Objective: deliver a decision-support dashboard that helps stakeholders evaluate country-level performance, talent distribution across disciplines, and coaching capacity to inform funding, training focus, and recruitment strategies.
<br>
<br>
#### Dashboard Design (Conceptualized Before Build)

The dashboard was designed with executive consumption in mind—prioritizing clarity, comparability, and drill-down capability.
<br>
<br>
#### KPI Cards

Country Rank (based on medal performance)

#### Visualization 1 – Discipline Distribution

Discipline population per selected country
Supports filtering by top N disciplines

#### Visualization 2 – Gender Participation

Comparison of male vs female participation across disciplines

#### Visualization 3 – Coaching Capacity

Number of coaches per discipline for a selected country

#### Table – Coach Details

Coach name mapped to discipline and country
Enables granular inspection of coaching resources

#### Visualization 4 – Medal Breakdown

Total Gold, Silver, Bronze medals
Filtered by selected country only
Performed analytical queries such as:
<br>
<br>
#### SQL Queries according to above conceptualization
```
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

```
#### 4. Visualization (Power BI)
  A few visuals were dropped/merged to refine the final report in Power BI.
  
  ![OlympicVisual (1)_page-0001](https://github.com/user-attachments/assets/375dec73-b1f6-4140-abba-c4feb6275463)

## Results & Insights

* Built a complete end-to-end data pipeline in Azure
* Processed raw Olympic data into structured datasets
* Enabled efficient analytical querying using Synapse SQL
* Prepared clean, modeled data for visualization and reporting in Power BI

---

## Key Learnings

* Designing scalable data pipelines in Azure
* Working with distributed data processing (Spark)
* Data modeling for analytics
* Writing optimized SQL queries in Synapse
* Understanding how Synapse can unify data workflows

