CREATE DATABASE demo_ss05 ;
USE demo_ss05 ;
CREATE TABLE products (
	id INT PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(10) NOT NULL,
    product_name VARCHAR(30) NOT NULL,
	product_price INT NOT NULL,
    product_amount INT DEFAULT 0,
    product_description VARCHAR (100),
    product_status VARCHAR (50)
);
INSERT INTO products ( product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES 
( 'p01','sting',10000,2,'nuoc tang luc','a'),
( 'p02','redbull',15000,1,'nuoc tang luc','b'),
( 'p03','tra sua',25000,4,'chat gay beo','sads');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX index_product_code
ON products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE UNIQUE INDEX index_product_name_product_price
ON products(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT *
FROM products
WHERE product_code ='p01';

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW view_products AS
SELECT product_code, product_name, product_price, product_status
FROM products;

-- Tiến hành sửa đổi view
UPDATE view_products 
SET  product_price = '12000'
WHERE product_code ='p01';

-- Tiến hành xoá view
DROP VIEW view_products;

​-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
CREATE PROCEDURE  find_by_product()
BEGIN
SELECT *
FROM products;
END //
delimiter ;
CALL find_by_product();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
CREATE PROCEDURE  add_product( 
	new_product_code VARCHAR(10) ,
    new_product_name VARCHAR(30) ,
	new_product_price INT,
    new_product_amount INT ,
    new_product_description VARCHAR (50),
    new_product_status VARCHAR (50))
BEGIN
INSERT INTO products ( product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES ( new_product_code, new_product_name, new_product_price, new_product_amount, new_product_description, new_product_status);
END //
delimiter ;
CALL add_product('p05','nuoc ca rot', 20000, 7,'tu nhien','asd');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
CREATE PROCEDURE  update_product( 
	check_id INT, 
	update_product_code VARCHAR(10) ,
    update_product_name VARCHAR(30) ,
	update_product_price INT,
    update_product_amount INT ,
    update_product_description VARCHAR (50),
    update_product_status VARCHAR (50))
BEGIN
UPDATE products
SET product_code = update_product_code,
	product_name = update_product_name,
    product_price = update_product_price,
    product_amount = update_product_amount,
    product_description = update_product_description,
    product_status = update_product_status
WHERE id = check_id ;
END //
delimiter ;
CALL update_product(2,'p02','nuoc dua', 20000, 5,'tu nhien','asd');

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
CREATE PROCEDURE  remove_product( check_id INT )
BEGIN
DELETE FROM products
WHERE id = check_id ;
END //
delimiter ;
CALL remove_product(4);

