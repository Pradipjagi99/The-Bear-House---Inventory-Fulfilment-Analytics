-- The Bear House | 01_database_schema.sql
-- Final analytical PostgreSQL schema.
-- Run table creation before loading data; apply FK constraints after cleaning/loading.

CREATE TABLE IF NOT EXISTS dim_category (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT
);

CREATE TABLE IF NOT EXISTS dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date DATE,
    year INTEGER,
    quarter INTEGER,
    month INTEGER,
    month_name TEXT,
    week INTEGER,
    day_name TEXT
);

CREATE TABLE IF NOT EXISTS dim_product (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category_id INTEGER
);

CREATE TABLE IF NOT EXISTS dim_product_variant (
    variant_id INTEGER PRIMARY KEY,
    product_id INTEGER
);

CREATE TABLE IF NOT EXISTS dim_store (
    store_id INTEGER PRIMARY KEY,
    store_name TEXT
);

CREATE TABLE IF NOT EXISTS fact_orders (
    order_id BIGINT PRIMARY KEY,
    date_id INTEGER,
    store_id INTEGER,
    order_status TEXT,
    order_channel TEXT,
    customer_id BIGINT,
    order_total NUMERIC(18,2),
    discount_amount NUMERIC(18,2),
    shipping_amount NUMERIC(18,2)
);

CREATE TABLE IF NOT EXISTS fact_order_items (
    order_item_id BIGINT PRIMARY KEY,
    order_id BIGINT,
    variant_id INTEGER,
    quantity INTEGER,
    unit_price NUMERIC(18,2),
    discount_percent NUMERIC(10,4),
    discount_amount NUMERIC(18,2),
    gross_amount NUMERIC(18,2),
    net_amount NUMERIC(18,2)
);

CREATE TABLE IF NOT EXISTS fact_inventory (
    inventory_id BIGINT PRIMARY KEY,
    date_id INTEGER,
    variant_id INTEGER,
    store_id INTEGER,
    opening_stock BIGINT,
    stock_received BIGINT,
    units_sold BIGINT,
    stock_adjustment BIGINT,
    closing_stock BIGINT,
    reorder_point BIGINT,
    max_stock BIGINT,
    stock_status TEXT,
    unit_cost NUMERIC(18,4),
    inventory_value NUMERIC(24,2)
);

CREATE TABLE IF NOT EXISTS fact_fulfilment (
    fulfilment_id BIGINT PRIMARY KEY,
    order_id BIGINT,
    fulfilment_date_id INTEGER,
    store_id INTEGER,
    fulfilment_status TEXT,
    promised_delivery DATE,
    actual_delivery DATE,
    delivery_days INTEGER
);

CREATE TABLE IF NOT EXISTS fact_returns (
    return_id BIGINT PRIMARY KEY,
    order_item_id BIGINT,
    product_id INTEGER,
    variant_id INTEGER,
    date_id INTEGER,
    return_quantity INTEGER,
    return_reason TEXT,
    refund_amount NUMERIC(18,2),
    return_status TEXT
);

-- Foreign keys should be applied after all invalid source references are removed.
