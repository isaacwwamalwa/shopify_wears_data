
{{ config(materialized='table') }}

SELECT
    c.customer_id,
    c.customer_created_at,

    COUNT(o.order_id) AS total_orders,

    ROUND(SUM(o.order_total), 2) AS lifetime_recorded_spend,

    ROUND(
    {{ safe_divide('SUM(o.order_total)', 'COUNT(o.order_total)') }},
    2
) AS average_order_value,

    MIN(DATE(o.order_created_at)) AS first_order_date,

    MAX(DATE(o.order_created_at)) AS most_recent_order_date,

    DATE_DIFF(
        MAX(DATE(o.order_created_at)),
        MIN(DATE(o.order_created_at)),
        DAY
    ) AS days_between_first_and_last_order,

    o.currency_code

FROM {{ ref('fct_orders') }} AS o

INNER JOIN {{ ref('stg_shopify__customers') }} AS c
    ON o.customer_id = c.customer_id

WHERE COALESCE(o.is_test_order, FALSE) = FALSE

GROUP BY
    c.customer_id,
    c.customer_created_at,
    o.currency_code
