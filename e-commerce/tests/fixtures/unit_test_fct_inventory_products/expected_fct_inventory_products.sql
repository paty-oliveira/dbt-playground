SELECT *
FROM UNNEST([
    STRUCT(
        4896 AS product_id,
        2 AS distribution_center_id,
        '7A9A322CBE0D06A98667FDC5160DC6F8' AS product_sku,
        'Jeans' AS product_category,
        "!iT Jeans Women's Curvy Slim Boot Jean" AS product_name,
        '!it Jeans' AS product_brand,
        87.00 AS product_sale_price,
        'Women' AS product_department,
        46.11 AS product_cost,
        false AS is_product_available,
        0 AS total_products_available,
        '2023-07-30 21:56:06 UTC' AS created_at,
        '2024-06-29 22:39:08 UTC' AS sold_at,
        CURRENT_TIMESTAMP AS ingested_at
    ),
    STRUCT(
        13844 AS product_id,
        7 AS distribution_center_id,
        '2A3E953A5E3D81E67945BCE5519F84C8' AS product_sku,
        'Accessories' AS product_category,
        '(ONE) 1 Satin Headband' AS product_name,
        'Funny Girl Designs' AS product_brand,
        6.99 AS product_sale_price,
        'Women' AS product_department,
        2.77 AS product_cost,
        true AS is_product_available,
        2 AS total_products_available,
        '2022-05-23 05:06:00 UTC' AS created_at,
        null AS sold_at,
        CURRENT_TIMESTAMP AS ingested_at
    )
]) AS expected_data
