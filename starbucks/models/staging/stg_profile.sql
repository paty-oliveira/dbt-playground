WITH filtered_customers AS (
    SELECT *
    FROM {{ ref('profile') }}
    WHERE age != 118
    -- it seems that 118 is a placeholder for missing values, so it will be ignored
)

SELECT
    id AS customer_id,
    COALESCE(gender, 'N/A') AS customer_gender,
    age AS customer_age,
    COALESCE(income, 0) AS customer_income,
    TO_DATE(became_member_on::TEXT, 'YYYYMMDD') AS subscribed_date
FROM filtered_customers
