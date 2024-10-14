{% set surrogate_columns = ['transaction_id', 'customer_id', 'offer_id', 'transaction_type'] %}

{{
    customer_profile_by_transaction_type(
        'viewed',
        surrogate_columns,
        'customer_profile_viewed_offer_key'
    )
}}
