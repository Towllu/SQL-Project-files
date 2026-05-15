SELECT * FROM my_projects.supermarket_trans_cleaned;

# Metrics
SELECT COUNT( DISTINCT  id) AS Number_of_sales,
ROUND(SUM(total_amount),2) AS Revenue,
AVG(quantity) AS Avg_Quantity_sold,
ROUND(AVG(unit_price),2) AS Avg_price
FROM my_projects.supermarket_trans_cleaned;


# Number of sales by product_name
SELECT product_name, COUNT(id) Number_of_sales
FROM my_projects.supermarket_trans_cleaned
GROUP BY product_name
ORDER BY Number_of_sales DESC
LIMIT 10;


# quantity_sold VS total_revenue by product_name
SELECT product_name, SUM(quantity) AS Quantity_sold
FROM my_projects.supermarket_trans_cleaned
GROUP BY product_name
ORDER BY Quantity_sold DESC
LIMIT 10;

SELECT product_name,
ROUND(SUM(total_amount),2) AS Revenue
FROM my_projects.supermarket_trans_cleaned
GROUP BY product_name
ORDER BY Revenue DESC
LIMIT 10;

SELECT product_name,
ROUND(SUM(total_amount),2) AS Revenue,
SUM(quantity) AS Quantity_sold,
ROUND(avg(unit_price),2) AS Average_unit_price
FROM my_projects.supermarket_trans_cleaned
GROUP BY product_name
HAVING product_name = "waffle";

SELECT product_name,
ROUND(SUM(total_amount),2) AS Revenue,
SUM(quantity) AS Quantity_sold,
ROUND(avg(unit_price),2) AS Average_unit_price
FROM my_projects.supermarket_trans_cleaned
GROUP BY product_name
HAVING product_name = "chili pepper";


# quantity_sold VS total_revenue by store
SELECT store, SUM(quantity) AS Quantity_sold
FROM my_projects.supermarket_trans_cleaned
GROUP BY store
ORDER BY Quantity_sold DESC
LIMIT 10;

SELECT store,
ROUND(SUM(total_amount),2) AS Revenue
FROM my_projects.supermarket_trans_cleaned
GROUP BY store
ORDER BY Revenue DESC
LIMIT 10;


# quantity_sold VS total_revenue by payment_method
SELECT payment_method, SUM(quantity) AS Quantity_sold
FROM my_projects.supermarket_trans_cleaned
GROUP BY payment_method
ORDER BY Quantity_sold DESC
LIMIT 10;

SELECT payment_method,
ROUND(SUM(total_amount),2) AS Revenue
FROM my_projects.supermarket_trans_cleaned
GROUP BY payment_method
ORDER BY Revenue DESC
LIMIT 10;


# quantity_sold VS total_revenue by customer_type
SELECT customer_type, SUM(quantity) AS Quantity_sold
FROM my_projects.supermarket_trans_cleaned
GROUP BY customer_type
ORDER BY Quantity_sold DESC
LIMIT 10;

SELECT customer_type,
ROUND(SUM(total_amount),2) AS Revenue
FROM my_projects.supermarket_trans_cleaned
GROUP BY customer_type
ORDER BY Revenue DESC
LIMIT 10;


# Yearly sales trend
SELECT year, ROUND(SUM(total_amount),2) AS Revenue
FROM my_projects.supermarket_trans_cleaned
GROUP BY year
ORDER  BY year;


# Monthly transaction
SELECT Year,Month, ROUND(SUM(total_amount),2) AS Revenue
FROM my_projects.supermarket_trans_cleaned
GROUP BY Year,Month
HAVING Year = 2020
ORDER  BY FIELD(
Month, 'January', 'February', 'March', 'April', 'May', 'June',
 'July', 'August', 'September', 'October', 'November', 'December');



#daily revenue trend
SELECT Year, Month, Day, ROUND(SUM(total_amount),2) AS Revenue
FROM my_projects.supermarket_trans_cleaned
GROUP BY Year,Month, Day
HAVING Year = 2020 AND Month = 'January'
ORDER BY FIELD(
day, 'Sunday', 'Monday', 'Tuesday', 
'Wednesday', 'Thursday', 'Friday', 'Saturday');


SELECT Year, CONCAT('Q', Quarter(timestamp)) AS Quarter_Year,
ROUND(SUM(total_amount),2) AS Revenue
FROM my_projects.supermarket_trans_cleaned
GROUP BY  Year, Quarter_Year
HAVING Year = 2020
ORDER BY Quarter_Year;