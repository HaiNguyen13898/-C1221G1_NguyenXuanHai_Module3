create  database ss5_bai_tap_products;
use ss5_bai_tap_products;

create table products (
id int auto_increment not null,
product_code int not null,
product_name varchar (255) not null,
product_price double not null,
product_amount int ,
product_description varchar (255),
product_status bit,
primary key (id)
);

insert into products (product_code, product_name, product_price, product_amount, product_description, product_status)
values (1231, "Sữa", 23000, 3, "sản phẩm dạng nước ngon", 0),(3123, "Gà", 140000, 1, "Gà có lông", 1),
(5454, "Cá", 76000, 2, "sản phẩm bơi được", 1),(3235, "Bò", 87000, 1, "Thịt ngon", 1),
(7676, "Chim", 3000, 5, "sản phẩm bay được", 0);