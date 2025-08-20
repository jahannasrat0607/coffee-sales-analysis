# CREATE DATABASE coffee_shop_sales_db;
#SELECT * FROM coffee_shop_sales; 
# check the data types of each column
# DESCRIBE coffee_shop_sales

# Data cleaning
SELECT * FROM coffee_shop_sales;
UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%d-%m-%Y');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;

DESCRIBE coffee_shop_sales;

SELECT * FROM coffee_shop_sales;
UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;

DESCRIBE coffee_shop_sales;

-- modify column name
ALTER TABLE coffee_shop_sales
CHANGE COLUMN ï»¿transaction_id transaction_id INT;

DESCRIBE coffee_shop_sales;