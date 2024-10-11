{% set source = ref('stg_portfolio') %}

WITH unnested_channels AS (
    SELECT
        offer_id,
        offer_type,
        UNNEST(channels) AS channel,
        difficulty_rank,
        reward,
        duration,
        ingested_at
    FROM {{ source }}
),

final AS (
    SELECT
        CONCAT(offer_id, '_', channel) AS offer_channel_key,
        offer_id,
        offer_type,
        channel,
        difficulty_rank,
        reward,
        duration,
        ingested_at
    FROM unnested_channels
)

SELECT * FROM final
