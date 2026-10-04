-- The Bear House | 08_analytical_views.sql
-- Reusable PostgreSQL reporting-layer views.

CREATE OR REPLACE VIEW vw_sales_analysis AS
SELECT
    oi.order_item_id,
    oi.order_id,
    o.date_id,
    o.store_id,
    o.order_status,
    o.order_channel,
    o.customer_id,
    oi.variant_id,
    pv.product_id,
    p.product_name,
    c.category_id,
    c.category_name,
    d.full_date,
    d.year,
    d.quarter,
    d.month,
    d.month_name,
    d.week,
    d.day_name,
    oi.quantity,
    oi.unit_price,
    oi.discount_percent,
    oi.discount_amount AS item_discount_amount,
    oi.gross_amount,
    oi.net_amount
FROM fact_order_items oi
JOIN fact_orders o ON oi.order_id = o.order_id
JOIN dim_product_variant pv ON oi.variant_id = pv.variant_id
JOIN dim_product p ON pv.product_id = p.product_id
JOIN dim_category c ON p.category_id = c.category_id
JOIN dim_date d ON o.date_id = d.date_id;

CREATE OR REPLACE VIEW vw_returns_analysis AS
SELECT
    r.return_id,
    r.order_item_id,
    r.product_id,
    r.variant_id,
    r.date_id,
    r.return_quantity,
    r.return_reason,
    r.refund_amount,
    r.return_status,
    p.product_name,
    c.category_id,
    c.category_name,
    d.full_date,
    d.year,
    d.quarter,
    d.month,
    d.month_name,
    d.week,
    d.day_name,
    oi.unit_price,
    oi.net_amount
FROM fact_returns r
JOIN fact_order_items oi ON r.order_item_id = oi.order_item_id
JOIN dim_product_variant pv ON r.variant_id = pv.variant_id
JOIN dim_product p ON pv.product_id = p.product_id
JOIN dim_category c ON p.category_id = c.category_id
JOIN dim_date d ON r.date_id = d.date_id;

CREATE OR REPLACE VIEW vw_inventory_analysis AS
SELECT
    i.inventory_id,
    i.date_id,
    i.variant_id,
    i.store_id,
    pv.product_id,
    p.product_name,
    c.category_id,
    c.category_name,
    s.store_name,
    d.full_date,
    d.year,
    d.quarter,
    d.month,
    d.month_name,
    d.week,
    d.day_name,
    i.opening_stock,
    i.stock_received,
    i.units_sold,
    i.stock_adjustment,
    i.closing_stock,
    i.reorder_point,
    i.max_stock,
    i.stock_status,
    i.unit_cost,
    i.inventory_value
FROM fact_inventory i
JOIN dim_product_variant pv ON i.variant_id = pv.variant_id
JOIN dim_product p ON pv.product_id = p.product_id
JOIN dim_category c ON p.category_id = c.category_id
JOIN dim_store s ON i.store_id = s.store_id
JOIN dim_date d ON i.date_id = d.date_id;

CREATE OR REPLACE VIEW vw_sales_kpi AS
SELECT
    date_id,
    store_id,
    variant_id,
    SUM(gross_amount) AS gross_sales,
    SUM(item_discount_amount) AS total_discount,
    SUM(net_amount) AS net_sales,
    SUM(quantity) AS units_sold,
    COUNT(DISTINCT order_id) AS orders
FROM vw_sales_analysis
GROUP BY date_id, store_id, variant_id;

CREATE OR REPLACE VIEW vw_returns_kpi AS
SELECT
    date_id,
    product_id,
    variant_id,
    SUM(return_quantity) AS returned_units,
    SUM(refund_amount) AS refunds,
    COUNT(DISTINCT return_id) AS returns
FROM vw_returns_analysis
GROUP BY date_id, product_id, variant_id;

CREATE OR REPLACE VIEW vw_inventory_kpi AS
SELECT
    date_id,
    store_id,
    variant_id,
    SUM(closing_stock) AS closing_stock,
    SUM(inventory_value) AS inventory_value
FROM vw_inventory_analysis
GROUP BY date_id, store_id, variant_id;
