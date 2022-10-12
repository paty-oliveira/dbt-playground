{{
  config(
    unique_key = "id"
    )
}}

{% set source_name = ref("sales_people") %}

{% set composite_key = ["name", "country"] %}

SELECT
    {{ dbt_utils.surrogate_key(composite_key) }} AS id,
    name::TEXT AS lead_sales_name,
    CASE
        WHEN country = 'UK'
            THEN 'United Kingdom'
        WHEN country = 'HongKong'
            THEN 'Hong Kong'
        ELSE country::TEXT
    END AS country,
    CURRENT_TIMESTAMP AS ingested_at
FROM
    {{ source_name }}
