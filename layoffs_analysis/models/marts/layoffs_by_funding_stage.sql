{{
  config(
    materialized = 'table',
    )
}}


{{ layoffs_aggregator('stage', 'funding_stage') }}
