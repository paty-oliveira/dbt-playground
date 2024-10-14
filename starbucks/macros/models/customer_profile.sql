{% macro customer_profile_by_transaction_type(transaction_type, surrogate_key_columns, surrogate_key_name) %}

    WITH customers_by_received_offer AS (
        SELECT
            transaction_id,
            customer_id,
            offer_id,
            gender,
            age,
            income,
            transaction_type,
            customer_subscribed_date AS subscribed_date
        FROM {{ ref('fact_customer_journey') }}
    ),

    final AS (
        SELECT
            {{ dbt_utils.generate_surrogate_key(surrogate_key_columns) }} AS {{ surrogate_key_name }},
            customer_id,
            offer_id,
            gender,
            age,
            income,
            subscribed_date,
            CURRENT_TIMESTAMP AS ingested_at
        FROM customers_by_received_offer
        WHERE transaction_type = '{{ transaction_type }}'
    )

    SELECT * FROM final

{% endmacro %}
