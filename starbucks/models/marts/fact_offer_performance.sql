{% set offers = ref('dim_offer') %}
{% set transactions = ref('stg_transcript') %}
{% set surrogate_key_columns = [
    'transactions.offer_id',
    'transactions.transaction_id',
    'offers.channel'
    ]
%}

WITH offers AS (
    SELECT
        offer_id,
        offer_type,
        channel,
        difficulty_rank,
        duration
    FROM {{ offers }}
),

offer_transactions AS (
    SELECT
        transaction_id,
        offer_id,
        transaction_type,
        reward,
        hours_since_start,
        days_since_start
    FROM {{ transactions }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(surrogate_key_columns) }} AS offer_performance_key,
        transactions.offer_id,
        transactions.transaction_id,
        offers.offer_type,
        offers.channel AS offer_channel,
        offers.difficulty_rank AS offer_difficulty_rank,
        offers.duration AS offer_duration,
        transactions.reward AS offer_reward,
        {{ format_transaction_type('transactions.transaction_type') }} AS offer_status,
        transactions.hours_since_start,
        transactions.days_since_start,
        CURRENT_TIMESTAMP AS ingested_at
    FROM offer_transactions AS transactions
        INNER JOIN offers
            ON transactions.offer_id = offers.offer_id
)

SELECT * FROM final
