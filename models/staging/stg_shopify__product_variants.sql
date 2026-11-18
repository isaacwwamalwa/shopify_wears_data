SELECT
    id AS product_variant_id,
    product_id,
    inventory_item_id,
    title AS variant_title,
    price,
    sku,
    created_at,
    updated_at,
    _fivetran_synced
FROM `ecommerce-analytics2024.shopify.product_variant`