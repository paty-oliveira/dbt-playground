{{ 
    config(
        materialized = "view"
    )
}}

SELECT
    id AS event_id,
    session_id,
    user_id,
    sequence_number AS event_sequence_number,
    event_type,
    ip_address,
    browser,
    traffic_source,
    uri,
    city,
    state,
    postal_code,
    created_at,
    CURRENT_TIMESTAMP AS ingested_at
FROM {{ source("the-look-e-commerce", "events") }}
