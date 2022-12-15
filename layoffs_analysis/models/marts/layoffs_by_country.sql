{{
  config(
    materialized = 'table',
    )
}}

{% set stg_layoffs = ref('stg_layoffs') %}

SELECT
    country,
    SUM(total_laid_off) AS total_laid_off,
    MIN(laid_off_at) AS layoff_started_at,
    MAX(laid_off_at) AS layoff_updated_at
FROM
    {{ stg_layoffs }}
GROUP BY
    country
