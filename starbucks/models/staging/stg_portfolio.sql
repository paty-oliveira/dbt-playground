SELECT
    id AS offer_id,
    reward,
    duration,
    difficulty AS difficulty_rank,
    offer_type,
    channels,
    CURRENT_TIMESTAMP AS ingested_at
FROM {{ ref('portfolio') }}