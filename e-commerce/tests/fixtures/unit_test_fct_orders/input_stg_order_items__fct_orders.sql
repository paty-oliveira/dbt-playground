SELECT *
FROM UNNEST([
    STRUCT(
        166 AS order_item_id,
        123 AS order_id,
        100 AS user_id,
        15664 AS product_id,
        451 AS inventory_item_id,
        'Complete' AS status,
        10.989999771118164 AS sale_price,
        '2024-11-23 13:45:36.485066 UTC' AS created_at,
        '2024-11-21 10:04:28.485066 UTC' AS shipped_at,
        '2024-11-24 09:16:28.485066 UTC' AS delivered_at,
        null AS returned_at
    ),
    STRUCT(
        165 AS order_item_id,
        123 AS order_id,
        100 AS user_id,
        11394 AS product_id,
        449 AS inventory_item_id,
        'Complete' AS status,
        15.0 AS sale_price,
        '2024-11-20 14:01:41.485066 UTC' AS created_at,
        '2024-11-21 10:04:28.485066 UTC' AS shipped_at,
        '2024-11-24 09:16:28.485066 UTC' AS delivered_at,
        null AS returned_at
    )
]) AS mock_data
