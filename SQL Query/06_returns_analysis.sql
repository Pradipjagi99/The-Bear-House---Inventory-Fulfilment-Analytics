-- The Bear House | 06_returns_analysis.sql

-- Overall return KPIs
SELECT
    COUNT(DISTINCT return_id) AS total_returns,
    SUM(return_quantity) AS returned_units,
    SUM(refund_amount) AS total_refunds
FROM vw_returns_analysis;

-- Refund amount by return reason
SELECT return_reason, SUM(refund_amount) AS refund_amount
FROM vw_returns_analysis
GROUP BY return_reason
ORDER BY refund_amount DESC;

-- Returned units by return reason
SELECT return_reason, SUM(return_quantity) AS returned_units
FROM vw_returns_analysis
GROUP BY return_reason
ORDER BY returned_units DESC;

-- Refund amount by category
SELECT category_name, SUM(refund_amount) AS refund_amount
FROM vw_returns_analysis
GROUP BY category_name
ORDER BY refund_amount DESC;

-- Returned units by category
SELECT category_name, SUM(return_quantity) AS returned_units
FROM vw_returns_analysis
GROUP BY category_name
ORDER BY returned_units DESC;

-- Refund amount by product type
SELECT product_type, SUM(refund_amount) AS refund_amount
FROM vw_returns_analysis
GROUP BY product_type
ORDER BY refund_amount DESC;

-- Monthly refund trend
SELECT year, month, SUM(refund_amount) AS refund_amount
FROM vw_returns_analysis
GROUP BY year, month
ORDER BY year, month;

-- Returns by return status
SELECT return_status, COUNT(DISTINCT return_id) AS returns
FROM vw_returns_analysis
GROUP BY return_status
ORDER BY returns DESC;

-- Return rate by category
WITH sales AS (
    SELECT category_name, SUM(quantity) AS units_sold
    FROM vw_sales_analysis
    GROUP BY category_name
),
returns AS (
    SELECT category_name, SUM(return_quantity) AS returned_units
    FROM vw_returns_analysis
    GROUP BY category_name
)
SELECT
    s.category_name,
    s.units_sold,
    COALESCE(r.returned_units, 0) AS returned_units,
    COALESCE(r.returned_units, 0)::NUMERIC / NULLIF(s.units_sold, 0) AS return_rate
FROM sales s
LEFT JOIN returns r ON s.category_name = r.category_name
ORDER BY return_rate DESC;

-- Return rate by reason
WITH reason_returns AS (
    SELECT return_reason, SUM(return_quantity) AS returned_units
    FROM vw_returns_analysis
    GROUP BY return_reason
),
total_sales AS (
    SELECT SUM(quantity) AS units_sold
    FROM vw_sales_analysis
)
SELECT
    r.return_reason,
    r.returned_units,
    r.returned_units::NUMERIC / NULLIF(t.units_sold, 0) AS return_rate
FROM reason_returns r
CROSS JOIN total_sales t
ORDER BY return_rate DESC;
