WITH cleaned_transcript AS (
    SELECT
        a AS transaction_id,
        person AS customer_id,
        event AS transaction_type,
        REPLACE(value, '''', '"')::JSON AS transaction_value,
        time AS hours_since_start,
        {{ get_days_from_hours('time') }} AS days_since_start,
        CURRENT_TIMESTAMP AS ingested_at
    FROM {{ ref('transcript') }}
),

unnest_offer_received AS (
    SELECT *,
        transaction_value ->> 'offer id' AS offer_id,
        transaction_value ->> 'reward' AS reward,
        NULL AS amount
    FROM cleaned_transcript
    WHERE transaction_type = 'offer received'
),

unnest_offer_viewed AS (
    SELECT *,
        transaction_value ->> 'offer id' AS offer_id,
        NULL AS reward,
        NULL AS amount
    FROM cleaned_transcript
    WHERE transaction_type = 'offer viewed'
),

unnest_offer_completed AS (
    SELECT *,
        transaction_value ->> 'offer_id' AS offer_id,
        transaction_value ->> 'reward' AS reward,
        NULL AS amount
    FROM cleaned_transcript
    WHERE transaction_type = 'offer completed'
),

unnest_transaction AS (
    SELECT *,
        NULL AS offer_id,
        NULL AS reward,
        transaction_value ->> 'amount' AS amount
    FROM cleaned_transcript
),

all_transactions AS (
    SELECT * FROM unnest_offer_received
    UNION ALL
    SELECT * FROM unnest_offer_viewed
    UNION ALL
    SELECT * FROM unnest_offer_completed
    UNION ALL
    SELECT * FROM unnest_transaction
),

final AS (
    SELECT
        transaction_id,
        customer_id,
        offer_id,
        transaction_type,
        reward::INT,
        amount::INT,
        hours_since_start,
        days_since_start,
        ingested_at
    FROM all_transactions
)

SELECT * FROM final
