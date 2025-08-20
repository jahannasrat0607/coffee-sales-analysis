# ☕ Coffee Sales Analysis – SQL + Power BI Dashboard

## Project Overview
This project analyzes coffee sales data using **SQL** for data exploration and **Power BI** for interactive dashboards.  
The goal was to answer key **business questions** related to sales performance, customer behavior, and product trends, and present insights in a visually appealing and actionable way.  

---

## Dataset Description
The dataset used contains sales transactions from a coffee shop, including:
- `transaction_id` – Unique ID for each transaction  
- `transaction_date` – Date of purchase  
- `transaction_time` – Time of purchase  
- `store_location` – Store branch location  
- `product_category` – Product category (e.g., Coffee, Tea, Bakery)  
- `product_type` – Specific product type  
- `unit_price` – Price per unit  
- `transaction_qty` – Quantity purchased  
Time period: *[Jan 2023 to June 2023]* 
---

## Data Cleaning
Before analysis, the dataset was cleaned:
```sql
-- Convert transaction_date to DATE format
UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%d-%m-%Y');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;

-- Convert transaction_time to TIME format
UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;

-- Rename incorrect column name
ALTER TABLE coffee_shop_sales
CHANGE COLUMN ï»¿transaction_id transaction_id INT;
```
---

## 🎯 Business Questions / KPIs
The following questions were answered through SQL queries and visualized in Power BI:  

1. **Total Sales & Revenue Trends** – What are the overall sales trends over time?  
2. **Peak Periods** – Which months, weekdays, and times of the day generate the most sales?  
3. **Store Performance** – Which store location performs best?  
4. **Top Products** – Which products drive the highest revenue and sales quantity?  
5. **Customer Behavior** – How do weekday vs weekend sales compare?  
6. **Month-over-Month Growth** – How does performance change across months?  

---

## 🛠️ SQL Analysis
All SQL queries used to explore and answer the above questions are available in [`sql_queries/`](./sql_queries).  

Each query focused on:  
- Aggregating **total sales & orders**.  
- Identifying **top 10 best-selling products**.  
- Analyzing **weekday vs weekend performance**.  
- Calculating **Monthly growth**.  

>  Example: To analyze weekday vs weekend sales, a `CASE WHEN` condition was applied on the transaction date to group sales accordingly.  

---

## Power BI Dashboard
An interactive Power BI dashboard was created to visualize and explore the insights:  

### Key Visuals
- **Sales Calendar Heatmap** – Sales trends across months and years.  
- **Sales by Weekdays** – Bar chart showing weekday vs weekend patterns.  
- **Sales by Store Location** – Map/Bar chart comparing store performance.  
- **Top 10 Products** – Bar/Column chart ranking best-selling products.  
- **Monthly Sales & YoY Growth** – Line chart to observe growth patterns.  

📷 *Dashboard Preview:*  
![Dashboard Screenshot](images/dashboard.png)  

---

## Key Insights & Findings
- Sales **peak on weekends**, with higher average transaction amounts.  
- **Espresso** and **Latte** are the top-selling products driving revenue.  
- The **Downtown store** outperforms other locations consistently.  
- A strong **growth trend** is observed in *[specify year if dataset shows]*.  
- Customers show a preference for morning purchases (*8 AM – 11 AM peak*).  

---

## 🚀 How to Run This Project
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/coffee-sales-analysis.git
   ```


