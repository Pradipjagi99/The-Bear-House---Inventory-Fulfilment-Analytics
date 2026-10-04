-- The Bear House | 05_inventory_analysis.sql

-- Overall inventory KPIs
SELECT
    SUM(closing_stock) AS closing_stock,
    SUM(inventory_value) AS inventory_value,
    AVG(unit_cost) AS average_unit_cost
FROM vw_inventory_analysis;

-- Closing stock by stock status
SELECT stock_status, SUM(closing_stock) AS closing_stock
FROM vw_inventory_analysis
GROUP BY stock_status
ORDER BY closing_stock DESC;

-- Closing stock by store
SELECT store_id, SUM(closing_stock) AS closing_stock
FROM vw_inventory_analysis
GROUP BY store_id
ORDER BY closing_stock DESC;

-- Closing stock by category
SELECT category_name, SUM(closing_stock) AS closing_stock
FROM vw_inventory_analysis
GROUP BY category_name
ORDER BY closing_stock DESC;

-- Inventory value by category
SELECT category_name, SUM(inventory_value) AS inventory_value
FROM vw_inventory_analysis
GROUP BY category_name
ORDER BY inventory_value DESC;

-- Top 15 products by inventory value
SELECT product_name, SUM(inventory_value) AS inventory_value
FROM vw_inventory_analysis
GROUP BY product_name
ORDER BY inventory_value DESC
LIMIT 15;

-- Bottom 15 products by closing stock
SELECT product_name, SUM(closing_stock) AS closing_stock
FROM vw_inventory_analysis
GROUP BY product_name
ORDER BY closing_stock ASC
LIMIT 15;

-- Inventory value trend
SELECT year, month, SUM(inventory_value) AS inventory_value
FROM vw_inventory_analysis
GROUP BY year, month
ORDER BY year, month;

-- Stock turnover ratio by category
SELECT
    category_name,
    SUM(units_sold) / NULLIF(AVG(closing_stock), 0) AS stock_turnover_ratio
FROM vw_inventory_analysis
GROUP BY category_name
ORDER BY stock_turnover_ratio DESC;

-- Products below their aggregate reorder point
SELECT
    product_name,
    SUM(closing_stock) AS closing_stock,
    SUM(reorder_point) AS reorder_point
FROM vw_inventory_analysis
GROUP BY product_name
HAVING SUM(closing_stock) < SUM(reorder_point)
ORDER BY closing_stock ASC;
