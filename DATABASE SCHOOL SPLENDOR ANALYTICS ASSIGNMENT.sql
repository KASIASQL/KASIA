--CREATING DATABASE STRUCTURES
--CREATE A DATABASE:
-- CREATE A DATABASE NAMED SCHOOL.
--CREATE TABLES:
--IN THE SCHOOL DATABASE, CREATE A TABLE NAMED STUDENTS WITH COLUMNS
--TASK 1:
--CREATE TABLE STUDENTS
	CREATE TABLE Students (
	Student_ID INT PRIMARY KEY IDENTITY,
	First_Name VARCHAR (50),
	Last_Name VARCHAR (50),
	Date_of_Birth DATE,
	Enrollment_Date DATE
	);
--CREATE ANOTHER TABLE NAMED COURSES WITH THE FOLLOWING COLUMNS:
	CREATE TABLE Courses (
	Course_ID INT PRIMARY KEY IDENTITY,
	Course_Name VARCHAR (50),
	Credits INT
	);
--Task 2: Modifying Database Structures
--Add a Column:
--Add a column named Email (VARCHAR(100)) to the Students table.
	 ALTER TABLE Students
	 ADD Email VARCHAR (100);

--Modify a Column:

--Change the data type of the Credits column in the Courses table to FLOAT.
	ALTER TABLE Courses
	ALTER COLUMN Credits FLOAT;
--Drop a Column:
--Remove the DateOfBirth column from the Students table.
	ALTER TABLE Students
	DROP COLUMN Date_Of_Birth;

	--Task 3: Deleting Database Structures
--Drop a Table:
	DROP TABLE Students;

--Delete the Courses table from the School database.
	DROP TABLE Courses;
--Drop the Database:
	DROP DATABASE School;
--Delete the School database.
