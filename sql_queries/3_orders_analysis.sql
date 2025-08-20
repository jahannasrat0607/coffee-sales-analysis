-- 2. Total Orders Analysis
-- 2(a)Calculate total orders for each respective month

SELECT MONTHNAME(transaction_date) AS month , COUNT(transaction_qty) AS Total_Orders
FROM coffee_shop_sales
GROUP BY MONTH(transaction_date);

-- 2(b) Determine month-on-month increase or decrease in number of orders
-- 2(c) Calculate the difference in the number of orders between the selected month and previous month

SELECT 
    MONTH(transaction_date) AS month,
    ROUND(COUNT(transaction_id)) AS total_orders,
    (COUNT(transaction_id) - LAG(COUNT(transaction_id), 1) 
    OVER (ORDER BY MONTH(transaction_date))) / LAG(COUNT(transaction_id), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5) -- for April and May
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);

