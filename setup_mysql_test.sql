-- a script that prepares a MySQL server for the project
-- Create or use the database if it already exists
CREATE DATABASE IF NOT EXISTS hbnb_test_db;
-- Create or use the user if it already exists
CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';
-- Grant all privileges on hbnb_dev_db to hbnb_dev
GRANT ALL PRIVILEGES ON hbnb_test_db.* TO 'hbnb_test'@'localhost';
-- Grant SELECT privilege on performance_schema to hbnb_dev
GRANT SELECT ON performance_schema.* TO 'hbnb_test'@'localhost';
-- Reload privileges to apply changes
FLUSH PRIVILEGES;
