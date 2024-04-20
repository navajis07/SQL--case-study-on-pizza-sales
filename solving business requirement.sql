Create database pizzahut;
use pizzahut;

-- create table for big ammont of data

create table orders(
order_id int not null,
order_date date not null,
order_time time not null,
primary key(order_id)
);

create table orders_details(
order_details_id int not null,
order_id int not null,
pizza_id text not null,
quantity int not null,
primary key(order_details_id)
);

-- QUESTION/QUERY

-- 2. Calculate the total revenue generated from pizza sales.
SELECT round(sum(o.quantity * p.price),0) as total_revenue
from orders_details as o join pizzas as p
on o.pizza_id = p.pizza_id;

-- 3. Identify the highest-priced pizza.
select pt.name, p.price 
from pizza_types as pt join pizzas as p 
on pt.pizza_type_id = p.pizza_type_id
order by p.price desc limit 1;

-- 4. Identify the most common pizza size ordered.
select p.size, count(od.order_details_id) as order_count
from pizzas as p join orders_details as od
on p.pizza_id = od.pizza_id
group by p.size
order by order_count desc;
