-- Active: 1747489205729@@127.0.0.1@5432@ph
create table customers(
    cus_id serial primary key,
    cus_name varchar(100),
    country varchar(50)
);
drop table customers;
create table orders(
    order_id serial primary key,
    pro_name varchar(50),
    cus_id int,
    foreign key (cus_id) references customers(cus_id)
);
drop table orders;
insert into customers(cus_name, country) values
    ('arif', 'Bangladesh'),
    ('shaon', 'Malaysia'),
    ('Sajib', 'USA'),
    ('istiak', 'Canada'),
    ('azad', 'Swizerland');
insert into orders(cus_id, pro_name)VALUES
    (1, 'pen'),
    (2, 'book'),
    (3, 'eraser'),
    (4, 'ruller'),
    (5, 'pencil');

--table show
select * from customers;
select * from orders;

--join two table collect data
select cus_name, pro_name from orders
join customers on orders.order_id = customers.cus_id;

--or
select cus_name,pro_name from customers
join orders on customers.cus_id = orders.order_id;

--or
select * from orders
join customers on orders.order_id = customers.cus_id;

--or
select cus_name from orders
join customers on orders.order_id = customers.cus_id;
--or
select cus_name, pro_name from orders as o
join customers as c on o.order_id = c.cus_id;

insert into customers(cus_name, country)VALUES
    ('raju', null),
    (null, 'Singapur');
insert into orders(cus_id, pro_name)VALUES
    (6, null),
    (null, 'mobile');

--table show
select * from customers;
select * from orders;

--left join
select cus_name, pro_name from customers
left join orders on customers.cus_id = orders.order_id;

--Right join
select cus_name, pro_name from customers
right join orders on customers.cus_id = orders.order_id;

--full outer join
select cus_name, pro_name from customers
full outer join orders on customers.cus_id = orders.order_id;

--cross join
select cus_name, pro_name from customers
cross join orders;

--Natural Join
select * from customers
natural join orders;

drop table orders;
drop table customers;
