{% macro convert_unix_nano_to_timestamp(input_unix, column_name) %}
    TO_TIMESTAMP((CAST({{ input_unix}} AS DECIMAL) / 1000000000)) AS {{ column_name }}
{% endmacro %}
