-- The Bear House | 02_data_cleaning.sql

-- Identify invalid variant references in order items.
SELECT COUNT(*) AS invalid_order_item_rows
FROM fact_order_items oi
LEFT JOIN dim_product_variant pv
    ON oi.variant_id = pv.variant_id
WHERE pv.variant_id IS NULL;

-- Identify invalid return -> order-item references.
SELECT COUNT(*) AS invalid_return_rows
FROM fact_returns r
LEFT JOIN fact_order_items oi
    ON r.order_item_id = oi.order_item_id
WHERE oi.order_item_id IS NULL;

-- Identify invalid inventory variants.
SELECT COUNT(*) AS invalid_inventory_rows
FROM fact_inventory i
LEFT JOIN dim_product_variant pv
    ON i.variant_id = pv.variant_id
WHERE pv.variant_id IS NULL;

-- Final project cleaning results:
-- fact_order_items: 250,000 source rows -> 209,238 valid rows
-- fact_returns:     17,500 source rows -> 14,605 valid rows
-- fact_inventory:   14,610,000 source rows -> 12,233,440 valid rows

-- Re-check after cleaning.
SELECT COUNT(*) AS remaining_invalid_order_item_variants
FROM fact_order_items oi
LEFT JOIN dim_product_variant pv
    ON oi.variant_id = pv.variant_id
WHERE pv.variant_id IS NULL;

SELECT COUNT(*) AS remaining_invalid_inventory_variants
FROM fact_inventory i
LEFT JOIN dim_product_variant pv
    ON i.variant_id = pv.variant_id
WHERE pv.variant_id IS NULL;

SELECT COUNT(*) AS remaining_invalid_return_items
FROM fact_returns r
LEFT JOIN fact_order_items oi
    ON r.order_item_id = oi.order_item_id
WHERE oi.order_item_id IS NULL;

-- Basic numeric quality checks.
SELECT COUNT(*) AS invalid_sales_quantities
FROM fact_order_items
WHERE quantity < 0;

SELECT COUNT(*) AS invalid_refund_amounts
FROM fact_returns
WHERE refund_amount < 0;

-- Source-provided closing_stock and stock_status were preserved.
-- No unsupported stock-flow formula was used to overwrite source values.
