{% macro oracle_normalize_string(column_name) %}
    TRIM(INITCAP(LOWER(NVL({{ column_name }}, 'N/A'))))
{% endmacro %}