{{ config(materialized='table') }}
SELECT
    p.product_id,
    p.product_title,
    p.product_type,
    p.vendor,
    p.status AS product_status,

    COUNT(DISTINCT l.order_id) AS total_orders,
    COUNT(l.order_line_id) AS total_order_lines,
    SUM(l.quantity) AS units_sold,

    ROUND(SUM(l.original_line_total), 2) AS original_sales_value,
    ROUND(SUM(l.discounted_line_total), 2) AS discounted_sales_value,
    ROUND(SUM(l.total_line_discount), 2) AS total_discounts,

    l.shop_currency_code AS currency_code

FROM {{ ref('fct_order_lines') }} AS l

LEFT JOIN {{ ref('dim_products') }} AS p
    ON l.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_title,
    p.product_type,
    p.vendor,
    p.status,
    l.shop_currency_code
