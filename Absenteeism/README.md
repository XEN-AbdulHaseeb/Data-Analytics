# Absenteeism Analysis

We have a dataset containing absenteeism data, reasons for absences and compensation data for each employee
We have a budget of $983,221 to award bonuses for non-smokers

## Tools Used

SQL Server Studio 2019

SQL

Power BI

## Dataset preview

### Preview of Absenteeism at Work file

<img width="1190" height="82" alt="Screenshot 2026-02-17 004921" src="https://github.com/user-attachments/assets/56cb70e3-c61d-4d1f-b4a5-b068226b8e1a" />

### Reasons

<img width="763" height="614" alt="Screenshot 2026-02-17 004939" src="https://github.com/user-attachments/assets/b2fec4ba-c8c8-4873-a7d7-dbae9601f0fd" />

### Compensation

<img width="196" height="373" alt="Screenshot 2026-02-17 004955" src="https://github.com/user-attachments/assets/a4e77b5c-27f0-4bf0-b551-d851677f9b08" />


## Requirements

We try to achieve the following tasks

#### Identify the groups with the most absenteeism

#### Calculate the annual bonus to non-smokers

#### Create a absenteeism dashboard for HR


## Data Preparation

We use SQL Server Studio 2019 as our data base manager.


<pre>

--let's create a join
--reason_for_absence is a foreign in absenteeism table, indicates reason for leaves
SELECT * FROM Absenteeism_at_work abse
LEFT JOIN compensation comp
ON abse.ID = comp.ID
LEFT JOIN Reasons r
ON abse.Reason_for_absence = r.Number;

--let's find the healthiest employees, we will assume those who do not smoke,drink, have good BMI and low avg absenteeism are healthy
SELECT * FROM Absenteeism_at_work abse
WHERE Social_drinker = 0
AND Social_smoker = 0
AND Body_mass_index BETWEEN 18.4 AND 24.9
AND Absenteeism_time_in_hours < (SELECT AVG(Absenteeism_time_in_hours) FROM Absenteeism_at_work abse);

--compensation for non-smokers
--our budget is $983,221
--Hours in a year = 2080, for 5 days a week, 8 hours a day

--let's find the total number of non-smokers
SELECT COUNT(*) AS Non_Smoker FROM Absenteeism_at_work abse
WHERE Social_smoker = 0

--we have 686 non smoking employees, total hours per year combined is 2080 * 686 = 1,426,880
--hourly compensation increase = budget/total_emp_hours = 983,221/1,426,880 - 0.68
--yearly bonus = 2080 * 0.68 = $1414.4


--let's optimize ou query for dashboarding
--Remove unecessary colmumns, include ID and Reasons
--Seasons is determined by month, we can use rewrite the seasons columns and make it into a categorical variable instead of numerical as it is right now
--Apply the same for bmi ranges
SELECT
abse.ID,
abse.Reason_for_absence,
abse.Month_of_absence,
abse.Body_mass_index,

CASE WHEN abse.Body_mass_index < 18.5 THEN 'Underweight'
	 WHEN abse.Body_mass_index BETWEEN 24.9 AND 30 THEN 'Overweight'
	 WHEN abse.Body_mass_index > 30 THEN 'Obese'
	 WHEN abse.Body_mass_index BETWEEN 18.5 AND 24.9 THEN 'Normal'
	 ELSE 'Unknown' END AS BMI_Category,

CASE WHEN abse.Month_of_absence IN (12,1,2) THEN 'Winter'
	 WHEN abse.Month_of_absence IN (3,4,5) THEN 'Spring'
	 WHEN abse.Month_of_absence IN (6,7,8) THEN 'Summer'
	 WHEN abse.Month_of_absence IN (9,10,11) THEN 'Autumn'
	 ELSE 'Unknown' END AS Season_Names,

[Day_of_the_week],
[Transportation_expense],
[Education],
[Son],
[Social_drinker],
[Social_smoker],
[Pet],
[Disciplinary_failure],
[Age],
[Work_load_Average_day],
[Absenteeism_time_in_hours]

FROM Absenteeism_at_work abse
LEFT JOIN compensation comp
ON abse.ID = comp.ID
LEFT JOIN Reasons r
ON abse.Reason_for_absence = r.Number;
  
</pre>

## Visualization (Power BI)

You can download the dashboard from here [Link](./Report/AbsentWorkStuff.pbix)

### Dashboard preview!

![AbsentWorkStuff_page-0001](https://github.com/user-attachments/assets/9755b2b5-0244-456b-af6d-a2a689b9a9a2)


The group with the highest percentage of absenteeism proportional to employee count is employees with 2 children

Followed by overweight employees

Followed by Social Drinkers

Surprisingly smokers had less absenteeism, even though it is miniscule, could be an issue with sample size, or that fact that nicotine does improve short term cognitive performance at the cost of
long term health.







