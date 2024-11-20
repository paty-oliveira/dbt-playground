{{
    config(
        materialized = 'table'
    )
}}

SELECT
    user_id,
    first_name,
    last_name,
    age,
    gender,
    traffic_source,
    email_address,
    country,
    state,
    street_address,
    postal_code,
    latitude,
    longitude,
    localization_point,
    created_at AS user_created_at,
    NULLIF(city, 'null') AS city,
    CURRENT_TIMESTAMP AS ingested_ad
FROM {{ ref("stg_users") }}
