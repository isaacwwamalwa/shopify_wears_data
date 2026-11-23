
{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
) }}

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

{% if is_incremental() %}

WHERE order_updated_at >= (
    SELECT TIMESTAMP_SUB(
        COALESCE(
            MAX(order_updated_at),
            TIMESTAMP('1900-01-01')
        ),
        INTERVAL 3 DAY
    )
    FROM {{ this }}
)

{% endif %}
