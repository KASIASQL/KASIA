USE employees;  -- Switch to the 'employees' database

--Select all columns from the table.

SELECT * FROM dbo.[Employee Sample data]

--Select specific columns.
SELECT Employee_ID, full_name, Job_Title, Department, 
Business_Unit, Gender, Ethnicity, Age, Hire_Date, 
Annual_Salary, Bonus, City Exit_Date 
FROM dbo.[Employee Sample Data]

--Filter employees by gender.
SELECT Employee_ID, Full_Name, Job_Title, Department, Business_Unit,Gender
FROM dbo.[Employee Sample Data]
WHERE Gender LIKE 'F%'

SELECT Employee_ID, Full_Name, Job_Title, Department, Business_Unit,Gender 
FROM dbo.[Employee Sample Data]
WHERE Gender LIKE'M%'

--Filter employees by department
SELECT Employee_ID,Full_Name,Business_Unit,Bonus,Department,Country
FROM dbo.[Employee Sample Data]
WHERE Department = 'IT';
--OR
SELECT Employee_ID,Full_Name,Department,Country
FROM dbo.[Employee Sample Data]
WHERE Department IN ('IT', 'marketing');
--Filter employees by country.
SELECT Employee_ID, Full_Name,Business_Unit,Department,Age,Country
FROM dbo.[Employee Sample Data]
WHERE Country = 'United States';

--Filter employees by ethnicity.
SELECT Employee_ID,Full_Name,Business_Unit,Department,Country,Ethnicity
FROM dbo.[Employee Sample Data]
WHERE Ethnicity = 'Asian'

--Filter employees by annual salary greater than a specific amount.
SELECT Employee_ID, Full_Name,Business_Unit,Department,
Age,Bonus,Annual_Salary 
FROM dbo.[Employee Sample Data]
WHERE Annual_Salary > 200000;

--Filter employees who have a bonus percentage greater than 0%.
SELECT Employee_ID,Full_Name,Business_Unit,Hire_Date,bonus,Department
FROM dbo.[Employee Sample Data]
WHERE TRY_CAST(REPLACE(BONUS, '%', '') AS DECIMAL(10,2)) > 0;
--In this query:
--TRY_CAST(REPLACE(BONUS, '%', '') AS DECIMAL(10,2)): This expression removes the % sign from the BONUS column using REPLACE function 
--and then tries to cast the resulting string to a DECIMAL(10,2) 
--data type (assuming your bonuses are stored as percentages with up to two decimal places).
--WHERE TRY_CAST(...) > 0: Filters rows where the converted bonus value is greater than 0.
--This approach ensures that even if some BONUS values include % signs, 
--they are correctly handled by removing these signs before attempting to cast to a numeric type.

--Filter employees by hire date range.
SELECT Employee_ID, Full_Name, Job_Title, Department,Hire_Date
FROM dbo.[Employee Sample Data]
WHERE Hire_Date BETWEEN '1997-04-17' AND '2007-08-28';
--WHERE clause that specifies the range of dates
--the BETWEEN operator paired with AND is used to specify a range of values for filtering data. 
--BETWEEN is inclusive, meaning it includes values that are within the specified range.
--Using BETWEEN followed by AND provides a clear and concise syntax to define the range directly in the WHERE clause of your SQL query. 
--This makes it easy for anyone reading the query to understand the filtering criteria without ambiguity.

--Sort employees by annual salary in descending order.
SELECT Employee_ID, Full_Name, JOb_Title,Department, 
Business_Unit, Gender, Age,Annual_Salary
FROM dbo.[Employee Sample Data]
ORDER BY Annual_Salary desc;

--Sort employees by age in ascending order.
SELECT Employee_ID, Full_Name, JOb_Title,Department, 
Business_Unit, Gender, Age,Annual_Salary,Hire_Date
FROM dbo.[Employee Sample Data]
ORDER BY Age asc;

--Sort employees by hire date in descending order.
SELECT Employee_ID, Full_Name, JOb_Title,Department, 
Business_Unit, Gender, Age,Annual_Salary,Hire_Date
FROM dbo.[Employee Sample Data]
ORDER BY Hire_Date desc;

--Select employees who are managers or directors.
SELECT Employee_ID, Full_Name, JOb_Title,Department, 
Business_Unit, Gender, Age,Annual_Salary,Hire_Date
FROM dbo.[Employee Sample Data]
WHERE Job_Title IN ('MANAGER', 'DIRECTOR');

--Filter employees by city and sort by annual salary.
SELECT Employee_ID, Full_Name, JOb_Title,Department, 
Business_Unit, Gender, Age,Annual_Salary,City
FROM dbo.[Employee Sample Data]
WHERE City = 'Austin'
ORDER BY Annual_Salary desc;
--WHERE clause for filtering and the ORDER BY clause for sorting.
--WHERE Clause: The WHERE clause is used to filter rows from a table based on specified conditions. 
--It allows us to selectively retrieve rows that meet certain criteria.
--The ORDER BY clause is used to sort the result set returned by a SELECT statement. 
--It allows you to specify one or more columns by which you want to sort the rows, 
--either in ascending (default) or descending order (ASC or DESC). 
--In our case, ORDER BY AnnualSalary DESC sorts the filtered employees by their annual salary in descending order, 
--meaning employees with higher salaries will appear first in the result set.
--This ensures that only employees from a specific city are included in the result set.

---Filter employees who have exited and sort by exit date.
SELECT Employee_ID, Full_Name, JOb_Title,Department, Business_Unit, 
Gender, Age,Annual_Salary,City,Exit_Date
FROM dbo.[Employee Sample Data]
WHERE Exit_Date IS NOT NULL
ORDER BY Exit_Date desc;
--NULL VALUES AFFECT YOUR ANALYSIS WHEN THEY ARE IN YOUR DATA. ITS EITHER YOU DELETE NULL VALUES OR BY INPUTATION.
--ExitDate IS NOT NULL ensures that only employees with a recorded exit date (i.e., employees who have left the company) are included in the result set.
--ORDER BY ExitDate DESC sorts the result set in descending order based on the ExitDate column, 

--Select employees who have the same first name
SELECT Employee_ID, Full_Name,Job_Title
FROM dbo.[Employee Sample Data]
WHERE SUBSTRING(full_name, 1, CHARINDEX(' ', full_name + ' ') - 1)
       IN (
           SELECT SUBSTRING(full_name, 1, CHARINDEX(' ', full_name + ' ') - 1)
           FROM dbo.[Employee Sample Data]
           GROUP BY SUBSTRING(full_name, 1, CHARINDEX(' ', full_name + ' ') - 1)
           HAVING COUNT(*) > 1
       )
ORDER BY full_name;
--SUBSTRING(full_name, 1, CHARINDEX(' ', full_name + ' ') - 1) extracts the first name from the full_name column. 
--It looks for the first space (' ') in the name and retrieves the characters before that space.
--CHARINDEX(' ', full_name + ' ') finds the position of the first space in the full_name. 
--The + ' ' ensures that even if there is no trailing space, the function will not fail.
--IN (...) filters the employees to include only those whose extracted first names appear in the subquery result.
--The subquery SELECT SUBSTRING(full_name, 1, CHARINDEX(' ', full_name + ' ') - 1) 
--FROM Employees GROUP BY SUBSTRING(full_name, 1, CHARINDEX(' ', full_name + ' ') - 1) 
--HAVING COUNT(*) > 1 groups employees by their first names and selects only those first names that appear more than once, 
--indicating employees who share the same first name.
--ORDER BY full_name sorts the result set by full_name.
--This query will retrieve all columns (*) for employees who share the same first name with at least one other employee,
--based on their full names stored in the full_name column. Adjust column names (full_name) as per your actual table structure.



--Select employees by hire date and sort by full name.
SELECT Employee_ID, Full_Name, JOb_Title,Department, 
Business_Unit, Gender, Annual_Salary,City,Hire_Date
FROM dbo.[Employee Sample Data]
WHERE Hire_Date >= '1993-11-19'  
  AND Hire_Date <= '2002-05-06'  
ORDER BY full_name;
--Using >= and <= ensures that the query includes employees who were hired exactly on the specified dates ('YYYY-MM-DD') 
--and not just those within a range that excludes the endpoints. 
--This approach is typical in SQL queries to precisely define and retrieve data within specific date boundaries.


--Select employees by business unit and sort by age.
SELECT Employee_ID,Full_Name,Business_Unit,Country,Age
FROM dbo.[Employee Sample Data]
WHERE Business_Unit = 'Corporate'
ORDER BY Age desc;

