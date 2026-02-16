--let's create a join
--reason_for_absence is a foreign in absenteeism table, indicates reason for leaves
SELECT * FROM Absenteeism_at_work abse
LEFT JOIN compensation comp
ON abse.ID = comp.ID
LEFT JOIN Reasons r
ON abse.Reason_for_absence = r.Number;

--let's find the healthiest employees, we will assume those who do not smoke,drink, have good BMI and low avg absenteeism are healthy, BONUSES FOR THEE
SELECT * FROM Absenteeism_at_work abse
WHERE Social_drinker = 0
AND Social_smoker = 0
AND Body_mass_index BETWEEN 18.4 AND 24.9
AND Absenteeism_time_in_hours < (SELECT AVG(Absenteeism_time_in_hours) FROM Absenteeism_at_work abse);

--compensation for non-smokers
--our budget is $983,221
--Hours in a year = 2080, for 5 days a week, 8 hours a day
--we have 686 non smoking employees, total hours per year combined is 2080 * 686 = 1,426,880
--hourly compensation increase = budget/total_emp_hours = 983,221/1,426,880 - 0.68
--yearly bonus = 2080 * 0.68 = $1414.4

--let's find the total number of non-smokers
SELECT COUNT(*) AS Non_Smoker FROM Absenteeism_at_work abse
WHERE Social_smoker = 0

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




