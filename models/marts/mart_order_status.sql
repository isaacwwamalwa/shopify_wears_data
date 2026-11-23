{{ config(materialized='table') }}

SELECT
    display_financial_status,
    display_fulfillment_status,
    currency_code,

    COUNT(*) AS total_orders,

    ROUND(SUM(order_total), 2) AS recorded_order_value,

    ROUND(SUM(total_refunded), 2) AS recorded_refunds,

    ROUND(AVG(order_total), 2) AS average_order_value

FROM {{ ref('fct_orders') }}

WHERE COALESCE(is_test_order, FALSE) = FALSE

GROUP BY
    display_financial_status,
    display_fulfillment_status,
    currency_code
