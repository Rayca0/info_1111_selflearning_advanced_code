-- Create a new database
CREATE DATABASE my_database;

-- Switch to the newly created database
USE my_database;

-- Create a new table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2)
);