{% set source = ref('fact_customer_journey') %}

{% set offer_status = 'received' %}

{% set surrogate_key_columns = ['transaction_id', 'customer_id', 'offer_id', 'transaction_type'] %}

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
    FROM {{ source }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(surrogate_key_columns) }} AS customer_profile_received_offer_key,
        customer_id,
        offer_id,
        gender,
        age,
        income,
        subscribed_date,
        CURRENT_TIMESTAMP AS ingested_at
    FROM customers_by_received_offer
    WHERE transaction_type = '{{ offer_status }}'
)

SELECT * FROM final
