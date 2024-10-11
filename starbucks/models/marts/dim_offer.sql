{% set source = ref('stg_portfolio') %}
{% set surrogate_key_columns = ['offer_id', 'channel'] %}

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
        {{ dbt_utils.generate_surrogate_key(surrogate_key_columns)}} AS offer_channel_key,
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
