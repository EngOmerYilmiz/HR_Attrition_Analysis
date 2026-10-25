--Check duplicate employee records and missing values.
Select EmpID,Department, count(*) As Counts
From HR_Analytics
Group by EmpID,Department
Having count(EmpID) > 1


--Validate categorical values, numeric ranges, and data types.
Select *

From HR_Analytics


SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, NUMERIC_SCALE, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'hr_analytics'
ORDER BY ORDINAL_POSITION;

--Identify irrelevant columns and verify the employee-record grain.

SELECT
    COUNT(*)                    AS total_rows,
    COUNT(DISTINCT EmpID) AS distinct_employees,
    COUNT(*) - COUNT(DISTINCT EmpID) AS extra_rows
FROM HR_Analytics;

--Number of employees in each department
Select
    Department,
    Count(*) AS Employees_Number
From hr_analytics
Group By Department
Order By Employees_Number DESC

--Overall Attritions
Select
    Count(*) As Total_Employees,
    Count(Case When Attrition = 'Yes' Then 1 End) As Overall_Attritions
From hr_analytics

--Attrition By Job Role
Select 
    JobRole,
    Count(Case When Attrition = 'Yes' Then 1 End) As Employees_Left
From hr_analytics
Group By JobRole
Order By Employees_Left DESC

--Attrition Rate Per Department

Select
    Department,
    Count(*) As Total_Employees,
    Count(Case When Attrition = 'Yes' Then 1 End) As Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By Department
Order By Attrition_Rate DESC

--Compensation & Overtime Analysis

Select 
    SalarySlab,
    COUNT(*) As Total_Employees,
    OverTime,
    Count(Case When Attrition ='Yes' Then 1 End) As Employees_Left,
    CAST(
        100.0 * COUNT(CASE
            WHEN Attrition = 'Yes' THEN 1
        END) / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate
From hr_analytics
Group By OverTime,SalarySlab
Order By Attrition_Rate DESC

Select 
    SalarySlab,
    Count(Case When Attrition ='Yes' Then 1 End) As Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By SalarySlab
Order By Attrition_Rate DESC

-- Attrition Vs Job Satisfaction
Select
    JobSatisfaction,
    Count(*) AS Total_Employees,
    Count(Case When Attrition='Yes' Then 1 End) AS Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By JobSatisfaction
Order By Attrition_Rate DESC


--Attrition Vs Work-Life Balance

Select
    WorkLifeBalance,
    Count(*) AS Total_Employees,
    Count(Case When Attrition='Yes' Then 1 End) AS Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By WorkLifeBalance
Order By Attrition_Rate DESC

--Attrition Vs Environment Satisfaction

Select
    EnvironmentSatisfaction,
    Count(*) AS Total_Employees,
    Count(Case When Attrition='Yes' Then 1 End) AS Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By EnvironmentSatisfaction
Order By Attrition_Rate DESC

--Attrition Vs Job Involvement

Select
    JobInvolvement,
    Count(*) AS Total_Employees,
    Count(Case When Attrition='Yes' Then 1 End) AS Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By JobInvolvement
Order By Attrition_Rate DESC


--Tenure Vs Attrition

Select
    YearsAtCompany,
    Count(*) AS Total_Employees,
    Count(Case When Attrition='Yes' Then 1 End) AS Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By YearsAtCompany
Order By Attrition_Rate DESC

--Promotion Vs Attrition

Select
    YearsSinceLastPromotion,
    Count(*) AS Total_Employees,
    Count(Case When Attrition='Yes' Then 1 End) AS Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By YearsSinceLastPromotion
Order By Attrition_Rate DESC

--Employee Demographics Vs Attrition

Select
    AgeGroup,
    Count(*) AS Total_Employees,
    Count(Case When Attrition='Yes' Then 1 End) AS Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By     
    AgeGroup
Order By Attrition_Rate DESC

Select
    Gender,
    Count(*) AS Total_Employees,
    Count(Case When Attrition='Yes' Then 1 End) AS Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By     
    Gender
Order By Attrition_Rate DESC

Select
    MaritalStatus,
    Count(*) AS Total_Employees,
    Count(Case When Attrition='Yes' Then 1 End) AS Employees_Left,
    Count(Case When Attrition='Yes' Then 1 End)*100 / Count(*) As Attrition_Rate
From hr_analytics
Group By     
    MaritalStatus
Order By Attrition_Rate DESC