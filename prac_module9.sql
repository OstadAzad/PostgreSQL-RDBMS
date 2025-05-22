-- Active: 1747489205729@@127.0.0.1@5432@ph
create table students(
    id serial primary key,
    name varchar(50),
    last_login date,
    department_id int,
    foreign key(department_id) references departments(id) on delete set null
);
drop table students;
insert into students(name, last_login, department_id)VALUES
    ('sahid', '2020-01-05', 1),
    ('azad', '2025-05-20', 2),
    ('younus', '2024-05-21', 3);

create table departments(
    id serial primary key,
    name varchar(50)
);
drop table departments;
insert into departments(name)VALUES
    ('Electrical'), ('CSE'), ('Math');

create table courses(
    id serial primary key,
    title text
);
drop table courses;
insert into courses(title)values
    ('mechanical, ccm, asu power'),
    ('HTML, ReactJS, NextJS, PostgreSQL'),
    ('Logic Apply');

select * from students;
select * from departments;
select * from courses;

--Date & Grouping Tasks
select * from students;
--task1:Retrieve students who have logged in within the last 30 days.
select * from students where last_login >= (current_date-interval'30 days');

--task2:Extract the login month from the last_login and group students by month.
select extract(month from last_login) as login_month, count(*) as total_login from students
group by extract(month from last_login);

--task3:Count how many students logged in per month and show only those months where login count is more than 3.
select extract(month from last_login) as login_month, count(*) as total_login from students
group by extract(month from last_login)
having count(*)>3;


--Foreign Key & Constraints

--task4: Create a foreign key constraint on department_id in the students table referencing departments(id).
alter table students
    add constraint fk_department 
    foreign key (department_id) 
    references departments(id);

--task5:Try inserting a student with a department_id that doesn’t exist and observe the behavior.
insert into students (name, last_login, department_id)VALUES
    ('siraj', '2023-09-12', 4);
--result/observation:This will fail with a foreign key constraint violation error because department_id = 999 does not exist in departments.

--task6: Delete a department and see how students are affected using ON DELETE CASCADE and ON DELETE SET NULL.

--the below code have not work In-sha-Allah I solve this another way. But I will solve this another time.
/*alter table students
    drop constraint fk_department;

alter table students
    drop constraint students_department_id_fkey;

alter table students
    add constraint fk_department
    foreign key (department_id) 
    references department(id)
    on delete cascade;
*/

delete from departments where id = 3;

--Join Operations
--task7: Join students and departments using INNER JOIN to display each student's department name.
select students.name as stu_name, departments.name as dept_name from students
inner join departments on students.id = departments.id;

--task8:Use a LEFT JOIN to show all students including those without a department.
select students.name as s_name, departments.name as d_name from students
left join departments on students.id = departments.id;

--task9: Use a RIGHT JOIN to show all departments including those without students.
select students.name as s_name, departments.name as d_name from students
right join departments on students.id = departments.id;

--task10: Perform a FULL JOIN to get all records from both students and departments.
select students.name as s_name, departments.name as d_name from students
full outer join departments on students.id = departments.id;

--task11: Create a cross-product of all students and courses using CROSS JOIN
select students.name as s_name, departments.name as d_name from students
cross join departments;

--task12: Use NATURAL JOIN between tables that have a shared column like department_id.
select * from students
natural join departments;
