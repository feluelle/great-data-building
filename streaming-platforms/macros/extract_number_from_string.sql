{% macro extract_number_from_string(column) %}
    regexp_replace({{ column }}, '\D', '', 'g')
{% endmacro %}