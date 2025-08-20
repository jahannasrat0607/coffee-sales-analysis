# ☕ Coffee Shop Sales Analysis  

## Project Overview  
This project focuses on analyzing coffee shop sales data using **MySQL (Workbench)** for data cleaning and querying, and **Power BI** for visualization.  
The goal is to answer key **business questions** around sales performance, customer behavior, and product trends.  

Through this project, I demonstrate my expertise in:  
- SQL (data cleaning, transformations, aggregations, window functions)  
- Business performance analysis (sales trends, product demand, store comparisons)  
- Power BI dashboarding for storytelling and actionable insights  

---

##  Dataset  
The dataset 'coffee_shop_sales.csv' contains daily transactional data from a coffee shop chain.  
Key fields include:  
- 'transaction_id'
- 'transaction_date'  
- 'transaction_time'
- 'store_location' 
- 'product_category' 
- 'product_type'
- 'unit_price'
- 'transaction_qty'

---

## Data Cleaning in SQL  
Before analysis, I performed data cleaning using MySQL Workbench:  
- Converted 'transaction_date' from string to 'DATE'.  
- Converted 'transaction_time' from string to 'TIME'.  
- Renamed corrupted column names ('ï»¿transaction_id → transaction_id').  

```sql
UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%d-%m-%Y');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;
```
