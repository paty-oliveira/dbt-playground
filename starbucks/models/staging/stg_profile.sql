{% set source = ref('profile') %}

WITH filtered_customers AS (
    SELECT *
    FROM {{ source }}
    WHERE age != 118
    -- it seems that 118 is a placeholder for missing values, so it will be ignored
),

final AS (
    SELECT
        id AS customer_id,
        COALESCE(gender, 'N/A') AS gender,
        age,
        COALESCE(income, 0) AS income,
        TO_DATE(became_member_on::TEXT, 'YYYYMMDD') AS subscribed_date,
        CURRENT_TIMESTAMP AS ingested_at
    FROM filtered_customers
)

SELECT * FROM final
