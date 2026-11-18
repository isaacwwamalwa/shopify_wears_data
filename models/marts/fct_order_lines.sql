
SELECT
    l.order_line_id,
    l.order_id,
    l.product_id,
    l.variant_id,
    l.order_line_name,
    l.sku,
    l.quantity,
    l.current_quantity,
    l.original_unit_price,
    l.discounted_unit_price,
    l.final_discounted_unit_price,
    l.original_line_total,
    l.discounted_line_total,
    l.total_line_discount,
    l.shop_currency_code,
    l.taxable,
    l.requires_shipping
FROM {{ ref('stg_shopify__order_lines') }} AS l
