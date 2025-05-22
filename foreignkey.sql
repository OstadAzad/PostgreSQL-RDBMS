-- Active: 1747489205729@@127.0.0.1@5432@ph

--create a customers table
create table customers(
    cus_id serial primary key,
    cus_name varchar(100),
    cus_address varchar(100),
    cus_phone_no char(50) unique
);

--delete whole table
drop table customers;

--insert customer data
insert into customers(cus_name, cus_address, cus_phone_no) VALUES
    ('rakib', 'ctg', '017000000000'),
    ('mizan', 'dhaka', '01800000000'),
    ('piyal', 'barisal', '01900000000'),
    ('akash', 'shylet', '01600000000'),
    ('turza', 'khulna', '01300000000')

--create another product table for using foreign key
create table products(
    pro_id serial primary key,
    pro_name varchar(100),
    pro_qty int,
    price int,
    order_qty int ,
    -- cus_id serial,
    -- foreign key (cus_id) references customers(cus_id)--or
    -- customer_id serial references customers(cus_id) on delete cascade
    -- customer_id serial references customers(cus_id) on delete set null
       customer_id serial references customers(cus_id)
);

--insert data for testing
insert into products(pro_name, pro_qty, price, order_qty)
values('book', 5, 500, 2),
        ('pen', 3, 15, 1),
        ('eraser', 10, 100, 3),
        ('sharpner', 2, 20, 5),
        ('pencil', 10, 50, 4)

--delete the table
drop table products;

--select all data
select * from customers;
select * from products;

--testing the result
select * from customers where cus_id = 4;
select * from products where pro_id = 3;

--'on delete cascade' function in postgreSQL
delete from customers
    where cus_id = 2;

--'on delete set null' function in postgreSQL
delete from products
    where pro_id = 4;



