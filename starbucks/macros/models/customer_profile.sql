{% macro customer_profile_by_transaction_type(transaction_type, surrogate_key_columns, surrogate_key_name) %}

    with
        customers_by_received_offer as (
            select
                transaction_id,
                customer_id,
                offer_id,
                gender,
                age,
                income,
                transaction_type,
                customer_subscribed_date as subscribed_date
            from {{ ref('fact_customer_transactions') }}
        ),

        final as (
            select
                {{ dbt_utils.generate_surrogate_key(surrogate_key_columns) }}
                as {{ surrogate_key_name }},
                customer_id,
                offer_id,
                gender,
                age,
                income,
                subscribed_date,
                current_timestamp as ingested_at
            from customers_by_received_offer
            where transaction_type = '{{ transaction_type }}'
        )

    select *
    from final

{% endmacro %}
