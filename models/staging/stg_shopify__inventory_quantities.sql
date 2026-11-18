SELECT
    inventory_item_id,
    inventory_level_id,
    name AS quantity_name,
    quantity,
    updated_at,
    _fivetran_synced
FROM `ecommerce-analytics2024.shopify.inventory_quantity`