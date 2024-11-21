{{
    config(
        materialized = 'table'
    )
}}

WITH order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),

products_information AS (
    SELECT * FROM {{ ref('dim_product') }}
),

order_items_enriched AS (
    SELECT
        items.order_item_id,
        items.order_id,
        items.user_id,
        items.product_id,
        items.status,
        ROUND(items.sale_price, 2) AS product_sale_price,
        products.product_sku,
        products.product_category,
        products.product_department,
        products.product_name,
        products.product_brand,
        ROUND(products.cost, 2) AS product_cost,
        items.created_at,
        items.shipped_at,
        items.delivered_at,
        items.returned_at
    FROM order_items AS items
    LEFT JOIN products_information AS products
        ON items.product_id = products.product_id
)

SELECT 
    *,
    CURRENT_TIMESTAMP AS ingested_at    
FROM order_items_enriched
