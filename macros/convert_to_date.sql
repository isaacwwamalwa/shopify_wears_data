
{% macro convert_to_date(column_name) %}
    DATE({{ column_name }})
{% endmacro %}
