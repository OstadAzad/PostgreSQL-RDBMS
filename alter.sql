
--'add' a column in a table
alter table person3
    add column city varchar(50);

--'drop' a column in a table
alter table person3
    drop city;

--'column type change' in a table
alter table person3
    alter column user_name type varchar(50);

--'rename column' in a table
alter table person3 
    rename column user_name to name;

--'set a default value' in a column
alter table person3
    alter column age set default 18;

alter table person3
    add column full_name VARCHAR(50) default 'unknown';

alter table person3
    rename column full_name to complete_name;

alter table person3
    alter column id type BIGINT;

select * from person3;

alter table person3
    add column status text default 'active';

alter table person3
    add column created_at timestamp default current_timestamp;

alter TABLE person3 
    rename to userprofile;

alter table userprofile
    rename to person3;

alter table person3
    drop column created_at;

--'insert row or data' the mention table 
insert into person3 values (4, 'inaya', 7);


--'table' all column and row to see
select * from person3;

--'drop data type' from a column

alter table person3
    alter column age set default '0';

--'add primary key' in a column
alter table person3
    add constraint pk_id primary key (id);

--'delete primary key' in a column
alter table person3
    drop constraint pk_id;

--'add unique key' in a column
alter table person3
    add constraint uk_age unique (age);

--'delete unique key' from a column
alter table person3
    drop constraint uk_age;

--'rename constraint'
alter table person3
    rename constraint uk_age to uk_person3_age;

alter table person3
    rename constraint uk_person3_age to uk_age;

--add unique constraint to multiple column(name, age)
alter table person3
    add constraint uk_name_age unique (name, age);

--delete unique constraint to multiple column(name, age)
alter table person3
    drop constraint uk_name_age;

--check existing constraints
select * from information_schema.table_constraints where table_name = 'person3';

--create table with primary key
create table person1
    (id serial primary KEY,
    name text,
    email varchar(50) unique);

-- Project 1: Employee Records Management
-- Create employees table.
-- Add employee_id as primary key.
-- Add unique email.
create table employees (
    employee_id SERIAL primary key,
    email VARCHAR(50) unique
);

-- Project 2: Course Enrollment
-- Table: course_enrollments
-- Composite primary key: student_id + course_id
-- Add unique constraint for email notifications.
create table course_enrollments(
    student_id SERIAL not null,
    course_id SERIAL not null,
    email_notification varchar(50),

    primary key (student_id, course_id),
    constraint uk_email_notification unique (email_notification)
    );

-- Project 3: User Registration System
-- Table: users
-- Primary key: user_id
-- Unique keys: username, email
create table users(
    user_id SERIAL primary key,
    username VARCHAR(50) unique,
    email varchar(50) unique
);

--'truncate' a table===truncate means table exits but it's data delete or haven't.
truncate table person2;

