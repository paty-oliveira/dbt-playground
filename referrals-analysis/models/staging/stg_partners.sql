{{
  config(
    unique_key = "id",
    )
}}

{% set source_name = ref("partners") %}

SELECT
    id::INTEGER,
    CASE
        WHEN partner_type = 'IFA'
            THEN 'Independent Financial Adviser'
        WHEN partner_type = 'Management company'
            THEN 'Management Company'
        ELSE partner_type::TEXT
    END partner_type,
    lead_sales_contact::TEXT AS lead_sales_name,
    {{ convert_unix_nano_to_timestamp('created_at', 'created_at') }},
    {{ convert_unix_nano_to_timestamp('updated_at', 'updated_at') }},
    CURRENT_TIMESTAMP AS ingested_at
FROM
    {{ source_name }}
