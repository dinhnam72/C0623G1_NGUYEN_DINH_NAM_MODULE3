CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;
CREATE TABLE customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(75) NOT NULL,
    customer_age INT CHECK(customer_age>0)
);
CREATE TABLE order_product(
	order_product_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_product_date DATE ,
    order_product_total_price INT,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(75) NOT NULL ,
    product_price INT NOT NULL
);
CREATE TABLE order_detail(
	order_product_id INT,
    product_id INT,
    PRIMARY KEY(order_product_id,product_id),
    order_detail_qty INT CHECK ( order_detail_qty>0),
    FOREIGN KEY(order_product_id) REFERENCES order_product(order_product_id),
    FOREIGN KEY(product_id) REFERENCES product(product_id)
);
INSERT INTO customer (customer_name,customer_age)
VALUES ('Minh Quan',10),
		('Ngoc Oanh',20),
		('Hong Ha',30);
INSERT INTO order_product ( customer_id ,order_product_date ,order_product_total_price)
VALUES (1,'2006-03-21',NULL),
		(2,'2006-03-23',NULL),
		(1,'2006-03-16',NULL);
INSERT INTO product ( product_name,product_price)
VALUES ('May Giat',3),
		('Tu Lanh',5),
		('Dieu Hoa',7),
		('Quat',1),
		('Bep Dien',2);
INSERT INTO order_detail(order_product_id, product_id, order_detail_qty)
VALUES (1,1,3),
		(1,3,7),
		(1,4,2),
		(2,1,1),
		(3,1,8),
		(2,5,4),
		(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
  SELECT order_product_id, customer_id, order_product_total_price
  FROM order_product;
  
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
  SELECT customer_name, product_name
  FROM customer
  JOIN order_product
  ON customer.customer_id = order_product.customer_id
  JOIN order_detail
  ON order_product.order_product_id= order_detail.order_product_id
  JOIN product
  ON order_detail.product_id = product.product_id;
  
  -- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
   SELECT *
  FROM customer
  LEFT JOIN order_product
  ON customer.customer_id = order_product.customer_id
  WHERE order_product.customer_id IS NULL;
  
  -- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
  -- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
  SELECT order_product.order_product_id,order_product.order_product_date,sum(product.product_price*order_detail.order_detail_qty) AS total_price
  FROM order_product
  JOIN order_detail
  ON order_product.order_product_id= order_detail.order_product_id
  JOIN product
  ON order_detail.product_id = product.product_id
  group by order_product.order_product_id;
  