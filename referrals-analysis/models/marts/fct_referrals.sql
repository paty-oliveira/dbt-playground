{{
  config(
    unique_key = "referral_id",
    tags = ["fact", "referrals"]
    )
}}

{% set dim_partners = ref("dim_partners") %}

{% set stg_referrals = ref("stg_referrals") %}

WITH partners AS (
    SELECT
        partner_id,
        lead_sales_name,
        partner_type,
        country
    FROM
        {{ dim_partners }}
),

referrals AS (
    SELECT
        id,
        company_id,
        partner_id,
        consultant_id,
        status,
        is_outbound,
        created_at,
        updated_at,
        ingested_at
    FROM
        {{ stg_referrals }}
)

SELECT
    referrals.id AS referral_id,
    referrals.company_id,
    referrals.partner_id,
    referrals.consultant_id,
    partners.lead_sales_name,
    partners.partner_type,
    partners.country AS partner_country,
    referrals.status,
    referrals.is_outbound,
    referrals.created_at,
    referrals.updated_at,
    CURRENT_TIMESTAMP AS ingested_at
FROM referrals
LEFT JOIN partners
    ON referrals.partner_id = partners.partner_id
