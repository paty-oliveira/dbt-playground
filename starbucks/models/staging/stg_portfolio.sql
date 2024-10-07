SELECT 
    id AS portfolio_id,
    reward,
    duration AS duration_rank,
    difficulty AS difficulty_rank,
    offer_type,
    channels
FROM {{ ref('portfolio') }}