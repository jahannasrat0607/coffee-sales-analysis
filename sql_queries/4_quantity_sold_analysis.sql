-- 3. Total Quantity sold Analysis
-- 3(a)Calculate total quantity sold for each respective month

SELECT MONTHNAME(transaction_date) AS month , SUM(transaction_qty) as Total_Quantity_Sold
FROM coffee_shop_sales 
GROUP BY MONTH(transaction_date);

-- 3(b) Determine month-on-month increase or decrease in the total quantity sold
-- 3(c) Calculate the difference in the total quatity sold between the selected month and previous month

SELECT 
    MONTH(transaction_date) AS month,
    ROUND(SUM(transaction_qty)) AS total_quantity_sold,
    (SUM(transaction_qty) - LAG(SUM(transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5)   -- for April and May
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);
