-- Active: 1747489205729@@127.0.0.1@5432@ph
--Note: serial-140
--creating a table of rangers(who are visit/observe the forest rare/endenger animals)
create table rangers(
    ranger_id serial primary key,
    ranger_name varchar(50),
    region varchar(50)
);
--creating a table of species(forest rare/endenger animals description)
create table species(
    species_id serial primary key,
    common_name varchar(50),
    Scientific_name varchar(50),
    discovery_date date,
    conservation_status varchar(20)
);
--creating a table of sightings(one kind of forest animal visit report)
create table sightings(
    sighting_id serial primary key,
    species_id int references species(species_id) on delete cascade,
    ranger_id int references rangers(ranger_id) on delete cascade,
    location varchar(100),
    sighting_time TIMESTAMP,
    notes text
);
--inserting data into sightings
insert into sightings(species_id, ranger_id, location, sighting_time, notes)VALUES
    (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
    (2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
    (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
    (1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', null);
--inserting data into species
insert into species(common_name, scientific_name, discovery_date, conservation_status)VALUES
    ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
    ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
    ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
    ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
--inserting data into rangers
insert into rangers(ranger_name, region)VALUES
    ('Alice Green', 'Northern Hills'),
    ('Bob White', 'River Delta'),
    ('Carol King', 'Mountain Range');

--Problem#1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
insert into rangers(ranger_name, region)VALUES
    ('Derek Fox', 'Coastal Plains'); --output shows me: AffectedRows: 1

--problem#2️⃣ Count unique species ever sighted.
-- select * from sightings;
-- select count(*) from sightings;
select count(distinct species_id) as unique_species_count from sightings;--it means that unique species total quantity;

--problem#3️⃣ Find all sightings where the location includes "Pass".
select * from sightings where location ilike '%Pass%'; --in here, using i like because it is not case-sensitive.

--problem#4️⃣ List each ranger's name and their total number of sightings.
select ranger_name, count(sighting_id) as Total_sightings 
from rangers
left join sightings using(ranger_id) --we can 'using' keyword joing jobs because insite the using data is similar for both table
group by ranger_name
order by ranger_name; --we see extra row in here but our assignment output have not given it because it is newly added by "inserting" by me.
--or
select ranger_name, count(sighting_id) as total_sightings 
from rangers 
left join sightings 
on rangers.ranger_id=sightings.ranger_id 
group by ranger_name
order by ranger_name;

--problem#5️⃣ List species that have never been sighted.
--select * from species;
select common_name from species 
left join sightings using(species_id) 
where sighting_id is null;
--or
select common_name from species
left join sightings on species.species_id=sightings.species_id
where sighting_id is null;

--problem#6️ Show the most recent 2 sightings.
select common_name, sighting_time, ranger_name from sightings
join species using(species_id)
join rangers using(ranger_id)
order by sighting_time DESC
limit 2;
--or
select common_name, sighting_time, ranger_name from sightings
join species on sightings.species_id=species.species_id
join rangers on sightings.ranger_id=rangers.ranger_id
order by sighting_time desc
limit 2;

--problem#7️⃣ Update all species discovered before year 1800 to have status 'Historic'.
--select * from species;
update species set conservation_status = 'Historic'
where extract(year from discovery_date)<1800; --output shows me: Affectedrows:3 Three rows affected according to the date(1800);
--or
update species set conservation_status = 'Historic'
where discovery_date < '1800-01-01';--output shows me: Affectedrows:3 Three rows affected according to the date(1800);


--problem#8️⃣ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
--Morning: before 12 PM
--Afternoon: 12 PM–5 PM
--Evening: after 5 PM
select sighting_id,
    case
    when extract(hour from sighting_time) < 12 then 'Morning'
    when extract(hour from sighting_time) between 12 and 17 then 'Afternoon'--17 means 5PM, it is international time.
    else 'Evening'
    end
    as time_of_day from sightings;
--or
create view sighting_times --we can use 'view' functions for easially we can call it anywhere. Do not need multiple block.
    as
    select sighting_id,
    case 
    when extract(hour from sighting_time) < 12 then 'Morning'
    when extract(hour from sighting_time) between 12 and 17 then 'Afternoon' --17 means 5PM, it is international time.
    else 'Evening'
    end as time_of_day from sightings;
select * from sighting_times;
drop view sightings_times;

--or
select sighting_id,
    case 
        when to_char(sighting_time, 'AM') = 'AM'  then 'Morning'
        when extract(hour from sighting_time) between 12 and 17 then 'Afternoon'
        else 'Evening'
    end as time_of_day from sightings;

--problem#9️⃣ Delete rangers who have never sighted any species
--select distinct ranger_id from sightings;--inner query
delete from rangers--outer query
where ranger_id not in (select distinct ranger_id from sightings);--output show me: AffectedRow: 1



--===Note: for practice, easy accesibility and cenceprt clear purpose I use some of extra code and make them comment. Please consider it. Thanks a lot...

--select * from rangers;
--select * from species;
--select * from sightings;
-- drop table rangers;
-- drop table species;
-- drop table sightings;




