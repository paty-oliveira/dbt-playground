{{
    config(
        materialized = 'table'
    )
}}

WITH inventory_items AS (
    SELECT * FROM {{ ref('stg_inventory_items') }}
),

inventory_enriched AS (
    SELECT
        product_id,
        distribution_center_id,
        product_sku,
        product_category,
        product_name,
        product_brand,
        product_department,
        ROUND(product_retail_price, 2) AS product_sale_price,
        ROUND(cost, 2) AS product_cost,
        COUNTIF(sold_at IS NULL) AS total_products_available,
        MIN(created_at) AS created_at,
        CASE
            WHEN COUNTIF(sold_at IS NULL) > 0
                THEN NULL
            ELSE MAX(sold_at)
        END AS sold_at
    FROM inventory_items
    {{ dbt_utils.group_by(n=9) }}
),

final AS (
    SELECT
        *,
        COALESCE(sold_at IS NULL, FALSE) AS is_product_available,
        CURRENT_TIMESTAMP AS ingested_at
    FROM inventory_enriched
)

SELECT * FROM final
