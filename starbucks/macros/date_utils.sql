{% macro get_days_from_hours(hour) %}
    CASE
        WHEN {{ hour }} < 24 THEN 0
        ELSE {{ hour }} / 24
    END
{% endmacro %}