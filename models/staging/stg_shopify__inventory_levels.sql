SELECT
    id AS inventory_level_id,
    inventory_item_id,
    location_id,
    _fivetran_synced AS fivetran_synced
FROM `ecommerce-analytics2024.shopify.inventory_level`