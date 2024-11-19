{{
    config(
        materialized = 'table'
    )
}}

SELECT
    event_id AS website_event_id,
    session_id,
    user_id,
    event_sequence_number,
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
FROM {{ ref("stg_events") }}
