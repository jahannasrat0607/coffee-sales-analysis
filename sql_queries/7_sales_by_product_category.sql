-- 6. Calculate sales by product category

SELECT 
	MONTH(transaction_date) AS month_number,
	MONTHNAME(transaction_date) as month,
	product_category,
	ROUND(SUM(unit_price * transaction_qty),2) as Total_Sales
FROM coffee_shop_sales
GROUP BY product_category, MONTH(transaction_date)
ORDER BY month_number, SUM(unit_price * transaction_qty) DESC
