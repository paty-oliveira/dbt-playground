{% macro mask_column(column_name, method='hash', partial_visible_chars=2) %}
    {%- if method == 'hash' -%}
        FARM_FINGERPRINT(column_name)
    {%- elif method == 'partial' -%}
        CONCAT(
            SUBSTR({{ column_name }}, 1, {{ partial_visible_chars }}),
            REPEAT('*', LENGTH({{ column_name }}) - ({{ partial_visible_chars }} * 2)),
            SUBSTR({{ column_name }}, -{{ partial_visible_chars }})
        )
    {%- elif method == 'nullify' -%}
        NULL
    {%- else -%}
        {{ exceptions.raise_compiler_error("Invalid masking method specified!") }}
    {%- endif %}
{% endmacro %}
