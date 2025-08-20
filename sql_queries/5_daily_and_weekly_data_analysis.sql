-- 4.1 Analyse the total sales, total quantity sold and total orders placed in a day

SELECT
    transaction_date,
    ROUND(SUM(unit_price * transaction_qty),2) AS total_sales,
    SUM(transaction_qty) AS total_quantity_sold,
    COUNT(transaction_id) AS total_orders
FROM coffee_shop_sales
GROUP BY transaction_date
ORDER BY transaction_date;

-- 4.2 Analysis the sales by weekdays amd Weekends
-- Sun = 1, Mon = 2, . . ., Sat = 7

SELECT 
    MONTHNAME(transaction_date) AS month,
    CASE 
        WHEN DAYOFWEEK(transaction_date) IN (1, 7) THEN 'Weekends'
        ELSE 'Weekdays'
    END AS day_type,
    ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales
FROM coffee_shop_sales
GROUP BY 
    MONTH(transaction_date),
    CASE 
        WHEN DAYOFWEEK(transaction_date) IN (1, 7) THEN 'Weekends'
        ELSE 'Weekdays'
    END
