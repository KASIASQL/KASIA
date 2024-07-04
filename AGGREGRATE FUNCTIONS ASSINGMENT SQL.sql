--Total number of employees by department.
SELECT * FROM [Employee Sample Data]
SELECT COUNT (Department)AS Total_No_Employees
FROM [Employee Sample Data]

--Sum of bonuses by business unit.
SELECT Business_Unit, SUM(CAST(REPLACE(Bonus,'%', '')  
AS DECIMAL (10,2))) AS Total_Bonus
FROM [Employee Sample Data]
GROUP BY Business_Unit;

--Maximum and minimum age of employees by department.
SELECT Department, Max(Age) AS MAX_AGE
FROM [Employee Sample Data]
Group By Department;

SELECT Department, MIN(Age) AS MIN_AGE
FROM [Employee Sample Data]
GROUP BY Department;

--Average annual salary by country.
SELECT Country, AVG(Annual_Salary) AS AVG_SALARY
FROM [Employee Sample Data]
GROUP BY Country;

--Total number of employees by gender and ethnicity.
SELECT Gender,Ethnicity, COUNT (EMPLOYEE_ID) AS NO_EMPLOYEES
FROM [Employee Sample Data]
GROUP BY Gender, Ethnicity

--Average bonus percentage by country.
SELECT Country, AVG(CAST(REPLACE(BONUS, '%', '') 
AS DECIMAL (10,2))) AS AVG_BONUS
FROM [Employee Sample Data]
GROUP BY Country;

--Number of employees hired each year.
SELECT YEAR(Hire_Date) AS HIRE_YEAR,
COUNT(*) AS NUM_EMPLOYEES_HIRED
FROM [Employee Sample Data]
GROUP BY YEAR (HIRE_DATE)
ORDER BY HIRE_YEAR;

--Total number of employees who have exited by city.
SELECT City, COUNT (Exit_Date) AS NO_EMPLOYEES_EXITED
FROM [Employee Sample Data]
WHERE Exit_Date is NOT NULL
GROUP BY City
ORDER BY NO_EMPLOYEES_EXITED;

--Average age of employees by business unit.
SELECT Business_Unit, AVG (Age) 
AS AVG_AGE 
FROM [Employee Sample Data]
GROUP BY BUSINESS_UNIT;

--Sum of annual salaries by country and department.
SELECT Country,Department, SUM (Annual_Salary) 
AS SUM_SALARIES
FROM [Employee Sample Data]
Group By Country, Department
ORDER BY SUM_SALARIES;

--Average annual salary by gender and ethnicity.
SELECT Gender,Ethnicity, AVG (Annual_Salary) AS AVG_ANNUAL_SALARY
FROM [Employee Sample Data]
GROUP BY Gender, Ethnicity
ORDER BY AVG_ANNUAL_SALARY;

--Total number of employees by job title.
SELECT Job_Title, COUNT (*)AS TOTAL_NO_EMPLOYEES
FROM [Employee Sample Data]
GROUP BY Job_Title
ORDER BY TOTAL_NO_EMPLOYEES;

--Average years of service by department.
SELECT Department, AVG(DATEDIFF(YEAR, Hire_Date, GETDATE())) 
as avg_years_of_service
FROM [Employee Sample Data]
GROUP BY Department
ORDER BY avg_years_of_service;
--Total bonus amount by job title.
SELECT Job_Title, SUM (CAST(REPLACE(Bonus, '%', '') 
AS DECIMAL (10,2)))
AS TOTAL_BONUS
FROM [Employee Sample Data]
GROUP BY Job_Title
ORDER BY TOTAL_BONUS;
--Average age of employees by country.
SELECT Country, AVG(Age) AS AVg_Age_by_country 
FROM [Employee Sample Data]
GROUP BY COUNTRY
ORDER BY Avg_Age_by_country;
--Total number of employees by business unit and department.
SELECT Business_Unit,Department, COUNT(*) AS TOTAL_BY_UANDD
FROM [Employee Sample Data]
GROUP BY Business_Unit,Department
ORDER BY TOTAL_BY_UANDD;
--Average annual salary by city.
SELECT CITY, AVG(Annual_Salary) AS AVG_SALARY_CITY
FROM [Employee Sample Data]
GROUP BY City
ORDER BY AVG_SALARY_CITY;
--Sum of annual salaries by gender and ethnicity.
SELECT Gender,Ethnicity, SUM(Annual_Salary) AS SUM_OF_ANNUAL_SALARIES 
FROM [Employee Sample Data]
GROUP BY Gender,Ethnicity
ORDER BY SUM_OF_ANNUAL_SALARIES;
--Number of employees exited each year.
SELECT YEAR(Exit_Date) AS EXIT_YEAR,COUNT(*) AS NO_EXITS
FROM [Employee Sample Data]
WHERE EXIT_DATE IS NOT NULL
GROUP BY YEAR (Exit_Date)
ORDER BY EXIT_YEAR;