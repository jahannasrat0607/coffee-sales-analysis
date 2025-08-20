-- 7. Comparing the daily sales with the average sale

SELECT * FROM coffee_shop_sales;

-- avg. sales of each month
SELECT
month,
ROUND(AVG(total_sales),2) as avg_sales
FROM
	(
    SELECT SUM(transaction_qty * unit_price) AS total_sales,
    MONTH(transaction_date) AS month_number,
    MONTHNAME(transaction_date) AS month
    FROM coffee_shop_sales
    GROUP BY transaction_date
    ) AS inner_query
GROUP BY month
ORDER BY month_number;

-- daily sales of each month
SELECT 
    MONTHNAME(transaction_date) AS month,
	DAY(transaction_date) AS day_of_the_month,
    SUM(unit_price * transaction_qty) AS total_sales
FROM coffee_shop_sales
GROUP BY month, DAY(transaction_date)
ORDER BY MONTH(transaction_date), DAY(transaction_date);

-- Comparing daily sale with average sales:  If greater than average then "Above Average" and if lesser then "Below Average"

SELECT 
    month,
    day_of_month,
    CASE 
        WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
    END AS sales_status,
    total_sales
FROM (
    SELECT 
        MONTHNAME(transaction_date) AS month,
        MONTH(transaction_date) AS month_number,
        DAY(transaction_date) AS day_of_month,
        SUM(unit_price * transaction_qty) AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM 
        coffee_shop_sales
    GROUP BY 
        transaction_date, month_number
) AS sales_data
ORDER BY 
    month_number, day_of_month;


