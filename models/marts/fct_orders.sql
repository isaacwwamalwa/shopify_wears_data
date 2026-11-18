
SELECT
    order_id,
    customer_id,
    order_created_at,
    order_updated_at,
    processed_at,
    cancelled_at,
    closed_at,
    currency_code,
    presentment_currency_code,
    display_financial_status,
    display_fulfillment_status,
    is_test_order,
    order_total,
    total_discounts,
    total_refunded
FROM {{ ref('stg_shopify__orders') }}
