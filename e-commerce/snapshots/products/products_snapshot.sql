{% snapshot products_snapshot %}
    {{
        config(
            unique_key='id',
            strategy='check',
            check_cols=['retail_price', 'cost']
        )
    }}

    select *,
        CURRENT_TIMESTAMP AS ingested_at
     from {{ source('the-look-e-commerce', 'products') }}

 {% endsnapshot %}