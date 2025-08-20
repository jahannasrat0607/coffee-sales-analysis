-- Total Sales Analysis:
-- 1(a) Calculate total sales for each respective month

SELECT MONTHNAME(transaction_date) AS month , ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM coffee_shop_sales
GROUP BY MONTH(transaction_date);

-- 1(b) Determine month-on-month increase or decrease in sales
-- 1(c) Calculate the difference in sales between the selected month and previous month

SELECT 
    MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1)
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price * transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5) -- for months of April and May
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date)



