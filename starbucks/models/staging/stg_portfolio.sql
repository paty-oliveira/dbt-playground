SELECT
    id AS offer_id,
    reward,
    duration,
    difficulty AS difficulty_rank,
    offer_type,
    channels
FROM {{ ref('portfolio') }}