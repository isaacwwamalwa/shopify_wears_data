
SELECT
    DATE(order_created_at) AS order_date,
    currency_code,
    COUNT(*) AS total_orders,
    SUM(order_total) AS recorded_order_revenue,
    SUM(total_discounts) AS recorded_discounts,
    SUM(total_refunded) AS recorded_refunds
FROM {{ ref('fct_orders') }}
WHERE COALESCE(is_test_order, FALSE) = FALSE
GROUP BY
    order_date,
    currency_code
