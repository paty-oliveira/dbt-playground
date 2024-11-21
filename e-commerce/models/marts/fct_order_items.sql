{{
    config(
        materialized = 'view'
    )
}}

SELECT 1 AS first_column
UNION ALL
SELECT 2 AS first_column