-- 8. Top 10 Products by sales

SELECT
    product_type,
    ROUND(SUM(unit_price * transaction_qty), 2) AS Total_Sales
FROM coffee_shop_sales
GROUP BY product_type
ORDER BY Total_Sales DESC
LIMIT 10;

-- Find the top selling product of Coffee category in the month of May

SELECT
    product_type,
    ROUND(SUM(unit_price * transaction_qty), 2) AS Total_Sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5 AND product_category = 'Coffee'
GROUP BY product_type
ORDER BY Total_Sales DESC
LIMIT 10;

