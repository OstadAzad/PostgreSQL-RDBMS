-- Active: 1747489205729@@127.0.0.1@5432@ph
--returns today's date.
select current_date as today_date;

--Example 1: Get current date and time
select now() as current_time;

--Example 2: Extract year from a date
select extract(year from date '2025-05-21');
--or
select extract(year from now()) as year_extract;
--or
select extract(month from now()) as month_extract;


--Example 3: Add 7 days to a date
select (current_date + interval'7 days') as new_date;
--or
select now()+interval '7 days' as new_date;

--Example 4: Calculate age from birthdate
select age(date'1990-03-05') as new_age;--year, month, date shows
--or
select age('1990-03-05'::date) as total_age; --year, month, date shows
--or
select age(now(), '1990-03-05') as age_count;--year, month, day with min, sec, milisec shows
--or
select age('1990-03-05', now()) as age_calculate;--year, month, day with min, sec, milisec shows

--Example 5: Truncate date to the month
select date_trunc('month', timestamp '2025-05-21 13:45:00');

--Example 6: Formatting Dates
select to_char(now(), 'dd-mm-yyyy') as new_formate;
