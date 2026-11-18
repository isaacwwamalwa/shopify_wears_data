SELECT
    id AS customer_id,
    created_at AS customer_created_at,
    updated_at AS customer_updated_at,
    number_of_orders,
    total_spent,
    _fivetran_synced
FROM `ecommerce-analytics2024.shopify.customer`