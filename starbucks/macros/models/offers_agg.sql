{% macro completed_offers_agg_by(agg_column, new_column_name, surrogate_column_name) %}

    WITH completed_offers AS (
        SELECT
            transaction_id,
            {{ agg_column }} AS {{ new_column_name }}
        FROM {{ ref("fact_offer_performance")}}
        WHERE
            offer_status = 'completed'
    ),

    completed_offer_agg AS (
        SELECT
            {{ new_column_name }},
            COUNT(DISTINCT transaction_id) AS total_completed_transactions
        FROM completed_offers
        GROUP BY 1
    ),

    final AS (
        SELECT
            {{ dbt_utils.generate_surrogate_key([new_column_name])}} AS {{ surrogate_column_name }},
            *,
            CURRENT_TIMESTAMP AS ingested_at
        FROM completed_offer_agg
    )

    SELECT * FROM final

{% endmacro %}
