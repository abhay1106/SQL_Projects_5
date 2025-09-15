--Case Study 2:-
-- Creating DATABASE:-
CREATE DATABASE CASE_STUDY_2
--Using CASE_STUDY_2 DataBase:-
USE CASE_STUDY_2
  --Given DataSet:-
--Creating TABLE1:Location:-
CREATE TABLE Location
(
 Location_Id INT PRIMARY KEY,
 City VARCHAR(50)
 );
--Inserting in the Location Table:-
INSERT INTO Location (Location_Id, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');

--Creating Table2:Department
CREATE TABLE Department
(
 Department_Id INT PRIMARY KEY,
 Name VARCHAR(50),
 Location_Id INT,
 FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_Id)
 );
--Inserting in the Department Table:-
INSERT INTO Department (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

--Creating Table3:Job:-
CREATE TABLE Job
(
 Job_Id INT PRIMARY KEY,
 Designation VARCHAR(50)
 );
--Inserting in the Job table:-
INSERT  INTO Job
VALUES(667, 'CLERK'),
      (668,'STAFF'),
      (669,'ANALYST'),
      (670,'SALES_PERSON'),
      (671,'MANAGER'),
      (672, 'PRESIDENT')

--Creating Table4:Employee:-
CREATE TABLE Employee
(
 Employee_Id INT,
 First_Name VARCHAR(20),
 Last_Name CHAR(20),
 Middle_Name CHAR(1),
 Job_Id INT FOREIGN KEY REFERENCES Job(Job_Id),
 Manager_Id INT,
 Hire_Date DATE,
 Salary INT,
 Comm INT,
 Department_Id  INT FOREIGN KEY REFERENCES Department(Department_Id))
--Inserting in the Employee Table:-
INSERT INTO Employee
VALUES(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
      (7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
      (7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
      (7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
      (7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
      (7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)

  --Tables Available For The Case Study:-
--Location Table:-
SELECT * FROM Location;
--Department Table:-
SELECT * FROM Department;
--Job Table:-
SELECT * FROM Job;
--Employee Table:-
SELECT * FROM Employee;

/**-------------------------------------------------------------------------------------------------------------**/

--Tasks To Be Performed:-
  --Simple Queries:
--1. List all the employee details.
SELECT * FROM Employee;

--2. List all the department details.
SELECT * FROM Department;

--3. List all job details.
SELECT * FROM Job;

--4. List all the locations.
SELECT * FROM Location;

--5. List out the First Name, Last Name, Salary, Commission for all Employees.
SELECT First_name,Last_Name,Salary,Comm FROM Employee;

--6. List out the Employee ID, Last Name, Department ID for all employees and alias
SELECT Employee_ID AS 'ID_of_the_Employee',
       Last_Name AS 'Name_of_the_Employee',
	   Department_ID AS 'Dep_ID'
FROM EMPLOYEE;

--7. List out the annual salary of the employees with their names only.
SELECT First_Name+' '+Middle_Name+' '+Last_Name AS Name_Of_The_Employee,
       Salary AS Annual_Salary
FROM Employee;

  --WHERE Condition:
--1. List the details about "Smith".
SELECT E.Employee_Id,
       E.First_Name+' '+Middle_Name+' '+Last_Name AS 'Name_Of_The_Employee',
	   E.Job_Id,
	   E.Manager_Id,
	   E.Hire_Date,
	   E.Salary,
	   E.Comm,
	   E.Department_Id,
	   D.Name,
	   D.Location_Id,
	   J.Designation,
	   L.City
FROM EMPLOYEE AS E
JOIN Department AS D
ON E.DEPARTMENT_ID=D.Department_Id
JOIN Job AS J
ON E.JOB_ID=J.Job_ID
JOIN Location AS L
ON D.Location_Id=L.Location_ID
WHERE Last_Name='Smith'

--2. List out the employees who are working in department 20.
SELECT * FROM Employee WHERE Department_Id=20;

--3. List out the employees who are earning salaries between 3000 and4500.
SELECT * FROM Employee WHERE Salary BETWEEN 3000 AND 4500;

--4. List out the employees who are working in department 10 or 20.
SELECT * FROM Employee WHERE Department_Id=10 OR Department_Id=20;

--5. Find out the employees who are not working in department 10 or 30.
SELECT * FROM Employee WHERE Department_Id<>10 AND Department_Id<>30

--6. List out the employees whose name starts with 'S'.
SELECT * FROM Employee WHERE First_Name LIKE 'S%';

--7. List out the employees whose name starts with 'S' and ends with 'H'.
SELECT * FROM Employee WHERE First_Name LIKE 'S%%H';

--8. List out the employees whose name length is 4 and start with 'S'.
SELECT * FROM Employee WHERE First_Name LIKE 'S%' AND len(First_Name)=4

--9. List out employees who are working in department 10 and draw salaries more than 500.
SELECT * FROM Employee WHERE Department_Id=10 AND Salary>500;

--10. List out the employees who are not receiving commission.
SELECT * FROM Employee WHERE Comm is null;

  --ORDER BY Clause:-
--1.List out the Employee ID and Last Name in ascending order based on the EmployeeID.
SELECT Employee_ID, Last_Name
FROM Employee
ORDER BY Employee_Id ASC;

--2. List out the Employee ID and Name in descending order based on salary.
SELECT Employee_Id,First_Name+' '+Middle_Name+' '+Last_Name AS 'Name_Of_The_Employee'
FROM Employee
ORDER BY Salary DESC;

--3. List out the employee details according to their Last Name in ascending-order.
SELECT * FROM Employee
ORDER BY Last_Name;

--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order.
SELECT * FROM Employee
ORDER BY Last_Name,Department_Id DESC;

  --GROUP BY and HAVING Clause:
--1. How many employees are in different departments in the organization?
SELECT D.Name,COUNT(E.Department_Id) AS 'Employees_In_Each_Department'
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
GROUP BY E.Department_Id,Name;

--2. List out the department wise maximum salary, minimum salary and average salary of the employees.
SELECT Department_Id,MAX(Salary) AS 'Max_Salary',MIN(Salary) AS 'Min_Salary',AVG(Salary) AS 'Average_Salary'
FROM Employee
GROUP BY Department_Id;

--3. List out the job wise maximum salary, minimum salary and average salary of the employees.
SELECT Designation,MAX(Salary) AS 'Max_Salary',MIN(Salary) AS 'Min_Salary',AVG(Salary) AS 'Average_Salary'
FROM Employee AS E
JOIN Job AS J
ON E.Job_Id=J.Job_Id
GROUP BY J.Designation;

--4. List out the number of employees who joined each month in ascending order.
SELECT MONTH(Hire_Date) AS 'Months',COUNT(Employee_Id) AS No_Of_Joining
FROM employee
GROUP BY MONTH(Hire_Date) 
ORDER BY MONTH(Hire_Date) ASC;

--5. List out the number of employees for each month and year in ascending order based on the year and month.
SELECT MONTH(Hire_Date) AS 'Months',YEAR(Hire_Date) AS 'Year',COUNT(Employee_Id) AS No_Of_Joining
FROM employee
GROUP BY Hire_Date 
ORDER BY Hire_Date ASC;

--6. List out the Department ID having at least four employees.
SELECT Department_Id
FROM Employee 
GROUP BY Department_Id
HAVING COUNT(Department_Id) >=4;

--7. How many employees joined in the month of January?
SELECT COUNT(Employee_Id) AS 'No_Of_Employees_Joined_In_January'
FROM Employee
WHERE DATENAME(MM,Hire_Date)='January';

--8. How many employees joined in the month of January or September?
SELECT COUNT(Employee_Id) AS 'No_Of_Employees_Joined_In_January_Or_September'
FROM Employee
WHERE DATENAME(MM,Hire_Date)='January' OR DATENAME(MM,Hire_Date)='September';

--9. How many employees joined in 1985?
SELECT COUNT(Employee_Id) AS 'No_Of_Employees_Joined_In_1985'
FROM Employee 
WHERE DATEPART(YYYY,Hire_Date)=1985;

--10. How many employees joined each month in 1985?
SELECT MONTH(Hire_Date) AS 'Month',COUNT(Employee_Id) AS 'No_Of_Employees_Joined(1985)'
FROM Employee
WHERE YEAR(Hire_Date) = 1985
GROUP BY MONTH(Hire_Date);

--11. How many employees joined in March 1985?
SELECT COUNT(Employee_Id) AS 'No_Of_Employees_Joined_In_March1985'
FROM Employee
WHERE MONTH(Hire_Date)=3 AND Year(Hire_Date)=1985;

--12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
SELECT Department_Id
FROM Employee
WHERE MONTH(Hire_Date)=4 AND Year(Hire_Date)=1985
GROUP BY Department_Id
HAVING COUNT(Employee_Id)>=3;

  --JOINS:-
--1. List out employees with their department names.
SELECT E.*,D.Name
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id;

--2. Display employees with their designations.
SELECT E.*,J.Designation
FROM Employee AS E
JOIN Job AS J
ON E.Job_Id=J.Job_ID;

--3. Display the employees with their department names and regional groups.
SELECT E.*,D.Name,L.City
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
JOIN Location AS L
ON D.Location_Id=L.Location_ID;

--4. How many employees are working in different departments? Display with department names.
SELECT D.Name,COUNT(E.Employee_Id) AS 'No_Of_Employees'
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
GROUP BY D.Name;

--5. How many employees are working in the sales department?
SELECT D.Name,COUNT(E.Employee_Id) AS 'No_Of_Employees'
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
GROUP BY D.Name
HAVING D.Name='Sales';

--6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order.
SELECT D.Department_Id,D.Name
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
GROUP BY D.Department_Id,D.Name
HAVING COUNT(Employee_Id)>=5
ORDER BY D.Name ASC;

--7. How many jobs are there in the organization? Display with designations.
select COUNT(Job_ID) AS 'Number_Of_Job',Job.Designation FROM Job GROUP BY Designation;

--8. How many employees are working in "New York"?
SELECT COUNT(Employee_Id) AS 'No_Of_Employees_Working_In_New_York'
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
JOIN Location AS L
ON D.Location_Id=L.Location_ID
WHERE L.City='New York';

--9. Display the employee details with salary grades. Use conditional statement to create a grade column.
SELECT *, Grade=
CASE
WHEN Salary<1000 THEN 'C'
WHEN SALARY<2000 THEN 'B'
ELSE 'A'
END
FROM Employee;

--10. List out the number of employees grade wise. Use conditional statement to create a grade column.
ALTER TABLE Employee
ADD Grade char(1);
UPDATE Employee
SET Grade =
CASE
WHEN Salary<1000 THEN 'C'
WHEN SALARY<2000 THEN 'B'
ELSE 'A'
END;
SELECT Grade,COUNT(Employee_Id) AS 'No_Of_Employees'
FROM Employee
GROUP BY Grade;

--11. Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
SELECT Grade, COUNT(Employee_Id) AS 'No_Of_Employees'
FROM Employee
WHERE Salary BETWEEN 2000 AND 5000
GROUP BY Grade;

--12. Display all employees in sales or operation departments.
SELECT E.*,D.Name
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
WHERE Name='Sales' OR Name='Operations';

  --SET Operators:
--1. List out the distinct jobs in sales and accounting departments.
SELECT DISTINCT(Designation)
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
JOIN Job AS J
ON E.Job_Id=J.Job_ID
WHERE Name='Sales' OR Name='Accounting';

--2. List out all the jobs in sales and accounting departments.
SELECT (Designation)
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
JOIN Job AS J
ON E.Job_Id=J.Job_ID
WHERE Name='Sales' OR Name='Accounting';

--3. List out the common jobs in research and accounting departments in ascending order.
SELECT (Designation)
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
JOIN Job AS J
ON E.Job_Id=J.Job_ID
WHERE Name='Research' OR Name='Accounting'
ORDER BY Designation;

  --SUBQUERIES:
--1. Display the employees list who got the maximum salary.
SELECT * FROM Employee
WHERE SALARY=(SELECT MAX(Salary) FROM Employee);

--2. Display the employees who are working in the sales department.
SELECT * 
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
WHERE D.Name='Sales';

--3. Display the employees who are working as 'Clerk'.
SELECT *
FROM Employee AS E
JOIN Job AS J
ON E.Job_Id=J.Job_ID
WHERE J.Designation='Clerk';

--4. Display the list of employees who are living in "New York".
SELECT *
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
JOIN Location AS L
ON D.Location_Id=L.Location_ID
WHERE L.City='New York';

--5. Find out the number of employees working in the sales department.
SELECT COUNT(Employee_Id) AS 'Number_Of_Employees(Sales)'
FROM Employee AS E
JOIN Department AS D
ON E.Department_Id=D.Department_Id
WHERE D.Name='Sales'

--6. Update the salaries of employees who are working as clerks on the basis of 10%.
UPDATE Employee
SET Salary=Salary*1.1
WHERE Job_Id IN (SELECT Job_Id FROM Job WHERE Designation = 'Clerk');

--7. Delete the employees who are working in the accounting department.
DELETE FROM Employee
WHERE Employee_Id IN (SELECT Employee_Id 
                      FROM Employee AS E
					  JOIN Department AS D
					  ON E.Department_Id=D.Department_Id
					  WHERE D.Name='Accounting');

--8. Display the second highest salary drawing employee details.	
SELECT *
FROM Employee
WHERE Salary= (SELECT MAX(Salary) FROM Employee 
               WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee));

--9. Display the nth highest salary drawing employee details.
DECLARE @N INT = 1; --Need To Replace With Nth Term
WITH Highest_Salary AS (SELECT *, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS Salary_Rank
                         FROM EMPLOYEE)
SELECT Employee_Id, First_Name, Last_Name, Salary
FROM Highest_Salary
WHERE Salary_Rank = @N;

--10. List out the employees who earn more than every employee in department 30.
SELECT * FROM Employee WHERE Salary > (SELECT MAX(Salary) FROM Employee WHERE Department_Id = 30);

--11. List out the employees who earn more than the lowest salary in department.
SELECT * FROM Employee WHERE Salary IN (SELECT MIN(Salary) FROM Employee HAVING Salary > MIN(Salary) GROUP BY Department_Id) 
---------------------------------------------------------------------------------------------------------------

--12. Find out which department has no employees.
SELECT D.Name
FROM Department AS D 
LEFT JOIN Employee AS E
ON D.Department_Id = E.Department_Id
WHERE E.Employee_Id IS NULL;

--13. Find out the employees who earn greater than the average salary for their department.
SELECT e.*
FROM Employee AS E
INNER JOIN (SELECT AVG(salary) AS Average_Salary,Department_Id
            FROM Employee GROUP BY Department_Id) AS D
ON E.Department_Id = D.Department_Id WHERE E.Salary > D.Average_Salary;

