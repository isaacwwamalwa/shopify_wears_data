SELECT
    id AS order_id,
    customer_id,
    created_at AS order_created_at,
    updated_at AS order_updated_at,
    processed_at,
    cancelled_at,
    closed_at,
    currency_code,
    presentment_currency_code,
    display_financial_status,
    display_fulfillment_status,
    test AS is_test_order,
    total_price_set_shop_amount AS order_total,
    total_discounts_set_shop_amount AS total_discounts,
    total_refunded_set_shop_amount AS total_refunded,
    _fivetran_synced
FROM `ecommerce-analytics2024.shopify.order`
WHERE COALESCE(_fivetran_deleted, FALSE) = FALSE
