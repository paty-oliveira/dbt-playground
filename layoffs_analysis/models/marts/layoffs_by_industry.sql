{{
  config(
    materialized = 'table',
    )
}}

{{ layoffs_aggregator('industry') }}
