--DDL-Data Definition Language
--used to define database structure
--Commands:Create, Alter, Drop, Truncate
--Example and Practice
create table students(
    id serial primary key,
    name varchar(50) not null,
    email varchar(50) unique,
    created_at timestamp default current_timestamp
);
drop table students;
alter table students
    add column age int;
alter table students
    rename column name to full_name;
drop table person1, person2, person4, person5;

truncate table products;

-- DML – Data Manipulation Language
-- Used to manipulate existing data.
-- Commands: INSERT, UPDATE, DELETE
--Example and Practice
---insert single row----
insert into students(full_name, age, email) values('azad', 25, 'azad@gmail.com');
---insert multiple row---
insert into students (full_name, age, email) values ('manha', 7, 'manha@gmail.com'),
                                                    ('marjan', 20, 'marjan@gmail.com'),
                                                    ('inaya', 1, 'inaya@gmail.com');
update students set age = 26 where id = 1;
delete from students where id = 1;

-- DCL – Data Control Language
-- Controls user permissions.
-- Commands: GRANT, REVOKE
--example and practice
grant select on students to user1;
revoke select on students from user1;

-- TCL – Transaction Control Language
-- Manages changes made by DML.
-- Commands: COMMIT, ROLLBACK, SAVEPOINT
--example and practice
commit;
rollback;
-- DQL – Data Query Language
-- Used to query and fetch data.
-- Command: SELECT
--example and practice
select * from students;

--Task: Create a table products, insert 2 rows, update one, delete the other, and select.
create table products(
    id int,
    p_name varchar(50),
    p_qty int);
insert into products values (1, 'pen', 2), (2, 'book', 3);
update products set p_qty = 5 where id = 1;
delete from products where id = 2;
select * from products;

create table items(
    id serial,
    p_name varchar(50),
    p_qty int);
insert into items(p_name, p_qty) values ('mouse', 7), ('laptop', 10);

--Column Aliasing
select full_name as st_name from students;

--Result Ordering
select * from students order by full_name asc;
--Multiple column sorting:
select *
from students
order by id asc, age desc;

--Sorting by position according to column position:
select id, full_name from students order by 1;

create table employees1(
    emp_id SERIAL primary key,
    name varchar(50),
    salary int,
    department varchar(20),
    hire_date date 
);

insert into employees1 (name, salary, department, hire_date)
VALUES
    ('azad', 1000000, 'IT', '2025-05-19'),
    ('rokan', 50000, 'store', '2017-05-19'),
    ('sufian', 40000, 'inventory', '2020-05-19'),
    ('akter', 20000, 'mechanical', '2021-05-19'),
    ('noman', 30000, 'electrical', '2023-05-19');
select * from employees1;
--Alias for a single column
select name as emp_name from employees1;
select salary * 12 as annual_salary from employees1;

--ORDER BY ascending
select name , salary from employees1 order by salary asc;

--order by descending
select name, salary from employees1 order by salary desc;

--ORDER BY alias
select salary*12 as annual_salary from employees1 order by annual_salary;

--multiple column sort
select name, department, salary from employees1 order by department asc, salary desc;

--Using position in ORDER BY
select name, salary from employees1 order by 1;

--Alias for long expression
select name  || ' work in ' || department as info from employees1;

--ORDER BY without alias
select name, salary from employees1 order by salary;

--Complex alias and sort
select name, salary * 1.2 as adjusted_salary from employees1 order by adjusted_salary;

--Task 1: Top 3 highest-paid employees
select name, salary from employees1 order by salary desc limit 3;

--Task 2: Display full names with custom alias
select name || ' ' || department as full_details from employees1;

--Task 3: Sorted annual salary report
select name, salary * 12 as annual_salary from employees1 order by annual_salary desc;

--Task 4: List employees with their departments, sorted alphabetically
select name as emp_name, department as emp_dept from employees1 order by department asc;

--Task 5: Calculate and show yearly salary, sorted by highest
select name, salary * 12 as yearly_salary from employees1 order by yearly_salary desc;

--Task 6: Create a full detail string and sort by name
select name || ' ' || department as full_details from employees1 order by name asc;

create table students (
    student_id SERIAL primary key,
    first_name varchar(50) not null unique,
    last_name varchar(50) not null,
    age int,
    grade char(2),
    course varchar(50),
    email varchar(100),
    dob date,
    blood_group varchar(5),
    country varchar(50)
);

insert into students (first_name, last_name, age, grade, course, email, dob, blood_group, country) 
VALUES
    ('John', 'Doe', 20, 'A', 'Math', 'john.doe@example.com', '2004-01-15', 'O+', 'USA'),
    ('Jane', 'Smith', 21, 'B', 'History', 'jane.smith@example.com', '2003-05-20', 'A-', 'Canada'),
    ('Alice', 'Johnson', 19, 'A', 'Physics', 'alice.johnson@example.com', '2002-11-08', 'B+', 'UK'),
    ('Bob', 'Williams', 22, 'C', 'Chemistry', 'bob.williams@example.com', '2001-07-03', 'AB-', 'Australia'),
    ('Charlie', 'Brown', 20, 'B', 'English', NULL, '2004-03-30', 'A+', 'New Zealand'),
    ('Emman', 'Jones', 23, 'B', 'Biology', 'emma.jones@example.com', '2000-09-12', 'A-', 'USA'),
    ('Michael', 'Johnson', 22, 'C', 'Physics', 'michael.johnson@example.com', '2002-04-05', 'O-', 'Canada'),
    ('Olivia', 'Davis', 21, 'A', 'Math', 'olivia.davis@example.com', '2003-12-18', 'B-', 'UK'),
    ('William', 'Taylor', 20, 'B', 'Chemistry', NULL, '2004-08-30', 'A+', 'Australia'),
    ('Sophia', 'Brown', 24, 'A', 'English', 'sophia.brown@example.com', '1999-06-25', 'AB+', 'New Zealand'),
    ('Liam', 'Miller', 19, 'C', 'History', 'liam.miller@example.com', '2002-02-10', 'A-', 'USA'),
    ('Ava', 'Anderson', 22, 'B', 'Biology', 'ava.anderson@example.com', '2000-11-15', 'B+', 'Canada'),
    ('Noah', 'Martinez', 21, 'A', 'Physics', NULL, '2001-04-28', 'O+', 'UK'),
    ('Isabella', 'Clark', 20, 'C', 'Chemistry', 'isabella.clark@example.com', '2003-10-03', 'A-', 'Australia'),
    ('Ethan', 'Garcia', 23, 'B', 'Math', 'ethan.garcia@example.com', '2000-07-22', 'B-', 'New Zealand'),
    ('Sophie', 'Moore', 22, 'A', 'English', 'sophie.moore@example.com', '2002-12-05', 'A+', 'USA'),
    ('Mia', 'Hernandez', 20, 'C', 'History', 'mia.hernandez@example.com', '2004-05-18', 'AB-', 'Canada'),
    ('James', 'Young', 21, 'B', 'Biology', 'james.young@example.com', '2003-02-08', 'O-', 'UK'),
    ('Emma', 'Gonzalez', 24, 'A', 'Physics', NULL, '1999-09-30', 'B+', 'Australia'),
    ('Miam', 'Wright', 19, 'C', 'Math', 'liam.wright@example.com', '2002-06-14', 'A+', 'New Zealand');
select * from students;

---data filtering---

-- Select students from the USA
select * from students where country = 'USA';

-- Select students with 'A' grade in Physics
select * from students where grade = 'A' and Course = 'Physics';

-- Select students with a specific blood group ('A+')
select * from students where blood_group = 'A+';

-- Select students from the USA or from Australia
select * from students where country = 'USA' or country = 'Australia';

-- Select students from the USA or from Australia and the age is 20
select * from students where country = 'USA' or country = 'Australia' and age = 20;

-- Select students with a grade of 'A' or 'B' in Math or Physics:
select * from students where (grade = 'A' or grade = 'B') and (course = 'Math' or course = 'Physics');

-- Select students older than 20
select * from students where age<20;

---Scalar functions---

--  UPPER() Converts a string to uppercase.
select student_id, upper(first_name) as "UpperCase_Name", * from students;

--  LOWER() Converts a string to lowercase.
select student_id, lower(last_name) as "LowerCase_Name", * from students;

--  CONCAT() Concatenates two or more strings.
select student_id, concat(first_name, ' ' , last_name) as "Full_Name", * from students;

--  LENGTH() Returns the number of characters in a string.
select first_name, length(first_name), * from students where student_id =3;

---Aggregate functions---

--  AVG() Calculate the average of a set of values.
select avg(age) as "Average_Age" from students;

--  MAX() Returns the max value in a set.
select max(age) as "Maximum_Age" from students;

--  MIN() Returns the minimum value in a set.
select min(age) as "Minimum_Age" from students;

--  SUM Calculates the sum of values in a set.
select sum(age) as "Total_Age" from students;

--  COUNT() Counts the number of rows in a set.
select count(student_id) as "Total_Student" from students;

select max(length(first_name)) as "Maximum_FirstName_Length" from students;

--Using NOT
select * from students where not (course = 'English');

--Basic NULL Check
select * from students where email is null;

select * from students where email is not null;
select * from students where not (email is null);

--COALESCE with one fallback
select first_name, coalesce(email, 'no email') from students;

--NOT with NULL means "Yes or have exist value"
select * from students where not (email is null);
select * from students where email is not null; --the both are give us same output

--Chain COALESCE values
select student_id, first_name, coalesce (email, 'no info' ) from students;

--Negation with numeric
select * from students where not (age<21)

--IN:
--Used to filter rows that match any value from a list.
select * from students where first_name in ('Bob', 'Jane');

--BETWEEN:
--Filters rows between two values (inclusive).
select * from students where dob between '2002-01-01' and '2005-01-01';

/*LIKE:
Matches patterns with wildcards:
%: Zero or more characters
_: Exactly one character
*/
select * from students where last_name like '%n';

select * from students where last_name like '_o_';

--ILIKE:
--Same as LIKE but case-insensitive.

select * from students where first_name ilike '%a';

--Limit and offset(starting data hide)
select * from students limit 5 offset 2;
select * from students limit 5 offset 5*0; --first 5 row show
select * from students limit 5 offset 5*1; --second 5 row show

--between and limit
select * from students where country in ('Canada', 'USA', 'Australia') limit 5;

select * from students;

--update
update students set email = 'eva@gmail.com' where student_id = 6;

drop table students;