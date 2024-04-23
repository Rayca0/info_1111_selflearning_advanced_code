-- Declare and set a session variable
SET @myVar := 10;

-- Use the session variable
SELECT @myVar;

-- Update the session variable. (now myVar is 11)
SET @myVar := @myVar + 1;

-- Set a system variable dynamically
SET GLOBAL max_connections = 100;