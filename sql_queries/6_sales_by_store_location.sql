-- 5. Analyze the sales by store location
SELECT * FROM coffee_shop_sales;

SELECT 
	MONTH(transaction_date) AS month_number,
    MONTHNAME(transaction_date) AS month,
    store_location,
    ROUND(SUM(unit_price * transaction_qty), 2) AS Total_Sales
FROM
    coffee_shop_sales
GROUP BY MONTH(transaction_date) , store_location
ORDER BY month_number, Total_Sales DESC
