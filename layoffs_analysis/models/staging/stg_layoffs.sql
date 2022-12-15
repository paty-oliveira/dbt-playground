{{
  config(
    materialized = 'view',
    )
}}

{% set source_tbl = ref("layoffs")%}

WITH transformed_layoffs AS (
    SELECT
        company,
        CASE
            WHEN location = 'SF Bay Area' THEN 'San Francisco'
            ELSE location
        END AS location,
        IFNULL(industry, 'Unknown') AS industry,
        IFNULL(total_laid_off, 0) AS total_laid_off,
        IFNULL(percentage, 0) AS percentage,
        date,
        IFNULL(funds_raised, 0) AS funds_raised,
        IFNULL(stage, 'Unknown') AS stage,
        country
    FROM
        {{ source_tbl }}
)

SELECT
    ROW_NUMBER() OVER() AS id,
    CAST(company AS STRING) AS company_name,
    CAST(industry AS STRING) AS industry,
    CAST(total_laid_off AS NUMERIC) AS total_laid_off,
    CAST(percentage AS FLOAT64) AS percentage_laid_off,
    CAST(funds_raised AS FLOAT64) AS funds_raised,
    CAST(stage AS STRING) AS stage,
    CAST(location AS STRING) AS location,
    CAST(country AS STRING) AS country,
    CAST(date AS DATE) AS laid_off_at,
    CURRENT_TIMESTAMP() AS ingested_at
FROM
    transformed_layoffs
