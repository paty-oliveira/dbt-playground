SELECT
    a AS transaction_id,
    person AS customer_id,
    event AS transaction_type,
    value AS transaction_value,
    time AS hours_since_start,
    {{ get_days_from_hours('time') }} AS days_since_start,
    CURRENT_TIMESTAMP AS ingested_at
FROM {{ ref('transcript') }}