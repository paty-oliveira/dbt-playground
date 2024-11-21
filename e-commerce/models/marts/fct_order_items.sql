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

inventory_items AS (
    SELECT * FROM {{ ref('stg_inventory_items') }}
),

inventory_products AS (
    SELECT
        product.product_id,
        product.product_sku,
        product.product_category,
        product.product_department,
        product.product_name,
        product.product_brand,
        product.cost AS product_cost,
        COUNTIF(inventory.sold_at IS NULL) AS total_inventory_items
    FROM products_information AS product
    LEFT JOIN inventory_items AS inventory
        ON product.product_id = inventory.product_id
    {{ dbt_utils.group_by(n=7) }}
),

order_items_enriched AS (
    SELECT
        items.order_item_id,
        items.order_id,
        items.user_id,
        items.product_id,
        items.inventory_item_id,
        items.status,
        products.product_sku,
        products.product_category,
        products.product_department,
        products.product_name,
        products.product_brand,
        products.total_inventory_items,
        items.created_at,
        items.shipped_at,
        items.delivered_at,
        items.returned_at,
        ROUND(items.sale_price, 2) AS product_sale_price,
        ROUND(products.product_cost, 2) AS product_cost
    FROM order_items AS items
    LEFT JOIN inventory_products AS products
        ON items.product_id = products.product_id
)

SELECT
    *,
    CURRENT_TIMESTAMP AS ingested_at
FROM order_items_enriched
