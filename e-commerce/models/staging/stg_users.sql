{{ 
    config(
        materialized = "view"
    )
}}

SELECT
    id AS user_id,
    first_name,
    last_name,
    age,
    gender,
    traffic_source,
{{ mask_column(column_name='email', method= 'partial') }} AS email_address,
    country,
    state,
    city,
    street_address,
    postal_code,
    latitude,
    longitude,
    user_geom AS localization_point,
    created_at,
    CURRENT_TIMESTAMP AS ingested_at
FROM {{ source("the-look-e-commerce", "users") }}
