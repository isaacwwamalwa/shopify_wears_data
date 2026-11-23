
{% snapshot snap_shopify_products %}

{{
    config(
        target_schema='dbt_shopify',
        unique_key='product_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

SELECT
    product_id,
    product_title,
    product_type,
    vendor,
    status,
    created_at,
    updated_at

FROM {{ ref('stg_shopify__products') }}

{% endsnapshot %}
