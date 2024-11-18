{{
    config(
        materialized = "view"
    )
}}

SELECT
    order_id,
    user_id,
    status,
    gender,
    num_of_item,
    created_at,
    shipped_at,
    delivered_at,
    returned_at,
    CURRENT_TIMESTAMP AS ingested_at
FROM {{ source("the-look-e-commerce", "orders") }}
