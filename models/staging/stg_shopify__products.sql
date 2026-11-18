SELECT
    id AS product_id,
    title AS product_title,
    product_type,
    vendor,
    status,
    created_at,
    updated_at,
    _fivetran_synced
FROM `ecommerce-analytics2024.shopify.product`