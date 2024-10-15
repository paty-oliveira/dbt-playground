{% set customers = ref('dim_customer') %}
{% set transactions = ref('stg_transcript') %}
{% set surrogate_key_columns = [
    'transactions.transaction_id',
    'transactions.customer_id',
    'transactions.offer_id'
    ]
%}

WITH customers AS (
    SELECT
        customer_id,
        gender,
        age,
        income,
        subscribed_date
    FROM {{ customers }}
),

transactions AS (
    SELECT
        transaction_id,
        customer_id,
        offer_id,
        transaction_type
    FROM {{ transactions }}
),

final AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key(surrogate_key_columns) }} AS customer_journey_key,
        transactions.transaction_id,
        transactions.customer_id,
        transactions.offer_id,
        customers.gender,
        customers.age,
        customers.income,
        {{ format_transaction_type('transactions.transaction_type') }} AS transaction_type,
        customers.subscribed_date AS customer_subscribed_date,
        CURRENT_TIMESTAMP AS ingested_at
    FROM transactions
        INNER JOIN customers
            ON transactions.customer_id = customers.customer_id
)

SELECT * FROM final
