SELECT *
FROM UNNEST([
    STRUCT(
        3355 AS product_id,
        1 AS distribution_center_id,
        'CA793D8B79C1B6665CF109D6077A8277' AS product_sku,
        'Dresses' AS product_category,
        'Women' AS product_department,
        'Funfash NEW Funfash Slimming Black Gray Long Maxi Cocktail Dress Plus Size Made in USA'
            AS product_name,
        'Funfash' AS product_brand,
        59.9900016784668 AS product_retail_price,
        25.075820565723177 AS cost
    ),
    STRUCT(
        14235 AS product_id,
        1 AS distribution_center_id,
        '8425BC94A44E3D1BB3C8C026B2702C00' AS product_sku,
        'Accessories' AS product_category,
        'Women' AS product_department,
        'Indestructable Aluminum Aluma Wallet - RED' AS product_name,
        'marshal' AS product_brand,
        0.0199999995529651 AS product_retail_price,
        0.0082999997779726 AS cost
    ),
    STRUCT(
        11693 AS product_id,
        6 AS distribution_center_id,
        'D880E783834172E5EBD1868D84463D93' AS product_sku,
        'Intimates' AS product_category,
        'Women' AS product_department,
        "Hanro Women's Moments Wide Lace Spaghetti Camisole" AS product_name,
        'Hanro' AS product_brand,
        88.0 AS product_retail_price,
        48.92799998819828 AS cost
    )
]) AS mock_data
