-- The Bear House | 04_sales_analysis.sql

-- Overall sales KPIs
SELECT
    SUM(gross_amount) AS gross_sales,
    SUM(item_discount_amount) AS total_discount,
    SUM(net_amount) AS net_sales,
    SUM(quantity) AS units_sold,
    COUNT(DISTINCT order_id) AS orders
FROM vw_sales_analysis;

-- Top 10 products by net sales
SELECT product_name, SUM(net_amount) AS net_sales
FROM vw_sales_analysis
GROUP BY product_name
ORDER BY net_sales DESC
LIMIT 10;

-- Net sales by category
SELECT category_name, SUM(net_amount) AS net_sales
FROM vw_sales_analysis
GROUP BY category_name
ORDER BY net_sales DESC;

-- Net sales by channel
SELECT order_channel, SUM(net_amount) AS net_sales
FROM vw_sales_analysis
GROUP BY order_channel
ORDER BY net_sales DESC;

-- Net sales by store
SELECT store_id, SUM(net_amount) AS net_sales
FROM vw_sales_analysis
GROUP BY store_id
ORDER BY net_sales DESC;

-- Units sold by category
SELECT category_name, SUM(quantity) AS units_sold
FROM vw_sales_analysis
GROUP BY category_name
ORDER BY units_sold DESC;

-- Net sales by order status
SELECT order_status, SUM(net_amount) AS net_sales
FROM vw_sales_analysis
GROUP BY order_status
ORDER BY net_sales DESC;

-- Gross vs net sales by category
SELECT
    category_name,
    SUM(gross_amount) AS gross_sales,
    SUM(net_amount) AS net_sales
FROM vw_sales_analysis
GROUP BY category_name
ORDER BY net_sales DESC;

-- Discount amount by category
SELECT category_name, SUM(item_discount_amount) AS discount_amount
FROM vw_sales_analysis
GROUP BY category_name
ORDER BY discount_amount DESC;

-- Average selling price by category
SELECT category_name, AVG(unit_price) AS average_selling_price
FROM vw_sales_analysis
GROUP BY category_name
ORDER BY average_selling_price DESC;

-- Average order value by channel
SELECT
    order_channel,
    SUM(net_amount) / NULLIF(COUNT(DISTINCT order_id), 0) AS average_order_value
FROM vw_sales_analysis
GROUP BY order_channel
ORDER BY average_order_value DESC;

-- Net sales by day of week
SELECT day_name, SUM(net_amount) AS net_sales
FROM vw_sales_analysis
GROUP BY day_name
ORDER BY CASE day_name
    WHEN 'Monday' THEN 1 WHEN 'Tuesday' THEN 2 WHEN 'Wednesday' THEN 3
    WHEN 'Thursday' THEN 4 WHEN 'Friday' THEN 5 WHEN 'Saturday' THEN 6
    WHEN 'Sunday' THEN 7 ELSE 8 END;

-- Monthly net sales trend
SELECT year, month, SUM(net_amount) AS net_sales
FROM vw_sales_analysis
GROUP BY year, month
ORDER BY year, month;
