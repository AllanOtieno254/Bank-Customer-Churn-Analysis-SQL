-- Retrieve all records
SELECT * FROM [Customer-Churn-Records];

-- Total customers
SELECT COUNT(RowNumber) AS Total_Customers 
FROM [Customer-Churn-Records];

-- Total active members
SELECT COUNT(*) AS Total_Active_Members 
FROM [Customer-Churn-Records] 
WHERE IsActiveMember = 1;

-- Total inactive members
SELECT COUNT(*) AS Total_Inactive_Members 
FROM [Customer-Churn-Records] 
WHERE IsActiveMember = 0;

-- Total customer exited
SELECT COUNT(*) AS Total_Customer_Exited 
FROM [Customer-Churn-Records] 
WHERE Exited = 1;

-- Percentage of exited customers
SELECT 
    ROUND((COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0) / COUNT(*), 2) AS Percent_Exited_Customers
FROM [Customer-Churn-Records];

-- Average credit score
SELECT AVG(CreditScore) AS Average_Credit_Score 
FROM [Customer-Churn-Records];

-- Percentage of customers with credit score above average
SELECT 
    ROUND((COUNT(CASE WHEN CreditScore > (SELECT AVG(CreditScore) FROM [Customer-Churn-Records]) THEN 1 END) * 100.0) / COUNT(*), 2) 
    AS Percent_Above_Avg_CreditScore
FROM [Customer-Churn-Records];

-- Total female customers
SELECT COUNT(*) AS Total_Female_Customers
FROM [Customer-Churn-Records]
WHERE Gender = 'Female';

-- Percentage of female customers
SELECT 
    ROUND((COUNT(CASE WHEN Gender = 'Female' THEN 1 END) * 100.0) / COUNT(*), 2) AS Percent_Female_Customers
FROM [Customer-Churn-Records];

-- Total male customers
SELECT COUNT(*) AS Total_Male_Customers
FROM [Customer-Churn-Records]
WHERE Gender = 'Male';

-- Percentage of male customers
SELECT 
    ROUND((COUNT(CASE WHEN Gender = 'Male' THEN 1 END) * 100.0) / COUNT(*), 2) AS Percent_Male_Customers
FROM [Customer-Churn-Records];


--SUMMARRY DASHBOARD1
--1.
-- Total customers with a credit card (HasCrCard = 1)
SELECT COUNT(*) AS Total_Customers_With_CreditCard
FROM [Customer-Churn-Records]
WHERE HasCrCard = 1;

-- Percentage of customers with a credit card
SELECT 
    ROUND((COUNT(CASE WHEN HasCrCard = 1 THEN 1 END) * 100.0) / COUNT(*), 2) AS Percent_With_CreditCard
FROM [Customer-Churn-Records];

-- Total customers with a credit card who have exited
SELECT COUNT(*) AS Total_Exiting_Customers_With_CreditCard
FROM [Customer-Churn-Records]
WHERE HasCrCard = 1 AND Exited = 1;

-- Total active customers with a credit card
SELECT COUNT(*) AS Total_Active_Customers_With_CreditCard
FROM [Customer-Churn-Records]
WHERE HasCrCard = 1 AND IsActiveMember = 1;

-- Total customers without a credit card (HasCrCard = 0)
SELECT COUNT(*) AS Total_Customers_Without_CreditCard
FROM [Customer-Churn-Records]
WHERE HasCrCard = 0;

-- Percentage of customers without a credit card
SELECT 
    ROUND((COUNT(CASE WHEN HasCrCard = 0 THEN 1 END) * 100.0) / COUNT(*), 2) AS Percent_Without_CreditCard
FROM [Customer-Churn-Records];

-- Total customers without a credit card who have exited
SELECT COUNT(*) AS Total_Exiting_Customers_Without_CreditCard
FROM [Customer-Churn-Records]
WHERE HasCrCard = 0 AND Exited = 1;

-- Total active customers without a credit card
SELECT COUNT(*) AS Total_Active_Customers_Without_CreditCard
FROM [Customer-Churn-Records]
WHERE HasCrCard = 0 AND IsActiveMember = 1;

2
--Geography by active members
select * from [Customer-Churn-Records]
-- Count of active members by geography
SELECT Geography, COUNT(*) AS Total_Active_Members
FROM [Customer-Churn-Records]
WHERE IsActiveMember = 1
GROUP BY Geography
ORDER BY Total_Active_Members DESC;

--Percentage of Active Members per Geography
SELECT Geography, 
       COUNT(*) AS Total_Active_Members,
       ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM [Customer-Churn-Records] WHERE IsActiveMember = 1), 2) AS Percent_Active_Members
FROM [Customer-Churn-Records]
WHERE IsActiveMember = 1
GROUP BY Geography
ORDER BY Total_Active_Members DESC;

--Count of Inactive Members by Geography
SELECT Geography, COUNT(*) AS Total_Inactive_Members
FROM [Customer-Churn-Records]
WHERE IsActiveMember = 0
GROUP BY Geography
ORDER BY Total_Inactive_Members DESC;

--Percentage of Inactive Members per Geography
SELECT Geography, 
       COUNT(*) AS Total_Inactive_Members,
       ROUND((COUNT(*) * 100.0) 
	   / 
	   (SELECT COUNT(*)
	   FROM [Customer-Churn-Records] WHERE IsActiveMember = 0), 2) AS Percent_Inactive_Members
FROM [Customer-Churn-Records]
WHERE IsActiveMember = 0
GROUP BY Geography
ORDER BY Total_Inactive_Members DESC;

--3
--Tenuer by Age
--Average Tenure by Age Group
SELECT Age, 
       AVG(Tenure) AS Average_Tenure,
       COUNT(*) AS Total_Customers
FROM [Customer-Churn-Records]
GROUP BY Age
ORDER BY Age;

-- Grouping Age into Ranges for Better Insights
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        WHEN Age > 55 THEN '56+'
    END AS Age_Group,
    AVG(Tenure) AS Average_Tenure,
    COUNT(*) AS Total_Customers
FROM [Customer-Churn-Records]
GROUP BY												
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'				
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'												
        WHEN Age > 55 THEN '56+'				
    END
ORDER BY Age_Group;																

--Distribution of Customers by Tenure & Age
SELECT Age, Tenure, COUNT(*) AS Customer_Count
FROM [Customer-Churn-Records]
GROUP BY Age, Tenure
ORDER BY Age, Tenure ASC;

--4
--salary by balance
--Average Salary by Balance Range
SELECT 
    CASE 
        WHEN Balance BETWEEN 0 AND 50000 THEN '0-50K'
        WHEN Balance BETWEEN 50001 AND 100000 THEN '50K-100K'
        WHEN Balance BETWEEN 100001 AND 150000 THEN '100K-150K'
        WHEN Balance > 150000 THEN '150K+'
    END AS Balance_Range,
    AVG(EstimatedSalary) AS Average_Salary,
    COUNT(*) AS Total_Customers
FROM [Customer-Churn-Records]
GROUP BY 
    CASE 
        WHEN Balance BETWEEN 0 AND 50000 THEN '0-50K'
        WHEN Balance BETWEEN 50001 AND 100000 THEN '50K-100K'
        WHEN Balance BETWEEN 100001 AND 150000 THEN '100K-150K'
        WHEN Balance > 150000 THEN '150K+'
    END
ORDER BY Balance_Range;

--Correlation Between Salary & Balance
SELECT Balance, EstimatedSalary
FROM [Customer-Churn-Records]
ORDER BY Balance;


--Top Customers with High Salary and Balance
SELECT TOP 10 CustomerId, Balance, EstimatedSalary
FROM [Customer-Churn-Records]
ORDER BY Balance DESC, EstimatedSalary DESC;

--Last Customers with High Salary and Balance
SELECT TOP 10 CustomerId, Balance, EstimatedSalary
FROM [Customer-Churn-Records]
ORDER BY Balance DESC, EstimatedSalary DESC;

--5
--Age by salary
--Average Salary by Age Group
SELECT Age, AVG(EstimatedSalary) AS Avg_Salary
FROM [Customer-Churn-Records]
GROUP BY Age
ORDER BY Age;

--Total Salary by Age
SELECT Age, SUM(EstimatedSalary) AS Total_Salary
FROM [Customer-Churn-Records]
GROUP BY Age
ORDER BY Age;

 --Age with the Highest Salaries
 SELECT TOP 10 Age, EstimatedSalary
FROM [Customer-Churn-Records]
ORDER BY EstimatedSalary DESC;

--Salary Distribution by Age (Grouped in Ranges)
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS Age_Group,
    AVG(EstimatedSalary) AS Avg_Salary
FROM [Customer-Churn-Records]
GROUP BY 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END
ORDER BY Age_Group;

--total customer byactive member
SELECT 
    IsActiveMember, 
    COUNT(*) AS Total_Customers
FROM [Customer-Churn-Records]
GROUP BY IsActiveMember;

























--Total inactive members
SELECT COUNT(*) AS Total_Inactive_Members
FROM [Customer-Churn-Records]
WHERE IsActiveMember = 0;



