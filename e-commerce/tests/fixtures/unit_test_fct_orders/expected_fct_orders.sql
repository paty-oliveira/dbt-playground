SELECT *
FROM UNNEST([
    STRUCT(
        123 AS order_id,
        100 AS user_id,
        'Complete' AS status,
        2 AS total_quantity,
        25.99 AS total_order_value,
        '2024-11-19 14:10:28.485066 UTC' AS created_at,
        '2024-11-21 10:04:28.485066 UTC' AS shipped_at,
        '2024-11-24 09:16:28.485066 UTC' AS delivered_at,
        null AS returned_at,
        CURRENT_TIMESTAMP AS ingested_at
    )
]) AS expected_data
