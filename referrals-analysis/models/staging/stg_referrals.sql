{{
  config(
    unique_key = "id"
    )
}}

{% set source_name = ref("referrals") %}

SELECT
    id::INTEGER,
    company_id::INTEGER,
    partner_id::INTEGER,
    consultant_id::INTEGER,
    status::TEXT,
    is_outbound::BOOLEAN,
    {{ convert_unix_nano_to_timestamp('created_at', 'created_at') }},
    {{ convert_unix_nano_to_timestamp('updated_at', 'updated_at') }},
    CURRENT_TIMESTAMP AS ingested_at
FROM
    {{ source_name }}
