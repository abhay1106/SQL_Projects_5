# Employee Management & Sales Analysis - SQL Project

## 1. Project Overview
This project demonstrates the use of SQL to build and query a relational database for a sample organization.
It covers table creation, data insertion, and query examples using:
Simple Queries
- WHERE, ORDER BY Clauses
- GROUP BY & HAVING
- JOINS
- SET Operators
- Subqueries
The dataset includes employees, departments, jobs, and locations.
This project is designed to practice SQL fundamentals and advanced query writing.

## 2. Database Schema
### **Tables**

| Column       | Type         | Key |
| ------------ | ------------ | --- |
| Location\_ID | INT          | PK  |
| City         | VARCHAR(100) |     |

| Column         | Type         | Key                         |
| -------------- | ------------ | --------------------------- |
| Department\_Id | INT          | PK                          |
| Name           | VARCHAR(100) |                             |
| Location\_Id   | INT          | FK → Location(Location\_ID) |

| Column      | Type         | Key |
| ----------- | ------------ | --- |
| Job\_ID     | INT          | PK  |
| Designation | VARCHAR(100) |     |

| Column         | Type          | Key                             |
| -------------- | ------------- | ------------------------------- |
| Employee\_Id   | INT           | PK                              |
| Last\_Name     | VARCHAR(100)  |                                 |
| First\_Name    | VARCHAR(100)  |                                 |
| Middle\_Name   | VARCHAR(100)  |                                 |
| Job\_Id        | INT           | FK → Job(Job\_ID)               |
| Hire\_Date     | DATE          |                                 |
| Salary         | DECIMAL(12,2) |                                 |
| Comm           | DECIMAL(12,2) |                                 |
| Department\_Id | INT           | FK → Department(Department\_Id) |

## 3. Sample Data
-- Locations
```sql
INSERT INTO Location VALUES (122, 'New York');
INSERT INTO Location VALUES (123, 'Dallas');
INSERT INTO Location VALUES (124, 'Chicago');
INSERT INTO Location VALUES (167, 'Boston');
```
-- Departments
```sql
INSERT INTO Department VALUES (10, 'Accounting', 122);
INSERT INTO Department VALUES (20, 'Sales', 124);
INSERT INTO Department VALUES (30, 'Research', 123);
INSERT INTO Department VALUES (40, 'Operations', 167);
```
-- Jobs
```sql
INSERT INTO Job VALUES (667, 'Clerk');
INSERT INTO Job VALUES (668, 'Staff');
INSERT INTO Job VALUES (669, 'Analyst');
INSERT INTO Job VALUES (670, 'Sales Person');
INSERT INTO Job VALUES (671, 'Manager');
INSERT INTO Job VALUES (672, 'President');
```
-- Employees (sample)
```sql
INSERT INTO Employee VALUES (7369,'Smith','John','Q',667,'1984-12-17',800,NULL,20);
INSERT INTO Employee VALUES (7499,'Allen','Kevin','J',670,'1985-02-20',1600,300,30);
INSERT INTO Employee VALUES (7550,'Doyle','Jean','K',671,'1985-04-04',2850,NULL,30);
INSERT INTO Employee VALUES (7556,'Dennis','Lynn','S',671,'1985-05-15',2750,NULL,30);
INSERT INTO Employee VALUES (7557,'Baker','Leslie','D',671,'1985-06-10',2200,NULL,40);
INSERT INTO Employee VALUES (7521,'Wark','Cynthia','D',670,'1985-02-22',1250,50,30);
```
## 4. Tasks To Be Performed
1. List all employees  
2. List all departments  
3. List all jobs  
4. List all locations  
5. Display employee first name, last name, salary, commission  
6. Employee ID, last name, department ID with aliases  
7. Annual salary of employees  
8. Employees by name, department, salary, filters (WHERE)  
9. Employee ordering (ORDER BY)  
10. Grouping & aggregation (GROUP BY, HAVING)  
11. Joins (INNER JOIN, LEFT JOIN)  
12. Set operators (UNION, INTERSECT)  
13. Subqueries (MAX, MIN, nth highest salary, conditional updates)  

## 5. Queries
### **Simple Queries**

### **Task 1 - List all employees**
```sql
SELECT * FROM Employee;
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7369         | Smith      | John        | Q            | 667     | 1984-12-17 | 800    | NULL | 20             |
| 7499         | Allen      | Kevin       | J            | 670     | 1985-02-20 | 1600   | 300  | 30             |
| 7550         | Doyle      | Jean        | K            | 671     | 1985-04-04 | 2850   | NULL | 30             |
| 7556         | Dennis     | Lynn        | S            | 671     | 1985-05-15 | 2750   | NULL | 30             |
| 7557         | Baker      | Leslie      | D            | 671     | 1985-06-10 | 2200   | NULL | 40             |
| 7521         | Wark       | Cynthia     | D            | 670     | 1985-02-22 | 1250   | 50   | 30             |

### **Task 2 - List all departments**
```sql
SELECT * FROM Department;
```
Result:
| Department\_Id | Name       | Location\_Id |
| -------------- | ---------- | ------------ |
| 10             | Accounting | 122          |
| 20             | Sales      | 124          |
| 30             | Research   | 123          |
| 40             | Operations | 167          |

### **Task 3 - List all jobs**
```sql
SELECT * FROM Job;
```
Result:
| Job\_Id | Designation  |
| ------- | ------------ |
| 667     | Clerk        |
| 668     | Staff        |
| 669     | Analyst      |
| 670     | Sales Person |
| 671     | Manager      |
| 672     | President    |

### **Task 4 - List all the locations**
```sql
SELECT * FROM Location;
```
Result:
| Location\_ID | City     |
| ------------ | -------- |
| 122          | New York |
| 123          | Dallas   |
| 124          | Chicago  |
| 167          | Boston   |

### **Task 5 - List out First Name, Last Name, Salary, Commission for all Employees**
```sql
SELECT First_Name, Last_Name, Salary, Comm FROM Employee;
```
Result:
| First\_Name | Last\_Name | Salary | Comm |
| ----------- | ---------- | ------ | ---- |
| John        | Smith      | 800    | NULL |
| Kevin       | Allen      | 1600   | 300  |
| Jean        | Doyle      | 2850   | NULL |
| Lynn        | Dennis     | 2750   | NULL |
| Leslie      | Baker      | 2200   | NULL |
| Cynthia     | Wark       | 1250   | 50   |

### **Task 6 - Employee ID, Last Name, Department ID with aliases**
```sql
SELECT Employee_Id AS "ID of the Employee",
       Last_Name AS "Name of the Employee",
       Department_Id AS "Dep_id"
FROM Employee;
```
Result:
| ID of the Employee | Name of the Employee | Dep\_id |
| ------------------ | -------------------- | ------- |
| 7369               | Smith                | 20      |
| 7499               | Allen                | 30      |
| 7550               | Doyle                | 30      |
| 7556               | Dennis               | 30      |
| 7557               | Baker                | 40      |
| 7521               | Wark                 | 30      |

### **Task 7 - Annual salary of employees with names**
```sql
SELECT First_Name, Last_Name, Salary * 12 AS Annual_Salary
FROM Employee;
```
Result:
| First\_Name | Last\_Name | Annual\_Salary |
| ----------- | ---------- | -------------- |
| John        | Smith      | 9600           |
| Kevin       | Allen      | 19200          |
| Jean        | Doyle      | 34200          |
| Lynn        | Dennis     | 33000          |
| Leslie      | Baker      | 26400          |
| Cynthia     | Wark       | 15000          |

### **WHERE Clause**

### **Task 1 -List the details about "Smith"**
```sql
SELECT * FROM Employee
WHERE Last_Name = 'Smith';
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7369         | Smith      | John        | Q            | 667     | 17-Dec-84  | 800    | NULL | 20             |

### **Task 2 - Employees working in department 20**
```sql
SELECT * FROM Employee WHERE Department_Id = 20;
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Salary | Department\_Id |
| ------------ | ---------- | ----------- | ------ | -------------- |
| 7369         | Smith      | John        | 800    | 20             |

### **Task 3 - Employees earning salary between 2000 and 3000**
```sql
SELECT * FROM Employee WHERE Salary BETWEEN 2000 AND 3000;
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Salary |
| ------------ | ---------- | ----------- | ------ |
| 7550         | Doyle      | Jean        | 2850   |
| 7556         | Dennis     | Lynn        | 2750   |
| 7557         | Baker      | Leslie      | 2200   |

### **Task 4 - Employees working in department 10 or 20**
```sql
SELECT * FROM Employee
WHERE Department_Id IN (10, 20);
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7369         | Smith      | John        | Q            | 667     | 17-Dec-84  | 800    | NULL | 20             |

### **Task 5 - Employees NOT in department 10 or 30**
```sql
SELECT * FROM Employee
WHERE Department_Id NOT IN (10, 30);
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7369         | Smith      | John        | Q            | 667     | 17-Dec-84  | 800    | NULL | 20             |
| 7557         | Baker      | Leslie      | D            | 671     | 10-Jun-85  | 2200   | NULL | 40             |

### **Task 6 - Employees whose name starts with 'S'**
```sql
SELECT * FROM Employee
WHERE Last_Name LIKE 'S%';
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7369         | Smith      | John        | Q            | 667     | 17-Dec-84  | 800    | NULL | 20             |

### **Task 7 - Employees whose name starts with 'S' and ends with 'H'**
```sql
SELECT * FROM Employee
WHERE Last_Name LIKE 'S%H';
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7369         | Smith      | John        | Q            | 667     | 17-Dec-84  | 800    | NULL | 20             |

### **Task 8 - Employees whose name length is 4 and starts with 'S'**
```sql
SELECT * FROM Employee
WHERE LEN(Last_Name) = 4 AND Last_Name LIKE 'S%';
```
Result: No Rows

### **Task 9 - Employees in department 10 and salary > 3500**
```sql
SELECT * FROM Employee
WHERE Department_Id = 10 AND Salary > 3500;
```
Result: No Rows

### **Task 10 - Employees not receiving commission**
```sql
SELECT * FROM Employee
WHERE Comm IS NULL;
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7369         | Smith      | John        | Q            | 667     | 17-Dec-84  | 800    | NULL | 20             |
| 7550         | Doyle      | Jean        | K            | 671     | 04-Apr-85  | 2850   | NULL | 30             |
| 7556         | Dennis     | Lynn        | S            | 671     | 15-May-85  | 2750   | NULL | 30             |
| 7557         | Baker      | Leslie      | D            | 671     | 10-Jun-85  | 2200   | NULL | 40             |


### **ORDER BY**

### **Task 1 - Employee ID and Last Name in ascending order by Employee ID**
```sql
SELECT Employee_Id, Last_Name
FROM Employee
ORDER BY Employee_Id ASC;
```
Result:
| Employee\_Id | Last\_Name |
| ------------ | ---------- |
| 7369         | Smith      |
| 7499         | Allen      |
| 7521         | Wark       |
| 7550         | Doyle      |
| 7556         | Dennis     |
| 7557         | Baker      |

### **Task 2 - Employee ID and Name in descending order by Salary**
```sql
SELECT Employee_Id, Last_Name, Salary
FROM Employee
ORDER BY Salary DESC;
```
Result:
| Employee\_Id | Last\_Name | Salary |
| ------------ | ---------- | ------ |
| 7550         | Doyle      | 2850   |
| 7556         | Dennis     | 2750   |
| 7557         | Baker      | 2200   |
| 7499         | Allen      | 1600   |
| 7521         | Wark       | 1250   |
| 7369         | Smith      | 800    |

### **Task 3 - Employee details ordered by Last Name ascending**
```sql
SELECT * 
FROM Employee
ORDER BY Last_Name ASC;
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7499         | Allen      | Kevin       | J            | 670     | 20-Feb-85  | 1600   | 300  | 30             |
| 7557         | Baker      | Leslie      | D            | 671     | 10-Jun-85  | 2200   | NULL | 40             |
| 7556         | Dennis     | Lynn        | S            | 671     | 15-May-85  | 2750   | NULL | 30             |
| 7550         | Doyle      | Jean        | K            | 671     | 04-Apr-85  | 2850   | NULL | 30             |
| 7369         | Smith      | John        | Q            | 667     | 17-Dec-84  | 800    | NULL | 20             |
| 7521         | Wark       | Cynthia     | D            | 670     | 22-Feb-85  | 1250   | 500  | 30             |

### **Task 4 - Employee details ordered by Last Name ASC, then Department ID DESC**
```sql
SELECT * 
FROM Employee
ORDER BY Last_Name ASC, Department_Id DESC;
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7499         | Allen      | Kevin       | J            | 670     | 20-Feb-85  | 1600   | 300  | 30             |
| 7557         | Baker      | Leslie      | D            | 671     | 10-Jun-85  | 2200   | NULL | 40             |
| 7556         | Dennis     | Lynn        | S            | 671     | 15-May-85  | 2750   | NULL | 30             |
| 7550         | Doyle      | Jean        | K            | 671     | 04-Apr-85  | 2850   | NULL | 30             |
| 7369         | Smith      | John        | Q            | 667     | 17-Dec-84  | 800    | NULL | 20             |
| 7521         | Wark       | Cynthia     | D            | 670     | 22-Feb-85  | 1250   | 500  | 30             |

### **Group By**

### **Task 1 - Number of employees in each department**
```sql
SELECT Department_Id, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Department_Id;
```
Result:
| Department\_Id | EmployeeCount |
| -------------- | ------------- |
| 20             | 1             |
| 30             | 3             |
| 40             | 1             |

### **Task 2 - Department-wise maximum, minimum, and average salary**
```sql
SELECT Department_Id,
       MAX(Salary) AS MaxSalary,
       MIN(Salary) AS MinSalary,
       AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY Department_Id;
```
Result:
| Department\_Id | MaxSalary | MinSalary | AvgSalary |
| -------------- | --------- | --------- | --------- |
| 20             | 800       | 800       | 800       |
| 30             | 2850      | 1250      | 2166.7    |
| 40             | 2200      | 2200      | 2200      |

### **Task 3 - Job-wise maximum, minimum, and average salary**
```sql
SELECT Job_Id,
       MAX(Salary) AS MaxSalary,
       MIN(Salary) AS MinSalary,
       AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY Job_Id;
```
Result:
| Job\_Id | MaxSalary | MinSalary | AvgSalary |
| ------- | --------- | --------- | --------- |
| 667     | 800       | 800       | 800       |
| 670     | 1600      | 1250      | 1425      |
| 671     | 2850      | 2200      | 2600      |

### **Task 4 - Number of employees who joined each month (ascending order)**
```sql
SELECT MONTH(Hire_Date) AS Month, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY MONTH(Hire_Date)
ORDER BY Month ASC;
```
Result:
| Month | EmployeeCount |
| ----- | ------------- |
| 2     | 2             |
| 4     | 1             |
| 5     | 1             |
| 6     | 1             |
| 12    | 1             |

### **Task 5 - Number of employees per month and year (ascending order)**
```sql
SELECT YEAR(Hire_Date) AS Year, MONTH(Hire_Date) AS Month, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY YEAR(Hire_Date), MONTH(Hire_Date)
ORDER BY Year ASC, Month ASC;
```
Result:
| Year | Month | EmployeeCount |
| ---- | ----- | ------------- |
| 1984 | 12    | 1             |
| 1985 | 2     | 2             |
| 1985 | 4     | 1             |
| 1985 | 5     | 1             |
| 1985 | 6     | 1             |

### **Task 6 - Departments having at least 4 employees**
```sql
SELECT Department_Id, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Department_Id
HAVING COUNT(*) >= 4;
```
Result: No Rows

### **Task 7 - Number of employees who joined in January**
```sql
SELECT COUNT(*) AS EmployeeCount
FROM Employee
WHERE MONTH(Hire_Date) = 1;
```
Result:
| EmployeeCount |
| ------------- |
| 0             |

### **Task 8 - Employees who joined in January or September**
```sql
SELECT COUNT(*) AS EmployeeCount
FROM Employee
WHERE MONTH(Hire_Date) IN (1, 9);
```
Result:
| EmployeeCount |
| ------------- |
| 0             |

### **Task 9 - Employees who joined in 1985**
```sql
SELECT COUNT(*) AS EmployeeCount
FROM Employee
WHERE YEAR(Hire_Date) = 1985;
```
Result:
| EmployeeCount |
| ------------- |
| 5             |

### **Task 10 - Employees who joined each month in 1985**
```sql
SELECT MONTH(Hire_Date) AS Month, COUNT(*) AS EmployeeCount
FROM Employee
WHERE YEAR(Hire_Date) = 1985
GROUP BY MONTH(Hire_Date)
ORDER BY Month ASC;
```
Result:
| Month | EmployeeCount |
| ----- | ------------- |
| 2     | 2             |
| 4     | 1             |
| 5     | 1             |
| 6     | 1             |

### **Task 11 - Employees who joined in March 1985**
```sql
SELECT COUNT(*) AS EmployeeCount
FROM Employee
WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 3;
```
Result:
| EmployeeCount |
| ------------- |
| 0             |

### **Task 12 - Departments having ≥3 employees joining in April 1985**
```sql
SELECT Department_Id, COUNT(*) AS EmployeeCount
FROM Employee
WHERE YEAR(Hire_Date) = 1985 AND MONTH(Hire_Date) = 4
GROUP BY Department_Id
HAVING COUNT(*) >= 3;
```
Result: No Rows

### **Joins**

### **Task 1 - List employees with their department names**
```sql
SELECT E.Employee_Id, E.First_Name, E.Last_Name, D.Name AS DepartmentName
FROM Employee E
JOIN Department D ON E.Department_Id = D.Department_Id;
```
Result:
| Employee\_Id | First\_Name | Last\_Name | DepartmentName |
| ------------ | ----------- | ---------- | -------------- |
| 7369         | John        | Smith      | Sales          |
| 7499         | Kevin       | Allen      | Research       |
| 7550         | Jean        | Doyle      | Research       |
| 7556         | Lynn        | Dennis     | Research       |
| 7557         | Leslie      | Baker      | Operations     |
| 7521         | Cynthia     | Wark       | Research       |

### **Task 2 - Display employees with their designations**
```sql
SELECT E.Employee_Id, E.First_Name, E.Last_Name, J.Designation
FROM Employee E
JOIN Job J ON E.Job_Id = J.Job_Id;
```
Result:
| Employee\_Id | First\_Name | Last\_Name | Designation  |
| ------------ | ----------- | ---------- | ------------ |
| 7369         | John        | Smith      | Clerk        |
| 7499         | Kevin       | Allen      | Sales Person |
| 7550         | Jean        | Doyle      | Manager      |
| 7556         | Lynn        | Dennis     | Manager      |
| 7557         | Leslie      | Baker      | Manager      |
| 7521         | Cynthia     | Wark       | Sales Person |

### **Task 3 - Employees with their department names and locations**
```sql
SELECT E.Employee_Id, E.First_Name, E.Last_Name, D.Name AS DepartmentName, L.City
FROM Employee E
JOIN Department D ON E.Department_Id = D.Department_Id
JOIN Location L ON D.Location_Id = L.Location_ID;
```
Result:
| Employee\_Id | First\_Name | Last\_Name | DepartmentName | City    |
| ------------ | ----------- | ---------- | -------------- | ------- |
| 7369         | John        | Smith      | Sales          | Chicago |
| 7499         | Kevin       | Allen      | Research       | Dallas  |
| 7550         | Jean        | Doyle      | Research       | Dallas  |
| 7556         | Lynn        | Dennis     | Research       | Dallas  |
| 7557         | Leslie      | Baker      | Operations     | Boston  |
| 7521         | Cynthia     | Wark       | Research       | Dallas  |

### **Task 4 - Count of employees working in different departments**
```sql
SELECT D.Name AS DepartmentName, COUNT(E.Employee_Id) AS EmployeeCount
FROM Department D
LEFT JOIN Employee E ON D.Department_Id = E.Department_Id
GROUP BY D.Name;
```
Result:
| DepartmentName | EmployeeCount |
| -------------- | ------------- |
| Accounting     | 0             |
| Sales          | 1             |
| Research       | 3             |
| Operations     | 1             |

### **Task 5 - Count of employees working in the Sales department**
```sql
SELECT COUNT(E.Employee_Id) AS SalesEmployees
FROM Employee E
JOIN Department D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Sales';
```
Result:
| SalesEmployees |
| -------------- |
| 1              |

### **Task 6 - Departments with ≥5 employees**
```sql
SELECT D.Name AS DepartmentName, COUNT(E.Employee_Id) AS EmployeeCount
FROM Department D
LEFT JOIN Employee E ON D.Department_Id = E.Department_Id
GROUP BY D.Name
HAVING COUNT(E.Employee_Id) >= 5;
```
Result: No Rows

### **Task 7 - Count of jobs in the organization**
```sql
SELECT J.Designation, COUNT(E.Employee_Id) AS EmployeeCount
FROM Job J
LEFT JOIN Employee E ON J.Job_Id = E.Job_Id
GROUP BY J.Designation;
```
Result:
| Designation  | EmployeeCount |
| ------------ | ------------- |
| Clerk        | 1             |
| Staff        | 0             |
| Analyst      | 0             |
| Sales Person | 2             |
| Manager      | 3             |
| President    | 0             |

### **Task 8 - Count of employees working in New York**
```sql
SELECT COUNT(E.Employee_Id) AS EmployeeCount
FROM Employee E
JOIN Department D ON E.Department_Id = D.Department_Id
JOIN Location L ON D.Location_Id = L.Location_ID
WHERE L.City = 'New York';
```
Result:
| EmployeeCount |
| ------------- |
| 0             |

### **Task 9 - Employee salary grades (conditional)**
```sql
SELECT E.Employee_Id, E.First_Name, E.Last_Name, Salary,
       CASE
           WHEN Salary >= 2500 THEN 'A'
           WHEN Salary >= 1500 THEN 'B'
           ELSE 'C'
       END AS Grade
FROM Employee E;
```
Result:
| Employee\_Id | First\_Name | Last\_Name | Salary | Grade |
| ------------ | ----------- | ---------- | ------ | ----- |
| 7369         | John        | Smith      | 800    | C     |
| 7499         | Kevin       | Allen      | 1600   | B     |
| 7550         | Jean        | Doyle      | 2850   | A     |
| 7556         | Lynn        | Dennis     | 2750   | A     |
| 7557         | Leslie      | Baker      | 2200   | B     |
| 7521         | Cynthia     | Wark       | 1250   | C     |

### **Task 10 - Number of employees per grade**
```sql
SELECT Grade, COUNT(*) AS EmployeeCount
FROM (
    SELECT CASE
               WHEN Salary >= 2500 THEN 'A'
               WHEN Salary >= 1500 THEN 'B'
               ELSE 'C'
           END AS Grade
    FROM Employee
) AS Grades
GROUP BY Grade;
```
Result:
| Grade | EmployeeCount |
| ----- | ------------- |
| A     | 2             |
| B     | 2             |
| C     | 2             |

### **Task 11 - Employee salary grades and number of employees with salary between 2000 to 5000**
```sql
SELECT Grade, COUNT(*) AS EmployeeCount
FROM (
    SELECT CASE
               WHEN Salary >= 2500 THEN 'A'
               WHEN Salary >= 1500 THEN 'B'
               ELSE 'C'
           END AS Grade
    FROM Employee
    WHERE Salary BETWEEN 2000 AND 5000
) AS SalaryGrades
GROUP BY Grade;
```
Result:
| Grade | EmployeeCount |
| ----- | ------------- |
| A     | 2             |
| B     | 1             |

### **Task 12 - Display all employees in Sales or Operations departments**
```sql
SELECT E.Employee_Id, E.First_Name, E.Last_Name, D.Name AS DepartmentName
FROM Employee E
JOIN Department D ON E.Department_Id = D.Department_Id
WHERE D.Name IN ('Sales', 'Operations');
```
Result:
| Employee\_Id | First\_Name | Last\_Name | DepartmentName |
| ------------ | ----------- | ---------- | -------------- |
| 7369         | John        | Smith      | Sales          |
| 7557         | Leslie      | Baker      | Operations     |

### **SET-Operators**
### **Task 1 - List distinct jobs in Sales and Accounting departments**
```sql
SELECT DISTINCT J.Designation
FROM Employee E
JOIN Job J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_Id = D.Department_Id
WHERE D.Name IN ('Sales', 'Accounting');
```
Result:
| Designation  |
| ------------ |
| Clerk        |
| Sales Person |

### **Task 2 - List all jobs in Sales and Accounting departments (including duplicates)**
```sql
SELECT J.Designation
FROM Employee E
JOIN Job J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_Id = D.Department_Id
WHERE D.Name IN ('Sales', 'Accounting');
```
Result:
| Designation  |
| ------------ |
| Clerk        |
| Sales Person |

### **Task 3 - List common jobs in Research and Accounting departments in ascending order**
```sql
SELECT J.Designation
FROM Employee E
JOIN Job J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Research'
INTERSECT
SELECT J.Designation
FROM Employee E
JOIN Job J ON E.Job_Id = J.Job_Id
JOIN Department D ON E.Department_Id = D.Department_Id
WHERE D.Name = 'Accounting'
ORDER BY Designation ASC;
```
Result: No Rows

### **Subqueries**

### **Task 1 - Display the employees who got the maximum salary**
```sql
SELECT *
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Salary |
| ------------ | ---------- | ----------- | ------ |
| 7550         | Doyle      | Jean        | 2850   |

### **Task 2 - Employees working in the Sales department**
```sql
SELECT *
FROM Employee
WHERE Department_Id = (SELECT Department_Id FROM Department WHERE Name='Sales');
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7369         | Smith      | John        | Q            | 667     | 17-Dec-84  | 800    | NULL | 20             |

### **Task 3 - Employees working as 'Clerk'**
```sql
SELECT *
FROM Employee
WHERE Job_Id = (SELECT Job_Id FROM Job WHERE Designation='Clerk');
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Middle\_Name | Job\_Id | Hire\_Date | Salary | Comm | Department\_Id |
| ------------ | ---------- | ----------- | ------------ | ------- | ---------- | ------ | ---- | -------------- |
| 7369         | Smith      | John        | Q            | 667     | 17-Dec-84  | 800    | NULL | 20             |

### **Task 4 - Employees living in "New York"**
```sql
SELECT E.*
FROM Employee E
JOIN Department D ON E.Department_Id = D.Department_Id
JOIN Location L ON D.Location_Id = L.Location_ID
WHERE L.City='New York';
```
Result: No Rows

### **Task 5 - Number of employees working in Sales department**
```sql
SELECT COUNT(*)
FROM Employee
WHERE Department_Id = (SELECT Department_Id FROM Department WHERE Name='Sales');
```
Result:| Employee\_Id | Last\_Name | Salary |
| ------------ | ---------- | ------ |
| 7369         | Smith      | 880    |

### **Task 6 - Update salaries of employees working as Clerk by 10%**
```sql
UPDATE Employee
SET Salary = Salary * 1.1
WHERE Job_Id = (SELECT Job_Id FROM Job WHERE Designation='Clerk');
```
Result:
| Employee\_Id | Last\_Name | Salary |
| ------------ | ---------- | ------ |
| 7369         | Smith      | 880    |

### ** Task 7 - Delete employees working in Accounting department**
```sql
DELETE FROM Employee
WHERE Department_Id = (SELECT Department_Id FROM Department WHERE Name='Accounting');
```
Result: No Rows

### **Task 8 - Display the second highest salary drawing employee details**
```sql
SELECT *
FROM Employee
WHERE Salary = (SELECT MAX(Salary) 
                FROM Employee
                WHERE Salary < (SELECT MAX(Salary) FROM Employee));
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Salary |
| ------------ | ---------- | ----------- | ------ |
| 7556         | Dennis     | Lynn        | 2750   |

### Task 9 - Display the nth highest salary drawing employee details (Example: 3rd highest)**
```sql
SELECT *
FROM Employee
WHERE Salary = (SELECT MIN(Salary) FROM 
               (SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT 3) AS Top3);
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Salary |
| ------------ | ---------- | ----------- | ------ |
| 7557         | Baker      | Leslie      | 2200   |

### **Task 10 - Employees who earn more than every employee in department 30**
```sql
SELECT *
FROM Employee
WHERE Salary > ALL (SELECT Salary FROM Employee WHERE Department_Id=30);
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Salary |
| ------------ | ---------- | ----------- | ------ |
| 7550         | Doyle      | Jean        | 2850   |

### **Task 11 - Employees who earn more than the lowest salary in their department**
```sql
SELECT *
FROM Employee E
WHERE Salary > (SELECT MIN(Salary) FROM Employee WHERE Department_Id = E.Department_Id);
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Salary | Department\_Id |
| ------------ | ---------- | ----------- | ------ | -------------- |
| 7499         | Allen      | Kevin       | 1600   | 30             |
| 7550         | Doyle      | Jean        | 2850   | 30             |
| 7556         | Dennis     | Lynn        | 2750   | 30             |
| 7557         | Baker      | Leslie      | 2200   | 40             |

### **Task 12 - Departments with no employees**
```sql
SELECT Name
FROM Department
WHERE Department_Id NOT IN (SELECT DISTINCT Department_Id FROM Employee);
```
Result:
| Name       |
| ---------- |
| Accounting |

### **Task 13 - Employees earning greater than average salary for their department**
```sql
SELECT *
FROM Employee E
WHERE Salary > (SELECT AVG(Salary) 
                FROM Employee 
                WHERE Department_Id = E.Department_Id);
```
Result:
| Employee\_Id | Last\_Name | First\_Name | Salary | Department\_Id |
| ------------ | ---------- | ----------- | ------ | -------------- |
| 7550         | Doyle      | Jean        | 2850   | 30             |
| 7556         | Dennis     | Lynn        | 2750   | 30             |

## 6. Key Learnings

- Practiced SQL SELECT queries, filters, and conditions  
- Learned to perform JOINs across multiple tables  
- Aggregations using GROUP BY and HAVING  
- Used ORDER BY for sorting data  
- Subqueries for advanced filtering (MAX, MIN, nth highest salary)  
- Set operators (UNION, INTERSECT) to combine results  
- Conditional statements using CASE for salary grades  
- Learned how to structure queries for reports and insights  

## 7. Conclusion
This project helps understand how to extract actionable insights from relational databases using SQL. It demonstrates handling employee, department, job, and location data efficiently. Next steps can include integrating SQL queries with Python for visualization or building dashboards in Power BI.
