{% set surrogate_columns = ['transaction_id', 'customer_id', 'offer_id', 'transaction_type'] %}

{{
    customer_profile_by_transaction_type(
        'transaction',
        surrogate_columns,
        'customer_profile_completed_transaction_key'
    )
}}
