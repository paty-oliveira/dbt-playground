{{
  config(
    materialized = 'table',
    )
}}

{{ layoffs_aggregator('country') }}
