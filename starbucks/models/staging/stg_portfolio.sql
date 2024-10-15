{% set source = ref('portfolio') %}

WITH transformed_portfolio AS (
    SELECT
        id AS offer_id,
        reward,
        duration,
        difficulty AS difficulty_rank,
        offer_type,
        REPLACE(REPLACE(REPLACE(channels, '''', ''), '[', '{'), ']', '}')::text [] AS channels,
        CURRENT_TIMESTAMP AS ingested_at
    FROM {{ source }}
)

SELECT * FROM transformed_portfolio
