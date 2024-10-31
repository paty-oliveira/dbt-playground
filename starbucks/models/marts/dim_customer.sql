{% set source = ref('stg_profile') %}

select * from {{ source }}
