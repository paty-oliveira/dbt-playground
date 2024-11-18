{{
    config(
        materialized = "view"
    )
}}

SELECT
    id AS product_id,
    distribution_center_id,
    sku AS product_sku,
    category AS product_category,
    department AS product_department,
    name AS product_name,
    brand AS product_brand,
    retail_price AS product_retail_price,
    cost,
    CURRENT_TIMESTAMP AS ingested_at
FROM {{ source("the-look-e-commerce", "products") }}
