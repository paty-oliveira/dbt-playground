{% set source = ref('stg_profile') %}

SELECT * FROM {{ source }}
