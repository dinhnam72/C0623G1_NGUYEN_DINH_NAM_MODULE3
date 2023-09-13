CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;
CREATE TABLE customer(
	c_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(75) NOT NULL,
    c_age INT DEFAULT 4
);
CREATE TABLE order_product(
	o_id INT PRIMARY KEY AUTO_INCREMENT,
    c_id INT NOT NULL,
    o_date DATE NOT NULL,
    o_total_price INT DEFAULT 0,
    FOREIGN KEY(c_id) REFERENCES customer(c_id)
);
CREATE TABLE product(
	p_id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(75) NOT NULL,
    p_price INT DEFAULT 1
);
CREATE TABLE order_detail(
	o_id INT,
    p_id INT,
    PRIMARY KEY(o_id,p_id),
    od_qty INT DEFAULT 0,
    FOREIGN KEY(o_id) REFERENCES order_product(o_id),
    FOREIGN KEY(p_id) REFERENCES product(p_id)
);
