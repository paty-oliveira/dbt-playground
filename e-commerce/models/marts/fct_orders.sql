{{
    config(
        materialized='table'
    )
}}

WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),

orders_enriched AS (
    SELECT
        orders.order_id,
        orders.user_id,
        orders.status,
        orders.num_of_item AS total_quantity,
        orders.created_at,
        order_items.shipped_at,
        order_items.delivered_at,
        order_items.returned_at,
        ROUND(SUM(order_items.sale_price), 2) AS total_order_value
    FROM orders
    INNER JOIN order_items
        ON orders.order_id = order_items.order_id
    {{ dbt_utils.group_by(n=8) }}
)

SELECT
    *,
    CURRENT_TIMESTAMP AS ingested_at
FROM orders_enriched
