-- Active: 1747489205729@@127.0.0.1@5432@ph
select * from students;

---using 'group by'---
select country from students 
group by country;

--using 'group by' and "aggregate a function"---
select country, count(*) from students 
group by country;

--testing "USA" or country or result is ok or not
select * from students where country = 'USA';

--group by and group average----
select country, avg(age) from students 
group by country;

--using group by and having. Haing is like a condition.
select country as grp_county, avg(age) as group_age from students
group by country 
having avg(age)<21;

--group by, extract year and count---
select extract(year from dob) as birth_year, count(*) from students
group by birth_year;

--practice group by course and count
select course, count(*) from students
group by course;








