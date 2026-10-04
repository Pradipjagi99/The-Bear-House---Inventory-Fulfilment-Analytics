-- The Bear House | 03_data_validation.sql

-- Row counts
SELECT 'fact_orders' AS table_name, COUNT(*) AS row_count FROM fact_orders
UNION ALL SELECT 'fact_order_items', COUNT(*) FROM fact_order_items
UNION ALL SELECT 'fact_inventory', COUNT(*) FROM fact_inventory
UNION ALL SELECT 'fact_fulfilment', COUNT(*) FROM fact_fulfilment
UNION ALL SELECT 'fact_returns', COUNT(*) FROM fact_returns;

-- Duplicate primary keys
SELECT order_id, COUNT(*) FROM fact_orders
GROUP BY order_id HAVING COUNT(*) > 1;

SELECT order_item_id, COUNT(*) FROM fact_order_items
GROUP BY order_item_id HAVING COUNT(*) > 1;

SELECT return_id, COUNT(*) FROM fact_returns
GROUP BY return_id HAVING COUNT(*) > 1;

SELECT fulfilment_id, COUNT(*) FROM fact_fulfilment
GROUP BY fulfilment_id HAVING COUNT(*) > 1;

-- Orphan checks
SELECT COUNT(*) AS orphan_order_items
FROM fact_order_items oi
LEFT JOIN fact_orders o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT COUNT(*) AS orphan_inventory_variants
FROM fact_inventory i
LEFT JOIN dim_product_variant pv ON i.variant_id = pv.variant_id
WHERE pv.variant_id IS NULL;

SELECT COUNT(*) AS orphan_inventory_stores
FROM fact_inventory i
LEFT JOIN dim_store s ON i.store_id = s.store_id
WHERE s.store_id IS NULL;

SELECT COUNT(*) AS orphan_fulfilment_orders
FROM fact_fulfilment f
LEFT JOIN fact_orders o ON f.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT COUNT(*) AS orphan_return_items
FROM fact_returns r
LEFT JOIN fact_order_items oi ON r.order_item_id = oi.order_item_id
WHERE oi.order_item_id IS NULL;

-- Product / variant coverage
SELECT COUNT(DISTINCT product_id) AS products FROM dim_product;
SELECT COUNT(DISTINCT variant_id) AS variants FROM dim_product_variant;

SELECT COUNT(DISTINCT oi.variant_id) AS sales_variants
FROM fact_order_items oi
JOIN dim_product_variant pv ON oi.variant_id = pv.variant_id;

SELECT COUNT(DISTINCT i.variant_id) AS inventory_variants
FROM fact_inventory i
JOIN dim_product_variant pv ON i.variant_id = pv.variant_id;

-- Fulfilment integrity
SELECT
    COUNT(*) AS fulfilment_rows,
    COUNT(DISTINCT fulfilment_id) AS unique_fulfilments,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT store_id) AS unique_stores,
    MIN(fulfilment_date_id) AS min_date_id,
    MAX(fulfilment_date_id) AS max_date_id
FROM fact_fulfilment;

SELECT COUNT(*) AS invalid_delivery_days
FROM fact_fulfilment
WHERE delivery_days < 0 OR delivery_days > 7;

-- Financial reconciliation
SELECT
    SUM(gross_amount) AS gross_sales,
    SUM(item_discount_amount) AS total_discount,
    SUM(net_amount) AS net_sales
FROM vw_sales_analysis;

-- Expected validated values:
-- Gross Sales: 441,825,348.73
-- Discounts:   77,091,930.09
-- Net Sales:   364,733,418.64

SELECT
    COUNT(*) AS return_rows,
    COUNT(DISTINCT return_id) AS distinct_returns,
    SUM(return_quantity) AS returned_units,
    SUM(refund_amount) AS refunds
FROM vw_returns_analysis;

-- Expected refunds: 22,328,114.90

SELECT
    COUNT(*) AS inventory_rows,
    SUM(closing_stock) AS closing_stock,
    SUM(inventory_value) AS inventory_value
FROM vw_inventory_analysis;

-- Expected closing stock: 3,665,938,086
-- Expected inventory value: 3,574,503,867,170.94

SELECT COUNT(*) AS inventory_value_mismatches
FROM fact_inventory
WHERE ROUND(inventory_value, 2)
      <> ROUND(closing_stock * unit_cost, 2);
