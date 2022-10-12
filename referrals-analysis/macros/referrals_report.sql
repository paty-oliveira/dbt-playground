{% macro referrals_report(referral_status, outbound_status) %}
    SELECT
        lead_sales_name,
        partner_country,
        partner_type,
        COUNT(*) OVER(PARTITION BY partner_id) AS total_referrals_by_partner,
        COUNT(*) OVER(PARTITION BY consultant_id) AS total_referrals_by_consultant,
        COUNT(*) OVER(PARTITION BY company_id) AS total_companies_referred,
        created_at,
        updated_at,
        CURRENT_TIMESTAMP AS ingested_at
    FROM {{ ref("fct_referrals") }}
    WHERE status = '{{ referral_status }}'
        AND is_outbound IS {{ outbound_status }}
{% endmacro %}
