-- The Bear House | 07_fulfilment_analysis.sql

-- Overall fulfilment KPIs
SELECT
    COUNT(*) AS fulfilment_records,
    COUNT(DISTINCT order_id) AS fulfilled_orders,
    AVG(delivery_days) AS average_delivery_days
FROM fact_fulfilment;

-- On-time vs late deliveries
SELECT
    CASE
        WHEN actual_delivery <= promised_delivery THEN 'On Time'
        ELSE 'Late'
    END AS delivery_status,
    COUNT(*) AS fulfilment_count
FROM fact_fulfilment
GROUP BY 1
ORDER BY fulfilment_count DESC;

-- Overall late delivery rate
SELECT
    COUNT(*) FILTER (WHERE actual_delivery > promised_delivery)::NUMERIC
    / NULLIF(COUNT(*), 0) AS late_delivery_rate
FROM fact_fulfilment;

-- Average delivery days by store
SELECT store_id, AVG(delivery_days) AS average_delivery_days
FROM fact_fulfilment
GROUP BY store_id
ORDER BY average_delivery_days DESC;

-- Late delivery rate by store
SELECT
    store_id,
    COUNT(*) FILTER (WHERE actual_delivery > promised_delivery)::NUMERIC
    / NULLIF(COUNT(*), 0) AS late_delivery_rate
FROM fact_fulfilment
GROUP BY store_id
ORDER BY late_delivery_rate DESC;

-- Fulfilment volume by store
SELECT store_id, COUNT(*) AS fulfilment_volume
FROM fact_fulfilment
GROUP BY store_id
ORDER BY fulfilment_volume DESC;

-- Monthly fulfilment volume
SELECT
    d.year,
    d.month,
    COUNT(*) AS fulfilment_volume
FROM fact_fulfilment f
JOIN dim_date d ON f.fulfilment_date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- Monthly late delivery rate
SELECT
    d.year,
    d.month,
    COUNT(*) FILTER (WHERE f.actual_delivery > f.promised_delivery)::NUMERIC
    / NULLIF(COUNT(*), 0) AS late_delivery_rate
FROM fact_fulfilment f
JOIN dim_date d ON f.fulfilment_date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- Delivery-days distribution
SELECT delivery_days, COUNT(*) AS fulfilment_count
FROM fact_fulfilment
GROUP BY delivery_days
ORDER BY delivery_days;

-- Average delivery days trend
SELECT
    d.full_date,
    AVG(f.delivery_days) AS average_delivery_days
FROM fact_fulfilment f
JOIN dim_date d ON f.fulfilment_date_id = d.date_id
GROUP BY d.full_date
ORDER BY d.full_date;
