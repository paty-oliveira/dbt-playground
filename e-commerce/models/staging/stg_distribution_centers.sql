{{
    config(
        materialized="view"
    )
}}

SELECT
    id AS distribution_center_id,
    name,
    latitude,
    longitude,
    distribution_center_geom AS localization_point,
    CURRENT_TIMESTAMP AS ingested_at
FROM {{ source("the-look-e-commerce", "distribution_centers") }}
