{% set surrogate_columns = ['transaction_id', 'customer_id', 'offer_id', 'transaction_type'] %}

{{
    customer_profile_by_transaction_type(
        'received',
        surrogate_columns,
        'customer_profile_received_offer_key'
    )
}}
