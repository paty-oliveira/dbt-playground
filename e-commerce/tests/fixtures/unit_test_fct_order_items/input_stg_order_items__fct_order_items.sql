SELECT *
FROM UNNEST([
    STRUCT(
        146550 AS order_item_id,
        100912 AS order_id,
        80583 AS user_id,
        14235 AS product_id,
        395725 AS inventory_item_id,
        'Complete' AS status,
        0.0199999995529651 AS sale_price,
        '2023-05-18 01:20:46 UTC' AS created_at,
        '2023-05-16 00:21:00 UTC' AS shipped_at,
        '2023-05-18 05:22:00 UTC' AS delivered_at,
        null AS returned_at
    ),
    STRUCT(
        146548 AS order_item_id,
        100912 AS order_id,
        80583 AS user_id,
        3355 AS product_id,
        395720 AS inventory_item_id,
        'Complete' AS status,
        59.9900016784668 AS sale_price,
        '2023-05-16 01:13:11 UTC' AS created_at,
        '2023-05-16 00:21:00 UTC' AS shipped_at,
        '2023-05-18 05:22:00 UTC' AS delivered_at,
        null AS returned_at
    ),
    STRUCT(
        146549 AS order_item_id,
        100912 AS order_id,
        80583 AS user_id,
        11693 AS product_id,
        395723 AS inventory_item_id,
        'Complete' AS status,
        88.0 AS sale_price,
        '2023-05-15 00:05:07 UTC' AS created_at,
        '2023-05-16 00:21:00 UTC' AS shipped_at,
        '2023-05-18 05:22:00 UTC' AS delivered_at,
        null AS returned_at
    )
]) AS mock_data
