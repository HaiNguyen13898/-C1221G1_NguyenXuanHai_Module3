
-- bước 3
create unique index code_products on products (product_code); 
create index index_product on products (product_code, product_name);
explain select * from products where product_name = 'Cá'; 
select * from products where product_name = 'Cá';

-- bước 4
create view products_views as
select product_code, product_name, product_price, product_status
from  products;
select * from products_views;

set sql_safe_updates = 0;
update products_views set product_price = 1000 where product_name = 'Sữa';
set sql_safe_updates = 1;

select * from products;
select * from products_views;

set sql_safe_updates = 0;
delete from products_views where product_name = 'Cá';
set sql_safe_updates = 1;

select * from products_views;
select * from products;

-- bước 5

DELIMITER //
CREATE PROCEDURE finAllProducts()
BEGIN
  SELECT * FROM products;
END //
DELIMITER ;

call finAllProducts();


-- xoá
DELIMITER //
Create Procedure delete_products ( in p_id int)
BEGIN
DELETE FROM products
WHERE id=p_id;
END //
DELIMITER ; 
call delete_products (2);

-- thêm
 DELIMITER // 
 Create PROCEDURE insert_products( in p_code int, in p_name Varchar(20), in p_price double)
BEGIN
insert into products( product_code, product_name, product_price) values (p_code, p_name,p_price);
END //
DELIMITER ; 

call insert_products (123, "Chó", 34000);

drop procedure insert_products ;

-- không có lệnh sửa, sửa thì dùng drop procedure rồi tạo lại cái mới.

