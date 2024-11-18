{{
    config(
        materialized = "view"
    )
}}

SELECT
    id AS inventory_item_id,
    product_id,
    product_distribution_center_id AS distribution_center_id,
    product_sku,
    product_category,
    product_name,
    product_brand,
    product_retail_price,
    product_department,
    cost,
    created_at,
    sold_at,
    CURRENT_TIMESTAMP AS ingested_at
FROM {{ source("the-look-e-commerce", "inventory_items") }}
