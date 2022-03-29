create database stores;

create table stores.customers (
	id int auto_increment,
	`name` varchar (50),
	age int,
	address varchar (100),
	salary decimal (20,2),
	primary key (id)
);

insert into stores.customers (age, address, salary) value (18, "94 lê quang đạo", 22000.00);
insert into stores.customers (age, address, salary) value (19, "20 lê quang đạo", 12000.00);
insert into stores.customers (age, address, salary) value (30, "12 lê quang đạo", 33000.00);
insert into stores.customers (age, address, salary) value (24, "03 lê quang đạo", 53000.00);
insert into stores.customers (age, address, salary) value (27, "45 lê quang đạo", 6000.00);

create table stores.orders (
	o_id int not null,
	`date` date not null,
	customer_id int not null,
	amount int,
	primary key (o_id) 
 );
 
 insert into stores.orders (o_id, `date`, customer_id, amount) value (102, "2009-10-08", 3, 10);
 insert into stores.orders (o_id, `date`, customer_id, amount) value (100, "2009-10-08", 4, 20);
 insert into stores.orders (o_id, `date`, customer_id, amount) value (104, "2009-10-08", 1, 30);
 
 select c.id, c.`name`, o.amount, o.date 
 from customers c inner join orders o on c.id = o.customer_id;
 
 
 
 
 