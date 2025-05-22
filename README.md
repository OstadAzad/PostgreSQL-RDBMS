Practice Tasks: Module-8
Demo Table Overview
All of the following tasks are based on a sample table named students. Use this as a reference while solving the following tasks. Here's a quick overview of the structure:
Column Name    
Description
id           
Auto-incremented primary key
roll          
Unique roll number for each student
name         
Name of the student
age          
Age of the student
department    
Student’s department (e.g., CSE, EEE)
score        
Score achieved by the student
status       
Academic status (e.g., passed, failed)
last_login    
Last login date


Table Alteration Tasks (Based on 8-1 to 8-3)
Add a column email (VARCHAR) to the existing students table.


Rename the column email to student_email.


Add a UNIQUE constraint to student_email.


Add a PRIMARY KEY to a new table named courses.


Drop a column from any existing table.



Filtering & Logical Operations (Based on 8-5, 8-7, 8-8)
Write a query to find all students who have a score greater than 80 and not null.


Use the NOT operator to exclude students from a specific department.


Fetch students whose names start with ‘A’ using LIKE and ILIKE.


Select all students whose age is between 18 and 25.


Retrieve rows using IN for a specific set of roll numbers.



Aggregate Functions (Based on 8-6)
Count how many students exist in the students table.


Find the average score of students in a specific department.


Get the maximum and minimum age of all students.



Update & Delete Operations (Based on 8-9, 8-10)
Update the status of students who scored less than 50 to 'failed'.


Delete students who have not logged in since last year.


Use LIMIT and OFFSET to fetch the second page of results (5 per page).




Practice Tasks: Module-9

Demo Table Overview
The following tasks are based on these sample tables. Use them as reference while solving the tasks.
students Table Structure:
Column Name
                      Description
id
                       Auto-incremented primary key
name
                       Name of the student
department_id
                       Foreign key referencing departments table
last_login
                       Last login date

departments Table Structure:
Column Name
                       Description
id
                       Auto-incremented primary key
name
                       Department name (e.g., CSE, EEE)

courses Table Structure:
Column Name
                       Description
id
                       Auto-incremented primary key
title
                       Course title


Date & Grouping Tasks (Based on 9-1, 9-2)
Retrieve students who have logged in within the last 30 days.


Extract the login month from the last_login and group students by month.


Count how many students logged in per month and show only those months where login count is more than 3.



Foreign Key & Constraints (Based on 9-3, 9-4, 9-5)
Create a foreign key constraint on department_id in the students table referencing departments(id).


Try inserting a student with a department_id that doesn’t exist and observe the behavior.


Delete a department and see how students are affected using ON DELETE CASCADE and ON DELETE SET NULL.



Join Operations (Based on 9-6 to 9-8)
Join students and departments using INNER JOIN to display each student's department name.


Use a LEFT JOIN to show all students including those without a department.


Use a RIGHT JOIN to show all departments including those without students.


Perform a FULL JOIN to get all records from both students and departments.


Create a cross-product of all students and courses using CROSS JOIN.


Use NATURAL JOIN between tables that have a shared column like department_id.

