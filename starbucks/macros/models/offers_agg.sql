{% macro completed_offers_agg_by(agg_column, new_column_name, surrogate_column_name) %}

    with
        completed_offers as (
            select transaction_id, {{ agg_column }} as {{ new_column_name }}
            from {{ ref("fact_offer_transactions") }}
            where offer_status = 'completed'
        ),

        completed_offer_agg as (
            select
                {{ new_column_name }},
                count(distinct transaction_id) as total_completed_transactions
            from completed_offers
            group by 1
        ),

        final as (
            select
                {{ dbt_utils.generate_surrogate_key([new_column_name]) }}
                as {{ surrogate_column_name }},
                *,
                current_timestamp as ingested_at
            from completed_offer_agg
        )

    select *
    from final

{% endmacro %}
