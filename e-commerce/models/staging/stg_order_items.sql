{{
    config(
        materialized = "view"
    )
}}

SELECT
    id AS order_item_id,
    order_id,
    user_id,
    product_id,
    inventory_item_id,
    status,
    sale_price,
    created_at,
    shipped_at,
    delivered_at,
    returned_at,
    CURRENT_TIMESTAMP AS ingested_at
FROM {{ source("the-look-e-commerce", "order_items")}}