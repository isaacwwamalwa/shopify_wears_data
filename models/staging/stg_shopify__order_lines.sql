
SELECT
    id AS order_line_id,
    order_id,
    product_id,
    variant_id,
    name AS order_line_name,
    sku,
    quantity,
    current_quantity,
    original_unit_price_set_shop_amount AS original_unit_price,
    discounted_unit_price_set_shop_amount AS discounted_unit_price,
    discounted_unit_price_after_all_disc_set_shop_amount AS final_discounted_unit_price,
    original_total_set_shop_amount AS original_line_total,
    discounted_total_set_shop_amount AS discounted_line_total,
    total_discount_set_shop_amount AS total_line_discount,
    discounted_total_set_shop_currency_code AS shop_currency_code,
    taxable,
    requires_shipping,
    _fivetran_synced
FROM `ecommerce-analytics2024.shopify.order_line`

