create database ss2_bai_tap_quan_ly_ban_hang;

use  ss2_bai_tap_quan_ly_ban_hang;

create table customer (
c_id int auto_increment not null,
c_name varchar (100),
c_age int ,
primary key (c_id)
); 

create table `order` (
o_id int auto_increment not null,
c_id int,
o_date date,
o_total_price double,
primary key (o_id),
foreign key (c_id) references customer (c_id)
);

create table product (
p_id int auto_increment not null,
p_name varchar (100),
p_price double,
primary key (p_id)
);

create table order_detail (
o_id int,
p_id int,
od_qty varchar (255),
primary key (o_id, p_id),
foreign key (o_id) references `order` (o_id),
foreign key (p_id) references product (p_id)
);




