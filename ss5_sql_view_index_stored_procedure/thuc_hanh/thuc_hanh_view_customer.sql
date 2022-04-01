
-- tạo view cho customer
CREATE VIEW customer_views AS
SELECT customerNumber, customerName, phone
FROM  customers;
select * from customer_views;


-- cập nhật view cho customer
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers WHERE city = 'Nantes';
select * from customer_views;

-- xoá view 
DROP VIEW customer_views;







