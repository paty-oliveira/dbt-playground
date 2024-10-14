{% set source = ref('fact_offer_performance') %}
{% set surrogate_column = ['channel'] %}

WITH completed_offers AS (
    SELECT
        transaction_id,
        offer_channel AS channel
    FROM {{ source }}
    WHERE
        offer_status = 'completed'
),

completed_offer_agg_channel AS (
    SELECT
        channel,
        COUNT(DISTINCT transaction_id) AS total_completed_transactions
    FROM completed_offers
    GROUP BY 1
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(surrogate_column)}} AS completed_offer_agg_channel_key,
        *,
        CURRENT_TIMESTAMP AS ingested_at
    FROM completed_offer_agg_channel
)

SELECT * FROM final
