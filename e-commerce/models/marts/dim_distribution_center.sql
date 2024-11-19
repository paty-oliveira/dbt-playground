{{
    config(
        materialized = 'table'
    )
}}

SELECT
    * EXCEPT (ingested_at),
    CURRENT_TIMESTAMP AS ingested_at
FROM {{ ref("stg_distribution_centers") }}
