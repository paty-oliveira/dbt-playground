SELECT *
FROM UNNEST([
    STRUCT(
        74092 AS inventory_item_id,
        13844 AS product_id,
        7 AS distribution_center_id,
        '2A3E953A5E3D81E67945BCE5519F84C8' AS product_sku,
        'Accessories' AS product_category,
        '(ONE) 1 Satin Headband' AS product_name,
        'Funny Girl Designs' AS product_brand,
        6.9899997711181641 AS product_retail_price,
        'Women' AS product_department,
        2.7680398976188529 AS cost,
        '2024-11-17 07:46:12 UTC' AS created_at,
        '2024-11-19 06:13:12 UTC' AS sold_at
    ),
    STRUCT(
        74093 AS inventory_item_id,
        13844 AS product_id,
        7 AS distribution_center_id,
        '2A3E953A5E3D81E67945BCE5519F84C8' AS product_sku,
        'Accessories' AS product_category,
        '(ONE) 1 Satin Headband' AS product_name,
        'Funny Girl Designs' AS product_brand,
        6.9899997711181641 AS product_retail_price,
        'Women' AS product_department,
        2.7680398976188529 AS cost,
        '2022-05-23 05:06:00 UTC' AS created_at,
        null AS sold_at
    ),
    STRUCT(
        136922 AS inventory_item_id,
        13844 AS product_id,
        7 AS distribution_center_id,
        '2A3E953A5E3D81E67945BCE5519F84C8' AS product_sku,
        'Accessories' AS product_category,
        '(ONE) 1 Satin Headband' AS product_name,
        'Funny Girl Designs' AS product_brand,
        6.9899997711181641 AS product_retail_price,
        'Women' AS product_department,
        2.7680398976188529 AS cost,
        '2023-07-18 07:20:00 UTC' AS created_at,
        null AS sold_at
    ),
    STRUCT(
        35619 AS inventory_item_id,
        4896 AS product_id,
        2 AS distribution_center_id,
        '7A9A322CBE0D06A98667FDC5160DC6F8' AS product_sku,
        'Jeans' AS product_category,
        "!iT Jeans Women's Curvy Slim Boot Jean" AS product_name,
        '!it Jeans' AS product_brand,
        87.0 AS product_retail_price,
        'Women' AS product_department,
        46.109999941661954 AS cost,
        '2023-07-30 21:56:06 UTC' AS created_at,
        '2023-09-03 11:23:06 UTC' AS sold_at
    ),
    STRUCT(
        61992 AS inventory_item_id,
        4896 AS product_id,
        2 AS distribution_center_id,
        '7A9A322CBE0D06A98667FDC5160DC6F8' AS product_sku,
        'Jeans' AS product_category,
        "!iT Jeans Women's Curvy Slim Boot Jean" AS product_name,
        '!it Jeans' AS product_brand,
        87.0 AS product_retail_price,
        'Women' AS product_department,
        46.109999941661954 AS cost,
        '2024-05-14 22:45:08 UTC' AS created_at,
        '2024-06-29 22:39:08 UTC' AS sold_at
    )

]) AS mock_data