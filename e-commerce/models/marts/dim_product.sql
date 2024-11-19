{{
    config(
        materialized = 'table'
    )
}}


SELECT
    * EXCEPT (ingested_at),
    CURRENT_TIMESTAMP AS ingested_ad
FROM {{ ref("stg_products") }}
