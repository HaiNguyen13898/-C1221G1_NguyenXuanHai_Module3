use  ss2_bai_tap_quan_ly_ban_hang;

insert into customer (c_name, c_age) values ("Minh Quan", 10), ("Ngoc Oanh", 20), ("Hong Ha", 50);

insert into `order` (c_id, o_date) values (1, "2006-03-21"), (2, "2006-03-23"), (1, "2006-03-16");

insert into product (p_name, p_price) values ("May giat", 3), ("Tu Lanh", 5), 
("Dieu Hoa", 7), ("Quat", 1), ("Bep Dien", 2);

insert into order_detail (o_id, p_id, od_qty) values (1, 1, 3), (1, 3, 7), (1, 4, 2), (2, 1, 1), 
(3, 1, 8), (2, 5, 4), (2, 3, 3);

select o.o_id, o.o_date, o.o_total_price from `order` o;

select c_name, p_name from 






