{% macro layoffs_aggregator(aggregate_by, column_name=aggregate_by) %}

    SELECT
        {{ aggregate_by }} AS  {{ column_name }},
        SUM(total_laid_off) AS total_laid_off,
        MIN(laid_off_at) AS layoff_started_at,
        MAX(laid_off_at) AS layoff_updated_at
    FROM
        {{ ref('stg_layoffs') }}
    GROUP BY
        {{ aggregate_by }}

{% endmacro %}