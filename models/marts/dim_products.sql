
SELECT
    product_id,
    product_title,
    product_type,
    vendor,
    status,
    created_at AS product_created_at,
    updated_at AS product_updated_at
FROM {{ ref('stg_shopify__products') }}
