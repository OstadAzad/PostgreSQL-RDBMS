--Practice Tasks: Module-8
create table students(
    id SERIAL primary key,
    roll int unique,
    name varchar(50),
    age int,
    department varchar(50),
    score int,
    status varchar(50),
    last_login date
);

--table alteration tasks
--task1: add a column of email
alter table students
    add column email varchar(50);

--task2: rename the column of email
alter table students
    rename column email to student_email;

--task3: add unique constraint
alter table students
add constraint uk_stu_email unique(student_email);

--task4: add primary key
create table courses(
    id serial primary key,
    course_name varchar(100),
    mentor varchar(100) unique,
    status varchar(100)
);
drop table courses;
--task5: drop a column
alter table courses
    drop column status;

--Filtering & Logical Operations
insert into students (roll, name, age, department, score, status, last_login)
VALUES
    (10, 'Azad', 20, 'IT', 100, 'Passed', '2025-05-20'),
    (20, 'Yunus', 21, 'Math', 80, 'Passed', '2024-04-19'),
    (30, 'Faisal', 22, 'Chemistry', 25, 'Failed', '2025-02-25'),
    (40, 'Raju', 20, 'Physics', 29, 'Failed', '2025-03-22'),
    (50, 'Munna', 25, 'Electrical', 82, 'Passed', '2020-04-29'),
    (60, 'Asif', 30, 'Mechanicall', 50, 'Passed', '2021-09-09'),
    (70, 'Saibal', 35, 'Electrical', 75, 'Passed', '2010-01-30'),
    (80, 'Nisan', 23, 'Mechanical', 39, 'Passed', '2011-05-20'),
    (90, 'Rakib', 22, 'IT', 22, 'Failed', '2018-05-20'),
    (100, 'Zien', 25, 'Math', 34, 'Failed', '2020-05-20');
--task6: greater than 80 and not null
select * from students where score > 80 and score is not null;

--task7: not operator
select * from students where not department = 'IT';

--task8: filtering 'A' using like and Ilike
--Case-Sensitive
select * from students where name like 'A%';
--Case-insensitive
select * from students where name ilike 'a%';

--task9:between operator use
select * from students where age between 18 and 25;

--task10: In operator
select * from students where roll in (10, 20, 30);

--Aggregate Functions
--task11: count operator
select count(*) as total_students from students;
--or
select count(id) as all_student from students;

--task12: average operator
select avg(score) as average_score from students where department = 'IT';

--task13: maximum and minimum operator
select max(age) as miximum_age from students;
select min(age) as minimum_age from students;
--or
select max(age) as oldest, min(age) as youngest from students;

--update and delete operations
--task14: Update Operator
update students set status = 'failed' where score<50;

--task15: Delete operator
delete from students where last_login < current_date-interval'1 year';
truncate table students;
select * from students;
--or
delete from students where last_login <'2024-01-01';

--task16: use 'limit' and 'offset'
--select * from students order by id limit 5 offset 5*0; --first page
select * from students order by id limit 5 offset 5*1; --second page 

drop table students;






