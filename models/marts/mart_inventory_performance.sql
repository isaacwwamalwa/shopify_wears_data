{{ config(materialized='table') }}

SELECT
    l.inventory_item_id,
    l.location_id,

    SUM(CASE
        WHEN i.quantity_name = 'available'
        THEN i.quantity ELSE 0
    END) AS available_quantity,

    SUM(CASE
        WHEN i.quantity_name = 'on_hand'
        THEN i.quantity ELSE 0
    END) AS on_hand_quantity,

    SUM(CASE
        WHEN i.quantity_name = 'committed'
        THEN i.quantity ELSE 0
    END) AS committed_quantity,

    SUM(CASE
        WHEN i.quantity_name = 'incoming'
        THEN i.quantity ELSE 0
    END) AS incoming_quantity,

    SUM(CASE
        WHEN i.quantity_name = 'damaged'
        THEN i.quantity ELSE 0
    END) AS damaged_quantity,

    SUM(CASE
        WHEN i.quantity_name = 'reserved'
        THEN i.quantity ELSE 0
    END) AS reserved_quantity

FROM {{ ref('stg_shopify__inventory_quantities') }} AS i

INNER JOIN {{ ref('stg_shopify__inventory_levels') }} AS l
    ON i.inventory_item_id = l.inventory_item_id
    AND i.inventory_level_id = l.inventory_level_id

GROUP BY
    l.inventory_item_id,
    l.location_id