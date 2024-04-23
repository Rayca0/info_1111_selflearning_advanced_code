-- Create a new MySQL database if not already created
CREATE DATABASE IF NOT EXISTS my_database;

-- Use the newly created database
USE my_database;

-- Create a table with various data types
CREATE TABLE example_table (
    -- Numeric data types
    int_column INT,                 -- Integer data type
    decimal_column DECIMAL(10, 2),  -- Decimal data type

    -- Date and Time data types
    date_column DATE,               -- Date data type
    datetime_column DATETIME,       -- Datetime data type

    -- String data types
    varchar_column VARCHAR(255),    -- Variable-length string data type
    text_column TEXT,               -- Long text data type

    -- JSON data type
    json_column JSON                -- JSON data type
);

-- Insert data into the table
INSERT INTO example_table (int_column, decimal_column, date_column, datetime_column, varchar_column, text_column, json_column) 
VALUES 
(123, 45.67, '2024-04-22', '2024-04-22 12:34:56', 'Example String', 'Here is a longer text', '{"key": "value", "nested": {"another_key": "another_value"}}');

-- Select all data from the table to verify insertion
SELECT * FROM example_table;