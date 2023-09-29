CREATE DATABASE UserManager;
USE UserManager;

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    country VARCHAR(120)
);
INSERT INTO  users(`name`, email, country) 
VALUES('Minh','minh@codegym.vn','Viet Nam'),
('Kante','kante@che.uk','Kenia');
