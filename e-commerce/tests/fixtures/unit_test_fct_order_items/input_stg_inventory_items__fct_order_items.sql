SELECT *
FROM UNNEST([
    STRUCT(
        177717 AS inventory_item_id,
        14235 AS product_id,
        1 AS distribution_center_id,
        '8425BC94A44E3D1BB3C8C026B2702C00' AS product_sku,
        'Accessories' AS product_category,
        'Indestructable Aluminum Aluma Wallet - RED' AS product_name,
        'marsal' AS product_brand,
        0.0199999995529651 AS product_retail_price,
        'Women' AS product_department,
        0.0082999997779726 AS cost,
        '2020-06-22 19:41:48 UTC' AS created_at,
        '2020-08-16 09:55:48 UTC' AS sold_at
    ),
    STRUCT(
        254918 AS inventory_item_id,
        14235 AS product_id,
        1 AS distribution_center_id,
        '8425BC94A44E3D1BB3C8C026B2702C00' AS product_sku,
        'Accessories' AS product_category,
        'Indestructable Aluminum Aluma Wallet - RED' AS product_name,
        'marsal' AS product_brand,
        0.0199999995529651 AS product_retail_price,
        'Women' AS product_department,
        0.0082999997779726 AS cost,
        '2024-05-29 14:12:00 UTC' AS created_at,
        null AS sold_at
    ),
    STRUCT(
        395725 AS inventory_item_id,
        14235 AS product_id,
        1 AS distribution_center_id,
        '8425BC94A44E3D1BB3C8C026B2702C00' AS product_sku,
        'Accessories' AS product_category,
        'Indestructable Aluminum Aluma Wallet - RED' AS product_name,
        'marsal' AS product_brand,
        0.0199999995529651 AS product_retail_price,
        'Women' AS product_department,
        0.0082999997779726 AS cost,
        '2021-04-27 08:08:00 UTC' AS created_at,
        null AS sold_at
    ),
    STRUCT(
        14090 AS inventory_item_id,
        3355 AS product_id,
        1 AS distribution_center_id,
        'CA793D8B79C1B6665CF109D6077A8277' AS product_sku,
        'Dresses' AS product_category,
        'Funfash NEW Funfash Slimming Black Gray Long Maxi Cocktail Dress Plus Size Made in USA'
            AS product_name,
        'Funfash' AS product_brand,
        59.9900016784668 AS product_retail_price,
        'Women' AS product_department,
        25.075820565723177 AS cost,
        '2024-03-19 22:25:11 UTC' AS created_at,
        '2024-03-28 07:24:11 UTC' AS sold_at
    ),
    STRUCT(
        14091 AS inventory_item_id,
        3355 AS product_id,
        1 AS distribution_center_id,
        'CA793D8B79C1B6665CF109D6077A8277' AS product_sku,
        'Dresses' AS product_category,
        'Funfash NEW Funfash Slimming Black Gray Long Maxi Cocktail Dress Plus Size Made in USA'
            AS product_name,
        'Funfash' AS product_brand,
        59.9900016784668 AS product_retail_price,
        'Women' AS product_department,
        25.075820565723177 AS cost,
        '2023-03-21 10:26:00 UTC' AS created_at,
        null AS sold_at
    ),
    STRUCT(
        17093 AS inventory_item_id,
        11693 AS product_id,
        6 AS distribution_center_id,
        'D880E783834172E5EBD1868D84463D93' AS product_sku,
        'Intimates' AS product_category,
        "Hanro Women's Moments Wide Lace Spaghetti Camisole" AS product_name,
        'Hanro' AS product_brand,
        88.0 AS product_retail_price,
        'Women' AS product_department,
        48.92799998819828 AS cost,
        '2024-10-09 12:35:44 UTC' AS created_at,
        '2024-10-30 13:14:44 UTC' AS sold_at
    ),
    STRUCT(
        477079 AS inventory_item_id,
        11693 AS product_id,
        6 AS distribution_center_id,
        'D880E783834172E5EBD1868D84463D93' AS product_sku,
        'Intimates' AS product_category,
        "Hanro Women's Moments Wide Lace Spaghetti Camisole" AS product_name,
        'Hanro' AS product_brand,
        88.0 AS product_retail_price,
        'Women' AS product_department,
        48.92799998819828 AS cost,
        '2021-11-01 02:17:01 UTC' AS created_at,
        '2021-11-01 10:20:01 UTC' AS sold_at
    )
]) AS mock_data
