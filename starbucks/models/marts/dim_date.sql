{% set surrogate_key_columns = ['year_number', 'month_of_year','day_of_month'] %}

with
    date_spine as ({{ dbt_date.get_date_dimension("2000-01-01", "2100-12-31") }}),

    final as (
        select
            {{ dbt_utils.generate_surrogate_key(surrogate_key_columns) }} as date_key,
            *,
            current_timestamp as ingested_at
        from date_spine
    )

select *
from final
