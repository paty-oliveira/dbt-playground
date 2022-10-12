{{
  config(
    unique_key = "partner_id",
    tags = ["dimension", "partners", "referrals"]
    )
}}

{% set stg_sales_people = ref("stg_sales_people") %}

{% set stg_partners = ref("stg_partners") %}

WITH sales_people AS (
    SELECT
        lead_sales_name,
        country
    FROM
        {{ stg_sales_people}}
),

partners AS (
    SELECT
        id,
        lead_sales_name,
        partner_type,
        created_at,
        updated_at
    FROM
     {{ stg_partners }}
)

SELECT
    partners.id AS partner_id,
    partners.lead_sales_name,
    partners.partner_type,
    sales_people.country,
    partners.created_at,
    partners.updated_at,
    CURRENT_TIMESTAMP AS ingested_at
FROM partners
LEFT JOIN sales_people
    ON partners.lead_sales_name = sales_people.lead_sales_name
