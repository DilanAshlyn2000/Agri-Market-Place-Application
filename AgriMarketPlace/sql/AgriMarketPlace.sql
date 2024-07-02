CREATE DATABASE Farm_MarketPlace;
SHOW DATABASES;
USE Farm_MarketPlace;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(25) NOT NULL,
    phone VARCHAR(10)NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(500) NOT NULL,
    password VARCHAR(30) NOT NULL,
    status boolean default false;
);
SELECT * FROM users;
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    category_image LONGBLOB
);
SELECT * FROM categories;