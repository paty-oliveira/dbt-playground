{% set surrogate_key_columns = ['year_number', 'month_of_year','day_of_month'] %}

WITH date_spine AS (
    {{
        dbt_date.get_date_dimension("2000-01-01", "2100-12-31")
    }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(surrogate_key_columns) }} AS date_key,
        *,
        CURRENT_TIMESTAMP AS ingested_at
    FROM date_spine
)

SELECT * FROM final
